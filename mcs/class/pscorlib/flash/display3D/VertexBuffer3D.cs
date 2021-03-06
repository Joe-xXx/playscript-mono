// Copyright 2013 Zynga Inc.
//	
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//		
//      Unless required by applicable law or agreed to in writing, software
//      distributed under the License is distributed on an "AS IS" BASIS,
//      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//      See the License for the specific language governing permissions and
//      limitations under the License.

using System;
using flash.utils;
using _root;

#if PLATFORM_MONOMAC
using MonoMac.OpenGL;
#elif PLATFORM_MONOTOUCH
using OpenTK.Graphics.ES20;
#endif


namespace flash.display3D 
{

	public class VertexBuffer3D 
	{
		//
		// Methods
		//

#if OPENGL

		internal VertexBuffer3D(Context3D context3D, int numVertices, int dataPerVertex, int multiBufferCount, bool isDynamic)
		{
			if (multiBufferCount < 1)
				throw new ArgumentOutOfRangeException("multiBufferCount");

			mNumVertices = numVertices;
			mVertexSize = dataPerVertex;
			mIds = new uint[multiBufferCount];
			GL.GenBuffers(mIds.Length, mIds);

			#if PLATFORM_MONOMAC
			mUsage = isDynamic ? BufferUsageHint.DynamicDraw : BufferUsageHint.StaticDraw;
			#elif PLATFORM_MONOTOUCH
			mUsage = isDynamic ? BufferUsage.DynamicDraw : BufferUsage.StaticDraw;
			#endif
		}

		public void dispose() {
			GL.DeleteBuffers(mIds.Length, mIds);
		}
		
		public void uploadFromByteArray(ByteArray data, int byteArrayOffset, int startVertex, int numVertices) {
			throw new NotImplementedException();
		}

		public void uploadFromArray(float[] data, int startVertex, int numVertices) 
		{

			// swap to next buffer
			mBufferIndex++;
			if (mBufferIndex >= mIds.Length)
				mBufferIndex = 0;

			GL.BindBuffer(BufferTarget.ArrayBuffer, mIds[mBufferIndex]);
			
			int byteStart = startVertex * mVertexSize * sizeof(float);
			int byteCount = numVertices * mVertexSize * sizeof(float);
			if (byteStart == 0)
			{
				// upload whole array
				GL.BufferData<float>(BufferTarget.ArrayBuffer, 
				                     new IntPtr(byteCount), 
				                     data, 
				                     mUsage);
			} 
			else 
			{
				// upload whole array
				GL.BufferSubData<float>(BufferTarget.ArrayBuffer, 
				                        new IntPtr(byteStart), 
				                        new IntPtr(byteCount), 
				                        data);
			}
		}

		public void uploadFromVector(float[] data, int startVertex, int numVertices) 
		{
			uploadFromArray(data, startVertex, numVertices);
		}

		public void uploadFromVector(Vector<float> data, int startVertex, int numVertices) 
		{
			uploadFromArray(data._GetInnerArray(), startVertex, numVertices);
		}

		public void uploadFromVector(Vector<double> data, int startVertex, int numVertices) 
		{
			// allocate temporary buffer for conversion
			if (mData == null) {
				mData = new float[mNumVertices * mVertexSize];
			}

			// convert to floating point
			int count = numVertices * mVertexSize;
			var array = data._GetInnerArray();
			for (int i=0; i < count; i++)
			{
				mData[i] = (float)array[i];
			}

			uploadFromArray(mData, startVertex, numVertices);
		}
		
		public int stride { 
			get {return mVertexSize * sizeof(float);}
		}
		
		public uint id {
			get {return mIds[mBufferIndex];}
		}
		
		private readonly int		mNumVertices;
		private readonly int		mVertexSize; 		// size in floats
		private float[]				mData;
		private uint[]		 		mIds;
		private int 				mBufferIndex;		// buffer index for multibuffering

		#if PLATFORM_MONOMAC
		private BufferUsageHint     mUsage;
		#elif PLATFORM_MONOTOUCH
		private BufferUsage         mUsage;
		#endif

#else

		public VertexBuffer3D(Context3D context3D, int numVertices, int dataPerVertex, int multiBufferCount = 1)
		{
			throw new NotImplementedException();
		}
		
		public void dispose() 
		{
			throw new NotImplementedException();
		}
		
		public void uploadFromByteArray(ByteArray data, int byteArrayOffset, int startVertex, int numVertices) 
		{
			throw new NotImplementedException();
		}
		
		public void uploadFromVector(Vector<double> data, int startVertex, int numVertices) 
		{
			throw new NotImplementedException();
		}
		
		public int stride 
		{ 
			get {
				throw new NotImplementedException();
			}
		}
		
		public uint id 
		{
			get {
				throw new NotImplementedException();
			}
		}

#endif

	}
	
}

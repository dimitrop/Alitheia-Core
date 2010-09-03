/*
 * This file is part of the Alitheia system, developed by the SQO-OSS
 * consortium as part of the IST FP6 SQO-OSS project, number 033331.
 *
 * Copyright 2008 - 2010 - Organization for Free and Open Source Software,  
 *                Athens, Greece.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

package eu.sqooss.impl.service.tds.diff;

import eu.sqooss.service.tds.DiffChunk;

/**
 * A simple DTO holding information about a diff chunk 
 *
 */
public class DiffChunkImpl implements DiffChunk {

	private String chunk;
	private DiffOp diffOp;
	private String path;
	private int sourceLenght, sourceStartLine, targetLength, targetStartLine;

	public void setDiffOp(DiffOp getDiffOp) {
		this.diffOp = getDiffOp;
	}

	public void setChunk(String chunk) {
		this.chunk = chunk;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setSourceLenght(int sourceLenght) {
		this.sourceLenght = sourceLenght;
	}

	public void setSourceStartLine(int sourceStartLine) {
		this.sourceStartLine = sourceStartLine;
	}

	public void setTargetLength(int targetLength) {
		this.targetLength = targetLength;
	}

	public void setTargetStartLine(int targetStartLine) {
		this.targetStartLine = targetStartLine;
	}

	public String getChunk() {
		return chunk;
	}

	public String getPath() {
		return path;
	}

	public int getSourceLenght() {
		return sourceLenght;
	}

	public int getSourceStartLine() {
		return sourceStartLine;
	}

	public int getTargetLength() {
		return targetLength;
	}

	public int getTargetStartLine() {
		return targetStartLine;
	}

	public DiffOp getDiffOp() {
		return diffOp;
	}
	
	@Override
	public String toString() {
		return chunk;
	}
}
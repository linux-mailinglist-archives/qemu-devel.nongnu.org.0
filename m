Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DFE307C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 13:35:52 +0200 (CEST)
Received: from localhost ([::1]:39986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNbPC-0008PW-7l
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 07:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32840)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iNb3l-0004m2-Vz
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iNb3i-0001iK-TN
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:13:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35828)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iNb3i-0001hl-IA
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:13:38 -0400
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 993FF3B72D
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 11:13:37 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id m19so24599094qtm.13
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 04:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SwaeVyBi9oCLfIHFPnKpsbkBI/WeRYeiVUr/X6Ot1tA=;
 b=kxkHGVmEDNu0KNhlTV5WJK8Zq9FDaDEeolzDMD9AKE0kftkE7i50VO8c/7aQ4UUrbN
 TYEMAxgECMD5c48H8kfg+Vits5fYJ8ts29BBI1ofRf/Wv7yLNFjUrHsfsrIcI8u1+yFE
 NjajYImflMr6BTOKyGYTaNDMWwQA/IlAaca4FO/as9VSucudY02QKWlDPQ5GbTQbbszw
 ySO45p9QwIYQENOP0bsOXqtJvrVkvhpCnKUZEHBCxpGmYaBcaX5euTjHygr5FsskTSbR
 5vCV2mRYYozVK5q3t4SOJXIxIJZ5Egk0TKDbeGESttUQW6HH3aupEFqTEjLrzTQloYCv
 qUrw==
X-Gm-Message-State: APjAAAVJ/N1ndEhpUAE1DtUyra3Xi1M7StqgWr/FfO32xPNhL2Bqtn60
 u9v0qMRMqb35/iolE8OYCrl/qdwy/prCyCeMVKq5neBFEp+RB4mkJTAoog+6FCHliDr1uiv0ezl
 FbAJfSTLSKNsKs/Q=
X-Received: by 2002:a0c:fad0:: with SMTP id p16mr4147895qvo.180.1571915616675; 
 Thu, 24 Oct 2019 04:13:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeEBt1m3lMUWVkAzkYytjo7qX30ECVK/UQ1EwtS13UjgtgUFnkqAC6xHpDM+H9EvyMuStaMw==
X-Received: by 2002:a0c:fad0:: with SMTP id p16mr4147861qvo.180.1571915616227; 
 Thu, 24 Oct 2019 04:13:36 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 o2sm9133954qte.79.2019.10.24.04.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 04:13:35 -0700 (PDT)
Date: Thu, 24 Oct 2019 07:13:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 02/30] virtiofsd: Pull in kernel's fuse.h
Message-ID: <20191024071243-mutt-send-email-mst@kernel.org>
References: <20191021105832.36574-1-dgilbert@redhat.com>
 <20191021105832.36574-3-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021105832.36574-3-dgilbert@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, piaojun@huawei.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, eguan@linux.alibaba.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 21, 2019 at 11:58:04AM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Pull in fuse.h from the kernel; version 97f9a3c4eee55b0178b518ae7114a6a53372913d

How about using some tag instead?

> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  contrib/virtiofsd/fuse_kernel.h | 858 ++++++++++++++++++++++++++++++++
>  1 file changed, 858 insertions(+)
>  create mode 100644 contrib/virtiofsd/fuse_kernel.h
> 
> diff --git a/contrib/virtiofsd/fuse_kernel.h b/contrib/virtiofsd/fuse_kernel.h
> new file mode 100644
> index 0000000000..802b0377a4
> --- /dev/null
> +++ b/contrib/virtiofsd/fuse_kernel.h
> @@ -0,0 +1,858 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-2-Clause) */
> +/*
> +    This file defines the kernel interface of FUSE
> +    Copyright (C) 2001-2008  Miklos Szeredi <miklos@szeredi.hu>
> +
> +    This program can be distributed under the terms of the GNU GPL.
> +    See the file COPYING.
> +
> +    This -- and only this -- header file may also be distributed under
> +    the terms of the BSD Licence as follows:
> +
> +    Copyright (C) 2001-2007 Miklos Szeredi. All rights reserved.
> +
> +    Redistribution and use in source and binary forms, with or without
> +    modification, are permitted provided that the following conditions
> +    are met:
> +    1. Redistributions of source code must retain the above copyright
> +       notice, this list of conditions and the following disclaimer.
> +    2. Redistributions in binary form must reproduce the above copyright
> +       notice, this list of conditions and the following disclaimer in the
> +       documentation and/or other materials provided with the distribution.
> +
> +    THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS ``AS IS'' AND
> +    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +    ARE DISCLAIMED.  IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
> +    FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> +    DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> +    OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> +    HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> +    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> +    OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> +    SUCH DAMAGE.
> +*/
> +
> +/*
> + * This file defines the kernel interface of FUSE
> + *
> + * Protocol changelog:
> + *
> + * 7.9:
> + *  - new fuse_getattr_in input argument of GETATTR
> + *  - add lk_flags in fuse_lk_in
> + *  - add lock_owner field to fuse_setattr_in, fuse_read_in and fuse_write_in
> + *  - add blksize field to fuse_attr
> + *  - add file flags field to fuse_read_in and fuse_write_in
> + *  - Add ATIME_NOW and MTIME_NOW flags to fuse_setattr_in
> + *
> + * 7.10
> + *  - add nonseekable open flag
> + *
> + * 7.11
> + *  - add IOCTL message
> + *  - add unsolicited notification support
> + *  - add POLL message and NOTIFY_POLL notification
> + *
> + * 7.12
> + *  - add umask flag to input argument of create, mknod and mkdir
> + *  - add notification messages for invalidation of inodes and
> + *    directory entries
> + *
> + * 7.13
> + *  - make max number of background requests and congestion threshold
> + *    tunables
> + *
> + * 7.14
> + *  - add splice support to fuse device
> + *
> + * 7.15
> + *  - add store notify
> + *  - add retrieve notify
> + *
> + * 7.16
> + *  - add BATCH_FORGET request
> + *  - FUSE_IOCTL_UNRESTRICTED shall now return with array of 'struct
> + *    fuse_ioctl_iovec' instead of ambiguous 'struct iovec'
> + *  - add FUSE_IOCTL_32BIT flag
> + *
> + * 7.17
> + *  - add FUSE_FLOCK_LOCKS and FUSE_RELEASE_FLOCK_UNLOCK
> + *
> + * 7.18
> + *  - add FUSE_IOCTL_DIR flag
> + *  - add FUSE_NOTIFY_DELETE
> + *
> + * 7.19
> + *  - add FUSE_FALLOCATE
> + *
> + * 7.20
> + *  - add FUSE_AUTO_INVAL_DATA
> + *
> + * 7.21
> + *  - add FUSE_READDIRPLUS
> + *  - send the requested events in POLL request
> + *
> + * 7.22
> + *  - add FUSE_ASYNC_DIO
> + *
> + * 7.23
> + *  - add FUSE_WRITEBACK_CACHE
> + *  - add time_gran to fuse_init_out
> + *  - add reserved space to fuse_init_out
> + *  - add FATTR_CTIME
> + *  - add ctime and ctimensec to fuse_setattr_in
> + *  - add FUSE_RENAME2 request
> + *  - add FUSE_NO_OPEN_SUPPORT flag
> + *
> + *  7.24
> + *  - add FUSE_LSEEK for SEEK_HOLE and SEEK_DATA support
> + *
> + *  7.25
> + *  - add FUSE_PARALLEL_DIROPS
> + *
> + *  7.26
> + *  - add FUSE_HANDLE_KILLPRIV
> + *  - add FUSE_POSIX_ACL
> + *
> + *  7.27
> + *  - add FUSE_ABORT_ERROR
> + *
> + *  7.28
> + *  - add FUSE_COPY_FILE_RANGE
> + *  - add FOPEN_CACHE_DIR
> + *  - add FUSE_MAX_PAGES, add max_pages to init_out
> + *  - add FUSE_CACHE_SYMLINKS
> + *
> + *  7.29
> + *  - add FUSE_NO_OPENDIR_SUPPORT flag
> + *
> + *  7.30
> + *  - add FUSE_EXPLICIT_INVAL_DATA
> + *  - add FUSE_IOCTL_COMPAT_X32
> + *
> + *  7.31
> + *  - add FUSE_WRITE_KILL_PRIV flag
> + *  - add FUSE_SETUPMAPPING and FUSE_REMOVEMAPPING
> + *  - add map_alignment to fuse_init_out, add FUSE_MAP_ALIGNMENT flag
> + */
> +
> +#ifndef _LINUX_FUSE_H
> +#define _LINUX_FUSE_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#else
> +#include <stdint.h>
> +#endif
> +
> +/*
> + * Version negotiation:
> + *
> + * Both the kernel and userspace send the version they support in the
> + * INIT request and reply respectively.
> + *
> + * If the major versions match then both shall use the smallest
> + * of the two minor versions for communication.
> + *
> + * If the kernel supports a larger major version, then userspace shall
> + * reply with the major version it supports, ignore the rest of the
> + * INIT message and expect a new INIT message from the kernel with a
> + * matching major version.
> + *
> + * If the library supports a larger major version, then it shall fall
> + * back to the major protocol version sent by the kernel for
> + * communication and reply with that major version (and an arbitrary
> + * supported minor version).
> + */
> +
> +/** Version number of this interface */
> +#define FUSE_KERNEL_VERSION 7
> +
> +/** Minor version number of this interface */
> +#define FUSE_KERNEL_MINOR_VERSION 31
> +
> +/** The node ID of the root inode */
> +#define FUSE_ROOT_ID 1
> +
> +/* Make sure all structures are padded to 64bit boundary, so 32bit
> +   userspace works under 64bit kernels */
> +
> +struct fuse_attr {
> +	uint64_t	ino;
> +	uint64_t	size;
> +	uint64_t	blocks;
> +	uint64_t	atime;
> +	uint64_t	mtime;
> +	uint64_t	ctime;
> +	uint32_t	atimensec;
> +	uint32_t	mtimensec;
> +	uint32_t	ctimensec;
> +	uint32_t	mode;
> +	uint32_t	nlink;
> +	uint32_t	uid;
> +	uint32_t	gid;
> +	uint32_t	rdev;
> +	uint32_t	blksize;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_kstatfs {
> +	uint64_t	blocks;
> +	uint64_t	bfree;
> +	uint64_t	bavail;
> +	uint64_t	files;
> +	uint64_t	ffree;
> +	uint32_t	bsize;
> +	uint32_t	namelen;
> +	uint32_t	frsize;
> +	uint32_t	padding;
> +	uint32_t	spare[6];
> +};
> +
> +struct fuse_file_lock {
> +	uint64_t	start;
> +	uint64_t	end;
> +	uint32_t	type;
> +	uint32_t	pid; /* tgid */
> +};
> +
> +/**
> + * Bitmasks for fuse_setattr_in.valid
> + */
> +#define FATTR_MODE	(1 << 0)
> +#define FATTR_UID	(1 << 1)
> +#define FATTR_GID	(1 << 2)
> +#define FATTR_SIZE	(1 << 3)
> +#define FATTR_ATIME	(1 << 4)
> +#define FATTR_MTIME	(1 << 5)
> +#define FATTR_FH	(1 << 6)
> +#define FATTR_ATIME_NOW	(1 << 7)
> +#define FATTR_MTIME_NOW	(1 << 8)
> +#define FATTR_LOCKOWNER	(1 << 9)
> +#define FATTR_CTIME	(1 << 10)
> +
> +/**
> + * Flags returned by the OPEN request
> + *
> + * FOPEN_DIRECT_IO: bypass page cache for this open file
> + * FOPEN_KEEP_CACHE: don't invalidate the data cache on open
> + * FOPEN_NONSEEKABLE: the file is not seekable
> + * FOPEN_CACHE_DIR: allow caching this directory
> + * FOPEN_STREAM: the file is stream-like (no file position at all)
> + */
> +#define FOPEN_DIRECT_IO		(1 << 0)
> +#define FOPEN_KEEP_CACHE	(1 << 1)
> +#define FOPEN_NONSEEKABLE	(1 << 2)
> +#define FOPEN_CACHE_DIR		(1 << 3)
> +#define FOPEN_STREAM		(1 << 4)
> +
> +/**
> + * INIT request/reply flags
> + *
> + * FUSE_ASYNC_READ: asynchronous read requests
> + * FUSE_POSIX_LOCKS: remote locking for POSIX file locks
> + * FUSE_FILE_OPS: kernel sends file handle for fstat, etc... (not yet supported)
> + * FUSE_ATOMIC_O_TRUNC: handles the O_TRUNC open flag in the filesystem
> + * FUSE_EXPORT_SUPPORT: filesystem handles lookups of "." and ".."
> + * FUSE_BIG_WRITES: filesystem can handle write size larger than 4kB
> + * FUSE_DONT_MASK: don't apply umask to file mode on create operations
> + * FUSE_SPLICE_WRITE: kernel supports splice write on the device
> + * FUSE_SPLICE_MOVE: kernel supports splice move on the device
> + * FUSE_SPLICE_READ: kernel supports splice read on the device
> + * FUSE_FLOCK_LOCKS: remote locking for BSD style file locks
> + * FUSE_HAS_IOCTL_DIR: kernel supports ioctl on directories
> + * FUSE_AUTO_INVAL_DATA: automatically invalidate cached pages
> + * FUSE_DO_READDIRPLUS: do READDIRPLUS (READDIR+LOOKUP in one)
> + * FUSE_READDIRPLUS_AUTO: adaptive readdirplus
> + * FUSE_ASYNC_DIO: asynchronous direct I/O submission
> + * FUSE_WRITEBACK_CACHE: use writeback cache for buffered writes
> + * FUSE_NO_OPEN_SUPPORT: kernel supports zero-message opens
> + * FUSE_PARALLEL_DIROPS: allow parallel lookups and readdir
> + * FUSE_HANDLE_KILLPRIV: fs handles killing suid/sgid/cap on write/chown/trunc
> + * FUSE_POSIX_ACL: filesystem supports posix acls
> + * FUSE_ABORT_ERROR: reading the device after abort returns ECONNABORTED
> + * FUSE_MAX_PAGES: init_out.max_pages contains the max number of req pages
> + * FUSE_CACHE_SYMLINKS: cache READLINK responses
> + * FUSE_NO_OPENDIR_SUPPORT: kernel supports zero-message opendir
> + * FUSE_EXPLICIT_INVAL_DATA: only invalidate cached pages on explicit request
> + * FUSE_MAP_ALIGNMENT: map_alignment field is valid
> + */
> +#define FUSE_ASYNC_READ		(1 << 0)
> +#define FUSE_POSIX_LOCKS	(1 << 1)
> +#define FUSE_FILE_OPS		(1 << 2)
> +#define FUSE_ATOMIC_O_TRUNC	(1 << 3)
> +#define FUSE_EXPORT_SUPPORT	(1 << 4)
> +#define FUSE_BIG_WRITES		(1 << 5)
> +#define FUSE_DONT_MASK		(1 << 6)
> +#define FUSE_SPLICE_WRITE	(1 << 7)
> +#define FUSE_SPLICE_MOVE	(1 << 8)
> +#define FUSE_SPLICE_READ	(1 << 9)
> +#define FUSE_FLOCK_LOCKS	(1 << 10)
> +#define FUSE_HAS_IOCTL_DIR	(1 << 11)
> +#define FUSE_AUTO_INVAL_DATA	(1 << 12)
> +#define FUSE_DO_READDIRPLUS	(1 << 13)
> +#define FUSE_READDIRPLUS_AUTO	(1 << 14)
> +#define FUSE_ASYNC_DIO		(1 << 15)
> +#define FUSE_WRITEBACK_CACHE	(1 << 16)
> +#define FUSE_NO_OPEN_SUPPORT	(1 << 17)
> +#define FUSE_PARALLEL_DIROPS    (1 << 18)
> +#define FUSE_HANDLE_KILLPRIV	(1 << 19)
> +#define FUSE_POSIX_ACL		(1 << 20)
> +#define FUSE_ABORT_ERROR	(1 << 21)
> +#define FUSE_MAX_PAGES		(1 << 22)
> +#define FUSE_CACHE_SYMLINKS	(1 << 23)
> +#define FUSE_NO_OPENDIR_SUPPORT (1 << 24)
> +#define FUSE_EXPLICIT_INVAL_DATA (1 << 25)
> +#define FUSE_MAP_ALIGNMENT	(1 << 26)
> +
> +/**
> + * CUSE INIT request/reply flags
> + *
> + * CUSE_UNRESTRICTED_IOCTL:  use unrestricted ioctl
> + */
> +#define CUSE_UNRESTRICTED_IOCTL	(1 << 0)
> +
> +/**
> + * Release flags
> + */
> +#define FUSE_RELEASE_FLUSH	(1 << 0)
> +#define FUSE_RELEASE_FLOCK_UNLOCK	(1 << 1)
> +
> +/**
> + * Getattr flags
> + */
> +#define FUSE_GETATTR_FH		(1 << 0)
> +
> +/**
> + * Lock flags
> + */
> +#define FUSE_LK_FLOCK		(1 << 0)
> +
> +/**
> + * WRITE flags
> + *
> + * FUSE_WRITE_CACHE: delayed write from page cache, file handle is guessed
> + * FUSE_WRITE_LOCKOWNER: lock_owner field is valid
> + * FUSE_WRITE_KILL_PRIV: kill suid and sgid bits
> + */
> +#define FUSE_WRITE_CACHE	(1 << 0)
> +#define FUSE_WRITE_LOCKOWNER	(1 << 1)
> +#define FUSE_WRITE_KILL_PRIV	(1 << 2)
> +
> +/**
> + * Read flags
> + */
> +#define FUSE_READ_LOCKOWNER	(1 << 1)
> +
> +/**
> + * Ioctl flags
> + *
> + * FUSE_IOCTL_COMPAT: 32bit compat ioctl on 64bit machine
> + * FUSE_IOCTL_UNRESTRICTED: not restricted to well-formed ioctls, retry allowed
> + * FUSE_IOCTL_RETRY: retry with new iovecs
> + * FUSE_IOCTL_32BIT: 32bit ioctl
> + * FUSE_IOCTL_DIR: is a directory
> + * FUSE_IOCTL_COMPAT_X32: x32 compat ioctl on 64bit machine (64bit time_t)
> + *
> + * FUSE_IOCTL_MAX_IOV: maximum of in_iovecs + out_iovecs
> + */
> +#define FUSE_IOCTL_COMPAT	(1 << 0)
> +#define FUSE_IOCTL_UNRESTRICTED	(1 << 1)
> +#define FUSE_IOCTL_RETRY	(1 << 2)
> +#define FUSE_IOCTL_32BIT	(1 << 3)
> +#define FUSE_IOCTL_DIR		(1 << 4)
> +#define FUSE_IOCTL_COMPAT_X32	(1 << 5)
> +
> +#define FUSE_IOCTL_MAX_IOV	256
> +
> +/**
> + * Poll flags
> + *
> + * FUSE_POLL_SCHEDULE_NOTIFY: request poll notify
> + */
> +#define FUSE_POLL_SCHEDULE_NOTIFY (1 << 0)
> +
> +/**
> + * Fsync flags
> + *
> + * FUSE_FSYNC_FDATASYNC: Sync data only, not metadata
> + */
> +#define FUSE_FSYNC_FDATASYNC	(1 << 0)
> +
> +enum fuse_opcode {
> +	FUSE_LOOKUP		= 1,
> +	FUSE_FORGET		= 2,  /* no reply */
> +	FUSE_GETATTR		= 3,
> +	FUSE_SETATTR		= 4,
> +	FUSE_READLINK		= 5,
> +	FUSE_SYMLINK		= 6,
> +	FUSE_MKNOD		= 8,
> +	FUSE_MKDIR		= 9,
> +	FUSE_UNLINK		= 10,
> +	FUSE_RMDIR		= 11,
> +	FUSE_RENAME		= 12,
> +	FUSE_LINK		= 13,
> +	FUSE_OPEN		= 14,
> +	FUSE_READ		= 15,
> +	FUSE_WRITE		= 16,
> +	FUSE_STATFS		= 17,
> +	FUSE_RELEASE		= 18,
> +	FUSE_FSYNC		= 20,
> +	FUSE_SETXATTR		= 21,
> +	FUSE_GETXATTR		= 22,
> +	FUSE_LISTXATTR		= 23,
> +	FUSE_REMOVEXATTR	= 24,
> +	FUSE_FLUSH		= 25,
> +	FUSE_INIT		= 26,
> +	FUSE_OPENDIR		= 27,
> +	FUSE_READDIR		= 28,
> +	FUSE_RELEASEDIR		= 29,
> +	FUSE_FSYNCDIR		= 30,
> +	FUSE_GETLK		= 31,
> +	FUSE_SETLK		= 32,
> +	FUSE_SETLKW		= 33,
> +	FUSE_ACCESS		= 34,
> +	FUSE_CREATE		= 35,
> +	FUSE_INTERRUPT		= 36,
> +	FUSE_BMAP		= 37,
> +	FUSE_DESTROY		= 38,
> +	FUSE_IOCTL		= 39,
> +	FUSE_POLL		= 40,
> +	FUSE_NOTIFY_REPLY	= 41,
> +	FUSE_BATCH_FORGET	= 42,
> +	FUSE_FALLOCATE		= 43,
> +	FUSE_READDIRPLUS	= 44,
> +	FUSE_RENAME2		= 45,
> +	FUSE_LSEEK		= 46,
> +	FUSE_COPY_FILE_RANGE	= 47,
> +	FUSE_SETUPMAPPING	= 48,
> +	FUSE_REMOVEMAPPING	= 49,
> +
> +	/* CUSE specific operations */
> +	CUSE_INIT		= 4096,
> +
> +	/* Reserved opcodes: helpful to detect structure endian-ness */
> +	CUSE_INIT_BSWAP_RESERVED	= 1048576,	/* CUSE_INIT << 8 */
> +	FUSE_INIT_BSWAP_RESERVED	= 436207616,	/* FUSE_INIT << 24 */
> +};
> +
> +enum fuse_notify_code {
> +	FUSE_NOTIFY_POLL   = 1,
> +	FUSE_NOTIFY_INVAL_INODE = 2,
> +	FUSE_NOTIFY_INVAL_ENTRY = 3,
> +	FUSE_NOTIFY_STORE = 4,
> +	FUSE_NOTIFY_RETRIEVE = 5,
> +	FUSE_NOTIFY_DELETE = 6,
> +	FUSE_NOTIFY_CODE_MAX,
> +};
> +
> +/* The read buffer is required to be at least 8k, but may be much larger */
> +#define FUSE_MIN_READ_BUFFER 8192
> +
> +#define FUSE_COMPAT_ENTRY_OUT_SIZE 120
> +
> +struct fuse_entry_out {
> +	uint64_t	nodeid;		/* Inode ID */
> +	uint64_t	generation;	/* Inode generation: nodeid:gen must
> +					   be unique for the fs's lifetime */
> +	uint64_t	entry_valid;	/* Cache timeout for the name */
> +	uint64_t	attr_valid;	/* Cache timeout for the attributes */
> +	uint32_t	entry_valid_nsec;
> +	uint32_t	attr_valid_nsec;
> +	struct fuse_attr attr;
> +};
> +
> +struct fuse_forget_in {
> +	uint64_t	nlookup;
> +};
> +
> +struct fuse_forget_one {
> +	uint64_t	nodeid;
> +	uint64_t	nlookup;
> +};
> +
> +struct fuse_batch_forget_in {
> +	uint32_t	count;
> +	uint32_t	dummy;
> +};
> +
> +struct fuse_getattr_in {
> +	uint32_t	getattr_flags;
> +	uint32_t	dummy;
> +	uint64_t	fh;
> +};
> +
> +#define FUSE_COMPAT_ATTR_OUT_SIZE 96
> +
> +struct fuse_attr_out {
> +	uint64_t	attr_valid;	/* Cache timeout for the attributes */
> +	uint32_t	attr_valid_nsec;
> +	uint32_t	dummy;
> +	struct fuse_attr attr;
> +};
> +
> +#define FUSE_COMPAT_MKNOD_IN_SIZE 8
> +
> +struct fuse_mknod_in {
> +	uint32_t	mode;
> +	uint32_t	rdev;
> +	uint32_t	umask;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_mkdir_in {
> +	uint32_t	mode;
> +	uint32_t	umask;
> +};
> +
> +struct fuse_rename_in {
> +	uint64_t	newdir;
> +};
> +
> +struct fuse_rename2_in {
> +	uint64_t	newdir;
> +	uint32_t	flags;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_link_in {
> +	uint64_t	oldnodeid;
> +};
> +
> +struct fuse_setattr_in {
> +	uint32_t	valid;
> +	uint32_t	padding;
> +	uint64_t	fh;
> +	uint64_t	size;
> +	uint64_t	lock_owner;
> +	uint64_t	atime;
> +	uint64_t	mtime;
> +	uint64_t	ctime;
> +	uint32_t	atimensec;
> +	uint32_t	mtimensec;
> +	uint32_t	ctimensec;
> +	uint32_t	mode;
> +	uint32_t	unused4;
> +	uint32_t	uid;
> +	uint32_t	gid;
> +	uint32_t	unused5;
> +};
> +
> +struct fuse_open_in {
> +	uint32_t	flags;
> +	uint32_t	unused;
> +};
> +
> +struct fuse_create_in {
> +	uint32_t	flags;
> +	uint32_t	mode;
> +	uint32_t	umask;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_open_out {
> +	uint64_t	fh;
> +	uint32_t	open_flags;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_release_in {
> +	uint64_t	fh;
> +	uint32_t	flags;
> +	uint32_t	release_flags;
> +	uint64_t	lock_owner;
> +};
> +
> +struct fuse_flush_in {
> +	uint64_t	fh;
> +	uint32_t	unused;
> +	uint32_t	padding;
> +	uint64_t	lock_owner;
> +};
> +
> +struct fuse_read_in {
> +	uint64_t	fh;
> +	uint64_t	offset;
> +	uint32_t	size;
> +	uint32_t	read_flags;
> +	uint64_t	lock_owner;
> +	uint32_t	flags;
> +	uint32_t	padding;
> +};
> +
> +#define FUSE_COMPAT_WRITE_IN_SIZE 24
> +
> +struct fuse_write_in {
> +	uint64_t	fh;
> +	uint64_t	offset;
> +	uint32_t	size;
> +	uint32_t	write_flags;
> +	uint64_t	lock_owner;
> +	uint32_t	flags;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_write_out {
> +	uint32_t	size;
> +	uint32_t	padding;
> +};
> +
> +#define FUSE_COMPAT_STATFS_SIZE 48
> +
> +struct fuse_statfs_out {
> +	struct fuse_kstatfs st;
> +};
> +
> +struct fuse_fsync_in {
> +	uint64_t	fh;
> +	uint32_t	fsync_flags;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_setxattr_in {
> +	uint32_t	size;
> +	uint32_t	flags;
> +};
> +
> +struct fuse_getxattr_in {
> +	uint32_t	size;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_getxattr_out {
> +	uint32_t	size;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_lk_in {
> +	uint64_t	fh;
> +	uint64_t	owner;
> +	struct fuse_file_lock lk;
> +	uint32_t	lk_flags;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_lk_out {
> +	struct fuse_file_lock lk;
> +};
> +
> +struct fuse_access_in {
> +	uint32_t	mask;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_init_in {
> +	uint32_t	major;
> +	uint32_t	minor;
> +	uint32_t	max_readahead;
> +	uint32_t	flags;
> +};
> +
> +#define FUSE_COMPAT_INIT_OUT_SIZE 8
> +#define FUSE_COMPAT_22_INIT_OUT_SIZE 24
> +
> +struct fuse_init_out {
> +	uint32_t	major;
> +	uint32_t	minor;
> +	uint32_t	max_readahead;
> +	uint32_t	flags;
> +	uint16_t	max_background;
> +	uint16_t	congestion_threshold;
> +	uint32_t	max_write;
> +	uint32_t	time_gran;
> +	uint16_t	max_pages;
> +	uint16_t	map_alignment;
> +	uint32_t	unused[8];
> +};
> +
> +#define CUSE_INIT_INFO_MAX 4096
> +
> +struct cuse_init_in {
> +	uint32_t	major;
> +	uint32_t	minor;
> +	uint32_t	unused;
> +	uint32_t	flags;
> +};
> +
> +struct cuse_init_out {
> +	uint32_t	major;
> +	uint32_t	minor;
> +	uint32_t	unused;
> +	uint32_t	flags;
> +	uint32_t	max_read;
> +	uint32_t	max_write;
> +	uint32_t	dev_major;		/* chardev major */
> +	uint32_t	dev_minor;		/* chardev minor */
> +	uint32_t	spare[10];
> +};
> +
> +struct fuse_interrupt_in {
> +	uint64_t	unique;
> +};
> +
> +struct fuse_bmap_in {
> +	uint64_t	block;
> +	uint32_t	blocksize;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_bmap_out {
> +	uint64_t	block;
> +};
> +
> +struct fuse_ioctl_in {
> +	uint64_t	fh;
> +	uint32_t	flags;
> +	uint32_t	cmd;
> +	uint64_t	arg;
> +	uint32_t	in_size;
> +	uint32_t	out_size;
> +};
> +
> +struct fuse_ioctl_iovec {
> +	uint64_t	base;
> +	uint64_t	len;
> +};
> +
> +struct fuse_ioctl_out {
> +	int32_t		result;
> +	uint32_t	flags;
> +	uint32_t	in_iovs;
> +	uint32_t	out_iovs;
> +};
> +
> +struct fuse_poll_in {
> +	uint64_t	fh;
> +	uint64_t	kh;
> +	uint32_t	flags;
> +	uint32_t	events;
> +};
> +
> +struct fuse_poll_out {
> +	uint32_t	revents;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_notify_poll_wakeup_out {
> +	uint64_t	kh;
> +};
> +
> +struct fuse_fallocate_in {
> +	uint64_t	fh;
> +	uint64_t	offset;
> +	uint64_t	length;
> +	uint32_t	mode;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_in_header {
> +	uint32_t	len;
> +	uint32_t	opcode;
> +	uint64_t	unique;
> +	uint64_t	nodeid;
> +	uint32_t	uid;
> +	uint32_t	gid;
> +	uint32_t	pid;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_out_header {
> +	uint32_t	len;
> +	int32_t		error;
> +	uint64_t	unique;
> +};
> +
> +struct fuse_dirent {
> +	uint64_t	ino;
> +	uint64_t	off;
> +	uint32_t	namelen;
> +	uint32_t	type;
> +	char name[];
> +};
> +
> +#define FUSE_NAME_OFFSET offsetof(struct fuse_dirent, name)
> +#define FUSE_DIRENT_ALIGN(x) \
> +	(((x) + sizeof(uint64_t) - 1) & ~(sizeof(uint64_t) - 1))
> +#define FUSE_DIRENT_SIZE(d) \
> +	FUSE_DIRENT_ALIGN(FUSE_NAME_OFFSET + (d)->namelen)
> +
> +struct fuse_direntplus {
> +	struct fuse_entry_out entry_out;
> +	struct fuse_dirent dirent;
> +};
> +
> +#define FUSE_NAME_OFFSET_DIRENTPLUS \
> +	offsetof(struct fuse_direntplus, dirent.name)
> +#define FUSE_DIRENTPLUS_SIZE(d) \
> +	FUSE_DIRENT_ALIGN(FUSE_NAME_OFFSET_DIRENTPLUS + (d)->dirent.namelen)
> +
> +struct fuse_notify_inval_inode_out {
> +	uint64_t	ino;
> +	int64_t		off;
> +	int64_t		len;
> +};
> +
> +struct fuse_notify_inval_entry_out {
> +	uint64_t	parent;
> +	uint32_t	namelen;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_notify_delete_out {
> +	uint64_t	parent;
> +	uint64_t	child;
> +	uint32_t	namelen;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_notify_store_out {
> +	uint64_t	nodeid;
> +	uint64_t	offset;
> +	uint32_t	size;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_notify_retrieve_out {
> +	uint64_t	notify_unique;
> +	uint64_t	nodeid;
> +	uint64_t	offset;
> +	uint32_t	size;
> +	uint32_t	padding;
> +};
> +
> +/* Matches the size of fuse_write_in */
> +struct fuse_notify_retrieve_in {
> +	uint64_t	dummy1;
> +	uint64_t	offset;
> +	uint32_t	size;
> +	uint32_t	dummy2;
> +	uint64_t	dummy3;
> +	uint64_t	dummy4;
> +};
> +
> +/* Device ioctls: */
> +#define FUSE_DEV_IOC_CLONE	_IOR(229, 0, uint32_t)
> +
> +struct fuse_lseek_in {
> +	uint64_t	fh;
> +	uint64_t	offset;
> +	uint32_t	whence;
> +	uint32_t	padding;
> +};
> +
> +struct fuse_lseek_out {
> +	uint64_t	offset;
> +};
> +
> +struct fuse_copy_file_range_in {
> +	uint64_t	fh_in;
> +	uint64_t	off_in;
> +	uint64_t	nodeid_out;
> +	uint64_t	fh_out;
> +	uint64_t	off_out;
> +	uint64_t	len;
> +	uint64_t	flags;
> +};
> +
> +#endif /* _LINUX_FUSE_H */
> -- 
> 2.23.0


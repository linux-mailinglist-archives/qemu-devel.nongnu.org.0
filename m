Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE09146874
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:54:30 +0100 (CET)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuc0D-0002ak-4F
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iub8O-0001TG-R7
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:58:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iub8M-0004gj-Tf
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:58:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29116
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iub8M-0004gS-ME
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S1/0M4MxKsN2qjG2ljyCJK6jHTNTg8IXurLNHgKg3x0=;
 b=HSZ4XTz9pI1HDBB8QapXwJ7qxfvMouWr+qtrrhEDJg0aMQTCkyye7742DIgR+gqJswXDo1
 uu6UpZT8wjzE+as2GmebFOIiKuEbkN5YohHXA1Yqh76bfW3oJQzjtuWhhEmFpub11nwijQ
 hinYYU1h7kkzTZhJ2tTiy0O5/z0rcJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-BXk2K96HMQymHL5X4IbtnQ-1; Thu, 23 Jan 2020 06:58:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E1441005510
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:58:47 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AB2585754;
 Thu, 23 Jan 2020 11:58:43 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 000/111] virtiofs queue
Date: Thu, 23 Jan 2020 11:56:50 +0000
Message-Id: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BXk2K96HMQymHL5X4IbtnQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 3e08b2b9cb64bff2b73fa9128c0e49bfcde0dd40=
:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/edk2-next-202001=
21' into staging (2020-01-21 15:29:25 +0000)

are available in the Git repository at:

  git@gitlab.com:dagrh/qemu.git tags/pull-virtiofs-20200123

for you to fetch changes up to 87509325f70c78a28683f9460699915ea3300091:

  virtiofsd: add some options to the help message (2020-01-23 10:54:49 +000=
0)

----------------------------------------------------------------
virtiofsd first pull

Import our virtiofsd.
This pulls in the daemon to drive a file system connected to the
existing qemu virtiofsd device.
It's derived from upstream libfuse with lots of changes (and a lot
trimmed out).
The daemon lives in the newly created qemu/tools/virtiofsd

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Dr. David Alan Gilbert (35):
      virtiofsd: Pull in upstream headers
      virtiofsd: Pull in kernel's fuse.h
      virtiofsd: Add auxiliary .c's
      virtiofsd: Add fuse_lowlevel.c
      virtiofsd: Add passthrough_ll
      virtiofsd: Trim down imported files
      virtiofsd: Format imported files to qemu style
      virtiofsd: Fix fuse_daemonize ignored return values
      virtiofsd: Fix common header and define for QEMU builds
      virtiofsd: Trim out compatibility code
      virtiofsd: Add options for virtio
      virtiofsd: Open vhost connection instead of mounting
      virtiofsd: Start wiring up vhost-user
      virtiofsd: Add main virtio loop
      virtiofsd: get/set features callbacks
      virtiofsd: Start queue threads
      virtiofsd: Poll kick_fd for queue
      virtiofsd: Start reading commands from queue
      virtiofsd: Send replies to messages
      virtiofsd: Keep track of replies
      virtiofsd: Add Makefile wiring for virtiofsd contrib
      virtiofsd: Fast path for virtio read
      virtiofs: Add maintainers entry
      virtiofsd: Plumb fuse_bufvec through to do_write_buf
      virtiofsd: Pass write iov's all the way through
      virtiofsd: cap-ng helpers
      docs:  Add docs/tools
      virtiofsd: Handle reinit
      virtiofsd: Handle hard reboot
      virtiofsd: Kill threads when queues are stopped
      vhost-user: Print unexpected slave message types
      contrib/libvhost-user: Protect slave fd with mutex
      virtiofsd: Clean up inodes on destroy
      libvhost-user: Fix some memtable remap cases
      virtiofsd: Convert lo_destroy to take the lo->mutex lock itself

Eric Ren (1):
      virtiofsd: fix incorrect error handling in lo_do_lookup

Eryu Guan (3):
      virtiofsd: print log only when priority is high enough
      virtiofsd: convert more fprintf and perror to use fuse log infra
      virtiofsd: stop all queue threads on exit in virtio_loop()

Jiufei Xue (1):
      virtiofsd: support nanosecond resolution for file timestamp

Liu Bo (6):
      virtiofsd: fix error handling in main()
      virtiofsd: cleanup allocated resource in se
      virtiofsd: fix memory leak on lo.source
      virtiofsd: add helper for lo_data cleanup
      virtiofsd: enable PARALLEL_DIROPS during INIT
      Virtiofsd: fix memory leak on fuse queueinfo

Masayoshi Mizuma (4):
      virtiofsd: Add ID to the log with FUSE_LOG_DEBUG level
      virtiofsd: Add timestamp to the log with FUSE_LOG_DEBUG level
      virtiofsd: Prevent multiply running with same vhost_user_socket
      virtiofsd: add some options to the help message

Miklos Szeredi (10):
      virtiofsd: passthrough_ll: add fallback for racy ops
      virtiofsd: passthrough_ll: add renameat2 support
      virtiofsd: passthrough_ll: disable readdirplus on cache=3Dnever
      virtiofsd: passthrough_ll: control readdirplus
      virtiofsd: rename unref_inode() to unref_inode_lolocked()
      virtiofsd: fail when parent inode isn't known in lo_do_lookup()
      virtiofsd: extract root inode init into setup_root()
      virtiofsd: passthrough_ll: clean up cache related options
      virtiofsd: passthrough_ll: use hashtable
      virtiofsd: passthrough_ll: fix refcounting on remove/rename

Misono Tomohiro (2):
      virtiofsd: Fix data corruption with O_APPEND write in writeback mode
      virtiofsd: passthrough_ll: Use cache_readdir for directory open

Peng Tao (1):
      virtiofsd: do not always set FUSE_FLOCK_LOCKS

Stefan Hajnoczi (37):
      virtiofsd: remove mountpoint dummy argument
      virtiofsd: remove unused notify reply support
      virtiofsd: add -o source=3DPATH to help output
      virtiofsd: add --fd=3DFDNUM fd passing option
      virtiofsd: make -f (foreground) the default
      virtiofsd: add vhost-user.json file
      virtiofsd: add --print-capabilities option
      virtiofsd: passthrough_ll: add lo_map for ino/fh indirection
      virtiofsd: passthrough_ll: add ino_map to hide lo_inode pointers
      virtiofsd: passthrough_ll: add dirp_map to hide lo_dirp pointers
      virtiofsd: passthrough_ll: add fd_map to hide file descriptors
      virtiofsd: validate path components
      virtiofsd: add fuse_mbuf_iter API
      virtiofsd: validate input buffer sizes in do_write_buf()
      virtiofsd: check input buffer size in fuse_lowlevel.c ops
      virtiofsd: prevent ".." escape in lo_do_lookup()
      virtiofsd: prevent ".." escape in lo_do_readdir()
      virtiofsd: use /proc/self/fd/ O_PATH file descriptor
      virtiofsd: sandbox mount namespace
      virtiofsd: move to an empty network namespace
      virtiofsd: move to a new pid namespace
      virtiofsd: add seccomp whitelist
      virtiofsd: set maximum RLIMIT_NOFILE limit
      virtiofsd: fix libfuse information leaks
      virtiofsd: add security guide document
      virtiofsd: add --syslog command-line option
      virtiofsd: use fuse_lowlevel_is_virtio() in fuse_session_destroy()
      virtiofsd: prevent fv_queue_thread() vs virtio_loop() races
      virtiofsd: make lo_release() atomic
      virtiofsd: prevent races with lo_dirp_put()
      virtiofsd: rename inode->refcount to inode->nlookup
      virtiofsd: add man page
      virtiofsd: introduce inode refcount to prevent use-after-free
      virtiofsd: process requests in a thread pool
      virtiofsd: prevent FUSE_INIT/FUSE_DESTROY races
      virtiofsd: fix lo_destroy() resource leaks
      virtiofsd: add --thread-pool-size=3DNUM option

Vivek Goyal (6):
      virtiofsd: Make fsync work even if only inode is passed in
      virtiofsd: passthrough_ll: create new files in caller's context
      virtiofsd: Parse flag FUSE_WRITE_KILL_PRIV
      virtiofsd: Drop CAP_FSETID if client asked for it
      virtiofsd: Support remote posix locks
      virtiofsd: Reset O_DIRECT flag during file open

Xiao Yang (3):
      virtiofsd: Remove unused enum fuse_buf_copy_flags
      vitriofsd/passthrough_ll: fix fallocate() ifdefs
      virtiofsd/passthrough_ll: Pass errno to fuse_reply_err()

piaojun (2):
      virtiofsd: add definition of fuse_buf_writev()
      virtiofsd: use fuse_buf_writev to replace fuse_buf_write for better p=
erformance

 .gitignore                                |    1 +
 MAINTAINERS                               |    8 +
 Makefile                                  |   28 +-
 Makefile.objs                             |    1 +
 configure                                 |   16 +
 contrib/libvhost-user/libvhost-user.c     |   57 +-
 contrib/libvhost-user/libvhost-user.h     |    6 +
 docs/index.rst                            |    1 +
 docs/interop/vhost-user.json              |    4 +-
 docs/tools/conf.py                        |   16 +
 docs/tools/index.rst                      |   14 +
 docs/tools/virtiofsd-security.rst         |  118 ++
 hw/virtio/vhost-user.c                    |    2 +-
 include/standard-headers/linux/fuse.h     |  891 +++++++++
 scripts/update-linux-headers.sh           |    1 +
 tools/virtiofsd/50-qemu-virtiofsd.json.in |    5 +
 tools/virtiofsd/Makefile.objs             |   12 +
 tools/virtiofsd/buffer.c                  |  351 ++++
 tools/virtiofsd/fuse.h                    | 1249 ++++++++++++
 tools/virtiofsd/fuse_common.h             |  816 ++++++++
 tools/virtiofsd/fuse_i.h                  |  115 ++
 tools/virtiofsd/fuse_log.c                |   41 +
 tools/virtiofsd/fuse_log.h                |   74 +
 tools/virtiofsd/fuse_lowlevel.c           | 2761 +++++++++++++++++++++++++=
+
 tools/virtiofsd/fuse_lowlevel.h           | 1991 +++++++++++++++++++
 tools/virtiofsd/fuse_misc.h               |   60 +
 tools/virtiofsd/fuse_opt.c                |  450 +++++
 tools/virtiofsd/fuse_opt.h                |  272 +++
 tools/virtiofsd/fuse_signals.c            |   98 +
 tools/virtiofsd/fuse_virtio.c             |  986 ++++++++++
 tools/virtiofsd/fuse_virtio.h             |   33 +
 tools/virtiofsd/helper.c                  |  349 ++++
 tools/virtiofsd/passthrough_helpers.h     |   51 +
 tools/virtiofsd/passthrough_ll.c          | 3006 +++++++++++++++++++++++++=
++++
 tools/virtiofsd/seccomp.c                 |  165 ++
 tools/virtiofsd/seccomp.h                 |   16 +
 tools/virtiofsd/virtiofsd.texi            |  104 +
 37 files changed, 14154 insertions(+), 15 deletions(-)
 create mode 100644 docs/tools/conf.py
 create mode 100644 docs/tools/index.rst
 create mode 100644 docs/tools/virtiofsd-security.rst
 create mode 100644 include/standard-headers/linux/fuse.h
 create mode 100644 tools/virtiofsd/50-qemu-virtiofsd.json.in
 create mode 100644 tools/virtiofsd/Makefile.objs
 create mode 100644 tools/virtiofsd/buffer.c
 create mode 100644 tools/virtiofsd/fuse.h
 create mode 100644 tools/virtiofsd/fuse_common.h
 create mode 100644 tools/virtiofsd/fuse_i.h
 create mode 100644 tools/virtiofsd/fuse_log.c
 create mode 100644 tools/virtiofsd/fuse_log.h
 create mode 100644 tools/virtiofsd/fuse_lowlevel.c
 create mode 100644 tools/virtiofsd/fuse_lowlevel.h
 create mode 100644 tools/virtiofsd/fuse_misc.h
 create mode 100644 tools/virtiofsd/fuse_opt.c
 create mode 100644 tools/virtiofsd/fuse_opt.h
 create mode 100644 tools/virtiofsd/fuse_signals.c
 create mode 100644 tools/virtiofsd/fuse_virtio.c
 create mode 100644 tools/virtiofsd/fuse_virtio.h
 create mode 100644 tools/virtiofsd/helper.c
 create mode 100644 tools/virtiofsd/passthrough_helpers.h
 create mode 100644 tools/virtiofsd/passthrough_ll.c
 create mode 100644 tools/virtiofsd/seccomp.c
 create mode 100644 tools/virtiofsd/seccomp.h
 create mode 100644 tools/virtiofsd/virtiofsd.texi



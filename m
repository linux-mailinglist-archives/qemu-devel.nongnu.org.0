Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834021314C1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:23:42 +0100 (CET)
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioUEH-0007zj-4n
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ioTnw-0007k7-6z
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ioTnt-0008P9-Bc
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:56:27 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22567
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ioTnt-0008OH-6Y
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578322584;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+qR+pBuB64MbgvuV/4BELLkyIwDPQ0azH2qC9PmwXs=;
 b=XOQP6HiaIryfSqkyFORohJnLry9FY5Az0sVL+OIDAFHDveKcNcvK+ucNbQYZdZ+8Ihr1l+
 OOaHu75Ht5cd+svvFjfy1Z+qAfQZYdboXMDJ2a1sT7vo0/fAQ2wZUm1YzYLM42yjUXs0tM
 PNJoBP9rEFqZKfALCV6fgxi+fbD18bU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-wv3WNk53OP-whbQISQLkOw-1; Mon, 06 Jan 2020 09:56:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51C6C10054E3
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 14:56:22 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D406228980;
 Mon,  6 Jan 2020 14:56:18 +0000 (UTC)
Date: Mon, 6 Jan 2020 14:56:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 050/104] virtiofsd: add seccomp whitelist
Message-ID: <20200106145618.GP2930416@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-51-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-51-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: wv3WNk53OP-whbQISQLkOw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 12, 2019 at 04:38:10PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Only allow system calls that are needed by virtiofsd.  All other system
> calls cause SIGSYS to be directed at the thread and the process will
> coredump.
>=20
> Restricting system calls reduces the kernel attack surface and limits
> what the process can do when compromised.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> with additional entries by:
> Signed-off-by: Ganesh Maharaj Mahalingam <ganesh.mahalingam@intel.com>
> Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> Signed-off-by: piaojun <piaojun@huawei.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Eric Ren <renzhen@linux.alibaba.com>
> ---
>  Makefile                         |   2 +
>  tools/virtiofsd/Makefile.objs    |   5 +-
>  tools/virtiofsd/passthrough_ll.c |   2 +
>  tools/virtiofsd/seccomp.c        | 141 +++++++++++++++++++++++++++++++
>  tools/virtiofsd/seccomp.h        |  14 +++
>  5 files changed, 163 insertions(+), 1 deletion(-)
>  create mode 100644 tools/virtiofsd/seccomp.c
>  create mode 100644 tools/virtiofsd/seccomp.h
>=20
> diff --git a/Makefile b/Makefile
> index 8a5746d8a0..3f5d04e1f7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -322,8 +322,10 @@ HELPERS-y =3D
>  HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) =3D qemu-bridge-h=
elper$(EXESUF)
> =20
>  ifdef CONFIG_LINUX
> +ifdef CONFIG_SECCOMP
>  HELPERS-y +=3D virtiofsd$(EXESUF)
>  vhost-user-json-y +=3D tools/virtiofsd/50-qemu-virtiofsd.json
> +endif
> =20
>  ifdef CONFIG_VIRGL
>  ifdef CONFIG_GBM
> diff --git a/tools/virtiofsd/Makefile.objs b/tools/virtiofsd/Makefile.obj=
s
> index 67be16332c..941b19f18e 100644
> --- a/tools/virtiofsd/Makefile.objs
> +++ b/tools/virtiofsd/Makefile.objs
> @@ -6,5 +6,8 @@ virtiofsd-obj-y =3D buffer.o \
>                    fuse_signals.o \
>                    fuse_virtio.o \
>                    helper.o \
> -                  passthrough_ll.o
> +                  passthrough_ll.o \
> +                  seccomp.o
> =20
> +seccomp.o-cflags :=3D $(SECCOMP_CFLAGS)
> +seccomp.o-libs :=3D $(SECCOMP_LIBS)
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrou=
gh_ll.c
> index 754ef2618b..701608c6df 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -58,6 +58,7 @@
>  #include <unistd.h>
> =20
>  #include "passthrough_helpers.h"
> +#include "seccomp.h"
> =20
>  #define HAVE_POSIX_FALLOCATE 1
>  struct lo_map_elem {
> @@ -2073,6 +2074,7 @@ static void setup_sandbox(struct lo_data *lo, struc=
t fuse_session *se)
>  {
>      setup_namespaces(lo, se);
>      setup_mounts(lo->source);
> +    setup_seccomp();
>  }
> =20
>  int main(int argc, char *argv[])
> diff --git a/tools/virtiofsd/seccomp.c b/tools/virtiofsd/seccomp.c
> new file mode 100644
> index 0000000000..6359bb55bb
> --- /dev/null
> +++ b/tools/virtiofsd/seccomp.c
> @@ -0,0 +1,141 @@
> +/*
> + * Seccomp sandboxing for virtiofsd
> + *
> + * Copyright (C) 2019 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "seccomp.h"
> +#include "fuse_i.h"
> +#include "fuse_log.h"
> +#include <errno.h>
> +#include <glib.h>
> +#include <seccomp.h>
> +#include <stdlib.h>
> +
> +/* Bodge for libseccomp 2.4.2 which broke ppoll */
> +#if !defined(__SNR_ppoll) && defined(__SNR_brk)
> +#ifdef __NR_ppoll
> +#define __SNR_ppoll __NR_ppoll
> +#else
> +#define __SNR_ppoll __PNR_ppoll
> +#endif
> +#endif
> +
> +static const int syscall_whitelist[] =3D {
> +    /* TODO ireg sem*() syscalls */
> +    SCMP_SYS(brk),
> +    SCMP_SYS(capget), /* For CAP_FSETID */
> +    SCMP_SYS(capset),
> +    SCMP_SYS(clock_gettime),
> +    SCMP_SYS(clone),

clone2 ?  clone3 ? IIC some archs in Linux
will require the newer variants.

> +    SCMP_SYS(close),
> +    SCMP_SYS(copy_file_range),
> +    SCMP_SYS(dup),
> +    SCMP_SYS(eventfd2),
> +    SCMP_SYS(exit),
> +    SCMP_SYS(exit_group),
> +    SCMP_SYS(fallocate),
> +    SCMP_SYS(fchmodat),
> +    SCMP_SYS(fchownat),
> +    SCMP_SYS(fcntl),
> +    SCMP_SYS(fdatasync),
> +    SCMP_SYS(fgetxattr),
> +    SCMP_SYS(flistxattr),
> +    SCMP_SYS(flock),
> +    SCMP_SYS(fremovexattr),
> +    SCMP_SYS(fsetxattr),
> +    SCMP_SYS(fstat),
> +    SCMP_SYS(fstatfs),
> +    SCMP_SYS(fsync),
> +    SCMP_SYS(ftruncate),
> +    SCMP_SYS(futex),
> +    SCMP_SYS(getdents),
> +    SCMP_SYS(getdents64),
> +    SCMP_SYS(getegid),
> +    SCMP_SYS(geteuid),
> +    SCMP_SYS(getpid),
> +    SCMP_SYS(gettid),
> +    SCMP_SYS(gettimeofday),
> +    SCMP_SYS(linkat),
> +    SCMP_SYS(lseek),
> +    SCMP_SYS(madvise),
> +    SCMP_SYS(mkdirat),
> +    SCMP_SYS(mknodat),
> +    SCMP_SYS(mmap),
> +    SCMP_SYS(mprotect),
> +    SCMP_SYS(mremap),
> +    SCMP_SYS(munmap),
> +    SCMP_SYS(newfstatat),
> +    SCMP_SYS(open),
> +    SCMP_SYS(openat),
> +    SCMP_SYS(ppoll),
> +    SCMP_SYS(prctl), /* TODO restrict to just PR_SET_NAME? */
> +    SCMP_SYS(preadv),
> +    SCMP_SYS(pread64),
> +    SCMP_SYS(pwritev),
> +    SCMP_SYS(pwrite64),
> +    SCMP_SYS(read),
> +    SCMP_SYS(readlinkat),
> +    SCMP_SYS(recvmsg),
> +    SCMP_SYS(renameat),
> +    SCMP_SYS(renameat2),
> +    SCMP_SYS(rt_sigaction),
> +    SCMP_SYS(rt_sigprocmask),
> +    SCMP_SYS(rt_sigreturn),
> +    SCMP_SYS(sendmsg),
> +    SCMP_SYS(setresgid),

Should be setresgid32 instead I think. We don't
want the legacy syscall that's limted to 16-bit GIDs

Needs the code fix I mention in an earlier patch too.

> +    SCMP_SYS(setresuid),

Same as above

> +    SCMP_SYS(set_robust_list),
> +    SCMP_SYS(symlinkat),
> +    SCMP_SYS(time), /* Rarely needed, except on static builds */
> +    SCMP_SYS(tgkill),
> +    SCMP_SYS(unlinkat),
> +    SCMP_SYS(utimensat),
> +    SCMP_SYS(write),
> +    SCMP_SYS(writev),
> +};


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|



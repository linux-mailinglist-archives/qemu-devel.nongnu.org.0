Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061FD3FBAAC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 19:09:52 +0200 (CEST)
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKkn8-0001qe-Jh
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 13:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mKklX-0000Na-Js
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 13:08:13 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:46748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mKklU-0008Sq-Ai
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 13:08:11 -0400
Received: by mail-oi1-x22e.google.com with SMTP id o185so20647998oih.13
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 10:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hzEU0qj2fRAavyadqIUxPBruYDgbY6UqxWuCJPkvkx0=;
 b=W3mY/i8AfYWJL1bxswigQa8GGgaperUy6zCzgfpk5xIEqfqwjaHGIZve32AJgAjX5i
 a1Czg5kgFd5/EZ57aYdS/HTqOAWnFAcrcSJKvzriHgZk3EAU/CMv+mBqFCeO/QagwdvB
 cmOjAT/IjTi9R13hnaVqcuGWtNSU5aVUJWZaKeORcPn3hTCddJQarc1c4FEgDzCOQLfV
 hoQsGwO4bFkU5U/xcJi8yaP+xYrG7zfNrM1eCrvP1IXlzygWg3dpUC2arzphxGRtsQIQ
 /1o5t47hWUNn58iJuwEh+pKEFfY0RLPkb7Wgcvm1PvKliDoIEnW5PaeB4IAtFw3T0ISl
 bEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hzEU0qj2fRAavyadqIUxPBruYDgbY6UqxWuCJPkvkx0=;
 b=fF6idHNSwTdipNLXQiccdu7+YToBlxFazmgrFR1gCM/R314mvWmZ3c5DVaJBDQLwl1
 c5w1PKXGHEOCnbMiJvqdo6LNAtc66VaaPCWHZ6SO5/LJZCHPBo+HHkgYUnb7u/JJN+18
 zXG93vyx2jK+kiwne9dilyQmKsNGxV4S7Eqw6O+tdyw8M5yGtQ8kiAySpzepJC0AyWtl
 GUbNHUbD2+e1ceF3fXhFasUvGU53ZLMN9rurLsfzLelXUyYNgz0I9ubDzqo3CMvok/go
 FvfezZfn4xuodGl74BZQVbtDj9pQpGEvdLhOUJt8k3YT78vsx3GrDRG1M5gV7YMYT+wh
 JRTQ==
X-Gm-Message-State: AOAM532P/ZjxxahFqlrfU/gjURKG8hlq8WvwU/i8DY81xB6gVrA73c57
 d4DlUc8ctLbmeI9AbJlFGkYKgxygqh7DyTAjlLvUNw==
X-Google-Smtp-Source: ABdhPJymDbC+cPvfbjd7jxN7ZNy9k9W2XzJljUNMxPNSp083elMWlypp5Murh6pb5+ZikYkpE2zDlwwJT0rjevT4bFU=
X-Received: by 2002:a05:6808:1d3:: with SMTP id
 x19mr47505oic.137.1630343286029; 
 Mon, 30 Aug 2021 10:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-5-andrew@daynix.com>
 <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
In-Reply-To: <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 30 Aug 2021 20:07:53 +0300
Message-ID: <CAOEp5OekBjFfwPEJ3JU-x0_wrwO9szApOk=kR3e7AKhiLqa9-w@mail.gmail.com>
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::22e;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 20, 2021 at 6:41 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=86=99=
=E9=81=93:
> > Helper program. Loads eBPF RSS program and maps and passes them through=
 unix socket.
> > Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.
>
>
> I wonder if this can be done as helper for TAP/bridge.
>
> E.g it's the qemu to launch those helper with set-uid.
>
> Then libvirt won't even need to care about that?
>

There are pros and cons for such a solution with set-uid.
From my point of view one of the cons is that set-uid is efficient
only at install time so the coexistence of different qemu builds (and
different helpers for each one) is kind of problematic.
With the current solution this does not present any problem: the
developer can have several different builds, each one automatically
has its own helper and there is no conflict between these builds and
between these builds and installed qemu package. Changing the
'emulator' in the libvirt profile automatically brings the proper
helper to work.

>
> > Also, libbpf dependency now exclusively for Linux.
> > Libbpf is used for eBPF RSS steering, which is supported only by Linux =
TAP.
> > There is no reason yet to build eBPF loader and helper for non Linux sy=
stems,
> > even if libbpf is present.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >   ebpf/qemu-ebpf-rss-helper.c | 130 +++++++++++++++++++++++++++++++++++=
+
> >   meson.build                 |  37 ++++++----
> >   2 files changed, 154 insertions(+), 13 deletions(-)
> >   create mode 100644 ebpf/qemu-ebpf-rss-helper.c
> >
> > diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper.c
> > new file mode 100644
> > index 0000000000..fe68758f57
> > --- /dev/null
> > +++ b/ebpf/qemu-ebpf-rss-helper.c
> > @@ -0,0 +1,130 @@
> > +/*
> > + * eBPF RSS Helper
> > + *
> > + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > + *
> > + * Authors:
> > + *  Andrew Melnychenko <andrew@daynix.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.  S=
ee
> > + * the COPYING file in the top-level directory.
> > + *
> > + * Description: This is helper program for libvirtd.
> > + *              It loads eBPF RSS program and passes fds through unix =
socket.
> > + *              Built by meson, target - 'qemu-ebpf-rss-helper'.
> > + */
> > +
> > +#include <stdio.h>
> > +#include <stdint.h>
> > +#include <stdlib.h>
> > +#include <stdbool.h>
> > +#include <getopt.h>
> > +#include <memory.h>
> > +#include <errno.h>
> > +#include <sys/socket.h>
> > +
> > +#include "ebpf_rss.h"
> > +
> > +#include "qemu-helper-stamp.h"
> > +
> > +void QEMU_HELPER_STAMP(void) {}
> > +
> > +static int send_fds(int socket, int *fds, int n)
> > +{
> > +    struct msghdr msg =3D {};
> > +    struct cmsghdr *cmsg =3D NULL;
> > +    char buf[CMSG_SPACE(n * sizeof(int))];
> > +    char dummy_buffer =3D 0;
> > +    struct iovec io =3D { .iov_base =3D &dummy_buffer,
> > +                        .iov_len =3D sizeof(dummy_buffer) };
> > +
> > +    memset(buf, 0, sizeof(buf));
> > +
> > +    msg.msg_iov =3D &io;
> > +    msg.msg_iovlen =3D 1;
> > +    msg.msg_control =3D buf;
> > +    msg.msg_controllen =3D sizeof(buf);
> > +
> > +    cmsg =3D CMSG_FIRSTHDR(&msg);
> > +    cmsg->cmsg_level =3D SOL_SOCKET;
> > +    cmsg->cmsg_type =3D SCM_RIGHTS;
> > +    cmsg->cmsg_len =3D CMSG_LEN(n * sizeof(int));
> > +
> > +    memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));
> > +
> > +    return sendmsg(socket, &msg, 0);
> > +}
> > +
> > +static void print_help_and_exit(const char *prog, int exitcode)
> > +{
> > +    fprintf(stderr, "%s - load eBPF RSS program for qemu and pass eBPF=
 fds"
> > +            " through unix socket.\n", prog);
> > +    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket file descrip=
tor"
> > +            " used to pass eBPF fds.\n");
> > +    fprintf(stderr, "\t--help, -h - this help.\n");
> > +    exit(exitcode);
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    char *fd_string =3D NULL;
> > +    int unix_fd =3D 0;
> > +    struct EBPFRSSContext ctx =3D {};
> > +    int fds[EBPF_RSS_MAX_FDS] =3D {};
> > +    int ret =3D -1;
> > +
> > +    for (;;) {
> > +        int c;
> > +        static struct option long_options[] =3D {
> > +                {"help",  no_argument, 0, 'h'},
> > +                {"fd",  required_argument, 0, 'f'},
> > +                {0, 0, 0, 0}
> > +        };
> > +        c =3D getopt_long(argc, argv, "hf:",
> > +                long_options, NULL);
> > +
> > +        if (c =3D=3D -1) {
> > +            break;
> > +        }
> > +
> > +        switch (c) {
> > +        case 'f':
> > +            fd_string =3D optarg;
> > +            break;
> > +        case 'h':
> > +        default:
> > +            print_help_and_exit(argv[0],
> > +                    c =3D=3D 'h' ? EXIT_SUCCESS : EXIT_FAILURE);
> > +        }
> > +    }
> > +
> > +    if (!fd_string) {
> > +        fprintf(stderr, "Unix file descriptor not present.\n");
> > +        print_help_and_exit(argv[0], EXIT_FAILURE);
> > +    }
> > +
> > +    unix_fd =3D atoi(fd_string);
> > +
> > +    if (!unix_fd) {
> > +        fprintf(stderr, "Unix file descriptor is invalid.\n");
> > +        return EXIT_FAILURE;
> > +    }
> > +
> > +    ebpf_rss_init(&ctx);
> > +    if (!ebpf_rss_load(&ctx)) {
> > +        fprintf(stderr, "Can't load ebpf.\n");
> > +        return EXIT_FAILURE;
> > +    }
> > +    fds[0] =3D ctx.program_fd;
> > +    fds[1] =3D ctx.map_configuration;
> > +
> > +    ret =3D send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);
> > +    if (ret < 0) {
> > +        fprintf(stderr, "Issue while sending fds: %s.\n", strerror(err=
no));
> > +    }
> > +
> > +    ebpf_rss_unload(&ctx);
> > +
> > +    return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> > +}
> > +
> > diff --git a/meson.build b/meson.build
> > index 257e51d91b..913aa1fee5 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disabled()
> >   endif
> >
> >   # libbpf
> > -libbpf =3D dependency('libbpf', required: get_option('bpf'), method: '=
pkg-config')
> > -if libbpf.found() and not cc.links('''
> > -   #include <bpf/libbpf.h>
> > -   int main(void)
> > -   {
> > -     bpf_object__destroy_skeleton(NULL);
> > -     return 0;
> > -   }''', dependencies: libbpf)
> > -  libbpf =3D not_found
> > -  if get_option('bpf').enabled()
> > -    error('libbpf skeleton test failed')
> > -  else
> > -    warning('libbpf skeleton test failed, disabling')
> > +libbpf =3D not_found
> > +if targetos =3D=3D 'linux'
> > +  libbpf =3D dependency('libbpf', required: get_option('bpf'), method:=
 'pkg-config')
> > +  if libbpf.found() and not cc.links('''
> > +    #include <bpf/libbpf.h>
> > +    int main(void)
> > +    {
> > +      bpf_object__destroy_skeleton(NULL);
>
>
> Do we need to test whether the bpf can do mmap() here?
>
> Thanks
>
>
> > +      return 0;
> > +    }''', dependencies: libbpf)
> > +    libbpf =3D not_found
> > +    if get_option('bpf').enabled()
> > +      error('libbpf skeleton test failed')
> > +    else
> > +      warning('libbpf skeleton test failed, disabling')
> > +    endif
> >     endif
> >   endif
> >
> > @@ -2423,6 +2426,14 @@ if have_tools
> >                  dependencies: [authz, crypto, io, qom, qemuutil,
> >                                 libcap_ng, mpathpersist],
> >                  install: true)
> > +
> > +    if libbpf.found()
> > +        executable('qemu-ebpf-rss-helper', files(
> > +                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf_rss.c'),
> > +                   dependencies: [qemuutil, libbpf, glib],
> > +                   install: true,
> > +                   install_dir: get_option('libexecdir'))
> > +    endif
> >     endif
> >
> >     if 'CONFIG_IVSHMEM' in config_host
>


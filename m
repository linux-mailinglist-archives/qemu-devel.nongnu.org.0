Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BC26A3A03
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 05:08:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWUnm-0008Pm-Kq; Sun, 26 Feb 2023 23:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pWUnk-0008Pd-Fy
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 23:07:48 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pWUni-0000lV-9T
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 23:07:48 -0500
Received: by mail-pf1-x42b.google.com with SMTP id y10so2707272pfi.8
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 20:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9EDgkI769QOO7mx0wfpwQiV07KSLLSeyL4o6sbfbpXw=;
 b=ssfuhdYb6k8KZ7gLeISGHBreVGTyR5vkqMu6n9AEJBS/455Md+giQfrfFvLYVl9BNU
 0PVl7aRdO8oxvyhkrIDJIjVshP4d0GrcFIbrCV703xNFYQ9c6da332amwRpsH1nUjAmh
 F1nzvycL6lDZv6tIi3EXa5nHo88AE+0WrR07sjNa+SdmLdUUbphFO4r3iwIpaluOa9xc
 SkyAwwrleJyo0QzOnt1tPOXi+6kHt/23JFSxdPJ8pYOBiKJqul+ovMggirop/CnIdJu/
 XrSIMYrZNT1cQG63U0E5nGJKrsSIh2p4i4fjk5UQTWhw+wNMUQ40vtcDDDvPKI3vJYYM
 8TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9EDgkI769QOO7mx0wfpwQiV07KSLLSeyL4o6sbfbpXw=;
 b=ASxFWgf6m7vyXHfEgTKoaACZbPnh8Qm4epryrvR7eTzpJpLRnDPoYLOmkODnyRTp0l
 nAQZiHYDpSQ6x64qYIAb4V+JlfDQLQ6NABrxBRwjvhRFAtWVWdq/G+K4iWg4KQZSC7v7
 kwCh1fIrUwKTG5pnpU62XXrJZAw3WCeKSfA1b0dkwyV72j4ZpxfkU+qidiSq3hnkSxqS
 kc99mAs+SRJAhJLjyxS5FnwU/jkQWQ4ZVLfJ5Z3nXcq5ifELdFVJ7y8dWTk4FCeeo+hs
 3S1b1CnRaC2SrOcxcZdx7RMPO9eMb7wPvggw2hs9O7AOIsJqggA2IagBkYp32vKSq1O+
 ctKw==
X-Gm-Message-State: AO0yUKUtlvkfADpTszE/4DNFwRypU2qB/UzWimIe8ytxMKRqE5ndaGHw
 3211LCCShCi4l5Y2KilslwEJpsgkA5TA47Ib6GqV4w==
X-Google-Smtp-Source: AK7set8kT8mrXxVyXfqhBAmmy+G7ImH0etqE1qFS2NHvHbW7/zneT32GnJQ70TcG48X3uosndB1KNV2nGrBs8hOcfgw=
X-Received: by 2002:a63:34c2:0:b0:4fb:982d:85ab with SMTP id
 b185-20020a6334c2000000b004fb982d85abmr5576973pga.12.1677470847472; Sun, 26
 Feb 2023 20:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-5-andrew@daynix.com>
 <Y/NDX9LvVQMoKJL+@redhat.com>
In-Reply-To: <Y/NDX9LvVQMoKJL+@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 27 Feb 2023 05:50:19 +0200
Message-ID: <CABcq3pGETfj6ViCa96+MFG3XJ5XbB3VokTrPGhAB1x189N-akw@mail.gmail.com>
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org, 
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=andrew@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Mon, Feb 20, 2023 at 11:54 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Sun, Feb 19, 2023 at 06:20:59PM +0200, Andrew Melnychenko wrote:
> > Helper program. Loads eBPF RSS program and maps and passes them through=
 unix socket.
> > Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.
> > Also, libbpf dependency for now is exclusively for Linux.
> > Libbpf is used for eBPF RSS steering, which is supported only by Linux =
TAP.
> > There is no reason yet to build eBPF loader and helper for non-Linux sy=
stems,
> > even if libbpf is present.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  ebpf/qemu-ebpf-rss-helper.c | 132 ++++++++++++++++++++++++++++++++++++
> >  meson.build                 |  37 ++++++----
> >  2 files changed, 156 insertions(+), 13 deletions(-)
> >  create mode 100644 ebpf/qemu-ebpf-rss-helper.c
> >
> > diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper.c
> > new file mode 100644
> > index 0000000000..348d26bcdd
> > --- /dev/null
> > +++ b/ebpf/qemu-ebpf-rss-helper.c
> > @@ -0,0 +1,132 @@
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
>
> Is there a reason for specifying GPL version 2 only ?
>
> Unless this has copied code from one of the existing GPLv2-only files
> in QEMU, the requirement (listed in LICENSE) is that new contributions
> will be GPLv2-or-later, except for a handful of sub-directories.
>

Yeah - I'll change it. Thank you.

>
>
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
> > +#include "qemu-ebpf-rss-helper-stamp.h"
> > +
> > +void QEMU_EBPF_RSS_HELPER_STAMP(void) {}
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
> > +    fds[2] =3D ctx.map_toeplitz_key;
> > +    fds[3] =3D ctx.map_indirections_table;
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
> > index b409912aed..6e6e2f3e40 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1632,19 +1632,22 @@ elif get_option('vduse_blk_export').disabled()
> >  endif
> >
> >  # libbpf
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
> > +      return 0;
> > +    }''', dependencies: libbpf)
> > +    libbpf =3D not_found
> > +    if get_option('bpf').enabled()
> > +      error('libbpf skeleton test failed')
> > +    else
> > +      warning('libbpf skeleton test failed, disabling')
> > +    endif
> >    endif
> >  endif
> >
> > @@ -3646,6 +3649,14 @@ if have_tools
> >                 dependencies: [authz, crypto, io, qom, qemuutil,
> >                                libcap_ng, mpathpersist],
> >                 install: true)
> > +
> > +    if libbpf.found()
> > +        executable('qemu-ebpf-rss-helper', files(
> > +                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf_rss.c'),
> > +                   dependencies: [qemuutil, libbpf, glib],
> > +                   install: true,
> > +                   install_dir: get_option('libexecdir'))
> > +    endif
> >    endif
> >
> >    if have_ivshmem
> > --
> > 2.39.1
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


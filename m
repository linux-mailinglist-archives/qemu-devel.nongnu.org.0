Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F18406039
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 01:48:33 +0200 (CEST)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOTmS-0003cs-HK
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 19:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mOTiF-00021s-3o
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:44:12 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:41827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mOTi7-0003Hu-Pl
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:44:06 -0400
Received: by mail-oi1-x22a.google.com with SMTP id 6so355621oiy.8
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 16:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mhuQ0DYvR7qEjU9DlPHnvDkO209UINRO+uGGvAEj0qw=;
 b=vSLgvP3jxx5Grd7Ws9CyfbdDZArICKfnLO0C56H3v4ef5dhybzldkB8Rj9RBIoJify
 OyMH9g3WyAnDLUJGLagkSUzeCZUcWlrrhseTtIIw7V/0UX9cZxu2tTZoPkM+5dd/GMz7
 r+TCTnxJLwGNMNDNGkfIwHnSZGvNdEj0LnmyJ3PSjiNXCni3FIhn2n/D4Ri7DySoNI6H
 yfGdesjrvQf9hCPp8/FZu/+QR/sIGHkW0wdq9Yfc4iEd5n/Ny4mmdphHDhY3p1uexe2R
 fFUsAhCvaEdTOCJVOE1XlEUc07/VV9Mh/kOMycX5wW+cMFAFsorDN+WvOHln30iiIpAd
 HRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mhuQ0DYvR7qEjU9DlPHnvDkO209UINRO+uGGvAEj0qw=;
 b=NEftPo/Ivs+LqqYks5nulw6NFOzqN5DmeG279nyYJueBaHQ1/YGIb1r5yh9vRUFq0a
 njgZfS6jMe889ZidhkEKI0IVSK/05zCrXbtYtW+7RfKQubjw9nkgIAEIpfdgO9lxaO2p
 W44rM5RrSJEJzOEAnV9GUko8SazmztLSOuqNWZTdcHCUAilYYXVfZWZBAwBSs1C02bZv
 urlE0lrFG3E4A+TsGCgDLd0y6zqTB2lf3w+dOqDbskKFecJK6eNSI3GlB/AJEQ8AFW/V
 TTeedjnbofYvfIbUz3IdCtmmbzwEx/NE70PWynS8HOhS8iXy68OVzQJZKplP5k1QIO7c
 iOgg==
X-Gm-Message-State: AOAM5337sKjPx5x2pgMVP/U0qxRXV58BwMCbhfs6HGuSkNtFxqd0k5j4
 WDazYMqSnaOaxUeu2SUTorytPzBVGIVqOQvvI0hmlXQ2ThI=
X-Google-Smtp-Source: ABdhPJwdH/dVoeWwRMr+l1Ul8+qRAXqaXdwcQKqZsC9kB6JHOkrQLnuH+IREEKf8f/xFjs2DYAgKQ5rMaQMSR+knPoA=
X-Received: by 2002:aca:5f03:: with SMTP id t3mr2090088oib.54.1631231042800;
 Thu, 09 Sep 2021 16:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-5-andrew@daynix.com>
 <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
 <CAOEp5OekBjFfwPEJ3JU-x0_wrwO9szApOk=kR3e7AKhiLqa9-w@mail.gmail.com>
 <38ea6b36-b968-02bf-b3a8-3d6393df31a5@redhat.com>
 <CAOEp5OcrwBJh=89wQ-eA0Z1MZpprYtLVvJSF1YrNPhu2kzqzCA@mail.gmail.com>
 <CACGkMEua49tvtz8xv63umSbjS1nSZy6dFhrfu13ytps4socVPw@mail.gmail.com>
 <CAOEp5Ocxuroqb2Ku74z+iBHEjGbot9wvrMSwxP7wAKOPWnPSJg@mail.gmail.com>
 <CACGkMEtK-XzC-jfPtV-fffRGeSFD9AbEhUu9VSdF+J+Ne_yhew@mail.gmail.com>
In-Reply-To: <CACGkMEtK-XzC-jfPtV-fffRGeSFD9AbEhUu9VSdF+J+Ne_yhew@mail.gmail.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Fri, 10 Sep 2021 02:43:50 +0300
Message-ID: <CAOEp5OfSQtRLH358dAJVfzEu4hVEYBmziAD3KT435++ROcK0og@mail.gmail.com>
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::22a;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x22a.google.com
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 9, 2021 at 4:16 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Sep 9, 2021 at 8:00 AM Yuri Benditovich
> <yuri.benditovich@daynix.com> wrote:
> >
> > On Wed, Sep 8, 2021 at 6:45 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Tue, Sep 7, 2021 at 6:40 PM Yuri Benditovich
> > > <yuri.benditovich@daynix.com> wrote:
> > > >
> > > > On Wed, Sep 1, 2021 at 9:42 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > > > >
> > > > >
> > > > > =E5=9C=A8 2021/8/31 =E4=B8=8A=E5=8D=881:07, Yuri Benditovich =E5=
=86=99=E9=81=93:
> > > > > > On Fri, Aug 20, 2021 at 6:41 AM Jason Wang <jasowang@redhat.com=
> wrote:
> > > > > >>
> > > > > >> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenk=
o =E5=86=99=E9=81=93:
> > > > > >>> Helper program. Loads eBPF RSS program and maps and passes th=
em through unix socket.
> > > > > >>> Libvirt may launch this helper and pass eBPF fds to qemu virt=
io-net.
> > > > > >>
> > > > > >> I wonder if this can be done as helper for TAP/bridge.
> > > > > >>
> > > > > >> E.g it's the qemu to launch those helper with set-uid.
> > > > > >>
> > > > > >> Then libvirt won't even need to care about that?
> > > > > >>
> > > > > > There are pros and cons for such a solution with set-uid.
> > > > > >  From my point of view one of the cons is that set-uid is effic=
ient
> > > > > > only at install time so the coexistence of different qemu build=
s (and
> > > > > > different helpers for each one) is kind of problematic.
> > > > > > With the current solution this does not present any problem: th=
e
> > > > > > developer can have several different builds, each one automatic=
ally
> > > > > > has its own helper and there is no conflict between these build=
s and
> > > > > > between these builds and installed qemu package. Changing the
> > > > > > 'emulator' in the libvirt profile automatically brings the prop=
er
> > > > > > helper to work.
> > > > >
> > > > >
> > > > > I'm not sure I get you here. We can still have default/sample hel=
per to
> > > > > make sure it works for different builds.
> > > > >
> > > > > If we can avoid the involvement of libvirt, that would be better.
> > > >
> > > > Hi Jason,
> > > >
> > > > Indeed I did not get the idea, can you please explain it in more
> > > > details (as detailed as possible to avoid future misunderstanding),
> > > > especially how exactly we can use the set-uid and what is the 'defa=
ult' helper.
> > > > We also would prefer to do everything from qemu but we do not see h=
ow
> > > > we can do that.
> > >
> > >
> > Some more questions to understand the idea better:
> > > Something like:
> > >
> > > 1) -netdev tap,rss_helper=3D/path/to/name
> >
> > So, on each editing of 'emulator' in the xml  the helper path should
> > be set manually or be default?
>
> It could done manually, or we can have a default path.
>
> >
> > > 2) having a sample/default helper implemented in Qemu
> >
> > Does it mean the default helper is the code in the qemu (without
> > running additional executable, like it does today)
>
> Yes.
If the "default helper" is just a keyword and it is like what we have
today (i.e. part of qemu) it can't work under libvirt and should never
be used by libvirt.
>
>  or this is qemu
> > itself with dedicated command line?
> > As far as I remember Daniel had strong objections of ever running qemu
> > with capabilities
>
> Qemu won't run with capabilities but the helper.
So under libvirt the helper is always separate executable and not
"default helper"

>
> >
> > > 3) we can introduce something special path like "default", then if
> > > -netdev tap,rss_helper=3D"default" is specified, qemu will use the
> > > sample helper
> >
> > Probably this is not so important but the rss helper and rss in
> > general has no relation to netdev, much more they are related to
> > virtio-net
>
> So I think the reason for this is that we currently only support
> eBPF/RSS for tap.

This is just because only tap supports respective ioctls.

>
> >
> > >
> > > So we have:
> > > 1) set set-uid for the helper
> > Who and when does set-uid to the helper binary? Only installer or
> > libvirt can do that, correct?
>
> Yes, it could be done the installer, or other system provision tools.

So this changes the rule of the game: currently libvirt runs helpers
that require privileges and qemu runs helpers that do not require any
privileges (like TPM).
If we follow your suggestion - only for RSS we will create the helper
that must be used with set-uid.
Who are stakeholders we need to have a consensus with?

>
> >
> > > 2) libvirt may just choose to launch the default helper
> > All this discussion is to avoid launching the helper from libvirt, corr=
ect?
>
> Sorry, it's a typo. I meant, libvirt launch qemu, and then qemu will
> launch the helper.
>
> Thanks
>
> >
> > >
> > > >
> > > > Our main points (what should be addressed):
> > > > - qemu should be able to load ebpf and use the maps when it runs fr=
om
> > > > libvirt (without special caps) and standalone (with caps)
> > >
> > > This is solved by leaving the privileged operations to the helper wit=
h set-uid.
> > >
> > > > - it is possible that there are different qemu builds on the machin=
e,
> > > > one of them might be installed, their ebpf's might be different and
> > > > the interface between qemu and ebpf (exact content of maps and numb=
er
> > > > of maps)
> > >
> > > We can use different helpers in this way.
> > >
> > > > - qemu configures the RSS dynamically according to the commands
> > > > provided by the guest
> > >
> > > Consider we decided to use mmap() based maps, this is not an issue.
> > >
> > > Or am I missing something?
> > >
> > > Thanks
> > >
> > > >
> > > > Thanks in advance
> > > > Yuri
> > > >
> > > > >
> > > > > Thanks
> > > > >
> > > > >
> > > > > >
> > > > > >>> Also, libbpf dependency now exclusively for Linux.
> > > > > >>> Libbpf is used for eBPF RSS steering, which is supported only=
 by Linux TAP.
> > > > > >>> There is no reason yet to build eBPF loader and helper for no=
n Linux systems,
> > > > > >>> even if libbpf is present.
> > > > > >>>
> > > > > >>> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > > > > >>> ---
> > > > > >>>    ebpf/qemu-ebpf-rss-helper.c | 130 ++++++++++++++++++++++++=
++++++++++++
> > > > > >>>    meson.build                 |  37 ++++++----
> > > > > >>>    2 files changed, 154 insertions(+), 13 deletions(-)
> > > > > >>>    create mode 100644 ebpf/qemu-ebpf-rss-helper.c
> > > > > >>>
> > > > > >>> diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss=
-helper.c
> > > > > >>> new file mode 100644
> > > > > >>> index 0000000000..fe68758f57
> > > > > >>> --- /dev/null
> > > > > >>> +++ b/ebpf/qemu-ebpf-rss-helper.c
> > > > > >>> @@ -0,0 +1,130 @@
> > > > > >>> +/*
> > > > > >>> + * eBPF RSS Helper
> > > > > >>> + *
> > > > > >>> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > > > > >>> + *
> > > > > >>> + * Authors:
> > > > > >>> + *  Andrew Melnychenko <andrew@daynix.com>
> > > > > >>> + *
> > > > > >>> + * This work is licensed under the terms of the GNU GPL, ver=
sion 2.  See
> > > > > >>> + * the COPYING file in the top-level directory.
> > > > > >>> + *
> > > > > >>> + * Description: This is helper program for libvirtd.
> > > > > >>> + *              It loads eBPF RSS program and passes fds thr=
ough unix socket.
> > > > > >>> + *              Built by meson, target - 'qemu-ebpf-rss-help=
er'.
> > > > > >>> + */
> > > > > >>> +
> > > > > >>> +#include <stdio.h>
> > > > > >>> +#include <stdint.h>
> > > > > >>> +#include <stdlib.h>
> > > > > >>> +#include <stdbool.h>
> > > > > >>> +#include <getopt.h>
> > > > > >>> +#include <memory.h>
> > > > > >>> +#include <errno.h>
> > > > > >>> +#include <sys/socket.h>
> > > > > >>> +
> > > > > >>> +#include "ebpf_rss.h"
> > > > > >>> +
> > > > > >>> +#include "qemu-helper-stamp.h"
> > > > > >>> +
> > > > > >>> +void QEMU_HELPER_STAMP(void) {}
> > > > > >>> +
> > > > > >>> +static int send_fds(int socket, int *fds, int n)
> > > > > >>> +{
> > > > > >>> +    struct msghdr msg =3D {};
> > > > > >>> +    struct cmsghdr *cmsg =3D NULL;
> > > > > >>> +    char buf[CMSG_SPACE(n * sizeof(int))];
> > > > > >>> +    char dummy_buffer =3D 0;
> > > > > >>> +    struct iovec io =3D { .iov_base =3D &dummy_buffer,
> > > > > >>> +                        .iov_len =3D sizeof(dummy_buffer) };
> > > > > >>> +
> > > > > >>> +    memset(buf, 0, sizeof(buf));
> > > > > >>> +
> > > > > >>> +    msg.msg_iov =3D &io;
> > > > > >>> +    msg.msg_iovlen =3D 1;
> > > > > >>> +    msg.msg_control =3D buf;
> > > > > >>> +    msg.msg_controllen =3D sizeof(buf);
> > > > > >>> +
> > > > > >>> +    cmsg =3D CMSG_FIRSTHDR(&msg);
> > > > > >>> +    cmsg->cmsg_level =3D SOL_SOCKET;
> > > > > >>> +    cmsg->cmsg_type =3D SCM_RIGHTS;
> > > > > >>> +    cmsg->cmsg_len =3D CMSG_LEN(n * sizeof(int));
> > > > > >>> +
> > > > > >>> +    memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));
> > > > > >>> +
> > > > > >>> +    return sendmsg(socket, &msg, 0);
> > > > > >>> +}
> > > > > >>> +
> > > > > >>> +static void print_help_and_exit(const char *prog, int exitco=
de)
> > > > > >>> +{
> > > > > >>> +    fprintf(stderr, "%s - load eBPF RSS program for qemu and=
 pass eBPF fds"
> > > > > >>> +            " through unix socket.\n", prog);
> > > > > >>> +    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket fi=
le descriptor"
> > > > > >>> +            " used to pass eBPF fds.\n");
> > > > > >>> +    fprintf(stderr, "\t--help, -h - this help.\n");
> > > > > >>> +    exit(exitcode);
> > > > > >>> +}
> > > > > >>> +
> > > > > >>> +int main(int argc, char **argv)
> > > > > >>> +{
> > > > > >>> +    char *fd_string =3D NULL;
> > > > > >>> +    int unix_fd =3D 0;
> > > > > >>> +    struct EBPFRSSContext ctx =3D {};
> > > > > >>> +    int fds[EBPF_RSS_MAX_FDS] =3D {};
> > > > > >>> +    int ret =3D -1;
> > > > > >>> +
> > > > > >>> +    for (;;) {
> > > > > >>> +        int c;
> > > > > >>> +        static struct option long_options[] =3D {
> > > > > >>> +                {"help",  no_argument, 0, 'h'},
> > > > > >>> +                {"fd",  required_argument, 0, 'f'},
> > > > > >>> +                {0, 0, 0, 0}
> > > > > >>> +        };
> > > > > >>> +        c =3D getopt_long(argc, argv, "hf:",
> > > > > >>> +                long_options, NULL);
> > > > > >>> +
> > > > > >>> +        if (c =3D=3D -1) {
> > > > > >>> +            break;
> > > > > >>> +        }
> > > > > >>> +
> > > > > >>> +        switch (c) {
> > > > > >>> +        case 'f':
> > > > > >>> +            fd_string =3D optarg;
> > > > > >>> +            break;
> > > > > >>> +        case 'h':
> > > > > >>> +        default:
> > > > > >>> +            print_help_and_exit(argv[0],
> > > > > >>> +                    c =3D=3D 'h' ? EXIT_SUCCESS : EXIT_FAILU=
RE);
> > > > > >>> +        }
> > > > > >>> +    }
> > > > > >>> +
> > > > > >>> +    if (!fd_string) {
> > > > > >>> +        fprintf(stderr, "Unix file descriptor not present.\n=
");
> > > > > >>> +        print_help_and_exit(argv[0], EXIT_FAILURE);
> > > > > >>> +    }
> > > > > >>> +
> > > > > >>> +    unix_fd =3D atoi(fd_string);
> > > > > >>> +
> > > > > >>> +    if (!unix_fd) {
> > > > > >>> +        fprintf(stderr, "Unix file descriptor is invalid.\n"=
);
> > > > > >>> +        return EXIT_FAILURE;
> > > > > >>> +    }
> > > > > >>> +
> > > > > >>> +    ebpf_rss_init(&ctx);
> > > > > >>> +    if (!ebpf_rss_load(&ctx)) {
> > > > > >>> +        fprintf(stderr, "Can't load ebpf.\n");
> > > > > >>> +        return EXIT_FAILURE;
> > > > > >>> +    }
> > > > > >>> +    fds[0] =3D ctx.program_fd;
> > > > > >>> +    fds[1] =3D ctx.map_configuration;
> > > > > >>> +
> > > > > >>> +    ret =3D send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);
> > > > > >>> +    if (ret < 0) {
> > > > > >>> +        fprintf(stderr, "Issue while sending fds: %s.\n", st=
rerror(errno));
> > > > > >>> +    }
> > > > > >>> +
> > > > > >>> +    ebpf_rss_unload(&ctx);
> > > > > >>> +
> > > > > >>> +    return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> > > > > >>> +}
> > > > > >>> +
> > > > > >>> diff --git a/meson.build b/meson.build
> > > > > >>> index 257e51d91b..913aa1fee5 100644
> > > > > >>> --- a/meson.build
> > > > > >>> +++ b/meson.build
> > > > > >>> @@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disab=
led()
> > > > > >>>    endif
> > > > > >>>
> > > > > >>>    # libbpf
> > > > > >>> -libbpf =3D dependency('libbpf', required: get_option('bpf'),=
 method: 'pkg-config')
> > > > > >>> -if libbpf.found() and not cc.links('''
> > > > > >>> -   #include <bpf/libbpf.h>
> > > > > >>> -   int main(void)
> > > > > >>> -   {
> > > > > >>> -     bpf_object__destroy_skeleton(NULL);
> > > > > >>> -     return 0;
> > > > > >>> -   }''', dependencies: libbpf)
> > > > > >>> -  libbpf =3D not_found
> > > > > >>> -  if get_option('bpf').enabled()
> > > > > >>> -    error('libbpf skeleton test failed')
> > > > > >>> -  else
> > > > > >>> -    warning('libbpf skeleton test failed, disabling')
> > > > > >>> +libbpf =3D not_found
> > > > > >>> +if targetos =3D=3D 'linux'
> > > > > >>> +  libbpf =3D dependency('libbpf', required: get_option('bpf'=
), method: 'pkg-config')
> > > > > >>> +  if libbpf.found() and not cc.links('''
> > > > > >>> +    #include <bpf/libbpf.h>
> > > > > >>> +    int main(void)
> > > > > >>> +    {
> > > > > >>> +      bpf_object__destroy_skeleton(NULL);
> > > > > >>
> > > > > >> Do we need to test whether the bpf can do mmap() here?
> > > > > >>
> > > > > >> Thanks
> > > > > >>
> > > > > >>
> > > > > >>> +      return 0;
> > > > > >>> +    }''', dependencies: libbpf)
> > > > > >>> +    libbpf =3D not_found
> > > > > >>> +    if get_option('bpf').enabled()
> > > > > >>> +      error('libbpf skeleton test failed')
> > > > > >>> +    else
> > > > > >>> +      warning('libbpf skeleton test failed, disabling')
> > > > > >>> +    endif
> > > > > >>>      endif
> > > > > >>>    endif
> > > > > >>>
> > > > > >>> @@ -2423,6 +2426,14 @@ if have_tools
> > > > > >>>                   dependencies: [authz, crypto, io, qom, qemu=
util,
> > > > > >>>                                  libcap_ng, mpathpersist],
> > > > > >>>                   install: true)
> > > > > >>> +
> > > > > >>> +    if libbpf.found()
> > > > > >>> +        executable('qemu-ebpf-rss-helper', files(
> > > > > >>> +                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf=
_rss.c'),
> > > > > >>> +                   dependencies: [qemuutil, libbpf, glib],
> > > > > >>> +                   install: true,
> > > > > >>> +                   install_dir: get_option('libexecdir'))
> > > > > >>> +    endif
> > > > > >>>      endif
> > > > > >>>
> > > > > >>>      if 'CONFIG_IVSHMEM' in config_host
> > > > >
> > > >
> > >
> >
>


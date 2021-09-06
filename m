Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A60401DCD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:51:43 +0200 (CEST)
Received: from localhost ([::1]:36200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGuM-0007cf-7b
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mNGtS-0006xX-1t
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:50:46 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:43712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mNGtP-00011c-DG
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:50:45 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so9234641ott.10
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5FyZ9p0Ahyg4eHXlD8BWwf1TqNfbeAa1qVc9AVmbxNE=;
 b=yXUUapXPLJ1zaoiXLEvFiDE7bbVH886VqM9Upa4qGQg4dahs9LKirDS97+hJfJ+OPI
 vyHZ+hfoc6zSviJCRks5xbSvR+sOZJV4VTPpcPCFuMGTsTWEOE33ijE8x7TONA56fWHy
 +8ndcBQT2y4Yt404pXLQRSmBmZL0U5pxJtuGGTj7gMvTr55GuL2z8KDV39LQAKTfD8M8
 5EXlAtNVTS4+PEjqPH2ukMYnX0o+i4YEN/rnv0TlvZl30Q59wKJhIXQOE36k7CJhRzUW
 RSDtxVoWVhfptOVb0Wy3PLNA0/o33DtPrXRvHzXpi84xU1EpwOsZCnrM+4G+/5VbnXs1
 TWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5FyZ9p0Ahyg4eHXlD8BWwf1TqNfbeAa1qVc9AVmbxNE=;
 b=nstYUDAWxkjO0mzfR/e3tXJdiuEmaJkP/MEwH1ucRdtAg7yoRTRjX56VTlc9BX8iLG
 wjS6j+PJ3iCoEoZEkKCR95YL7Fdb8pnnka+T0h48Oxz+96hYlqe8NXNl68AMZTJ7w0u9
 K2sPaVsN6xPV8h5/ddjp2ogjz4KsE8Fip+nO748coY2RpRCICUAzn85gBG71wfivC9Ev
 G5aghyeU6mePC9dRy3bkkMm3gMbNzlDxstxULB8U55N6Bd1BE5XhRVjVk7Kxlfs0ZQFK
 zYOOKSoWfHtn7/DSqeFrnmcnttpLtwV/8kFz47mIawzPAiEuyHSWfQbj5tRpIyOSHF95
 Xyng==
X-Gm-Message-State: AOAM530X3iiwpL3PtR62R+Tc6hBENJNKE9GHz3cQc1BqPvDpstLnNjeH
 AmvKUvRkLYJFrKk5hmK3k+zsAd4FgxZa6x+ltEYrLQ==
X-Google-Smtp-Source: ABdhPJwqVX7WkVQAgzpHK14HWTkKpX27zaXqC2p63TJx1s7RfZh7RbCWGliMA/VH3mumgbtJicWop1pmkPkD7qTHPdE=
X-Received: by 2002:a9d:718a:: with SMTP id o10mr11217424otj.376.1630943441338; 
 Mon, 06 Sep 2021 08:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-5-andrew@daynix.com>
 <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
 <CAOEp5OekBjFfwPEJ3JU-x0_wrwO9szApOk=kR3e7AKhiLqa9-w@mail.gmail.com>
 <38ea6b36-b968-02bf-b3a8-3d6393df31a5@redhat.com>
In-Reply-To: <38ea6b36-b968-02bf-b3a8-3d6393df31a5@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 6 Sep 2021 18:50:30 +0300
Message-ID: <CABcq3pGuqjBY_uqs3BthXS4oSViC=kP16sUbeqLFKJAoQWq6Xw@mail.gmail.com>
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000078595105cb559c99"
Received-SPF: none client-ip=2607:f8b0:4864:20::32e;
 envelope-from=andrew@daynix.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078595105cb559c99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> I think it's for back-compatibility.
>
> E.g current codes works without mmap(), and user will surprise that it
> wont' work after upgrading their qemu.
>
Well, the current code would require additional capabilities with
"kernel.unprivileged_bpf_disabled=3D1", which may be possible on RedHat
systems.
Technically we may have mmap test which will show that mmap for
BPF_MAP_TYPE_ARRAY works, but on the target system, we will know it only in
runtime.
If I'm not mistaken, mmap for BPF_MAP_TYPE_ARRAY was added before kernel
5.4 and our bpf program requires kernel 5.8+.
So, there are no reasons to add bpf() update map as a fallback for mmap().

On Wed, Sep 1, 2021 at 9:42 AM Jason Wang <jasowang@redhat.com> wrote:

>
> =E5=9C=A8 2021/8/31 =E4=B8=8A=E5=8D=881:07, Yuri Benditovich =E5=86=99=E9=
=81=93:
> > On Fri, Aug 20, 2021 at 6:41 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=86=
=99=E9=81=93:
> >>> Helper program. Loads eBPF RSS program and maps and passes them
> through unix socket.
> >>> Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.
> >>
> >> I wonder if this can be done as helper for TAP/bridge.
> >>
> >> E.g it's the qemu to launch those helper with set-uid.
> >>
> >> Then libvirt won't even need to care about that?
> >>
> > There are pros and cons for such a solution with set-uid.
> >  From my point of view one of the cons is that set-uid is efficient
> > only at install time so the coexistence of different qemu builds (and
> > different helpers for each one) is kind of problematic.
> > With the current solution this does not present any problem: the
> > developer can have several different builds, each one automatically
> > has its own helper and there is no conflict between these builds and
> > between these builds and installed qemu package. Changing the
> > 'emulator' in the libvirt profile automatically brings the proper
> > helper to work.
>
>
> I'm not sure I get you here. We can still have default/sample helper to
> make sure it works for different builds.
>
> If we can avoid the involvement of libvirt, that would be better.
>
> Thanks
>
>
> >
> >>> Also, libbpf dependency now exclusively for Linux.
> >>> Libbpf is used for eBPF RSS steering, which is supported only by Linu=
x
> TAP.
> >>> There is no reason yet to build eBPF loader and helper for non Linux
> systems,
> >>> even if libbpf is present.
> >>>
> >>> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> >>> ---
> >>>    ebpf/qemu-ebpf-rss-helper.c | 130
> ++++++++++++++++++++++++++++++++++++
> >>>    meson.build                 |  37 ++++++----
> >>>    2 files changed, 154 insertions(+), 13 deletions(-)
> >>>    create mode 100644 ebpf/qemu-ebpf-rss-helper.c
> >>>
> >>> diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper.=
c
> >>> new file mode 100644
> >>> index 0000000000..fe68758f57
> >>> --- /dev/null
> >>> +++ b/ebpf/qemu-ebpf-rss-helper.c
> >>> @@ -0,0 +1,130 @@
> >>> +/*
> >>> + * eBPF RSS Helper
> >>> + *
> >>> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> >>> + *
> >>> + * Authors:
> >>> + *  Andrew Melnychenko <andrew@daynix.com>
> >>> + *
> >>> + * This work is licensed under the terms of the GNU GPL, version 2.
> See
> >>> + * the COPYING file in the top-level directory.
> >>> + *
> >>> + * Description: This is helper program for libvirtd.
> >>> + *              It loads eBPF RSS program and passes fds through uni=
x
> socket.
> >>> + *              Built by meson, target - 'qemu-ebpf-rss-helper'.
> >>> + */
> >>> +
> >>> +#include <stdio.h>
> >>> +#include <stdint.h>
> >>> +#include <stdlib.h>
> >>> +#include <stdbool.h>
> >>> +#include <getopt.h>
> >>> +#include <memory.h>
> >>> +#include <errno.h>
> >>> +#include <sys/socket.h>
> >>> +
> >>> +#include "ebpf_rss.h"
> >>> +
> >>> +#include "qemu-helper-stamp.h"
> >>> +
> >>> +void QEMU_HELPER_STAMP(void) {}
> >>> +
> >>> +static int send_fds(int socket, int *fds, int n)
> >>> +{
> >>> +    struct msghdr msg =3D {};
> >>> +    struct cmsghdr *cmsg =3D NULL;
> >>> +    char buf[CMSG_SPACE(n * sizeof(int))];
> >>> +    char dummy_buffer =3D 0;
> >>> +    struct iovec io =3D { .iov_base =3D &dummy_buffer,
> >>> +                        .iov_len =3D sizeof(dummy_buffer) };
> >>> +
> >>> +    memset(buf, 0, sizeof(buf));
> >>> +
> >>> +    msg.msg_iov =3D &io;
> >>> +    msg.msg_iovlen =3D 1;
> >>> +    msg.msg_control =3D buf;
> >>> +    msg.msg_controllen =3D sizeof(buf);
> >>> +
> >>> +    cmsg =3D CMSG_FIRSTHDR(&msg);
> >>> +    cmsg->cmsg_level =3D SOL_SOCKET;
> >>> +    cmsg->cmsg_type =3D SCM_RIGHTS;
> >>> +    cmsg->cmsg_len =3D CMSG_LEN(n * sizeof(int));
> >>> +
> >>> +    memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));
> >>> +
> >>> +    return sendmsg(socket, &msg, 0);
> >>> +}
> >>> +
> >>> +static void print_help_and_exit(const char *prog, int exitcode)
> >>> +{
> >>> +    fprintf(stderr, "%s - load eBPF RSS program for qemu and pass
> eBPF fds"
> >>> +            " through unix socket.\n", prog);
> >>> +    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket file
> descriptor"
> >>> +            " used to pass eBPF fds.\n");
> >>> +    fprintf(stderr, "\t--help, -h - this help.\n");
> >>> +    exit(exitcode);
> >>> +}
> >>> +
> >>> +int main(int argc, char **argv)
> >>> +{
> >>> +    char *fd_string =3D NULL;
> >>> +    int unix_fd =3D 0;
> >>> +    struct EBPFRSSContext ctx =3D {};
> >>> +    int fds[EBPF_RSS_MAX_FDS] =3D {};
> >>> +    int ret =3D -1;
> >>> +
> >>> +    for (;;) {
> >>> +        int c;
> >>> +        static struct option long_options[] =3D {
> >>> +                {"help",  no_argument, 0, 'h'},
> >>> +                {"fd",  required_argument, 0, 'f'},
> >>> +                {0, 0, 0, 0}
> >>> +        };
> >>> +        c =3D getopt_long(argc, argv, "hf:",
> >>> +                long_options, NULL);
> >>> +
> >>> +        if (c =3D=3D -1) {
> >>> +            break;
> >>> +        }
> >>> +
> >>> +        switch (c) {
> >>> +        case 'f':
> >>> +            fd_string =3D optarg;
> >>> +            break;
> >>> +        case 'h':
> >>> +        default:
> >>> +            print_help_and_exit(argv[0],
> >>> +                    c =3D=3D 'h' ? EXIT_SUCCESS : EXIT_FAILURE);
> >>> +        }
> >>> +    }
> >>> +
> >>> +    if (!fd_string) {
> >>> +        fprintf(stderr, "Unix file descriptor not present.\n");
> >>> +        print_help_and_exit(argv[0], EXIT_FAILURE);
> >>> +    }
> >>> +
> >>> +    unix_fd =3D atoi(fd_string);
> >>> +
> >>> +    if (!unix_fd) {
> >>> +        fprintf(stderr, "Unix file descriptor is invalid.\n");
> >>> +        return EXIT_FAILURE;
> >>> +    }
> >>> +
> >>> +    ebpf_rss_init(&ctx);
> >>> +    if (!ebpf_rss_load(&ctx)) {
> >>> +        fprintf(stderr, "Can't load ebpf.\n");
> >>> +        return EXIT_FAILURE;
> >>> +    }
> >>> +    fds[0] =3D ctx.program_fd;
> >>> +    fds[1] =3D ctx.map_configuration;
> >>> +
> >>> +    ret =3D send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);
> >>> +    if (ret < 0) {
> >>> +        fprintf(stderr, "Issue while sending fds: %s.\n",
> strerror(errno));
> >>> +    }
> >>> +
> >>> +    ebpf_rss_unload(&ctx);
> >>> +
> >>> +    return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> >>> +}
> >>> +
> >>> diff --git a/meson.build b/meson.build
> >>> index 257e51d91b..913aa1fee5 100644
> >>> --- a/meson.build
> >>> +++ b/meson.build
> >>> @@ -1033,19 +1033,22 @@ if not get_option('fuse_lseek').disabled()
> >>>    endif
> >>>
> >>>    # libbpf
> >>> -libbpf =3D dependency('libbpf', required: get_option('bpf'), method:
> 'pkg-config')
> >>> -if libbpf.found() and not cc.links('''
> >>> -   #include <bpf/libbpf.h>
> >>> -   int main(void)
> >>> -   {
> >>> -     bpf_object__destroy_skeleton(NULL);
> >>> -     return 0;
> >>> -   }''', dependencies: libbpf)
> >>> -  libbpf =3D not_found
> >>> -  if get_option('bpf').enabled()
> >>> -    error('libbpf skeleton test failed')
> >>> -  else
> >>> -    warning('libbpf skeleton test failed, disabling')
> >>> +libbpf =3D not_found
> >>> +if targetos =3D=3D 'linux'
> >>> +  libbpf =3D dependency('libbpf', required: get_option('bpf'), metho=
d:
> 'pkg-config')
> >>> +  if libbpf.found() and not cc.links('''
> >>> +    #include <bpf/libbpf.h>
> >>> +    int main(void)
> >>> +    {
> >>> +      bpf_object__destroy_skeleton(NULL);
> >>
> >> Do we need to test whether the bpf can do mmap() here?
> >>
> >> Thanks
> >>
> >>
> >>> +      return 0;
> >>> +    }''', dependencies: libbpf)
> >>> +    libbpf =3D not_found
> >>> +    if get_option('bpf').enabled()
> >>> +      error('libbpf skeleton test failed')
> >>> +    else
> >>> +      warning('libbpf skeleton test failed, disabling')
> >>> +    endif
> >>>      endif
> >>>    endif
> >>>
> >>> @@ -2423,6 +2426,14 @@ if have_tools
> >>>                   dependencies: [authz, crypto, io, qom, qemuutil,
> >>>                                  libcap_ng, mpathpersist],
> >>>                   install: true)
> >>> +
> >>> +    if libbpf.found()
> >>> +        executable('qemu-ebpf-rss-helper', files(
> >>> +                   'ebpf/qemu-ebpf-rss-helper.c', 'ebpf/ebpf_rss.c')=
,
> >>> +                   dependencies: [qemuutil, libbpf, glib],
> >>> +                   install: true,
> >>> +                   install_dir: get_option('libexecdir'))
> >>> +    endif
> >>>      endif
> >>>
> >>>      if 'CONFIG_IVSHMEM' in config_host
>
>

--00000000000078595105cb559c99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div>I think it&#39;s for back-compatibility.<br>
<br>
E.g current codes works without mmap(), and user will surprise that it <br>
wont&#39; work after upgrading their qemu.</div></blockquote><div>Well, the=
 current code would require additional capabilities with &quot;kernel.unpri=
vileged_bpf_disabled=3D1&quot;, which may be possible on RedHat systems.</d=
iv><div>Technically we may have mmap test which will show that mmap for BPF=
_MAP_TYPE_ARRAY works, but on the target system, we will know it only in ru=
ntime.</div><div>If I&#39;m not mistaken, mmap for BPF_MAP_TYPE_ARRAY was a=
dded before kernel 5.4 and our bpf program requires kernel 5.8+.</div><div>=
So, there are no reasons to add bpf() update map as a fallback for mmap().<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Sep 1, 2021 at 9:42 AM Jason Wang &lt;<a href=3D"mailto:ja=
sowang@redhat.com">jasowang@redhat.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2021/8/31 =E4=B8=8A=E5=8D=881:07, Yuri Benditovich =E5=86=99=E9=
=81=93:<br>
&gt; On Fri, Aug 20, 2021 at 6:41 AM Jason Wang &lt;<a href=3D"mailto:jasow=
ang@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =
=E5=86=99=E9=81=93:<br>
&gt;&gt;&gt; Helper program. Loads eBPF RSS program and maps and passes the=
m through unix socket.<br>
&gt;&gt;&gt; Libvirt may launch this helper and pass eBPF fds to qemu virti=
o-net.<br>
&gt;&gt;<br>
&gt;&gt; I wonder if this can be done as helper for TAP/bridge.<br>
&gt;&gt;<br>
&gt;&gt; E.g it&#39;s the qemu to launch those helper with set-uid.<br>
&gt;&gt;<br>
&gt;&gt; Then libvirt won&#39;t even need to care about that?<br>
&gt;&gt;<br>
&gt; There are pros and cons for such a solution with set-uid.<br>
&gt;=C2=A0 From my point of view one of the cons is that set-uid is efficie=
nt<br>
&gt; only at install time so the coexistence of different qemu builds (and<=
br>
&gt; different helpers for each one) is kind of problematic.<br>
&gt; With the current solution this does not present any problem: the<br>
&gt; developer can have several different builds, each one automatically<br=
>
&gt; has its own helper and there is no conflict between these builds and<b=
r>
&gt; between these builds and installed qemu package. Changing the<br>
&gt; &#39;emulator&#39; in the libvirt profile automatically brings the pro=
per<br>
&gt; helper to work.<br>
<br>
<br>
I&#39;m not sure I get you here. We can still have default/sample helper to=
 <br>
make sure it works for different builds.<br>
<br>
If we can avoid the involvement of libvirt, that would be better.<br>
<br>
Thanks<br>
<br>
<br>
&gt;<br>
&gt;&gt;&gt; Also, libbpf dependency now exclusively for Linux.<br>
&gt;&gt;&gt; Libbpf is used for eBPF RSS steering, which is supported only =
by Linux TAP.<br>
&gt;&gt;&gt; There is no reason yet to build eBPF loader and helper for non=
 Linux systems,<br>
&gt;&gt;&gt; even if libbpf is present.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew=
@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 ebpf/qemu-ebpf-rss-helper.c | 130 +++++++++++++++=
+++++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 37 ++++++----<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 154 insertions(+), 13 deletions(=
-)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644 ebpf/qemu-ebpf-rss-helper.c<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-=
helper.c<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000000..fe68758f57<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/ebpf/qemu-ebpf-rss-helper.c<br>
&gt;&gt;&gt; @@ -0,0 +1,130 @@<br>
&gt;&gt;&gt; +/*<br>
&gt;&gt;&gt; + * eBPF RSS Helper<br>
&gt;&gt;&gt; + *<br>
&gt;&gt;&gt; + * Developed by Daynix Computing LTD (<a href=3D"http://www.d=
aynix.com" rel=3D"noreferrer" target=3D"_blank">http://www.daynix.com</a>)<=
br>
&gt;&gt;&gt; + *<br>
&gt;&gt;&gt; + * Authors:<br>
&gt;&gt;&gt; + *=C2=A0 Andrew Melnychenko &lt;<a href=3D"mailto:andrew@dayn=
ix.com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt;&gt;&gt; + *<br>
&gt;&gt;&gt; + * This work is licensed under the terms of the GNU GPL, vers=
ion 2.=C2=A0 See<br>
&gt;&gt;&gt; + * the COPYING file in the top-level directory.<br>
&gt;&gt;&gt; + *<br>
&gt;&gt;&gt; + * Description: This is helper program for libvirtd.<br>
&gt;&gt;&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 It loads e=
BPF RSS program and passes fds through unix socket.<br>
&gt;&gt;&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Built by m=
eson, target - &#39;qemu-ebpf-rss-helper&#39;.<br>
&gt;&gt;&gt; + */<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +#include &lt;stdio.h&gt;<br>
&gt;&gt;&gt; +#include &lt;stdint.h&gt;<br>
&gt;&gt;&gt; +#include &lt;stdlib.h&gt;<br>
&gt;&gt;&gt; +#include &lt;stdbool.h&gt;<br>
&gt;&gt;&gt; +#include &lt;getopt.h&gt;<br>
&gt;&gt;&gt; +#include &lt;memory.h&gt;<br>
&gt;&gt;&gt; +#include &lt;errno.h&gt;<br>
&gt;&gt;&gt; +#include &lt;sys/socket.h&gt;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +#include &quot;ebpf_rss.h&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +#include &quot;qemu-helper-stamp.h&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +void QEMU_HELPER_STAMP(void) {}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +static int send_fds(int socket, int *fds, int n)<br>
&gt;&gt;&gt; +{<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 struct msghdr msg =3D {};<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 struct cmsghdr *cmsg =3D NULL;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 char buf[CMSG_SPACE(n * sizeof(int))];<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 char dummy_buffer =3D 0;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 struct iovec io =3D { .iov_base =3D &amp;dummy_=
buffer,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .iov_len =3D sizeof(dummy_buffer) };<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 memset(buf, 0, sizeof(buf));<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 msg.msg_iov =3D &amp;io;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 msg.msg_iovlen =3D 1;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 msg.msg_control =3D buf;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 msg.msg_controllen =3D sizeof(buf);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 cmsg =3D CMSG_FIRSTHDR(&amp;msg);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 cmsg-&gt;cmsg_level =3D SOL_SOCKET;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 cmsg-&gt;cmsg_type =3D SCM_RIGHTS;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 cmsg-&gt;cmsg_len =3D CMSG_LEN(n * sizeof(int))=
;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));<=
br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 return sendmsg(socket, &amp;msg, 0);<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +static void print_help_and_exit(const char *prog, int exitcod=
e)<br>
&gt;&gt;&gt; +{<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 fprintf(stderr, &quot;%s - load eBPF RSS progra=
m for qemu and pass eBPF fds&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; through unix=
 socket.\n&quot;, prog);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 fprintf(stderr, &quot;\t--fd &lt;num&gt;, -f &l=
t;num&gt; - unix socket file descriptor&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; used to pass=
 eBPF fds.\n&quot;);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 fprintf(stderr, &quot;\t--help, -h - this help.=
\n&quot;);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 exit(exitcode);<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +int main(int argc, char **argv)<br>
&gt;&gt;&gt; +{<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 char *fd_string =3D NULL;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 int unix_fd =3D 0;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 struct EBPFRSSContext ctx =3D {};<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 int fds[EBPF_RSS_MAX_FDS] =3D {};<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 int ret =3D -1;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 for (;;) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int c;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 static struct option long_options=
[] =3D {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;help&quot;,=C2=A0 no_argument, 0, &#39;h&#39;},<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;fd&quot;,=C2=A0 required_argument, 0, &#39;f&#39;},<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {0, 0=
, 0, 0}<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D getopt_long(argc, argv, &qu=
ot;hf:&quot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long_=
options, NULL);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c =3D=3D -1) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (c) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;f&#39;:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_string =3D optar=
g;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;h&#39;:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_help_and_exit=
(argv[0],<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c =3D=3D &#39;h&#39; ? EXIT_SUCCESS : EXIT_FAILURE);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if (!fd_string) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Unix file d=
escriptor not present.\n&quot;);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_help_and_exit(argv[0], EXIT=
_FAILURE);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 unix_fd =3D atoi(fd_string);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if (!unix_fd) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Unix file d=
escriptor is invalid.\n&quot;);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return EXIT_FAILURE;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 ebpf_rss_init(&amp;ctx);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if (!ebpf_rss_load(&amp;ctx)) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Can&#39;t l=
oad ebpf.\n&quot;);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return EXIT_FAILURE;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 fds[0] =3D ctx.program_fd;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 fds[1] =3D ctx.map_configuration;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 ret =3D send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS=
);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Issue while=
 sending fds: %s.\n&quot;, strerror(errno));<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 ebpf_rss_unload(&amp;ctx);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 return ret &lt; 0 ? EXIT_FAILURE : EXIT_SUCCESS=
;<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; diff --git a/meson.build b/meson.build<br>
&gt;&gt;&gt; index 257e51d91b..913aa1fee5 100644<br>
&gt;&gt;&gt; --- a/meson.build<br>
&gt;&gt;&gt; +++ b/meson.build<br>
&gt;&gt;&gt; @@ -1033,19 +1033,22 @@ if not get_option(&#39;fuse_lseek&#39;=
).disabled()<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 endif<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 # libbpf<br>
&gt;&gt;&gt; -libbpf =3D dependency(&#39;libbpf&#39;, required: get_option(=
&#39;bpf&#39;), method: &#39;pkg-config&#39;)<br>
&gt;&gt;&gt; -if libbpf.found() and not cc.links(&#39;&#39;&#39;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0#include &lt;bpf/libbpf.h&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0int main(void)<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0{<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0bpf_object__destroy_skeleton(NULL);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0}&#39;&#39;&#39;, dependencies: libbpf)<br>
&gt;&gt;&gt; -=C2=A0 libbpf =3D not_found<br>
&gt;&gt;&gt; -=C2=A0 if get_option(&#39;bpf&#39;).enabled()<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 error(&#39;libbpf skeleton test failed&#39;)<br=
>
&gt;&gt;&gt; -=C2=A0 else<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 warning(&#39;libbpf skeleton test failed, disab=
ling&#39;)<br>
&gt;&gt;&gt; +libbpf =3D not_found<br>
&gt;&gt;&gt; +if targetos =3D=3D &#39;linux&#39;<br>
&gt;&gt;&gt; +=C2=A0 libbpf =3D dependency(&#39;libbpf&#39;, required: get_=
option(&#39;bpf&#39;), method: &#39;pkg-config&#39;)<br>
&gt;&gt;&gt; +=C2=A0 if libbpf.found() and not cc.links(&#39;&#39;&#39;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 #include &lt;bpf/libbpf.h&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 int main(void)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 bpf_object__destroy_skeleton(NULL);<br>
&gt;&gt;<br>
&gt;&gt; Do we need to test whether the bpf can do mmap() here?<br>
&gt;&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }&#39;&#39;&#39;, dependencies: libbpf)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 libbpf =3D not_found<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if get_option(&#39;bpf&#39;).enabled()<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 error(&#39;libbpf skeleton test failed&#=
39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 else<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 warning(&#39;libbpf skeleton test failed=
, disabling&#39;)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 endif<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 endif<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 endif<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; @@ -2423,6 +2426,14 @@ if have_tools<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0dependencies: [authz, crypto, io, qom, qemuutil,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libcap_ng, mpathper=
sist],<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install: true)<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if libbpf.found()<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 executable(&#39;qemu-ebpf-rss-hel=
per&#39;, files(<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;ebpf/qemu-ebpf-rss-helper.c&#39;, &#39;ebpf/ebpf_rss.c&#39;)=
,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dependencies: [qemuutil, libbpf, glib],<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install: true,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install_dir: get_option(&#39;libexecdir&#39;))<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 endif<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 endif<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if &#39;CONFIG_IVSHMEM&#39; in config_host=
<br>
<br>
</blockquote></div>

--00000000000078595105cb559c99--


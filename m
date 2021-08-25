Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFEA3F7C2E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 20:25:58 +0200 (CEST)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIxb3-0004jY-IG
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 14:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mIxa3-00043y-P5
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:24:55 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:40543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mIxa1-0006ha-5o
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:24:55 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso141862otu.7
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OvrgY3GPRVJS+VKbmwGkkFo1TRIpNGMNfySCnuXj2Ag=;
 b=qHXyaVsym7SQIpOXmVMAukhQoW5d0e+cXiax8xXxwtBAbRwe2iJEaDGOPuWiQTZk1H
 woeL8HLuIBOUZd1TJplETvwRQZXs72i0FjrXj8ck+xhpT17tw1ZZQ2lWd45lZmWOZs+B
 0bS6Qdxx+6GY+nM2uEiIqqmj3jhJhqIa+6cPOMxgl2BbNP95BvNLO0xurYR0NCgI13ay
 qLDJ2mWzjQDJuEba/RkSk9S9jA1tr3A2Sd5VdCC07atQs++tA/YQ6k4BgGwGscvFKn4I
 fPXJgdi79MN9RtDoJ6lso/AmSM1eOy4qQ1QHB57YiuNlslEkpfrTZp1i61Y0wX9ir4b5
 IbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OvrgY3GPRVJS+VKbmwGkkFo1TRIpNGMNfySCnuXj2Ag=;
 b=mNHPdD1eIJmNiEypkm3OIaCks6d47djaROBRyDUDoNeMvSHaO2oLQZbFY1cYMTAiNr
 vG1EZM+Z3maOu2kQOqnQsQ5ceRcJ6vyybESYrAGClTKREBDun0e9jQVlZEB3SATRvPhz
 g/w34XontZHOZd8NxBjr5Jb/GitvU9mDulSeQL2ng/HuZHGf0vu+ZD7/NZ1F3wHpL3AO
 IgWcAVrvIm6mnUNdbgxWFl6MnO6tIYhnCDojodoWoCW+zPfNcXrWG1zSm0nK0q/DfDje
 0+0nz18B/BhUK4YlpxWUl/q82jYm2QQ7GfteUgM2OFXiTeW6uwCiTqEN/hUBJPNIG1NV
 VAbQ==
X-Gm-Message-State: AOAM530xN7zvvzTZXGOUSvW4QEErYR6GVsOtfustM7cUYGUkDZAd25l1
 HKpuVW+Ure9SoxiuspcH5Ysnd8L1dHS/WQwgjcaMtQ==
X-Google-Smtp-Source: ABdhPJxSLej2GJWnqraWi9x/F0BGp8pEnb6Vnx48J84/x2mLQAluEu43S16lf+qb953FeqWG1p6hHHYDezGv2G2zDJ8=
X-Received: by 2002:a9d:6215:: with SMTP id g21mr23942705otj.116.1629915891921; 
 Wed, 25 Aug 2021 11:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-5-andrew@daynix.com>
 <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
In-Reply-To: <e73ce649-a04e-5200-8258-487a565c7e20@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Wed, 25 Aug 2021 21:24:41 +0300
Message-ID: <CABcq3pFTTMRY-N=f-ORHnE_RP-awWZheGbihfTpv7m+=dQQ9DA@mail.gmail.com>
Subject: Re: [PATCH 4/5] ebpf_rss_helper: Added helper for eBPF RSS.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c086f605ca665d83"
Received-SPF: none client-ip=2607:f8b0:4864:20::32b;
 envelope-from=andrew@daynix.com; helo=mail-ot1-x32b.google.com
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c086f605ca665d83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> I wonder if this can be done as helper for TAP/bridge.
>
Well, it does already, libvirt may create TAP device and pass it in command
line or using getfd qmp command.

E.g it's the qemu to launch those helper with set-uid.
>
Then libvirt won't even need to care about that?

Yea, we may think about this routine in the future as a fallback.

Do we need to test whether the bpf can do mmap() here?
>
I'm not sure that it's required.

On Fri, Aug 20, 2021 at 6:41 AM Jason Wang <jasowang@redhat.com> wrote:

>
> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=86=99=
=E9=81=93:
> > Helper program. Loads eBPF RSS program and maps and passes them through
> unix socket.
> > Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.
>
>
> I wonder if this can be done as helper for TAP/bridge.
>
> E.g it's the qemu to launch those helper with set-uid.
>
> Then libvirt won't even need to care about that?
>
>
> > Also, libbpf dependency now exclusively for Linux.
> > Libbpf is used for eBPF RSS steering, which is supported only by Linux
> TAP.
> > There is no reason yet to build eBPF loader and helper for non Linux
> systems,
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
> > + *              It loads eBPF RSS program and passes fds through unix
> socket.
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
> > +    fprintf(stderr, "%s - load eBPF RSS program for qemu and pass eBPF
> fds"
> > +            " through unix socket.\n", prog);
> > +    fprintf(stderr, "\t--fd <num>, -f <num> - unix socket file
> descriptor"
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
> > +        fprintf(stderr, "Issue while sending fds: %s.\n",
> strerror(errno));
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
> > -libbpf =3D dependency('libbpf', required: get_option('bpf'), method:
> 'pkg-config')
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
> > +  libbpf =3D dependency('libbpf', required: get_option('bpf'), method:
> 'pkg-config')
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
>

--000000000000c086f605ca665d83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I wonder if this can be done as helper for TAP/bridge.<br></bloc=
kquote>
Well, it does already, libvirt may create TAP device and pass it in command=
 line or using getfd qmp command.</div><div><br></div><div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
E.g it&#39;s the qemu to launch those helper with set-uid.<br></blockquote>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Then libvirt won&#39;t even need to care about that?</blockquote><div>Yea, =
we may think about this routine in the future as a fallback.</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div> Do we need to=
 test whether the bpf can do mmap() here?</div></blockquote><div>I&#39;m no=
t sure that it&#39;s required.<br></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 20, 2021 at 6:41 =
AM Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
=E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=86=99=
=E9=81=93:<br>
&gt; Helper program. Loads eBPF RSS program and maps and passes them throug=
h unix socket.<br>
&gt; Libvirt may launch this helper and pass eBPF fds to qemu virtio-net.<b=
r>
<br>
<br>
I wonder if this can be done as helper for TAP/bridge.<br>
<br>
E.g it&#39;s the qemu to launch those helper with set-uid.<br>
<br>
Then libvirt won&#39;t even need to care about that?<br>
<br>
<br>
&gt; Also, libbpf dependency now exclusively for Linux.<br>
&gt; Libbpf is used for eBPF RSS steering, which is supported only by Linux=
 TAP.<br>
&gt; There is no reason yet to build eBPF loader and helper for non Linux s=
ystems,<br>
&gt; even if libbpf is present.<br>
&gt;<br>
&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.=
com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0ebpf/qemu-ebpf-rss-helper.c | 130 ++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 37 ++++++----<br>
&gt;=C2=A0 =C2=A02 files changed, 154 insertions(+), 13 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/qemu-ebpf-rss-helper.c<br>
&gt;<br>
&gt; diff --git a/ebpf/qemu-ebpf-rss-helper.c b/ebpf/qemu-ebpf-rss-helper.c=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..fe68758f57<br>
&gt; --- /dev/null<br>
&gt; +++ b/ebpf/qemu-ebpf-rss-helper.c<br>
&gt; @@ -0,0 +1,130 @@<br>
&gt; +/*<br>
&gt; + * eBPF RSS Helper<br>
&gt; + *<br>
&gt; + * Developed by Daynix Computing LTD (<a href=3D"http://www.daynix.co=
m" rel=3D"noreferrer" target=3D"_blank">http://www.daynix.com</a>)<br>
&gt; + *<br>
&gt; + * Authors:<br>
&gt; + *=C2=A0 Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.com" =
target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2.=
=C2=A0 See<br>
&gt; + * the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + * Description: This is helper program for libvirtd.<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 It loads eBPF RSS =
program and passes fds through unix socket.<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Built by meson, ta=
rget - &#39;qemu-ebpf-rss-helper&#39;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;stdint.h&gt;<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;stdbool.h&gt;<br>
&gt; +#include &lt;getopt.h&gt;<br>
&gt; +#include &lt;memory.h&gt;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;sys/socket.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;ebpf_rss.h&quot;<br>
&gt; +<br>
&gt; +#include &quot;qemu-helper-stamp.h&quot;<br>
&gt; +<br>
&gt; +void QEMU_HELPER_STAMP(void) {}<br>
&gt; +<br>
&gt; +static int send_fds(int socket, int *fds, int n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct msghdr msg =3D {};<br>
&gt; +=C2=A0 =C2=A0 struct cmsghdr *cmsg =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 char buf[CMSG_SPACE(n * sizeof(int))];<br>
&gt; +=C2=A0 =C2=A0 char dummy_buffer =3D 0;<br>
&gt; +=C2=A0 =C2=A0 struct iovec io =3D { .iov_base =3D &amp;dummy_buffer,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 .iov_len =3D sizeof(dummy_buffer) };<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memset(buf, 0, sizeof(buf));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 msg.msg_iov =3D &amp;io;<br>
&gt; +=C2=A0 =C2=A0 msg.msg_iovlen =3D 1;<br>
&gt; +=C2=A0 =C2=A0 msg.msg_control =3D buf;<br>
&gt; +=C2=A0 =C2=A0 msg.msg_controllen =3D sizeof(buf);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cmsg =3D CMSG_FIRSTHDR(&amp;msg);<br>
&gt; +=C2=A0 =C2=A0 cmsg-&gt;cmsg_level =3D SOL_SOCKET;<br>
&gt; +=C2=A0 =C2=A0 cmsg-&gt;cmsg_type =3D SCM_RIGHTS;<br>
&gt; +=C2=A0 =C2=A0 cmsg-&gt;cmsg_len =3D CMSG_LEN(n * sizeof(int));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memcpy(CMSG_DATA(cmsg), fds, n * sizeof(int));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return sendmsg(socket, &amp;msg, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void print_help_and_exit(const char *prog, int exitcode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 fprintf(stderr, &quot;%s - load eBPF RSS program for qe=
mu and pass eBPF fds&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; through unix socket.=
\n&quot;, prog);<br>
&gt; +=C2=A0 =C2=A0 fprintf(stderr, &quot;\t--fd &lt;num&gt;, -f &lt;num&gt=
; - unix socket file descriptor&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; used to pass eBPF fd=
s.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 fprintf(stderr, &quot;\t--help, -h - this help.\n&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 exit(exitcode);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int main(int argc, char **argv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 char *fd_string =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 int unix_fd =3D 0;<br>
&gt; +=C2=A0 =C2=A0 struct EBPFRSSContext ctx =3D {};<br>
&gt; +=C2=A0 =C2=A0 int fds[EBPF_RSS_MAX_FDS] =3D {};<br>
&gt; +=C2=A0 =C2=A0 int ret =3D -1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (;;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 static struct option long_options[] =3D {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;help&q=
uot;,=C2=A0 no_argument, 0, &#39;h&#39;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;fd&quo=
t;,=C2=A0 required_argument, 0, &#39;f&#39;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {0, 0, 0, 0}<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D getopt_long(argc, argv, &quot;hf:&q=
uot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long_options,=
 NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (c) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;f&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_string =3D optarg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;h&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_help_and_exit(argv[0]=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 c =3D=3D &#39;h&#39; ? EXIT_SUCCESS : EXIT_FAILURE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!fd_string) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Unix file descripto=
r not present.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_help_and_exit(argv[0], EXIT_FAILURE=
);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 unix_fd =3D atoi(fd_string);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!unix_fd) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Unix file descripto=
r is invalid.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return EXIT_FAILURE;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ebpf_rss_init(&amp;ctx);<br>
&gt; +=C2=A0 =C2=A0 if (!ebpf_rss_load(&amp;ctx)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Can&#39;t load ebpf=
.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return EXIT_FAILURE;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 fds[0] =3D ctx.program_fd;<br>
&gt; +=C2=A0 =C2=A0 fds[1] =3D ctx.map_configuration;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ret =3D send_fds(unix_fd, fds, EBPF_RSS_MAX_FDS);<br>
&gt; +=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Issue while sending=
 fds: %s.\n&quot;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ebpf_rss_unload(&amp;ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret &lt; 0 ? EXIT_FAILURE : EXIT_SUCCESS;<br>
&gt; +}<br>
&gt; +<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 257e51d91b..913aa1fee5 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1033,19 +1033,22 @@ if not get_option(&#39;fuse_lseek&#39;).disabl=
ed()<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# libbpf<br>
&gt; -libbpf =3D dependency(&#39;libbpf&#39;, required: get_option(&#39;bpf=
&#39;), method: &#39;pkg-config&#39;)<br>
&gt; -if libbpf.found() and not cc.links(&#39;&#39;&#39;<br>
&gt; -=C2=A0 =C2=A0#include &lt;bpf/libbpf.h&gt;<br>
&gt; -=C2=A0 =C2=A0int main(void)<br>
&gt; -=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bpf_object__destroy_skeleton(NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -=C2=A0 =C2=A0}&#39;&#39;&#39;, dependencies: libbpf)<br>
&gt; -=C2=A0 libbpf =3D not_found<br>
&gt; -=C2=A0 if get_option(&#39;bpf&#39;).enabled()<br>
&gt; -=C2=A0 =C2=A0 error(&#39;libbpf skeleton test failed&#39;)<br>
&gt; -=C2=A0 else<br>
&gt; -=C2=A0 =C2=A0 warning(&#39;libbpf skeleton test failed, disabling&#39=
;)<br>
&gt; +libbpf =3D not_found<br>
&gt; +if targetos =3D=3D &#39;linux&#39;<br>
&gt; +=C2=A0 libbpf =3D dependency(&#39;libbpf&#39;, required: get_option(&=
#39;bpf&#39;), method: &#39;pkg-config&#39;)<br>
&gt; +=C2=A0 if libbpf.found() and not cc.links(&#39;&#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 #include &lt;bpf/libbpf.h&gt;<br>
&gt; +=C2=A0 =C2=A0 int main(void)<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 bpf_object__destroy_skeleton(NULL);<br>
<br>
<br>
Do we need to test whether the bpf can do mmap() here?<br>
<br>
Thanks<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }&#39;&#39;&#39;, dependencies: libbpf)<br>
&gt; +=C2=A0 =C2=A0 libbpf =3D not_found<br>
&gt; +=C2=A0 =C2=A0 if get_option(&#39;bpf&#39;).enabled()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 error(&#39;libbpf skeleton test failed&#39;)<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 warning(&#39;libbpf skeleton test failed, disabl=
ing&#39;)<br>
&gt; +=C2=A0 =C2=A0 endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -2423,6 +2426,14 @@ if have_tools<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependen=
cies: [authz, crypto, io, qom, qemuutil,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libcap_ng, mpathpersist],<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install:=
 true)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if libbpf.found()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 executable(&#39;qemu-ebpf-rss-helper&#39;=
, files(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;ebpf/qemu-ebpf-rss-helper.c&#39;, &#39;ebpf/ebpf_rss.c&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
dependencies: [qemuutil, libbpf, glib],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
install: true,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
install_dir: get_option(&#39;libexecdir&#39;))<br>
&gt; +=C2=A0 =C2=A0 endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0if &#39;CONFIG_IVSHMEM&#39; in config_host<br>
<br>
</blockquote></div>

--000000000000c086f605ca665d83--


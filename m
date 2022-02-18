Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FFD4BBEC9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:56:06 +0100 (CET)
Received: from localhost ([::1]:44694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7UC-0001vR-Vc
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:56:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nL7Rv-0008Uf-K2
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:53:43 -0500
Received: from [2a00:1450:4864:20::136] (port=45770
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nL7Rs-0000PL-H1
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:53:43 -0500
Received: by mail-lf1-x136.google.com with SMTP id b11so6823310lfb.12
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 09:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XMv/WI8vHVSALaf/aQ72wuip9IsIseAszN2rQFYB/dY=;
 b=CLegTFhlsFRU9LB+f7MdFq6cgFHBB65p6zshlUpGWA7zYxfeatcc1+FIDrbw8IybfC
 fjxlooO4hP6tr/4QIXa+n5V8dvCXSPe3V1qCLEAXd56Wh6hovTzbhvMMuG7NSNM0ilsW
 pUkZScxxxDIRvBJDFvow29wlFy3RMAUQfi0YluE73aqDieeNFmvTBVvIiA91VS9gfIZ7
 xrrkSg+wHoVpdWmbDt7K+8nQCoefha4kqoBzzGtsDbedbo11CJ3SVdjc6FWoRn5tN/NA
 Do7RIlHGMJAuFrYa93/t/dOaS7UHSPvLVzgV/J8KGNoS7JyqrbBjv0eClhRmUR4n0BoN
 OOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XMv/WI8vHVSALaf/aQ72wuip9IsIseAszN2rQFYB/dY=;
 b=5a8pOyVWM+YEfrH54zqF4d5VbBUk2WvhjCI2lU0a3eUwpKbsVhD/RvH9KCn8pFAPEu
 5CQqxAi+LzU7WFYTgk843cgPUfJlPKXBpSg54KagAUpPoCXmWCHLifCFP/g4Qgd3qY8a
 rQ6c+iJzo0a11A8t0g7wkC+8hV9X8kUiojs3Jw1BQZu7k0CJ2voMyE5y1glC45WPAEuK
 Pq27h3mPWjKWTQJ168lVkfDkaVKirTGypkWlfUTNu7z4qw2+ovkaeWzaZ4ERCqunZ83R
 ZBfnEsYhXUIRciO16fKGkxpesLXbFplJB4KbSVuSgT1iH/mnmiQ6Zec4D6F2XTlnA7ME
 bPaA==
X-Gm-Message-State: AOAM532IJClJ26w8+diAyr93k7Y1gqfn4AD9O7QnkKJekFjfwFNAhV/A
 vNKtUdIiyS4I9ud+mBCNLoh5M6J/TYi8Cz6MZdE=
X-Google-Smtp-Source: ABdhPJzqgWeNq3w6hG7LfPQ9WhCsUD/4hnYssjeo0Z2q2ldaiAtSrrjeP+/TCv5ayQCgIu4RpTHlneIglG5xv6NEqgU=
X-Received: by 2002:a05:6512:c2:b0:443:3d36:970 with SMTP id
 c2-20020a05651200c200b004433d360970mr5925936lfp.46.1645206816517; Fri, 18 Feb
 2022 09:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20220215190426.56130-1-wwcohen@gmail.com>
 <CAB26zV1v+bL4FskfRbpU5kWqRBxg4wKJBVXXsWnNzJo31_9O_A@mail.gmail.com>
 <24928693.zZ8iTCSeN7@silver>
In-Reply-To: <24928693.zZ8iTCSeN7@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Fri, 18 Feb 2022 12:53:23 -0500
Message-ID: <CAB26zV38pT=SXSKnpuXK9x_eS3REb3PbgRZ6-mRhuhFPO8vuQQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] 9p: Add support for darwin
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000e172ac05d84e8f24"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu Developers <qemu-devel@nongnu.org>,
 hi@alyssa.is, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e172ac05d84e8f24
Content-Type: text/plain; charset="UTF-8"

Excellent, thanks so much for the update. I'll wait till the other 9p pull
gets integrated, then rebase and test!

On Fri, Feb 18, 2022 at 12:45 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Freitag, 18. Februar 2022 18:04:24 CET Will Cohen wrote:
> > On Tue, Feb 15, 2022 at 2:04 PM Will Cohen <wwcohen@gmail.com> wrote:
> > > This is a followup to
> > > https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg02313.html,
> > > adding 9p server support for Darwin.
> > >
> > > Since v6, the following changes have been made to the following
> patches:
> > >
> > > Patch 9/11: 9p: darwin: Implement compatibility for mknodat
> > > - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
> > >
> > >   presence in osdep.h and os-posix.c
> > >
> > > Keno Fischer (10):
> > >   9p: linux: Fix a couple Linux assumptions
> > >   9p: Rename 9p-util -> 9p-util-linux
> > >   9p: darwin: Handle struct stat(fs) differences
> > >   9p: darwin: Handle struct dirent differences
> > >   9p: darwin: Ignore O_{NOATIME, DIRECT}
> > >   9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
> > >   9p: darwin: *xattr_nofollow implementations
> > >   9p: darwin: Compatibility for f/l*xattr
> > >   9p: darwin: Implement compatibility for mknodat
> > >   9p: darwin: meson: Allow VirtFS on Darwin
> > >
> > > Will Cohen (1):
> > >   9p: darwin: Adjust assumption on virtio-9p-test
> > >
> > >  fsdev/file-op-9p.h                     |  9 +++-
> > >  fsdev/meson.build                      |  1 +
> > >  hw/9pfs/9p-local.c                     | 27 ++++++++---
> > >  hw/9pfs/9p-proxy.c                     | 38 +++++++++++++--
> > >  hw/9pfs/9p-synth.c                     |  6 +++
> > >  hw/9pfs/9p-util-darwin.c               | 64 ++++++++++++++++++++++++++
> > >  hw/9pfs/{9p-util.c => 9p-util-linux.c} |  2 +-
> > >  hw/9pfs/9p-util.h                      | 35 ++++++++++++++
> > >  hw/9pfs/9p.c                           | 42 ++++++++++++++---
> > >  hw/9pfs/9p.h                           | 18 ++++++++
> > >  hw/9pfs/codir.c                        |  4 +-
> > >  hw/9pfs/meson.build                    |  3 +-
> > >  include/qemu/osdep.h                   | 12 +++++
> > >  include/qemu/xattr.h                   |  4 +-
> > >  meson.build                            | 15 ++++--
> > >  os-posix.c                             | 35 ++++++++++++++
> > >  tests/qtest/virtio-9p-test.c           |  2 +-
> > >  17 files changed, 292 insertions(+), 25 deletions(-)
> > >  create mode 100644 hw/9pfs/9p-util-darwin.c
> > >  rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)
> > >
> > > --
> > > 2.34.1
> >
> > As a brief additional note, this patch set has gotten a moderate amount
> of
> > performance testing downstream by various end users of podman, with
> > favorable results:
> > https://github.com/containers/podman/issues/8016#issuecomment-1044843948
>
> Thanks for sharing!
>
> Additionally you might be interested to know what's pending in the
> pipeline on
> Linux kernel side which brings a huge performance improvement with 9p:
>
> https://lore.kernel.org/netdev/cover.1640870037.git.linux_oss@crudebyte.com/
>
> As for the status on this macOS series here: I will get back on it next
> week.
> From my PoV it looks fine now. So for the other gentlemen here: please
> raise
> your hand if you still find something.
>
> Will, one more thing though: I just sent a PR with one particular patch
> that I
> would ask you to test in conjunction with this series:
>
>
> https://github.com/cschoenebeck/qemu/commit/e64e27d5cb103b7764f1a05b6eda7e7fedd517c5
>
> You might simply wait for the PR being merged (maybe monday?) and then
> rebase
> this series to master and test if this patch is not breaking anything for
> macOS. Theoretically the new qemu_dirent_dup() function should fallback on
> macOS to its portable branch, but it should be tested before merging this
> series, just to be sure.
>
> Best regards,
> Christian Schoenebeck
>
>
>

--000000000000e172ac05d84e8f24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Excellent, thanks so much for the update. I&#39;ll wait ti=
ll the other 9p pull gets integrated, then rebase and test!<br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb =
18, 2022 at 12:45 PM Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@c=
rudebyte.com">qemu_oss@crudebyte.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Freitag, 18. Februar 2022 18:04:24 C=
ET Will Cohen wrote:<br>
&gt; On Tue, Feb 15, 2022 at 2:04 PM Will Cohen &lt;<a href=3D"mailto:wwcoh=
en@gmail.com" target=3D"_blank">wwcohen@gmail.com</a>&gt; wrote:<br>
&gt; &gt; This is a followup to<br>
&gt; &gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022-02/=
msg02313.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/a=
rchive/html/qemu-devel/2022-02/msg02313.html</a>,<br>
&gt; &gt; adding 9p server support for Darwin.<br>
&gt; &gt; <br>
&gt; &gt; Since v6, the following changes have been made to the following p=
atches:<br>
&gt; &gt; <br>
&gt; &gt; Patch 9/11: 9p: darwin: Implement compatibility for mknodat<br>
&gt; &gt; - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0presence in osdep.h and os-posix.c<br>
&gt; &gt; <br>
&gt; &gt; Keno Fischer (10):<br>
&gt; &gt;=C2=A0 =C2=A09p: linux: Fix a couple Linux assumptions<br>
&gt; &gt;=C2=A0 =C2=A09p: Rename 9p-util -&gt; 9p-util-linux<br>
&gt; &gt;=C2=A0 =C2=A09p: darwin: Handle struct stat(fs) differences<br>
&gt; &gt;=C2=A0 =C2=A09p: darwin: Handle struct dirent differences<br>
&gt; &gt;=C2=A0 =C2=A09p: darwin: Ignore O_{NOATIME, DIRECT}<br>
&gt; &gt;=C2=A0 =C2=A09p: darwin: Move XATTR_SIZE_MAX-&gt;P9_XATTR_SIZE_MAX=
<br>
&gt; &gt;=C2=A0 =C2=A09p: darwin: *xattr_nofollow implementations<br>
&gt; &gt;=C2=A0 =C2=A09p: darwin: Compatibility for f/l*xattr<br>
&gt; &gt;=C2=A0 =C2=A09p: darwin: Implement compatibility for mknodat<br>
&gt; &gt;=C2=A0 =C2=A09p: darwin: meson: Allow VirtFS on Darwin<br>
&gt; &gt; <br>
&gt; &gt; Will Cohen (1):<br>
&gt; &gt;=C2=A0 =C2=A09p: darwin: Adjust assumption on virtio-9p-test<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 fsdev/file-op-9p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++-<br>
&gt; &gt;=C2=A0 fsdev/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 ++++++++---<br>
&gt; &gt;=C2=A0 hw/9pfs/9p-proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 +++++++++++++--<br>
&gt; &gt;=C2=A0 hw/9pfs/9p-synth.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++<br>
&gt; &gt;=C2=A0 hw/9pfs/9p-util-darwin.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 64 ++++++++++++++++++++++++++<br>
&gt; &gt;=C2=A0 hw/9pfs/{9p-util.c =3D&gt; 9p-util-linux.c} |=C2=A0 2 +-<br=
>
&gt; &gt;=C2=A0 hw/9pfs/9p-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 35 ++++++++++++++<br>
&gt; &gt;=C2=A0 hw/9pfs/9p.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 42 ++++++++++++++---<=
br>
&gt; &gt;=C2=A0 hw/9pfs/9p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++<br>
&gt; &gt;=C2=A0 hw/9pfs/codir.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; &gt;=C2=A0 hw/9pfs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt; &gt;=C2=A0 include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++<br>
&gt; &gt;=C2=A0 include/qemu/xattr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 ++++--<br>
&gt; &gt;=C2=A0 os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 35 ++++++++++++++<=
br>
&gt; &gt;=C2=A0 tests/qtest/virtio-9p-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 17 files changed, 292 insertions(+), 25 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 hw/9pfs/9p-util-darwin.c<br>
&gt; &gt;=C2=A0 rename hw/9pfs/{9p-util.c =3D&gt; 9p-util-linux.c} (97%)<br=
>
&gt; &gt; <br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; <br>
&gt; As a brief additional note, this patch set has gotten a moderate amoun=
t of<br>
&gt; performance testing downstream by various end users of podman, with<br=
>
&gt; favorable results:<br>
&gt; <a href=3D"https://github.com/containers/podman/issues/8016#issuecomme=
nt-1044843948" rel=3D"noreferrer" target=3D"_blank">https://github.com/cont=
ainers/podman/issues/8016#issuecomment-1044843948</a><br>
<br>
Thanks for sharing!<br>
<br>
Additionally you might be interested to know what&#39;s pending in the pipe=
line on<br>
Linux kernel side which brings a huge performance improvement with 9p:<br>
<a href=3D"https://lore.kernel.org/netdev/cover.1640870037.git.linux_oss@cr=
udebyte.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
netdev/cover.1640870037.git.linux_oss@crudebyte.com/</a><br>
<br>
As for the status on this macOS series here: I will get back on it next wee=
k.<br>
From my PoV it looks fine now. So for the other gentlemen here: please rais=
e<br>
your hand if you still find something.<br>
<br>
Will, one more thing though: I just sent a PR with one particular patch tha=
t I<br>
would ask you to test in conjunction with this series:<br>
<br>
<a href=3D"https://github.com/cschoenebeck/qemu/commit/e64e27d5cb103b7764f1=
a05b6eda7e7fedd517c5" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/cschoenebeck/qemu/commit/e64e27d5cb103b7764f1a05b6eda7e7fedd517c5</a><br=
>
<br>
You might simply wait for the PR being merged (maybe monday?) and then reba=
se<br>
this series to master and test if this patch is not breaking anything for<b=
r>
macOS. Theoretically the new qemu_dirent_dup() function should fallback on<=
br>
macOS to its portable branch, but it should be tested before merging this<b=
r>
series, just to be sure.<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div>

--000000000000e172ac05d84e8f24--


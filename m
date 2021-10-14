Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBA942DA59
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 15:27:26 +0200 (CEST)
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0lZ-0005ST-VM
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 09:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1mb0hx-0007m6-Ek
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:23:41 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1mb0ht-0002Jj-Lj
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:23:40 -0400
Received: by mail-ua1-x935.google.com with SMTP id h19so11230504uax.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 06:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OwFf4T7zWjGn8vaWCMp4Pnk/YKHeSXZZkmczdEZHNt4=;
 b=TPsFiw2loZBGXivWn+/u5gm64a6cY4w0nJT63A8WuvdApAryegbD6cR4qnf7m6MKgJ
 0oOLnjdp9HR6/u9F4s04z8c7vOWLdBztsxuoQRYbINE3KJ61je48y5wYa9MzQ98Bm6fC
 xIkqMYo62Wjx5l2ZF3XLEy9W/yGY8eDyOvPo3wG7YmwzU+hQBH1Bsc3XMhrqsbSn+XeP
 d/NbobucJCpEtIwfSUlDlOV9HNk0TsJNIKR0CIPn/AsrxJXrEhOE8vLK89ComOg6ZhS2
 wZ2ROtUWeBV5mecDIbOQ/LfoRXWmcAKd07ygasBnAWMnAcg5Kb1hgLE/f015VYBZAK/O
 NUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OwFf4T7zWjGn8vaWCMp4Pnk/YKHeSXZZkmczdEZHNt4=;
 b=rMNWxOFCOAKakYYVFmOCqPAgeQTwbBzRkW8LCa1S02SH0g+R6VIKzrNctvSWKMIHAX
 u6iJvDtZ3Oep/HG4T2zYyAk9iZn4VV0UhRN8Gt36FMN94E67YCZj4D+IB1u8BfOU1wNK
 ciQbrEJSJd8aoIpoup1jymUbYpmW6DhWeo4DlSlQdDK5gXBfqp98x7d/1PtD/paQ03mI
 syV29Ti4vhYYoomsnqH6fLgf011gscWztlkXA696HtMrHKrQZHG9oYdie9zZfjukAzrv
 IaaiPERJH2fMeOFIXoXx44sCMNBCHi7ZCkW3CaLDxf3FU2BZRcCsEj6kfetuVqCZFztP
 iopw==
X-Gm-Message-State: AOAM532zIwK+seRKReWnt79XMINztnJRUqLI9Y4vUwu/5G9D1xNCNzD/
 aMJB+qX8vUzjBNLuJiGFNVU9DlX4xm/gd8ui2RY=
X-Google-Smtp-Source: ABdhPJzaa29c3cgICxFt35VdIzGtGjIu5PX5GOpN2mDTWuxFFSVu7HlHj0oinid1Y8iuLd7PZ/u5qm0G55mPf/zOMt8=
X-Received: by 2002:ab0:3c4d:: with SMTP id u13mr6551702uaw.66.1634217816607; 
 Thu, 14 Oct 2021 06:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211013230405.32170-1-wwcohen@gmail.com>
 <7858538.Xg4lN0sot7@silver>
 <CAB26zV17E_b_-nnLBTeH2QxT=c7vy9zvPak+Tp4TkyECNGUS-Q@mail.gmail.com>
 <3493661.FTZtrCqsiM@silver>
In-Reply-To: <3493661.FTZtrCqsiM@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 14 Oct 2021 09:23:25 -0400
Message-ID: <CAB26zV1W3EDF9_CpQue3TiskP1VYX4SEkmsCiVG3rfh8XHTUDg@mail.gmail.com>
Subject: Re: [PATCH 00/11] 9p: Add support for Darwin
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000071cfb305ce4ffc91"
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=wwcohen@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000071cfb305ce4ffc91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correct, sorry for the imprecise language. The use case being contemplated
is limited to Linux as the guest side, specifically for cross-platform
tools where the macOS implementation consists of integrating a Linux VM via
QEMU.

NixOS (updater of the original patch,
https://github.com/NixOS/nixpkgs/pull/122420) would be able to use this to
provide macOS support via a VM.

Lima and Podman as containerization alternatives to Docker would like to
performantly mount volumes between macOS users and their respective VMs.
Lima currently accomplishes this via sshfs, but would like to move to 9p
for stability/performance reasons (https://github.com/lima-vm/lima/issues/2=
0).
Podman has yet to fully settle on an implementation at all due to similar
outstanding concerns, but the furthest along proposed implementation choice
has been 9pfs as well (https://github.com/containers/podman/pull/11454),
pending adoption of such functionality in QEMU upstream.

On Thu, Oct 14, 2021 at 8:55 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 14. Oktober 2021 14:22:19 CEST Will Cohen wrote:
> > Correct. It's been tested and functions when applied to QEMU master, wi=
th
> > host running macOS Big Sur 11.6 (personal machine) using client 9p2000.=
L
> > (taking a cue from the guest mounting instructions on
> > https://wiki.qemu.org/Documentation/9psetup).
>
> So it was the Linux kernel's 9p client on guest side with 9p 'local' fs
> driver
> and 9p transport driver was 'virtio-pci'.
>
> I was just wondering if somebody already bothered for macOS being the
> guest,
> because that use case is a bit more challenging, especially with macOS 11
> and
> higher. But I see that's nothing you were into.
>
> > On Thu, Oct 14, 2021 at 7:57 AM Christian Schoenebeck <
> >
> > qemu_oss@crudebyte.com> wrote:
> > > On Donnerstag, 14. Oktober 2021 12:48:55 CEST Will Cohen wrote:
> > > > Many thanks for all the clarifications =E2=80=94 it=E2=80=99s my fi=
rst time using
> > > > git-send-email and first time with mailing-list-based devel
> workflows.
> > >
> > > Will
> > >
> > > > adjust accordingly, work through gitlab, and eventually resend via
> > > > git-publish as v2.
> > >
> > > So the intended use case is macOS being host.
> > >
> > > Has this been tested, and if yes, using which 9p client and which mac=
OS
> > > version?
> > >
> > > Best regards,
> > > Christian Schoenebeck
>
>
>

--00000000000071cfb305ce4ffc91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Correct, sorry for the imprecise language. The use ca=
se being contemplated is limited to Linux as the guest side, specifically f=
or cross-platform tools where the macOS implementation consists of integrat=
ing a Linux VM via QEMU. <br></div><div><br></div><div>NixOS (updater of th=
e original patch, <a href=3D"https://github.com/NixOS/nixpkgs/pull/122420">=
https://github.com/NixOS/nixpkgs/pull/122420</a>) would be able to use this=
 to provide macOS support via a VM. <br></div><div><br></div><div>Lima and =
Podman as containerization alternatives to Docker would like to performantl=
y mount volumes between macOS users and their respective VMs. Lima currentl=
y accomplishes this via sshfs, but would like to move to 9p for stability/p=
erformance reasons (<a href=3D"https://github.com/lima-vm/lima/issues/20">h=
ttps://github.com/lima-vm/lima/issues/20</a>). Podman has yet to fully sett=
le on an implementation at all due to similar outstanding concerns, but the=
 furthest along proposed implementation choice has been 9pfs as well (<a hr=
ef=3D"https://github.com/containers/podman/pull/11454">https://github.com/c=
ontainers/podman/pull/11454</a>), pending adoption of such functionality in=
 QEMU upstream.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 8:55 AM Christian Schoeneb=
eck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyte.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Donnerstag, 14. Oktober 2021 14:22:19 CEST Will Cohen wrote:<br>
&gt; Correct. It&#39;s been tested and functions when applied to QEMU maste=
r, with<br>
&gt; host running macOS Big Sur 11.6 (personal machine) using client 9p2000=
.L<br>
&gt; (taking a cue from the guest mounting instructions on<br>
&gt; <a href=3D"https://wiki.qemu.org/Documentation/9psetup" rel=3D"norefer=
rer" target=3D"_blank">https://wiki.qemu.org/Documentation/9psetup</a>).<br=
>
<br>
So it was the Linux kernel&#39;s 9p client on guest side with 9p &#39;local=
&#39; fs driver <br>
and 9p transport driver was &#39;virtio-pci&#39;.<br>
<br>
I was just wondering if somebody already bothered for macOS being the guest=
, <br>
because that use case is a bit more challenging, especially with macOS 11 a=
nd <br>
higher. But I see that&#39;s nothing you were into.<br>
<br>
&gt; On Thu, Oct 14, 2021 at 7:57 AM Christian Schoenebeck &lt;<br>
&gt; <br>
&gt; <a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@c=
rudebyte.com</a>&gt; wrote:<br>
&gt; &gt; On Donnerstag, 14. Oktober 2021 12:48:55 CEST Will Cohen wrote:<b=
r>
&gt; &gt; &gt; Many thanks for all the clarifications =E2=80=94 it=E2=80=99=
s my first time using<br>
&gt; &gt; &gt; git-send-email and first time with mailing-list-based devel =
workflows.<br>
&gt; &gt; <br>
&gt; &gt; Will<br>
&gt; &gt; <br>
&gt; &gt; &gt; adjust accordingly, work through gitlab, and eventually rese=
nd via<br>
&gt; &gt; &gt; git-publish as v2.<br>
&gt; &gt; <br>
&gt; &gt; So the intended use case is macOS being host.<br>
&gt; &gt; <br>
&gt; &gt; Has this been tested, and if yes, using which 9p client and which=
 macOS<br>
&gt; &gt; version?<br>
&gt; &gt; <br>
&gt; &gt; Best regards,<br>
&gt; &gt; Christian Schoenebeck<br>
<br>
<br>
</blockquote></div>

--00000000000071cfb305ce4ffc91--


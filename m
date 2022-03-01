Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F6F4C9579
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 21:11:41 +0100 (CET)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8qS-0003bx-Cj
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 15:11:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nP8oa-00025a-AZ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 15:09:44 -0500
Received: from [2a00:1450:4864:20::230] (port=41804
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nP8oY-0001eC-Dy
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 15:09:43 -0500
Received: by mail-lj1-x230.google.com with SMTP id t14so23345451ljh.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 12:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ynMw+3e1U8JTEzu/7ZMI77zGvHFo9ZP4OU/nTOxceA=;
 b=VjkMMZtvOv1Ze4oZiWdLsGXzgQ5DvtcrWQ0Qh38NLVliKw2aAwyMWXBSutToESLngN
 a2xi9n42yO+dreP+XDIGYh0Kr19AalcSvr5MsyK/EUFsL3udH1jzutBnCZneusSIwYgY
 lCP9ceMovgrhSqS4gBr08SLQHCJ98pJtkbgfFw8po++7R7MbeMWFdwzByBvaSk3PDifN
 23aZvrVRNTw4SRvIm/FgOvSGQiE1+6tJKsA+nDtcdgbjpOh9o3ya1t48A5ROxdDE66js
 MzSDQAGKjslWT/XIQBU/Cbe8pbcTQIr80DmViJ+ZwlHrnGgRzVL8rkyckZhJFIHmUmoQ
 9R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ynMw+3e1U8JTEzu/7ZMI77zGvHFo9ZP4OU/nTOxceA=;
 b=sNxjgNYgRjJYkKzyzZzI5/gNFuYCYQabs5acOkL2UhBz5wQbpao7dRR/QLAfYym76B
 SvnABx4LvzCNL67vPrlh05tsf9OvjD5DIfiqhLfg5WlcH2TImchhh1FzlfQaiguh8/WG
 2V/CL5XYdEpoiUH/ujVSAaijEgr7+0kWsqlDDsQkp9OZx8DKg2xHlSOxVDA5GgOSEuRZ
 1Zyawxh2v05WB2geiCjqJvEdX04XN9td2ZhbxbkNNUPgo8gOejtqZt7gOuK2y03GlpBT
 9EwnlQvsuPzB/kknFw6jZphG6J6/5+qbnXlX+yNqgLaR3ArvI+zaJ65ZQP8CBidDtqRP
 kYgw==
X-Gm-Message-State: AOAM530rw8hLTi6Xlxk3kZ+9HgtyDBbD9D3tEDd74IRWCBzHlLU6l6z9
 aEWpT7n4Sw3LMsqcFwGysWnzx1XFabfP5fVhSqk=
X-Google-Smtp-Source: ABdhPJxvwNxtar6LlhV56IqJqZQ9IFCybkGpTwXVLZrBDJNoZ04P5eNBAQHxFW3MA0+DWa4zpE6GjZPN+QV7ggmxXZc=
X-Received: by 2002:a2e:7a15:0:b0:244:c714:310b with SMTP id
 v21-20020a2e7a15000000b00244c714310bmr18167954ljc.268.1646165379753; Tue, 01
 Mar 2022 12:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <3049778.kzlV3qucMN@silver>
In-Reply-To: <3049778.kzlV3qucMN@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Tue, 1 Mar 2022 15:09:27 -0500
Message-ID: <CAB26zV12OjbDv7uUHqar6-j4cLqD2Mz3yR28qy-N3v2pu96Nyg@mail.gmail.com>
Subject: Re: [PATCH v9 00/11] 9p: Add support for darwin
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000b3abb605d92dbe83"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x230.google.com
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu Developers <qemu-devel@nongnu.org>, hi@alyssa.is,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b3abb605d92dbe83
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 2:25 PM Christian Schoenebeck <qemu_oss@crudebyte.com>
wrote:

> On Sonntag, 27. Februar 2022 23:35:11 CET Will Cohen wrote:
> > This is a followup to
> > https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg04391.html,
> adding
> > 9p server support for Darwin.
> >
> > Since v8, the following changes have been made:
> >
> > Patch 4/11 (9p: darwin: Handle struct dirent differences)
> > - Declare qemu_dirent_off as static to prevent linker error
> > - Move qemu_dirent_off above the end-of-file endif to fix compilation
> >
> > Patch 9/11 (9p: darwin: Implement compatibility for mknodat)
> > - Fix line over 90 characters formatting error
> > - Move qemu_mknodat back from osdep to 9p-util and adjust patch notes
> > accordingly
> >
> > Patch 11/11 (9p: darwin: meson: Allow VirtFS on Darwin)
> > - Rebase to master
> >
> > With these changes, this patch set builds and passes 9p synth tests on
> both
> > linux and darwin.
> >
> > Keno Fischer (10):
> >   9p: linux: Fix a couple Linux assumptions
> >   9p: Rename 9p-util -> 9p-util-linux
> >   9p: darwin: Handle struct stat(fs) differences
> >   9p: darwin: Handle struct dirent differences
> >   9p: darwin: Ignore O_{NOATIME, DIRECT}
> >   9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
> >   9p: darwin: *xattr_nofollow implementations
> >   9p: darwin: Compatibility for f/l*xattr
> >   9p: darwin: Implement compatibility for mknodat
> >   9p: darwin: meson: Allow VirtFS on Darwin
> >
> > Will Cohen (1):
> >   9p: darwin: Adjust assumption on virtio-9p-test
> >
> >  fsdev/file-op-9p.h                     |  9 ++-
> >  fsdev/meson.build                      |  1 +
> >  hw/9pfs/9p-local.c                     | 27 +++++--
> >  hw/9pfs/9p-proxy.c                     | 38 +++++++++-
> >  hw/9pfs/9p-synth.c                     |  6 ++
> >  hw/9pfs/9p-util-darwin.c               | 97 ++++++++++++++++++++++++++
> >  hw/9pfs/{9p-util.c => 9p-util-linux.c} |  8 ++-
> >  hw/9pfs/9p-util.h                      | 46 ++++++++++++
> >  hw/9pfs/9p.c                           | 42 +++++++++--
> >  hw/9pfs/9p.h                           | 18 +++++
> >  hw/9pfs/codir.c                        |  4 +-
> >  hw/9pfs/meson.build                    |  3 +-
> >  include/qemu/xattr.h                   |  4 +-
> >  meson.build                            | 13 ++--
> >  tests/qtest/virtio-9p-test.c           |  2 +-
> >  15 files changed, 292 insertions(+), 26 deletions(-)
> >  create mode 100644 hw/9pfs/9p-util-darwin.c
> >  rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (90%)
>
> Queued on 9p.next:
> https://github.com/cschoenebeck/qemu/commits/9p.next
>
> Thanks!
>
>
This is very exciting. Many, many thanks for helping guide this through the
process!


> Best regards,
> Christian Schoenebeck
>
>
>

--000000000000b3abb605d92dbe83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Mar 1, 2022 at 2:25 PM Christian =
Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyt=
e.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sonntag, 27. Februar 2022 23:35:11 CET =
Will Cohen wrote:<br>
&gt; This is a followup to<br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg04=
391.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archiv=
e/html/qemu-devel/2022-02/msg04391.html</a>, adding<br>
&gt; 9p server support for Darwin.<br>
&gt; <br>
&gt; Since v8, the following changes have been made:<br>
&gt; <br>
&gt; Patch 4/11 (9p: darwin: Handle struct dirent differences)<br>
&gt; - Declare qemu_dirent_off as static to prevent linker error<br>
&gt; - Move qemu_dirent_off above the end-of-file endif to fix compilation<=
br>
&gt; <br>
&gt; Patch 9/11 (9p: darwin: Implement compatibility for mknodat)<br>
&gt; - Fix line over 90 characters formatting error<br>
&gt; - Move qemu_mknodat back from osdep to 9p-util and adjust patch notes<=
br>
&gt; accordingly<br>
&gt; <br>
&gt; Patch 11/11 (9p: darwin: meson: Allow VirtFS on Darwin)<br>
&gt; - Rebase to master<br>
&gt; <br>
&gt; With these changes, this patch set builds and passes 9p synth tests on=
 both<br>
&gt; linux and darwin.<br>
&gt; <br>
&gt; Keno Fischer (10):<br>
&gt;=C2=A0 =C2=A09p: linux: Fix a couple Linux assumptions<br>
&gt;=C2=A0 =C2=A09p: Rename 9p-util -&gt; 9p-util-linux<br>
&gt;=C2=A0 =C2=A09p: darwin: Handle struct stat(fs) differences<br>
&gt;=C2=A0 =C2=A09p: darwin: Handle struct dirent differences<br>
&gt;=C2=A0 =C2=A09p: darwin: Ignore O_{NOATIME, DIRECT}<br>
&gt;=C2=A0 =C2=A09p: darwin: Move XATTR_SIZE_MAX-&gt;P9_XATTR_SIZE_MAX<br>
&gt;=C2=A0 =C2=A09p: darwin: *xattr_nofollow implementations<br>
&gt;=C2=A0 =C2=A09p: darwin: Compatibility for f/l*xattr<br>
&gt;=C2=A0 =C2=A09p: darwin: Implement compatibility for mknodat<br>
&gt;=C2=A0 =C2=A09p: darwin: meson: Allow VirtFS on Darwin<br>
&gt; <br>
&gt; Will Cohen (1):<br>
&gt;=C2=A0 =C2=A09p: darwin: Adjust assumption on virtio-9p-test<br>
&gt; <br>
&gt;=C2=A0 fsdev/file-op-9p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++-<br>
&gt;=C2=A0 fsdev/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 +++++--<br>
&gt;=C2=A0 hw/9pfs/9p-proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 +++++++++-<br>
&gt;=C2=A0 hw/9pfs/9p-synth.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++<br>
&gt;=C2=A0 hw/9pfs/9p-util-darwin.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 97 ++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/9pfs/{9p-util.c =3D&gt; 9p-util-linux.c} |=C2=A0 8 ++-<br>
&gt;=C2=A0 hw/9pfs/9p-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 46 ++++++++++++<br>
&gt;=C2=A0 hw/9pfs/9p.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 42 +++++++++--<br>
&gt;=C2=A0 hw/9pfs/9p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++<br>
&gt;=C2=A0 hw/9pfs/codir.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 hw/9pfs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 include/qemu/xattr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 ++--<br>
&gt;=C2=A0 tests/qtest/virtio-9p-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 15 files changed, 292 insertions(+), 26 deletions(-)<br>
&gt;=C2=A0 create mode 100644 hw/9pfs/9p-util-darwin.c<br>
&gt;=C2=A0 rename hw/9pfs/{9p-util.c =3D&gt; 9p-util-linux.c} (90%)<br>
<br>
Queued on 9p.next:<br>
<a href=3D"https://github.com/cschoenebeck/qemu/commits/9p.next" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/cschoenebeck/qemu/commits/9p.=
next</a><br>
<br>
Thanks!<br>
<br></blockquote><div><br></div><div>This is very exciting. Many, many than=
ks for helping guide this through the process!<br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div></div>

--000000000000b3abb605d92dbe83--


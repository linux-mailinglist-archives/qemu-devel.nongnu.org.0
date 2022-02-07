Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E34AC3D4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:39:55 +0100 (CET)
Received: from localhost ([::1]:41676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH67P-00072W-1q
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH5RV-0007uv-2T
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:56:38 -0500
Received: from [2a00:1450:4864:20::12e] (port=47036
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH5RR-0003T7-Tb
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:56:36 -0500
Received: by mail-lf1-x12e.google.com with SMTP id z19so27295849lfq.13
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 06:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CtzIuUe04e4kyMhqtXtRfl39o9bLaEEczir1SuQSDPw=;
 b=UnU2xSxj/Sj0S+oNyk6fotMmYVDiKDbznyJJUf+cxUF1pERYFO1X48N8PwuKp4MpHz
 VHSRiRjzffU2ArZHhpb8NXztpeT0Y2wPWyzeoG99qJKOqk6gSdQ4zsAnxv2OBzl97cb8
 lqSAbdrcqsHawawM9wudLzcawWDlbv2V6P7CL0uQ6MdJi1T+XmYdRF8NjQYctwEqknlI
 AN8Dy5lOu+X0wdQFQHu/a1oHQqDNLXbWFz8QsYdPTgkxVyutQNccBkjY4ZBWOOtHmdGO
 vXZQ43GWqD2Jcu2epVIRklB/yO4txYpvB1LwJir/rT+WoBd1srdAVbZUaeBQ2KWoAv9Y
 oshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CtzIuUe04e4kyMhqtXtRfl39o9bLaEEczir1SuQSDPw=;
 b=e7IS8/YpZJSKopT6kX3YjriuGFBNvHyj/KoMgHQLlKUWe8xAP41kCezRRJ7fYzFTB6
 U3gBVw8Ki2/dhpdn4sAzEzZxIOGEsWSw2aorw+bzHaqpShFI6fzhcaqkMZd6U1TOnSdZ
 faB1MUBoU7t4mURKLWJfbNBfAeTtdHF3zSDYWQgX453YyYqDM0inu811caHbWah/DcvD
 e90OIiieKV7y82rCZeEYDR+rYtvSzMKmLI6tj+wmWlpOO8Kj9xowznqYzh6fC+0iIMjd
 LP25hXok22cKqxDrNw3YliLcC/ZYFJ4lOnfdcEoqll8fGyhh3YZKmQajRnZF69T3uxnQ
 z8Tg==
X-Gm-Message-State: AOAM532C0g3da5SkIYMVWaoVrnzCb9Oc/4JSPPSrqrQGyvXnDvLqgrX1
 OilnBsbLXrpWUfJxTC7RoG1luAPEqPSKf47lzmQ=
X-Google-Smtp-Source: ABdhPJzxaz1aGppGTd+gfCcaVlO88hw/5hWv5dpgucjTHtLt+IZ+Rz8rfM74XhhDWu3fkjO9nhqemmT0tFwYQL/mpgY=
X-Received: by 2002:a05:6512:2243:: with SMTP id
 i3mr8902790lfu.598.1644245792130; 
 Mon, 07 Feb 2022 06:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <2607115.euRFimgOtO@silver>
In-Reply-To: <2607115.euRFimgOtO@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Feb 2022 09:56:20 -0500
Message-ID: <CAB26zV0EEXsjoSH3QCuoKb7qAugiTFoauopSEcHDSrgBr7E-sg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] 9p: Add support for darwin
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000005d09e505d76eced7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005d09e505d76eced7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2022 at 9:47 AM Christian Schoenebeck <qemu_oss@crudebyte.co=
m>
wrote:

> On Sonntag, 6. Februar 2022 21:07:08 CET Will Cohen wrote:
> > This is a followup to
> > https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg05993.html,
> > adding 9p server support for Darwin.
> >
> > Since v3, the following changes have been made:
> >
> > - Move XATTR_SIZE_MAX to P9_XATTR_SIZE MAX in 9p.h, and provide
> explanatory
> > context as preliminary solution - Add explanatory note surrounding
> > virtio-9p-test with output of pre-patch failing test - Remove superfluo=
us
> > header guards from file-opt-9p
> > - Add note about virtfs-proxy-helper being disabled on non-linux for th=
is
> > patch series - Note radar filed with Apple for missing mknodat syscall
> > - Replace direct syscall to pthread_fchdir with pthread_fchdir_np, and
> add
> > check for this function=E2=80=99s presence in meson - Ensure that d_see=
koff is
> > filled using telldir on darwin, and create qemu_dirent_off helper to
> decide
> > which to access. - Ensure that [amc]tim.tv_sec are all initialized
> > alongside [amc]tim.tv_nsec in 9p-proxy - Ensure that all patch email
> > addresses are valid
> > - Add telldir error handling for dirent on darwin
>
> As this series already has seen some revisions and is on a good way to
> become
> queued soon: it is helpful to immediately see here which patches exactly
> got
> changed, because some of the patches already look fine.
>
> For already reviewed patches that you won't change: you can take over
> people's
> reviewed-by tags in the next revision.
>
> Best regards,
> Christian Schoenebeck
>
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
> >  hw/9pfs/9p-local.c                     | 28 ++++++--
> >  hw/9pfs/9p-proxy.c                     | 38 ++++++++++-
> >  hw/9pfs/9p-synth.c                     |  6 ++
> >  hw/9pfs/9p-util-darwin.c               | 91 ++++++++++++++++++++++++++
> >  hw/9pfs/{9p-util.c =3D> 9p-util-linux.c} |  7 +-
> >  hw/9pfs/9p-util.h                      | 38 +++++++++++
> >  hw/9pfs/9p.c                           | 50 ++++++++++++--
> >  hw/9pfs/9p.h                           | 11 ++++
> >  hw/9pfs/codir.c                        |  7 ++
> >  hw/9pfs/meson.build                    |  3 +-
> >  include/qemu/xattr.h                   |  4 +-
> >  meson.build                            | 14 ++--
> >  tests/qtest/virtio-9p-test.c           |  2 +-
> >  15 files changed, 285 insertions(+), 24 deletions(-)
> >  create mode 100644 hw/9pfs/9p-util-darwin.c
> >  rename hw/9pfs/{9p-util.c =3D> 9p-util-linux.c} (90%)
>
>
Understood! Previous reviewed-by tags are already in v4, and these new ones
will go into v5!

For reference in terms of changes, patches that were touched in v4:

Keno Fischer (10):
9p: linux: Fix a couple Linux assumptions (1/11)
9p: darwin: Handle struct stat(fs) differences (3/11)
9p: darwin: Handle struct dirent differences (4/11)
9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX (5/11)
9p: darwin: Implement compatibility for mknodat (9/11)
9p: darwin: meson: Allow VirtFS on Darwin (10/11)

Will Cohen (1):
9p: darwin: Adjust assumption on virtio-9p-test (11/11)

Additional changes to patches will be highlighted in the opening note for
v5.

--0000000000005d09e505d76eced7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 9:47 AM Christ=
ian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crud=
ebyte.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sonntag, 6. Februar 2022 21:07:08 CET Will Cohen wrote:<br>
&gt; This is a followup to<br>
&gt; <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2022-01/ms=
g05993.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/=
archive/html/qemu-devel/2022-01/msg05993.html</a>,<br>
&gt; adding 9p server support for Darwin.<br>
&gt; <br>
&gt; Since v3, the following changes have been made:<br>
&gt; <br>
&gt; - Move XATTR_SIZE_MAX to P9_XATTR_SIZE MAX in 9p.h, and provide explan=
atory<br>
&gt; context as preliminary solution - Add explanatory note surrounding<br>
&gt; virtio-9p-test with output of pre-patch failing test - Remove superflu=
ous<br>
&gt; header guards from file-opt-9p<br>
&gt; - Add note about virtfs-proxy-helper being disabled on non-linux for t=
his<br>
&gt; patch series - Note radar filed with Apple for missing mknodat syscall=
<br>
&gt; - Replace direct syscall to pthread_fchdir with pthread_fchdir_np, and=
 add<br>
&gt; check for this function=E2=80=99s presence in meson - Ensure that d_se=
ekoff is<br>
&gt; filled using telldir on darwin, and create qemu_dirent_off helper to d=
ecide<br>
&gt; which to access. - Ensure that [amc]tim.tv_sec are all initialized<br>
&gt; alongside [amc]tim.tv_nsec in 9p-proxy - Ensure that all patch email<b=
r>
&gt; addresses are valid<br>
&gt; - Add telldir error handling for dirent on darwin<br>
<br>
As this series already has seen some revisions and is on a good way to beco=
me <br>
queued soon: it is helpful to immediately see here which patches exactly go=
t <br>
changed, because some of the patches already look fine.<br>
<br>
For already reviewed patches that you won&#39;t change: you can take over p=
eople&#39;s <br>
reviewed-by tags in the next revision.<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 ++++++--<br>
&gt;=C2=A0 hw/9pfs/9p-proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 ++++++++++-<br>
&gt;=C2=A0 hw/9pfs/9p-synth.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++<br>
&gt;=C2=A0 hw/9pfs/9p-util-darwin.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 91 ++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/9pfs/{9p-util.c =3D&gt; 9p-util-linux.c} |=C2=A0 7 +-<br>
&gt;=C2=A0 hw/9pfs/9p-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 38 +++++++++++<br>
&gt;=C2=A0 hw/9pfs/9p.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 50 ++++++++++++--<br>
&gt;=C2=A0 hw/9pfs/9p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++<br>
&gt;=C2=A0 hw/9pfs/codir.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++<br>
&gt;=C2=A0 hw/9pfs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 include/qemu/xattr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 ++--<br>
&gt;=C2=A0 tests/qtest/virtio-9p-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 15 files changed, 285 insertions(+), 24 deletions(-)<br>
&gt;=C2=A0 create mode 100644 hw/9pfs/9p-util-darwin.c<br>
&gt;=C2=A0 rename hw/9pfs/{9p-util.c =3D&gt; 9p-util-linux.c} (90%)<br>
<br></blockquote><div>=C2=A0</div><div><div>Understood! Previous reviewed-b=
y tags are already in v4, and these new ones will go into v5!<br></div><div=
><br></div><div>For reference in terms of changes, patches that were touche=
d in v4:</div><div><br></div><div>Keno Fischer (10):<br>
9p: linux: Fix a couple Linux assumptions (1/11)<br>
9p: darwin: Handle struct stat(fs) differences (3/11)<br>
9p: darwin: Handle struct dirent differences (4/11)<br>
9p: darwin: Move XATTR_SIZE_MAX-&gt;P9_XATTR_SIZE_MAX (5/11)<br>
9p: darwin: Implement compatibility for mknodat (9/11)<br>
9p: darwin: meson: Allow VirtFS on Darwin (10/11)</div><div><br>
Will Cohen (1):<br>
9p: darwin: Adjust assumption on virtio-9p-test (11/11)</div><div><br></div=
><div>Additional changes to patches will be highlighted in the opening note=
 for v5.<br></div>=C2=A0</div></div></div>

--0000000000005d09e505d76eced7--


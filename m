Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE104B5B03
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 21:35:39 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJi4P-0002iD-Ri
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 15:35:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nJi2j-0001zo-O8
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 15:33:53 -0500
Received: from [2a00:1450:4864:20::232] (port=41774
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nJi2h-0006wG-Oi
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 15:33:53 -0500
Received: by mail-lj1-x232.google.com with SMTP id t14so23872993ljh.8
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 12:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KOzyx0g7iYFzh0wzhlOpf80LEJz1+s1jj3q3MkZfsfI=;
 b=kruD8sSENvA/ADyb9Nd4RZGowETLxTOW+ouYz4bH6Nw8mVfQwgLkyUKGdAVUjYNFFg
 32MOGfhCqxP4mxCJOKFkyzrynSf1AsHPZnBTbof51FxWN19sLEvb19tJPBJVih3c1jdr
 Y+Q8SBR35smHFyJWsL59sfsUv9PQK937JvCLDfD/VkZU60tvYEj9ukIQzMnVwAKSsXft
 q+akbXeAPKj972udVBmhSyU+SnqizH0CqleVSGFZ16GpNQPDKfthtopehyU2zsgO8X0o
 5UcxYte9vhWQxX1+4usaulOOAyYrDp990NrhuK+STt+ipMrVODxv5oBAyYKMpFK5cXLR
 sncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOzyx0g7iYFzh0wzhlOpf80LEJz1+s1jj3q3MkZfsfI=;
 b=qx84aQFUO2DaJJRSe2l6SYHca8EvfOS3hdFtdLfvD6lYSzSpdT51DtEUx3swMQkuti
 k5slMnj7sBwMr+pZ+Wz0MKOtVmjLyxlvr8EzjajGtYObZxEwImItTR+qsIbHluZ3d/5d
 9pJRaYUJR6CrxuN+/tqs4aniybQxgpmxAzpz5qvgNudfPwPQTiv/MSj6krli+/uaojh/
 cX4rBtM4iQW0kFgD9iESydKpeTu6LiW541+vV6DTqkHQNiXuZhjChEmN871B1hQ+XH5h
 8J4V6kKKAXg65aLmTKOqLnshExCp3RKd/WUc/ZMjf3J67YxoxPQ10ZQODScOaJdALQDg
 oKxw==
X-Gm-Message-State: AOAM532YoJkPOEMZohEOh83Ft4CQCKBw+0HZJaIy7DJ7UPKwSaE5PozP
 V/0YWYMRiWqkvqDqpbbs0BMyeyDiDWwqRbl2g6YqhtjqcZxjwA==
X-Google-Smtp-Source: ABdhPJzLZn9gfiSMQQySS1Ol2HFB13AIHV0F1r4WyQ4DcLLnTGS4x6p1Ho1Sdzeiuh8sXoLnv4fcsrciQB+ouLrui7U=
X-Received: by 2002:a2e:bc11:: with SMTP id b17mr319058ljf.74.1644870829091;
 Mon, 14 Feb 2022 12:33:49 -0800 (PST)
MIME-Version: 1.0
References: <20220210132946.2303-1-wwcohen@gmail.com>
In-Reply-To: <20220210132946.2303-1-wwcohen@gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 14 Feb 2022 15:33:37 -0500
Message-ID: <CAB26zV2V7bMUSnzhp7Px04duNu2m+D20t0wpTM+wXgzaZrk-4w@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] 9p: Add support for darwin
To: qemu Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000782fb605d800558a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000782fb605d800558a
Content-Type: text/plain; charset="UTF-8"

Hello all,

I'm seeing on the updated release schedule that we're now looking at March
8 for soft feature freeze (
https://wiki.qemu.org/Planning/7.0#Release_Schedule). Is there anything
additional that should be prepared for this patch set to hopefully be able
to target 7.0?

Will

On Thu, Feb 10, 2022 at 8:29 AM Will Cohen <wwcohen@gmail.com> wrote:

> This is a followup to
> https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01506.html,
> adding 9p server support for Darwin.
>
> Since v5, the following changes have been made to the following patches:
>
> Patch 6/11: 9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
> - For P9_XATTR_SIZE_MAX, ensure that Linux uses XATTR_SIZE_MAX, Darwin
> uses 64k, and error out for undefined hosts
>
> Patch 9/11: 9p: darwin: Implement compatibility for mknodat
> - Move pthread_fchdir_np declaration only to osdep
> - Declare pthread_fchdir_np with __attribute__((weak)) to allow checking
> for its presence before usage
> - Move declarations above cplusplus guard
>
> Patch 10/11: 9p: darwin: Adjust assumption on virtio-9p-test (formerly v5
> Patch 11/11)
> - Move this patch before 9p: darwin: meson patch to avoid qtest breakage
> during bisecting
>
> Patch 11/11: 9p: darwin: meson: Allow VirtFS on Darwin (formerly v5 Patch
> 10/11)
> - Fully adjust meson virtfs error note to specify macOS
>
> Keno Fischer (10):
>   9p: linux: Fix a couple Linux assumptions
>   9p: Rename 9p-util -> 9p-util-linux
>   9p: darwin: Handle struct stat(fs) differences
>   9p: darwin: Handle struct dirent differences
>   9p: darwin: Ignore O_{NOATIME, DIRECT}
>   9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
>   9p: darwin: *xattr_nofollow implementations
>   9p: darwin: Compatibility for f/l*xattr
>   9p: darwin: Implement compatibility for mknodat
>   9p: darwin: meson: Allow VirtFS on Darwin
>
> Will Cohen (1):
>   9p: darwin: Adjust assumption on virtio-9p-test
>
>  fsdev/file-op-9p.h                     |  9 +++-
>  fsdev/meson.build                      |  1 +
>  hw/9pfs/9p-local.c                     | 27 ++++++++---
>  hw/9pfs/9p-proxy.c                     | 38 +++++++++++++--
>  hw/9pfs/9p-synth.c                     |  6 +++
>  hw/9pfs/9p-util-darwin.c               | 64 ++++++++++++++++++++++++++
>  hw/9pfs/{9p-util.c => 9p-util-linux.c} |  2 +-
>  hw/9pfs/9p-util.h                      | 35 ++++++++++++++
>  hw/9pfs/9p.c                           | 42 ++++++++++++++---
>  hw/9pfs/9p.h                           | 18 ++++++++
>  hw/9pfs/codir.c                        |  4 +-
>  hw/9pfs/meson.build                    |  3 +-
>  include/qemu/osdep.h                   | 12 +++++
>  include/qemu/xattr.h                   |  4 +-
>  meson.build                            | 14 ++++--
>  os-posix.c                             | 35 ++++++++++++++
>  tests/qtest/virtio-9p-test.c           |  2 +-
>  17 files changed, 291 insertions(+), 25 deletions(-)
>  create mode 100644 hw/9pfs/9p-util-darwin.c
>  rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)
>
> --
> 2.34.1
>
>

--000000000000782fb605d800558a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div><br></div><div>I&#39;m seeing on=
 the updated release schedule that we&#39;re now looking at March 8 for sof=
t feature freeze (<a href=3D"https://wiki.qemu.org/Planning/7.0#Release_Sch=
edule">https://wiki.qemu.org/Planning/7.0#Release_Schedule</a>). Is there a=
nything additional that should be prepared for this patch set to hopefully =
be able to target 7.0?</div><div><br></div><div>Will<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 1=
0, 2022 at 8:29 AM Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com">wwco=
hen@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">This is a followup to <a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2022-02/msg01506.html" rel=3D"noreferrer" target=3D"_blank=
">https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01506.html</a>,<=
br>
adding 9p server support for Darwin.<br>
<br>
Since v5, the following changes have been made to the following patches:<br=
>
<br>
Patch 6/11: 9p: darwin: Move XATTR_SIZE_MAX-&gt;P9_XATTR_SIZE_MAX<br>
- For P9_XATTR_SIZE_MAX, ensure that Linux uses XATTR_SIZE_MAX, Darwin uses=
 64k, and error out for undefined hosts<br>
<br>
Patch 9/11: 9p: darwin: Implement compatibility for mknodat<br>
- Move pthread_fchdir_np declaration only to osdep<br>
- Declare pthread_fchdir_np with __attribute__((weak)) to allow checking fo=
r its presence before usage<br>
- Move declarations above cplusplus guard<br>
<br>
Patch 10/11: 9p: darwin: Adjust assumption on virtio-9p-test (formerly v5 P=
atch 11/11)<br>
- Move this patch before 9p: darwin: meson patch to avoid qtest breakage du=
ring bisecting<br>
<br>
Patch 11/11: 9p: darwin: meson: Allow VirtFS on Darwin (formerly v5 Patch 1=
0/11)<br>
- Fully adjust meson virtfs error note to specify macOS<br>
<br>
Keno Fischer (10):<br>
=C2=A0 9p: linux: Fix a couple Linux assumptions<br>
=C2=A0 9p: Rename 9p-util -&gt; 9p-util-linux<br>
=C2=A0 9p: darwin: Handle struct stat(fs) differences<br>
=C2=A0 9p: darwin: Handle struct dirent differences<br>
=C2=A0 9p: darwin: Ignore O_{NOATIME, DIRECT}<br>
=C2=A0 9p: darwin: Move XATTR_SIZE_MAX-&gt;P9_XATTR_SIZE_MAX<br>
=C2=A0 9p: darwin: *xattr_nofollow implementations<br>
=C2=A0 9p: darwin: Compatibility for f/l*xattr<br>
=C2=A0 9p: darwin: Implement compatibility for mknodat<br>
=C2=A0 9p: darwin: meson: Allow VirtFS on Darwin<br>
<br>
Will Cohen (1):<br>
=C2=A0 9p: darwin: Adjust assumption on virtio-9p-test<br>
<br>
=C2=A0fsdev/file-op-9p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++-<br>
=C2=A0fsdev/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 ++++++++---<br>
=C2=A0hw/9pfs/9p-proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 +++++++++++++--<br>
=C2=A0hw/9pfs/9p-synth.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++<br>
=C2=A0hw/9pfs/9p-util-darwin.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 64 ++++++++++++++++++++++++++<br>
=C2=A0hw/9pfs/{9p-util.c =3D&gt; 9p-util-linux.c} |=C2=A0 2 +-<br>
=C2=A0hw/9pfs/9p-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 35 ++++++++++++++<br>
=C2=A0hw/9pfs/9p.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 42 ++++++++++++++---<br>
=C2=A0hw/9pfs/9p.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++<br>
=C2=A0hw/9pfs/codir.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0hw/9pfs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 12 +++++<br>
=C2=A0include/qemu/xattr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 ++++--<br>
=C2=A0os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 35 ++++++++++++++<br>
=C2=A0tests/qtest/virtio-9p-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
=C2=A017 files changed, 291 insertions(+), 25 deletions(-)<br>
=C2=A0create mode 100644 hw/9pfs/9p-util-darwin.c<br>
=C2=A0rename hw/9pfs/{9p-util.c =3D&gt; 9p-util-linux.c} (97%)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000782fb605d800558a--


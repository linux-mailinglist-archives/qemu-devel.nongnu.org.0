Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4644BBE01
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:07:06 +0100 (CET)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL6in-0000Mj-Oe
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:07:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nL6gU-0005pf-8D
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:04:42 -0500
Received: from [2a00:1450:4864:20::12d] (port=41490
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nL6gS-0001R2-D7
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:04:41 -0500
Received: by mail-lf1-x12d.google.com with SMTP id f37so6601503lfv.8
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 09:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nhlNWFnE1iCr2ozZQHR9SnA6ErL3wirMOo+34M7V6Lc=;
 b=LUkjIUD6jJKLJgKlVHJ9e9Kw1gX1UWuY1KQ7hwL83nZSxKZkGSpZ/gGTGezppdBcJM
 RdaG5DhhkZwAflf5TTpjHpHLqX1L4E76LxwRyi/KiVB/d7YNJzMt/7XihE3om+MED7xQ
 dnqbnFQ3LrPjoD+bTeQZI1XEGbRdW5M/KTXe8GFixcaFpvQ4ksVv2idlXRlNZzu5K9Dm
 raWxwD7PHeVZP3w9+BsuzSZKMEp3mR/FxEHL+oejFztcyoHFJNdt4NeMnGekOZN8CoWB
 LZvAzhxHhJOc0zF7XuzgXhMECTmqFByuVizQm1hy8gjJ8fUm2U7qiarS3ktyRiFymxlv
 oeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nhlNWFnE1iCr2ozZQHR9SnA6ErL3wirMOo+34M7V6Lc=;
 b=x1/dG/HGVD1aIcQm3GJ+oNv6j/LZ3EmREVYxssLXpD6S0ALkJZ8fUL8HapIcDClps0
 av70rPDyiemfLYkfqIFG1SQl9gcOrkhlST+IWWEb7NOF+AYEV3gq7LrbMzd0yIw1d1Ju
 iZCd4onbbI2KddmBt/pWq9uwd/evUWERNfFpfj0H8dQobuzR0UDcNWftjkaKxlISbsPY
 X0yPIdvGDuvYJ8TSvZEbX5DrrQfsKWaBkAmc67UTzO3PHEOly1GQFTVQonRp5YRIbfdu
 +K4iRtz+soNpDMIiw6BYoW9o0cO7/njcI4e1L5QAIsYJ0BoOcThEvwKaotXmp47o1eLn
 wKkQ==
X-Gm-Message-State: AOAM530/bfuj2lPPG6/vhUMjv3RlUCpeItCchG+rGiYhKYqHTELpz0Gr
 57OD/RSU19OoE6QUJMeno9CU6/pQz2e+XYQeQx/8KqRsVUZdQg==
X-Google-Smtp-Source: ABdhPJwaSHOqBZjW8XVIKET3SxdLoSOw7aayKCUT9WXZZW1nqW6xv1txEV3DPzNZwGE2nH3xMMaKobqMrF6x1et3JKc=
X-Received: by 2002:a05:6512:3619:b0:443:1597:8293 with SMTP id
 f25-20020a056512361900b0044315978293mr6080147lfs.439.1645203877576; Fri, 18
 Feb 2022 09:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20220215190426.56130-1-wwcohen@gmail.com>
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Fri, 18 Feb 2022 12:04:24 -0500
Message-ID: <CAB26zV1v+bL4FskfRbpU5kWqRBxg4wKJBVXXsWnNzJo31_9O_A@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] 9p: Add support for darwin
To: qemu Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b4c51f05d84de0dc"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12d.google.com
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b4c51f05d84de0dc
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 2:04 PM Will Cohen <wwcohen@gmail.com> wrote:

> This is a followup to
> https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg02313.html,
> adding 9p server support for Darwin.
>
> Since v6, the following changes have been made to the following patches:
>
> Patch 9/11: 9p: darwin: Implement compatibility for mknodat
> - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
>   presence in osdep.h and os-posix.c
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
>  meson.build                            | 15 ++++--
>  os-posix.c                             | 35 ++++++++++++++
>  tests/qtest/virtio-9p-test.c           |  2 +-
>  17 files changed, 292 insertions(+), 25 deletions(-)
>  create mode 100644 hw/9pfs/9p-util-darwin.c
>  rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)
>
> --
> 2.34.1
>
>
As a brief additional note, this patch set has gotten a moderate amount of
performance testing downstream by various end users of podman, with
favorable results:
https://github.com/containers/podman/issues/8016#issuecomment-1044843948

--000000000000b4c51f05d84de0dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 15, 2022 at 2:04 PM Will Cohe=
n &lt;<a href=3D"mailto:wwcohen@gmail.com">wwcohen@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">This is a followup to <a href=3D"https://lists.gnu.org/archive/=
html/qemu-devel/2022-02/msg02313.html" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg02313.html</a>,<b=
r>
adding 9p server support for Darwin.<br>
<br>
Since v6, the following changes have been made to the following patches:<br=
>
<br>
Patch 9/11: 9p: darwin: Implement compatibility for mknodat<br>
- Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for<br>
=C2=A0 presence in osdep.h and os-posix.c<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 ++++--<br>
=C2=A0os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 35 ++++++++++++++<br>
=C2=A0tests/qtest/virtio-9p-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
=C2=A017 files changed, 292 insertions(+), 25 deletions(-)<br>
=C2=A0create mode 100644 hw/9pfs/9p-util-darwin.c<br>
=C2=A0rename hw/9pfs/{9p-util.c =3D&gt; 9p-util-linux.c} (97%)<br>
<br>
-- <br>
2.34.1<br>
<br></blockquote><div><br></div><div>As a brief additional note, this patch=
 set has gotten a moderate amount of performance testing downstream by vari=
ous end users of podman, with favorable results:=C2=A0 <a href=3D"https://g=
ithub.com/containers/podman/issues/8016#issuecomment-1044843948">https://gi=
thub.com/containers/podman/issues/8016#issuecomment-1044843948</a></div></d=
iv></div>

--000000000000b4c51f05d84de0dc--


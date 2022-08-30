Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5F5A6163
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 13:10:58 +0200 (CEST)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSz8v-0001Kk-06
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 07:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oSz5u-0007Kh-QO
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:07:46 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:42664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oSz5s-0003F0-Br
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 07:07:46 -0400
Received: by mail-lf1-x12b.google.com with SMTP id z6so15001654lfu.9
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=jUplaDqbB+XIXkXyxDhfqMBYgUmkxUu4P66v1DO1L78=;
 b=o7GgQGFyW/W7jWM96ZnQy2SHvJo5HNynCKyENdi8XnI1E8dbmwcBAbAWmSJNKXEDgg
 mLQWBVtQ/dM5z2waiN/WAlVEcbw9273dLGv3MjpotaAUvaZ9N9u12iecj3D2SJ68a6SG
 Lk4qq9I0kZJAyEjWBY56iVLNn40U+tg3gRwp7tzjDglF+mFazeesOD9w6pTsoKldyLDo
 /gF46Us+lTPGYygN5PgzLCPw/2jLLwJEWrgSzWME0crFTgxqSOenQ55PHPZy+mMz/qUn
 Zjxi/ktbmaYDhMk7UPFAm67COcVdb+x0qiHtxlRrNKX+2bPOhO1e3OcVtSsJbWBG5b4j
 0hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jUplaDqbB+XIXkXyxDhfqMBYgUmkxUu4P66v1DO1L78=;
 b=nkZRLl9YGaw9UUJToNZSaYP2P2TIaYbEvwIphqMDMGVk3vCrGmn4IVyI3lj5RKDOir
 lPj5MB4wPhxEAiB/OOMHdT1PHI+GrbV/WPGdnFWlPKFhiedsKZqt0hbSQAB1tCp2JASQ
 NMicQG4WwRULCv3uj6P8qKccLmy6rhWnGV3jLwfWOJ7HsySOA7nWg0Vou5Nj0XTHYVyi
 0sttoZlrfv/A63BBiZ4xlHijHP3vFJy7tnXP3TaXZxa3Li9H8B4+M2s8XRSi3Y+0dYY5
 +4x1jLSsy1l63l3OYe1Xq3jkAJ9/l1hTdyKOZ92zYR/WpOv74g3Z/4MwcBymwrs/oolU
 uLrw==
X-Gm-Message-State: ACgBeo1yJ0Y+tDR6f4YG3w4nJ9GzIYrFoTPlN6TX2SSU3KRzLkvf0JE6
 ga1J/rT2tSVLf8dFGZTd5UlkfNkQ0Lnhgx3SlRU=
X-Google-Smtp-Source: AA6agR4wMmcAzUl0QWwQ5Jf0D2a24CH5A/o5L2zKATEurv5Adnt7TndvKE77z+LRzw+Oy/CNl0e9tW/INzHbyu20FwI=
X-Received: by 2002:ac2:5b50:0:b0:494:5ec2:1ea5 with SMTP id
 i16-20020ac25b50000000b004945ec21ea5mr4921156lfp.276.1661857662547; Tue, 30
 Aug 2022 04:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220829154058.524413-1-antonio.caggiano@collabora.com>
In-Reply-To: <20220829154058.524413-1-antonio.caggiano@collabora.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 30 Aug 2022 15:07:31 +0400
Message-ID: <CAJ+F1C+zNq7uVn02BLWVvL6E+3gRL4PbqhUMP9rqYr73cCJ2xQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] virtio-gpu: Blob resources
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com, 
 dmitry.osipenko@collabora.com
Content-Type: multipart/alternative; boundary="000000000000a4bd7005e773638e"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a4bd7005e773638e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Aug 29, 2022 at 7:46 PM Antonio Caggiano <
antonio.caggiano@collabora.com> wrote:

> Add shared memory and support blob resource creation, mapping and
> unmapping through virglrenderer new stable APIs[0] when available.
>
> [0]
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/891


This is merged, and will be part of 0.10 (
https://gitlab.freedesktop.org/virgl/virglrenderer/-/milestones/9#tab-issue=
s),
hopefully soon to be released.

The series looks ok to me, except for the few comments I left. Could you
please update the documentation too?

thanks


>
> Antonio Caggiano (1):
>   virtio-gpu: Handle resource blob commands
>
> Dmitry Osipenko (1):
>   virtio-gpu: Don't require udmabuf when blob support is enabled
>
> Dr. David Alan Gilbert (1):
>   virtio: Add shared memory capability
>
> Gerd Hoffmann (1):
>   virtio-gpu: hostmem
>
> Richard Henderson (1):
>   Update version for v7.1.0-rc4 release
>
>  VERSION                              |   2 +-
>  hw/display/virtio-gpu-pci.c          |  15 +++
>  hw/display/virtio-gpu-virgl.c        | 169 +++++++++++++++++++++++++++
>  hw/display/virtio-gpu.c              |  25 ++--
>  hw/display/virtio-vga.c              |  33 ++++--
>  hw/virtio/virtio-pci.c               |  18 +++
>  include/hw/virtio/virtio-gpu-bswap.h |  18 +++
>  include/hw/virtio/virtio-gpu.h       |  11 ++
>  include/hw/virtio/virtio-pci.h       |   4 +
>  meson.build                          |   5 +
>  10 files changed, 276 insertions(+), 24 deletions(-)
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a4bd7005e773638e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Aug 29, 2022 at 7:46 PM Antonio Caggi=
ano &lt;<a href=3D"mailto:antonio.caggiano@collabora.com">antonio.caggiano@=
collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Add shared memory and support blob resource creation, mapping =
and<br>
unmapping through virglrenderer new stable APIs[0] when available.<br>
<br>
[0] <a href=3D"https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_r=
equests/891" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskto=
p.org/virgl/virglrenderer/-/merge_requests/891</a></blockquote><div><br></d=
iv><div>This is merged, and will be part of 0.10 (<a href=3D"https://gitlab=
.freedesktop.org/virgl/virglrenderer/-/milestones/9#tab-issues">https://git=
lab.freedesktop.org/virgl/virglrenderer/-/milestones/9#tab-issues</a>), hop=
efully soon to be released.</div><div><br></div><div>The series looks ok to=
 me, except for the few comments I left. Could you please update the docume=
ntation too?</div><div><br></div><div>thanks</div><div><br> </div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Antonio Caggiano (1):<br>
=C2=A0 virtio-gpu: Handle resource blob commands<br>
<br>
Dmitry Osipenko (1):<br>
=C2=A0 virtio-gpu: Don&#39;t require udmabuf when blob support is enabled<b=
r>
<br>
Dr. David Alan Gilbert (1):<br>
=C2=A0 virtio: Add shared memory capability<br>
<br>
Gerd Hoffmann (1):<br>
=C2=A0 virtio-gpu: hostmem<br>
<br>
Richard Henderson (1):<br>
=C2=A0 Update version for v7.1.0-rc4 release<br>
<br>
=C2=A0VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0hw/display/virtio-gpu-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 15 +++<br>
=C2=A0hw/display/virtio-gpu-virgl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 169 ++++++=
+++++++++++++++++++++<br>
=C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 25 ++--<br>
=C2=A0hw/display/virtio-vga.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 33 ++++--<br>
=C2=A0hw/virtio/virtio-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 18 +++<br>
=C2=A0include/hw/virtio/virtio-gpu-bswap.h |=C2=A0 18 +++<br>
=C2=A0include/hw/virtio/virtio-gpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +=
+<br>
=C2=A0include/hw/virtio/virtio-pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A010 files changed, 276 insertions(+), 24 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a4bd7005e773638e--


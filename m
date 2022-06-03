Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5B453C8E3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 12:44:49 +0200 (CEST)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx4nP-0007iP-Lg
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 06:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nx4lf-0006mx-86; Fri, 03 Jun 2022 06:42:59 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:44884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nx4ld-0005KS-Iz; Fri, 03 Jun 2022 06:42:58 -0400
Received: by mail-qt1-x831.google.com with SMTP id f35so5215339qtb.11;
 Fri, 03 Jun 2022 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X5wyTbJDDRzcsLHpd+6Ks9bUkxFOOcZvsrCWEKQ8jh0=;
 b=ZPsWY6RMHxJVGM8H03R+KWW6kzNogOR/IhJ57hP+yA+XL9ztnpwuvdCY9vNDsGVpLu
 rh/Yrzrnw/kAZnIumFvU/P1UVvEUaj25CcfRzuxUjUnK5sj1hQf23YELx1jLIya9cJKD
 VL5F9qEo/0bGgmd+/srOLYHdFgpGI4NBu1UpQviR7O7paIQMxU3dk6ApdlnVEKs5DSiy
 ZmlkQFQrGaSVW542cJIJBElmXQF92zUarQRNcsTS1uZBu1zaBz2/C2vtK81D+ctqrr/O
 Sw6iNXphaOXzn7RUcb1P3+l2qIkKqjytrUA4eggA/ipmAHc5UkRlMLrmKzF/AQGhDcCM
 od4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5wyTbJDDRzcsLHpd+6Ks9bUkxFOOcZvsrCWEKQ8jh0=;
 b=A1QM0aDbA/D/FZL/Ik0UzJurUnORpWC+nCJBQ+Yg/oz0xlyVY24nv/05kDDqpQOc9n
 9H8KqAe+b4T7pEqTfJ+BT4IGQAhucM136Kv3ajHmJNJb0Wie95NbHVPMXvtcIUp2/8W3
 lbhMrxHcaaPCNtpcfla9r4orTHOlP/iEWwm+jaib1/m7hdfxvMRt701z7ZWiOfgi3a/q
 ZEwVpMXn6i+UXj13JDemNNDRl4hoZ+8TztQUuCavvWZrYtsFJu7S4USwQAPKpSwo07qW
 tnhf3SWlPxjOSwFLCSlkqyQ4G+ASEyNSiYu1yr2nbCTyuZ9pPar9YDfbIp4wd9cYOofN
 9Hcg==
X-Gm-Message-State: AOAM532BSdu40urPthp6mfr1ZeZCz2FZW0YHmESQq4F8mJIhb15lzmDe
 UE4j6cDIpCnwWxqQsW1Kdeej0Gzjni6eBBkdk0g=
X-Google-Smtp-Source: ABdhPJxlXGx1wviN9k3Cr9x6CbEUodG3ZPzIJDNRrHi1af0t2b2+f/q0ebpk1wGG7985u2u1mM+t5m8o2YtwxYUdJws=
X-Received: by 2002:a05:622a:1386:b0:2f3:d73d:f5c4 with SMTP id
 o6-20020a05622a138600b002f3d73df5c4mr6800264qtk.658.1654252974107; Fri, 03
 Jun 2022 03:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220520180109.8224-1-shentey@gmail.com>
 <48f571d0-e783-4b31-7c90-3d330629c18c@ilande.co.uk>
In-Reply-To: <48f571d0-e783-4b31-7c90-3d330629c18c@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Fri, 3 Jun 2022 12:42:34 +0200
Message-ID: <CAG4p6K7jHWQEntQ0Tqv=CPufnHMnVA9-UPAbCzKKT142Q+rHZQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Random cleanup patches
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Jason Wang <jasowang@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e3f02e05e088c887"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=shentey@gmail.com; helo=mail-qt1-x831.google.com
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

--000000000000e3f02e05e088c887
Content-Type: text/plain; charset="UTF-8"

On Sat, May 21, 2022 at 11:55 AM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 20/05/2022 19:00, Bernhard Beschow wrote:
>
> > v2:
> > * Omit removal of isa_connect_gpio_out() (Mark)
> >
> > v1:
> > This patch series contains random cleanups that I made while studying
> the code.
> >
> > Bernhard Beschow (10):
> >    hw: Reuse TYPE_I8042 define
> >    hw/audio/cs4231a: Const'ify global tables
> >    hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
> >    hw/i386/pc: Unexport functions used only internally
> >    hw/i386/pc: Remove orphan declarations
> >    hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
> >    hw/net/fsl_etsec/etsec: Remove obsolete and unused etsec_create()
> >    accel/tcg/cpu-exec: Unexport dump_drift_info()
> >    accel/tcg: Inline dump_opcount_info() and remove it
> >    docs/devel: Fix link to developer mailing lists
> >
> >   accel/tcg/cpu-exec.c              |  4 ++--
> >   accel/tcg/translate-all.c         |  5 -----
> >   docs/devel/submitting-a-patch.rst |  6 +++---
> >   hw/audio/cs4231a.c                |  8 ++++----
> >   hw/i386/pc.c                      | 17 +++++++++++++----
> >   hw/net/fsl_etsec/etsec.c          | 23 -----------------------
> >   hw/net/fsl_etsec/etsec.h          |  7 -------
> >   hw/ppc/e500.c                     |  1 -
> >   hw/sparc64/sun4u.c                |  2 +-
> >   include/exec/cpu-all.h            |  3 ---
> >   include/hw/i386/pc.h              | 14 --------------
> >   11 files changed, 23 insertions(+), 67 deletions(-)
>
> In general these changes look okay, so I'd be fine to give an:
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
> for those I haven't already given a Reviewed-by tag for.
>
> Laurent, are you happy to take these patches with their current tags via
> qemu-trivial? Or would you prefer an extra set of eyes on the two
> accel/tcg ones first?
>

Ping


> ATB,
>
> Mark.
>

--000000000000e3f02e05e088c887
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, May 21, 2022 at 11:55 AM Mark Cav=
e-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">mark.cave-ayl=
and@ilande.co.uk</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 20/05/2022 19:00, Bernhard Be=
schow wrote:<br>
<br>
&gt; v2:<br>
&gt; * Omit removal of isa_connect_gpio_out() (Mark)<br>
&gt; <br>
&gt; v1:<br>
&gt; This patch series contains random cleanups that I made while studying =
the code.<br>
&gt; <br>
&gt; Bernhard Beschow (10):<br>
&gt;=C2=A0 =C2=A0 hw: Reuse TYPE_I8042 define<br>
&gt;=C2=A0 =C2=A0 hw/audio/cs4231a: Const&#39;ify global tables<br>
&gt;=C2=A0 =C2=A0 hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro<br>
&gt;=C2=A0 =C2=A0 hw/i386/pc: Unexport functions used only internally<br>
&gt;=C2=A0 =C2=A0 hw/i386/pc: Remove orphan declarations<br>
&gt;=C2=A0 =C2=A0 hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE<br>
&gt;=C2=A0 =C2=A0 hw/net/fsl_etsec/etsec: Remove obsolete and unused etsec_=
create()<br>
&gt;=C2=A0 =C2=A0 accel/tcg/cpu-exec: Unexport dump_drift_info()<br>
&gt;=C2=A0 =C2=A0 accel/tcg: Inline dump_opcount_info() and remove it<br>
&gt;=C2=A0 =C2=A0 docs/devel: Fix link to developer mailing lists<br>
&gt; <br>
&gt;=C2=A0 =C2=A0accel/tcg/cpu-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0accel/tcg/translate-all.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 -----<br>
&gt;=C2=A0 =C2=A0docs/devel/submitting-a-patch.rst |=C2=A0 6 +++---<br>
&gt;=C2=A0 =C2=A0hw/audio/cs4231a.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A0hw/i386/pc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 +++++++++++++----<br>
&gt;=C2=A0 =C2=A0hw/net/fsl_etsec/etsec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 23 -----------------------<br>
&gt;=C2=A0 =C2=A0hw/net/fsl_etsec/etsec.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 7 -------<br>
&gt;=C2=A0 =C2=A0hw/ppc/e500.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt;=C2=A0 =C2=A0hw/sparc64/sun4u.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0include/exec/cpu-all.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 3 ---<br>
&gt;=C2=A0 =C2=A0include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 14 --------------<br>
&gt;=C2=A0 =C2=A011 files changed, 23 insertions(+), 67 deletions(-)<br>
<br>
In general these changes look okay, so I&#39;d be fine to give an:<br>
<br>
Acked-by: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co=
.uk" target=3D"_blank">mark.cave-ayland@ilande.co.uk</a>&gt;<br>
<br>
for those I haven&#39;t already given a Reviewed-by tag for.<br>
<br>
Laurent, are you happy to take these patches with their current tags via <b=
r>
qemu-trivial? Or would you prefer an extra set of eyes on the two accel/tcg=
 ones first?<br></blockquote><div><br></div><div>Ping</div><div>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
ATB,<br>
<br>
Mark.<br>
</blockquote></div></div>

--000000000000e3f02e05e088c887--


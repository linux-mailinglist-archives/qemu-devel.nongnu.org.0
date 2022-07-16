Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF281576C2F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 08:29:37 +0200 (CEST)
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCbJ2-0007UW-Al
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 02:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oCbHm-00065G-Lr
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 02:28:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oCbHl-0007FC-1m
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 02:28:18 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 x23-20020a05600c179700b003a30e3e7989so2092979wmo.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 23:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bINC3ClDRHKcXADY8NN/HypCp+tRij59/OO6JS3/VGE=;
 b=LcdAVbrUkJUqEMS6bLReKeurJQO1VP5XWqkPNDOHNDOY0u7QkykO3Pdswwj/m/+Rxw
 lSaOUdAOVDjyMHpfebzNSS518bFU7l++3bRDK1LR3cmOST92vlfXMyCA2gocp7y/ov+z
 4lIHqGzzYfSFH52bIAKCdG7+/W3Vv9FFsazBZC7owL1NSWCg61wipN5tOhn/wjgrd9Rp
 2sk59I5py6L3L+QPWRwASBgGUkOASx6qcZ2IpLEkd7P3UunX609Ec2AkAhZTZTMHynDD
 pMitxQwP4LYYPYghqAM2OR2l9g89owR4aH6B4whQCZ4r7+ygn0+y45p3TxHlUg5s6Uvb
 /ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bINC3ClDRHKcXADY8NN/HypCp+tRij59/OO6JS3/VGE=;
 b=Pks/necb7p1Apy5Yj6h3Y21D6bzFJEeOirSjUmPqWN7qm27dcTF2SwY2DZm0jQ6EB8
 23tFkJUHqAp9eFtKEL5XfBxuUGcfFTsAD5XCGdSwwdSFU04ZYOTn8CesWHdG/+tLMVvX
 5fBjsR2P6TtyqnHVfb6Gz6ozmVG0CZHCF6VhDKzerWb644Pm1cKjP7ujKEnun+Swm1BG
 9qZsHbJboR77rpp+/AYrlT4KBm7r/lOl3gcG2QMUnLyuAKlxlFzKhVJLnanVsZ5/T8H2
 WzmE5CrvrBsZZgsrDooj37v4z4CqU1+lZ8B0JmkbXXawKwAqUPihfCZh4/ptuRm4li0e
 Z5+A==
X-Gm-Message-State: AJIora9oLf/S3c4q1SqqeJhi/geBIe6G9kyjfHtTfp+Uel3S4HKcMfO0
 u+sj3EZaJ/GjjXHOcbqbKnvKiNObF+H1OIzlxEKhNg==
X-Google-Smtp-Source: AGRyM1uXi4hbQ9xwPBlT02RJRTT2DZPA2qAL4d/uGz6YMjxS03KrawMuUy6fPJr/XC1kPaszapHyhZCPebguD/bNBOU=
X-Received: by 2002:a7b:c2aa:0:b0:39c:9039:e74b with SMTP id
 c10-20020a7bc2aa000000b0039c9039e74bmr23836923wmk.127.1657952894359; Fri, 15
 Jul 2022 23:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220711135750.765803-1-peter.maydell@linaro.org>
 <20220711135750.765803-21-peter.maydell@linaro.org>
 <CAFEAcA9vEk++s0Ly3Y1oyv6oOhDwJwda6j+OBgsWGTwbi=gk2A@mail.gmail.com>
In-Reply-To: <CAFEAcA9vEk++s0Ly3Y1oyv6oOhDwJwda6j+OBgsWGTwbi=gk2A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Sat, 16 Jul 2022 11:58:04 +0530
Message-ID: <CAFXwXr=nW3jZ2C67LSJC-J5suyQk9DCo-1RvC=j_+rYx1CXAjg@mail.gmail.com>
Subject: Re: [PULL 20/45] target/arm: Implement SME LD1, ST1
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000052b43705e3e63d9a"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000052b43705e3e63d9a
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 July 2022, 21:38 Peter Maydell, <peter.maydell@linaro.org> wrote:

> > +DO_LD(q, _be, MO_128)
>
> +DO_LD(q, _le, MO_128)
>
> Coverity complains that these uses of MO_128 result in an
> array overrun for the pred_esz_masks[] array, because e.g.
> sme_ld1() calls sve_cont_ldst_elements() calls which uses esz
> as an index into pred_esz_masks[]. (Multiple coverity issues,
> affects both loads and stores.)
>
> Do we just need to add an extra entry to the array for
> MO_128 (presumably 0x0001000100010001ull) ?
>

Yes.  I thought I had done that, but perhaps merely meant to do so.  Thanks
in advance.


r~

--00000000000052b43705e3e63d9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature">On Fri, 15 J=
uly 2022, 21:38 Peter Maydell, &lt;<a href=3D"mailto:peter.maydell@linaro.o=
rg" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; w=
rote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; +=
DO_LD(q, _be, MO_128)<br></blockquote><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; +DO_LD(q, _le, MO_128)<br>
<br>
Coverity complains that these uses of MO_128 result in an<br>
array overrun for the pred_esz_masks[] array, because e.g.<br>
sme_ld1() calls sve_cont_ldst_elements() calls which uses esz<br>
as an index into pred_esz_masks[]. (Multiple coverity issues,<br>
affects both loads and stores.)<br>
<br>
Do we just need to add an extra entry to the array for<br>
MO_128 (presumably 0x0001000100010001ull) ?<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Yes.=C2=A0 I thought I had done =
that, but perhaps merely meant to do so.=C2=A0 Thanks in advance.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">r~</d=
iv></div>

--00000000000052b43705e3e63d9a--


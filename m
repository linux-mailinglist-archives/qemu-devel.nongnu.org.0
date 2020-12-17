Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6469D2DCA8C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 02:31:35 +0100 (CET)
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpi8k-0003sL-1o
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 20:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpi5Z-0003HP-87
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:28:18 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpi5V-0003V4-S4
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:28:16 -0500
Received: by mail-ot1-x330.google.com with SMTP id w3so25556228otp.13
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 17:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJfr8qncSxGA04a3zhMoJ5svh4wK8lTnqf9OTlKh9X8=;
 b=JbDz9uxAT/4qA2RRPJutwaxzo9jyC/i7qTWfAXQlDY+1ERnYqi3rKPxGRRQe0m9pjK
 lYob/IYBWyA3obYoQWJuE4WzOF7hI1ep42MPQfyRfDaDHlNxq9uk4K3l2e2w/vXjx1uN
 eETnf/Zkfv4OdYpvtb8P1WkyzNNjpDahDaC5s+ocJ2IbPwiovpWMfQoJ34ffdojTFobH
 sTVFuWdqHN6wm6ExaD5AZ06BFl/ykwH8TlhXxGv37pOBrYnFEfMOjLllvZmEUlqrMIfE
 d7g1Xttq5NPChz6OBNC8VSGOBN+IPcJF3BOh461Qh+wSV7ER02yAK3J4iaLe5yHhym+P
 HKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJfr8qncSxGA04a3zhMoJ5svh4wK8lTnqf9OTlKh9X8=;
 b=t80RNAbBkENeL5Bypuwm1UfYJR+jFHyGv1y+Wmc8RsUo9+ZHtOkc9pgMrSDkPC2iuC
 oZhfq1eaekVNF5SdxsSPaaNzTqUvWcHfTG4sH4L1/CwGKVt4UpxUwG5VFN/h5HVdczH9
 jCHkeP8KNSHacNyXXmgoLtUrty/tRkB6PFIQo68c8l4KubdJiQnIcNLBF704aaZ9DaSl
 IVBMYfznm4M0HxdUesLn+8gfYOU8RnfJcJVu+ZZXY2iAztNYJyXr37wZIsoUVbRALNI6
 hBYWWNUfsfaTd76FAScJDKjPP91Bkcw3zeUicaladCWL+3+/sE/xK+8t0ZXg+dDLNpc/
 5r2A==
X-Gm-Message-State: AOAM531EPKOUeZMXJZBMPHqNdjuQrrrGbUdP0i96mhKf7m+c2BYKDcxL
 MPW2NoEqNnSLwOm7tD2rqmo22OjkdQmr6jcjhdj3yA==
X-Google-Smtp-Source: ABdhPJz0diZrjAlGnhe6Xp4GH/K51xKCBq1mWE8wSLalARWAto75W+uPMjAIZXaXouVt/vrOI2Bo0V7nQgegaFXl0qk=
X-Received: by 2002:a05:6830:1493:: with SMTP id
 s19mr27888896otq.175.1608168488905; 
 Wed, 16 Dec 2020 17:28:08 -0800 (PST)
MIME-Version: 1.0
References: <20201216180528.187152-1-richard.henderson@linaro.org>
In-Reply-To: <20201216180528.187152-1-richard.henderson@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 17 Dec 2020 09:27:59 +0800
Message-ID: <CAE_xrPiBL=XmD9Lee5mR_U1wv5vJdBag8gyMXT2iyr0eT4RHHQ@mail.gmail.com>
Subject: Re: [PATCH] tcg: Add tcg_gen_bswap_tl alias
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000085473105b69ee7b2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000085473105b69ee7b2
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 2:05 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> The alias is intended to indicate that the bswap is for the
> entire target_long.  This should avoid ifdefs on some targets.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-op.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index 5abf17fecc..5b3bdacc39 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -1085,6 +1085,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base,
> TCGArg offset, TCGType t);
>  #define tcg_gen_bswap16_tl tcg_gen_bswap16_i64
>  #define tcg_gen_bswap32_tl tcg_gen_bswap32_i64
>  #define tcg_gen_bswap64_tl tcg_gen_bswap64_i64
> +#define tcg_gen_bswap_tl tcg_gen_bswap64_i64
>  #define tcg_gen_concat_tl_i64 tcg_gen_concat32_i64
>  #define tcg_gen_extr_i64_tl tcg_gen_extr32_i64
>  #define tcg_gen_andc_tl tcg_gen_andc_i64
> @@ -1197,6 +1198,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base,
> TCGArg offset, TCGType t);
>  #define tcg_gen_ext32s_tl tcg_gen_mov_i32
>  #define tcg_gen_bswap16_tl tcg_gen_bswap16_i32
>  #define tcg_gen_bswap32_tl tcg_gen_bswap32_i32
> +#define tcg_gen_bswap_tl tcg_gen_bswap32_i32
>  #define tcg_gen_concat_tl_i64 tcg_gen_concat_i32_i64
>  #define tcg_gen_extr_i64_tl tcg_gen_extr_i64_i32
>  #define tcg_gen_andc_tl tcg_gen_andc_i32
> --
> 2.25.1
>
>
Thanks, I'll apply this one to my RISC-V B-extension patchset.

Reviewed-by: Frank Chang <frank.chang@sifive.com>

--00000000000085473105b69ee7b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 17, 2020 at 2:05 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">The alias is intended to indicate =
that the bswap is for the<br>
entire target_long.=C2=A0 This should avoid ifdefs on some targets.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/tcg/tcg-op.h | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h<br>
index 5abf17fecc..5b3bdacc39 100644<br>
--- a/include/tcg/tcg-op.h<br>
+++ b/include/tcg/tcg-op.h<br>
@@ -1085,6 +1085,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGAr=
g offset, TCGType t);<br>
=C2=A0#define tcg_gen_bswap16_tl tcg_gen_bswap16_i64<br>
=C2=A0#define tcg_gen_bswap32_tl tcg_gen_bswap32_i64<br>
=C2=A0#define tcg_gen_bswap64_tl tcg_gen_bswap64_i64<br>
+#define tcg_gen_bswap_tl tcg_gen_bswap64_i64<br>
=C2=A0#define tcg_gen_concat_tl_i64 tcg_gen_concat32_i64<br>
=C2=A0#define tcg_gen_extr_i64_tl tcg_gen_extr32_i64<br>
=C2=A0#define tcg_gen_andc_tl tcg_gen_andc_i64<br>
@@ -1197,6 +1198,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGAr=
g offset, TCGType t);<br>
=C2=A0#define tcg_gen_ext32s_tl tcg_gen_mov_i32<br>
=C2=A0#define tcg_gen_bswap16_tl tcg_gen_bswap16_i32<br>
=C2=A0#define tcg_gen_bswap32_tl tcg_gen_bswap32_i32<br>
+#define tcg_gen_bswap_tl tcg_gen_bswap32_i32<br>
=C2=A0#define tcg_gen_concat_tl_i64 tcg_gen_concat_i32_i64<br>
=C2=A0#define tcg_gen_extr_i64_tl tcg_gen_extr_i64_i32<br>
=C2=A0#define tcg_gen_andc_tl tcg_gen_andc_i32<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>Thanks, I&#39;ll apply this one to my =
RISC-V B-extension patchset.</div><div><br></div><div>Reviewed-by: Frank Ch=
ang &lt;<a href=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a=
>&gt;=C2=A0</div></div></div>

--00000000000085473105b69ee7b2--


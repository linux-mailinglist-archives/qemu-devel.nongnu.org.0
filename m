Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4D52EF7D6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:05:35 +0100 (CET)
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxx4o-0007xi-7C
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxx2h-0007JZ-O7
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:03:23 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:44228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxx2e-00051a-CM
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:03:23 -0500
Received: by mail-lf1-x130.google.com with SMTP id m25so25268368lfc.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jx3HgjgoqCryCu5BbtY+fpsMLc9rC/RAHqSiOqhmIhk=;
 b=GeCm1FvoAGZ84OyAJv6cUaw0iqlfVIYninQPjsPFenu5Mfehe//ZuBr27pJSEaJ7DB
 dT/C+0j2rhtqlFM9SlablSxyTTAcjnIk/oJDiAMU5w52VQWCoUPRWpaDbaf9r5ho3yRg
 wr0/JLxClf+EnLRHdt2/jdOPmm1ssaEqh7VPv0wM1xlebRN3WqdA+9LVwlwlf7qUzCl7
 iKErh6dg5RSFzulg44wtf/+euyR4gOqBTYIChsKcbsRq0vqX/CulKsrNVznffNomxE2l
 evWGFJrhwluCMeN8EtkA/DMxckrXVq18I2rMewYIE9rIGqVcyuFFXvxAXRIrrixZdhyS
 XuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jx3HgjgoqCryCu5BbtY+fpsMLc9rC/RAHqSiOqhmIhk=;
 b=QjHyVXyufl6LXsNnm3zcNeXxZUoRMq5jseZLe9A0vIE+Rgq0mUOqLz30mB9N9J+ioc
 bgtr5zhKwnuAxKA9OlFMpxHvcZFhKCmik3UDWsMWh1DKM0v+NT5M0o2tRz9qKuXdMD5R
 5XQTUM1m4ZX4PTEz4rTQY5N7qjW2RirdD4bAIPxaV+x/WGTA1Vh3Vm4TrnoV3OgpdmDd
 k/hDa/yvNE/OOhg868cBTlZZ1QzvJwcM1ugggQHLR6YKmGgytOG2cEw9M1aY0NUHAGRR
 oNnJmkU5mZaoFdiOtz3sRq6s2xGanfmmj1Fn2esCMYr8QMkLoQHuTzj4iouaEZhys5Gp
 CJ3g==
X-Gm-Message-State: AOAM533WJh+GtGhdEQhvuu2b4S4V5avs3XjqEPF/yzYaJGpiYz/GjAnq
 J4CTa/Mqnr0jBd7dhZgwOd9tXgUmuWyT1CRrNBYdoQ==
X-Google-Smtp-Source: ABdhPJyVZQGoCU7URtAhUjvHTxSoMmMB6XKVWwf77NZHMhH5Pm7AjuLmkhOClEPGA5GIbl8j990O2GVkX/HbKmSMwxo=
X-Received: by 2002:a2e:9b4f:: with SMTP id o15mr1933981ljj.393.1610132598044; 
 Fri, 08 Jan 2021 11:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20210108185154.8108-1-leif@nuviainc.com>
 <20210108185154.8108-4-leif@nuviainc.com>
In-Reply-To: <20210108185154.8108-4-leif@nuviainc.com>
Date: Fri, 8 Jan 2021 11:03:06 -0800
Message-ID: <CAGcCb11BFE-LaYdOw0N7STyL+n20GZr6bNz5C0z44JtLS8KMKg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/arm: make ARMCPU.ctr 64-bit
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: multipart/alternative; boundary="0000000000008c909e05b86835e9"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--0000000000008c909e05b86835e9
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 10:54 AM Leif Lindholm <leif@nuviainc.com> wrote:

> When FEAT_MTE is implemented, the AArch64 view of CTR_EL0 adds the
> TminLine field in bits [37:32].
> Extend the ctr field to be able to hold this context.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fadd1a47df..063228de2a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -931,7 +931,7 @@ struct ARMCPU {
>      uint64_t midr;
>      uint32_t revidr;
>      uint32_t reset_fpsid;
> -    uint32_t ctr;
> +    uint64_t ctr;
>      uint32_t reset_sctlr;
>      uint64_t pmceid0;
>      uint64_t pmceid1;
> --
> 2.20.1
>
>
>

--0000000000008c909e05b86835e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 8, 2021 at 10:54 AM Leif =
Lindholm &lt;<a href=3D"mailto:leif@nuviainc.com">leif@nuviainc.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When FEA=
T_MTE is implemented, the AArch64 view of CTR_EL0 adds the<br>
TminLine field in bits [37:32].<br>
Extend the ctr field to be able to hold this context.<br>
<br>
Signed-off-by: Leif Lindholm &lt;<a href=3D"mailto:leif@nuviainc.com" targe=
t=3D"_blank">leif@nuviainc.com</a>&gt;<br></blockquote><div>Reviewed-by: Ha=
o Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt;=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0target/arm/cpu.h | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/arm/cpu.h b/target/arm/cpu.h<br>
index fadd1a47df..063228de2a 100644<br>
--- a/target/arm/cpu.h<br>
+++ b/target/arm/cpu.h<br>
@@ -931,7 +931,7 @@ struct ARMCPU {<br>
=C2=A0 =C2=A0 =C2=A0uint64_t midr;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t revidr;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t reset_fpsid;<br>
-=C2=A0 =C2=A0 uint32_t ctr;<br>
+=C2=A0 =C2=A0 uint64_t ctr;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t reset_sctlr;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t pmceid0;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t pmceid1;<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000008c909e05b86835e9--


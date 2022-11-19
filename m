Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E155A630F54
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 17:07:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owQLg-0007XY-Pe; Sat, 19 Nov 2022 11:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1owQLW-0007Wn-E9
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 11:05:34 -0500
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1owQLU-0007cM-F3
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 11:05:34 -0500
Received: by mail-ua1-x92a.google.com with SMTP id a19so235447uan.2
 for <qemu-devel@nongnu.org>; Sat, 19 Nov 2022 08:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=24mUK75uGBhiKVaSZVy5JwU864ZMvYXUAhbuYCaH1Tg=;
 b=Vf7KXmRhaaLlCt116Lic8WDqZdyDmNY93gmnfrR77sPK05E1AMck1SMRCyZ8fIRC7K
 AtkLkAI0oQ4sA3Hka5v7p8mhtuILZEmGOMT8bfQh6GOmhvRHoaeegyD20bgcHMpSCoi2
 FLBXdwHNdx+F8RFd9qsPZRJQLSN/eHwvs2rKvs6alH70IUT2VsqWkFDOFAmfaegMmJww
 JmOKBJGzF5dJAcQtjgnSB8zgpGsLjvPT9bDCYY1V+X8aq+jbP8Cif9F7KwCzQZuRHFN0
 8EWHxiTquP2qyDyuIBuGVrXBxBUZIICPVECpmbf+zqEqcQxoEjABctUeO1k2221zamfg
 vMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=24mUK75uGBhiKVaSZVy5JwU864ZMvYXUAhbuYCaH1Tg=;
 b=PM2B9+Im4gn1UlEBEMCSnRkGgSmHNmNg5+VlbpoHy6/vxeqZH4DQPW/Y+All/9DW4P
 mSRrigns8kxw5cnHl5uEiz9HzBnnc5MJ6/RWKJNQAMr4/S4UljBpld75to7SO7rZYt80
 ypZoRgghO6E+g5Z1FnVhN19GHtw0/OAT/Akq/bEuceKCA85DqOBSNfosr3DFbUSjnB1W
 yKpg6BeTWQynqwTbwrflo9pPUD42N7mZYe7bEDLCyta6TTPP4H0vFzilGDV440pfD9iD
 rEYr+HhkYLheO4Ln/rrqRcruO9+jRopwwhDU6IBxj4LOB0fZqsuc/2ZefpF1dvcYIOZ2
 IiOQ==
X-Gm-Message-State: ANoB5pmNAFO6OvmMgcH35Qim9u8prAvmiOCnLCoJQfbqIKnb0l7Bo8W5
 NY/836T8+4WQ8Y3qEyGWDGfPDGZJ6twOVdwO5BrtP3FIRKeB4A==
X-Google-Smtp-Source: AA0mqf70+ZGDIKkz2r86ki3lZ1EVrt6geJmwhZNTbwmn5nZeaf/e4d3TpcGqjHZ1VBe3pft5pYQodSeIgRLdbbQ0IAQ=
X-Received: by 2002:a05:6130:316:b0:418:b66a:6f26 with SMTP id
 ay22-20020a056130031600b00418b66a6f26mr7220505uab.21.1668873920515; Sat, 19
 Nov 2022 08:05:20 -0800 (PST)
MIME-Version: 1.0
References: <166883734868.1540909.6779276759642478650.stgit@pasha-ThinkPad-X280>
 <166883736523.1540909.13390410919692851470.stgit@pasha-ThinkPad-X280>
In-Reply-To: <166883736523.1540909.13390410919692851470.stgit@pasha-ThinkPad-X280>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sat, 19 Nov 2022 18:04:44 +0200
Message-ID: <CAK4993iqa7CZttq9Vx4h6GLkcmO2mFdsHf8=fv1d4KAOtH7U_Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/avr: fix avr features processing
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, richard.henderson@linaro.org
Content-Type: multipart/alternative; boundary="00000000000035107905edd4fdaf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=mrolnik@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000035107905edd4fdaf
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Sat, Nov 19, 2022 at 7:56 AM Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
wrote:

> Bit vector for features has 64 bits. This patch fixes bit shifts in
> avr_feature and set_avr_feature functions to be 64-bit too.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  target/avr/cpu.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index cfdc0ecb70..8295e50fa0 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -166,12 +166,12 @@ vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu,
> vaddr addr);
>
>  static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
>  {
> -    return (env->features & (1U << feature)) != 0;
> +    return (env->features & (1ULL << feature)) != 0;
>  }
>
>  static inline void set_avr_feature(CPUAVRState *env, int feature)
>  {
> -    env->features |= (1U << feature);
> +    env->features |= (1ULL << feature);
>  }
>
>  #define cpu_list avr_cpu_list
>
>

-- 
Best Regards,
Michael Rolnik

--00000000000035107905edd4fdaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com" target=3D"_blank">mrolnik@gmail.com</a>&gt;</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 19, 2022=
 at 7:56 AM Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru=
" target=3D"_blank">pavel.dovgalyuk@ispras.ru</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Bit vector for features has 64=
 bits. This patch fixes bit shifts in<br>
avr_feature and set_avr_feature functions to be 64-bit too.<br>
<br>
Signed-off-by: Pavel Dovgalyuk &lt;<a href=3D"mailto:Pavel.Dovgalyuk@ispras=
.ru" target=3D"_blank">Pavel.Dovgalyuk@ispras.ru</a>&gt;<br>
---<br>
=C2=A0target/avr/cpu.h |=C2=A0 =C2=A0 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/target/avr/cpu.h b/target/avr/cpu.h<br>
index cfdc0ecb70..8295e50fa0 100644<br>
--- a/target/avr/cpu.h<br>
+++ b/target/avr/cpu.h<br>
@@ -166,12 +166,12 @@ vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, va=
ddr addr);<br>
<br>
=C2=A0static inline int avr_feature(CPUAVRState *env, AVRFeature feature)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 return (env-&gt;features &amp; (1U &lt;&lt; feature)) !=3D 0=
;<br>
+=C2=A0 =C2=A0 return (env-&gt;features &amp; (1ULL &lt;&lt; feature)) !=3D=
 0;<br>
=C2=A0}<br>
<br>
=C2=A0static inline void set_avr_feature(CPUAVRState *env, int feature)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 env-&gt;features |=3D (1U &lt;&lt; feature);<br>
+=C2=A0 =C2=A0 env-&gt;features |=3D (1ULL &lt;&lt; feature);<br>
=C2=A0}<br>
<br>
=C2=A0#define cpu_list avr_cpu_list<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>Best Regards,<br>Michael Rolnik</div>

--00000000000035107905edd4fdaf--


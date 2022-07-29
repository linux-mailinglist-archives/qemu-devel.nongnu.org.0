Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE95853FC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 18:49:31 +0200 (CEST)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTB4-0000RW-IQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 12:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oHT7s-0006ut-IG
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:46:12 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oHT7q-0004wz-U7
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:46:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k8so4512485wrd.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 09:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F5YTSJNCnEqk+GsWXKIRblgYg/9YHvoJohcpI1zaPB8=;
 b=lmwMm1K97mSSaJa6TUCTL0E91p5JS+8hVAZf0qTt2U62UFzeSyp3TrzyvtR2bFPX4z
 odZgWUSXSuXaqDxM4rXyhCFcPaHBG0+tqk6LF4JSY0mUqJK7wCGZCf7OVS9GRXBj1cla
 23Qgomoen9gkrJGbknyoWq+fXubLKexOhuqks86FeZrUul9PU6hYOksp+iibFgqfOzEL
 q6d4V/zqBR3m4wjhf14qPGeSQUS1pmnX3jm1UIbpR1AXF7toBrp5oKYIal9Np3sz3XB9
 u4d6S+kZmB6mgN37pOwhzur5caBc/KdvOWdzttCvqkhhZcFn+MGYLKIz+lLEfD94+Fyo
 Orkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5YTSJNCnEqk+GsWXKIRblgYg/9YHvoJohcpI1zaPB8=;
 b=K5VyihiUjp1kR0c9v5nPOKAjuxVK8Y0LEPQpnNQp9nlUg/1h9tsXWYy06jT5FyFzju
 mxiTAggjtPk6wRdd8xLxnU4vMBvDlZeMHaZXnJPyuq/Cx2MjYL3KN1eEU2eugNWFKCyD
 PnuFcVS3La+0oy6JxQmvYd7nQwwVTNRqizdnDMlcI/HkzRkvaWm2PAuP+nDDtVI3NzpX
 K4CJommL6QcXAaU3b9XScAJG3oczBypp5RtPR7hr+nCILnbRluT6i9XhKRNEFEMHwoCQ
 UoqLBmE6KPcM6Tl5zOehSI1vl/BlHqaw+y/+Y9veCAnQrrjwgH6DVzpOlLVFR5A+1wnc
 QabA==
X-Gm-Message-State: ACgBeo1jSTtM4y09TVEJsVOvzMBtyzZRtZhvHjz2e2Bo5HUSghkG2h1Y
 pMHLkxc+DP25flYfbkhid9anBiR2FynVy4H3Nd1Bv6g0n8Y=
X-Google-Smtp-Source: AA6agR4xfZSUwwXclAGzpoG7HdXPG4Uu2Dcyu7a6EACxotIFReuGIQJefjHq3ISoWQehJnsxhc4K2R25tUDBdKAsoE8=
X-Received: by 2002:a5d:5c12:0:b0:21f:1c6:c36 with SMTP id
 cc18-20020a5d5c12000000b0021f01c60c36mr3024614wrb.350.1659113168454; 
 Fri, 29 Jul 2022 09:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220712141804.99494-1-jaykhandkar2002@gmail.com>
In-Reply-To: <20220712141804.99494-1-jaykhandkar2002@gmail.com>
From: Jay Khandkar <jaykhandkar2002@gmail.com>
Date: Fri, 29 Jul 2022 22:15:56 +0530
Message-ID: <CACZoLXF6-0Zk3GPj2OrfMsus0kkJCVY6mSPXk9uB18YdMzEkHg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: Handle software disabling of APIC correctly
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mst@redhat.com
Content-Type: multipart/alternative; boundary="0000000000000c495305e4f463f2"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jaykhandkar2002@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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

--0000000000000c495305e4f463f2
Content-Type: text/plain; charset="UTF-8"

Ping?

On Tue, 12 Jul 2022, 19:49 Jay Khandkar, <jaykhandkar2002@gmail.com> wrote:

> When the local APIC is in a software disabled state, all local interrupt
> sources must be masked and all attempts to unmask them should be
> ignored. Currently, we don't do either. Fix this by handling it
> correctly in apic_mem_write().
>
> Signed-off-by: Jay Khandkar <jaykhandkar2002@gmail.com>
> ---
>  hw/intc/apic.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 3df11c34d6..493c70af62 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -792,9 +792,16 @@ static void apic_mem_write(void *opaque, hwaddr addr,
> uint64_t val,
>          s->dest_mode = val >> 28;
>          break;
>      case 0x0f:
> -        s->spurious_vec = val & 0x1ff;
> -        apic_update_irq(s);
> -        break;
> +        {
> +            s->spurious_vec = val & 0x1ff;
> +            if (!(val & APIC_SPURIO_ENABLED)) {
> +                for (int i = 0; i < APIC_LVT_NB; i++) {
> +                    s->lvt[i] |= APIC_LVT_MASKED;
> +                }
> +            }
> +            apic_update_irq(s);
> +            break;
> +        }
>      case 0x10 ... 0x17:
>      case 0x18 ... 0x1f:
>      case 0x20 ... 0x27:
> @@ -812,6 +819,9 @@ static void apic_mem_write(void *opaque, hwaddr addr,
> uint64_t val,
>      case 0x32 ... 0x37:
>          {
>              int n = index - 0x32;
> +            if (!(s->spurious_vec & APIC_SPURIO_ENABLED)) {
> +                val |= APIC_LVT_MASKED;
> +            }
>              s->lvt[n] = val;
>              if (n == APIC_LVT_TIMER) {
>                  apic_timer_update(s,
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> --
> 2.37.0
>
>

--0000000000000c495305e4f463f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, 12 Jul 2022, 19:49 Jay Khandkar, &lt;<a href=
=3D"mailto:jaykhandkar2002@gmail.com">jaykhandkar2002@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">When the local APIC is in a sof=
tware disabled state, all local interrupt<br>
sources must be masked and all attempts to unmask them should be<br>
ignored. Currently, we don&#39;t do either. Fix this by handling it<br>
correctly in apic_mem_write().<br>
<br>
Signed-off-by: Jay Khandkar &lt;<a href=3D"mailto:jaykhandkar2002@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">jaykhandkar2002@gmail.com</a>&gt;<br=
>
---<br>
=C2=A0hw/intc/apic.c | 16 +++++++++++++---<br>
=C2=A01 file changed, 13 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/intc/apic.c b/hw/intc/apic.c<br>
index 3df11c34d6..493c70af62 100644<br>
--- a/hw/intc/apic.c<br>
+++ b/hw/intc/apic.c<br>
@@ -792,9 +792,16 @@ static void apic_mem_write(void *opaque, hwaddr addr, =
uint64_t val,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;dest_mode =3D val &gt;&gt; 28;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case 0x0f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;spurious_vec =3D val &amp; 0x1ff;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_update_irq(s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;spurious_vec =3D val &amp;=
 0x1ff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(val &amp; APIC_SPURIO_ENAB=
LED)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; =
i &lt; APIC_LVT_NB; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&g=
t;lvt[i] |=3D APIC_LVT_MASKED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_update_irq(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0case 0x10 ... 0x17:<br>
=C2=A0 =C2=A0 =C2=A0case 0x18 ... 0x1f:<br>
=C2=A0 =C2=A0 =C2=A0case 0x20 ... 0x27:<br>
@@ -812,6 +819,9 @@ static void apic_mem_write(void *opaque, hwaddr addr, u=
int64_t val,<br>
=C2=A0 =C2=A0 =C2=A0case 0x32 ... 0x37:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int n =3D index - 0x32;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(s-&gt;spurious_vec &amp; A=
PIC_SPURIO_ENABLED)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val |=3D APIC_LVT_=
MASKED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;lvt[n] =3D val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (n =3D=3D APIC_LVT_TIMER=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0apic_timer_up=
date(s, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));<br>
-- <br>
2.37.0<br>
<br>
</blockquote></div>

--0000000000000c495305e4f463f2--


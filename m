Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2825A39B5
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 21:20:05 +0200 (CEST)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oS1Lg-0001hh-DM
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 15:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oS1Gq-0005lz-Rj
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 15:15:04 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:34423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oS1Gp-0004Tw-3v
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 15:15:04 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id b128so1085144vsc.1
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 12:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=leLz6ByVsJHl4pgZnth+PXSmYZ8l3twD5QJbXUsLpng=;
 b=HJV/sj+o6dtZuWdFyJbgcOBi9F6r6EursHEdgAHCWM9Q+1jN/U7mp/plO5yODpKIDL
 QYf8BCw3IXOeSb1L0stUhCxcLwAKBJCVbVbeWTzajK5sFVvArmk82stgIu4mKCNsJHk4
 25oC+yrBtSaQGvwrWlckn4NO5vQUj5mZQqpo3IaljJvfDvN44ZzZLQsJbfkd9t3Ut3RO
 ahYl2HSuJSx3Qj+xGGSFMlflQ60158l98Mhqv9rv2UKIOdX1yNztCdbu5Z2yiKBc7TNZ
 IXqYhxHVfI1jhlwTZC+IMpsHF4eq7CCOLFdg11JrB/nGDWNt5RAXfhMql3vr7Ar8Mhz1
 8LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=leLz6ByVsJHl4pgZnth+PXSmYZ8l3twD5QJbXUsLpng=;
 b=PPQ0NamX21yuCRMiqTQQedCnqh8IcS6Wj65hLMbQaMdltOFu8SwxR54ePJ87LG0v5n
 jDWzDPvsHdkCCSs/KahKZWLmr2mqzKZMp4NmDRDFb6o2YSs4W6hcAzU9bVXtgHnjOkQf
 nCEjGNhnUC3/4XQeEpgeVa/zGB1A0gA5+de+yil0AWGrj7wtc7o4AOPq2JkeGP3eLJIV
 QNRIsOU815QX5z6N6rwJtrMA9HhQJTrJtvQfyoCAM0Fgvy0YZjq2FLl/TJ5Z/bCxg5Mk
 oAmU90IZUsk7vtXl0cLzTQ5YI9Y3Q9v1cMq/cNuJtk+EVdjnKhKKOE1q4iQy0d1YbWOz
 e4OA==
X-Gm-Message-State: ACgBeo2YCFchpOSViAWG6+2M4JXpyPeqviUvGfak57rVieXrpBwqDO9q
 F0a7Pw0d4hXJEq1hEKi7tbnstdHfJ66D6i09Wm6L/GW6Foo=
X-Google-Smtp-Source: AA6agR5nCcid9NCqKPbxqZ/hTPIIlxD7q4k313+ip8ykseON3EkUvVVsKkBZDqNSRhxiwUotkI4BPTjBD+UTYcntALA=
X-Received: by 2002:a67:e0c7:0:b0:390:50e8:e492 with SMTP id
 m7-20020a67e0c7000000b0039050e8e492mr1522516vsl.36.1661627702027; Sat, 27 Aug
 2022 12:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220826205518.2339352-1-richard.henderson@linaro.org>
 <20220826205518.2339352-2-richard.henderson@linaro.org>
In-Reply-To: <20220826205518.2339352-2-richard.henderson@linaro.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sat, 27 Aug 2022 22:14:25 +0300
Message-ID: <CAK4993g-XUch2feYLARhF+e2zrCS4fZ6Ue7QPx7fyfDiQ-ZTnA@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/avr: Call avr_cpu_do_interrupt directly
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000edaa0b05e73dd8ab"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=mrolnik@gmail.com; helo=mail-vs1-xe2e.google.com
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

--000000000000edaa0b05e73dd8ab
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Fri, Aug 26, 2022 at 11:55 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> There is no need to go through cc->tcg_ops when
> we know what value that must have.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/helper.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/avr/helper.c b/target/avr/helper.c
> index 82284f8997..9614ccf3e4 100644
> --- a/target/avr/helper.c
> +++ b/target/avr/helper.c
> @@ -29,14 +29,13 @@
>  bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      bool ret = false;
> -    CPUClass *cc = CPU_GET_CLASS(cs);
>      AVRCPU *cpu = AVR_CPU(cs);
>      CPUAVRState *env = &cpu->env;
>
>      if (interrupt_request & CPU_INTERRUPT_RESET) {
>          if (cpu_interrupts_enabled(env)) {
>              cs->exception_index = EXCP_RESET;
> -            cc->tcg_ops->do_interrupt(cs);
> +            avr_cpu_do_interrupt(cs);
>
>              cs->interrupt_request &= ~CPU_INTERRUPT_RESET;
>
> @@ -47,7 +46,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>          if (cpu_interrupts_enabled(env) && env->intsrc != 0) {
>              int index = ctz32(env->intsrc);
>              cs->exception_index = EXCP_INT(index);
> -            cc->tcg_ops->do_interrupt(cs);
> +            avr_cpu_do_interrupt(cs);
>
>              env->intsrc &= env->intsrc - 1; /* clear the interrupt */
>              if (!env->intsrc) {
> --
> 2.34.1
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000edaa0b05e73dd8ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 11:55 PM Ri=
chard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard=
.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">There is no need to go through cc-&gt;tcg_ops when<br>
we know what value that must have.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/avr/helper.c | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/target/avr/helper.c b/target/avr/helper.c<br>
index 82284f8997..9614ccf3e4 100644<br>
--- a/target/avr/helper.c<br>
+++ b/target/avr/helper.c<br>
@@ -29,14 +29,13 @@<br>
=C2=A0bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0bool ret =3D false;<br>
-=C2=A0 =C2=A0 CPUClass *cc =3D CPU_GET_CLASS(cs);<br>
=C2=A0 =C2=A0 =C2=A0AVRCPU *cpu =3D AVR_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUAVRState *env =3D &amp;cpu-&gt;env;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT_RESET) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_interrupts_enabled(env)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D =
EXCP_RESET;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc-&gt;tcg_ops-&gt;do_interrupt(=
cs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avr_cpu_do_interrupt(cs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;interrupt_request &a=
mp;=3D ~CPU_INTERRUPT_RESET;<br>
<br>
@@ -47,7 +46,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_r=
equest)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_interrupts_enabled(env) &amp;&amp=
; env-&gt;intsrc !=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int index =3D ctz32(env-&gt=
;intsrc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D =
EXCP_INT(index);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc-&gt;tcg_ops-&gt;do_interrupt(=
cs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avr_cpu_do_interrupt(cs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;intsrc &amp;=3D env=
-&gt;intsrc - 1; /* clear the interrupt */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!env-&gt;intsrc) {<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000edaa0b05e73dd8ab--


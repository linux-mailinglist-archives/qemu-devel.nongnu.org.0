Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3395A39B4
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 21:19:07 +0200 (CEST)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oS1Kh-0000WI-R9
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 15:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oS1GG-0004jn-7I
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 15:14:28 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:38432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oS1GE-0004BL-Hw
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 15:14:27 -0400
Received: by mail-vs1-xe30.google.com with SMTP id n125so4713753vsc.5
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ZlNBOCFyGU6OUOedhbrrGbmDu4OuaCbKKPMyJKHbrz4=;
 b=E4NHdsX/Z38gp729ImQ1+Keigw8OkhpZ7RCa+BySV2CehV7QTZ88AStK6NKKCKwKf4
 jHv3UTiMQ4FIFHmYud0aHXApEzhpW/w+ZJrNnDOBntcKu1bg7VzYwjQe/IMvqd1H47Pr
 M/CCuv4bMbuWi6ukKwJv9N0mqAVDZEc81RVAwSLIZFmF//I3l1l/IexJnT8d7tgu6alc
 vn9/dfgycubU5fmQpSXojAdPJelR9pj1jmJZJFNhJZa9Ml29XuRYg6QmTwb9WoW5Ut/b
 wfZg/AuTgOsWkvT3peDgumtoXt6WzQUTolIM0nZ6i9dTVJ5fuH2B+KfEgeNeXfmORb9x
 t3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ZlNBOCFyGU6OUOedhbrrGbmDu4OuaCbKKPMyJKHbrz4=;
 b=3Lb0jiP/NpZcIC/wFQN/sUs3dqH/H2yQ6rFKX4L+jbmYr/3TjSFp6dc4QDGaZtBEdu
 hMDxc3AHeWBEf4si7l+pfnG5sTcy8OL7vi7jAf3aTi3y7pRFEw83zkGonaDx3fnNPwcU
 i3szZy0LLO9v9MIXvEY9H1N0IRWq1T1RPudXWKNzrUN/nmiOXsq39KS4iADromPGZj0b
 b9v+6PBikfi5t8dNGnNbt4r+7oxLMmXQgIuIderg3yIRpQfvsShdVxAFPmTjeN44J+a+
 3a6woqdxKK7nnWBTHnfkTdwzmeoECbMML4tyWNYNXa1/DreP1hHc2cmendzSzZHgW1rY
 4gZg==
X-Gm-Message-State: ACgBeo0D58L5gocjxT590fsGS8xcAoy8xqN9deQACHHAQYSv32LlAiMx
 b5TbXvsKnT/n9dpzbhfJC8z82ZHjrrhxPBMygUgsthlq
X-Google-Smtp-Source: AA6agR67JU8m1An7P2LdHCBth7s/lx1np8KD8dFvwQL7xY1tDcD2LabB6SNbeZ5DystlUTHFrGsBmVf1pdPc9MBLapE=
X-Received: by 2002:a05:6102:3d25:b0:390:c073:a963 with SMTP id
 i37-20020a0561023d2500b00390c073a963mr1030198vsv.52.1661627665203; Sat, 27
 Aug 2022 12:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220826205518.2339352-1-richard.henderson@linaro.org>
 <20220826205518.2339352-3-richard.henderson@linaro.org>
In-Reply-To: <20220826205518.2339352-3-richard.henderson@linaro.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sat, 27 Aug 2022 22:13:49 +0300
Message-ID: <CAK4993hcNM5xXD_=JekJg4BfST-1OGmdOyV3OJ55CtBM3LLFFA@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/avr: Only execute one interrupt at a time
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bbc67605e73dd688"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=mrolnik@gmail.com; helo=mail-vs1-xe30.google.com
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

--000000000000bbc67605e73dd688
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Fri, Aug 26, 2022 at 11:55 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> We cannot deliver two interrupts simultaneously;
> the first interrupt handler must execute first.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/helper.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/target/avr/helper.c b/target/avr/helper.c
> index 9614ccf3e4..34f1cbffb2 100644
> --- a/target/avr/helper.c
> +++ b/target/avr/helper.c
> @@ -28,7 +28,6 @@
>
>  bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> -    bool ret = false;
>      AVRCPU *cpu = AVR_CPU(cs);
>      CPUAVRState *env = &cpu->env;
>
> @@ -38,8 +37,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>              avr_cpu_do_interrupt(cs);
>
>              cs->interrupt_request &= ~CPU_INTERRUPT_RESET;
> -
> -            ret = true;
> +            return true;
>          }
>      }
>      if (interrupt_request & CPU_INTERRUPT_HARD) {
> @@ -52,11 +50,10 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>              if (!env->intsrc) {
>                  cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
>              }
> -
> -            ret = true;
> +            return true;
>          }
>      }
> -    return ret;
> +    return false;
>  }
>
>  void avr_cpu_do_interrupt(CPUState *cs)
> --
> 2.34.1
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000bbc67605e73dd688
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 11:55 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">We cannot deliver two interrupts simultaneously;<br>
the first interrupt handler must execute first.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/avr/helper.c | 9 +++------<br>
=C2=A01 file changed, 3 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/target/avr/helper.c b/target/avr/helper.c<br>
index 9614ccf3e4..34f1cbffb2 100644<br>
--- a/target/avr/helper.c<br>
+++ b/target/avr/helper.c<br>
@@ -28,7 +28,6 @@<br>
<br>
=C2=A0bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool ret =3D false;<br>
=C2=A0 =C2=A0 =C2=A0AVRCPU *cpu =3D AVR_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUAVRState *env =3D &amp;cpu-&gt;env;<br>
<br>
@@ -38,8 +37,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_r=
equest)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avr_cpu_do_interrupt(cs);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;interrupt_request &a=
mp;=3D ~CPU_INTERRUPT_RESET;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>
@@ -52,11 +50,10 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt=
_request)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!env-&gt;intsrc) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;interr=
upt_request &amp;=3D ~CPU_INTERRUPT_HARD;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 return ret;<br>
+=C2=A0 =C2=A0 return false;<br>
=C2=A0}<br>
<br>
=C2=A0void avr_cpu_do_interrupt(CPUState *cs)<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000bbc67605e73dd688--


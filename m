Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52D1445CE0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 01:01:47 +0100 (CET)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mimfy-0001eh-9h
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 20:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mimeg-0000iU-2W
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 20:00:26 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:45773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mimeF-00018F-Qm
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 20:00:25 -0400
Received: by mail-ua1-x935.google.com with SMTP id ay21so14015745uab.12
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 16:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etDdz7r9ka1d6Iyc8TT+35IHert1sULZbtZ+2T+ACms=;
 b=HRWsxRyODr1a5/chyWbFxXsaZSp5xZGbN14b14MJFYsVaTk/YFYcQtjHjI4r+89QTb
 BuT9vhns0NvdjzHkxwMwVYqGFlDVK+tfou5raQEkGnGO0g5yUxNdnWdbXZcE0ctvogGl
 DstkyDEAhig4umyEcFVT1MkgFHzDK81PBIRS8viUgG7Fnd4IuBseHurOfIcon31z9fBP
 uTadIyF3eHMRNNyvWxRw8Z/weVSMdyz2kBJ4FHUWoVGCty11n9/Bmr2AottZhq0ZDIFY
 t2ttKqQbzNGnfJZnHQtcvZds+3307mrubdA0F1RkldyaAVcuGiR/ntwYw59Pfvnyvsq2
 wwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etDdz7r9ka1d6Iyc8TT+35IHert1sULZbtZ+2T+ACms=;
 b=B+JsLp26sBtsN7oxjkqald/2QDrpL10NKpzUBG/LL3cgdRmaPIBXXWjhtFWoSfwvyk
 SQus/JrYhfuYPqwnKdXJsAo2IxwE8Ur43V/Wh0RgQVaUWL1VDnPdr/fepG2npjVD+gD2
 of+g6/xJGLuOmyXGWOg04hGJ0cab1OmUG2CD7BDCIiYlKR1ic2A/XLmcLfABzBuMAInR
 r/pOvq/KjLfp5ejpfUX1EPG0JMET2nkhb55bs0WZk3eZXyuMWqotmRTqg2Xy18p3imH6
 Xow0BoEPaqG/k+iLi00jzMSbAhi9bgeeHEgUAme/n/OOIcaEyMnMqArkD8WdEW4sMJh3
 IZ5w==
X-Gm-Message-State: AOAM533CqBCZf09pIAiwbT0S5CuKkt5HnolYoF9ZP2Gis6VgO9SjJsf2
 7+JvGVwEjfELonapG5Hi6g07/VHWyDs0Iwgt3ZGNpw==
X-Google-Smtp-Source: ABdhPJzMczPV71y1l7fTwU5vOVPZD/4ooeSrYm/TY7+oxHsJlZjvKHPDDFiJ5PdWfPe4w/pmHKkC2uc08nEcP400d4U=
X-Received: by 2002:a9f:21d7:: with SMTP id 81mr37066813uac.39.1636070395005; 
 Thu, 04 Nov 2021 16:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211104140536.42573-1-imp@bsdimp.com>
 <20211104140536.42573-24-imp@bsdimp.com>
 <a4809133-bdae-8c06-511c-0aa9af6f3362@linaro.org>
In-Reply-To: <a4809133-bdae-8c06-511c-0aa9af6f3362@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 4 Nov 2021 17:59:43 -0600
Message-ID: <CANCZdfru-o2tX_AJWOCxmBjpXTEbCpb-nHk8t1dGpxrhUv-29A@mail.gmail.com>
Subject: Re: [PATCH v3 23/29] bsd-user/arm/target_arch_signal.h: arm
 set_mcontext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b8e4d505cfff52ce"
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b8e4d505cfff52ce
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021 at 12:43 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/4/21 10:05 AM, Warner Losh wrote:
> > +    /*
> > +     * Make sure T mode matches the PC's notion of thumb mode, although
> > +     * FreeBSD lets the processor sort this out, so we may need remove
> > +     * this check, or generate a signal...
> > +     */
> > +    if (!!(tswap32(gr[TARGET_REG_PC]) & 1) != !!(cpsr & CPSR_T)) {
> > +        return -TARGET_EINVAL;
> > +    }
>
> I've had a read through the Arm ARM for "movs pc, lr", which is how
> swi_exit returns to
> userspace:
>
>      CPSRWriteByInstr(SPSR[], '1111', TRUE);
>      ...
>      BranchWritePC(result);
>
> So the CPSR gets written first, which sets the T bit, and thus the result
> of
> CurrentInstrSet(), then
>
> BranchWritePC(bits(32) address)
>    if CurrentInstrSet() == InstrSet_ARM then
>      if ArchVersion() < 6 && address<1:0> != '00' then UNPREDICTABLE;
>      BranchTo(address<31:2>:'00');
>    ...
>    else
>      BranchTo(address<31:1>:'0');
>
> > +    env->regs[15] = tswap32(gr[TARGET_REG_PC]);
>
> So this should mask the low 1 or 2 bits depending on cpsr & CPSR_T.
>

Will do. Thanks for all the patient explanations.

Warner


> r~
>

--000000000000b8e4d505cfff52ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 4, 2021 at 12:43 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/4/21 10:05 AM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Make sure T mode matches the PC&#39;s notion of=
 thumb mode, although<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* FreeBSD lets the processor sort this out, so we=
 may need remove<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* this check, or generate a signal...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (!!(tswap32(gr[TARGET_REG_PC]) &amp; 1) !=3D !!(cpsr=
 &amp; CPSR_T)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EINVAL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
I&#39;ve had a read through the Arm ARM for &quot;movs pc, lr&quot;, which =
is how swi_exit returns to <br>
userspace:<br>
<br>
=C2=A0 =C2=A0 =C2=A0CPSRWriteByInstr(SPSR[], &#39;1111&#39;, TRUE);<br>
=C2=A0 =C2=A0 =C2=A0...<br>
=C2=A0 =C2=A0 =C2=A0BranchWritePC(result);<br>
<br>
So the CPSR gets written first, which sets the T bit, and thus the result o=
f <br>
CurrentInstrSet(), then<br>
<br>
BranchWritePC(bits(32) address)<br>
=C2=A0 =C2=A0if CurrentInstrSet() =3D=3D InstrSet_ARM then<br>
=C2=A0 =C2=A0 =C2=A0if ArchVersion() &lt; 6 &amp;&amp; address&lt;1:0&gt; !=
=3D &#39;00&#39; then UNPREDICTABLE;<br>
=C2=A0 =C2=A0 =C2=A0BranchTo(address&lt;31:2&gt;:&#39;00&#39;);<br>
=C2=A0 =C2=A0...<br>
=C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0BranchTo(address&lt;31:1&gt;:&#39;0&#39;);<br>
<br>
&gt; +=C2=A0 =C2=A0 env-&gt;regs[15] =3D tswap32(gr[TARGET_REG_PC]);<br>
<br>
So this should mask the low 1 or 2 bits depending on cpsr &amp; CPSR_T.<br>=
</blockquote><div><br></div><div>Will do. Thanks for all the patient explan=
ations.</div><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--000000000000b8e4d505cfff52ce--


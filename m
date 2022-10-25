Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FB760CA13
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 12:30:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onHAZ-0006cF-Aw; Tue, 25 Oct 2022 06:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1onHAS-0005Uj-1y
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:28:20 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1onHAN-0000Yo-Hg
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:28:19 -0400
Received: by mail-ed1-x533.google.com with SMTP id a5so22412720edb.11
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 03:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rUCbCT4XRms0l7y45nvWQTmRC97wvHYmzTjlaZhNU6A=;
 b=hxSmyU2uxFMntPtQIUr0u9bfmRmA+PD2I+OFnsCEkdZApJFGNU5X1GI/5b8KQjR3VR
 /Pe97MzomWbz4/1A6dr0e3MZZ9qJnfJA0PpZwWqVwGJW/+bklschdcAdzAo4MNmJjNVV
 SE7TT7sTlJN89zbNsDZ7nshA84HAu6rgOLoSr6QiHSX6vXNBrGW1+ssVonuzkN98EGPf
 OGMRZqLX6Dw28fkYol2+JsLWuNnNjNQHhYDhFdtD6ShH9pWcFpvQmjPwlMoQdf+ecMic
 BrWdXlyjHsbsEKIuVrEbJ4vTVkqfERdjydJJdP5sAu7TSzKc4/KWWP4x8+MljlICK0eE
 PfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rUCbCT4XRms0l7y45nvWQTmRC97wvHYmzTjlaZhNU6A=;
 b=w0cbbdsEMkEC1tLlEBTdL+UnJH4us/jqv4Gp2bZKi11rO328VaqgHLUAcyHmTGE1tI
 Ii4r8Wefx6kitwLRCA/CLYHCA0zXUH/0rnef0pOb5uD/+r/JWxQwwcRwUMiTD5pg4Auw
 xbhsTAl0V9cvG6tRyMART+HM2xeGK1eF7D+xKOvkldT2JRzx4QvcgUmT20eskg2oZ0He
 kxdzgKFGqftsyvNAnP1tB0pT+cHqxmUyTaPH+X6/HGDp2NOk8ytEO04aoThHTeyjjO5r
 Q2gx2LHTjpzUr0doFOqsCL4DXU74dmtcVCRXuk4sdI2vF1m9eNKv/kRaAW/qqlx8qBv5
 S/eA==
X-Gm-Message-State: ACrzQf0rasLhjxpoUenYE7+7xLEk79npY+ksYnpbxwmYITMHKX5yJQcm
 cp9bFS+H2OegygtoisqXPiwe+dHiog0WBSTRfUvWXw==
X-Google-Smtp-Source: AMsMyM4PV7kXjNQYVJTT542zX8X4Qc4RteR9a16RDzulBiDzB/WZ708gZ9npzGRGOmLm/XOiXhWzaJp7TKq3YsMdiMs=
X-Received: by 2002:a05:6402:2707:b0:45c:d8a3:6cfc with SMTP id
 y7-20020a056402270700b0045cd8a36cfcmr35263267edd.269.1666693692425; Tue, 25
 Oct 2022 03:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221017092432.546881-1-ake@igel.co.jp>
 <CAFEAcA9sQ-QJCw_P3OAp5O9o7pHcpz1kwmSi+=Dg4qqMfYt1iQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9sQ-QJCw_P3OAp5O9o7pHcpz1kwmSi+=Dg4qqMfYt1iQ@mail.gmail.com>
From: Ake Koomsin <ake@igel.co.jp>
Date: Tue, 25 Oct 2022 19:28:01 +0900
Message-ID: <CADd_P+kQaaLkbV5vve79TTy-r+wvxqr03f=RJqjQYJVKq-EBrA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: honor HCR_E2H and HCR_TGE in
 arm_excp_unmasked()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007cc06a05ebd95d2a"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ake@igel.co.jp; helo=mail-ed1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000007cc06a05ebd95d2a
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 1:37 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 17 Oct 2022 at 10:29, Ake Koomsin <ake@igel.co.jp> wrote:
> >
> > An exception targeting EL2 from lower EL is actually maskable when
> > HCR_E2H and HCR_TGE are both set. This applies to both secure and
> > non-secure Security state.
> >
> > Signed-off-by: Ake Koomsin <ake@igel.co.jp>
> > ---
> >  target/arm/cpu.c | 24 +++++++++++++++++-------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 94ca6f163f..86d3377d3f 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -561,14 +561,24 @@ static inline bool arm_excp_unmasked(CPUState *cs,
> unsigned int excp_idx,
> >      if ((target_el > cur_el) && (target_el != 1)) {
> >          /* Exceptions targeting a higher EL may not be maskable */
> >          if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> > -            /*
> > -             * 64-bit masking rules are simple: exceptions to EL3
> > -             * can't be masked, and exceptions to EL2 can only be
> > -             * masked from Secure state. The HCR and SCR settings
> > -             * don't affect the masking logic, only the interrupt
> routing.
> > -             */
> > -            if (target_el == 3 || !secure || (env->cp15.scr_el3 &
> SCR_EEL2)) {
> > +            switch (target_el) {
> > +            case 2:
> > +                /*
> > +                 * According to ARM DDI 0487H.a, an interrupt can be
> masked
> > +                 * when HCR_E2H and HCR_TGE are both set regardless of
> the
> > +                 * current Security state. Note that We need to revisit
> this
> > +                 * part again once we need to support NMI.
> > +                 */
> > +                if ((hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H |
> HCR_TGE)) {
> > +                        unmasked = true;
> > +                }
> > +                break;
> > +            case 3:
> > +                /* Interrupt cannot be masked when the target EL is 3 */
> >                  unmasked = true;
> > +                break;
> > +            default:
> > +                g_assert_not_reached();
>
> Hi; thanks for this patch. You're correct that there is a bug here, but
> it took me a while to work out why it's OK to remove the "don't allow
> masking if we're in Secure EL0/EL1 and the exception is going to NS EL2"
> check. The answer to that turns out to be "the target_el could never be
> 2 anyway in that case": because arm_phys_excp_target_el() uses
> arm_hcr_el2_eff(),
> if we're Secure and SEL2 isn't enabled then the effective HCR_EL2 bits
> will all be zero, which forces us into the "targets EL1" or "targets EL3"
> cases.
>
> So I think that's worth mentioning in the commit message:
>
> "We can remove the conditions that try to suppress masking of
> interrupts when we are Secure and the exception targets EL2 and
> Secure EL2 is disabled, because in that case arm_phys_excp_target_el()
> will never return 2 as the target EL. The 'not if secure' check
> in this function was originally written before arm_hcr_el2_eff(), and
> back then the target EL could be 2 even if we were in Secure EL0/EL1;
> it is no longer needed."
>
> I'll apply this to target-arm.next, with the commit message
> updated to include that.
>
> thanks
> -- PMM
>
Thank you very much for the review and additional commit
commit message for clarity.

---
Ake Koomsin

--0000000000007cc06a05ebd95d2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Oct 25, 2022 at 1:37 AM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Mon, 17 Oct 2022 at 10:29, Ake Koomsin &lt;=
<a href=3D"mailto:ake@igel.co.jp" target=3D"_blank">ake@igel.co.jp</a>&gt; =
wrote:<br>
&gt;<br>
&gt; An exception targeting EL2 from lower EL is actually maskable when<br>
&gt; HCR_E2H and HCR_TGE are both set. This applies to both secure and<br>
&gt; non-secure Security state.<br>
&gt;<br>
&gt; Signed-off-by: Ake Koomsin &lt;<a href=3D"mailto:ake@igel.co.jp" targe=
t=3D"_blank">ake@igel.co.jp</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/arm/cpu.c | 24 +++++++++++++++++-------<br>
&gt;=C2=A0 1 file changed, 17 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/arm/cpu.c b/target/arm/cpu.c<br>
&gt; index 94ca6f163f..86d3377d3f 100644<br>
&gt; --- a/target/arm/cpu.c<br>
&gt; +++ b/target/arm/cpu.c<br>
&gt; @@ -561,14 +561,24 @@ static inline bool arm_excp_unmasked(CPUState *c=
s, unsigned int excp_idx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ((target_el &gt; cur_el) &amp;&amp; (target_el =
!=3D 1)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Exceptions targeting a higher EL =
may not be maskable */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arm_feature(env, ARM_FEATURE_AAR=
CH64)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 64-bit masking rule=
s are simple: exceptions to EL3<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* can&#39;t be masked=
, and exceptions to EL2 can only be<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* masked from Secure =
state. The HCR and SCR settings<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* don&#39;t affect th=
e masking logic, only the interrupt routing.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (target_el =3D=3D 3 || !=
secure || (env-&gt;cp15.scr_el3 &amp; SCR_EEL2)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (target_el) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Accor=
ding to ARM DDI 0487H.a, an interrupt can be masked<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* when =
HCR_E2H and HCR_TGE are both set regardless of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* curre=
nt Security state. Note that We need to revisit this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* part =
again once we need to support NMI.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((hcr_el2 =
&amp; (HCR_E2H | HCR_TGE)) !=3D (HCR_E2H | HCR_TGE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 unmasked =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Interrupt =
cannot be masked when the target EL is 3 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unmasked=
 =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_=
reached();<br>
<br>
Hi; thanks for this patch. You&#39;re correct that there is a bug here, but=
<br>
it took me a while to work out why it&#39;s OK to remove the &quot;don&#39;=
t allow<br>
masking if we&#39;re in Secure EL0/EL1 and the exception is going to NS EL2=
&quot;<br>
check. The answer to that turns out to be &quot;the target_el could never b=
e<br>
2 anyway in that case&quot;: because arm_phys_excp_target_el() uses<br>
arm_hcr_el2_eff(),<br>
if we&#39;re Secure and SEL2 isn&#39;t enabled then the effective HCR_EL2 b=
its<br>
will all be zero, which forces us into the &quot;targets EL1&quot; or &quot=
;targets EL3&quot;<br>
cases.<br>
<br>
So I think that&#39;s worth mentioning in the commit message:<br>
<br>
&quot;We can remove the conditions that try to suppress masking of<br>
interrupts when we are Secure and the exception targets EL2 and<br>
Secure EL2 is disabled, because in that case arm_phys_excp_target_el()<br>
will never return 2 as the target EL. The &#39;not if secure&#39; check<br>
in this function was originally written before arm_hcr_el2_eff(), and<br>
back then the target EL could be 2 even if we were in Secure EL0/EL1;<br>
it is no longer needed.&quot;<br>
<br>
I&#39;ll apply this to target-arm.next, with the commit message<br>
updated to include that.<br>
<br>
thanks<br>
-- PMM<br></blockquote><div style=3D"font-family:monospace,monospace" class=
=3D"gmail_default"><div class=3D"gmail_default" style=3D"font-family:monosp=
ace,monospace">Thank you very much for the review and additional commit</di=
v><div class=3D"gmail_default" style=3D"font-family:monospace,monospace">co=
mmit message for clarity.</div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace,monospace"><br></div><div class=3D"gmail_default" style=3D"=
font-family:monospace,monospace">---</div><div class=3D"gmail_default" styl=
e=3D"font-family:monospace,monospace">Ake Koomsin<br></div></div></div></di=
v>

--0000000000007cc06a05ebd95d2a--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A37D57D9BA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 07:10:47 +0200 (CEST)
Received: from localhost ([::1]:34712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEkw0-0004iU-Ox
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 01:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1oEkua-0003Hh-AB
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 01:09:16 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:46968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1oEkuW-0004Xr-03
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 01:09:16 -0400
Received: by mail-oi1-x231.google.com with SMTP id o133so4566468oig.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 22:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=07MAy01MxpB47t9WTiTEI47znZ4DHvNzQqPM9retIwU=;
 b=lFXgZ5S/hqa3OqMQQkIfPYfARAgX1p8Okwi166NET9R4aR5BR1fmoQ/fD0fAD5viUo
 GRCeoPfTOaI7budSPB6NTlavVTO4JFxOp0K45y7DOEg1htj0cln/FjadET6zjro6kgsE
 AUv9q3EQCpJX51mPJnsM6tkgiwa6U/yxvWqlbeb60YypOBjRIdpKBxmq49/ADWMNb3Iu
 z+3l8DoNUtfTeIPmmqkXlBHlD4r3Ie2vYpBDIcNuAd6uV6g21+4X5x+/5CnMw7jLxNy9
 qDVVgioAIdvDkr/43lxIm2ZolEBR4a6sEgVURDVCnDTP+HFKyaDb01jwvOVvoqMgfaXX
 1WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=07MAy01MxpB47t9WTiTEI47znZ4DHvNzQqPM9retIwU=;
 b=1cnXGh23haXg7HdyontSIZ9HnzFVragaNNgUWb/LTOrWObpOFqq7hFpT00+rRHykT3
 XlytgALLMzKToV+2WygcYhxK8xmOQlKRMg/Ktf7RYAJ5gVDXngJSc370p6FCbg6pvyEJ
 5hnESPYW1eBGeQXK8F2SBUE51+a3X5Hjmq3n8dT1IsWY9OEgr8CW2bwdUL+fJ2xyasAo
 sRvzm4vQCH7gphQ/RJDfatNhdTLGFjaGgVft4sN0pYtHF2aD1YTM4t/+yEC1DolaMXjh
 n4ZvaIW30n2gqVkFpgmT2B2ApuNFEfy+LoNq4FvYFbABg/ZaoD0qJQV9zns6qML638/j
 2lrQ==
X-Gm-Message-State: AJIora/ushQqlzZEo1/cRKCa5uI0EmioUhC6SPAyfHH42sf0hfBVAxBG
 HeqSKEQZz11FNph3rBooJvuklS1TwTIH2DB58MA=
X-Google-Smtp-Source: AGRyM1sDx+aSGkKnTwnMKxiBoduI7EesF/+9wo9oO78rr5XMH+RAO4MlOramTuoKBoSkz8cbKKRrVzyYSKerwCK2Ju4=
X-Received: by 2002:a05:6808:1a90:b0:33a:9eba:c8c0 with SMTP id
 bm16-20020a0568081a9000b0033a9ebac8c0mr664295oib.82.1658466549163; Thu, 21
 Jul 2022 22:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
 <87y1woyxvo.fsf@linaro.org>
 <CAK7rcp-Ts=3JNoYRak-Zddb0NDjdgSqbGD32xFEguw0yLqydyw@mail.gmail.com>
 <CAFEAcA8sWMD1eZCZyiMPz_SNKRn6J--Gm53aQuTo-KO5bWyFrQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8sWMD1eZCZyiMPz_SNKRn6J--Gm53aQuTo-KO5bWyFrQ@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Fri, 22 Jul 2022 01:08:58 -0400
Message-ID: <CAK7rcp8pvQfn=x1DsFwmr2GbK-tqmCxh8stkA8+QmfdC-peXPA@mail.gmail.com>
Subject: Re: Access target TranslatorOps
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000088ece705e45dd511"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x231.google.com
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

--00000000000088ece705e45dd511
Content-Type: text/plain; charset="UTF-8"

I need to determine the set of instruction encodings that the TCG can
support for a given platform. I am not bothered whether the target runs at
all, and in fact it is better if it doesn't, so runtime or translate time
doesn't bother me.

Imagine I were adding support for more instructions for a given platform. I
would like to check that I'm using the API right. It's amazing that it's
been so far and there's no way to check that the correct behavior occurs
when a given encoding is encountered regarding the TCG. A boolean result
from a can_translate called just when the target encounters the instruction
would be good. Additionally, the ability to force the translation of
arbitrary encodings would be good. I would like to not have to engineer
some binary file format.

On Wed, Jul 20, 2022 at 1:37 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 20 Jul 2022 at 17:39, Kenneth Adam Miller
> <kennethadammiller@gmail.com> wrote:
> > That I know of, the TCG plugins do not allow me to feed the
> > QEMU instance dynamically changing opcodes. I wouldn't use
> > TranslatorOps if I don't have to. I want to facilitate a
> > use case in which the contents of the target being emulated
> > are changing, but it is not a self modifying target. I have
> > to query and interact with the TCG to find out what opcodes
> > are supported or not.
>
> I agree that feeding opcodes into the translator isn't what
> TCG plugins are intended for.
>
> I'm definitely not clear on what you're trying to do here,
> so it's hard to suggest some other approach, but linux-user
> code shouldn't be messing with the internals of the translator
> by grabbing the TranslatorOps struct. Among other things,
> linux-user code is runtime and TranslatorOps is for
> translate-time.
>
> Sometimes code in linux-user needs to be a bit over-familiar
> with the CPU state, but we try to keep that to a minimum.
> Generally that involves code in target/foo/ providing some
> set of interface functions that code in linux-user/foo/
> can work with, typically passing it the CPU state struct.
>
> thanks
> -- PMM
>

--00000000000088ece705e45dd511
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I need to determine the set of instruction encodings that =
the TCG can support for a given platform. I am not bothered whether the tar=
get runs at all, and in fact it is better if it doesn&#39;t, so runtime or =
translate time doesn&#39;t bother me.<div><br></div><div>Imagine I were add=
ing support for more instructions for a given platform. I would like to che=
ck that I&#39;m using the API right. It&#39;s amazing that it&#39;s been so=
 far and there&#39;s no way to check that the correct behavior occurs when =
a given encoding is encountered regarding the TCG. A boolean result from a =
can_translate called just when the target encounters the instruction would =
be good. Additionally, the ability to force the translation of arbitrary en=
codings would be good. I would like to not have to engineer some binary fil=
e format.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 20, 2022 at 1:37 PM Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 20 Jul=
 2022 at 17:39, Kenneth Adam Miller<br>
&lt;<a href=3D"mailto:kennethadammiller@gmail.com" target=3D"_blank">kennet=
hadammiller@gmail.com</a>&gt; wrote:<br>
&gt; That I know of, the TCG plugins do not allow me to feed the<br>
&gt; QEMU instance dynamically changing opcodes. I wouldn&#39;t use<br>
&gt; TranslatorOps if I don&#39;t have to. I want to facilitate a<br>
&gt; use case in which the contents of the target being emulated<br>
&gt; are changing, but it is not a self modifying target. I have<br>
&gt; to query and interact with the TCG to find out what opcodes<br>
&gt; are supported or not.<br>
<br>
I agree that feeding opcodes into the translator isn&#39;t what<br>
TCG plugins are intended for.<br>
<br>
I&#39;m definitely not clear on what you&#39;re trying to do here,<br>
so it&#39;s hard to suggest some other approach, but linux-user<br>
code shouldn&#39;t be messing with the internals of the translator<br>
by grabbing the TranslatorOps struct. Among other things,<br>
linux-user code is runtime and TranslatorOps is for<br>
translate-time.<br>
<br>
Sometimes code in linux-user needs to be a bit over-familiar<br>
with the CPU state, but we try to keep that to a minimum.<br>
Generally that involves code in target/foo/ providing some<br>
set of interface functions that code in linux-user/foo/<br>
can work with, typically passing it the CPU state struct.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000088ece705e45dd511--


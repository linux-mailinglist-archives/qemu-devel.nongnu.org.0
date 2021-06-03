Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFE39A93A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:31:34 +0200 (CEST)
Received: from localhost ([::1]:51470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorBt-0007Xs-7H
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1lorAl-0006GL-SL; Thu, 03 Jun 2021 13:30:23 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1lorAk-00083W-0y; Thu, 03 Jun 2021 13:30:23 -0400
Received: by mail-oi1-x231.google.com with SMTP id c13so1494686oib.13;
 Thu, 03 Jun 2021 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pKkVLuhrzeOnyydHupQnlnuJakoccLmuIMSdJnpq4mo=;
 b=PLdMz9lrXO1zGAO50lgceWjkIyuddG/DaHvIWJsvLdxLQfOk32ia2qNeT5ByoZHghJ
 S9G4TGbZAAT4/HM5emZ2ZZlZBYSUSGBcIOhxPbixrg8ocLcY+BHh4qtJ8lnUybK8oCFO
 IWlBqkyCwMe5Gnbt0nMQ/Vxu8oZDWto7OQ0qGnOzHJdDnByCzJxZvPFeB2POEsxnvz2R
 3LsHK4KM6N2UhQQ5lDfxaNOfhrXWfGuUtzxtSlS8Y5Kf443JD7EWFeoPvUmV3EPj2Dn9
 fMyXZZASQ9E0BUV2gACcYZtEc3lEj3SYqi76ahCDjwAEURd8BrEu+kZlEOgT7GK6RcFn
 bBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pKkVLuhrzeOnyydHupQnlnuJakoccLmuIMSdJnpq4mo=;
 b=NE5qqZPORZMqD1bnZwQddAZ1UOzoC1EAs9nUKP5dfJ+TpT5dE4niP//8u2zVX6jfJW
 4CavCJVIgcT1ngXb/fY18g4buD2IlggFqzXqbzWs4hfQvPZ5cEyiEpJpmmRQ948w4jTT
 JLIwGja9/NcX3R64iCrR1Oucqq7MjGyCDBXqx32nfroh01LQKTgmnHKc3WsIYpV9VS46
 BhNyh5nMkLkyUAbyFJodsT9ShU1P/Z0LcHDXnz0RZeSmQ5P9oL6MZlXxucZsUBs2OXcG
 Bf4O/YDNuj6c/mx9ss+wo3KBfDwCElbyDT1uCXcl5PNqdB3Ieu6jgYC3xoqTqo1vdafe
 +08g==
X-Gm-Message-State: AOAM533ZDiTuYXI8kMoCAm1VsGT1LHkT5UGnnVfqbb0V84qoHt6uigpq
 Sbc6xoGGGAKqlhAswaIkNl0m8DqrcG5tqty/Hwo=
X-Google-Smtp-Source: ABdhPJxAuVYJMLzCvBrgbx3lXCG4ycVrJq2Eldv3ogXv+qbvpBitVRngT+Mihx6LW/HKzpAZ/91NDvRz+Y198leOlrY=
X-Received: by 2002:aca:2417:: with SMTP id n23mr7948955oic.111.1622741420436; 
 Thu, 03 Jun 2021 10:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
 <CAFEAcA8oAtjVom+BXtcgao4O252ipmFzv-iNTSzDaJChcQkr9g@mail.gmail.com>
In-Reply-To: <CAFEAcA8oAtjVom+BXtcgao4O252ipmFzv-iNTSzDaJChcQkr9g@mail.gmail.com>
From: Swetha Joshi <swethajoshi139@gmail.com>
Date: Thu, 3 Jun 2021 10:30:09 -0700
Message-ID: <CALf2nmKgaZiBOfEWpMt4Yq-NyCYrsFNPwb1hZ0adwoXUs4T6pA@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ed710205c3dfedad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=swethajoshi139@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ed710205c3dfedad
Content-Type: text/plain; charset="UTF-8"

Oh okay, thank you. I will test this by eod today!


On Thu, Jun 3, 2021 at 10:22 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 28 May 2021 at 20:41, Swetha Joshi <swethajoshi139@gmail.com>
> wrote:
> >
> > I apologize for the delay, here are the repro steps:
> > 1. Remove CONFIG_ARM_VIRT=y from arm-softmmu.mak
> > 2. In .gitlab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include,
> in all the places where we disable kvm using -disable-kvm, replace this
> with -enable-kvm
> > 3. Build
>
> Thanks; I reproduced the link errors and have sent a patchset
> that I hope fixes this:
> https://patchew.org/QEMU/20210603171259.27962-1-peter.maydell@linaro.org/
>
> If you could test that it works for you that would be great.
>
> -- PMM
>
-- 
Regards

Swetha Joshi.

--000000000000ed710205c3dfedad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">Oh okay, thank you. I will test this by eo=
d today!=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><div =
class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Jun 3, 2021 at 10:22 AM Peter Maydell &lt;<a href=3D"mailto:peter.may=
dell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)">On Fri, 28 May 2021 at 20:41, Swetha Joshi &lt;<a href=3D"mailto:sw=
ethajoshi139@gmail.com" target=3D"_blank">swethajoshi139@gmail.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; I apologize for the delay, here are the repro steps:<br>
&gt; 1. Remove CONFIG_ARM_VIRT=3Dy from arm-softmmu.mak<br>
&gt; 2. In .gitlab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include,=
 in all the places where we disable kvm using -disable-kvm, replace this wi=
th -enable-kvm<br>
&gt; 3. Build<br>
<br>
Thanks; I reproduced the link errors and have sent a patchset<br>
that I hope fixes this:<br>
<a href=3D"https://patchew.org/QEMU/20210603171259.27962-1-peter.maydell@li=
naro.org/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20=
210603171259.27962-1-peter.maydell@linaro.org/</a><br>
<br>
If you could test that it works for you that would be great.<br>
<br>
-- PMM<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Regards<div><br></div><=
div>Swetha Joshi.</div></div></div>

--000000000000ed710205c3dfedad--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DA39B202
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 07:26:57 +0200 (CEST)
Received: from localhost ([::1]:57586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp2MB-0004iN-Ub
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 01:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1lp2LQ-0003mN-Jm; Fri, 04 Jun 2021 01:26:08 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:45880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1lp2LO-0000W8-NE; Fri, 04 Jun 2021 01:26:08 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so7993787otc.12; 
 Thu, 03 Jun 2021 22:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y7hs2ThLCcd4EXAQewgtqhiDgTLsjP/tp3SDQW/lQQA=;
 b=egaioL8n4oRhwvu4OQmstqy/u8mgm2IB9K2QN6UntckxP+4Rltc37QNfbBCuWgdkL/
 z1QOgNbo3JDVGvmSZgxaBWJ+RFSbzmwqLcyNIZZcac9+522yew+qocQII5UanvNPge7G
 uSKVU+4oUnz7mbNMrtzMDMazfjF5x9le0xhCWYdBHMfY7LgSYjHKj+sg/XABRhdS/XP+
 TePUl4i/RDvDS9A9Sj5qY83zcvLAwiR7X/qzBOCYy5lhEIWA+oLHIgqIr6co58SjD/3g
 YE4yzjRuNxt1gmzRmlP1MHojb2MDwzicLGN3tL93p6gs2yLJJt7U84pEdHwQBzPaGFJN
 FaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y7hs2ThLCcd4EXAQewgtqhiDgTLsjP/tp3SDQW/lQQA=;
 b=TD1A3EJXL5BDQWqpTC0wRyr+Wtc7chKMBNVAnEx0dZICaDuy1x0VBx7/BWAVA9gN/B
 wNUKx3/R7JBAKA2xTpIxf9XX08fsY6zOedaCKFx35X7BbeHb4BB0pXBYXMkDjHh2AxVT
 4NDZ4THv7ysIrFWbUcrl114r/2Uaq39Yig08UFBo+CuDbSGzltJEl9mzeo5GGfPkRLiA
 ieB/TRClGRM4jRUNzPxMYG8dT+ETCOg9lF4vcXIoURwDcgggR80LQ00MWvrL+A79uIMk
 EOtE6zO4qtTC9867PtO56MDrEQWZCxToQ7hAvoDFXcBh75Su07cg53wJ3QYVMOmto/wJ
 Tsgg==
X-Gm-Message-State: AOAM533buznDxdb6JaJ75UE2siqRQrL7cUfya/sUy/cVh+xZVHvZm+OY
 3uma08vEr7HeDx5iMO/C9a4SrT0gCflK294EXO8=
X-Google-Smtp-Source: ABdhPJwVpIRTzGWVubOKbFFzOWFPbb7Zb4XP9+a7R5IsbpYMV7x2wyEdUw6qMMQ4ICrZD6zjiwguTtXlYYNIybgO1k0=
X-Received: by 2002:a9d:554b:: with SMTP id h11mr2347232oti.4.1622784364724;
 Thu, 03 Jun 2021 22:26:04 -0700 (PDT)
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
 <CALf2nmKgaZiBOfEWpMt4Yq-NyCYrsFNPwb1hZ0adwoXUs4T6pA@mail.gmail.com>
In-Reply-To: <CALf2nmKgaZiBOfEWpMt4Yq-NyCYrsFNPwb1hZ0adwoXUs4T6pA@mail.gmail.com>
From: Swetha Joshi <swethajoshi139@gmail.com>
Date: Thu, 3 Jun 2021 22:25:53 -0700
Message-ID: <CALf2nmLLZ5smxqYJyA+_MPunaQqaM7-Ub9CVurTE1pM0ErOS+w@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009b438505c3e9ed69"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=swethajoshi139@gmail.com; helo=mail-ot1-x32f.google.com
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

--0000000000009b438505c3e9ed69
Content-Type: text/plain; charset="UTF-8"

Hello, I have tested this patch with our qemu and it works, thank you.

What are the next steps for this patch? So is it approved and ready to go
in mainline?

Thanks,
Swetha.

On Thu, Jun 3, 2021 at 10:30 AM Swetha Joshi <swethajoshi139@gmail.com>
wrote:

>
> Oh okay, thank you. I will test this by eod today!
>
>
> On Thu, Jun 3, 2021 at 10:22 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Fri, 28 May 2021 at 20:41, Swetha Joshi <swethajoshi139@gmail.com>
>> wrote:
>> >
>> > I apologize for the delay, here are the repro steps:
>> > 1. Remove CONFIG_ARM_VIRT=y from arm-softmmu.mak
>> > 2. In .gitlab-ci.yml, crossbuild.yml and in tests/vm/Makefile.include,
>> in all the places where we disable kvm using -disable-kvm, replace this
>> with -enable-kvm
>> > 3. Build
>>
>> Thanks; I reproduced the link errors and have sent a patchset
>> that I hope fixes this:
>> https://patchew.org/QEMU/20210603171259.27962-1-peter.maydell@linaro.org/
>>
>> If you could test that it works for you that would be great.
>>
>> -- PMM
>>
> --
> Regards
>
> Swetha Joshi.
>
-- 
Regards

Swetha Joshi.

--0000000000009b438505c3e9ed69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello, I have tested this patch with our qemu and it work=
s, thank you.</div><div dir=3D"auto"><br></div><div dir=3D"auto">What are t=
he next steps for this patch? So is it approved and ready to go in mainline=
?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=
=3D"auto">Swetha.=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jun 3, 2021 at 10:30 AM Swetha Joshi =
&lt;<a href=3D"mailto:swethajoshi139@gmail.com">swethajoshi139@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)"><div><br></div><div dir=3D"auto">Oh =
okay, thank you. I will test this by eod today!=C2=A0</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 3, 2021 at 10:22 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">p=
eter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Fri, 28=
 May 2021 at 20:41, Swetha Joshi &lt;<a href=3D"mailto:swethajoshi139@gmail=
.com" target=3D"_blank">swethajoshi139@gmail.com</a>&gt; wrote:<br>
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
</blockquote></div></div>-- <br><div dir=3D"ltr" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr">Regards<div><br></div><div>Swetha Joshi.</div></d=
iv></div>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Regards<div><br></div><=
div>Swetha Joshi.</div></div></div>

--0000000000009b438505c3e9ed69--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E65EFB19
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:42:01 +0200 (CEST)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwbo-0006o9-PH
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1odvSo-0006WI-O8
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:28:41 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1odvSm-0007Ih-BE
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:28:38 -0400
Received: by mail-ua1-x92c.google.com with SMTP id e22so658733uar.5
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=QkOKR+Dd5P5qYLwMyy4NjQmeUqCA6w0xvfOi54OpTuk=;
 b=CJX4e2GOvqDwYreYXi3R7ZzB9ruEbyXDzNrMiH96+wcl8cN+EDlPSQxv3VCJzzVuIj
 LWzMsVRfBNqJhMkfmBK92KsmdIz4tYelUuxw1Rnlji2l4rPcg1Ii/5SwgzqtrCDSqTMf
 01hzcmzeECS4C4m7th/r5XapZSkpfNL+h2+MBdX994Na7PBL1nK2cwyJ5aPPMHnBLKEg
 mT0BrD9pELMqEu0Qw5u957wssK7u+VqILIxjB/7MiHXVxBb7l2LJNZz1OyLNZIZK+T9l
 CkZvkR5JWe1WsR/c4e6R2Cl3OhhPsg2JJbXm3k/xvqIvtEVK/HBm4ahbPd56BOrThXhO
 eCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=QkOKR+Dd5P5qYLwMyy4NjQmeUqCA6w0xvfOi54OpTuk=;
 b=ZfcdbZsFnLx1NRvVnDDVnmEMYxYZUugj/olyJXGOV/PrvjkC1KKcZ2XC48z9mmZZWN
 KIf7l7Xv24Ndg0EEO+5l9LiHDt/UOku123c59SS80GMnip1buDUhY9ckzXpxes2L15T3
 Of0XTIw6YPJPD+BJM6dK3LhmdIwsFUuz8L9DHBpmC5H1PvSaf08idIUOryJ/UKSkOSnw
 W9R16NCLs0/m0BFaWKaiI6g/Vn1s+pGXa94xzalKOogx8n6r+W5/e8QUT3/HX6bB0lZD
 OKnjJq9o8mME2npLyj0oCXc2tqdASSSpKbtG+Fh/CLGYdAsSanc15TOQ2ov09rl2g+aK
 38Qw==
X-Gm-Message-State: ACrzQf38ng7ggaQFqiWeMsnOrKArOrtenkJCAg7M6VbP3MG1D77iYzcl
 U7wBFtTkgdyhN0gH7XHRU7TJb77dhDqYxK3CGLvrwQ==
X-Google-Smtp-Source: AMsMyM5sJVEj7RHvpBsZx/Yebi6wW8nOnP0Kng65+6ieNA7Iu072PoDFH+W0oj6AlZXbiEH3dvJYbZIc5GNBwkoS55E=
X-Received: by 2002:a05:6130:a0b:b0:3d5:61b2:b1ef with SMTP id
 bx11-20020a0561300a0b00b003d561b2b1efmr703705uab.39.1664465314319; Thu, 29
 Sep 2022 08:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
 <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
 <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
 <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
 <CAFEAcA97oHsQdk2fSq=umiUv8nNue0xCLtboRR2yPt_Gxh_zEg@mail.gmail.com>
 <CAO=notwsgvtZBLyWGu+PSnmHTrm6anakwFwoq3oBEJ-8nqPFaQ@mail.gmail.com>
In-Reply-To: <CAO=notwsgvtZBLyWGu+PSnmHTrm6anakwFwoq3oBEJ-8nqPFaQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 29 Sep 2022 08:28:23 -0700
Message-ID: <CAO=notzN3E_OA-_jBvXsB8_LGbTXpE=G50RX8APbHHFN6eHE3A@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="000000000000cd5bef05e9d2871c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=venture@google.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

--000000000000cd5bef05e9d2871c
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 26, 2022 at 8:45 AM Patrick Venture <venture@google.com> wrote:

>
>
> On Sat, Sep 24, 2022 at 2:10 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Sat, 24 Sept 2022 at 00:42, Patrick Venture <venture@google.com>
>> wrote:
>> > On Thu, Sep 22, 2022 at 8:21 PM Jason Wang <jasowang@redhat.com> wrote:
>> >>
>> >> On Thu, Sep 22, 2022 at 8:35 PM Peter Maydell <
>> peter.maydell@linaro.org> wrote:
>> >> > A question to which I don't know the answer: if the guest writes to
>> >> > the device to change the MAC address, should that persist across
>> >> > reset, or should reset revert the device to the original MAC address
>> >> > as specified by the user on the command line or whatever ? At the
>> >> > moment you have the former behaviour (and end up storing the MAC
>> >> > address in two places as a result -- it would be neater to either
>> >> > keep it in only one place, or else have emc->regs[] be the current
>> >> > programmed MAC address and emc->conf.macaddr the value to reset to).
>> >> >
>> >> > I'm not sure we're consistent between device models about that,
>> >> > eg the e1000 seems to reset to the initial MAC addr, but the
>> >> > imx_fec keeps the guest-set value over resets. Jason, is there
>> >> > a recommended "right way" to handle guest-programmable MAC addresses
>> >> > over device reset ?
>> >>
>> >> I think it depends on the NIC.
>> >>
>> >> E1000 has a EEPROM interface for providing the MAC address for the
>> >> ethernet controller before it can be accessed by the driver during
>> >> reset. For modern Intel NICs like E810, it has similar semantics but
>> >> using NVM instead of EEPROM. So the current e1000 behaviour seems to
>> >> be correct (treat the initiali MAC as the one stored in the EEPROM).
>> >>
>> >> I guess most NIC should behave the same as having a persistent storage
>> >> for MAC for the controller during reset, but I'm not sure this is the
>> >> case for imx_fec.
>>
>> > So the first time the NIC is realized, it should take the value from
>> > the command line.  Then later if the guest OS updates it, it should
>> > always on reset use that provided value?
>>
>> I think what Jason is suggesting is that that should depend on what
>> the real hardware does. On a physical board, if the guest sets the
>> MAC address, and then you power-cycle the hardware, does the MAC
>> that it set still persist after powercycle ? Does the guest writing
>> to these MAC registers correspond to writing to an EEPROM ?
>>
>
> Thanks, Peter - we've reached out to the vendor off-list to seek out some
> details, I'll update this with a v2 when I get an answer.
>

"No, The EMC driver reset the MAC address registers during boot
cycle/reset."

So in that case, we should disregard the value the user sets in reset and
use the value provided through Qemu.  Or, should we just not allow Qemu to
set the MAC address at all?


>
>>
>> thanks
>> -- PMM
>>
>

--000000000000cd5bef05e9d2871c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 26, 2022 at 8:45 AM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 24, 2022 at 2:10 AM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">pete=
r.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Sat, 24 Sept 2022 at 00:42, Patrick Venture &lt;<a h=
ref=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com</a>&=
gt; wrote:<br>
&gt; On Thu, Sep 22, 2022 at 8:21 PM Jason Wang &lt;<a href=3D"mailto:jasow=
ang@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 22, 2022 at 8:35 PM Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&=
gt; wrote:<br>
&gt;&gt; &gt; A question to which I don&#39;t know the answer: if the guest=
 writes to<br>
&gt;&gt; &gt; the device to change the MAC address, should that persist acr=
oss<br>
&gt;&gt; &gt; reset, or should reset revert the device to the original MAC =
address<br>
&gt;&gt; &gt; as specified by the user on the command line or whatever ? At=
 the<br>
&gt;&gt; &gt; moment you have the former behaviour (and end up storing the =
MAC<br>
&gt;&gt; &gt; address in two places as a result -- it would be neater to ei=
ther<br>
&gt;&gt; &gt; keep it in only one place, or else have emc-&gt;regs[] be the=
 current<br>
&gt;&gt; &gt; programmed MAC address and emc-&gt;conf.macaddr the value to =
reset to).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m not sure we&#39;re consistent between device models a=
bout that,<br>
&gt;&gt; &gt; eg the e1000 seems to reset to the initial MAC addr, but the<=
br>
&gt;&gt; &gt; imx_fec keeps the guest-set value over resets. Jason, is ther=
e<br>
&gt;&gt; &gt; a recommended &quot;right way&quot; to handle guest-programma=
ble MAC addresses<br>
&gt;&gt; &gt; over device reset ?<br>
&gt;&gt;<br>
&gt;&gt; I think it depends on the NIC.<br>
&gt;&gt;<br>
&gt;&gt; E1000 has a EEPROM interface for providing the MAC address for the=
<br>
&gt;&gt; ethernet controller before it can be accessed by the driver during=
<br>
&gt;&gt; reset. For modern Intel NICs like E810, it has similar semantics b=
ut<br>
&gt;&gt; using NVM instead of EEPROM. So the current e1000 behaviour seems =
to<br>
&gt;&gt; be correct (treat the initiali MAC as the one stored in the EEPROM=
).<br>
&gt;&gt;<br>
&gt;&gt; I guess most NIC should behave the same as having a persistent sto=
rage<br>
&gt;&gt; for MAC for the controller during reset, but I&#39;m not sure this=
 is the<br>
&gt;&gt; case for imx_fec.<br>
<br>
&gt; So the first time the NIC is realized, it should take the value from<b=
r>
&gt; the command line.=C2=A0 Then later if the guest OS updates it, it shou=
ld<br>
&gt; always on reset use that provided value?<br>
<br>
I think what Jason is suggesting is that that should depend on what<br>
the real hardware does. On a physical board, if the guest sets the<br>
MAC address, and then you power-cycle the hardware, does the MAC<br>
that it set still persist after powercycle ? Does the guest writing<br>
to these MAC registers correspond to writing to an EEPROM ?<br></blockquote=
><div><br></div><div>Thanks, Peter - we&#39;ve reached out to the vendor of=
f-list to seek out some details, I&#39;ll update this with a v2 when I get =
an answer.</div></div></div></blockquote><div><br></div><div>&quot;No, The =
EMC driver reset the MAC address registers during boot cycle/reset.&quot;</=
div><div><br></div><div>So in that case, we should disregard the value the =
user sets in reset and use the value provided through Qemu.=C2=A0 Or, shoul=
d we just not allow Qemu to set the MAC address at all?<br><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"=
gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000cd5bef05e9d2871c--


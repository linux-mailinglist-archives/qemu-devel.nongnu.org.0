Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA956446682
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:53:40 +0100 (CET)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1X9-0000hp-Hj
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mj1Uy-0007kx-PX
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:51:24 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mj1Ul-0001eE-Nx
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:51:23 -0400
Received: by mail-ed1-x52c.google.com with SMTP id w1so34860822edd.10
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odXD7mlrgPGLE/Znk7j0gS0XDQgZPw/66z9C32qMK1A=;
 b=Njw7bOM2gUEPX5N98lelMHTVAPdmCodRhwk6AMRNALg6ieVgWzk0cWM6P6+wukMTqW
 kwZEOCtPQxsfTK/9+J3piam8frtaJL9n7CXKy7KcEMSv6HTnzH/uQ+Ln2C3iWXAusiLK
 1eV67/5mtm8iQIBJUMD8dDYdzK5f7frWiGRpQr+OVyeJLIsvYl11/mnj2hE9XhEulDiD
 sYs3JKLyrSQxZmoNWvd2YZIqjg4A38/N2MZJd9ADqGI0kV2UEifpMBpCJ6Hhgg6VqiUO
 saqjVKm7j6o4JMVdmmf8ljpkZVJYCgFw4BDGtWlj8EN9Yp9lLXnw7CMYZO1iGTgVzHdj
 hNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odXD7mlrgPGLE/Znk7j0gS0XDQgZPw/66z9C32qMK1A=;
 b=solKOydm5+4B30RySjc2bD4xZWQ1fSq0RDMugwLvZQCE4NySaBAHAjC65QC4yYJWJH
 9zF5C3L116OzRREfl9wp0jlt36A76H/Zga52BM5bi1RQRuIDalDtIfU23zby4ieyh3Lm
 z3ICkw+0NP3ugnopZG+y1zEUXLJYPetUQxHwEF6OUQW2KL82TxPaHqHaac5FrbOaaK9G
 cOQP9tnjH1yMmv+ie/pEmm4OXPO+eB+mUC+KAOCh+FSSXmZDFElPba4NzY23u15nVdwr
 DWYSsSEANO0U6oTgRajH2gYgVAUmXfqTPVCIO1GTN/ZOndLjc7zKlja6H+iCky4qeuwX
 9NHg==
X-Gm-Message-State: AOAM532v88Xe1NWUj/4oe0xpNNBLTIdbVlROX98JCckUxXM63lXE0BLM
 3wRfp+HtvNYnR5vvZOo2LVFAk5IAfkwyKp37+CXklg==
X-Google-Smtp-Source: ABdhPJzqCPHdMkvXW6Gbow5DOvJqydUTocnen4P8R/JX6LdRwL7q8VmIY0Eqi/nunmUDv/YyLQSYKVT2k9quA724U8Q=
X-Received: by 2002:a17:906:7951:: with SMTP id
 l17mr938002ejo.284.1636127469603; 
 Fri, 05 Nov 2021 08:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
 <87ilx9jw7t.fsf@linaro.org>
 <CAHFG_=VYK3=bCfiFW9aYZRMbHApPzg3+Zj4NDbArmjs0uzFvvQ@mail.gmail.com>
In-Reply-To: <CAHFG_=VYK3=bCfiFW9aYZRMbHApPzg3+Zj4NDbArmjs0uzFvvQ@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Fri, 5 Nov 2021 16:50:58 +0100
Message-ID: <CAHFG_=W8HbZ9DSSBQiVORUsMF2NxNdzNMXtKX=FyYsd+5RnRxA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a2315505d00c9cb4"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Simon Glass <sjg@chromium.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a2315505d00c9cb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 3 Nov 2021 at 14:17, Fran=C3=A7ois Ozog <francois.ozog@linaro.org> =
wrote:

> Hi,
>
> Thanks Alex to patch me in.
>
> I'd like to present another perspective on the motivation as I can't
> really comment on the actual "how".
>
> On real Arm boards, firmware is often assembled into a FIP.
> That FIP can contain quite a good deal of things, including an
> NT_FW_CONFIG, NonTrusted_FirmWare_CONFIGuration (NT_FW =3D BL33 which is
> U-Boot in our case).
> So the expected typical content for that section is a DT fragment/overlay=
.
> That section is to be used in different ways but one is
> https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index=
.html
> .
> For SystemReady systems we will almost inevitably put a device tree
> fragment in this section and have BL2 merge it with the board DT before
> handing it over to BL33 (U-Boot is one of them).
> In some real world examples based on carrier board + som for instance, it
> may contain SerDes configuration for U-Boot that will result in appropria=
te
> PCI lanes or MDIO lanes for the booted OS.
>
> So I could say there is precedence in Simon's effort.
>
> In any case, when we will have made the changes in TFA for the SystemRead=
y
> boards we work on, booting the full SystemReady stack (TFA, OP-TEE, U-Boo=
t)
> on Qemu will allow that late merge based through the FIP.
>
> Other boot flows such as VBE (without TFA but with TPL/SPL/U-Boot proper)
> need a similar facility.
>
>
Hence I am supporting Simon's proposal at least on the intent. On the how
> exactly, that is outside my skillset.
>
Responding to my own comment:
As the boot flow TFA+U-Boot works, it looks like a cleaner option is to
leave QEMU alone and have
U-Boot SPL do the same work as with TFA: use a section for the FIT for the
DT to be merged.



>
future comments below
>
>
> On Wed, 3 Nov 2021 at 12:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Mon, 27 Sept 2021 at 16:18, Simon Glass <sjg@chromium.org> wrote:
>> >> On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.or=
g>
>> wrote:
>> >> > So what is missing in the QEMU-provided DTB that it needs?
>> >>
>> >> Quite a lot. Here are some examples:
>> >>
>> >> U-Boot has limited pre-relocation memory so tries to avoid
>> >> binding/probing devices that are not used before relocation:
>> >>
>> >>
>> https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.html=
#pre-relocation-support
>> >
>> > It's up to u-boot to decide what it wants to touch and
>> > what it does not. QEMU tells u-boot what all the available
>> > devices are; I don't think we should have extra stuff saying
>> > "and if you are u-boot, do something odd".
>> >
>> >> There is a configuration node (which is likely to change form in
>> >> future releases, but will still be there)
>> >>
>> >>
>> https://github.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/co=
nfig.txt
>> >
>> > I think u-boot should be storing this kind of thing somewhere
>> > else (e.g. as part of the binary blob that is u-boot itself,
>> > or stored in flash or RAM as a separate blob).
>> >
>> >> Then there are various features which put things in U-Boot's control
>> >> dtb, such as verified boot, which adds public keys during signing:
>> >>
>> >>
>> https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.tx=
t#L135
>> >>
>> >> More generally, the U-Boot tree has hundreds of files which add
>> >> properties for each board, since we try to keep the U-Boot-specific
>> >> things out of the Linux tree:
>> >>
>> >> $ find . -name *u-boot.dtsi |wc -l
>> >> 398
>> >
>> > If any of this is actual information about the hardware then you
>> > should sort out getting the bindings documented officially
>> > (which I think is still in the Linux tree), and then QEMU can
>> > provide them.
>> >
>> >> Quite a bit of this is to do with SPL and so far it seems that QEMU
>> >> mostly runs U-Boot proper only, although I see that SPL is starting t=
o
>> >> creep in too in the U-Boot CI.
>> >>
>> >> So at present QEMU is not able to support U-Boot fully.
>> >
>> > My take is that this is u-boot doing weird custom things with
>> > the DTB that aren't "describe the hardware". You should be able
>> > to boot u-boot by putting those custom DTB extra things in a
>> > separate blob and having u-boot combine that with the
>> > actual DTB when it starts.
>>
>> It's not entirely without precedent - for SPL (which I hope is secondary
>> program loading) we have things like the guest loader which expands the
>> plain HW DTB with some information needed by the bootloader and the
>> primary OS to load additional blobs which have been put into memory.
>>
>> In effect the DTB is being expanded as a signalling mechanism similar to
>> things like fw_cfg and other things we use to control boot up. Whether
>> this affects the "purity" of DTB as a "just the HW" description is
>> probably a philosophical question.
>>
>> More than a philosophical question: a key aspect of supply chain that
> need change from
> quite inflexible and tightly coupled to loosely coupled.
>  A key aspect of it is to maintain "pure" hardware description DTBs at
> rest.
> Composition of DTBs at build time (for products) or runtime (for
> development boards) should be a simple thing.
> Another aspect to take into account is System Device Trees. U-Boot only
> deal with Cortex-As on a platform,
> so there are multiple device trees for each compute domain. Communities
> are working on System Device Tree
> to define the overall platform with its power and clock domains. A tool
> "lopper" is being developed to slide the SDT into diverse domain DTs.
> One of them being included into the FIP as the basis for the computing
> element (Carrier, SoM...).
> Those attempts to cleanup passed DTBs from configuration data (drivers,
> bootloaders...) is not incompatible
> with merging fragments at runtime (for dev boards) or build time (for
> products).
>
>> I agree with Peter that just allowing the merging of arbitrary data into
>> the QEMU generated DTB is going to lead to confusion and breakages.
>> Indeed I wrote the guest-loader because instructions for booting Xen up
>> until that point involved dumpdtb and hand hacking the data which was
>> silly because this is stuff QEMU already knew about.
>>
>> >
>> > -- PMM
>>
>>
>> --
>> Alex Benn=C3=A9e
>>
>
>
> --
> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
> T: +33.67221.6485
> francois.ozog@linaro.org | Skype: ffozog
>
>

--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000a2315505d00c9cb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, 3 Nov 2021 at 14:17, Fran=C3=
=A7ois Ozog &lt;<a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blan=
k">francois.ozog@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>Thanks Alex to patch me =
in.</div><div><br></div><div>I&#39;d like to present another perspective on=
 the motivation as I can&#39;t really comment on the actual &quot;how&quot;=
.</div><div><br></div><div>On real Arm boards, firmware is often assembled =
into a FIP.=C2=A0</div><div>That FIP can contain quite a good deal of thing=
s, including an NT_FW_CONFIG, NonTrusted_FirmWare_CONFIGuration (NT_FW =3D =
BL33 which is U-Boot in our case).</div><div>So the expected typical conten=
t for that section is a DT fragment/overlay.</div><div>That section is to b=
e used in different ways but one is=C2=A0<a href=3D"https://trustedfirmware=
-a.readthedocs.io/en/latest/components/fconf/index.html" target=3D"_blank">=
https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index.h=
tml</a>.</div><div>For SystemReady systems we will almost inevitably put a =
device tree fragment in this section and have BL2 merge it with the board D=
T before handing it over to BL33 (U-Boot is one of them).</div><div>In some=
 real world examples based on carrier board + som for instance, it may cont=
ain SerDes configuration for U-Boot that will result in appropriate PCI lan=
es or MDIO lanes for the booted OS.</div><div><br></div><div>So I could say=
 there is precedence in Simon&#39;s effort.</div><div><br></div><div>In any=
 case, when we will have made the changes in TFA for the SystemReady boards=
 we work on, booting the full SystemReady stack=C2=A0(TFA, OP-TEE, U-Boot) =
on Qemu will allow that late merge based through the FIP.</div><div><br></d=
iv><div>Other boot flows such as VBE (without TFA but with TPL/SPL/U-Boot p=
roper) need a similar facility.=C2=A0</div><div>=C2=A0<br></div></div></div=
></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div></div=
><div>Hence I am supporting Simon&#39;s proposal at least on the intent. On=
 the how exactly, that is outside my skillset.</div><div></div></div></div>=
</blockquote><div>Responding to my own comment:</div><div>As the boot flow =
TFA+U-Boot works, it looks like a cleaner option is to leave QEMU alone and=
 have</div><div>U-Boot SPL do the same work as with TFA: use a section for =
the FIT for the DT to be merged.</div><div><br></div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-=
left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>=C2=A0<br></div></div></di=
v></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb=
(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div></di=
v><div>future comments below</div><div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 3 Nov 2021 at 12:4=
8, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D=
"_blank">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
<br>
Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bl=
ank">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; On Mon, 27 Sept 2021 at 16:18, Simon Glass &lt;<a href=3D"mailto:sjg@c=
hromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt; On Mon, 27 Sept 2021 at 02:48, Peter Maydell &lt;<a href=3D"mailto=
:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&g=
t; wrote:<br>
&gt;&gt; &gt; So what is missing in the QEMU-provided DTB that it needs?<br=
>
&gt;&gt;<br>
&gt;&gt; Quite a lot. Here are some examples:<br>
&gt;&gt;<br>
&gt;&gt; U-Boot has limited pre-relocation memory so tries to avoid<br>
&gt;&gt; binding/probing devices that are not used before relocation:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://u-boot.readthedocs.io/en/latest/develop/driver-=
model/design.html#pre-relocation-support" rel=3D"noreferrer" target=3D"_bla=
nk">https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.htm=
l#pre-relocation-support</a><br>
&gt;<br>
&gt; It&#39;s up to u-boot to decide what it wants to touch and<br>
&gt; what it does not. QEMU tells u-boot what all the available<br>
&gt; devices are; I don&#39;t think we should have extra stuff saying<br>
&gt; &quot;and if you are u-boot, do something odd&quot;.<br>
&gt;<br>
&gt;&gt; There is a configuration node (which is likely to change form in<b=
r>
&gt;&gt; future releases, but will still be there)<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/u-boot/u-boot/blob/master/doc/device=
-tree-bindings/config.txt" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/config.txt</a><b=
r>
&gt;<br>
&gt; I think u-boot should be storing this kind of thing somewhere<br>
&gt; else (e.g. as part of the binary blob that is u-boot itself,<br>
&gt; or stored in flash or RAM as a separate blob).<br>
&gt;<br>
&gt;&gt; Then there are various features which put things in U-Boot&#39;s c=
ontrol<br>
&gt;&gt; dtb, such as verified boot, which adds public keys during signing:=
<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/u-boot/u-boot/blob/master/doc/uImage=
.FIT/signature.txt#L135" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.txt#L135</a><br>
&gt;&gt;<br>
&gt;&gt; More generally, the U-Boot tree has hundreds of files which add<br=
>
&gt;&gt; properties for each board, since we try to keep the U-Boot-specifi=
c<br>
&gt;&gt; things out of the Linux tree:<br>
&gt;&gt;<br>
&gt;&gt; $ find . -name *u-boot.dtsi |wc -l<br>
&gt;&gt; 398<br>
&gt;<br>
&gt; If any of this is actual information about the hardware then you<br>
&gt; should sort out getting the bindings documented officially<br>
&gt; (which I think is still in the Linux tree), and then QEMU can<br>
&gt; provide them.<br>
&gt;<br>
&gt;&gt; Quite a bit of this is to do with SPL and so far it seems that QEM=
U<br>
&gt;&gt; mostly runs U-Boot proper only, although I see that SPL is startin=
g to<br>
&gt;&gt; creep in too in the U-Boot CI.<br>
&gt;&gt;<br>
&gt;&gt; So at present QEMU is not able to support U-Boot fully.<br>
&gt;<br>
&gt; My take is that this is u-boot doing weird custom things with<br>
&gt; the DTB that aren&#39;t &quot;describe the hardware&quot;. You should =
be able<br>
&gt; to boot u-boot by putting those custom DTB extra things in a<br>
&gt; separate blob and having u-boot combine that with the<br>
&gt; actual DTB when it starts.<br>
<br>
It&#39;s not entirely without precedent - for SPL (which I hope is secondar=
y<br>
program loading) we have things like the guest loader which expands the<br>
plain HW DTB with some information needed by the bootloader and the<br>
primary OS to load additional blobs which have been put into memory.<br>
<br>
In effect the DTB is being expanded as a signalling mechanism similar to<br=
>
things like fw_cfg and other things we use to control boot up. Whether<br>
this affects the &quot;purity&quot; of DTB as a &quot;just the HW&quot; des=
cription is<br>
probably a philosophical question.<br>
<br></blockquote><div>More than a philosophical question: a key aspect of s=
upply chain that need change from</div><div>quite inflexible and tightly co=
upled to loosely coupled.</div><div>=C2=A0A key aspect of it is to maintain=
 &quot;pure&quot; hardware description DTBs at rest.</div><div>Composition =
of DTBs at build time (for products) or runtime (for development boards) sh=
ould be a simple thing.</div><div>Another aspect to take into account is Sy=
stem Device Trees. U-Boot only deal with Cortex-As on a platform,=C2=A0</di=
v><div>so there are multiple device trees for each compute domain. Communit=
ies are working on System Device Tree</div><div>to define the overall platf=
orm with its power and clock domains. A tool &quot;lopper&quot; is being de=
veloped to slide the SDT into diverse domain DTs.</div><div>One of them bei=
ng included into the FIP as the basis for the computing element (Carrier, S=
oM...).</div><div>Those attempts to cleanup passed DTBs from configuration =
data (drivers, bootloaders...) is not incompatible=C2=A0</div><div>with mer=
ging fragments at runtime (for dev boards) or build time (for products).</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204=
);padding-left:1ex">
I agree with Peter that just allowing the merging of arbitrary data into<br=
>
the QEMU generated DTB is going to lead to confusion and breakages.<br>
Indeed I wrote the guest-loader because instructions for booting Xen up<br>
until that point involved dumpdtb and hand hacking the data which was<br>
silly because this is stuff QEMU already knew about.<br>
<br>
&gt;<br>
&gt; -- PMM<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><table st=
yle=3D"font-size:small" border=3D"0" cellpadding=3D"0" cellspacing=3D"0"><t=
body><tr><td style=3D"padding-right:10px" valign=3D"top"><img src=3D"https:=
//static.linaro.org/common/images/linaro-logo-web.png"></td><td valign=3D"t=
op"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0"><tbody><tr><td =
style=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:now=
rap;font-size:9pt;padding-top:0px;color:rgb(87,87,87)" valign=3D"top"><span=
 style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog</span>=C2=
=A0<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0<i>Director Busines=
s Development</i></td></tr><tr><td style=3D"font-family:Arial,Helvetica,&qu=
ot;Sans Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:2px;color:=
rgb(87,87,87)" valign=3D"top">T:=C2=A0<a value=3D"+393384075993" style=3D"c=
olor:rgb(17,85,204)">+33.67221.6485</a><br><a href=3D"mailto:francois.ozog@=
linaro.org" style=3D"color:rgb(87,87,87);text-decoration:none" target=3D"_b=
lank">francois.ozog@linaro.org</a>=C2=A0<span style=3D"color:rgb(161,161,16=
1)">|</span>=C2=A0Skype:=C2=A0ffozog</td></tr></tbody></table></td></tr></t=
body></table></div></div></div></div></div><div><div><br style=3D"font-size=
:small"></div></div></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div>
</div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><table st=
yle=3D"font-size:small" border=3D"0" cellpadding=3D"0" cellspacing=3D"0"><t=
body><tr><td style=3D"padding-right:10px" valign=3D"top"><img src=3D"https:=
//static.linaro.org/common/images/linaro-logo-web.png"></td><td valign=3D"t=
op"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0"><tbody><tr><td =
style=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:now=
rap;font-size:9pt;padding-top:0px;color:rgb(87,87,87)" valign=3D"top"><span=
 style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog</span>=C2=
=A0<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0<i>Director Busines=
s Development</i></td></tr><tr><td style=3D"font-family:Arial,Helvetica,&qu=
ot;Sans Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:2px;color:=
rgb(87,87,87)" valign=3D"top">T:=C2=A0<a value=3D"+393384075993" style=3D"c=
olor:rgb(17,85,204)">+33.67221.6485</a><br><a href=3D"mailto:francois.ozog@=
linaro.org" style=3D"color:rgb(87,87,87);text-decoration:none" target=3D"_b=
lank">francois.ozog@linaro.org</a>=C2=A0<span style=3D"color:rgb(161,161,16=
1)">|</span>=C2=A0Skype:=C2=A0ffozog</td></tr></tbody></table></td></tr></t=
body></table></div></div></div></div></div><div><div><br style=3D"font-size=
:small"></div></div></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div></div>

--000000000000a2315505d00c9cb4--


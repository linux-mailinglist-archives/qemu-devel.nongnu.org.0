Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A43668F3D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:28:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGET1-0007ts-3c; Fri, 13 Jan 2023 02:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pGESr-0007gR-My; Fri, 13 Jan 2023 02:27:01 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pGESp-0003aE-9t; Fri, 13 Jan 2023 02:27:01 -0500
Received: by mail-ej1-x635.google.com with SMTP id tz12so50279156ejc.9;
 Thu, 12 Jan 2023 23:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mBDIuG2kevWDhRKJiCueVLKoohUA1AYd/IzsflKIud0=;
 b=km7J+8826Hpq39w9bwzTToBZq/oi4qED60kZeU5FEyt4EuHhwvCHMPGpqsyBi/KY6F
 jzdAL/AsAAQI0QrZ72pyba2xjMDUsuQJxSk/mU3Dl/NWqoYHjUiLwMMWhO24hvzvaLhA
 WVffI7Q0us+P7pkerVR3/D//ZBVuWbUnh+Tvs/q+QcRir98vm0CBr1VmHMxsKcIRPoQT
 NawMmDXRctz2iyNUVBz3SVVq/usheZNFuV/VbMNv9yjrQk/UPTGkdz2tXxfT24EwouYB
 tY6XRWgDi0mwDqmE9AiNIL7ZkXKXaFCdEFwL8Q9oP6KfpOQlF/sU6yF212NkH8FpeEqR
 GIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mBDIuG2kevWDhRKJiCueVLKoohUA1AYd/IzsflKIud0=;
 b=Yk2MZoBnv5EH+0SC2PQRqZE8l1CNhAuFVeBP8Tth1UZian8VzesEKcSec8SzWsUd0h
 H7G3Nmprxwo0+25Ydb/t9jYOQawmRPVm7WSABrrc/65foBVgyPV4SyFngkyhOtGtfJkQ
 eQ7TP4jDSd9rwSBiU8fQPO77DWldcVErVFDywMw2DWH0sI6DoKoI2Sux+Y6HLwIhXMb/
 KkyzLSZVPbItPLrF/J0EODndK34EpC3WI+da6P1pwBs070AmhEFHybHMByf0motSqc6S
 cboGOGbPtmUzHkGgaCStlw8DdmkdyLSvUMtZUJAbldRGeKPa6YehaRTDDaBpYna55q4U
 GkaA==
X-Gm-Message-State: AFqh2kqiVF+0qhQ5/lJXnrxiM+NIJlM3tHTFsejQ+95a8CzwnNRF0Xt2
 YX4RZTWXrNt0eN8DBEiZ9cHqit+nNkVlsW1kLAo=
X-Google-Smtp-Source: AMrXdXsBOipu5YudhXBEZvAKp5rG3GacbUNF7H+e/fPsOeJnpEyXYN/jesYdw2vKRXFQTFvMfYpnZIMZ7KbRBFnS8Z4=
X-Received: by 2002:a17:907:2d92:b0:84d:236c:842b with SMTP id
 gt18-20020a1709072d9200b0084d236c842bmr2082648ejc.424.1673594817369; Thu, 12
 Jan 2023 23:26:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
In-Reply-To: <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Fri, 13 Jan 2023 08:26:44 +0100
Message-ID: <CABLmASEoLF=6qMXk_WBeeG3LpuWH9hYkQNNKT25ZMocx=vEAxg@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000965b8405f2202820"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x635.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000965b8405f2202820
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 13, 2023 at 12:53 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Thu, 12 Jan 2023, Howard Spoelstra wrote:
> > On Wed, Jan 11, 2023 at 1:15 AM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >
> >> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
> >>> On 04/01/2023 21:59, BALATON Zoltan wrote:
> >>>
> >>>> Setting emulated machine type with a property called "via" is
> >>>> confusing users so deprecate the "via" option in favour of newly added
> >>>> explicit machine types. The default via=cuda option is not a valid
> >>>> config (no real Mac has this combination of hardware) so no machine
> >>>> type could be defined for that therefore it is kept for backwards
> >>>> compatibility with older QEMU versions for now but other options
> >>>> resembling real machines are deprecated.
> >>>>
> >>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >>>
> >>> I believe that people do use -M mac99,via=cuda to run some rare
> versions
> >> of
> >>> MacOS in QEMU (I think possibly OS X DP and Workgroup Server?), so we
> >> would
> >>> want to keep this option somewhere.
> >>
> >> The idea is that after previous patches we now have machine types for
> all
> >> other via option values (that also match real Mac machines) other than
> >> via=cude but that is the default for mac99 so after the reprecation
> period
> >> when the via option is removed mac99 (which is the same as
> mac99,via=cuda)
> >> can remain for this use case (and for backward compatibility) until the
> >> other machines are fixed to not need this any more. So all via options
> are
> >> still available but as different machine types.
> >>
> > My 2 cents about naming:
> > It seems less important how the machines are named when their name is not
> > covering their definition. F.i. the powermac3,1 never had adb, could not
> be
> > equipped with a G3 cpu, did not run at 900Mhz. The closest possible
> > qemu-options based definition of a powermac3,1 (via=pmu) will not run Mac
> > OS 9.0.4 ;-) due to the 2 USB devices problem. To run that via=cuda is
> > already needed.
>
> What does that mean? Should we aim to emulate real Macs or are we happy
> with the Franken-Mac we have now?
>
The names also show what we intend to
> emulate even though the emulation may not be complete or have bugs (this
> is also true for other machines in QEMU where a lot of them are not fully
> emulated, only well enough to boot guest OSes).
>

> Looks like everybody has forgotten the previous discussion and not read
> the docs and deprecation patches where this is explained so I summarise
> the proposed change here again:
>
>
No, I haven't forgotten that discussion. FWIW (as I cannot contribute): I
personally do not oppose a name change, the new names seem more
descriptive. I tested your patches and they behave as they should. The
functionality does not change. However, my simple point was what's in a
name when the underlying machine does not reflect what the name implies.

It is not my place to comment on a possible development agenda. I can only
tell you what I'd like and point out issues.



> - qemu-system-ppc -M mac99 is unchanged and works like before it just
> warns for the via option and when using it in qemu-system-ppc64 suggesting
> using new machines instead so these could evetually be removed next year.
> mac99,via=cuda is just mac99 so you can continue to use that, mac99 is
> not deprecated and don't want to remove it.
>
> - qemu-system-ppc64 -M mac99 -> powermac7_3
>
> - qemu-system-ppc -M mac99,via=pmu -> powermac3,1
>
> - qemu-system-ppc64 -M mac99,via=pmu-adb -> powerbook3_2
>
> The last one is one of the rare Macs that had adb and pmu, all others with
> pmu usually have USB. The PowerMac1,2 (G4 PCI) had CUDA but not with mac99
> hardware but more similar to g3beige and no ADB ports according to
> https://en.wikipedia.org/wiki/Power_Mac_G4#1st_generation:_Graphite
> https://en.wikipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White)#Hardware
>
> The PowerMac7,3 seems to be matching the PCI device listing in the comment
> at the beginning of mac_newworld.c and also this article:
> https://www.informit.com/articles/article.aspx?p=606582
>
> What is the 2 USB devices problem? Is it the one we've debugged before and
> found that it's noted in a comment marked with ??? in hw/usb/hcd-ohci.c?
> That could be fixed if there was somebody interested enough to provide a
> patch.
>

It is not about passing through USB devices and active packets per
endpoint. The powermac3,1 has two 2 USB 1.1 ports. However, when booting
Mac OS 9.0.4 with via=pmu it will support only one (the kbd).  When started
with via=cuda -usb -device usb-kbd -device usb-mouse it will support the
first-mentioned usb-kbd. When kbd and mouse arguments are reversed it
supports the other device ;-)


>
> But this series does not remove the mac99 and does not even deprecate it.
> What it deprecates are the via option to select different machine types
> and the automatic detection of ppc64 to emulate something different which
> are hard to understand for users and caused several misunderstandings.
> It's much more clear to have a separate machine type for each machine we
> emulate even when they aren't yet complete but at least we know which way
> to go and can compare to real hardware and fix the missing parts later.
> Also introducing powermac7_3 to split the ppc64 mac99 would allow to
> remove qemu-system-ppc if we wanted and only have one executable for all
> machines but even without this it's clearer to have separate machnies for
> G5 and G4 macs than mac99 silently behaving differently.
>
> Regards,
> BALATON Zoltan
>

--000000000000965b8405f2202820
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 13, 2023 at 12:53 AM BALA=
TON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
hu, 12 Jan 2023, Howard Spoelstra wrote:<br>
&gt; On Wed, Jan 11, 2023 at 1:15 AM BALATON Zoltan &lt;<a href=3D"mailto:b=
alaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:<br>
&gt;&gt;&gt; On 04/01/2023 21:59, BALATON Zoltan wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Setting emulated machine type with a property called &quot=
;via&quot; is<br>
&gt;&gt;&gt;&gt; confusing users so deprecate the &quot;via&quot; option in=
 favour of newly added<br>
&gt;&gt;&gt;&gt; explicit machine types. The default via=3Dcuda option is n=
ot a valid<br>
&gt;&gt;&gt;&gt; config (no real Mac has this combination of hardware) so n=
o machine<br>
&gt;&gt;&gt;&gt; type could be defined for that therefore it is kept for ba=
ckwards<br>
&gt;&gt;&gt;&gt; compatibility with older QEMU versions for now but other o=
ptions<br>
&gt;&gt;&gt;&gt; resembling real machines are deprecated.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: BALATON Zoltan &lt;<a href=3D"mailto:balato=
n@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I believe that people do use -M mac99,via=3Dcuda to run some r=
are versions<br>
&gt;&gt; of<br>
&gt;&gt;&gt; MacOS in QEMU (I think possibly OS X DP and Workgroup Server?)=
, so we<br>
&gt;&gt; would<br>
&gt;&gt;&gt; want to keep this option somewhere.<br>
&gt;&gt;<br>
&gt;&gt; The idea is that after previous patches we now have machine types =
for all<br>
&gt;&gt; other via option values (that also match real Mac machines) other =
than<br>
&gt;&gt; via=3Dcude but that is the default for mac99 so after the reprecat=
ion period<br>
&gt;&gt; when the via option is removed mac99 (which is the same as mac99,v=
ia=3Dcuda)<br>
&gt;&gt; can remain for this use case (and for backward compatibility) unti=
l the<br>
&gt;&gt; other machines are fixed to not need this any more. So all via opt=
ions are<br>
&gt;&gt; still available but as different machine types.<br>
&gt;&gt;<br>
&gt; My 2 cents about naming:<br>
&gt; It seems less important how the machines are named when their name is =
not<br>
&gt; covering their definition. F.i. the powermac3,1 never had adb, could n=
ot be<br>
&gt; equipped with a G3 cpu, did not run at 900Mhz. The closest possible<br=
>
&gt; qemu-options based definition of a powermac3,1 (via=3Dpmu) will not ru=
n Mac<br>
&gt; OS 9.0.4 ;-) due to the 2 USB devices problem. To run that via=3Dcuda =
is<br>
&gt; already needed.<br>
<br>
What does that mean? Should we aim to emulate real Macs or are we happy <br=
>
with the Franken-Mac we have now? <br></blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">The names also show what we intend to <br>
emulate even though the emulation may not be complete or have bugs (this <b=
r>
is also true for other machines in QEMU where a lot of them are not fully <=
br>
emulated, only well enough to boot guest OSes).<br></blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Looks like everybody has forgotten the previous discussion and not read <br=
>
the docs and deprecation patches where this is explained so I summarise <br=
>
the proposed change here again:<br>
<br></blockquote><div>=C2=A0</div><div>No, I haven&#39;t forgotten that dis=
cussion. FWIW (as I cannot contribute): I personally do not oppose a name c=
hange, the new names seem more descriptive. I tested your patches and they =
behave as they should. The functionality does not change. However, my simpl=
e point was what&#39;s in a name when the underlying machine does not refle=
ct what the name implies. <br></div><div><br></div><div>It is not my place =
to comment on a possible development agenda. I can only tell you what I&#39=
;d like and point out issues.<br></div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
- qemu-system-ppc -M mac99 is unchanged and works like before it just <br>
warns for the via option and when using it in qemu-system-ppc64 suggesting =
<br>
using new machines instead so these could evetually be removed next year. <=
br>
mac99,via=3Dcuda is just mac99 so you can continue to use that, mac99 is <b=
r>
not deprecated and don&#39;t want to remove it.<br>
<br>
- qemu-system-ppc64 -M mac99 -&gt; powermac7_3<br>
<br>
- qemu-system-ppc -M mac99,via=3Dpmu -&gt; powermac3,1<br>
<br>
- qemu-system-ppc64 -M mac99,via=3Dpmu-adb -&gt; powerbook3_2<br>
<br>
The last one is one of the rare Macs that had adb and pmu, all others with =
<br>
pmu usually have USB. The PowerMac1,2 (G4 PCI) had CUDA but not with mac99 =
<br>
hardware but more similar to g3beige and no ADB ports according to <br>
<a href=3D"https://en.wikipedia.org/wiki/Power_Mac_G4#1st_generation:_Graph=
ite" rel=3D"noreferrer" target=3D"_blank">https://en.wikipedia.org/wiki/Pow=
er_Mac_G4#1st_generation:_Graphite</a><br>
<a href=3D"https://en.wikipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White=
)#Hardware" rel=3D"noreferrer" target=3D"_blank">https://en.wikipedia.org/w=
iki/Power_Macintosh_G3_(Blue_and_White)#Hardware</a><br>
<br>
The PowerMac7,3 seems to be matching the PCI device listing in the comment =
<br>
at the beginning of mac_newworld.c and also this article:<br>
<a href=3D"https://www.informit.com/articles/article.aspx?p=3D606582" rel=
=3D"noreferrer" target=3D"_blank">https://www.informit.com/articles/article=
.aspx?p=3D606582</a><br>
<br>
What is the 2 USB devices problem? Is it the one we&#39;ve debugged before =
and <br>
found that it&#39;s noted in a comment marked with ??? in hw/usb/hcd-ohci.c=
? <br>
That could be fixed if there was somebody interested enough to provide a <b=
r>
patch.<br></blockquote><div><br></div>It is not about passing through USB d=
evices and active packets per endpoint. The powermac3,1 has two 2 USB 1.1 p=
orts. However, when booting Mac OS 9.0.4 with via=3Dpmu it will support onl=
y one (the kbd).=C2=A0 When started with via=3Dcuda -usb -device usb-kbd -d=
evice usb-mouse it will support the first-mentioned usb-kbd. When kbd and m=
ouse arguments are reversed it supports the other device ;-)=C2=A0 <br><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
But this series does not remove the mac99 and does not even deprecate it. <=
br>
What it deprecates are the via option to select different machine types <br=
>
and the automatic detection of ppc64 to emulate something different which <=
br>
are hard to understand for users and caused several misunderstandings. <br>
It&#39;s much more clear to have a separate machine type for each machine w=
e <br>
emulate even when they aren&#39;t yet complete but at least we know which w=
ay <br>
to go and can compare to real hardware and fix the missing parts later. <br=
>
Also introducing powermac7_3 to split the ppc64 mac99 would allow to <br>
remove qemu-system-ppc if we wanted and only have one executable for all <b=
r>
machines but even without this it&#39;s clearer to have separate machnies f=
or <br>
G5 and G4 macs than mac99 silently behaving differently.<br>
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote></div></div>

--000000000000965b8405f2202820--


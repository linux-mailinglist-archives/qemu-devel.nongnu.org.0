Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83164CA9AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 16:53:08 +0100 (CET)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRHn-00043m-Gg
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 10:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPRGl-000375-5K
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:52:03 -0500
Received: from [2a00:1450:4864:20::633] (port=37770
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPRGj-0005Vw-2z
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:52:02 -0500
Received: by mail-ej1-x633.google.com with SMTP id bg10so4664633ejb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 07:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49fcyoRDi0y8hzgUJQHfzSZaEoU0z0aLfAFlAFxL4uQ=;
 b=ydU5Pu9/aClR86/zzrLBoBeDiyJPTYXeG3SIzC7s/YKdGEl3ZSYL072SXpKzZsAIYr
 UcWLFVO1EXQAhCBR7PV+xpbcUFzPd7QexajyIfe1oTA+J07BRUsVAtGBBEIdIx4XRjGN
 ZOvvRfMz3knRba02V8XvUGi2+IT3+m22mUWG1NMTPx4SaLH/mZFPi8u+TApNRyRHvDP4
 1anXbe+ZYEAfH3FUINgwU/9s3ddJcxMNjhTrQMGR4szdMXNSKRfEryFcQ5R9FC6Pb4um
 gU3ZBLbmwZBNF+QvcE6PROYy5YjD+zC5w/MGgNojq4NwKkrHW8Y44ol8ClSJUD08z+3I
 tliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49fcyoRDi0y8hzgUJQHfzSZaEoU0z0aLfAFlAFxL4uQ=;
 b=cKtkLSSsq7zTtbLI0n6G9Uj3pG2caT7FRRnr4Aqqo+479/3ZuZsO+TUKh9wCEegZqw
 YG0XrcbdHoMx8R8j46pUfLXw0veIj6nkFXBVElF85bDJzi71YW2CuP12kFK+7+RQBN6n
 o5nccoEMvdnmSQacLEmoLurhcFoUH0GHqAbRt60sHHNU1Tm3n3PSex1tTU9xjhMB9hBo
 RrKong4jxtWNqNRALFrX++22DXl3MIRlNG0rT6KT4j+aYKvjGIOqy5HsyW+7tc1jr430
 NBUpKT7M/JeoYyZOF6ozC+4BqgROdloC2NRX2fhYz3EbmHv+JrZGNdQpbqSiswxhML/w
 hn8w==
X-Gm-Message-State: AOAM532nOUj2AtjF24JKz156nsbCNln/FcuHnYU3RZiLfeDu+54b4w7B
 ypT1OQntuYfeYlo6jOm2j+pqd6AATIOOlIo8YSrzKQ==
X-Google-Smtp-Source: ABdhPJy1TXabDOKSAijsjN7is9hQ2o0QK6uW0MI1yBkUqdCFGzB8JHyWvCR8+uDewstOW6P85LSInSJUp3xcJL5qv7w=
X-Received: by 2002:a17:907:8a25:b0:6d7:d59:6912 with SMTP id
 sc37-20020a1709078a2500b006d70d596912mr5465751ejc.259.1646236318081; Wed, 02
 Mar 2022 07:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
 <3face56c-7488-6736-6394-af1d9979d00f@gmail.com>
 <CAARzgwy2SWi_SmL_YSz0Dio=ynrO_ZUtAASFpiu3-sgMagSY0g@mail.gmail.com>
 <20220302074022-mutt-send-email-mst@kernel.org>
 <b62abe9b-0b69-a55b-aab8-d4efcc633dc4@gmail.com>
In-Reply-To: <b62abe9b-0b69-a55b-aab8-d4efcc633dc4@gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 2 Mar 2022 21:21:46 +0530
Message-ID: <CAARzgwwUgy4f-OE2F6U-LrLJM2UrkZd8pT4i4g9eEGXa-uqgBg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: Liav Albani <liavalb@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f4be4805d93e4208"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::633;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x633.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, shentey@gmail.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f4be4805d93e4208
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 21:13 Liav Albani <liavalb@gmail.com> wrote:

>
> On 3/2/22 14:42, Michael S. Tsirkin wrote:
> > On Wed, Mar 02, 2022 at 10:44:03AM +0530, Ani Sinha wrote:
> >> On Wed, Mar 2, 2022 at 12:50 AM Liav Albani <liavalb@gmail.com> wrote:
> >>>
> >>> On 3/1/22 11:52, Ani Sinha wrote:
> >>>> On Tue, 1 Mar 2022, Igor Mammedov wrote:
> >>>>
> >>>>> On Mon, 28 Feb 2022 22:17:32 +0200
> >>>>> Liav Albani <liavalb@gmail.com> wrote:
> >>>>>
> >>>>>> This can allow the guest OS to determine more easily if i8042
> controller
> >>>>>> is present in the system or not, so it doesn't need to do probing
> of the
> >>>>>> controller, but just initialize it immediately, before enumerating
> the
> >>>>>> ACPI AML namespace.
> >>>>>>
> >>>>>> This change only applies to the x86/q35 machine type, as it uses
> FACP
> >>>>>> ACPI table with revision higher than 1, which should implement at
> least
> >>>>>> ACPI 2.0 features within the table, hence it can also set the IA-PC
> boot
> >>>>>> flags register according to the ACPI 2.0 specification.
> >>>>>>
> >>>>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
> >>>>>> ---
> >>>>>>    hw/acpi/aml-build.c         | 11 ++++++++++-
> >>>>>>    hw/i386/acpi-build.c        |  9 +++++++++
> >>>>>>    hw/i386/acpi-microvm.c      |  9 +++++++++
> >>>>> commit message says it's q35 specific, so wy it touched microvm anc
> piix4?
> >>>> Igor is correct. Although I see that currently there are no 8042
> devices
> >>>> for microvms, maybe we should be conservative and add the code to
> detect
> >>>> the device anyway. In that case, the change could affect microvms too
> when
> >>>> such devices get added in the future.
> >>>>
> >>>>
> >>>> echo -e "info qtree\r\nquit\r\n" | ./qemu-system-x86_64 -machine
> microvm
> >>>> -monitor stdio 2>/dev/null | grep 8042
> >>>>
> >>>> <empty>
> >>> What about this?
> >>>
> >>> echo -e "info qtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
> >>> -device i8042 -monitor stdio 2>/dev/null | grep 8042
> >>>
> >>> Or this?
> >>>
> >>> echo -e "info mtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
> >>> -device i8042 -monitor stdio 2>/dev/null | grep 8042
> >> On both occasions you are explicitly adding the device.
> > Yes of course. It seems a bit cleaner to have -device i8042 -monitor
> > stdio give us the correct ACPI table even if there's no pressing need
> > for this ATM, simply because it's not much more code, and because if we
> > don't we risk guests trying to work around incorrect ACPI tables.
> > Let us however do this in a patch by its own with proper
> > documentation and motivation.
> >
> So if I understand how to do this now - I should drop the code for the
> MicroVM ACPI for now, letting only to change the Q35 FACP table, right?


Correct. Microvm changes can go in a separate patch.


> So if that's the case I should send it in a separate patch?


Yes.


>
> If that's the case, as suggested by you and Ani, I'll not add a separate
> function to reduce code duplication as there's no such thing in such
> case...


Please add the function regardless.


>
>

--000000000000f4be4805d93e4208
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 2, 2022 at 21:13 Liav Albani &lt;<a href=3D"mai=
lto:liavalb@gmail.com">liavalb@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)"><br>
On 3/2/22 14:42, Michael S. Tsirkin wrote:<br>
&gt; On Wed, Mar 02, 2022 at 10:44:03AM +0530, Ani Sinha wrote:<br>
&gt;&gt; On Wed, Mar 2, 2022 at 12:50 AM Liav Albani &lt;<a href=3D"mailto:=
liavalb@gmail.com" target=3D"_blank">liavalb@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 3/1/22 11:52, Ani Sinha wrote:<br>
&gt;&gt;&gt;&gt; On Tue, 1 Mar 2022, Igor Mammedov wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Mon, 28 Feb 2022 22:17:32 +0200<br>
&gt;&gt;&gt;&gt;&gt; Liav Albani &lt;<a href=3D"mailto:liavalb@gmail.com" t=
arget=3D"_blank">liavalb@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; This can allow the guest OS to determine more easi=
ly if i8042 controller<br>
&gt;&gt;&gt;&gt;&gt;&gt; is present in the system or not, so it doesn&#39;t=
 need to do probing of the<br>
&gt;&gt;&gt;&gt;&gt;&gt; controller, but just initialize it immediately, be=
fore enumerating the<br>
&gt;&gt;&gt;&gt;&gt;&gt; ACPI AML namespace.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; This change only applies to the x86/q35 machine ty=
pe, as it uses FACP<br>
&gt;&gt;&gt;&gt;&gt;&gt; ACPI table with revision higher than 1, which shou=
ld implement at least<br>
&gt;&gt;&gt;&gt;&gt;&gt; ACPI 2.0 features within the table, hence it can a=
lso set the IA-PC boot<br>
&gt;&gt;&gt;&gt;&gt;&gt; flags register according to the ACPI 2.0 specifica=
tion.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Liav Albani &lt;<a href=3D"mailto:l=
iavalb@gmail.com" target=3D"_blank">liavalb@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 hw/acpi/aml-build.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 11 ++++++++++-<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 hw/i386/acpi-build.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 9 +++++++++<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 hw/i386/acpi-microvm.c=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 9 +++++++++<br>
&gt;&gt;&gt;&gt;&gt; commit message says it&#39;s q35 specific, so wy it to=
uched microvm anc piix4?<br>
&gt;&gt;&gt;&gt; Igor is correct. Although I see that currently there are n=
o 8042 devices<br>
&gt;&gt;&gt;&gt; for microvms, maybe we should be conservative and add the =
code to detect<br>
&gt;&gt;&gt;&gt; the device anyway. In that case, the change could affect m=
icrovms too when<br>
&gt;&gt;&gt;&gt; such devices get added in the future.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; echo -e &quot;info qtree\r\nquit\r\n&quot; | ./qemu-system=
-x86_64 -machine microvm<br>
&gt;&gt;&gt;&gt; -monitor stdio 2&gt;/dev/null | grep 8042<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &lt;empty&gt;<br>
&gt;&gt;&gt; What about this?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; echo -e &quot;info qtree\r\nquit\r\n&quot; | qemu-system-x86_6=
4 -machine microvm<br>
&gt;&gt;&gt; -device i8042 -monitor stdio 2&gt;/dev/null | grep 8042<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Or this?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; echo -e &quot;info mtree\r\nquit\r\n&quot; | qemu-system-x86_6=
4 -machine microvm<br>
&gt;&gt;&gt; -device i8042 -monitor stdio 2&gt;/dev/null | grep 8042<br>
&gt;&gt; On both occasions you are explicitly adding the device.<br>
&gt; Yes of course. It seems a bit cleaner to have -device i8042 -monitor<b=
r>
&gt; stdio give us the correct ACPI table even if there&#39;s no pressing n=
eed<br>
&gt; for this ATM, simply because it&#39;s not much more code, and because =
if we<br>
&gt; don&#39;t we risk guests trying to work around incorrect ACPI tables.<=
br>
&gt; Let us however do this in a patch by its own with proper<br>
&gt; documentation and motivation.<br>
&gt;<br>
So if I understand how to do this now - I should drop the code for the <br>
MicroVM ACPI for now, letting only to change the Q35 FACP table, right? </b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Correct. Microvm ch=
anges can go in a separate patch.</div><div dir=3D"auto"><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)" dir=3D"auto"><br>
So if that&#39;s the case I should send it in a separate patch?</blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">Yes.</div><div dir=3D"auto">=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
If that&#39;s the case, as suggested by you and Ani, I&#39;ll not add a sep=
arate <br>
function to reduce code duplication as there&#39;s no such thing in such ca=
se...</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Please add =
the function regardless.</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"><br>
<br>
</blockquote></div></div>

--000000000000f4be4805d93e4208--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E55228262
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 16:38:43 +0200 (CEST)
Received: from localhost ([::1]:44188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxtPm-0000Ry-4p
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 10:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vit9696@protonmail.com>)
 id 1jxoVm-0006fv-K2
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 05:24:34 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:12895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vit9696@protonmail.com>)
 id 1jxoVj-0000aS-34
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 05:24:34 -0400
Date: Tue, 21 Jul 2020 09:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1595323466;
 bh=bqpjcd5xG1rYDdLYCe8GfPBMQhnAjnE/HQIefbuFZGE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=MCCIjWAD6gCAdlImcQbI6Q9kCkxsQzBMzY07qBKQWuq8J7Nt59Hh0z5y40qALLPlT
 xSO8Xrc/1HAJYinADKXYofsSoGdloI7l7BvuHmQJ47Xp+FjN6LWXHf9kUTQNmZVpiM
 bB9T8zajfdGRgoGt6IE5K0v4zV1e925lFstRZjD8=
To: "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>
From: vit9696 <vit9696@protonmail.com>
Cc: mhaeuser@posteo.de, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu devel list <qemu-devel@nongnu.org>
Subject: Re: OVMF and PCI0 UID
Message-ID: <BF9EF866-55D1-47A4-85F5-3E654F825AEF@protonmail.com>
In-Reply-To: <20200721025745-mutt-send-email-mst@kernel.org>
References: <56E4DCD4-DBA1-4A41-8568-1CBBB37ED320@protonmail.com>
 <829eba8a-d9a7-a335-6b85-91e64462e64b@redhat.com>
 <20200721025745-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="---------------------e12fb5e286426883aebba885608334de";
 charset=utf-8
Received-SPF: pass client-ip=185.70.40.22; envelope-from=vit9696@protonmail.com;
 helo=mail2.protonmail.ch
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 05:24:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Jul 2020 10:37:23 -0400
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
Reply-To: vit9696 <vit9696@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------e12fb5e286426883aebba885608334de
Cc: mhaeuser@posteo.de, Igor Mammedov <imammedo@redhat.com>, "Marcel Apfelbaum (GMail address)" <marcel.apfelbaum@gmail.com>, qemu devel list <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="Apple-Mail=_E7EB3E15-CFB8-444E-BD37-ABF9B59DBA26"
Date: Tue, 21 Jul 2020 12:24:16 +0300
From: vit9696 <vit9696@protonmail.com>
In-Reply-To: <20200721025745-mutt-send-email-mst@kernel.org>
Message-Id: <BF9EF866-55D1-47A4-85F5-3E654F825AEF@protonmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
References: <56E4DCD4-DBA1-4A41-8568-1CBBB37ED320@protonmail.com> <829eba8a-d9a7-a335-6b85-91e64462e64b@redhat.com> <rchqkqup1bSmfrEPGulUrwEsyGLud-0fhgtnflYwrHZhujZBpn3-853kg1qdP6gDh23UP0upKyDmKnrVuNmaTA==@protonmail.internalid> <GeWBK-qQsV4Ra2sxda8LvRkl4c39AgcZShrCLjq-DLB88UOO4eAGbqzth6NSNu3h1w63bcpXfnm4vaMJg1kL6g==@protonmail.conversationid> <20200721025745-mutt-send-email-mst@kernel.org>
Subject: Re: OVMF and PCI0 UID
To: "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)


This is a multi-part message in MIME format.
--Apple-Mail=_E7EB3E15-CFB8-444E-BD37-ABF9B59DBA26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8

Thank you, we will provide an update whether this solves the problem.

Besides, this is not the only case where UIDs are wrong for the PCI bus. In=
 hw/arm/virt-acpi-build.c there is the following code:

    Aml *dev =3D aml_device("%s", "PCI0");
    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
    aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
    aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
    aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
    aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));

https://github.com/qemu/qemu/blob/2c1fb4d/hw/arm/virt-acpi-build.c#L168-L17=
5 <https://github.com/qemu/qemu/blob/2c1fb4d/hw/arm/virt-acpi-build.c#L168-=
L175>

It makes UID on ARM builds a string, which is certainly not expected. We do=
 not have ARM test setups, but I hope this can be useful too.

Best wishes,
Vitaly

> 21 =D0=B8=D1=8E=D0=BB=D1=8F 2020 =D0=B3., =D0=B2 09:58, Michael S. Tsirki=
n <mst@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):
>=20
>=20
> On Mon, Jul 20, 2020 at 11:25:58PM +0200, Laszlo Ersek wrote:
>> Hi Vitaly,
>>=20
>> adding Igor, Michael, Marcel, and qemu-devel.
>>=20
>> On 07/20/20 11:06, vit9696 wrote:
>>> Hello,
>>>=20
>>> I discovered an issue with inconsistent QEMU/OVMF device paths, and
>>> while I am unsure whether directing this e-mail is appropriate to you,
>>> I believe that you likely have the contacts you could forward this
>>> e-mail to.
>>>=20
>>> macOS uses ACPI UIDs to build the DevicePath for NVRAM boot options,
>>> while OVMF firmware gets them via an internal channel through QEMU.
>>> Due to a bug in QEMU (or OVMF) currently UEFI firmware and ACPI have
>>> different values, and this makes the underlying operating system
>>> unable to report its boot option.
>>>=20
>>> The particular node in question is the primary PciRoot (PCI0 in ACPI),
>>> which for some reason gets assigned 1 in ACPI UID and 0 in the
>>> DevicePath. To me this looks like a bug here:
>>> https://github.com/qemu/qemu/blob/8f06f22/hw/i386/acpi-build.c#L1511-L1=
515
>>> Which does not correspond to the primary PCI identifier here:
>>> https://github.com/qemu/qemu/blob/5a79d10/hw/pci/pci.c#L160-L162
>>>=20
>>> Reference with the device paths, OVMF startup logs, and ACPI table
>>> dumps (SysReport):
>>> https://github.com/acidanthera/bugtracker/issues/1050
>>>=20
>>> Would you be able to forward this to the right people or perhaps keep
>>> an eye on the issue itself?
>>=20
>> I think you are right.
>>=20
>> In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with
>> the paragraph,
>>=20
>>    Root PCI bridges will use the plug and play ID of PNP0A03, This will
>>    be stored in the ACPI Device Path _HID field, or in the Expanded
>>    ACPI Device Path _CID field to match the ACPI name space. The _UID
>>    in the ACPI Device Path structure must match the _UID in the ACPI
>>    name space.
>>=20
>> (See especially the last sentence.)
>>=20
>> Considering *extra* root bridges / root buses (with bus number > 0),
>> QEMU's ACPI generator actually does the right thing; since QEMU commit
>> c96d9286a6d7 ("i386/acpi-build: more traditional _UID and _HID for PXB
>> root buses", 2015-06-11).
>>=20
>> However, the _UID values for root bridge zero (on both i440fx and q35)
>> have always been "wrong" (from UEFI perspective), going back in QEMU to
>> commit 74523b850189 ("i386: add ACPI table files from seabios",
>> 2013-10-14).
>>=20
>> Even in SeaBIOS, these _UID values have always been 1; see commit
>> a4d357638c57 ("Port rombios32 code from bochs-bios.", 2008-03-08) for
>> i440fx, and commit ecbe3fd61511 ("seabios: q35: add dsdt", 2012-12-01)
>> for q35.
>>=20
>> Does the following patch work for you? (I can see you proposed the same
>> in
>> <https://github.com/acidanthera/bugtracker/issues/1050#issuecomment-6607=
34139>)
>>=20
>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>> index b7bcbbbb2a35..7a5a8b3521b0 100644
>>> --- a/hw/i386/acpi-build.c
>>> +++ b/hw/i386/acpi-build.c
>>> @@ -1496,9 +1496,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>>>         sb_scope =3D aml_scope("_SB");
>>>         dev =3D aml_device("PCI0");
>>>         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
>>>         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>> -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>>> +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>         aml_append(sb_scope, dev);
>>>         aml_append(dsdt, sb_scope);
>>>=20
>>>         build_hpet_aml(dsdt);
>>> @@ -1511,9 +1511,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>>>         dev =3D aml_device("PCI0");
>>>         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
>>>         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
>>>         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>> -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>>> +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>         aml_append(dev, build_q35_osc_method());
>>>         aml_append(sb_scope, dev);
>>>         aml_append(dsdt, sb_scope);
>>=20
>> If it does, I suggest submitting the above patch to qemu-devel, and/or
>> filing a bug for upstream QEMU at <https://bugs.launchpad.net/qemu/>.
>=20
> Or even just reporting whether the above helps you, we can
> take it from there.
>=20
>> (Note: I didn't even compile the above change.)
>>=20
>> Thanks
>> Laszlo


--Apple-Mail=_E7EB3E15-CFB8-444E-BD37-ABF9B59DBA26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D"">Thank you, we will provide=
 an update whether this solves the problem.<div class=3D""><br class=3D""><=
/div><div class=3D"">Besides, this is not the only case where UIDs are wron=
g for the PCI bus. In&nbsp;hw/arm/virt-acpi-build.c there is the following =
code:</div><div class=3D""><br class=3D""></div><div class=3D""><div class=
=3D"">&nbsp; &nbsp; Aml *dev =3D aml_device("%s", "PCI0");</div><div class=
=3D"">&nbsp; &nbsp; aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A=
08")));</div><div class=3D"">&nbsp; &nbsp; aml_append(dev, aml_name_decl("_=
CID", aml_string("PNP0A03")));</div><div class=3D"">&nbsp; &nbsp; aml_appen=
d(dev, aml_name_decl("_SEG", aml_int(0)));</div><div class=3D"">&nbsp; &nbs=
p; aml_append(dev, aml_name_decl("_BBN", aml_int(0)));</div><div class=3D""=
>&nbsp; &nbsp; aml_append(dev, aml_name_decl("_ADR", aml_int(0)));</div><di=
v class=3D"">&nbsp; &nbsp; aml_append(dev, aml_name_decl("_UID", aml_string=
("PCI0")));</div><div class=3D"">&nbsp; &nbsp; aml_append(dev, aml_name_dec=
l("_STR", aml_unicode("PCIe 0 Device")));</div><div class=3D"">&nbsp; &nbsp=
; aml_append(dev, aml_name_decl("_CCA", aml_int(1)));</div><div class=3D"">=
<br class=3D""></div><div class=3D""><a href=3D"https://github.com/qemu/qem=
u/blob/2c1fb4d/hw/arm/virt-acpi-build.c#L168-L175" class=3D"">https://githu=
b.com/qemu/qemu/blob/2c1fb4d/hw/arm/virt-acpi-build.c#L168-L175</a></div><d=
iv class=3D""><br class=3D""></div><div class=3D"">It makes UID on ARM buil=
ds a string, which is certainly not expected. We do not have ARM test setup=
s, but I hope this can be useful too.</div><div class=3D""><br class=3D""><=
/div><div class=3D"">Best wishes,</div><div class=3D"">Vitaly</div><div><br=
 class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">21 =D0=B8=
=D1=8E=D0=BB=D1=8F 2020 =D0=B3., =D0=B2 09:58, Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com" class=3D"">mst@redhat.com</a>&gt; =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):</div><br class=3D"Apple-interchange=
-newline"><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-fami=
ly: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none; float: none; display: inline !important;" class=3D"">On =
Mon, Jul 20, 2020 at 11:25:58PM +0200, Laszlo Ersek wrote:</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D""><blockquote type=3D"cite" style=3D"font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; widows:=
 auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D"">Hi Vitaly,<br class=3D"">=
<br class=3D"">adding Igor, Michael, Marcel, and qemu-devel.<br class=3D"">=
<br class=3D"">On 07/20/20 11:06, vit9696 wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Hello,<br class=3D""><br class=3D"">I discovered a=
n issue with inconsistent QEMU/OVMF device paths, and<br class=3D"">while I=
 am unsure whether directing this e-mail is appropriate to you,<br class=3D=
"">I believe that you likely have the contacts you could forward this<br cl=
ass=3D"">e-mail to.<br class=3D""><br class=3D"">macOS uses ACPI UIDs to bu=
ild the DevicePath for NVRAM boot options,<br class=3D"">while OVMF firmwar=
e gets them via an internal channel through QEMU.<br class=3D"">Due to a bu=
g in QEMU (or OVMF) currently UEFI firmware and ACPI have<br class=3D"">dif=
ferent values, and this makes the underlying operating system<br class=3D""=
>unable to report its boot option.<br class=3D""><br class=3D"">The particu=
lar node in question is the primary PciRoot (PCI0 in ACPI),<br class=3D"">w=
hich for some reason gets assigned 1 in ACPI UID and 0 in the<br class=3D""=
>DevicePath. To me this looks like a bug here:<br class=3D""><a href=3D"htt=
ps://github.com/qemu/qemu/blob/8f06f22/hw/i386/acpi-build.c#L1511-L1515" cl=
ass=3D"">https://github.com/qemu/qemu/blob/8f06f22/hw/i386/acpi-build.c#L15=
11-L1515</a><br class=3D"">Which does not correspond to the primary PCI ide=
ntifier here:<br class=3D"">https://github.com/qemu/qemu/blob/5a79d10/hw/pc=
i/pci.c#L160-L162<br class=3D""><br class=3D"">Reference with the device pa=
ths, OVMF startup logs, and ACPI table<br class=3D"">dumps (SysReport):<br =
class=3D"">https://github.com/acidanthera/bugtracker/issues/1050<br class=
=3D""><br class=3D"">Would you be able to forward this to the right people =
or perhaps keep<br class=3D"">an eye on the issue itself?<br class=3D""></b=
lockquote><br class=3D"">I think you are right.<br class=3D""><br class=3D"=
">In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with<br=
 class=3D"">the paragraph,<br class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;R=
oot PCI bridges will use the plug and play ID of PNP0A03, This will<br clas=
s=3D"">&nbsp;&nbsp;&nbsp;be stored in the ACPI Device Path _HID field, or i=
n the Expanded<br class=3D"">&nbsp;&nbsp;&nbsp;ACPI Device Path _CID field =
to match the ACPI name space. The _UID<br class=3D"">&nbsp;&nbsp;&nbsp;in t=
he ACPI Device Path structure must match the _UID in the ACPI<br class=3D""=
>&nbsp;&nbsp;&nbsp;name space.<br class=3D""><br class=3D"">(See especially=
 the last sentence.)<br class=3D""><br class=3D"">Considering *extra* root =
bridges / root buses (with bus number &gt; 0),<br class=3D"">QEMU's ACPI ge=
nerator actually does the right thing; since QEMU commit<br class=3D"">c96d=
9286a6d7 ("i386/acpi-build: more traditional _UID and _HID for PXB<br class=
=3D"">root buses", 2015-06-11).<br class=3D""><br class=3D"">However, the _=
UID values for root bridge zero (on both i440fx and q35)<br class=3D"">have=
 always been "wrong" (from UEFI perspective), going back in QEMU to<br clas=
s=3D"">commit 74523b850189 ("i386: add ACPI table files from seabios",<br c=
lass=3D"">2013-10-14).<br class=3D""><br class=3D"">Even in SeaBIOS, these =
_UID values have always been 1; see commit<br class=3D"">a4d357638c57 ("Por=
t rombios32 code from bochs-bios.", 2008-03-08) for<br class=3D"">i440fx, a=
nd commit ecbe3fd61511 ("seabios: q35: add dsdt", 2012-12-01)<br class=3D""=
>for q35.<br class=3D""><br class=3D"">Does the following patch work for yo=
u? (I can see you proposed the same<br class=3D"">in<br class=3D"">&lt;<a h=
ref=3D"https://github.com/acidanthera/bugtracker/issues/1050#issuecomment-6=
60734139" class=3D"">https://github.com/acidanthera/bugtracker/issues/1050#=
issuecomment-660734139</a>&gt;)<br class=3D""><br class=3D""><blockquote ty=
pe=3D"cite" class=3D"">diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-bui=
ld.c<br class=3D"">index b7bcbbbb2a35..7a5a8b3521b0 100644<br class=3D"">--=
- a/hw/i386/acpi-build.c<br class=3D"">+++ b/hw/i386/acpi-build.c<br class=
=3D"">@@ -1496,9 +1496,9 @@ build_dsdt(GArray *table_data, BIOSLinker *link=
er,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sb_scope =
=3D aml_scope("_SB");<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;dev =3D aml_device("PCI0");<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;aml_append(dev, aml_name_decl("_HID", aml_eisaid("P=
NP0A03")));<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a=
ml_append(dev, aml_name_decl("_ADR", aml_int(0)));<br class=3D"">- &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aml_append(dev, aml_name_decl("_UID", aml=
_int(1)));<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aml_ap=
pend(dev, aml_name_decl("_UID", aml_int(0)));<br class=3D"">&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aml_append(sb_scope, dev);<br class=3D"">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aml_append(dsdt, sb_scope);<=
br class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;build_hpet_aml(dsdt);<br class=3D"">@@ -1511,9 +1511,9 @@ build_dsdt(GArr=
ay *table_data, BIOSLinker *linker,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;dev =3D aml_device("PCI0");<br class=3D"">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aml_append(dev, aml_name_decl("_HID",=
 aml_eisaid("PNP0A08")));<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));=
<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aml_append(d=
ev, aml_name_decl("_ADR", aml_int(0)));<br class=3D"">- &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;aml_append(dev, aml_name_decl("_UID", aml_int(1)));<=
br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aml_append(dev, a=
ml_name_decl("_UID", aml_int(0)));<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;aml_append(dev, build_q35_osc_method());<br class=3D"=
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aml_append(sb_scope, dev)=
;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;aml_append(=
dsdt, sb_scope);<br class=3D""></blockquote><br class=3D"">If it does, I su=
ggest submitting the above patch to qemu-devel, and/or<br class=3D"">filing=
 a bug for upstream QEMU at &lt;<a href=3D"https://bugs.launchpad.net/qemu/=
" class=3D"">https://bugs.launchpad.net/qemu/</a>&gt;.<br class=3D""></bloc=
kquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; =
float: none; display: inline !important;" class=3D"">Or even just reporting=
 whether the above helps you, we can</span><br style=3D"caret-color: rgb(0,=
 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-v=
ariant-caps: normal; font-weight: normal; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" clas=
s=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none; float: none; display: inline !important=
;" class=3D"">take it from there.</span><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-=
size: 12px; font-style: normal; font-variant-caps: normal; font-weight: nor=
mal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" styl=
e=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: aut=
o; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">(Note: I d=
idn't even compile the above change.)<br class=3D""><br class=3D"">Thanks<b=
r class=3D"">Laszlo</blockquote></div></blockquote></div><br class=3D""></d=
iv></body></html>
--Apple-Mail=_E7EB3E15-CFB8-444E-BD37-ABF9B59DBA26--
.

-----------------------e12fb5e286426883aebba885608334de
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsBmBAEBCAAQBQJfFrRDCRBPsoxt7Hy0xQAKCRBPsoxt7Hy0xS4YCACUA5FM
3hn7AcUtHrtfOIYnIvnGbEjJNdtiLfxx9rIJooPGxVQGqVLzYPo6dzyjtimQ
IOir863MeRO5SxoOElJCgssuEnTatPWK1PWmz5MM0dRIC/l9mk9XGRjsSkyT
Wu71CVTBbX7cWkloRzC65uDJEfUPaPzDNttIWayRk12qZD9D/pItQR80dn4W
1wFeo1V1wfGL1NWRA/LX2i2bi6ZLm5EgPviK6yMmMnVAZ5J8+7QUkbXiOZqd
+sOOxXjNCNFUvDF6AS2XU9cYXEr7dHa9HIEzT71KH7kQv+IFbQWnqBz0xRBP
JS32KIo/SqEK6JeHXrui939QhT76zrPhJ5pu
=8uOK
-----END PGP SIGNATURE-----


-----------------------e12fb5e286426883aebba885608334de--



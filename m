Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143934620A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:57:07 +0100 (CET)
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiSr-0006Pz-Bq
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1lOiRZ-0004lw-Lz; Tue, 23 Mar 2021 10:55:41 -0400
Received: from mail.ispras.ru ([83.149.199.84]:45896)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1lOiRW-0005Sl-SA; Tue, 23 Mar 2021 10:55:41 -0400
Received: from gardenia.intra.ispras.ru (unknown [10.10.2.240])
 by mail.ispras.ru (Postfix) with ESMTPSA id 09634407626C;
 Tue, 23 Mar 2021 14:55:35 +0000 (UTC)
From: Vitaly Cheptsov <cheptsov@ispras.ru>
Message-Id: <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_944A5FF0-B70C-4058-8BDC-50253C5CDEFE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] i386/acpi: restore device paths for pre-5.1 vms
Date: Tue, 23 Mar 2021 17:55:34 +0300
In-Reply-To: <20210323104542-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Thomas Lamprecht <t.lamprecht@proxmox.com>,
 qemu devel list <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_944A5FF0-B70C-4058-8BDC-50253C5CDEFE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

They can simply set the 5.2 VM version in such a case. I do not want to =
let this legacy hack to be enabled in any modern QEMU VM version, as it =
violates ACPI specification and makes the life more difficult for =
various other software like bootloaders and operating systems.

> 23 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 17:48, Michael =
S. Tsirkin <mst@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=
=B0):
>=20
> The issue is with people who installed a VM using 5.1 qemu,
> migrated to 5.2, booted there and set a config on a device
> e.g. IP on a NIC.
> They now have a 5.1 machine type but changing uid back
> like we do will break these VMs.
>=20
> Unlikley to be common but let's at least create a way for these people
> to used these VMs.
>=20
>=20
> On Mon, Mar 22, 2021 at 06:49:09PM +0300, Vitaly Cheptsov wrote:
>> Hi Michael,
>>=20
>> That makes little sense in my opinion, these people can simply =
upgrade the VM version, which apparently looks the right way to do it in =
my opinion.
>>=20
>> Best regards,
>> Vitaly
>>=20
>>> 22 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 18:43, =
Michael S. Tsirkin <mst@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BB(=D0=B0):
>>>=20
>>> On Mon, Mar 01, 2021 at 10:59:18PM +0300, Vitaly Cheptsov wrote:
>>>> After fixing the _UID value for the primary PCI root bridge in
>>>> af1b80ae it was discovered that this change updates Windows
>>>> configuration in an incompatible way causing network configuration
>>>> failure unless DHCP is used. More details provided on the list:
>>>>=20
>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08484.html
>>>>=20
>>>> This change reverts the _UID update from 1 to 0 for q35 and i440fx
>>>> VMs before version 5.2 to maintain the original behaviour when
>>>> upgrading.
>>>>=20
>>>> Cc: qemu-stable@nongnu.org
>>>> Cc: qemu-devel@nongnu.org
>>>> Reported-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
>>>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
>>>> ---
>>>> hw/i386/acpi-build.c | 4 ++--
>>>> hw/i386/pc_piix.c    | 2 ++
>>>> hw/i386/pc_q35.c     | 2 ++
>>>> include/hw/i386/pc.h | 1 +
>>>> 4 files changed, 7 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>>> index 31a5f6f4a5..442b4629a9 100644
>>>> --- a/hw/i386/acpi-build.c
>>>> +++ b/hw/i386/acpi-build.c
>>>> @@ -1277,7 +1277,7 @@ build_dsdt(GArray *table_data, BIOSLinker =
*linker,
>>>>        dev =3D aml_device("PCI0");
>>>>        aml_append(dev, aml_name_decl("_HID", =
aml_eisaid("PNP0A03")));
>>>>        aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>>> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>> +        aml_append(dev, aml_name_decl("_UID", =
aml_int(pcmc->pci_root_uid)));
>>>>        aml_append(sb_scope, dev);
>>>>        aml_append(dsdt, sb_scope);
>>>>=20
>>>> @@ -1296,7 +1296,7 @@ build_dsdt(GArray *table_data, BIOSLinker =
*linker,
>>>>        aml_append(dev, aml_name_decl("_HID", =
aml_eisaid("PNP0A08")));
>>>>        aml_append(dev, aml_name_decl("_CID", =
aml_eisaid("PNP0A03")));
>>>>        aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>>> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>> +        aml_append(dev, aml_name_decl("_UID", =
aml_int(pcmc->pci_root_uid)));
>>>>        aml_append(dev, build_q35_osc_method());
>>>>        aml_append(sb_scope, dev);
>>>>        if (mcfg_valid) {
>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>>> index 2904b40163..46cc951073 100644
>>>> --- a/hw/i386/pc_piix.c
>>>> +++ b/hw/i386/pc_piix.c
>>>> @@ -405,6 +405,7 @@ static void =
pc_i440fx_machine_options(MachineClass *m)
>>>> {
>>>>    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>>>>    pcmc->default_nic_model =3D "e1000";
>>>> +    pcmc->pci_root_uid =3D 0;
>>>>=20
>>>>    m->family =3D "pc_piix";
>>>>    m->desc =3D "Standard PC (i440FX + PIIX, 1996)";
>>>> @@ -448,6 +449,7 @@ static void =
pc_i440fx_5_1_machine_options(MachineClass *m)
>>>>    compat_props_add(m->compat_props, hw_compat_5_1, =
hw_compat_5_1_len);
>>>>    compat_props_add(m->compat_props, pc_compat_5_1, =
pc_compat_5_1_len);
>>>>    pcmc->kvmclock_create_always =3D false;
>>>> +    pcmc->pci_root_uid =3D 1;
>>>> }
>>>>=20
>>>> DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
>>>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>>>> index 0a212443aa..53450190f5 100644
>>>> --- a/hw/i386/pc_q35.c
>>>> +++ b/hw/i386/pc_q35.c
>>>> @@ -329,6 +329,7 @@ static void pc_q35_machine_options(MachineClass =
*m)
>>>> {
>>>>    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>>>>    pcmc->default_nic_model =3D "e1000e";
>>>> +    pcmc->pci_root_uid =3D 0;
>>>>=20
>>>>    m->family =3D "pc_q35";
>>>>    m->desc =3D "Standard PC (Q35 + ICH9, 2009)";
>>>> @@ -375,6 +376,7 @@ static void =
pc_q35_5_1_machine_options(MachineClass *m)
>>>>    compat_props_add(m->compat_props, hw_compat_5_1, =
hw_compat_5_1_len);
>>>>    compat_props_add(m->compat_props, pc_compat_5_1, =
pc_compat_5_1_len);
>>>>    pcmc->kvmclock_create_always =3D false;
>>>> +    pcmc->pci_root_uid =3D 1;
>>>> }
>>>>=20
>>>> DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
>>>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>>>> index c9d194a5e7..d4c3d73c11 100644
>>>> --- a/include/hw/i386/pc.h
>>>> +++ b/include/hw/i386/pc.h
>>>> @@ -105,6 +105,7 @@ struct PCMachineClass {
>>>>    int legacy_acpi_table_size;
>>>>    unsigned acpi_data_size;
>>>>    bool do_not_add_smb_acpi;
>>>> +    int pci_root_uid;
>>>>=20
>>>>    /* SMBIOS compat: */
>>>>    bool smbios_defaults;
>>>=20
>>> So this upstream, but I think we should also have a property
>>> that allows people to have VMs installed with the old
>>> machine type booted with a new machine type.
>>>=20
>>> E.g.  "compat-pci-root-uid".
>>>=20
>>> Vitaly could you take a look?
>>>=20
>>>=20
>>>> --
>>>> 2.24.3 (Apple Git-128)
>>>=20
>>=20
>=20
>=20


--Apple-Mail=_944A5FF0-B70C-4058-8BDC-50253C5CDEFE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEsLABAI5Y5VbvBdmpL8K2O86Eyz4FAmBaAWYACgkQL8K2O86E
yz4uqw/+I8kX5T7F05eus40XaaZTGtVWvD6Ml3WBNUDvW/prNXaJPpyPzfh7a+cC
kuQ+JoxbJlFhsN5RYkPP4jYPv4BiKMBu7mZcq5RjNNl2i+qx4jNr8UzONzvrOU87
bfv+Gq+RTZE/Xiu67a0aP/QkxVtnBAWDZEgVOOlZl843XmEZUSk8PhMxZsoOat/9
03JK20l/Pm3/VwlQjQcXVmvwqIntqyEwUOEAjgjDixtfLuh7mO6yAF+NiJx9X6P1
NBYlrvK0h/kPq/54BZT1frYq1q4fEN5kv2eT2CujZaiSMlcnAqzqR8I2MUhx7ndW
ezRJyNSOdDE9xXSIHMP1UDUEYDmnBoL8KwzGFRIGDIebddEolwhhjz5aw5AUeI3B
k0pPKAaC96bROpqkBMjOCmmLG8WItnOsNn3i/Op7l1R+6evdQJzzyYouk0wpd99/
3U85G+U+lCKQhLO1B19cE4k2dDSSSRim5t40IGSSpjr2lHX6JHtDykQW/z3YvP4t
uB3nXjkCX1Yv4OdSzCW3BfAXjqZnua3vsD7c7psZ6PUVY4+Iu6PgDPFmcNRAOPRx
xETp/YC9ncavfxJ2dyJDZWqXCKEUeAl2uHYTcvwkJvO+4+UghOwgbQWgCGs0tKqk
9YfebC3P6R7zk5hBAQZtwvfkqTJ7lEwSsLY6p7Eh7YeejH5UcMc=
=Oil7
-----END PGP SIGNATURE-----

--Apple-Mail=_944A5FF0-B70C-4058-8BDC-50253C5CDEFE--


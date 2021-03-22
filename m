Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86E344AB8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:11:10 +0100 (CET)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lON92-0008Rp-4U
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1lOMnz-0001tf-MX; Mon, 22 Mar 2021 11:49:24 -0400
Received: from mail.ispras.ru ([83.149.199.84]:33114)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1lOMnw-0000yP-CK; Mon, 22 Mar 2021 11:49:23 -0400
Received: from [192.168.1.2] (unknown [77.232.9.83])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3B84440755F8;
 Mon, 22 Mar 2021 15:49:10 +0000 (UTC)
From: Vitaly Cheptsov <cheptsov@ispras.ru>
Message-Id: <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_A7718416-3C37-40C3-A198-2C56898532A1";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] i386/acpi: restore device paths for pre-5.1 vms
Date: Mon, 22 Mar 2021 18:49:09 +0300
In-Reply-To: <20210322114116-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
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
Cc: Thomas Lamprecht <t.lamprecht@proxmox.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_A7718416-3C37-40C3-A198-2C56898532A1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Michael,

That makes little sense in my opinion, these people can simply upgrade =
the VM version, which apparently looks the right way to do it in my =
opinion.

Best regards,
Vitaly

> 22 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 18:43, Michael =
S. Tsirkin <mst@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=
=B0):
>=20
> On Mon, Mar 01, 2021 at 10:59:18PM +0300, Vitaly Cheptsov wrote:
>> After fixing the _UID value for the primary PCI root bridge in
>> af1b80ae it was discovered that this change updates Windows
>> configuration in an incompatible way causing network configuration
>> failure unless DHCP is used. More details provided on the list:
>>=20
>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08484.html
>>=20
>> This change reverts the _UID update from 1 to 0 for q35 and i440fx
>> VMs before version 5.2 to maintain the original behaviour when
>> upgrading.
>>=20
>> Cc: qemu-stable@nongnu.org
>> Cc: qemu-devel@nongnu.org
>> Reported-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
>> ---
>> hw/i386/acpi-build.c | 4 ++--
>> hw/i386/pc_piix.c    | 2 ++
>> hw/i386/pc_q35.c     | 2 ++
>> include/hw/i386/pc.h | 1 +
>> 4 files changed, 7 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 31a5f6f4a5..442b4629a9 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1277,7 +1277,7 @@ build_dsdt(GArray *table_data, BIOSLinker =
*linker,
>>         dev =3D aml_device("PCI0");
>>         aml_append(dev, aml_name_decl("_HID", =
aml_eisaid("PNP0A03")));
>>         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>> +        aml_append(dev, aml_name_decl("_UID", =
aml_int(pcmc->pci_root_uid)));
>>         aml_append(sb_scope, dev);
>>         aml_append(dsdt, sb_scope);
>>=20
>> @@ -1296,7 +1296,7 @@ build_dsdt(GArray *table_data, BIOSLinker =
*linker,
>>         aml_append(dev, aml_name_decl("_HID", =
aml_eisaid("PNP0A08")));
>>         aml_append(dev, aml_name_decl("_CID", =
aml_eisaid("PNP0A03")));
>>         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>> +        aml_append(dev, aml_name_decl("_UID", =
aml_int(pcmc->pci_root_uid)));
>>         aml_append(dev, build_q35_osc_method());
>>         aml_append(sb_scope, dev);
>>         if (mcfg_valid) {
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 2904b40163..46cc951073 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -405,6 +405,7 @@ static void =
pc_i440fx_machine_options(MachineClass *m)
>> {
>>     PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>>     pcmc->default_nic_model =3D "e1000";
>> +    pcmc->pci_root_uid =3D 0;
>>=20
>>     m->family =3D "pc_piix";
>>     m->desc =3D "Standard PC (i440FX + PIIX, 1996)";
>> @@ -448,6 +449,7 @@ static void =
pc_i440fx_5_1_machine_options(MachineClass *m)
>>     compat_props_add(m->compat_props, hw_compat_5_1, =
hw_compat_5_1_len);
>>     compat_props_add(m->compat_props, pc_compat_5_1, =
pc_compat_5_1_len);
>>     pcmc->kvmclock_create_always =3D false;
>> +    pcmc->pci_root_uid =3D 1;
>> }
>>=20
>> DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 0a212443aa..53450190f5 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -329,6 +329,7 @@ static void pc_q35_machine_options(MachineClass =
*m)
>> {
>>     PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>>     pcmc->default_nic_model =3D "e1000e";
>> +    pcmc->pci_root_uid =3D 0;
>>=20
>>     m->family =3D "pc_q35";
>>     m->desc =3D "Standard PC (Q35 + ICH9, 2009)";
>> @@ -375,6 +376,7 @@ static void =
pc_q35_5_1_machine_options(MachineClass *m)
>>     compat_props_add(m->compat_props, hw_compat_5_1, =
hw_compat_5_1_len);
>>     compat_props_add(m->compat_props, pc_compat_5_1, =
pc_compat_5_1_len);
>>     pcmc->kvmclock_create_always =3D false;
>> +    pcmc->pci_root_uid =3D 1;
>> }
>>=20
>> DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index c9d194a5e7..d4c3d73c11 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -105,6 +105,7 @@ struct PCMachineClass {
>>     int legacy_acpi_table_size;
>>     unsigned acpi_data_size;
>>     bool do_not_add_smb_acpi;
>> +    int pci_root_uid;
>>=20
>>     /* SMBIOS compat: */
>>     bool smbios_defaults;
>=20
> So this upstream, but I think we should also have a property
> that allows people to have VMs installed with the old
> machine type booted with a new machine type.
>=20
> E.g.  "compat-pci-root-uid".
>=20
> Vitaly could you take a look?
>=20
>=20
>> --
>> 2.24.3 (Apple Git-128)
>=20


--Apple-Mail=_A7718416-3C37-40C3-A198-2C56898532A1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEsLABAI5Y5VbvBdmpL8K2O86Eyz4FAmBYvHUACgkQL8K2O86E
yz5RIxAAh9ZwkWgE7YLI8OHx0iaY4c674m1WVR3ucO8u489KfNzjXfu4qbyPzInI
Z5GNPPb5qvVgf5u5tCnV3ow4HOrfFWmx4t0aehhMla8xBxajQij0kw0MdvOHD2wD
83wegirSi47NLKzCIxA5/S5h1lkNCjT8kxe+mebMeCUFLO70dXVnvN7zfzhPWSXc
t+dy7X7RviP33orEGbCYM5KzdwCvVMMMXBQh65LnusFonBopX/F3QyBne39Ae+0g
8Z2ZB0mw2GI2E5nI0XS8gh3FQPN/GvogLiMbQ5xYOKm4y0bTcpNJ7ebMbqjrdlGF
KUTMbKPUYYLD0kE0tyVnUQDI5alvMmUUEr08ubJGXW0OUukLVqa2udjL4PdR3AdN
1vbOGlJdEmCMcArdTx+5OduB/lbmKg+SWOOwsinPqlsXZCfgZBF9R8DtHVgZjnQY
n9JU4+4gNwSHAkD1y3pda1ORl783ltRTCRJifM711PdNECc8uap4TZPbJ6G3UAky
vMapJ7UDM5zahOGPYv/sKdDdPPVUAHE9pEg0nAz6TbhuHNUgcJuCSTP6kW3nXPC7
xtl+0FUrqVJtq4ueZ0RXyoGTmX7YKDkE2wHs6mcN3XTfaFV9V6SQbZGsPi1tIwAX
NnIkuEY+95wkD+vGRm/ygQ6sgx7AVHMZL/WlzlLoSH7r+F95LAA=
=P9y4
-----END PGP SIGNATURE-----

--Apple-Mail=_A7718416-3C37-40C3-A198-2C56898532A1--


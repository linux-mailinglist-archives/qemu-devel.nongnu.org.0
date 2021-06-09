Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE53A1E05
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:17:41 +0200 (CEST)
Received: from localhost ([::1]:59548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4dw-0004Fk-Ln
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lr4bv-0003CU-6W
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:15:38 -0400
Received: from mout.gmx.net ([212.227.17.21]:41873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lr4br-0000rF-4M
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623269715;
 bh=3LoSCEU6uwMMU5zCHftfTuJSQ5gLACI2ZD6n8hm+GRU=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:To:CC:From;
 b=eGFSlJ5EpQcPraG6HiAmbxzovnf6l9PFNNVSwagiluYblGFUZJXY/U9lLz6OT3WQq
 tTTxcGxTgrVxwVh/BrSGVtMyNMGkhMYPaMHrSVLoiRWSxPrvlMmnvVQMWNVAyUykX8
 LSnWIN6Kj8nJEBVL6XeNBvehrWKsqkWqeZAPaXiQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from android-51ad2404f1ba2a1.fritz.box ([62.143.247.63]) by
 mail.gmx.net (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MMobU-1laeBS30tA-00Ij4D; Wed, 09 Jun 2021 22:15:14 +0200
Date: Wed, 09 Jun 2021 22:15:10 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <YMEdJi16P3c4tQm0@apples.localdomain>
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
 <YMCwjV7Vpbk5au/U@apples.localdomain>
 <f5f15ac1-0876-331e-7433-a6ca551b9e10@gmx.de>
 <YMC1BJ5zOGQWmg7Q@apples.localdomain> <YMDSmEgfMeZa8cWd@redhat.com>
 <969B60CA-0E05-4510-9B5B-74B19133A874@gmx.de>
 <YMEdJi16P3c4tQm0@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
To: Klaus Jensen <its@irrelevant.dk>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <F17FDDE8-ACAC-44A9-8E8A-4B424FD429DB@gmx.de>
X-Provags-ID: V03:K1:23cDn+LwNbtmY48eJVKS6hvkM/ZAHzLJXK5iNMsLu2NL6trawM3
 wk/UjdpumWnhoFgzJ5r6NznoY6hm4EgdT72PXx7HDTL/7+En6eo4ZOSaOGNVcSo6oGeWpOb
 n475xsAaP6x9h1RJF/CFIVXMlMozek9pRzDHEeMJnYpa30mxSiT0XkatH48AkbTTPbdE+o6
 eesIB8NRAwrwj85S6uo1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5CNBPGPEcS8=:iGiIV/ZufbP1olHR/JJ5ZN
 MpAg/9d0oWgv56ek6b85MYVZfBuS/MXt1boyKrE04TCUIRhajBqZVtFQxHhy1LEzoTGa8BnhB
 xUlk4x8RPtCGXNk/mtGNMBtYOuJtiNlubjePh9H3ggUSaItoJLWZoerMsx5IWQUOkRbAn2KWv
 TUBlAXwrHq5rArVjaFqoiXO191lCrM1MWSrvu9iQ/TaYOZVc8RLiyIpHt7fomGWtb3UV43FtY
 QUH5lL94fQYAHMd6TcFYzso9VTKjbxIez6I62oXxm+UCxo7jGHKgC/qAkP2Xu/qrcksIxPj4s
 AJXUOcs6U16WuW0IqQwRQdqJLunaiF46z1HlcwczP0hkOgXsMORbers4Q72AANXQpbHFmIAxR
 vtj/8cx8FHkXSlPmmg7GzqlzUvIxFLfCljTG2R8ZQHcF9++5l+liJv9Q+bllBzzDjjYKtRu1m
 uI7ZTSCRM6pdhQxE2umAouU6X8Dj1yEbbxHx6NLvT0wkvwlM6QZ7bITBPdpgOTFkCB7VxAPSx
 S9Z9mDtcUYH+buxmAHXsVhaIvl+9wcVOZtKqWWzjO6evltnFutvQHZlZqedApl84Q3XpDsHJs
 90ekN7UCYMXpsAoP51h0M1tV81WuaHm7G8EmCxK516feiQUnHxVdHOYvfDDUefb7TUxx34EiI
 d8inQfcB6kV9DLUShWKwX7GaVch/eAv1PTBVXjhnF6mj2zPsjpmsezoeHtYHUIlN8dFTBrP+i
 avpzL6DeUi03hteb7KAm2Byvl/zcvTQ9wBoHwIr64QrbCkgDCbHm3IyQLodh4QBG2+qd015Pn
 BQiEPtp2cSzLZP/81V9nxIb572Y38uTYBF50TGUyP30pQVIrFMEuiFl60urynYIzBQIZPZrVH
 0iwBZT67e6/GkXApMo+DiaH7b+E3w8iI6dmcGgQ6xFPq1b2sgY7jQTBnrThW8X1HB9eDN/biB
 zffeO4F4V6/TW74KU5IfkCHvxYoU6slfH0BGepz+cRBRk7Q+G9afiltFeIDfdnaXoviumIG32
 qQaukHa+HXlPuLa3HkoXKdSwva/BkqJzDLjyc3zzxd3xRIQIF/0yIUu1UJKe8s6DbPIz0D81B
 RYUsC9jzrwLkcZlznq6IZS0tRvmb7r18IDG
Received-SPF: pass client-ip=212.227.17.21; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 9=2E Juni 2021 21:57:26 MESZ schrieb Klaus Jensen <its@irrelevant=2Edk>:
>On Jun  9 20:13, Heinrich Schuchardt wrote:
>>Am 9=2E Juni 2021 16:39:20 MESZ schrieb "Daniel P=2E Berrang=C3=A9"
><berrange@redhat=2Ecom>:
>>>On Wed, Jun 09, 2021 at 02:33:08PM +0200, Klaus Jensen wrote:
>>>> On Jun  9 14:21, Heinrich Schuchardt wrote:
>>>> > On 6/9/21 2:14 PM, Klaus Jensen wrote:
>>>> > > On Jun=C2=A0 9 13:46, Heinrich Schuchardt wrote:
>>>> > > > The EUI64 field is the only identifier for NVMe namespaces in
>>>UEFI device
>>>> > > > paths=2E Add a new namespace property "eui64", that provides
>the
>>>user the
>>>> > > > option to specify the EUI64=2E
>>>> > > >
>>>> > > > Signed-off-by: Heinrich Schuchardt <xypron=2Eglpk@gmx=2Ede>
>>>> > > > ---
>>>> > > > docs/system/nvme=2Erst |=C2=A0 4 +++
>>>> > > > hw/nvme/ctrl=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58
>>>++++++++++++++++++++++++++------------------
>>>> > > > hw/nvme/ns=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 2 ++
>>>> > > > hw/nvme/nvme=2Eh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 =
+
>>>> > > > 4 files changed, 42 insertions(+), 23 deletions(-)
>>>> > > >
>>>> > > > diff --git a/docs/system/nvme=2Erst b/docs/system/nvme=2Erst
>>>> > > > index f7f63d6bf6=2E=2Ea6042f942a 100644
>>>> > > > --- a/docs/system/nvme=2Erst
>>>> > > > +++ b/docs/system/nvme=2Erst
>>>> > > > @@ -81,6 +81,10 @@ There are a number of parameters
>available:
>>>> > > > =C2=A0 Set the UUID of the namespace=2E This will be reported a=
s a
>>>"Namespace
>>>> > > > UUID"
>>>> > > > =C2=A0 descriptor in the Namespace Identification Descriptor Li=
st=2E
>>>> > > >
>>>> > > > +``eui64``
>>>> > > > +=C2=A0 Set the EUI64 of the namespace=2E This will be reported=
 as a
>>>"IEEE
>>>> > > > Extended
>>>> > > > +=C2=A0 Unique Identifier" descriptor in the Namespace
>>>Identification
>>>> > > > Descriptor List=2E
>>>> > > > +
>>>> > > > ``bus``
>>>> > > > =C2=A0 If there are more ``nvme`` devices defined, this paramet=
er
>>>may be
>>>> > > > used to
>>>> > > > =C2=A0 attach the namespace to a specific ``nvme`` device
>>>(identified by an
>>>> > > > ``id``
>>>> > > > diff --git a/hw/nvme/ctrl=2Ec b/hw/nvme/ctrl=2Ec
>>>> > > > index 0bcaf7192f=2E=2E21f2d6843b 100644
>>>> > > > --- a/hw/nvme/ctrl=2Ec
>>>> > > > +++ b/hw/nvme/ctrl=2Ec
>>>> > > > @@ -4426,19 +4426,19 @@ static uint16_t
>>>> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>>>> > > > =C2=A0=C2=A0=C2=A0 NvmeIdentify *c =3D (NvmeIdentify *)&req->cm=
d;
>>>> > > > =C2=A0=C2=A0=C2=A0 uint32_t nsid =3D le32_to_cpu(c->nsid);
>>>> > > > =C2=A0=C2=A0=C2=A0 uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {}=
;
>>>> > > > -
>>>> > > > -=C2=A0=C2=A0=C2=A0 struct data {
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 NvmeIdNsDescr hdr;
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 uint8_t v[NVME_NIDL_UUID];
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } uuid;
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 NvmeIdNsDescr hdr;
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 uint8_t v;
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } csi;
>>>> > > > -=C2=A0=C2=A0=C2=A0 };
>>>> > > > -
>>>> > > > -=C2=A0=C2=A0=C2=A0 struct data *ns_descrs =3D (struct data *)l=
ist;
>>>> > > > +=C2=A0=C2=A0=C2=A0 uint8_t *pos =3D list;
>>>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v[NVME_NIDL=
_UUID];
>>>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED uuid;
>>>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t v;
>>>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED eui64;
>>>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v;
>>>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED csi;
>>>> > > >
>>>> > > > =C2=A0=C2=A0=C2=A0 trace_pci_nvme_identify_ns_descr_list(nsid);
>>>> > > >
>>>> > > > @@ -4452,17 +4452,29 @@ static uint16_t
>>>> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>>>> > > > =C2=A0=C2=A0=C2=A0 }
>>>> > > >
>>>> > > > =C2=A0=C2=A0=C2=A0 /*
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Because the NGUID and EUI64 fields =
are 0 in the
>>>Identify
>>>> > > > Namespace data
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * structure, a Namespace UUID (nidt =
=3D 3h) must be
>>>reported in the
>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Namespace Identification Descriptor=
=2E Add the
>namespace
>>>UUID here=2E
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the EUI64 field is 0 and the NGU=
ID field is 0, the
>>>> > > > namespace must
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * provide a valid Namespace UUID in t=
he Namespace
>>>Identification
>>>> > > > Descriptor
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * data structure=2E QEMU does not yet=
 support setting
>>>NGUID=2E
>>>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid=2Ehdr=2Enidt =3D NVME_NIDT_=
UUID;
>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid=2Ehdr=2Enidl =3D NVME_NIDL_=
UUID;
>>>> > > > -=C2=A0=C2=A0=C2=A0 memcpy(&ns_descrs->uuid=2Ev, ns->params=2Eu=
uid=2Edata,
>>>NVME_NIDL_UUID);
>>>> > > > -
>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi=2Ehdr=2Enidt =3D NVME_NIDT_C=
SI;
>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi=2Ehdr=2Enidl =3D NVME_NIDL_C=
SI;
>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi=2Ev =3D ns->csi;
>>>> > > > +=C2=A0=C2=A0=C2=A0 uuid=2Ehdr=2Enidt =3D NVME_NIDT_UUID;
>>>> > > > +=C2=A0=C2=A0=C2=A0 uuid=2Ehdr=2Enidl =3D NVME_NIDL_UUID;
>>>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(uuid=2Ev, ns->params=2Euuid=2Edata, =
NVME_NIDL_UUID);
>>>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(pos, &uuid, sizeof(uuid));
>>>> > > > +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(uuid);
>>>> > > > +
>>>> > > > +=C2=A0=C2=A0=C2=A0 if (ns->params=2Eeui64) {
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64=2Ehdr=2Enidt =
=3D NVME_NIDT_EUI64;
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64=2Ehdr=2Enidl =
=3D NVME_NIDL_EUI64;
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64=2Ev =3D cpu_t=
o_be64(ns->params=2Eeui64);
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(pos, &eui64,=
 sizeof(eui64));
>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(eui=
64);
>>>> > > > +=C2=A0=C2=A0=C2=A0 }
>>>> > > > +
>>>> > > > +=C2=A0=C2=A0=C2=A0 csi=2Ehdr=2Enidt =3D NVME_NIDT_CSI;
>>>> > > > +=C2=A0=C2=A0=C2=A0 csi=2Ehdr=2Enidl =3D NVME_NIDL_CSI;
>>>> > > > +=C2=A0=C2=A0=C2=A0 csi=2Ev =3D ns->csi;
>>>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(pos, &csi, sizeof(csi));
>>>> > > > +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(csi);
>>>> > > >
>>>> > > > =C2=A0=C2=A0=C2=A0 return nvme_c2h(n, list, sizeof(list), req);
>>>> > > > }
>>>> > > > diff --git a/hw/nvme/ns=2Ec b/hw/nvme/ns=2Ec
>>>> > > > index 992e5a13f5=2E=2Eddf395d60e 100644
>>>> > > > --- a/hw/nvme/ns=2Ec
>>>> > > > +++ b/hw/nvme/ns=2Ec
>>>> > > > @@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns,
>>>Error
>>>> > > > **errp)
>>>> > > > =C2=A0=C2=A0=C2=A0 id_ns->mssrl =3D cpu_to_le16(ns->params=2Ems=
srl);
>>>> > > > =C2=A0=C2=A0=C2=A0 id_ns->mcl =3D cpu_to_le32(ns->params=2Emcl)=
;
>>>> > > > =C2=A0=C2=A0=C2=A0 id_ns->msrc =3D ns->params=2Emsrc;
>>>> > > > +=C2=A0=C2=A0=C2=A0 id_ns->eui64 =3D cpu_to_be64(ns->params=2Ee=
ui64);
>>>> > > >
>>>> > > > =C2=A0=C2=A0=C2=A0 ds =3D 31 - clz32(ns->blkconf=2Elogical_bloc=
k_size);
>>>> > > > =C2=A0=C2=A0=C2=A0 ms =3D ns->params=2Ems;
>>>> > > > @@ -518,6 +519,7 @@ static Property nvme_ns_props[] =3D {
>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("shared", NvmeNamespace, pa=
rams=2Eshared,
>>>false),
>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("nsid", NvmeNamespace, pa=
rams=2Ensid,
>0),
>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UUID("uuid", NvmeNamespace, para=
ms=2Euuid),
>>>> > > > +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT64("eui64", NvmeNamespace, =
params=2Eeui64,
>>>0),
>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT16("ms", NvmeNamespace, para=
ms=2Ems, 0),
>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("mset", NvmeNamespace, par=
ams=2Emset, 0),
>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("pi", NvmeNamespace, param=
s=2Epi, 0),
>>>> > > > diff --git a/hw/nvme/nvme=2Eh b/hw/nvme/nvme=2Eh
>>>> > > > index 81a35cda14=2E=2Eabe7fab21c 100644
>>>> > > > --- a/hw/nvme/nvme=2Eh
>>>> > > > +++ b/hw/nvme/nvme=2Eh
>>>> > > > @@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
>>>> > > > =C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 shared;
>>>> > > > =C2=A0=C2=A0=C2=A0 uint32_t nsid;
>>>> > > > =C2=A0=C2=A0=C2=A0 QemuUUID uuid;
>>>> > > > +=C2=A0=C2=A0=C2=A0 uint64_t eui64;
>>>> > > >
>>>> > > > =C2=A0=C2=A0=C2=A0 uint16_t ms;
>>>> > > > =C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 mset;
>>>> > > > --
>>>> > > > 2=2E30=2E2
>>>> > > >
>>>> > > >
>>>> > >
>>>> > > Would it make sense to provide a sensible default for EUI64
>such
>>>that it
>>>> > > is always there? That is, using the same IEEE OUI as we already
>>>report
>>>> > > in the IEEE field and add an extension identifier by grabbing 5
>>>bytes
>>>> > > from the UUID?
>>>> >
>>>> > According to the NVMe 1=2E4 specification it is allowable to have a
>>>NVMe
>>>> > device that does not support EUI64=2E As the EUI64 is used to
>define
>>>boot
>>>> > options in UEFI using a non-zero default may break existing
>>>installations=2E
>>>> >
>>>>
>>>> Right=2E We dont wanna do that=2E
>>>
>>>Any change in defaults can (must) be tied to the machine type
>versions,
>>>so that existing installs are unchanged, but new installs using
>latest
>>>machine type get the new default=2E
>>
>>The road of least surprise is preferable=2E All machine should behave
>the=20
>>same if there is no real necessity to deviate=2E
>>
>
>I'd rather not introduce a new user-facing knob for this when a very=20
>sensible default can be derived from the uuid and the QEMU IEEE OUI=2E We
>
>already have the uuid parameter that allows users to ensure that the=20
>namespace holds a persistent unique identifier=2E Adding another
>parameter=20
>with the same purpose seems unnecessary=2E And since we are adding EUI64,
>
>we should probably also add NGUID while we are at it=2E
>
>So, instead of adding parameters for EUI64 and NGUID that the user must
>
>specify to get this more real-world behavior, I'd prefer to rely on a=20
>couple of boolean compat properties, e=2Eg=2E 'support-eui64' and=20
>'support-nguid' that defaults to 'on', but is set to 'off' for pre-6=2E1=
=20
>machines=2E
>
>I think this is a nice compromise between making sure that having=20
>sensible EUI64 and NGUID values set is the new default while making
>sure=20
>that we do not break existing setup=2E
>
>Would this be an acceptable compromise to you Heinrich?

EUI64 defined on some machine and not on others is totally obscure for use=
rs=2E

The virt machine is typically used and is pre-6=2E1=2E As pointed out abov=
e you should not change the EUI64 when QEMU is upgraded and invoked with th=
e same parameter set=2E

EUI64 is what UEFI and Windows rely on=2E Why should a user specify a UUID=
 if he needs a EUI64?

There is no collisionfree mapping of 16 byte UUIDs to 8 byte EUI64s=2E So =
if a user specifies different UUIDs he may still get conflicting EUI64s=2E

How should a user find out which UUID he has to specify to get the EUI64 h=
e wants to set?

If you want to remove the uuid parameter, I don't care=2E But EUI64 is wha=
t we need=2E

Best regards

Heinrich



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4993A1C94
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:15:05 +0200 (CEST)
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2jI-0005io-Lw
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lr2iF-00053E-PI
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:13:59 -0400
Received: from mout.gmx.net ([212.227.15.19]:58661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lr2iD-0004uJ-8C
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623262422;
 bh=eoNPvmRuYPJ5YWyFzYmJXYKWvpqWuYsYZCZoZxqtG1g=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:To:CC:From;
 b=KqRFlzfmsWrLiUy6OSf71onkaS9l5CBVUxrdbfa2U7yJx+O7QfR6OdpvExPbg/1UO
 3jLdepJzvcp8ue5gn4KwIdbVwNeEbjPcJ8u/JX+J7jkO7VOjDhySg3qv0sw1aX+WVX
 1Z9deLIrHT4G8v5o8EUAP8TseiH6eRrfWc1SYtZk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from android-51ad2404f1ba2a1.fritz.box ([62.143.247.63]) by
 mail.gmx.net (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M8ygO-1lx6i82Y2Y-00693d; Wed, 09 Jun 2021 20:13:42 +0200
Date: Wed, 09 Jun 2021 20:13:40 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <YMDSmEgfMeZa8cWd@redhat.com>
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
 <YMCwjV7Vpbk5au/U@apples.localdomain>
 <f5f15ac1-0876-331e-7433-a6ca551b9e10@gmx.de>
 <YMC1BJ5zOGQWmg7Q@apples.localdomain> <YMDSmEgfMeZa8cWd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
To: =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <969B60CA-0E05-4510-9B5B-74B19133A874@gmx.de>
X-Provags-ID: V03:K1:Aos91IRQg2RhdQxFiKQT785rGp/cgxQWyYZxLsfwi1tQ0JUiudy
 pS/GbgM0FKEjxrSmuTp8M5NeTxmGsPKH8RbWRux77mupiEK9Uaw5o2/qcx/TYqPKqCZx2Io
 HMlg7V8+gEfF2xF3QHuG1BsojiQIYrlbWM2UmxPyzGQrjfAPDHg1Vqr4V606dy8AGqvCkZA
 8oax/FE4rlboijJvIUBJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sWJl+8oJeFU=:vyMCaSiAQIzD+7cRTHyqT/
 WDv2rS314Y4S8j4yhpKoVv3prMFIz/+/Qafm86MxLv9gHIPeTTFu7buzr/1IOZaOSMYQW8Bta
 3eoxrIICaoRmLfosC5HC1ev1J5b+8N9vEXlKppN8cxt8ZH8iQ1/1WvLWGR0hWEgJulTsa9ptA
 Gag4CK1cDwMi656RBW9S8UBX0qDIyUe6hL1D1y9UnE4cSZ9kBgQWnLpI1vlPJzcUKdDoNqnGd
 UUbVkVUYMCoEPbXBLRmS3YmDuzOzYl16KE5jN6Ne7WBkYEbKXkuXc+RYXrWsZu9Bs6hifnIo3
 ylKR8Y0XMjyGiyrZ/bjJh1oAbzLqgnSDsL8eXm8Ihw4WpLy/0zjWmqN9J4tP/P0jTgZGWnd5+
 s+N7s2tnCF+5kTPVn60odcKp667KOXCSQQLjzWamjlbgIEwWa9c2Yt/71g2t+zNeq9ekI2W83
 8oXOZGlpnnypAcm97rCAbEZlJosDeehRNscFl8/V3J1XH3x5I96Ya6/vksts9IqE3BZqj2XGS
 6NRHy+jnIuAnF2joSThUYC3dF/NUaqZdEBEW/TpzNy7X4JgwAFEt35xCgIlZGkCZkQPdos8tN
 bLQeBPsOutca0HC+0oXjEynaM4pS/JhDE0vOKeXM/B8wQSSjUYE/Q3+nuoDCnIz8n43My+krV
 VBgpE9DsvVRMmlMatoqflyFLCdp6lgl6WI+4Es8II4FTbcoF0NH0kKN0IOnQ7txtqu6NWBUDR
 Vaz3eufuEOe0UG2XdZYb7FIPFYTQRVk4xu+HUFKaXNyk9b9+55NoEmOb3LL3Tnu7PtwywH4o5
 zK6eSISBdA4bNWyR5pvr9AUyaHa+2zS0p7dRWQl2nWLH0tF2U0rrm34KFVTAuImgM1FVqzOKp
 hBbl5sJImQNoZK/OM9w1x+jck2jftXVHjdx0lwRAlBpe3k7QEazYYenwkvP0mf27eMD2ZK9CY
 wwqOF3zo8FESGQR4YUNPCRJ3mIfth7uWcSMlqu27Hi7LanXD3VpYY1rOpL6coxsoyHftGtgA7
 01cCrMConFSZeDtcbvhXweyGGCe5VseSQMjczvmvFoneTT9ijCurpZzAw7M1RGvG9GVuySF7V
 XKFbypZVIymenaNw2ZtEVtKSnBsk1ESgo90
Received-SPF: pass client-ip=212.227.15.19; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 9=2E Juni 2021 16:39:20 MESZ schrieb "Daniel P=2E Berrang=C3=A9" <berran=
ge@redhat=2Ecom>:
>On Wed, Jun 09, 2021 at 02:33:08PM +0200, Klaus Jensen wrote:
>> On Jun  9 14:21, Heinrich Schuchardt wrote:
>> > On 6/9/21 2:14 PM, Klaus Jensen wrote:
>> > > On Jun=C2=A0 9 13:46, Heinrich Schuchardt wrote:
>> > > > The EUI64 field is the only identifier for NVMe namespaces in
>UEFI device
>> > > > paths=2E Add a new namespace property "eui64", that provides the
>user the
>> > > > option to specify the EUI64=2E
>> > > >=20
>> > > > Signed-off-by: Heinrich Schuchardt <xypron=2Eglpk@gmx=2Ede>
>> > > > ---
>> > > > docs/system/nvme=2Erst |=C2=A0 4 +++
>> > > > hw/nvme/ctrl=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58
>++++++++++++++++++++++++++------------------
>> > > > hw/nvme/ns=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 ++
>> > > > hw/nvme/nvme=2Eh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> > > > 4 files changed, 42 insertions(+), 23 deletions(-)
>> > > >=20
>> > > > diff --git a/docs/system/nvme=2Erst b/docs/system/nvme=2Erst
>> > > > index f7f63d6bf6=2E=2Ea6042f942a 100644
>> > > > --- a/docs/system/nvme=2Erst
>> > > > +++ b/docs/system/nvme=2Erst
>> > > > @@ -81,6 +81,10 @@ There are a number of parameters available:
>> > > > =C2=A0 Set the UUID of the namespace=2E This will be reported as =
a
>"Namespace
>> > > > UUID"
>> > > > =C2=A0 descriptor in the Namespace Identification Descriptor List=
=2E
>> > > >=20
>> > > > +``eui64``
>> > > > +=C2=A0 Set the EUI64 of the namespace=2E This will be reported a=
s a
>"IEEE
>> > > > Extended
>> > > > +=C2=A0 Unique Identifier" descriptor in the Namespace
>Identification
>> > > > Descriptor List=2E
>> > > > +
>> > > > ``bus``
>> > > > =C2=A0 If there are more ``nvme`` devices defined, this parameter
>may be
>> > > > used to
>> > > > =C2=A0 attach the namespace to a specific ``nvme`` device
>(identified by an
>> > > > ``id``
>> > > > diff --git a/hw/nvme/ctrl=2Ec b/hw/nvme/ctrl=2Ec
>> > > > index 0bcaf7192f=2E=2E21f2d6843b 100644
>> > > > --- a/hw/nvme/ctrl=2Ec
>> > > > +++ b/hw/nvme/ctrl=2Ec
>> > > > @@ -4426,19 +4426,19 @@ static uint16_t
>> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>> > > > =C2=A0=C2=A0=C2=A0 NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>> > > > =C2=A0=C2=A0=C2=A0 uint32_t nsid =3D le32_to_cpu(c->nsid);
>> > > > =C2=A0=C2=A0=C2=A0 uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
>> > > > -
>> > > > -=C2=A0=C2=A0=C2=A0 struct data {
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NvmeIdNsDescr hdr;
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 uint8_t v[NVME_NIDL_UUID];
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } uuid;
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NvmeIdNsDescr hdr;
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 uint8_t v;
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } csi;
>> > > > -=C2=A0=C2=A0=C2=A0 };
>> > > > -
>> > > > -=C2=A0=C2=A0=C2=A0 struct data *ns_descrs =3D (struct data *)lis=
t;
>> > > > +=C2=A0=C2=A0=C2=A0 uint8_t *pos =3D list;
>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v[NVME_NIDL_U=
UID];
>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED uuid;
>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t v;
>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED eui64;
>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v;
>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED csi;
>> > > >=20
>> > > > =C2=A0=C2=A0=C2=A0 trace_pci_nvme_identify_ns_descr_list(nsid);
>> > > >=20
>> > > > @@ -4452,17 +4452,29 @@ static uint16_t
>> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>> > > > =C2=A0=C2=A0=C2=A0 }
>> > > >=20
>> > > > =C2=A0=C2=A0=C2=A0 /*
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Because the NGUID and EUI64 fields ar=
e 0 in the
>Identify
>> > > > Namespace data
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * structure, a Namespace UUID (nidt =3D=
 3h) must be
>reported in the
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Namespace Identification Descriptor=
=2E Add the namespace
>UUID here=2E
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the EUI64 field is 0 and the NGUID=
 field is 0, the
>> > > > namespace must
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * provide a valid Namespace UUID in the=
 Namespace
>Identification
>> > > > Descriptor
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * data structure=2E QEMU does not yet s=
upport setting
>NGUID=2E
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 */
>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid=2Ehdr=2Enidt =3D NVME_NIDT_UU=
ID;
>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid=2Ehdr=2Enidl =3D NVME_NIDL_UU=
ID;
>> > > > -=C2=A0=C2=A0=C2=A0 memcpy(&ns_descrs->uuid=2Ev, ns->params=2Euui=
d=2Edata,
>NVME_NIDL_UUID);
>> > > > -
>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi=2Ehdr=2Enidt =3D NVME_NIDT_CSI=
;
>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi=2Ehdr=2Enidl =3D NVME_NIDL_CSI=
;
>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi=2Ev =3D ns->csi;
>> > > > +=C2=A0=C2=A0=C2=A0 uuid=2Ehdr=2Enidt =3D NVME_NIDT_UUID;
>> > > > +=C2=A0=C2=A0=C2=A0 uuid=2Ehdr=2Enidl =3D NVME_NIDL_UUID;
>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(uuid=2Ev, ns->params=2Euuid=2Edata, NV=
ME_NIDL_UUID);
>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(pos, &uuid, sizeof(uuid));
>> > > > +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(uuid);
>> > > > +
>> > > > +=C2=A0=C2=A0=C2=A0 if (ns->params=2Eeui64) {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64=2Ehdr=2Enidt =
=3D NVME_NIDT_EUI64;
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64=2Ehdr=2Enidl =
=3D NVME_NIDL_EUI64;
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64=2Ev =3D cpu_to_=
be64(ns->params=2Eeui64);
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(pos, &eui64, s=
izeof(eui64));
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(eui64=
);
>> > > > +=C2=A0=C2=A0=C2=A0 }
>> > > > +
>> > > > +=C2=A0=C2=A0=C2=A0 csi=2Ehdr=2Enidt =3D NVME_NIDT_CSI;
>> > > > +=C2=A0=C2=A0=C2=A0 csi=2Ehdr=2Enidl =3D NVME_NIDL_CSI;
>> > > > +=C2=A0=C2=A0=C2=A0 csi=2Ev =3D ns->csi;
>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(pos, &csi, sizeof(csi));
>> > > > +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(csi);
>> > > >=20
>> > > > =C2=A0=C2=A0=C2=A0 return nvme_c2h(n, list, sizeof(list), req);
>> > > > }
>> > > > diff --git a/hw/nvme/ns=2Ec b/hw/nvme/ns=2Ec
>> > > > index 992e5a13f5=2E=2Eddf395d60e 100644
>> > > > --- a/hw/nvme/ns=2Ec
>> > > > +++ b/hw/nvme/ns=2Ec
>> > > > @@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns,
>Error
>> > > > **errp)
>> > > > =C2=A0=C2=A0=C2=A0 id_ns->mssrl =3D cpu_to_le16(ns->params=2Emssr=
l);
>> > > > =C2=A0=C2=A0=C2=A0 id_ns->mcl =3D cpu_to_le32(ns->params=2Emcl);
>> > > > =C2=A0=C2=A0=C2=A0 id_ns->msrc =3D ns->params=2Emsrc;
>> > > > +=C2=A0=C2=A0=C2=A0 id_ns->eui64 =3D cpu_to_be64(ns->params=2Eeui=
64);
>> > > >=20
>> > > > =C2=A0=C2=A0=C2=A0 ds =3D 31 - clz32(ns->blkconf=2Elogical_block_=
size);
>> > > > =C2=A0=C2=A0=C2=A0 ms =3D ns->params=2Ems;
>> > > > @@ -518,6 +519,7 @@ static Property nvme_ns_props[] =3D {
>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("shared", NvmeNamespace, para=
ms=2Eshared,
>false),
>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("nsid", NvmeNamespace, para=
ms=2Ensid, 0),
>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UUID("uuid", NvmeNamespace, params=
=2Euuid),
>> > > > +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT64("eui64", NvmeNamespace, pa=
rams=2Eeui64,
>0),
>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT16("ms", NvmeNamespace, params=
=2Ems, 0),
>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("mset", NvmeNamespace, param=
s=2Emset, 0),
>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("pi", NvmeNamespace, params=
=2Epi, 0),
>> > > > diff --git a/hw/nvme/nvme=2Eh b/hw/nvme/nvme=2Eh
>> > > > index 81a35cda14=2E=2Eabe7fab21c 100644
>> > > > --- a/hw/nvme/nvme=2Eh
>> > > > +++ b/hw/nvme/nvme=2Eh
>> > > > @@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
>> > > > =C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 shared;
>> > > > =C2=A0=C2=A0=C2=A0 uint32_t nsid;
>> > > > =C2=A0=C2=A0=C2=A0 QemuUUID uuid;
>> > > > +=C2=A0=C2=A0=C2=A0 uint64_t eui64;
>> > > >=20
>> > > > =C2=A0=C2=A0=C2=A0 uint16_t ms;
>> > > > =C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 mset;
>> > > > --
>> > > > 2=2E30=2E2
>> > > >=20
>> > > >=20
>> > >=20
>> > > Would it make sense to provide a sensible default for EUI64 such
>that it
>> > > is always there? That is, using the same IEEE OUI as we already
>report
>> > > in the IEEE field and add an extension identifier by grabbing 5
>bytes
>> > > from the UUID?
>> >=20
>> > According to the NVMe 1=2E4 specification it is allowable to have a
>NVMe
>> > device that does not support EUI64=2E As the EUI64 is used to define
>boot
>> > options in UEFI using a non-zero default may break existing
>installations=2E
>> >=20
>>=20
>> Right=2E We dont wanna do that=2E
>
>Any change in defaults can (must) be tied to the machine type versions,
>so that existing installs are unchanged, but new installs using latest
>machine type get the new default=2E

The road of least surprise is preferable=2E All machine should behave the =
same if there is no real necessity to deviate=2E

Best regards

Heinrich

>
>IOW, it would be possible to set a non-zero EUI if it only gets set
>for 6=2E1=2E0 machine types and later=2E
>
>Regards,
>Daniel



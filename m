Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535893A1DEA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:01:45 +0200 (CEST)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4OV-0000bl-Qd
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lr4KW-0008FL-KQ
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:57:36 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:33367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lr4KT-0005h0-MB
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:57:36 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id DFFF15C00E2;
 Wed,  9 Jun 2021 15:57:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 09 Jun 2021 15:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+NBwlLHlB5Q8lMj07S30VIHl1Zq
 LDl4IzodUncnzWUE=; b=Qnb8Qo06P/ftv4e3EfYmw2m4Xk/hcDm+U2mWaPIoNY4
 TyWt8e00+FdIz+uvepTbnCZ+FQe+gZWBlVju3e3BzAGDQQ3ZAQamEXuEX8uIZTap
 9D7nZloqxNAlHfurD9EdRg3pgelbNoj/sLn1/9oevAh4dh23NgsFmYVf0Z0TeFRv
 ZZYfdp+Ju+VgTd2FxQneIbI502kJUAUdSalr67fjZNn8zu97QBu0bIXDY5oxcYRK
 TzP73pfoAyRpjYlNE2X8zRZfLGnu1TRK4JxX8180m/timvZy6oyC/n4yybqV1rr0
 57kPYLJR+VNDNQcBiMzrkoeI7DrkOtNNy5PORIhD2jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+NBwlL
 HlB5Q8lMj07S30VIHl1ZqLDl4IzodUncnzWUE=; b=m7rY/MO9NK0j9hbayQFVr0
 OjxTnSJaRY1V8ULoKYOx4912M/gmLZvpWOcKGoB6fAWE9jsZDl3cJhL2brXCqexf
 4UIZg3K1DhmRtztx+D/nrF+FpC1qw6Qpu/gWLxO24tmx6imSxFo1aPA3cEQk/Ure
 Vi2dhzJ9mGXSEAUWSxoGNdhkdoj4YA463Z+Y0nuj3EKEwjhMLwsezcFg2duLbfmL
 Iv3JmzmUwmskGNvAC9nA5uyR3txDG9gMicN7UIyI0+s0BcnW8mzTygECzAP45Lcs
 9ty+4TB6dXTSgs4UCdXc3FSOBbPXDhLJWrsj5d9GFGxIOT6Hns9qvkEiAfD39U+w
 ==
X-ME-Sender: <xms:Kh3BYIwDnzw5WoMyiupuy9uJ39Ek_eE-YOUOAasCanvWGN-4a2Dh-A>
 <xme:Kh3BYMRm6qFq08SRWgBVq1VmT3fV5TjLoLaDI9zVLSHarsqpE1mHVP4a-1x5pCtcS
 qv9i8TLQGvIpKB6cYo>
X-ME-Received: <xmr:Kh3BYKUxMjXAqgNbDy623mZNo_t6YkSiwVMOTJKtDyi5kYCkmfc3Iw7K0okBSIyy8fMQOF9BG1u5cCY6IQukUM7-7274BeQb9oebM_Lii4vvqjcD6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepfeefgfdvleeitdehhfevffegleduieffgfdujeeuhfeluddthffgjeegkefh
 kedtnecuffhomhgrihhnpehuuhhiugdruggrthgrnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Kh3BYGjN-N0YTkXHhHJAkKVD2SyBoOEjhtegHG8Cims6FNpMDHN5Cg>
 <xmx:Kh3BYKCpntPypvopOumpYgp3u2Cob6la_ScVH4pmdr3snMkROHRERQ>
 <xmx:Kh3BYHKVWkcqHPpnAtmn5cS5eKZU9TIRRsEwAorJooG1qKI77UrCsw>
 <xmx:Kx3BYM1jRGmEo857RjiA1-PmVcmdr3A16SkeHGwypFXCZMBYMbwjPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 15:57:29 -0400 (EDT)
Date: Wed, 9 Jun 2021 21:57:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
Message-ID: <YMEdJi16P3c4tQm0@apples.localdomain>
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
 <YMCwjV7Vpbk5au/U@apples.localdomain>
 <f5f15ac1-0876-331e-7433-a6ca551b9e10@gmx.de>
 <YMC1BJ5zOGQWmg7Q@apples.localdomain> <YMDSmEgfMeZa8cWd@redhat.com>
 <969B60CA-0E05-4510-9B5B-74B19133A874@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0eeX2FOkhNh52PFi"
Content-Disposition: inline
In-Reply-To: <969B60CA-0E05-4510-9B5B-74B19133A874@gmx.de>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0eeX2FOkhNh52PFi
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  9 20:13, Heinrich Schuchardt wrote:
>Am 9. Juni 2021 16:39:20 MESZ schrieb "Daniel P. Berrang=C3=A9" <berrange@=
redhat.com>:
>>On Wed, Jun 09, 2021 at 02:33:08PM +0200, Klaus Jensen wrote:
>>> On Jun  9 14:21, Heinrich Schuchardt wrote:
>>> > On 6/9/21 2:14 PM, Klaus Jensen wrote:
>>> > > On Jun=C2=A0 9 13:46, Heinrich Schuchardt wrote:
>>> > > > The EUI64 field is the only identifier for NVMe namespaces in
>>UEFI device
>>> > > > paths. Add a new namespace property "eui64", that provides the
>>user the
>>> > > > option to specify the EUI64.
>>> > > >
>>> > > > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>> > > > ---
>>> > > > docs/system/nvme.rst |=C2=A0 4 +++
>>> > > > hw/nvme/ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58
>>++++++++++++++++++++++++++------------------
>>> > > > hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 ++
>>> > > > hw/nvme/nvme.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> > > > 4 files changed, 42 insertions(+), 23 deletions(-)
>>> > > >
>>> > > > diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
>>> > > > index f7f63d6bf6..a6042f942a 100644
>>> > > > --- a/docs/system/nvme.rst
>>> > > > +++ b/docs/system/nvme.rst
>>> > > > @@ -81,6 +81,10 @@ There are a number of parameters available:
>>> > > > =C2=A0 Set the UUID of the namespace. This will be reported as a
>>"Namespace
>>> > > > UUID"
>>> > > > =C2=A0 descriptor in the Namespace Identification Descriptor List.
>>> > > >
>>> > > > +``eui64``
>>> > > > +=C2=A0 Set the EUI64 of the namespace. This will be reported as a
>>"IEEE
>>> > > > Extended
>>> > > > +=C2=A0 Unique Identifier" descriptor in the Namespace
>>Identification
>>> > > > Descriptor List.
>>> > > > +
>>> > > > ``bus``
>>> > > > =C2=A0 If there are more ``nvme`` devices defined, this parameter
>>may be
>>> > > > used to
>>> > > > =C2=A0 attach the namespace to a specific ``nvme`` device
>>(identified by an
>>> > > > ``id``
>>> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>> > > > index 0bcaf7192f..21f2d6843b 100644
>>> > > > --- a/hw/nvme/ctrl.c
>>> > > > +++ b/hw/nvme/ctrl.c
>>> > > > @@ -4426,19 +4426,19 @@ static uint16_t
>>> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>>> > > > =C2=A0=C2=A0=C2=A0 NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>>> > > > =C2=A0=C2=A0=C2=A0 uint32_t nsid =3D le32_to_cpu(c->nsid);
>>> > > > =C2=A0=C2=A0=C2=A0 uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
>>> > > > -
>>> > > > -=C2=A0=C2=A0=C2=A0 struct data {
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NvmeIdNsDescr hdr;
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 uint8_t v[NVME_NIDL_UUID];
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } uuid;
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NvmeIdNsDescr hdr;
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 uint8_t v;
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } csi;
>>> > > > -=C2=A0=C2=A0=C2=A0 };
>>> > > > -
>>> > > > -=C2=A0=C2=A0=C2=A0 struct data *ns_descrs =3D (struct data *)lis=
t;
>>> > > > +=C2=A0=C2=A0=C2=A0 uint8_t *pos =3D list;
>>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v[NVME_NIDL_U=
UID];
>>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED uuid;
>>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t v;
>>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED eui64;
>>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v;
>>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED csi;
>>> > > >
>>> > > > =C2=A0=C2=A0=C2=A0 trace_pci_nvme_identify_ns_descr_list(nsid);
>>> > > >
>>> > > > @@ -4452,17 +4452,29 @@ static uint16_t
>>> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>>> > > > =C2=A0=C2=A0=C2=A0 }
>>> > > >
>>> > > > =C2=A0=C2=A0=C2=A0 /*
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Because the NGUID and EUI64 fields ar=
e 0 in the
>>Identify
>>> > > > Namespace data
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * structure, a Namespace UUID (nidt =3D=
 3h) must be
>>reported in the
>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Namespace Identification Descriptor. =
Add the namespace
>>UUID here.
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the EUI64 field is 0 and the NGUID=
 field is 0, the
>>> > > > namespace must
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * provide a valid Namespace UUID in the=
 Namespace
>>Identification
>>> > > > Descriptor
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * data structure. QEMU does not yet sup=
port setting
>>NGUID.
>>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 */
>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid.hdr.nidt =3D NVME_NIDT_UUID;
>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid.hdr.nidl =3D NVME_NIDL_UUID;
>>> > > > -=C2=A0=C2=A0=C2=A0 memcpy(&ns_descrs->uuid.v, ns->params.uuid.da=
ta,
>>NVME_NIDL_UUID);
>>> > > > -
>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi.hdr.nidt =3D NVME_NIDT_CSI;
>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi.hdr.nidl =3D NVME_NIDL_CSI;
>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi.v =3D ns->csi;
>>> > > > +=C2=A0=C2=A0=C2=A0 uuid.hdr.nidt =3D NVME_NIDT_UUID;
>>> > > > +=C2=A0=C2=A0=C2=A0 uuid.hdr.nidl =3D NVME_NIDL_UUID;
>>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(uuid.v, ns->params.uuid.data, NVME_NID=
L_UUID);
>>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(pos, &uuid, sizeof(uuid));
>>> > > > +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(uuid);
>>> > > > +
>>> > > > +=C2=A0=C2=A0=C2=A0 if (ns->params.eui64) {
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.hdr.nidt =3D NV=
ME_NIDT_EUI64;
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.hdr.nidl =3D NV=
ME_NIDL_EUI64;
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.v =3D cpu_to_be=
64(ns->params.eui64);
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(pos, &eui64, s=
izeof(eui64));
>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(eui64=
);
>>> > > > +=C2=A0=C2=A0=C2=A0 }
>>> > > > +
>>> > > > +=C2=A0=C2=A0=C2=A0 csi.hdr.nidt =3D NVME_NIDT_CSI;
>>> > > > +=C2=A0=C2=A0=C2=A0 csi.hdr.nidl =3D NVME_NIDL_CSI;
>>> > > > +=C2=A0=C2=A0=C2=A0 csi.v =3D ns->csi;
>>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(pos, &csi, sizeof(csi));
>>> > > > +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(csi);
>>> > > >
>>> > > > =C2=A0=C2=A0=C2=A0 return nvme_c2h(n, list, sizeof(list), req);
>>> > > > }
>>> > > > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>>> > > > index 992e5a13f5..ddf395d60e 100644
>>> > > > --- a/hw/nvme/ns.c
>>> > > > +++ b/hw/nvme/ns.c
>>> > > > @@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns,
>>Error
>>> > > > **errp)
>>> > > > =C2=A0=C2=A0=C2=A0 id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
>>> > > > =C2=A0=C2=A0=C2=A0 id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
>>> > > > =C2=A0=C2=A0=C2=A0 id_ns->msrc =3D ns->params.msrc;
>>> > > > +=C2=A0=C2=A0=C2=A0 id_ns->eui64 =3D cpu_to_be64(ns->params.eui64=
);
>>> > > >
>>> > > > =C2=A0=C2=A0=C2=A0 ds =3D 31 - clz32(ns->blkconf.logical_block_si=
ze);
>>> > > > =C2=A0=C2=A0=C2=A0 ms =3D ns->params.ms;
>>> > > > @@ -518,6 +519,7 @@ static Property nvme_ns_props[] =3D {
>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("shared", NvmeNamespace, para=
ms.shared,
>>false),
>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("nsid", NvmeNamespace, para=
ms.nsid, 0),
>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UUID("uuid", NvmeNamespace, params=
=2Euuid),
>>> > > > +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT64("eui64", NvmeNamespace, pa=
rams.eui64,
>>0),
>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT16("ms", NvmeNamespace, params=
=2Ems, 0),
>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("mset", NvmeNamespace, param=
s.mset, 0),
>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("pi", NvmeNamespace, params.=
pi, 0),
>>> > > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>> > > > index 81a35cda14..abe7fab21c 100644
>>> > > > --- a/hw/nvme/nvme.h
>>> > > > +++ b/hw/nvme/nvme.h
>>> > > > @@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
>>> > > > =C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 shared;
>>> > > > =C2=A0=C2=A0=C2=A0 uint32_t nsid;
>>> > > > =C2=A0=C2=A0=C2=A0 QemuUUID uuid;
>>> > > > +=C2=A0=C2=A0=C2=A0 uint64_t eui64;
>>> > > >
>>> > > > =C2=A0=C2=A0=C2=A0 uint16_t ms;
>>> > > > =C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 mset;
>>> > > > --
>>> > > > 2.30.2
>>> > > >
>>> > > >
>>> > >
>>> > > Would it make sense to provide a sensible default for EUI64 such
>>that it
>>> > > is always there? That is, using the same IEEE OUI as we already
>>report
>>> > > in the IEEE field and add an extension identifier by grabbing 5
>>bytes
>>> > > from the UUID?
>>> >
>>> > According to the NVMe 1.4 specification it is allowable to have a
>>NVMe
>>> > device that does not support EUI64. As the EUI64 is used to define
>>boot
>>> > options in UEFI using a non-zero default may break existing
>>installations.
>>> >
>>>
>>> Right. We dont wanna do that.
>>
>>Any change in defaults can (must) be tied to the machine type versions,
>>so that existing installs are unchanged, but new installs using latest
>>machine type get the new default.
>
>The road of least surprise is preferable. All machine should behave the=20
>same if there is no real necessity to deviate.
>

I'd rather not introduce a new user-facing knob for this when a very=20
sensible default can be derived from the uuid and the QEMU IEEE OUI. We=20
already have the uuid parameter that allows users to ensure that the=20
namespace holds a persistent unique identifier. Adding another parameter=20
with the same purpose seems unnecessary. And since we are adding EUI64,=20
we should probably also add NGUID while we are at it.

So, instead of adding parameters for EUI64 and NGUID that the user must=20
specify to get this more real-world behavior, I'd prefer to rely on a=20
couple of boolean compat properties, e.g. 'support-eui64' and=20
'support-nguid' that defaults to 'on', but is set to 'off' for pre-6.1=20
machines.

I think this is a nice compromise between making sure that having=20
sensible EUI64 and NGUID values set is the new default while making sure=20
that we do not break existing setup.

Would this be an acceptable compromise to you Heinrich?

--0eeX2FOkhNh52PFi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDBHR8ACgkQTeGvMW1P
DelNFAf/RbcvxkiHhs2uVD9KVoJNVytMFjjiCQNyS9skY6ICsF9YjZNwr18c2ZZX
yI4U+PwyNmDSkHD0wMri/IuM4qPw5nrjzJtRq2G8HfFpbji7NBs/EhGNqgqSDqgF
uaGjWfrX/TMmhY8ul91p0LQgESDiAMSlt7VB6Vr3f4FEBCFTPLsqaWFKnwIkOgNc
XhqW0m/Yx23/+07rdbMtirIjLnsiZG7YAEgSFkoLfVuJB19Lf05af+Xm4pe0n4xj
HQIuu1enue8HtQoLFigIejM7TTVYSJkrtmBF9Zvx3tVqA6lTlgeFk0kZFJ2S8Cuh
Gb6dZm+hyW3Z0YHtm1ENWY67pxsisw==
=CxDb
-----END PGP SIGNATURE-----

--0eeX2FOkhNh52PFi--


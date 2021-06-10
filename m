Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2E33A2409
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 07:35:33 +0200 (CEST)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDLn-000582-RG
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 01:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lrDI6-0003lT-9T
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:31:42 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:52139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lrDI3-0004pH-8A
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:31:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 8071520B2;
 Thu, 10 Jun 2021 01:31:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Jun 2021 01:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Oc2TCy8UEL71eWhmM4mlzEd7vlY
 yF08NfcmRma6NSVA=; b=baC+havMmUkqMFOuRks8a0Q0ZhiokUS/aVmCOGbXb4m
 pnUWA3Lnv2iC+Yn3LVmcSM0tlmgYf7YW2cPlI8vUjGc9RpleYFd33wgVjcp0+XrZ
 rk17ybJOCh/oa1Zfa/4W9TcMjzjcMSfLldU/qgwcXDW3MaVyLeJgwGam7rRW35+q
 hHDS/+VznbBw71KBvyoqk6TU3q1QnJNWXmUiMZ71H58ik7IC5vKwDGv8N7JIgzsF
 ZaMuEzNEYvLOso8su8zBXQmJYLDaKtjke44j4hzVXW8MTIaELdQy+F6e8cyqZzeU
 Tlf3sR9784QaDQGI4zPT7d6Zt/oCl79XztWNuVQftiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Oc2TCy
 8UEL71eWhmM4mlzEd7vlYyF08NfcmRma6NSVA=; b=HOCJNiK/6n3w4kWB5pWy50
 P5PKXn3ei7OmA0QDW+yZ+zr9AU3PEatgijqpclwc7fIxarfTdzXs3M3v3aUIc+a8
 YL1w9o0JMbK7jdVyYsqEB59OKWYJ6B5wz7ZgowtisQJTzRQkgQkZKcuREasPuj2p
 Caa66+7dgqyFrtQJV7egUPR+7fSAorkQtlCRW43XjWC/VxmPg3WGQBdOEXKnf7ve
 c+c7ybJMjz9s7o/+3VFc/49bfBf/EVnibth3d4Ct/IpCy13NNSBhrc5E5Rh1+zOn
 mhShxgGfxYu1/1PCHL8aA7goC58QFz/unQqFlXTjkqz/6OvRULX7c4DvBnyss0Ww
 ==
X-ME-Sender: <xms:tqPBYGCDWQGoQkzJMOKTXRjVKIg98PIngf-jIZgKkf_h00nyYA8SNg>
 <xme:tqPBYAhMm6O0cBLJiuC6If6o76yqIccgdRavr57Zb64NHVNQPo0npYB2XEqVais6B
 yZ6swboD6aLyVx4zrY>
X-ME-Received: <xmr:tqPBYJnnLi6St0V0QkbDnq-CdbGMShuGa3UUUBlzyHebFxMKik0utBAQ8xDsBgeDoh83B8yhs9V_dJq_3WMP0EOgDXah5wdmiTGmbaXMnlFt_h9Jug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduvddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeffefgvdeliedthefhveffgeeludeifffgudejuefhledutdfhgfejgeekhfek
 tdenucffohhmrghinhepuhhuihgurdgurghtrgenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:t6PBYEx--0Fc1oSckwDRyJOCQwlkF0EWHP7UzGLhT3Pe_Xws34vtkA>
 <xmx:t6PBYLTS4J3K8I9PgdxIH_aS_Ou9NaW9TpVVeZ_xHxAxvcDAhwg9TA>
 <xmx:t6PBYPYK3gyfRk3Wi2JvB2OBP5P5TRZoffLdZm8zMDAujNm2Gy4dJQ>
 <xmx:uKPBYKGArj1FWGAODD4E7-A8mI9zixboOu26-vllM2OCrALo0gwW-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 01:31:33 -0400 (EDT)
Date: Thu, 10 Jun 2021 07:31:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
Message-ID: <YMGjtICqb9aXckg2@apples.localdomain>
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
 <YMCwjV7Vpbk5au/U@apples.localdomain>
 <f5f15ac1-0876-331e-7433-a6ca551b9e10@gmx.de>
 <YMC1BJ5zOGQWmg7Q@apples.localdomain> <YMDSmEgfMeZa8cWd@redhat.com>
 <969B60CA-0E05-4510-9B5B-74B19133A874@gmx.de>
 <YMEdJi16P3c4tQm0@apples.localdomain>
 <F17FDDE8-ACAC-44A9-8E8A-4B424FD429DB@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hebyr31upUeo1gKL"
Content-Disposition: inline
In-Reply-To: <F17FDDE8-ACAC-44A9-8E8A-4B424FD429DB@gmx.de>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--Hebyr31upUeo1gKL
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  9 22:15, Heinrich Schuchardt wrote:
>Am 9. Juni 2021 21:57:26 MESZ schrieb Klaus Jensen <its@irrelevant.dk>:
>>On Jun  9 20:13, Heinrich Schuchardt wrote:
>>>Am 9. Juni 2021 16:39:20 MESZ schrieb "Daniel P. Berrang=C3=A9"
>><berrange@redhat.com>:
>>>>On Wed, Jun 09, 2021 at 02:33:08PM +0200, Klaus Jensen wrote:
>>>>> On Jun  9 14:21, Heinrich Schuchardt wrote:
>>>>> > On 6/9/21 2:14 PM, Klaus Jensen wrote:
>>>>> > > On Jun=C2=A0 9 13:46, Heinrich Schuchardt wrote:
>>>>> > > > The EUI64 field is the only identifier for NVMe namespaces in
>>>>UEFI device
>>>>> > > > paths. Add a new namespace property "eui64", that provides
>>the
>>>>user the
>>>>> > > > option to specify the EUI64.
>>>>> > > >
>>>>> > > > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>>>> > > > ---
>>>>> > > > docs/system/nvme.rst |=C2=A0 4 +++
>>>>> > > > hw/nvme/ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58
>>>>++++++++++++++++++++++++++------------------
>>>>> > > > hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 ++
>>>>> > > > hw/nvme/nvme.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>>> > > > 4 files changed, 42 insertions(+), 23 deletions(-)
>>>>> > > >
>>>>> > > > diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
>>>>> > > > index f7f63d6bf6..a6042f942a 100644
>>>>> > > > --- a/docs/system/nvme.rst
>>>>> > > > +++ b/docs/system/nvme.rst
>>>>> > > > @@ -81,6 +81,10 @@ There are a number of parameters
>>available:
>>>>> > > > =C2=A0 Set the UUID of the namespace. This will be reported as a
>>>>"Namespace
>>>>> > > > UUID"
>>>>> > > > =C2=A0 descriptor in the Namespace Identification Descriptor Li=
st.
>>>>> > > >
>>>>> > > > +``eui64``
>>>>> > > > +=C2=A0 Set the EUI64 of the namespace. This will be reported a=
s a
>>>>"IEEE
>>>>> > > > Extended
>>>>> > > > +=C2=A0 Unique Identifier" descriptor in the Namespace
>>>>Identification
>>>>> > > > Descriptor List.
>>>>> > > > +
>>>>> > > > ``bus``
>>>>> > > > =C2=A0 If there are more ``nvme`` devices defined, this paramet=
er
>>>>may be
>>>>> > > > used to
>>>>> > > > =C2=A0 attach the namespace to a specific ``nvme`` device
>>>>(identified by an
>>>>> > > > ``id``
>>>>> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>>>> > > > index 0bcaf7192f..21f2d6843b 100644
>>>>> > > > --- a/hw/nvme/ctrl.c
>>>>> > > > +++ b/hw/nvme/ctrl.c
>>>>> > > > @@ -4426,19 +4426,19 @@ static uint16_t
>>>>> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>>>>> > > > =C2=A0=C2=A0=C2=A0 NvmeIdentify *c =3D (NvmeIdentify *)&req->cm=
d;
>>>>> > > > =C2=A0=C2=A0=C2=A0 uint32_t nsid =3D le32_to_cpu(c->nsid);
>>>>> > > > =C2=A0=C2=A0=C2=A0 uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
>>>>> > > > -
>>>>> > > > -=C2=A0=C2=A0=C2=A0 struct data {
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 NvmeIdNsDescr hdr;
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 uint8_t v[NVME_NIDL_UUID];
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } uuid;
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 NvmeIdNsDescr hdr;
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 uint8_t v;
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } csi;
>>>>> > > > -=C2=A0=C2=A0=C2=A0 };
>>>>> > > > -
>>>>> > > > -=C2=A0=C2=A0=C2=A0 struct data *ns_descrs =3D (struct data *)l=
ist;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 uint8_t *pos =3D list;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v[NVME_NIDL=
_UUID];
>>>>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED uuid;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t v;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED eui64;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 struct {
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED csi;
>>>>> > > >
>>>>> > > > =C2=A0=C2=A0=C2=A0 trace_pci_nvme_identify_ns_descr_list(nsid);
>>>>> > > >
>>>>> > > > @@ -4452,17 +4452,29 @@ static uint16_t
>>>>> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>>>>> > > > =C2=A0=C2=A0=C2=A0 }
>>>>> > > >
>>>>> > > > =C2=A0=C2=A0=C2=A0 /*
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Because the NGUID and EUI64 fields =
are 0 in the
>>>>Identify
>>>>> > > > Namespace data
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * structure, a Namespace UUID (nidt =
=3D 3h) must be
>>>>reported in the
>>>>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Namespace Identification Descriptor=
=2E Add the
>>namespace
>>>>UUID here.
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the EUI64 field is 0 and the NGU=
ID field is 0, the
>>>>> > > > namespace must
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * provide a valid Namespace UUID in t=
he Namespace
>>>>Identification
>>>>> > > > Descriptor
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * data structure. QEMU does not yet s=
upport setting
>>>>NGUID.
>>>>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid.hdr.nidt =3D NVME_NIDT_UUID;
>>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid.hdr.nidl =3D NVME_NIDL_UUID;
>>>>> > > > -=C2=A0=C2=A0=C2=A0 memcpy(&ns_descrs->uuid.v, ns->params.uuid.=
data,
>>>>NVME_NIDL_UUID);
>>>>> > > > -
>>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi.hdr.nidt =3D NVME_NIDT_CSI;
>>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi.hdr.nidl =3D NVME_NIDL_CSI;
>>>>> > > > -=C2=A0=C2=A0=C2=A0 ns_descrs->csi.v =3D ns->csi;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 uuid.hdr.nidt =3D NVME_NIDT_UUID;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 uuid.hdr.nidl =3D NVME_NIDL_UUID;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(uuid.v, ns->params.uuid.data, NVME_N=
IDL_UUID);
>>>>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(pos, &uuid, sizeof(uuid));
>>>>> > > > +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(uuid);
>>>>> > > > +
>>>>> > > > +=C2=A0=C2=A0=C2=A0 if (ns->params.eui64) {
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.hdr.nidt =3D =
NVME_NIDT_EUI64;
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.hdr.nidl =3D =
NVME_NIDL_EUI64;
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.v =3D cpu_to_=
be64(ns->params.eui64);
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(pos, &eui64,=
 sizeof(eui64));
>>>>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(eui=
64);
>>>>> > > > +=C2=A0=C2=A0=C2=A0 }
>>>>> > > > +
>>>>> > > > +=C2=A0=C2=A0=C2=A0 csi.hdr.nidt =3D NVME_NIDT_CSI;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 csi.hdr.nidl =3D NVME_NIDL_CSI;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 csi.v =3D ns->csi;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 memcpy(pos, &csi, sizeof(csi));
>>>>> > > > +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(csi);
>>>>> > > >
>>>>> > > > =C2=A0=C2=A0=C2=A0 return nvme_c2h(n, list, sizeof(list), req);
>>>>> > > > }
>>>>> > > > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>>>>> > > > index 992e5a13f5..ddf395d60e 100644
>>>>> > > > --- a/hw/nvme/ns.c
>>>>> > > > +++ b/hw/nvme/ns.c
>>>>> > > > @@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns,
>>>>Error
>>>>> > > > **errp)
>>>>> > > > =C2=A0=C2=A0=C2=A0 id_ns->mssrl =3D cpu_to_le16(ns->params.mssr=
l);
>>>>> > > > =C2=A0=C2=A0=C2=A0 id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
>>>>> > > > =C2=A0=C2=A0=C2=A0 id_ns->msrc =3D ns->params.msrc;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 id_ns->eui64 =3D cpu_to_be64(ns->params.eui=
64);
>>>>> > > >
>>>>> > > > =C2=A0=C2=A0=C2=A0 ds =3D 31 - clz32(ns->blkconf.logical_block_=
size);
>>>>> > > > =C2=A0=C2=A0=C2=A0 ms =3D ns->params.ms;
>>>>> > > > @@ -518,6 +519,7 @@ static Property nvme_ns_props[] =3D {
>>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("shared", NvmeNamespace, pa=
rams.shared,
>>>>false),
>>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("nsid", NvmeNamespace, pa=
rams.nsid,
>>0),
>>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UUID("uuid", NvmeNamespace, para=
ms.uuid),
>>>>> > > > +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT64("eui64", NvmeNamespace, =
params.eui64,
>>>>0),
>>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT16("ms", NvmeNamespace, para=
ms.ms, 0),
>>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("mset", NvmeNamespace, par=
ams.mset, 0),
>>>>> > > > =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("pi", NvmeNamespace, param=
s.pi, 0),
>>>>> > > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>>>> > > > index 81a35cda14..abe7fab21c 100644
>>>>> > > > --- a/hw/nvme/nvme.h
>>>>> > > > +++ b/hw/nvme/nvme.h
>>>>> > > > @@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
>>>>> > > > =C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 shared;
>>>>> > > > =C2=A0=C2=A0=C2=A0 uint32_t nsid;
>>>>> > > > =C2=A0=C2=A0=C2=A0 QemuUUID uuid;
>>>>> > > > +=C2=A0=C2=A0=C2=A0 uint64_t eui64;
>>>>> > > >
>>>>> > > > =C2=A0=C2=A0=C2=A0 uint16_t ms;
>>>>> > > > =C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 mset;
>>>>> > > > --
>>>>> > > > 2.30.2
>>>>> > > >
>>>>> > > >
>>>>> > >
>>>>> > > Would it make sense to provide a sensible default for EUI64
>>such
>>>>that it
>>>>> > > is always there? That is, using the same IEEE OUI as we already
>>>>report
>>>>> > > in the IEEE field and add an extension identifier by grabbing 5
>>>>bytes
>>>>> > > from the UUID?
>>>>> >
>>>>> > According to the NVMe 1.4 specification it is allowable to have a
>>>>NVMe
>>>>> > device that does not support EUI64. As the EUI64 is used to
>>define
>>>>boot
>>>>> > options in UEFI using a non-zero default may break existing
>>>>installations.
>>>>> >
>>>>>
>>>>> Right. We dont wanna do that.
>>>>
>>>>Any change in defaults can (must) be tied to the machine type
>>versions,
>>>>so that existing installs are unchanged, but new installs using
>>latest
>>>>machine type get the new default.
>>>
>>>The road of least surprise is preferable. All machine should behave
>>the
>>>same if there is no real necessity to deviate.
>>>
>>
>>I'd rather not introduce a new user-facing knob for this when a very
>>sensible default can be derived from the uuid and the QEMU IEEE OUI. We
>>
>>already have the uuid parameter that allows users to ensure that the
>>namespace holds a persistent unique identifier. Adding another
>>parameter
>>with the same purpose seems unnecessary. And since we are adding EUI64,
>>
>>we should probably also add NGUID while we are at it.
>>
>>So, instead of adding parameters for EUI64 and NGUID that the user must
>>
>>specify to get this more real-world behavior, I'd prefer to rely on a
>>couple of boolean compat properties, e.g. 'support-eui64' and
>>'support-nguid' that defaults to 'on', but is set to 'off' for pre-6.1
>>machines.
>>
>>I think this is a nice compromise between making sure that having
>>sensible EUI64 and NGUID values set is the new default while making
>>sure
>>that we do not break existing setup.
>>
>>Would this be an acceptable compromise to you Heinrich?
>
>EUI64 defined on some machine and not on others is totally obscure for=20
>users.

I don't think that is obscure. This is exactly why machine types are=20
versioned. It is documented as a feature to ensure working live=20
migration between versions, but it is definitely also useful for just=20
making sure that no behavior changes between qemu upgrades.

We have used this feature in the past to change the PCI Vendor/Device ID=20
of the device.

>
>The virt machine is typically used and is pre-6.1. As pointed out above=20
>you should not change the EUI64 when QEMU is upgraded and invoked with=20
>the same parameter set.
>

 From an NVMe perspective we are not changing it. We are going from "not=20
supported" to "supported". But I acknowledge that there are systems that=20
rely on EUI64 being zero - I just don't see why that should refrain us=20
=66rom adding EUI64 and NGUID by default in future versions when we can=20
ensure compatibility with the versioned machine type (i.e. virt-6.0).

>EUI64 is what UEFI and Windows rely on. Why should a user specify a=20
>UUID if he needs a EUI64?
>
>There is no collisionfree mapping of 16 byte UUIDs to 8 byte EUI64s. So=20
>if a user specifies different UUIDs he may still get conflicting=20
>EUI64s.
>
>How should a user find out which UUID he has to specify to get the=20
>EUI64 he wants to set?
>

These are all good points.

Considering that, I understand the need for an eui64 parameter (and=20
maybe one for nguid as well) to explicitly control the field values.

But in the absence of these parameters, it would be nice to provide a=20
sensible default in future versions, e.g.:

   -device nvme-ns,uuid=3D00000000-0000-0000-0000-deadbeefd0de
     ieee oui : 0x525400
     uuid     : 0x00000000000000000000deadbeefd0de
     eui64    : 0x525400adbeefd0de
     nguid    : 0x0000deadbeefd0de525400adbeefd0de

If the user explicitly requires the pre-6.1 behavior of a zero EUI64 or=20
NGUID, the behavior may be explicitly reverted using compat properties,=20
(e.g. 'support-eui64=3Dno' and 'support-nguid=3Dno') or implicitly by using=
=20
a 6.0 machine type.

Anyway, I'm not sure we are getting any closer to agreeing on that, so=20
for now I have no problems with accepting your patch as-is. I can follow=20
up with a patch for my suggestion and we can take it from there.

Acked-by: Klaus Jensen <k.jensen@samsung.com>

--Hebyr31upUeo1gKL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDBo7AACgkQTeGvMW1P
DemW9gf9E0tgmnmF6XaOhlJlD+9ZOTBE1BOBpANxIx6uCxiTef9Y1OQK8gua6JYd
RgbIZf6xsXfZRJ+b3kafV9yZpB9yBYMTwSngFuozEPZ9IpGLuWlaxyDBg8zc6UIJ
hKSdIO7iKxnLS4VTqNWXWNWEnrTDHC0aKrnpHGxW9tAIpO8YFbUNS/LTA2ANYXHG
+xzYaemienSo375Edis0nMI5TaLTYlYUw7pgGlysN6wizbR3mPCIvJV7z7hWLqfC
w2+COit0rUSUMmYxd0HmxBffQYMwXaCI79z71Eg0bcM6/BMTE/4+j7pXd994wBfs
IbOxLIEuJXM+3SRRWkMOM8FQwBAdmQ==
=i5Ov
-----END PGP SIGNATURE-----

--Hebyr31upUeo1gKL--


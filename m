Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2F23A14D7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:48:20 +0200 (CEST)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxd4-0002W3-Qf
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lqxW9-0006TD-FO
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:41:09 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lqxW4-0007RZ-Fi
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:41:09 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AB1775C025F;
 Wed,  9 Jun 2021 08:33:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 09 Jun 2021 08:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ibYaOrR7LdLQO8gEDFcW3nSrVor
 Zk3MJ6+7S+SMsEKo=; b=Ai3sRR3Q9m0up0NN2/Z7qNyIQVHHaaN0fS7hOZFStd8
 U7w/vGsUeAT1sKn4cGL7Y7ND9xcp1yMv1eO9TH09zArzU+Nq+rfsNL6/Me++R1EF
 CGEUmvtWvdn9Yknv7FOptnCQ46JwOwy7xz64qigUuCAoKhGAs5AsPwkX9JytWepN
 we2M9dYf87QYmrG46v2VF9tll64/C6AQYn4/6hSQsD7e+UR14hnjpi3R7ZHl8NeL
 m1zIbcdbkRbuFa0l604rqmkSAu+F969kD8El4DTlL0yuRiFAD94A2Jqesqnx0egb
 eq0RMTzjEHPgAOpeNwBNK+iNv+vPVQZuFihB1ThNKyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ibYaOr
 R7LdLQO8gEDFcW3nSrVorZk3MJ6+7S+SMsEKo=; b=gsvsOrTYjGToR2n8cSEBJ4
 qnXYdGvdKinbxylToJScH4tqlLYTkRvAMI1pXDX2uGM9S3VmpnB3Vx8UHbi52sXG
 oCZIPfxRWWZlYV/zhCPbruTqWOf030tfFOr+S/+g8ZJ8iuC1rrMNbUkhP+t4xCSY
 MOodYgd6D2/ky8dMfBG8BPJw/cSAa9UZ8pD22//CAO2IxKiwdGBjhWxXI8Z08Yl3
 y4cazrXWrEX7rMYua4OssCLkF9pRCL3ARdxwqmt4I8J4X+t17CIf3APN3OnMKW4d
 iwDVN6wvWu9kAUTc//1mD7ybWS6jQ+jTg1b6VCBcxScUZvgGmVXW2E74zsRko6BQ
 ==
X-ME-Sender: <xms:B7XAYIDVB6UaiXNG_bJUgVN8GdaK2WgTkpERup6pu4YIgGv4hsLARg>
 <xme:B7XAYKgDHWhMMyLdThAHHIdIZ8lBFDJnACsrawX2zIZMPIjXimp4EtKniLaQJIRuy
 mHaSBRvxbU_RMmJpKs>
X-ME-Received: <xmr:B7XAYLnW42uRArVQ9ZA5p5JtVh4aVyDqUj3kZbP67_AI3I9gUZfm8rFpjfyhUJ7i-Q2knacVMqmsAuSHcf65_HGx0EgvtgY5cR9Amst5RhwlOXqSXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeffefgvdeliedthefhveffgeeludeifffgudejuefhledutdfhgfejgeekhfek
 tdenucffohhmrghinhepuhhuihgurdgurghtrgenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:B7XAYOwOXEiep8aMdFJzcZi4ciaCjylfEzN6y0d4ns5rCo52FfC9Aw>
 <xmx:B7XAYNQmbiqlIzgaT4WgUj1zsTdFpLNMsRhGcE77e7bNS2jEhcWgUw>
 <xmx:B7XAYJacHyxZGZEJQVPzntrYByAZZZ_KI-LotNSZn1lQtN6ReMvlCw>
 <xmx:CLXAYGIM9oJHBRHhH_Cqg1icdmaZkhjaedDQva2fiQMCkiiRLHyPHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 08:33:10 -0400 (EDT)
Date: Wed, 9 Jun 2021 14:33:08 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
Message-ID: <YMC1BJ5zOGQWmg7Q@apples.localdomain>
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
 <YMCwjV7Vpbk5au/U@apples.localdomain>
 <f5f15ac1-0876-331e-7433-a6ca551b9e10@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="all0igMCnI+iXAFe"
Content-Disposition: inline
In-Reply-To: <f5f15ac1-0876-331e-7433-a6ca551b9e10@gmx.de>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--all0igMCnI+iXAFe
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  9 14:21, Heinrich Schuchardt wrote:
>On 6/9/21 2:14 PM, Klaus Jensen wrote:
>>On Jun=C2=A0 9 13:46, Heinrich Schuchardt wrote:
>>>The EUI64 field is the only identifier for NVMe namespaces in UEFI device
>>>paths. Add a new namespace property "eui64", that provides the user the
>>>option to specify the EUI64.
>>>
>>>Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>>---
>>>docs/system/nvme.rst |=C2=A0 4 +++
>>>hw/nvme/ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58 ++++++++++++++++=
++++++++++------------------
>>>hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>>hw/nvme/nvme.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>4 files changed, 42 insertions(+), 23 deletions(-)
>>>
>>>diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
>>>index f7f63d6bf6..a6042f942a 100644
>>>--- a/docs/system/nvme.rst
>>>+++ b/docs/system/nvme.rst
>>>@@ -81,6 +81,10 @@ There are a number of parameters available:
>>>=C2=A0 Set the UUID of the namespace. This will be reported as a "Namesp=
ace
>>>UUID"
>>>=C2=A0 descriptor in the Namespace Identification Descriptor List.
>>>
>>>+``eui64``
>>>+=C2=A0 Set the EUI64 of the namespace. This will be reported as a "IEEE
>>>Extended
>>>+=C2=A0 Unique Identifier" descriptor in the Namespace Identification
>>>Descriptor List.
>>>+
>>>``bus``
>>>=C2=A0 If there are more ``nvme`` devices defined, this parameter may be
>>>used to
>>>=C2=A0 attach the namespace to a specific ``nvme`` device (identified by=
 an
>>>``id``
>>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>>index 0bcaf7192f..21f2d6843b 100644
>>>--- a/hw/nvme/ctrl.c
>>>+++ b/hw/nvme/ctrl.c
>>>@@ -4426,19 +4426,19 @@ static uint16_t
>>>nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>>>=C2=A0=C2=A0=C2=A0 NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>>>=C2=A0=C2=A0=C2=A0 uint32_t nsid =3D le32_to_cpu(c->nsid);
>>>=C2=A0=C2=A0=C2=A0 uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
>>>-
>>>-=C2=A0=C2=A0=C2=A0 struct data {
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Nvme=
IdNsDescr hdr;
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint=
8_t v[NVME_NIDL_UUID];
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } uuid;
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Nvme=
IdNsDescr hdr;
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint=
8_t v;
>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } csi;
>>>-=C2=A0=C2=A0=C2=A0 };
>>>-
>>>-=C2=A0=C2=A0=C2=A0 struct data *ns_descrs =3D (struct data *)list;
>>>+=C2=A0=C2=A0=C2=A0 uint8_t *pos =3D list;
>>>+=C2=A0=C2=A0=C2=A0 struct {
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v[NVME_NIDL_UUID];
>>>+=C2=A0=C2=A0=C2=A0 } QEMU_PACKED uuid;
>>>+=C2=A0=C2=A0=C2=A0 struct {
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t v;
>>>+=C2=A0=C2=A0=C2=A0 } QEMU_PACKED eui64;
>>>+=C2=A0=C2=A0=C2=A0 struct {
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v;
>>>+=C2=A0=C2=A0=C2=A0 } QEMU_PACKED csi;
>>>
>>>=C2=A0=C2=A0=C2=A0 trace_pci_nvme_identify_ns_descr_list(nsid);
>>>
>>>@@ -4452,17 +4452,29 @@ static uint16_t
>>>nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>>>=C2=A0=C2=A0=C2=A0 }
>>>
>>>=C2=A0=C2=A0=C2=A0 /*
>>>-=C2=A0=C2=A0=C2=A0=C2=A0 * Because the NGUID and EUI64 fields are 0 in =
the Identify
>>>Namespace data
>>>-=C2=A0=C2=A0=C2=A0=C2=A0 * structure, a Namespace UUID (nidt =3D 3h) mu=
st be reported in the
>>>-=C2=A0=C2=A0=C2=A0=C2=A0 * Namespace Identification Descriptor. Add the=
 namespace UUID here.
>>>+=C2=A0=C2=A0=C2=A0=C2=A0 * If the EUI64 field is 0 and the NGUID field =
is 0, the
>>>namespace must
>>>+=C2=A0=C2=A0=C2=A0=C2=A0 * provide a valid Namespace UUID in the Namesp=
ace Identification
>>>Descriptor
>>>+=C2=A0=C2=A0=C2=A0=C2=A0 * data structure. QEMU does not yet support se=
tting NGUID.
>>>=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>-=C2=A0=C2=A0=C2=A0 ns_descrs->uuid.hdr.nidt =3D NVME_NIDT_UUID;
>>>-=C2=A0=C2=A0=C2=A0 ns_descrs->uuid.hdr.nidl =3D NVME_NIDL_UUID;
>>>-=C2=A0=C2=A0=C2=A0 memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVM=
E_NIDL_UUID);
>>>-
>>>-=C2=A0=C2=A0=C2=A0 ns_descrs->csi.hdr.nidt =3D NVME_NIDT_CSI;
>>>-=C2=A0=C2=A0=C2=A0 ns_descrs->csi.hdr.nidl =3D NVME_NIDL_CSI;
>>>-=C2=A0=C2=A0=C2=A0 ns_descrs->csi.v =3D ns->csi;
>>>+=C2=A0=C2=A0=C2=A0 uuid.hdr.nidt =3D NVME_NIDT_UUID;
>>>+=C2=A0=C2=A0=C2=A0 uuid.hdr.nidl =3D NVME_NIDL_UUID;
>>>+=C2=A0=C2=A0=C2=A0 memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
>>>+=C2=A0=C2=A0=C2=A0 memcpy(pos, &uuid, sizeof(uuid));
>>>+=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(uuid);
>>>+
>>>+=C2=A0=C2=A0=C2=A0 if (ns->params.eui64) {
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.hdr.nidt =3D NVME_NIDT=
_EUI64;
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.hdr.nidl =3D NVME_NIDL=
_EUI64;
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.v =3D cpu_to_be64(ns->=
params.eui64);
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(pos, &eui64, sizeof(e=
ui64));
>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(eui64);
>>>+=C2=A0=C2=A0=C2=A0 }
>>>+
>>>+=C2=A0=C2=A0=C2=A0 csi.hdr.nidt =3D NVME_NIDT_CSI;
>>>+=C2=A0=C2=A0=C2=A0 csi.hdr.nidl =3D NVME_NIDL_CSI;
>>>+=C2=A0=C2=A0=C2=A0 csi.v =3D ns->csi;
>>>+=C2=A0=C2=A0=C2=A0 memcpy(pos, &csi, sizeof(csi));
>>>+=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(csi);
>>>
>>>=C2=A0=C2=A0=C2=A0 return nvme_c2h(n, list, sizeof(list), req);
>>>}
>>>diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>>>index 992e5a13f5..ddf395d60e 100644
>>>--- a/hw/nvme/ns.c
>>>+++ b/hw/nvme/ns.c
>>>@@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error
>>>**errp)
>>>=C2=A0=C2=A0=C2=A0 id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
>>>=C2=A0=C2=A0=C2=A0 id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
>>>=C2=A0=C2=A0=C2=A0 id_ns->msrc =3D ns->params.msrc;
>>>+=C2=A0=C2=A0=C2=A0 id_ns->eui64 =3D cpu_to_be64(ns->params.eui64);
>>>
>>>=C2=A0=C2=A0=C2=A0 ds =3D 31 - clz32(ns->blkconf.logical_block_size);
>>>=C2=A0=C2=A0=C2=A0 ms =3D ns->params.ms;
>>>@@ -518,6 +519,7 @@ static Property nvme_ns_props[] =3D {
>>>=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shar=
ed, false),
>>>=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid=
, 0),
>>>=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
>>>+=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eu=
i64, 0),
>>>=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
>>>=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset,=
 0),
>>>=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
>>>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>>index 81a35cda14..abe7fab21c 100644
>>>--- a/hw/nvme/nvme.h
>>>+++ b/hw/nvme/nvme.h
>>>@@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
>>>=C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 shared;
>>>=C2=A0=C2=A0=C2=A0 uint32_t nsid;
>>>=C2=A0=C2=A0=C2=A0 QemuUUID uuid;
>>>+=C2=A0=C2=A0=C2=A0 uint64_t eui64;
>>>
>>>=C2=A0=C2=A0=C2=A0 uint16_t ms;
>>>=C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 mset;
>>>--
>>>2.30.2
>>>
>>>
>>
>>Would it make sense to provide a sensible default for EUI64 such that it
>>is always there? That is, using the same IEEE OUI as we already report
>>in the IEEE field and add an extension identifier by grabbing 5 bytes
>>from the UUID?
>
>According to the NVMe 1.4 specification it is allowable to have a NVMe
>device that does not support EUI64. As the EUI64 is used to define boot
>options in UEFI using a non-zero default may break existing installations.
>

Right. We dont wanna do that.

My knowledge of UEFI is very limited, but, since a value of '0' for=20
EUI64 means "not supported", isn't it wrong for UEFI implementations to=20
have used it as a valid identifier? Prior to this patch, if there were=20
two namespaces they would both have an EUI64 of '0'.

--all0igMCnI+iXAFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDAtQMACgkQTeGvMW1P
Demo8Af+OK54iqXvehIx3x0r8+CqodLtyY55/X7JM6I8RYiCdb3AW5mItYeBcF0I
aIZxIMpB8Q7FLYaMYpQAGgwD3McappIoNnxTP3ZSIAd9ObeJPHV9x4gyZMOzUlaP
PBHHw0ZJlFy8Wn7pi0ARCl8tS9vIdA9RlkGMXh1e4pIV6xYMY9sp5zOVnc/xQQ6G
VX3CQwONlY4VboxEFn39Ll9z+MV3U5G8AQJFU4E7l5NO/JTMx2W+w3h4iixSa/GC
GoXemiH1lxmy4VwtLfH5LChX4oR2qOuYbWHxSdVy9K3gkmttc6mrXLIKxiZ8UAJn
0rknwV7neKmuAOB75bZ7tjol0EbMBA==
=tNK6
-----END PGP SIGNATURE-----

--all0igMCnI+iXAFe--


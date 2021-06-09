Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021823A1423
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:19:58 +0200 (CEST)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxBc-0007ct-Si
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lqx68-0001lD-Vy
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:14:17 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:52249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lqx65-0006TK-P7
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:14:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 918D15C0207;
 Wed,  9 Jun 2021 08:14:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 09 Jun 2021 08:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=F4QB2RQAyaZ0kXchZ8ukdzn9Ugy
 VKBlJhj0rRYAc5DI=; b=C5XaYBut02f1jZ82w0nenfBO1ZtJPFXSaIxQOC2UQew
 rKEBAIT8PA/17nk3bYE1vPMjFUIgLxrxaqDLHSj3xEbR+f6enbAaXmORxptrAPm7
 3BClTmFxd8QKwR9r7osVlb6oVsg+DjPu46Sn7m6dRja+YZGwfc78KklEaEwjL/tA
 3JlD34cdWKQKqAW7lHSFhGnxaVEAM0b3/lRt7cVpfDF89Lzx725UWJsN7NqRfHC1
 /IGTf8glI80E8yMwrH8YobVIXFD2/TUtVCu+r41j6nu+Qkza3aha8R35wZMiQqJR
 CaMNdOKarSQkD5EtUNxRzg7wOcYE8/BVQcL27ElfmEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=F4QB2R
 QAyaZ0kXchZ8ukdzn9UgyVKBlJhj0rRYAc5DI=; b=h4dkj0c/JhlFl8SGC55emr
 RIMXG2kmNLZNXyA60QgQ8F1DSSssyUQe/loWR0P6TVau+7ZQ5BHI6z2+B8JA+Sm9
 6jNwQ3ZF6hMI3dz6ped3TrzP/Q1GYRLepbsjdj4gHLgU8rV/2GvwCLuGEU8p/7vo
 dn6hL3Mlb5MGElTP11VVKfSS80bWkb+3ZrYR9BDrG+FIBbz0UyomLR+g5vvdWi+v
 Ll9nDZUQ0EHiWQ28DvN9yAmNwz5CqwoEykK8EMnX6OavvO9apkMaHt2BSns1UEmD
 Lc8Lj920Vo9A1IJpj48uaGX+76jVgbTJ4tW9pc8iZ5eM6EY5GTqSgEkKVfJ4VUAg
 ==
X-ME-Sender: <xms:kbDAYBTO2hmGdfbctTyaqODWJRl9kPaM9hwX9YqlyCicPJ3jLeveBA>
 <xme:kbDAYKzStTF6DqUzDaEDi3aqE6n3LdJekpq0LwyomIi4l00cBj3Gik1ILgskA-zyz
 ifsuK4rRmHSCIumwY8>
X-ME-Received: <xmr:kbDAYG2ToduGwxijR6q4YNit1zqWYT5u2Nc90HA9wMtbcUF_8qSJIdbBmR0ry27bYPpZva0qmL428gnMdI0JUVJXThPHZRwdjG5LDr9PMulCFBtPVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeffefgvdeliedthefhveffgeeludeifffgudejuefhledutdfhgfejgeekhfek
 tdenucffohhmrghinhepuhhuihgurdgurghtrgenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:kbDAYJAfn2HC0sQSeBYiy8ks-hmhTDUBmeBi8KEurkRZ-oyAWWC6tA>
 <xmx:kbDAYKiUH7xdgg2LJy1UplVWaOTfV5IfTeVJ5nzZ33UhDgZY922f0w>
 <xmx:kbDAYNrXx7RNn27SAghZ_beyTcsdew2ZxuAHxijVy600fFIHnCRgSw>
 <xmx:krDAYMZ7MVoUCqa57fR1Y_L0RYcJ7gnKwZtv5h75XUJSdbrXbBTwvQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 08:14:08 -0400 (EDT)
Date: Wed, 9 Jun 2021 14:14:05 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
Message-ID: <YMCwjV7Vpbk5au/U@apples.localdomain>
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OK0RBa6M2IC4Ayzz"
Content-Disposition: inline
In-Reply-To: <20210609114657.33301-1-xypron.glpk@gmx.de>
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


--OK0RBa6M2IC4Ayzz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  9 13:46, Heinrich Schuchardt wrote:
>The EUI64 field is the only identifier for NVMe namespaces in UEFI device
>paths. Add a new namespace property "eui64", that provides the user the
>option to specify the EUI64.
>
>Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>---
> docs/system/nvme.rst |  4 +++
> hw/nvme/ctrl.c       | 58 ++++++++++++++++++++++++++------------------
> hw/nvme/ns.c         |  2 ++
> hw/nvme/nvme.h       |  1 +
> 4 files changed, 42 insertions(+), 23 deletions(-)
>
>diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
>index f7f63d6bf6..a6042f942a 100644
>--- a/docs/system/nvme.rst
>+++ b/docs/system/nvme.rst
>@@ -81,6 +81,10 @@ There are a number of parameters available:
>   Set the UUID of the namespace. This will be reported as a "Namespace UU=
ID"
>   descriptor in the Namespace Identification Descriptor List.
>
>+``eui64``
>+  Set the EUI64 of the namespace. This will be reported as a "IEEE Extend=
ed
>+  Unique Identifier" descriptor in the Namespace Identification Descripto=
r List.
>+
> ``bus``
>   If there are more ``nvme`` devices defined, this parameter may be used =
to
>   attach the namespace to a specific ``nvme`` device (identified by an ``=
id``
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 0bcaf7192f..21f2d6843b 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -4426,19 +4426,19 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCt=
rl *n, NvmeRequest *req)
>     NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>     uint32_t nsid =3D le32_to_cpu(c->nsid);
>     uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
>-
>-    struct data {
>-        struct {
>-            NvmeIdNsDescr hdr;
>-            uint8_t v[NVME_NIDL_UUID];
>-        } uuid;
>-        struct {
>-            NvmeIdNsDescr hdr;
>-            uint8_t v;
>-        } csi;
>-    };
>-
>-    struct data *ns_descrs =3D (struct data *)list;
>+    uint8_t *pos =3D list;
>+    struct {
>+        NvmeIdNsDescr hdr;
>+        uint8_t v[NVME_NIDL_UUID];
>+    } QEMU_PACKED uuid;
>+    struct {
>+        NvmeIdNsDescr hdr;
>+        uint64_t v;
>+    } QEMU_PACKED eui64;
>+    struct {
>+        NvmeIdNsDescr hdr;
>+        uint8_t v;
>+    } QEMU_PACKED csi;
>
>     trace_pci_nvme_identify_ns_descr_list(nsid);
>
>@@ -4452,17 +4452,29 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCt=
rl *n, NvmeRequest *req)
>     }
>
>     /*
>-     * Because the NGUID and EUI64 fields are 0 in the Identify Namespace=
 data
>-     * structure, a Namespace UUID (nidt =3D 3h) must be reported in the
>-     * Namespace Identification Descriptor. Add the namespace UUID here.
>+     * If the EUI64 field is 0 and the NGUID field is 0, the namespace mu=
st
>+     * provide a valid Namespace UUID in the Namespace Identification Des=
criptor
>+     * data structure. QEMU does not yet support setting NGUID.
>      */
>-    ns_descrs->uuid.hdr.nidt =3D NVME_NIDT_UUID;
>-    ns_descrs->uuid.hdr.nidl =3D NVME_NIDL_UUID;
>-    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
>-
>-    ns_descrs->csi.hdr.nidt =3D NVME_NIDT_CSI;
>-    ns_descrs->csi.hdr.nidl =3D NVME_NIDL_CSI;
>-    ns_descrs->csi.v =3D ns->csi;
>+    uuid.hdr.nidt =3D NVME_NIDT_UUID;
>+    uuid.hdr.nidl =3D NVME_NIDL_UUID;
>+    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
>+    memcpy(pos, &uuid, sizeof(uuid));
>+    pos +=3D sizeof(uuid);
>+
>+    if (ns->params.eui64) {
>+        eui64.hdr.nidt =3D NVME_NIDT_EUI64;
>+        eui64.hdr.nidl =3D NVME_NIDL_EUI64;
>+        eui64.v =3D cpu_to_be64(ns->params.eui64);
>+        memcpy(pos, &eui64, sizeof(eui64));
>+        pos +=3D sizeof(eui64);
>+    }
>+
>+    csi.hdr.nidt =3D NVME_NIDT_CSI;
>+    csi.hdr.nidl =3D NVME_NIDL_CSI;
>+    csi.v =3D ns->csi;
>+    memcpy(pos, &csi, sizeof(csi));
>+    pos +=3D sizeof(csi);
>
>     return nvme_c2h(n, list, sizeof(list), req);
> }
>diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>index 992e5a13f5..ddf395d60e 100644
>--- a/hw/nvme/ns.c
>+++ b/hw/nvme/ns.c
>@@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>     id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
>     id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
>     id_ns->msrc =3D ns->params.msrc;
>+    id_ns->eui64 =3D cpu_to_be64(ns->params.eui64);
>
>     ds =3D 31 - clz32(ns->blkconf.logical_block_size);
>     ms =3D ns->params.ms;
>@@ -518,6 +519,7 @@ static Property nvme_ns_props[] =3D {
>     DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false),
>     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
>     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
>+    DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
>     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
>     DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
>     DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>index 81a35cda14..abe7fab21c 100644
>--- a/hw/nvme/nvme.h
>+++ b/hw/nvme/nvme.h
>@@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
>     bool     shared;
>     uint32_t nsid;
>     QemuUUID uuid;
>+    uint64_t eui64;
>
>     uint16_t ms;
>     uint8_t  mset;
>--
>2.30.2
>
>

Would it make sense to provide a sensible default for EUI64 such that it=20
is always there? That is, using the same IEEE OUI as we already report=20
in the IEEE field and add an extension identifier by grabbing 5 bytes=20
=66rom the UUID?

--OK0RBa6M2IC4Ayzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDAsIsACgkQTeGvMW1P
DemjRggAuRpixmtZLDNYKaV0E1E+6DZ+QyKFwcW4Ae/fu2l0agsitXxb30b7S8Mq
8dDaTMEXnSHWT/Dj56icpZhalvkfuUqtQrkKbEcijq8kqbw/ZakYA+iTVZX1iVdE
mR68xYNTSSZxjoJzHNIZZKIkS4d0j7VSu5klHFQ5q9FpBQprUqWWu1uVnaRmCUAA
yWE7aVMVFx891zJn4ve27OW8psafnlFHf9Eot8Mq6dZAvJsGPpmrFg+gA61NLru1
4BWWe5TidqBTo52U6qyLZ7IyPbmBH1fu5s5+fB7Il/Zv2LN5eu/sw1gA3nQmsqwK
0Xav/7+vdizF5i68fG19cfVTsFBRVQ==
=gK9M
-----END PGP SIGNATURE-----

--OK0RBa6M2IC4Ayzz--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D1367A46
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:55:20 +0200 (CEST)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTF9-0003JM-4T
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZTAi-0002EL-58; Thu, 22 Apr 2021 02:50:44 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:38937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZTAg-0005YM-70; Thu, 22 Apr 2021 02:50:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A902010F1;
 Thu, 22 Apr 2021 02:50:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 22 Apr 2021 02:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=xiHuMuayAzsawhLdI/aexsC21AG
 xjVDUiPXxfMvOlUY=; b=KroPaQIObv5MiyZoX5xmCCeEIVTGn9O06yagK0olPsH
 xiP4VT2RmYNfy07mNCMrbQKVTVTot09RUOc6BbNdu5mpqYb9ssK4ClxdsoXV+BEQ
 uLXLeuIbB1sx+KltOicIRjJ7ou1UcYX+kl0MKc/zCaEG39vc7HprRjMOTc/eAseD
 GrsroY+d39EYqffvSv9rn6pPxpJVRw8ukn17k7D3Es5qjCtEh+kxcuSdWdDqnBFy
 o+9Zj/k4okRKvxkOSXB9W9BIL9mZflCHJBJx4BADg8ysK2bSZCRh5F3E47mL+VIP
 CSQrY+LYL5B24wN6kE2Fxg5zQxQpOCRsQ4n9L6EgX2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xiHuMu
 ayAzsawhLdI/aexsC21AGxjVDUiPXxfMvOlUY=; b=EwjdwnVwma+rxGQNEFMGRN
 vlEyl1Uy/BQhAj6mreaZ397QLATfnTPzJgrztuTHYjhnKsaFrA6HFJkMpOWTx4m6
 640D5JbstDKN+VvrrlOIwL3GucIHik3GbnUGNVifcjJG0CLA3TELNHY5CzKeYqLG
 ztpfUJEsCQA928gsJvSMZ1tC/x8BL40H05mmFxbPedRRDRkAVssHx3V08Jd2QM0n
 u61fWR/ekTu4FnekSdEG+oZTGn10OPT7ULcgZAIfrp0lS+0bSDxnUWzx4pzMuJyj
 RUtc6skT8KETyWHFWIbhcweI82leJjmoAv4OTzmPA7dA1DFG59sgTiMvumZ5JBgg
 ==
X-ME-Sender: <xms:vhyBYDH00_5qZN3IAUWD3_fprBIm2YHek-wbGkR_MtSbw8irPjD1vQ>
 <xme:vhyBYAUbxdALx69hj_ycbLrRbHJxFtTzD1GwwHg_Uuts6CqrxwxJgrXU9z6E-JSmz
 53jaSnTCHXVwAoxPEk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtledgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vhyBYFJXLzBLMVKH61LBTGTN1MVR2RFiT9UeVcVBuiGwdNqpP8HA7Q>
 <xmx:vhyBYBFGF-23mXDUfkWQGpohhcmlW9wYNmUxYlcPth7OxnJRVNDSCA>
 <xmx:vhyBYJXfy231ioZpVMdC5i3ECMtBcYtGkXDJt_EmFtWHspmq2A7zrQ>
 <xmx:vxyBYLLHWg2Yts_dlJAkrKLHLr5YRmqvtqIHaZ1lZRJbGujqKbBRhw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26945240057;
 Thu, 22 Apr 2021 02:50:37 -0400 (EDT)
Date: Thu, 22 Apr 2021 08:50:34 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 3/3] hw/block/nvme: add id ns metadata cap (mc) enum
Message-ID: <YIEcunDNtqlVDp2t@apples.localdomain>
References: <CGME20210421130551epcas5p4b62b0625aee2fa4efc07a78f33751aa0@epcas5p4.samsung.com>
 <20210421130229.13806-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iMSnKpnus44b0wKv"
Content-Disposition: inline
In-Reply-To: <20210421130229.13806-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iMSnKpnus44b0wKv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 21 18:32, Gollu Appalanaidu wrote:
>Add Idnetify Namespace Metadata Capablities (MC) enum.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme-ns.c   | 2 +-
> include/block/nvme.h | 5 +++++
> 2 files changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>index 9065a7ae99..db75302136 100644
>--- a/hw/block/nvme-ns.c
>+++ b/hw/block/nvme-ns.c
>@@ -85,7 +85,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>     ds =3D 31 - clz32(ns->blkconf.logical_block_size);
>     ms =3D ns->params.ms;
>
>-    id_ns->mc =3D 0x3;
>+    id_ns->mc =3D NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
>
>     if (ms && ns->params.mset) {
>         id_ns->flbas |=3D NVME_ID_NS_FLBAS_EXTENDEND;
>diff --git a/include/block/nvme.h b/include/block/nvme.h
>index 1d61030756..a3b610ba86 100644
>--- a/include/block/nvme.h
>+++ b/include/block/nvme.h
>@@ -1344,6 +1344,11 @@ enum NvmeIdNsFlbas {
>     NVME_ID_NS_FLBAS_EXTENDEND  =3D 1 << 4,
> };
>
>+enum NvmeIdNsMc {
>+    NVME_ID_NS_MC_EXTENDED      =3D 1 << 0,
>+    NVME_ID_NS_MC_SEPARATE      =3D 1 << 1,
>+};
>+
> #define NVME_ID_NS_DPS_TYPE(dps) (dps & NVME_ID_NS_DPS_TYPE_MASK)
>
> typedef struct NvmeDifTuple {
>--=20
>2.17.1
>
>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--iMSnKpnus44b0wKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCBHLgACgkQTeGvMW1P
DenD3wgAs1j/DYnsZoL6FklG0AfYcA94kjT0SbpEg4gpD0agaMM3vJNtFs4iPON6
SJSF0E702dp8fLpRFxQtq7W3gwuHdP1yAWHeDbGSa50ZFeFc7Wl7gi7j8Z2KDZ2K
npwjwN839mH02u3g1Imf9PHi41lepyDSUrC5vbK2HPu6mXws4f7Jox7/F01lgGEb
BExt7Payswvii4wf3RWMAzVkM0WI1fsKlrWb97Lq9yGgHYufpxIYHjTrc175DZMD
357UDHKZZNPdOQFrwnMyEzxE24c6tjS8oV7KPMnNzhJJO1TdR4VSiDkHJOhY7Wv8
U/4FH2s25YM3Jop6ub4VswpxK3NuFg==
=kOGj
-----END PGP SIGNATURE-----

--iMSnKpnus44b0wKv--


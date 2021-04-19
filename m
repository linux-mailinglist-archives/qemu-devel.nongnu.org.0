Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2936404A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 13:17:36 +0200 (CEST)
Received: from localhost ([::1]:57178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRuJ-0005jG-5l
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 07:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYRph-0004xh-Dl; Mon, 19 Apr 2021 07:12:49 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYRpf-0005Qh-Hm; Mon, 19 Apr 2021 07:12:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0656D5C0106;
 Mon, 19 Apr 2021 07:12:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 19 Apr 2021 07:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ElqFEPiEFNw0MjhiRREjd/gcrJp
 0610EcoqCEji83EE=; b=ia6KzJobzTBScNUKCroLc9UQ86wDUHYjZGyOdwwI2F0
 kRwRKHN6WQvegToMdAlzdXeDROUJVOHLT8JseCgR0eAQVPPiKNWtbtPvmFF/aP0T
 7BhXL1YQWXb6bIq0Fb46G7Gv/ztHghphopTqJMQZB+bz8+o/vnAMP6BNMYdhGIvr
 oCupb6E/QhtoIAm0KpMzaR886dUrHxNt+diOPWceto3KZr/eRziTW51xs84gmBSX
 d07EYnPnNs+N8/XgtPXa1Hj2vciNR5E27bro08SR05UUGvy7f+2KCLo61WoIAAsX
 Oo1jyEx6DGQZeMXXEy1pdjCREOfyrN7PUaB4tU2XN3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ElqFEP
 iEFNw0MjhiRREjd/gcrJp0610EcoqCEji83EE=; b=O3IChJwuHbkGEF88PtCXji
 GiNGF3k8UwV8AnlaUAg39+/Ik10HWcHwbB0S31/HcB4K13g+fRHbjLkF5xmMLpNU
 LL3d9ScRSZ2bz6z/QKttAGQeTNuxDDrM08tRaTXipnMHKXYmRYhsELpkmdqAGyVE
 B8F7V5d7Qtqa1kgh3Fc7Ffk9TqXf49qaHxDoRsCl8B8QDeK11hlIg17YalZa6o3a
 ss6KJAHl1Rg5K0OMT32eVjZ8JD/lzvUnUY0pYGJWc/RUjBm4auG7WNJhq7U9nmDs
 0Wmf2y5uP+J7kbufgGm9VShv864cGqI+TocE0nqw/vdKA3WCHl9gEEVV8oA5i1KA
 ==
X-ME-Sender: <xms:q2V9YHByOYggZAxwx0hmWEO1abvOWqNQ1T36BBTA_WLb3GmO5LHlLA>
 <xme:q2V9YNh1fISreKNEaRaSszt-msq9t4tog6XuoQX92KNJ2Na869gel2moUdnoZMBRT
 Oo5v4xYozVXOQGcAXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecukfhppeektddrudeijedrleekrdduledt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:q2V9YCmVXiVx7snBHgHzFFKR6bLsdWfsF6MY0ADebs9mSEgOiFOFKg>
 <xmx:q2V9YJzE9zf5HQi26z0QCJDF7mTnWwGyGvtdowKZyhLGsf83SpDiYQ>
 <xmx:q2V9YMSiNjPGrZlyA3TfcpE-M6hpOAQivzSza1C5MNgSRfYBH3qhcw>
 <xmx:rWV9YLFTqI9uJnT2ZyaeECsY3cwsiIOQLPyGfPUREo172PfgVgBvcw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1EC561080064;
 Mon, 19 Apr 2021 07:12:42 -0400 (EDT)
Date: Mon, 19 Apr 2021 13:12:40 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: fix io-command set profile feature
Message-ID: <YH1lqGaafhJmuWzX@apples.localdomain>
References: <CGME20210419105126epcas5p4b8c4ed2a308b2cee570570485b7b5c89@epcas5p4.samsung.com>
 <20210419104832.25455-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lo+BvWdo4vCn/96L"
Content-Disposition: inline
In-Reply-To: <20210419104832.25455-1-anaidu.gollu@samsung.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lo+BvWdo4vCn/96L
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 19 16:18, Gollu Appalanaidu wrote:
>Currently IO Command Set Profile feaure is supported, but
>feature support flag not set and this feature is changable
>add support for that.
>
>Remove filling default value of feature in CQE CDW0 with zero,
>since it fallbacks to default case and it is zero initialized,
>if feature default value not set explicitly.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 624a1431d0..b5d2c29fc4 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -185,6 +185,7 @@ static const bool nvme_feature_support[NVME_FID_MAX] =
=3D {
>     [NVME_WRITE_ATOMICITY]          =3D true,
>     [NVME_ASYNCHRONOUS_EVENT_CONF]  =3D true,
>     [NVME_TIMESTAMP]                =3D true,
>+    [NVME_COMMAND_SET_PROFILE]      =3D true,
> };
>
> static const uint32_t nvme_feature_cap[NVME_FID_MAX] =3D {
>@@ -194,6 +195,7 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] =
=3D {
>     [NVME_NUMBER_OF_QUEUES]         =3D NVME_FEAT_CAP_CHANGE,
>     [NVME_ASYNCHRONOUS_EVENT_CONF]  =3D NVME_FEAT_CAP_CHANGE,
>     [NVME_TIMESTAMP]                =3D NVME_FEAT_CAP_CHANGE,
>+    [NVME_COMMAND_SET_PROFILE]      =3D NVME_FEAT_CAP_CHANGE,
> };
>
> static const uint32_t nvme_cse_acs[256] =3D {
>@@ -4707,9 +4709,6 @@ defaults:
>             result |=3D NVME_INTVC_NOCOALESCING;
>         }
>         break;
>-    case NVME_COMMAND_SET_PROFILE:
>-        result =3D 0;
>-        break;
>     default:
>         result =3D nvme_feature_default[fid];
>         break;
>--=20
>2.17.1
>
>

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--lo+BvWdo4vCn/96L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB9ZaQACgkQTeGvMW1P
DelOJwf+NdI3zlNQRFB67nD7aPpWVIpsHVFCW6e+1Tq1/jDsnzEDJBjvFBjM3q0o
85ADA4Xc4ikl9Rm4fQ2HNQQUE+soiizKkvKYetnNxtp/r82nP9ob90Z32ELeXEDR
pSJub+Al1MqUmjPKcs2DdHr5mb2wdcJtypBA/OJFQjsMq/seHV/uCh9aYHO2uaZS
mmQr6TqigEgqOe6B0C127hnGv5MGbeUu7bn0wFv/7/D4n703iCA8XJaj8ZuTAz3z
HAOEjamDRFUTM4gDDtHpScYkoUCJQaJ0t52F0m+AExEjg2bB6a6T3vEZVg/pZxzv
LTkP9E7vlSpz/BCVJNfD99+CpbyMkg==
=03WU
-----END PGP SIGNATURE-----

--lo+BvWdo4vCn/96L--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956B3664A2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:49:46 +0200 (CEST)
Received: from localhost ([::1]:35718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4o5-0004Ux-Gh
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZ4ju-0003o4-Dh; Wed, 21 Apr 2021 00:45:26 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:51263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZ4jq-00062e-6I; Wed, 21 Apr 2021 00:45:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DD7745C00A5;
 Wed, 21 Apr 2021 00:45:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 21 Apr 2021 00:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oCXEXBrPuFpIzmyt1Km6N2KW+yv
 WlPwD0uADJxH/I94=; b=bilNaYzlAFH62sIpjnwiw7lOoSKRpOpnZUJXWoDF7Gz
 lWeWC+T6nMIeODfGOh9223d6xXVQRmje6ayl1yhsSQ7YurNurpohOZ3OJiCxX+t3
 PIpby5BIuhYEcRBxb61J+FjE61Optzih7trWxhK9Gde242FHIC1GYra+s0bXVOK8
 DdsvTH6Mky5mYRnNHZiA0C9+PXLaZhiZMS916hV4TOIJV0K5t9is49mspKxASSxm
 xlSiXZUXJfpZi38l0+/WceEDZHprmEj46mKwdqKT2h/YyAMGY2g8VY53FhesTltU
 4CWLfN0LHZ7QAZBXvyG4dHNzyqNW42iLFRV7wvmMsKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oCXEXB
 rPuFpIzmyt1Km6N2KW+yvWlPwD0uADJxH/I94=; b=B/WW0YEWMOKDRlGtZU2bHx
 1k6IOvpoNX1AD6Eu+aqiV6vhaVXTJjX802zAcDyGeI5oa/moZ82OKaO11bZR0t5I
 yCecoFSMv02hOPOqel6yJ7BDN7qYNct80h4/COfhCKLX6GXFR7yTjpQ2CTP/CzfL
 7FxuhcpthDZja+ntFi+g6N19BuF0nch6FTv5VDohOcK1t1hVCnkHGBeDdJfpblql
 HUUWEe235BL0TNEGDfbMbkW3l7Z4Eua6b7KpDy4Dw/DT+CN7cPG0vjBLv0k9p8IN
 ZFIScnSR18hPtn4n5+iCDQbY889axN7rDhdfQumbFc0cT80c5U3U/G98sJW6wlJQ
 ==
X-ME-Sender: <xms:361_YOdF5HtcqQbgsQ-0_7Nj1XX8GpOEDXEwdEU9mmePyvM5Hq_-mA>
 <xme:361_YINp6eF8xVj2i0ADxQ7GUpGFj7RfzZdYETBuC04nUNPT6lVu5F69fvzIxgnlB
 wAS3zCjraj7NyfSNbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtjedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecukfhppeektddrudeijedrleekrdduledt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:361_YPj2UbsXoofFtqj3YlkjhZc23MfF3xqJYC-xNe2TkBVSUmvQpw>
 <xmx:361_YL9jTGcAFP8xaCXRZGRLdReerhHozD6d8iP323DSeJQi1nC9jA>
 <xmx:361_YKvWe2-lx3iXwOjGj4p5qwR1fzWBDHZczMzHIBTk5OT8V0BWbA>
 <xmx:4K1_YOjymjWOb63zWLyo565v0fnNbkeU_57dK4-bRlzg9-yQWaYbkA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3A149240067;
 Wed, 21 Apr 2021 00:45:18 -0400 (EDT)
Date: Wed, 21 Apr 2021 06:45:16 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: function formatting fix
Message-ID: <YH+t3Ah1NngasMr8@apples.localdomain>
References: <CGME20210420192552epcas5p4d48e9f845a34bd1881ab1b297ed5d780@epcas5p4.samsung.com>
 <20210420192259.21447-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MdigwVj0x32WUgmS"
Content-Disposition: inline
In-Reply-To: <20210420192259.21447-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MdigwVj0x32WUgmS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 21 00:52, Gollu Appalanaidu wrote:
>nvme_map_addr_pmr function arguments not aligned, fix that.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 624a1431d0..63ceeb47bd 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -574,7 +574,7 @@ static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOV=
ector *iov, hwaddr addr,
> }
>
> static uint16_t nvme_map_addr_pmr(NvmeCtrl *n, QEMUIOVector *iov, hwaddr =
addr,
>-    size_t len)
>+                                  size_t len)
> {
>     if (!len) {
>         return NVME_SUCCESS;
>--=20
>2.17.1
>
>

Applied to nvme-next.

--MdigwVj0x32WUgmS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB/rdgACgkQTeGvMW1P
DenjuQf/cCs8Rbq1dhAvfdF9tklluZ2GJiHaMIPjV/Ht5p7UWC+hzFGaK4XKqlkA
pLNk90ZILAyMV4Oe3Wzs5XQePUVgPDjVtkDEjlLk+dXWMNws/Dj4Qxx/4cu836/5
he5Q01phK4AH9GEKog4UcQVmNpIoX8NKOCoSrpUfpNcnse7cczfHmyfBfBd7TGeH
ajmQKX6olA2C/aQaiZFYiJ9KTR+fUyqUKY+vgaqITDL1u8eanv59B9Io4VMfZySh
mWWWavcDwphZNdQ5kk6/+l5Hu9cgRdFHy//c9GT/lRlT0yLcrSjs99DgWCPjSqcd
JxxFUCBbboMPkHEsnWUO4CZ1PLQVZA==
=Ow4n
-----END PGP SIGNATURE-----

--MdigwVj0x32WUgmS--


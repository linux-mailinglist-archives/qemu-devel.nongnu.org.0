Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491483A1E18
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:28:18 +0200 (CEST)
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4oD-0005FL-5e
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lr4jy-0001wg-Ps; Wed, 09 Jun 2021 16:23:54 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:42755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lr4jw-00069N-Tx; Wed, 09 Jun 2021 16:23:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2DA635C01AE;
 Wed,  9 Jun 2021 16:23:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 09 Jun 2021 16:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Vq4i6Q/G8aswYQ6z9/XlEu1G4XV
 8XEublTDkgq0076M=; b=GpXEbt9yFfn7HcR4gOdHd0I/wiA8q3pULQKbTgIfoFL
 5jID6SF3j/ZOYbZg8YoeJ4xvN/f6AJB4NXMNIl7O0IbHPya5dmMrwxvaDYvyKzc4
 oq8nHW5DbubhZ6T5wr9pTfJDgu6Bp3Y16BbKbGEbfAnMHFC0AIjDQkM7NKQcKPYt
 6/d4Fx3He0icSsprtbEDBuanDZ8uEX3XGnaGOGXbAI8MbG+x37JeYS2lTM9Ab1OP
 FcEGPxNduM4UxVhCx17HvDFWxrVlNDWN+AkNsvFjeV5z9rl5DRIo7YEzfVbUEGGY
 d42KZUmoW7traHnD841qH6prAh0Aqes2kUoWZfQ8sag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Vq4i6Q
 /G8aswYQ6z9/XlEu1G4XV8XEublTDkgq0076M=; b=rlwOji8lpIi6RpZNACfvz3
 NGppYAqsjsBo8xcvlOEbaNCq1UidewEdxjOThsHx+tMn8kmuzbLRTq4d98ygRhiS
 lTAxQN6cutmL/zs4lwWQvS8qYLcYIw3LihJzvmMM4hkOo+0N3DE9mzHhpg3jlI33
 5M6Uo6KE7Cnn5ALEkdGMYsfaMQanSSYZUI8Pnbt4f67VZG1KsvNOdLZ7Ea2CrqMw
 IHSb03fXjQSX1Cr0d4z18z5hi/Bni+zAGqx/FGEnOxepRZ8ZlLzFRxA/byHZ2EZ6
 +gmSN9S2HDEl+3nZdCas+5NSHa+xmTckomHBVK37gL6iyOdOc8eQGyd/PkswjATQ
 ==
X-ME-Sender: <xms:VSPBYL7OUSPmZwXq0zvmjcv2AQv97pHocYPdH-z66dkrtwGX9hTX6w>
 <xme:VSPBYA7XsSzRDQm7JPNARVY47T4jiXplbYJPJMsJbxdVJOEn0QEvwYHP1AR9eCWjF
 hGtmg6_w3qTiih-nFs>
X-ME-Received: <xmr:VSPBYCd9Nysj4SOU0Y1VYjZgtdVwobzY0-Lrp0SfPbQR01lnkd2NblGammeYd0CcjGiN4OJVvE5N_GCjDiHidR-NA1gRIbnlIcXD-piwgMTbqyzk0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:VSPBYMK_6Lcr1E2YtjVP9hBjU_u3JaXizbSn3aam0g8Nfwxw0L4nRw>
 <xmx:VSPBYPK1fam37DUN7p6dSTI1KyfVCUkUnmVkekWJfPRs_8fJabwx1g>
 <xmx:VSPBYFyA_DPB5Siuuoa_zdEs3JKh6xYCiVqjlcuhmsmVAy2Z1dNOtQ>
 <xmx:VyPBYMpAl2G9pbUd0MegJfG_pcqIWTDs7k9qtMAwWn91cJHh_-2dqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 16:23:48 -0400 (EDT)
Date: Wed, 9 Jun 2021 22:23:47 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v2 2/2] hw/nvme: documentation fix
Message-ID: <YMEjU5wPfhXJJR57@apples.localdomain>
References: <20210601150226.5558-1-anaidu.gollu@samsung.com>
 <CGME20210601150646epcas5p338004eb387e8e9a104b9d2212c694130@epcas5p3.samsung.com>
 <20210601150226.5558-2-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vWiqXxRfAy/iGnEA"
Content-Disposition: inline
In-Reply-To: <20210601150226.5558-2-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


--vWiqXxRfAy/iGnEA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  1 20:32, Gollu Appalanaidu wrote:
>In the documentation of the '-detached' param "be" and "not" has been
>used side by side, fix that.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/nvme/ctrl.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 813a72c655..a3df26d0ce 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -114,7 +114,7 @@
>  *   This parameter is only valid together with the `subsys` parameter. I=
f left
>  *   at the default value (`false/off`), the namespace will be attached t=
o all
>  *   controllers in the NVMe subsystem at boot-up. If set to `true/on`, t=
he
>- *   namespace will be be available in the subsystem not not attached to =
any
>+ *   namespace will be available in the subsystem not attached to any

namespace will be available in the subsystem *but* not attached to an

>  *   controllers.
>  *
>  * Setting `zoned` to true selects Zoned Command Set at the namespace.
>--=20
>2.17.1
>


--vWiqXxRfAy/iGnEA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDBI1EACgkQTeGvMW1P
DekmuAgAsoO/PqullRE24MvlJUyVXcojkl111Db1GjCI7tHRzYOG+8nzBwJJPZop
C8D3Ggm5GuEBDmLGyj9x7qmMpn18V9jhxqHVyoQkPtwkVUYZdLo9ErnM5vN6vRUW
2/4zUf/q4Gg9wheMcnrar7NLDUmFkVLBdqMiVkW6nRh5F1JJW6AdENr1pBxo984T
ApuGlhPoQsOf+SO+KQ2vK+jUUvu/WjpSUpGKdPDwmtXmfL7WYqPih3rH5LR/CFa0
oVfdQnynun0n+YYZCSj7JIpNnSQczjEdvc+jWTcD7WbxVwe5ND0+qHaJHJy5Gm2d
RJAPYIX1KimGqyXkUruy6LcEcm+Kdw==
=P5KD
-----END PGP SIGNATURE-----

--vWiqXxRfAy/iGnEA--


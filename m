Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01EB5BB6E7
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 09:18:59 +0200 (CEST)
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZS6K-0001B9-OE
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 03:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hi@alyssa.is>) id 1oZS27-0006qR-Di
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:14:35 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hi@alyssa.is>) id 1oZS25-0001Mt-Q9
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:14:35 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D5765C00E0;
 Sat, 17 Sep 2022 03:14:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 17 Sep 2022 03:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1663398871; x=1663485271; bh=ovSb4zT4Rz
 TmqUHbLq41rNf3jGCrVeLlfdfxhUHw+U0=; b=zZc0CbIS3kpY6CDyWHe2O5DM/g
 MHlS5zYt8CUNFgR2Dfj3ZzuyxnjTO5sXCAOeliebElAVCaXMIbOaRFCzdwBWruu5
 VldXtxVVGgiCUZc+xCNJB1/H/OBC+Cti3p1XynhJFoXZX68brcZL7hz9sLL77XmK
 isY2HKzfLRYgFjz6yYTybbUZCraHze3cXdVaCvflP4P+TZMBLcY5EX8h11UHkPKg
 P0qvm3ZCQQonlS4miN34SE/4elGuuO3oRC4eKfRGxLTO6dNxmkVxaF6Plbv0VdnH
 q+UdRMe0G9cbX2zCbBzTkZNMlDQyxJot/Sg4dmS5XcGmrP10qv2ZPqgQeA1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663398871; x=1663485271; bh=ovSb4zT4RzTmqUHbLq41rNf3jGCr
 VeLlfdfxhUHw+U0=; b=JlSavYK5LnDU945st1KeEVhYL1jO04hBM4nRSxmjUlzX
 cM0L73TxpDo5/d7C/3Zh0mMGfENHtf9akTsc0ybU5mSE0hbBnbdJlbE+hVRCJKKi
 1M43ikEk3EXcms+MdM7hbITQw4RAM1L8Zv1Imne1TDaGlIzQ4yPdT5jwl52paVQl
 v+ImsyPlcpZ7V49+ihjrEA+Hc5eTkMMy1F15grG5J00D8+J+uU6jDA8GNuSrCdGJ
 MYs5DtDRYUHMienSLZc2/dq5sbkDFcaT8LRIqzlDgotCbd3LQnOMTtn/kjw2DveA
 quwUQ1ACOsWNTObJ73EIr1za6z3uttvbka+/8QCiYg==
X-ME-Sender: <xms:1nMlY7PiY_vOYf7fC73cTyScrCYFp0xekMEjqGOfLgOx_XvVpDlDDA>
 <xme:1nMlY190LkZ05cI7-IG-Y-i_-g36Z8v7X1mYU5GewjmLcovk4iaZWDO9YcyFutjTY
 b9M10sTuWSLEoPxaw>
X-ME-Received: <xmr:1nMlY6Q-ST-jjiUnAiMOdd-d1gTQiYC-RiLUc9VCmh_2n0eNaSGmrYPpVT5rlmIctdGjRKpdJ5Fm40iaJ90P41N5elztGdUf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefujghffffkgggtsehgtd
 erredttddtnecuhfhrohhmpeetlhihshhsrgcutfhoshhsuceohhhisegrlhihshhsrgdr
 ihhsqeenucggtffrrghtthgvrhhnpedvudefgffhjeeufeefhfevgfdtvdeghedvudetje
 fhveekgedvhffhudetgfehieenucffohhmrghinhepnhhonhhgnhhurdhorhhgnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihsh
 hsrgdrihhs
X-ME-Proxy: <xmx:1nMlY_tvivyEutzqZl_DVc7j8YQr7HL18cAqoJx-XUrnGGMtuf_Sdg>
 <xmx:1nMlYzf0NAmJZwdFFihmo3Ij-BalhdK_1l9mapSgahzbM72vQQicrA>
 <xmx:1nMlY70BkNQIFKUs41L0T6wUrbIpnh1XZ90UjAo8YDyjY16wHcjsjw>
 <xmx:13MlYzkMWrjg-EQX_ExRxEJ2dqfISbt1ivj-lWBDvPlCOWSy9N5fPw>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Sep 2022 03:14:30 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id 054F49750; Sat, 17 Sep 2022 07:14:30 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: Linus Heckemann <git@sphalerite.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/devel: remove incorrect claim about git send-email
In-Reply-To: <87sfkqmq2u.fsf@alyssa.is>
References: <20220913165214.97241-1-git@sphalerite.org>
 <87sfkqmq2u.fsf@alyssa.is>
Date: Sat, 17 Sep 2022 07:14:27 +0000
Message-ID: <87o7vemq0c.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=66.111.4.27; envelope-from=hi@alyssa.is;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-=-=
Content-Type: text/plain

Alyssa Ross <hi@alyssa.is> writes:

> Linus Heckemann <git@sphalerite.org> writes:
>
>> While it's unclear to me what git send-email actually does with the
>> -v2 parameter (it is not documented, but also not rejected), it does
>> not add a v2 tag to the email's subject, which is what led to the
>> mishap in [1].
>>
>> [1]: https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg00679.html
>
> It does for me!
>
> Tested with:
>
>        git send-email -v2 --to hi@alyssa.is HEAD~
>
> X-Mailer: git-send-email 2.37.1

I wouldn't be surprised if it only adds it when it's generating the
patch though.  Did you perhaps run git format-patch first to generate a
patch file, and then use git send-email to send it?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmMlc9MACgkQ+dvtSFmy
ccAu+w//V1peb8j3ByLDSG6pBJRSOGm02x4a/qQIFoaae6qYtSBj/HWIZknurhsi
45j6+mWJ3MC701y0MCH0xbTVAK7wkEonvFx6s9xXsmGLCNoQ68F9dndqoXnsJFu4
ih3AsucjM9B9su7CzTeb1K0nFC/lUE59ZNyo+GbZjVmNAJbHBouX9keAVVdpnOce
Zyah3kk/cTIhI3QG0iY5eEjzE1R67b6LurqVCvYTXmG5J+LzA3qFCKqfp7H0nTCC
yIlxuk16L03PQslVW5C/Kzmw4HG2XyS5rBIXSq94nMpWyhYzLS5Uq0XboNOEDQWm
NqPMKAIgdTgl9IKYkIQG97uQmbNOB8/GsSwDAVsHuAVxcPimiEnoLrtCFpcvgHpd
fSbexcFIETG7HR/HURJSXXhLRJaHfF4vExMQESOtxUaJTETUgOlfdDfkJRcSDcVO
r9gTnFtt3Ci1zEOaLjry8uT41Qf96fDoPo9GSaKpR5ZdsefnuWUfpmBHPnocGd36
ahZ4whlhOpmpi0R6ty5gt4V+t+BSi4zMynjbdlqv30seGJN1Aas+uG1aLZ32sMwl
P+0cKpmSrSyerDhsTivxJ9/eCeEUVKFHvq1Pgg6DIoWqRxfwBlGGtHN4ZkG3hCWA
QfNVoiu/52xi0tkZNvSonGH27dPXAo4mKBJjmOQRVJXFgQxj2Z0=
=qDsl
-----END PGP SIGNATURE-----
--=-=-=--


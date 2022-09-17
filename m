Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC5D5BB6E6
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 09:17:45 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZS5A-0008QC-6M
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 03:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hi@alyssa.is>) id 1oZS0q-0005tF-Ld
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:13:16 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hi@alyssa.is>) id 1oZS0o-00019A-BF
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:13:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CA75D5C00E1;
 Sat, 17 Sep 2022 03:13:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 17 Sep 2022 03:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1663398789; x=1663485189; bh=AOzixdjauw
 Khf0nIIlEZnfq+T3vzUaJGPX1Wq69XTzQ=; b=dTteUyPgrbuhZFKj0j6gnphB4N
 p+WxUlzxgBaJBVL+zfn7MSlD/l+K7w0qOCwqeifzZxY+nJlKIO0zlPxWgeo28riT
 qJYFkJX5ItZ+p/CA4huXap4CIcekfNFoP3ZgBEPcl5rRVGMpwk5fyrmzpOE+cLjE
 PDFWTLBX67FS/R9O7EcK2SxESBAIJbkrV6LIKQ+NRqZ1jgfXeAMCEVcah4HsgV+G
 SQ3OQ0GJ6wOOwMjxKpIJRF0PorHeVG6Qq47jDgXvgHsK8G3uqYSoEHMV+nrWKcLv
 N3Jjh4tHgewkkxv0MiLlmhJlr1/JylrF1qeRFF5PPKpdAdkoVPPVlKIZfbGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663398789; x=1663485189; bh=AOzixdjauwKhf0nIIlEZnfq+T3vz
 UaJGPX1Wq69XTzQ=; b=0h8m5gNMizZSNOlaiGqjVYazKFweIll2LpMpUpHnOaEz
 hFpJm2DZ5f86R4vVQADv+O+shDIDrKP+kscndCVpx6kTe62DRAgmHzricyYtm8PZ
 2Qy92QUUiAj0XP9pNcpkf8Y4S+EpYodjlmEUGyzjzdMMgCurXsWmHXKSjoINFvFm
 tVR7XQIxhoAQCuujiwyf1YofekjJFj9Do2/bUak0+XXCjrPJJAPF4kl+9L55auHK
 C8nE6fmoeONDM4NNxYoAQZmjMcnPgj1ZbL5aLHzhc+HC7cjMfVcy/umbwtEAYA7h
 TJxhktIiddJgPwcUdH/eOyQenGrNEL/pJCsFWKL/gg==
X-ME-Sender: <xms:hXMlY9t6vz1U66XKkbhxUjd0FN8o8-cBIqpaoD3CBkta3R1i4Lt8pA>
 <xme:hXMlY2ctwsZkG3tZ-pYBqHzP2OcDPoc23RqHXTTtomx8i-KPIgpLAeQbvBOHzE7AQ
 V5aoZNFfDSkuRB6hQ>
X-ME-Received: <xmr:hXMlYww3zDlselu7iMeYcD2DaRYHXDbHXH6DWo-LtjTFvTl0ViRn8rphouodC7ZIv92tc0F0NDdT8k_AMIgkgqZ7KLHKwtsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefujghffffkgggtsehgtd
 erredttddtnecuhfhrohhmpeetlhihshhsrgcutfhoshhsuceohhhisegrlhihshhsrgdr
 ihhsqeenucggtffrrghtthgvrhhnpedvudefgffhjeeufeefhfevgfdtvdeghedvudetje
 fhveekgedvhffhudetgfehieenucffohhmrghinhepnhhonhhgnhhurdhorhhgnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihsh
 hsrgdrihhs
X-ME-Proxy: <xmx:hXMlY0OkW4FptF44ACVKKMDB2I7EbShOPdEVbEBsjmLPBGLU36Dz9w>
 <xmx:hXMlY9_moC23UZlCAVBXbFroH6L_UR9n4pNP0XoXtB-WjrmalznVmg>
 <xmx:hXMlY0VDabW-yz2J57Cm2zWq6FbflV4I4QNrAwByIVAjPOlRdCXxQQ>
 <xmx:hXMlY6GpjNqQJL-2M-R-DmlanN3M_as6G9VhPtzna2jiReUKsZ-Cow>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Sep 2022 03:13:09 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id A3DFE979B; Sat, 17 Sep 2022 07:13:08 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: Linus Heckemann <git@sphalerite.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/devel: remove incorrect claim about git send-email
In-Reply-To: <20220913165214.97241-1-git@sphalerite.org>
References: <20220913165214.97241-1-git@sphalerite.org>
Date: Sat, 17 Sep 2022 07:12:57 +0000
Message-ID: <87sfkqmq2u.fsf@alyssa.is>
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

Linus Heckemann <git@sphalerite.org> writes:

> While it's unclear to me what git send-email actually does with the
> -v2 parameter (it is not documented, but also not rejected), it does
> not add a v2 tag to the email's subject, which is what led to the
> mishap in [1].
>
> [1]: https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg00679.html

It does for me!

Tested with:

       git send-email -v2 --to hi@alyssa.is HEAD~

X-Mailer: git-send-email 2.37.1

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmMlc3oACgkQ+dvtSFmy
ccA61g/9HHOvz3be/uGWz33obuRsuebRVsXBnz2knPxcF5P8pz5QC/UY3JARV2hs
kwb7EUWcIv3YQs380sL7xk0TU/rPOlZXhtX7yztyrxw/+4PCEVA0Past7Zs0cIma
fFDGqKohPc14KZfkMp2/r0iuFN75VMh0Fpzvo4vc2V4EH7gqXj9A0KTsgfeBQHoo
QzYuTh+T2NPng7XyYND/IDC8TZsmJTSAG2N3UEh5xrfzjEbx+AUtzFRyU927eTi4
Qwi6iVUcuhdNrbQzvgbYbSx6LPSqJX8J831bYjGTpoyQrZ1U0Y8svfN1jN3wUj9o
oK1J6ig7iYY11+/gFh/IPE17lOSKpCc+B/VMUw3SE72KfuQ5mMAZSI3mdAYT+HD4
3hCDv2G0XsmCyeyFqRO0Ixqi2FQp2YOtr/Lxts777vOu1fonpWcOqE+ZAVGaKYLy
6r2C50B5BK/j2EbwZCyNlcwbtpQgQIxR4ZGTJlanIZdyu1dJQh1S9RewdmirvVj3
xEGAyRUoqD+30mgikrWRLIiBYEU/QiB2ZWARBJgXNChPFAmdNJyxsLWqvBXIep/s
JVz5qmi3sUu9RQwQ2eKmUrbYFuT6hahsLJuUpg52ah2mWDXtBcIH9LbGnArXAN1a
rDshLkA8jKf4YqlGerKdTPeb01h5Ip19ZCTtHrpyLld9CLGGNCE=
=b3Pe
-----END PGP SIGNATURE-----
--=-=-=--


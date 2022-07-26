Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA59E580E21
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 09:44:41 +0200 (CEST)
Received: from localhost ([::1]:41322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGFFA-00055G-Fo
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 03:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGFCc-0003Xc-Pr
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 03:42:03 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGFCa-0007kz-65
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 03:42:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 631353200904;
 Tue, 26 Jul 2022 03:41:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Jul 2022 03:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658821313; x=1658907713; bh=iQ
 Rty5tj+hS04v97PLvZ5/wGHt8DQCMs6Wv2g1U7/wc=; b=TtkdNhjSuLU+SLFNDu
 oYvTPH0CqhtDfxxNp7EY/1gnieUakCuhfa9gVlaGpK6zs8oP2epucVkzSuhXZ1Kz
 0+/PSHEsqJDBGdn8I10QkRd+tm+B9oWvtqaZ+6gPCcAMbmIgQph+H3eGUjKmZosy
 tqD9PAXgrgoWg74mv6i/1CeiFJZGtAekYyR6TglK8KNw3xM6noG+sDlha9FtDuhr
 W33WNun3zheViIvedUTJF7YbvpqNo+iS1yKeUh5K11frBWNOPJiNI9lGTAB+sMT5
 pEeOjRU7W9/lscAbFfycZU5di0xebdRdMo5R8WvcEQpSBSqzLJzrNtDyoBwBGk4t
 +RCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658821313; x=1658907713; bh=iQRty5tj+hS04v97PLvZ5/wGHt8D
 QCMs6Wv2g1U7/wc=; b=KymnwvpDlgTCOtr4Q4Z5Hu3+wFMxaXTK1RSn8EQvWTkc
 cDo9AuKlkHO5M1Auhqenp/PrKI3kceCXPGs4N82V17prM/xPoZi4Dpli3EgIrY0A
 eoQv8TjmpKfC1bs45m2s9T1vbow7yLD0+Gej2dKjrcWXuRYKPFEDSuHPTsPUUIvb
 1p7TjjKSaatTT1Rhx/wQWKP2/535flFu+WiM9Njr2YSOe1jefzcZs0XnpC2RvBho
 dUM6xURdU8yMdo45dp1z0sXX84szStr+BCByHCTVqMEqFOGbcvQsL+S2JrPqGrcp
 INs+qacznvhIBIwjTQt1Xfp0NGdRLKy9c0JUT2zR9A==
X-ME-Sender: <xms:wZrfYlWqVw1rD0zVmUMMaq3ai0PMLnw0j6keNcaWJZqtJyk3v6nGBA>
 <xme:wZrfYlkArnVljxO2gFoS9IG4AfQMu6E6qfDuGM9R3kJ01NeIjydh0nRGrH96TltWa
 v2C9QqrSQurjrTBI4o>
X-ME-Received: <xmr:wZrfYhZ00uYzw992zyOY_90CrccOhjUe5IlEwKzWL6cYb1JudBT0-zo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesgh
 dtreertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgv
 lhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggf
 euleehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:wZrfYoWdErkAJ3-F0cMXZX8OP0JTIpsjhGHKaOEyg9o5swwCAFqWcA>
 <xmx:wZrfYvlTUk8JeyqauFVv8Qsb5-SxA5jfn1CxDfCfzmpetwihr9bphQ>
 <xmx:wZrfYlcT8pVZO55LF7oRKrAgxwlCVL8zBGOZzAFiXoRPv7SKEfqWCQ>
 <xmx:wZrfYkyHjOITST5UL58Sfm7ydUF_xcGHKW4b7cIXlJ4quFidWjtkVw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Jul 2022 03:41:52 -0400 (EDT)
Date: Tue, 26 Jul 2022 09:41:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Yt+avxgBxcwrxYgi@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <Yt8DWWg8qPLxL0fk@apples>
 <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eHnarp13lzhLnYHG"
Content-Disposition: inline
In-Reply-To: <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--eHnarp13lzhLnYHG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 26 15:35, Jinhao Fan wrote:
> at 4:55 AM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> >=20
> > We have a regression following this patch that we need to address.
> >=20
> > With this patch, issuing a reset on the device (`nvme reset /dev/nvme0`
> > will do the trick) causes QEMU to hog my host cpu at 100%.
> >=20
> > I'm still not sure what causes this. The trace output is a bit
> > inconclusive still.
> >=20
> > I'll keep looking into it.
>=20
> I cannot reproduce this bug. I just start the VM and used `nvme reset
> /dev/nvme0`. Did you do anything before the reset?
>=20

Interesting and thanks for checking! Looks like a kernel issue then!

I remember that I'm using a dev branch (nvme-v5.20) of the kernel and
reverting to a stock OS kernel did not produce the bug.

--eHnarp13lzhLnYHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLfmq8ACgkQTeGvMW1P
DekFawgAxSSzsKr6tTfsynS7+Vsvff7nxxkLoRqXIJiwR/OvSQKXqUrvggct9nu3
otRA/yGZXAeNgp5sL3awCMlxajCZ8UNwtZWe3Cd2XQL7JzudgirPhjPlQ0L2MARl
yUWCZtllgJlamkXCkGpQHmnWluNPeG514rxBIQmISoyZD4dmScyprKT1/tGLZhGE
xIyMho9FvDQLLOn4uRKIYUca5hugYTbkynM3yh4PGyQ8JRrFp+otp1WXZnttAQ0H
AfPyJY+18yPqYGGYcqtvtojdimuF9Usd+oIiGFIYl57TTLAyF8bdRUPKRGnBuX7a
XWqH3dx1MKlUDF9jdVUKG3IpeT7paw==
=DONi
-----END PGP SIGNATURE-----

--eHnarp13lzhLnYHG--


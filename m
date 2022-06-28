Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A223A55BF2B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:38:16 +0200 (CEST)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65nb-00028x-Jo
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o64Ne-00036Z-Q0; Tue, 28 Jun 2022 02:07:27 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:34949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o64NX-0001MP-56; Tue, 28 Jun 2022 02:07:22 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 386F43200913;
 Tue, 28 Jun 2022 02:07:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 28 Jun 2022 02:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656396430; x=1656482830; bh=pd
 CwU6ddciTiFeFhJe2gjuhnNorXQNR1NiRbQ3VRKu4=; b=irDfIRzk7JVcziGWv5
 9V192V7G/oNZKnN4gAYytoEO5pEL4n66aHDV+/Wef66szR58zVXGj/ZtiQy03R1X
 spoa0eTaGlsyj/g9aASUDIOrxql22wezHpHL0ayHTMuj1173wHxQ5bxk0Q6ttXFD
 TcVtTp6VtjS4QvMlESj3/WMu/2pdqysNd154aAE196k1rUb93ckpsJ6bTVHmmX2K
 j7L7Le/pwM+IxgvzP8Aisd2lmHLXHCDLehbm6Ca5/e6IwFvTx8DWN6eeAqHbdVak
 Bd+MCriA/eu5/wn2bjfi6CZv8egROvSiyuggwaoA77Lu9cjwdH+in56GxU5k4dZP
 aCEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656396430; x=1656482830; bh=pdCwU6ddciTiFeFhJe2gjuhnNorX
 QNR1NiRbQ3VRKu4=; b=U70CyFdPJq2UIVejPE9RodHxwg0RntIbEgW0YGHJwCcs
 7Y+BBUXYK+8KGog0HFwJpWn7hmsWJPYccp3cflezb/NNvYj2x1IhnqWyRbPAgyN2
 Ve5hc7/fTOl8HhVWw9hqMAbPsBJ6Nm8MPh1Oi0KSYIUe2W3Vs6vb5Wte+QxA7Axg
 9rFIy5UBZnqnLcE6sooMRj09F/dFCkGhGzYzZCPOGHFWOfVS9eZXDZVyG8NOfpMJ
 9Qg8ZmrFgFMZ6TdqD0ybaHypweLyxmwVQpf0IbQWIIFjh3rP+Yy2lkEHXiWeqk8S
 Hs2GZ13xkWxqJzkUsn5z0WTgrcAPDQd2vAGMH/ePmg==
X-ME-Sender: <xms:jpq6Ygu9N8a9gPfECYos4rGMeAHFppqmNg74_vV6BgLTlv5IoPeIkA>
 <xme:jpq6Ytd7rZGNDWpasujYWx_30KlGAODNLOOQ3Mw2puKLGfBxL2p5RIGvRt1p-_RE1
 JG3hegt-GUuT7CjeFE>
X-ME-Received: <xmr:jpq6Yrw8tXfBxxqjk8KklKIUrwTXFg0gj9csPYSJzLLhIWdTQK1lDWVazr3Cd_61-KbYru9DzohoVYWP7xM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:jpq6YjMw7xaF5Z_7TNZeIcUOH_bUo2-5jVoqY8PRjqB71Kw6Uj3nYg>
 <xmx:jpq6Yg8cbY4OS1hmrgxkcCYTQTI505IzjIOCT0eHE6QAr_DVUIaSsg>
 <xmx:jpq6YrUIZQxV75l60tOoWy-JVqTnHAAWhwr7ojJgMP8WGnwxSzlYTg>
 <xmx:jpq6YkbPK2zDnIVq-TEIxs4Swa8K02wWRutQ-vG0lRTmTOrAYlIEfA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 02:07:09 -0400 (EDT)
Date: Tue, 28 Jun 2022 08:07:07 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: kbusch@kernel.org, damien.lemoal@wdc.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 4/4] hw/nvme: add new never_ready parameter to test
 the DNR bit
Message-ID: <Yrqai7Z8wNFlBDzS@apples>
References: <20220627114731.356462-1-niklas.cassel@wdc.com>
 <20220627114731.356462-5-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TUCrO7NW0XRH/l2A"
Content-Disposition: inline
In-Reply-To: <20220627114731.356462-5-niklas.cassel@wdc.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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


--TUCrO7NW0XRH/l2A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 27 13:47, Niklas Cassel wrote:
> Since we verify that "ready_delay" parameter has to be smaller than CRWMT,
> we know that the namespace will always become ready.
> Therefore the "Namespace Not Ready" status code will never have the DNR
> bit set.
>=20
> Add a new parameter "never_ready" that can be used to emulate a namespace
> that never gets ready, such that the DNR bit gets set after CRWMT amount
> of time.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  hw/nvme/ctrl.c | 28 +++++++++++++++++++++++++++-
>  hw/nvme/ns.c   |  1 +
>  hw/nvme/nvme.h |  2 ++
>  3 files changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 5404f67480..5f98d4778d 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6389,6 +6412,8 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
> =20
>          nvme_ns_shutdown(ns);
>      }
> +
> +    n->cc_enable_timestamp =3D 0;

A shutdown does not disable the controller (in the case of QEMU), so
isn't this wrong?

--TUCrO7NW0XRH/l2A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmK6mokACgkQTeGvMW1P
DenWowgArHaS2vtYX4rmPsllf95Drjyu2gibJXmHoARyeeHjkJ25HW3f8rhh1mcL
VIrEQTJw/hbHMCQBvcemV7ZTegnAV+WtuqoG8tHe0Ujs+Y9rVZLYvIyDUPWyfScF
sFMu7rvfH05siNYDPPT9npipYjYVMLmRQjr01fgQxdVG0uU7RtIu3GGoI8rlhykw
whmf30rbLtaVc6uSp0EwpMzWtn8BOt9aDK6HkX1ipRUNRrPaLfM4asqLIS/5htxh
y/qeUp7ewz5qfEXaGNY4TtQTbItL2TdBBcWnx+fiAnnTRPNwVSgymWkNsdH2l3re
oU/D9cTrUTYDkVrGkPHQOI18Y31T+g==
=Nj80
-----END PGP SIGNATURE-----

--TUCrO7NW0XRH/l2A--


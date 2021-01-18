Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777232FAB89
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 21:33:59 +0100 (CET)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1bDq-0001tJ-6n
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 15:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1apo-0001zo-DG; Mon, 18 Jan 2021 15:09:08 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1apm-0000ML-13; Mon, 18 Jan 2021 15:09:08 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 383035C01D4;
 Mon, 18 Jan 2021 15:09:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 15:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=/TrLic+yXAS+BjH5aJUT/TLAmMs
 uvF4gQdhCYQtzBig=; b=mgURls2PY7zM/iou5Be5JnvFQMOQplVHXlCs4IRNl2C
 0w/faDHpd43Pqo13LcS0XoM7jnhlfY8ygNUwDFYhCL+7M/GjbI8MRIuwjeKUZlNv
 +gS66z2EE54sgUux8AhqdanIBwpH8GLryLt8hT0LtY7qvpINxkJArnDIvg1AuAym
 UdNEkfG6W/4cbQr5nKMo6fV6Tq887ZO4cYbqCkSlEmllp+HDcHKBBqXXthVfFNne
 Ec72RB3UwY2kNCpWpe1lbPfSWOm5Yn7ThGBNhgQnRON+G+7+WQr08JN5LCye/sLS
 RzOvxOrCb/QmapzSabvCj/sLnlWK0bQanpPS0F5b9TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/TrLic
 +yXAS+BjH5aJUT/TLAmMsuvF4gQdhCYQtzBig=; b=dcQ74Vi7kwcnbEw7b8K22v
 1cp+LXYTSo3C8JrxVbSlAiip8G26fCutdmIIFSZBGaFNlkNhohdoiurOhWoKlG00
 t6bHg1PejvtrLGBv2vlyLYwMyfSS7NyEXX2jARt7pPD09F9GKRvZ1ZM/txO2ImNa
 6kjvH/d/oxbjSbpNfQ3UZstFA/iEp86wzBuWfxuRQXEiUpr5Q5waJJfOyUTs5THI
 zxTR9pNl+JvlNSkQOwF7NXVZiyVgCi8lMry2lq/USlgzl5AI3k8yFhn+f0bRb6by
 C5dyBTce1XQ9HumjzcwgGFChHHvGRW6bSljBC4osQKOTjKD4k7RxSpS6DFledI+Q
 ==
X-ME-Sender: <xms:4OoFYFRB0W4H43NrBkSgH-Y4RtlpjMsZmgf9rAYJV9oUxfd5rXRocg>
 <xme:4OoFYOxkMImKEg9cPu1FIr-e8NBTtvqo6kl1Cr-e_WSGU6YUbbLAr_3ya6xTUcDdN
 etxL6WJU5024-2BnFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4OoFYK1YN415aLAO_he46XKt1KHuKmGOPGGnSKixnnQyUKtbmTUmUA>
 <xmx:4OoFYNCbm-QPEvkcDOsd9dyFNDnRQpxFyE7nKdC0LITU6MTEgAKynw>
 <xmx:4OoFYOj7QWRuH0JkjnJXbvzcOl8bp-p5NuGIpZIcnlxKJgMUsOVizw>
 <xmx:4eoFYGf4fhXdt7lk_LmoN11XhrnG9W6acsd38KHW-QcwRRXWH_9SBg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 941DC24005B;
 Mon, 18 Jan 2021 15:09:03 -0500 (EST)
Date: Mon, 18 Jan 2021 21:09:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 05/11] hw/block/nvme: remove unused argument in
 nvme_ns_setup
Message-ID: <YAXq3TxHWJvYL8ax@apples.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-6-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/pLSaSt4oz9O4rNE"
Content-Disposition: inline
In-Reply-To: <20210117145341.23310-6-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/pLSaSt4oz9O4rNE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17 23:53, Minwoo Im wrote:
> nvme_ns_setup() finally does not have nothing to do with NvmeCtrl
> instance.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>

I also think this *could* be squashed into [04/11] without too much
strain on the eye, but

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--/pLSaSt4oz9O4rNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAF6twACgkQTeGvMW1P
DemCOwf7Bwr1aldaPL7KG1YIaez3o9bcxzHesCaqkYV+bgPdlkWZcyiZaSbJKOTK
r8PVARivckDUXutBb2DJIxFHxQKqYbpCzYaWj3gVsf35p0VQU+pZGkjOsE3El7dG
SvKlNdxPa/FqtNIL3Xb6ntNqdR1mDYgVh6QJA8de6IaES42u0Y23njcHMt8+EH1U
4DDs2boK7Lbxea/f3VoY0ZGFKZfPsFgkBvt8hrIy52dRqUWvgppjD5CCXVxHOGf9
DJ/ekeGTsfhTTdJ8U3L9ZCN1Kg6vo6xXsMgj+z4uVSwNwKDDGFjd0lYTbnY6d2BT
jZQboPtlW32C33KTXVjrPvhzBMBS9Q==
=t6Dq
-----END PGP SIGNATURE-----

--/pLSaSt4oz9O4rNE--


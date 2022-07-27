Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D183C5820FE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:23:31 +0200 (CEST)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbOE-0005n2-TP
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGb8A-0000Oo-Ny
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:06:54 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGb85-0006Og-8P
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:06:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CF3205C0113;
 Wed, 27 Jul 2022 03:06:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Jul 2022 03:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658905608; x=1658992008; bh=Zi
 B/W8PdZzdTzE6MAYKVHEbE7gRbGGOmKmQuMfURriE=; b=r2Jny1r3rLNluzc4LO
 UtA/OdYH0066khtIrgS4WWex2F/OImaFPiDiCkdvWA8WjN5v0CIhsJap6HCS1ilh
 S45mnlUq13pK14PYWDuPXBq1SCO2wQstvmBl9UkmIuGllevpuMuR60l1YAT6ugE4
 iSmD+WBtx1F9N+Gk8nMIWc9ieiwJBqPkIUCwqXcbest4p/97vn9AU2SADyYrbUhQ
 i32IGOEGX7uSvEyMJ9c2FTEJF/vzt2HFyGNOd3RPzQodjzhSwz0UV4iXuZD+QxI2
 lx91ts61LNOIvBMiutMUNZf2wdKftgJDU7IKUe7G69leAjp37Hcp2cVJMTHTBeQA
 RQMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658905608; x=1658992008; bh=ZiB/W8PdZzdTzE6MAYKVHEbE7gRb
 GGOmKmQuMfURriE=; b=hbFZ42mnpm63vfr+M1q/9NEdD+K7x0NO516NwsJybXbl
 O0J3KkNuZyixV690A8oUtNb8FBai/USGGE4d4hd+zkka+Oq8zYvtNecROQCn7pqG
 f/p89jKwiHQfnTCG7AfWnKKgczt4EB5WEaJTd0M7xP9+4WuaH//oQ9xBkr0glMvY
 K99WGN4zFOaD6qzCkAPxf7DfVOrKJjDN3Tb/PBgFqmjQbsVrwQMKMelOlGMLMYn0
 uUil9jrRPBZu6s98sFK1xpE3VH3JjMKn/K9IaPeTDZBmKDub41gRmMHcST3Ux4vX
 reTQqn46aoLUwq/U+ejeQ6q9gJIaPMWBL+CyfZwkHA==
X-ME-Sender: <xms:COTgYq9h9AzmQAdfPdJNGpnSgCdc94O-vL6siHHqZ3Dnxdpngiyqog>
 <xme:COTgYqvtGis6enVnwf_PEEjQVTkHeqNtNIH1UPlIJZKV94FyLDFR1BfGHU440u_eB
 Bh4dJhGXkCltC6Mt5Y>
X-ME-Received: <xmr:COTgYgAsA-e9PSYIldahJSUuJuhVBN1mEic7AzGJrmaH4n5wb6P0mho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduuddguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeetgfdtfefhueeigffgffekffekleehleeuieevgfefvddthfeiveegfedt
 uedutdenucffohhmrghinheptghtrhhlrdgtfienucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:COTgYicoxQpvnKPiv6f2Cb3vn3UuQ3992OQmUHsD39_96iOzCLuCKg>
 <xmx:COTgYvPmPMrhE81eFmLexgGxkIJ-AePbGJooAmtrdAEgXUJaNVoARg>
 <xmx:COTgYslDV_bNkOoeSqMbKetM4O8-Iq30KvC1yaWQAVqiKYjjePtVEw>
 <xmx:COTgYq3Qe4p2ogX-htMDvxaPEgKG_9JkcwZg00caf8YO3K3jxkgzKQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Jul 2022 03:06:47 -0400 (EDT)
Date: Wed, 27 Jul 2022 09:06:46 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <YuDkBkrqXaosJbRM@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <Yt8DWWg8qPLxL0fk@apples>
 <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples>
 <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
 <Yt+xpMzwRWvn3QqR@apples> <Yt+9Spzi17LRRexQ@apples>
 <Yt/O8+n1pf3SRR7e@apples> <Yt/Qs5PelXjX8E1v@apples>
 <Yt/ZKVHjSTTt08MV@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j01b6PcDziecpSGH"
Content-Disposition: inline
In-Reply-To: <Yt/ZKVHjSTTt08MV@apples>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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


--j01b6PcDziecpSGH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 26 14:08, Klaus Jensen wrote:
>=20
> Alright. Forget about the iommu, that was just a coincidence.
>=20
> This patch seems to fix it. I guess it is the
> event_notifier_set_handler(..., NULL) that does the trick, but I'd like
> to understand why ;)
>=20
>=20
> diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
> index 533ad14e7a61..3bc3c6bfbe78 100644
> --- i/hw/nvme/ctrl.c
> +++ w/hw/nvme/ctrl.c
> @@ -4238,7 +4238,9 @@ static void nvme_cq_notifier(EventNotifier *e)
>      NvmeCQueue *cq =3D container_of(e, NvmeCQueue, notifier);
>      NvmeCtrl *n =3D cq->ctrl;
> =20
> -    event_notifier_test_and_clear(&cq->notifier);
> +    if (!event_notifier_test_and_clear(e)) {
> +        return;
> +    }
> =20
>      nvme_update_cq_head(cq);
> =20
> @@ -4275,7 +4277,9 @@ static void nvme_sq_notifier(EventNotifier *e)
>  {
>      NvmeSQueue *sq =3D container_of(e, NvmeSQueue, notifier);
> =20
> -    event_notifier_test_and_clear(&sq->notifier);
> +    if (!event_notifier_test_and_clear(e)) {
> +        return;
> +    }
> =20
>      nvme_process_sq(sq);
>  }
> @@ -4307,6 +4311,8 @@ static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *=
n)
>      if (sq->ioeventfd_enabled) {
>          memory_region_del_eventfd(&n->iomem,
>                                    0x1000 + offset, 4, false, 0, &sq->not=
ifier);
> +        event_notifier_set_handler(&sq->notifier, NULL);
> +        nvme_sq_notifier(&sq->notifier);
>          event_notifier_cleanup(&sq->notifier);
>      }
>      g_free(sq->io_req);
> @@ -4697,6 +4703,8 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *=
n)
>      if (cq->ioeventfd_enabled) {
>          memory_region_del_eventfd(&n->iomem,
>                                    0x1000 + offset, 4, false, 0, &cq->not=
ifier);
> +        event_notifier_set_handler(&cq->notifier, NULL);
> +        nvme_cq_notifier(&cq->notifier);
>          event_notifier_cleanup(&cq->notifier);
>      }
>      if (msix_enabled(&n->parent_obj)) {

Jinhao,

Do you have any comments on the above patch - does it make sense to you,
considering the effort you've done into researching how virtio does
this?

--j01b6PcDziecpSGH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLg5AMACgkQTeGvMW1P
DenWNQf9FAmuGay131j1Rx0LOhwflEQBKns2gn8OM1ORCqlFK2Muv5iFLhF6V//o
bgX4cOogBNHsYYJ5mUXmPEV0liEPJ1fNr/7sKDQpdBMqn5IMNpQCw2jPOigBQR89
EE8Vixxf9G608+G6j32HUfFMkd9R6TIaH7/WSjkEKJ7Zfy3kPCFCUWBPLREmJuz2
M0VSWx9rEH230xEn+AiKXqgyt5Dq/+yffYQlLQdvugB61tGVA9Z1BbtZjcQXDO7N
aNy6M0L98Zq7mhKmws+E2c33YWm1UI/PjZGclOuztuTo6/nIGyw6Sj0oogkh8uy6
e5SR9jBWdqagSF3f1wkFWY82SsKpxA==
=kwSJ
-----END PGP SIGNATURE-----

--j01b6PcDziecpSGH--


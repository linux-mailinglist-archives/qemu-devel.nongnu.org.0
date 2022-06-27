Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA5755BBBC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 21:37:14 +0200 (CEST)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5uXp-00048F-GB
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 15:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o5uUP-0003DQ-FX
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:33:41 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:32979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o5uUN-0005cT-1X
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:33:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 415503200990;
 Mon, 27 Jun 2022 15:33:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 27 Jun 2022 15:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656358415; x=1656444815; bh=KP
 E+yFd4aaHg5kFLdkubu8XUZRFl2iUNq3tMv432i68=; b=HP3DuGcZHns7V/iQ9a
 98vRAG+YognRuJGL0EcqOEY9v/GA3M7edU+p+4+WoXKov/EFige6T5kLdDCSAckt
 mxS9J8ZGTej4pVr3nOYP/2iqXG5W2BN+yL3WE/vSwkMRvyRc2emRE8gkKRMhYMUX
 u3IbJdGGZaRtL5gQ+iwbEE8daUXJzN3jRNx1DfDyP22/NEC97aFdiIlS/SMsClb7
 LQcvM6d5s4uhSZZsgfInI+8U4kWqqCSr26sPJHu5VgXFZLy9vNFLKllPRIZycXfJ
 gU4yBn56O8M0UYbXeJ+x4KrVLKHF2lLTg80GcMJqyEwhw8CC9lMl5SSlXNS7R7mQ
 Q6QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656358415; x=1656444815; bh=KPE+yFd4aaHg5kFLdkubu8XUZRFl
 2iUNq3tMv432i68=; b=HzvMfgnXX/4ravAmexnHaTRw3CJAAJXmaUmSOokRXxQV
 67nxnE9N2+PoWJd3jsNPV+KJ6CUI7S0H+mN0jG54bM1boEIZLuAO7wx90MkKCmg4
 Jm/yiBAEGqUvOmRL6C/7sGSP3QmtANuZrD5TSZNqtKWs0fy3kUKlgBbuzY3PdDdg
 eONh8zZle40PXlK7VxVCC4ZKOxaRj8FIBXo4OMO1qZs2vpmy07Kkntd7EPbz6np5
 v1ZPXcOf6z0739fZdHO+gFk+4CbzBALtH9nZvzvyaY42h1SkjGqioO1zuLsE95Tc
 4jvNiUmyY5eebfOBrPf0pTQYUL0rGO7/T+fMjVUQLQ==
X-ME-Sender: <xms:Dwa6YunKEx4WDOBeLcaz8mQAT6E3StJ2PnouHAGTKFKLXYKFR8ubAA>
 <xme:Dwa6Yl3XfPtm1OlRO8RxaScqobeVkDJo_yvsdS82HoHJUGw_SiuSf524jGggnz9ga
 eMUR_8oalYDtJBI-xw>
X-ME-Received: <xmr:Dwa6YsqYwWRI6TqO77MyteXyMzetXX09xG76mVMCWtstt-1Jv7-gA_LcNbHxoDAUJZJFXHe6GNRwAC8dMwI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Dwa6Yin2ziDhhT2xiwkLNzmM1R3mvTAo1mc-28d4XSCSGjgaEu2cmw>
 <xmx:Dwa6Ys1pV6FHZGViEmw4aHqVOundjUDPoGI95sW5qX5xrBVd4UXrvQ>
 <xmx:Dwa6YpvWKAuEcDKC1xWxL1psGBBRq3wL1GNUYridrhsSpCrt-vEmUg>
 <xmx:Dwa6YqADZ3GmxG555MqCVkl1aEq9JlxJXm7-LVdGLIeTM79nlp4hFA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 15:33:33 -0400 (EDT)
Date: Mon, 27 Jun 2022 21:33:31 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YroF+BS96Bd8b1Xq@apples>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <YroCVQvTq+z/mgc9@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XdoQ7W6isZ8ts4P7"
Content-Disposition: inline
In-Reply-To: <YroCVQvTq+z/mgc9@kbusch-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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


--XdoQ7W6isZ8ts4P7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 27 13:17, Keith Busch wrote:
> On Thu, Jun 16, 2022 at 08:34:07PM +0800, Jinhao Fan wrote:
> >      }
> >      sq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq=
);
> > =20
> > +    if (n->dbbuf_enabled) {
> > +        sq->db_addr =3D n->dbbuf_dbs + (sqid << 3);
> > +        sq->ei_addr =3D n->dbbuf_eis + (sqid << 3);
> > +    }
> > +
> >      assert(n->cq[cqid]);
> >      cq =3D n->cq[cqid];
> >      QTAILQ_INSERT_TAIL(&(cq->sq_list), sq, entry);
> > @@ -4615,6 +4631,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtr=
l *n, uint64_t dma_addr,
> >      cq->head =3D cq->tail =3D 0;
> >      QTAILQ_INIT(&cq->req_list);
> >      QTAILQ_INIT(&cq->sq_list);
> > +    if (n->dbbuf_enabled) {
> > +        cq->db_addr =3D n->dbbuf_dbs + (cqid << 3) + (1 << 2);
> > +        cq->ei_addr =3D n->dbbuf_eis + (cqid << 3) + (1 << 2);
> > +    }
> >      n->cq[cqid] =3D cq;
> >      cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
> >  }
>=20
> I just notice these address calculations changed from previous versions. =
What
> happened to taking the doorbell stride into account? Spec says the shadow=
s and
> events follow the same stride spacing as the registers.

The stride is fixed at zero.

--XdoQ7W6isZ8ts4P7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmK6BgoACgkQTeGvMW1P
DenRIQf/Yalqyp6I4bnsqSb15IuJIV1Udnn/SrR+yMfLNx6STvtqZfii7fph7iOI
2nRlyXUs25HCTAKreCIzCj8zbT6UcCXUE6LRWmJ8+HfvmOTBNPE1O4Y5O4aAEMiF
JPGjAh/HFwChwnmnL1k/VPQG0aeB4c9fJOeRj6ZvqgaXwmXw2mTkzNCcakyzegN8
RzXy07mYzmaL15gLiR0phuOtwggJWFwZAcHMQmefgrEFIsPExpwgrsOF2gWjOqUe
Loqr2gx2v7MDfOeVSLNykZVTdx8/ZgVbXUaDVIlzK1LQC8wSyj1vl1MUNn6cXwwt
4xbKRHfMrrkWIASQwLv/Mcw9Il17PQ==
=KFnU
-----END PGP SIGNATURE-----

--XdoQ7W6isZ8ts4P7--


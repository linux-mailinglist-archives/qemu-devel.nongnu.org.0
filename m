Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74BA646C9C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:20:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3E0p-0000Os-Lg; Thu, 08 Dec 2022 05:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3E0l-0000NX-Qc; Thu, 08 Dec 2022 05:20:15 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3E0i-0005Ld-PN; Thu, 08 Dec 2022 05:20:15 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 409A55C00FE;
 Thu,  8 Dec 2022 05:20:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 08 Dec 2022 05:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670494811; x=1670581211; bh=2D
 HMiRN/7MEssGnu73tlz1z/O5DOzR5KDi7D+mtBB34=; b=o4Y2EpDdAwScaACHVS
 hpkf6fGVdy58j8pe7WJSNp0+iDEJ/M3G7bKX/meQC1i9E7Qyh4xesQz2HaAQ0hC5
 hhpRzScdErBdsDqEpEYtOVaBxEajsqjcr7yA8YH1Ystu9XA+QnjKTa+6rJMLxPFF
 +pGnAMVOlie9DwJn1HRtqyg33KrfIUyPq8Bhj3C2/xw9BZ6xoqHVfoB95NwTzX84
 vNPRYilQ7pr2PyYjC11ju0FDoNlO0YA4YPxjbMLbDj+q3C3XA1Y2F+pIqwCAfxmc
 y5vNZLgrgCXq419tPF9JPl5uJzYZh6mpr22VJCN114adPvlA2cCzK2YjwhLBF9FZ
 WGvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670494811; x=1670581211; bh=2DHMiRN/7MEssGnu73tlz1z/O5DO
 zR5KDi7D+mtBB34=; b=YhcFceeYQR0G+k/gtf6DcffqIHqpFQmku+LnfXbYMcJm
 TTCuN5yiO765iEyefrasX9NZ5OCeu3U6R1ZKscgYtfd2zEpbRBTMwJwQhEbi7Op+
 DElR/z8/R/A+UqgXOAvKLhgEf7KrOxh7ZMlGjMcl7ha6QP7fniJY50+TnQsQ/ulW
 qk61Hjv0t+I4ynIzfM8QxkpkeKbRBE6PKKfa0GXtQ1HHW30J9cZt4cnjvOvY/NOM
 wOHj3KNiroxuOv4WgefjvDmPQvBMzWW7+gs8ObR3fb4bkHnbYMFnJpnI/wGQgh2i
 JvFR0Vt0zWZVvzb6G2YFNptW1f4ljqhnenwdbNMxpg==
X-ME-Sender: <xms:WbqRY08sFayTmULdMC7ETAXO7axu1v0OBjCDgp9aqd_IBVDL0JV-0Q>
 <xme:WbqRY8vznO3GPZDmcSEnfPxXOVS_5Zf2rfLikIjCzwvoUeLmo9VgRQwnohhchYjjE
 QioonC8vZjdeXpVizA>
X-ME-Received: <xmr:WbqRY6CHYO9n7Mx7krERasP-HjKhWrUOa__ADchZbud9ufTzfCQRuEu8qJrgvlMEZDDN4TKR1r1Wo5ta0S5sMsM7w7wQ5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeffuddvhfehjedugfeijeeuieelgeevuddvlefhkefhgfettefftddvkeevieel
 feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:WbqRY0frVrIjUzO1jglQNb_NUwzfvYNmrcZWYOizdc60dI6a9s2isA>
 <xmx:WbqRY5O7G7oOU_aYaWC7wMTKclyEFyG5k9ooZb7g-vuBQqwSQDUl-Q>
 <xmx:WbqRY-mLvw4Fc0E68MQJzZhSGDrKvhT_Aha3iCB2Ec10q5fUZlOW1w>
 <xmx:W7qRY1BD8jpxxuNsBOSIOhwNcXNflz6vaQv4irtw7u2NA5ECItQrbQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 05:20:08 -0500 (EST)
Date: Thu, 8 Dec 2022 11:20:06 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 1/1] hw/nvme: fix missing cq eventidx update
Message-ID: <Y5G6VsppwqDWmkc/@cormorant.local>
References: <20221208082955.51732-1-its@irrelevant.dk>
 <20221208082955.51732-2-its@irrelevant.dk>
 <10df1dba-f955-f3a7-7f53-135db63238b0@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U377ubMCkex7Phkt"
Content-Disposition: inline
In-Reply-To: <10df1dba-f955-f3a7-7f53-135db63238b0@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--U377ubMCkex7Phkt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec  8 11:14, Philippe Mathieu-Daud=C3=A9 wrote:
> On 8/12/22 09:29, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Prior to reading the shadow doorbell cq head, we have to update the
> > eventidx. Otherwise, we risk that the driver will skip an mmio doorbell
> > write. This happens on riscv64, as reported by Guenter.
> >=20
> > Adding the missing update to the cq eventidx fixes the issue.
> >=20
> > Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support=
")
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/nvme/ctrl.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index e54276dc1dc7..1192919b4869 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -1331,6 +1331,13 @@ static inline void nvme_blk_write(BlockBackend *=
blk, int64_t offset,
> >       }
> >   }
> > +static void nvme_update_cq_eventidx(const NvmeCQueue *cq)
> > +{
> > +    pci_dma_write(&cq->ctrl->parent_obj, cq->ei_addr, &cq->head,
>=20
> 'parent_obj' is a private field. Better to use the QOM accessor:
>=20
>        pci_dma_write(PCI_DEVICE(&cq->ctrl), cq->ei_addr, &cq->head,

Ah yes, of course. I think we have a couple of other ->parent_obj
accesses that we should fix also.

>=20
> > +                  sizeof(cq->head));
> > +    trace_pci_nvme_eventidx_cq(cq->cqid, cq->head);
>=20
> Surprisingly the trace event format was already present in Jinhao respin.=
=2E.
> https://lore.kernel.org/all/YqsIh+OUcWnHU3zp@apples/T/
>=20
> Could we move the event before the call?
>=20

Makes sense.

> > +}
> > +
> >   static void nvme_update_cq_head(NvmeCQueue *cq)
> >   {
> >       pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
> > @@ -1351,6 +1358,7 @@ static void nvme_post_cqes(void *opaque)
> >           hwaddr addr;
> >           if (n->dbbuf_enabled) {
> > +            nvme_update_cq_eventidx(cq);
> >               nvme_update_cq_head(cq);
> >           }
>=20

--U377ubMCkex7Phkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmORulYACgkQTeGvMW1P
DelwiAf/TrGUFBt2DMTrZCHQLmg+T8rcXfeJZvwaQdE1mNKue4APSCGNCmN+eG2u
ViBp8wPnp3R3mnUqPU+jZ8iTuZGYaNoZpLzmWy2tH3vrKKDtC4VI9Ziavl1U4zNB
dxNkvIJX2vWLIaRzgdFlWKFxK6le8+97GY3oi7/t8CtmbeI4/cEVZX5G02m6AzqW
Yu4cS1VqlHKsH62qecdmDEN7DfsWzZ2imAjOcA4+GDhcmAjwp4QYWBIOrcVeoQHl
2WFzU2s/8BWHNGXQegkjUX94q1sGi4NKveePsLBg603yEh8pMhn4/79ECRzSrv9O
2G0rLZHJkIsOuwQxk5nndwvLXeMAXQ==
=nXxb
-----END PGP SIGNATURE-----

--U377ubMCkex7Phkt--


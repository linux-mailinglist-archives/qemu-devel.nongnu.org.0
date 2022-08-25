Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F175A0FD9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:03:36 +0200 (CEST)
Received: from localhost ([::1]:41630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBaB-0005ar-36
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRBTd-0000Mf-UB; Thu, 25 Aug 2022 07:56:51 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:44473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRBTb-0000om-1K; Thu, 25 Aug 2022 07:56:49 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A434C3200B80;
 Thu, 25 Aug 2022 07:56:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 25 Aug 2022 07:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661428601; x=1661515001; bh=tT
 ariQ41D3RBvUU9iUEYcLg/GWAy2Ch/bwy28bIdnHs=; b=sTQWsbyccTlUxBw4tU
 QTgpx/LIWaL4byvIEDGhROCFmoR+2IsFXQCWq2j7/LGkhKdFHxMS627zVpNTT76L
 7b+L7C43HYCMktXOQ8xToGkasxboZyxeBQN2fr8TEyFWyk+bdhw95S5NZAawXhyK
 q/00t5prhSjM1pHgZrGXwJp3L2Y0I6YRtmgpzbwANsvcU1ItZgQvt5thUXxdqQgV
 fTuwp85ffsLYqCtebxzfr+Z4V7I76zHkfOOtPkw1DAezSTjO/G6z0XGFN/2Wz1cR
 OzyE9PAWn0dwGFXesYLQSOJJt0jiXdwWZm79/rD4hB2G5HI8612vBq0sHzmr13PF
 7GmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661428601; x=1661515001; bh=tTariQ41D3RBvUU9iUEYcLg/GWAy
 2Ch/bwy28bIdnHs=; b=BiNwhtlM09S6X/Z6luRX0Ii3lacJLtOCY9AjnRnvSwHC
 NZHSmTrw4eDI9YSe3+ifbVdtAassyIUj1evg1ctKMMCRaFOzvUrooDnWJKZDJx2m
 jMYKCgShy6VVjc6bL2vJMC+JrQuoIzlh1CqY5qpBX7KfwGLKAXfd3QY9vjC70qdK
 YGsz2geM/Qu/vfAj8q7F1X3LsIDa43qV74OKzrmM6VlYrh1qAtNouE0I9CjmCEIC
 0TyPIq6rVSIRNiqJY8bpxIBW8DzobaWUCJUtOLI6sQy07BeX5kWor82S1KTf6K0D
 rFnTFkWnoXJ7/ufsPY0SlhuVpgSBp1yC3h6iNM6oQw==
X-ME-Sender: <xms:eGMHY_TeaeDAHoXuNdscbJNKSjRIMfK36zJbIjLaHcQa0YxQ7Q83eA>
 <xme:eGMHYwxCSRQRJaGVAiz_EpIeNcTZmWiY4IvjOfZQubOEgdmq3TtlbYbUhew9RlogO
 X_wexXSd6FsFK8b8HA>
X-ME-Received: <xmr:eGMHY00_-LbjgIGrqZbMoyNkneEvrYAo38Njr2kDNH7rq2m6qZ7iAZY7mW_YrIpDdd7uEAPgwAxi7p0fZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeekieffjefgueekhedvgeefueehhe
 dvgfehleekudfggfejveevieehheelheejudenucffohhmrghinheptghtrhhlrdgtfien
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:eGMHY_CNcVapcu7bub-739mF1iPYyGvnj-k8F3gC0_61Lzpyy-yfdg>
 <xmx:eGMHY4jTYgkO8GjFIurYyDfn34JAHwjzcZRsZ3xD84SZB2JTtIbA8Q>
 <xmx:eGMHYzrdZjucfvv6fincI07hrJFzRRXrKZFPEnW3Lut9slqxNoaNcw>
 <xmx:eWMHYwcdzUEx8EP5eus9xXSeJy6ugnN7HmjWUoNqB5qJttaojvwUAA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 07:56:39 -0400 (EDT)
Date: Thu, 25 Aug 2022 13:56:37 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 1/3] hw/nvme: support irq(de)assertion with eventfd
Message-ID: <YwdjdZye1L/D+29G@apples>
References: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
 <20220825074746.2047420-2-fanjinhao21s@ict.ac.cn>
 <YwdB//iV62uWeqJK@apples>
 <7e5708c6-ffad-d867-a232-85ce55ee60b4@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I1acEbcvmlLJ3Sjv"
Content-Disposition: inline
In-Reply-To: <7e5708c6-ffad-d867-a232-85ce55ee60b4@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--I1acEbcvmlLJ3Sjv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 25 19:16, Jinhao Fan wrote:
> On 8/25/2022 5:33 PM, Klaus Jensen wrote:
> > I'm still a bit perplexed by this issue, so I just tried moving
> > nvme_init_irq_notifier() to the end of nvme_init_cq() and removing this
> > first_io_cqe thing. I did not observe any particular issues?
> >=20
> > What bad behavior did you encounter, it seems to work fine to me
>=20
> The kernel boots up and got stuck, waiting for interrupts. Then the reque=
st
> times out and got retried three times. Finally the driver seems to decide
> that the drive is down and continues to boot.
>=20
> I added some prints during debugging and found that the MSI-X message whi=
ch
> got registered in KVM via kvm_irqchip_add_msi_route() is not the same as =
the
> one actually used in msix_notify().
>=20
> Are you sure you are using KVM's irqfd?
>=20

Pretty sure? Using "ioeventfd=3Don,irq-eventfd=3Don" on the controller.

And the following patch.


diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
index 30bbda7bb5ae..b2e41d3bd745 100644
--- i/hw/nvme/ctrl.c
+++ w/hw/nvme/ctrl.c
@@ -1490,21 +1490,6 @@ static void nvme_post_cqes(void *opaque)
             if (!pending) {
                 n->cq_pending++;
             }
-
-            if (unlikely(cq->first_io_cqe)) {
-                /*
-                 * Initilize event notifier when first cqe is posted. For =
irqfd=20
-                 * support we need to register the MSI message in KVM. We
-                 * can not do this registration at CQ creation time because
-                 * Linux's NVMe driver changes the MSI message after CQ cr=
eation.
-                 */
-                cq->first_io_cqe =3D false;
-
-                if (n->params.irq_eventfd) {
-                    nvme_init_irq_notifier(n, cq);
-                }
-            }
-
         }
=20
         nvme_irq_assert(n, cq);
@@ -4914,11 +4899,14 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *=
n, uint64_t dma_addr,
     }
     n->cq[cqid] =3D cq;
     cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
+
     /*=20
      * Only enable irqfd for IO queues since we always emulate admin queue=
=20
      * in main loop thread=20
      */
-    cq->first_io_cqe =3D cqid !=3D 0;
+    if (cqid && n->params.irq_eventfd) {
+        nvme_init_irq_notifier(n, cq);
+    }
 }



--I1acEbcvmlLJ3Sjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMHY3QACgkQTeGvMW1P
Dem8lwf/UkP70ys4oTkaMijI3YSrPLKXURNoPZIdYp68tBq+7P8HweqVZcegz6ul
A5B8WaI+WvDnp8pthzSulgm7LgdrQDppT+NRgZFZpw7HScUqgHigLyfAuVhwbOKC
KOBVbsPGEm41M2XwY+9IflXBfMoEjgq3eqFSAKVJb/xGGaAqiagnWsMM9tgZGJS3
3nrVGUZXQNUYGHApZ/UNBbFa88F51k2Yqb8WwscvrQTCyeOfityX63FQ5pMT2Hem
bCdv/HHuiFbKL75zfMuAt0us11S44qBieiYk1iGEx+ZFgOEE35PWG7+rPlafu0C5
S6TRHsaga0Aam+mcLbJv7xqnZqDVYQ==
=zjcy
-----END PGP SIGNATURE-----

--I1acEbcvmlLJ3Sjv--


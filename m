Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198315A0CDC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 11:42:40 +0200 (CEST)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR9Nm-0005vr-Vt
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 05:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oR9Fd-0001GM-1K; Thu, 25 Aug 2022 05:34:13 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oR9FW-0000rK-Ve; Thu, 25 Aug 2022 05:34:09 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8FC57320090D;
 Thu, 25 Aug 2022 05:33:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 25 Aug 2022 05:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661420035; x=1661506435; bh=HN
 Vxfa/aC98XMKwYXeF+yM1n+dWk4clKffjyu/cfh/Q=; b=aPyJOMVICtBF2Ku/+c
 V+SYOPbhjhpE8s2OSvtyLFyUxy/p9anu1gLQcw1eccjHjkH8zzPZmfTk1t4DD85o
 iOwiy2SMzNHV694Hgc5j+1f+0gzJF+ktmJuomPWBmqekcXW7sl5HguxwaB5YfkZN
 vcoJf3cTInoGvLQcCfVzp1mz+uxAGzXWwZZLNB6WlnHjOW7mctH9rW3z0NfaAw6z
 3BgKzo1dAIn7KXM1Mx7P/x+DHksZV1j/0X3sXGokdP30ZCEMk2FqehW0/qyYxeTD
 h+zY2Go5J7svlZBuOVuIwHSgslL/q+JijDv6WTI1eUIgIUgJKAYvVC8ZukpFBrLR
 ZHsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661420035; x=1661506435; bh=HNVxfa/aC98XMKwYXeF+yM1n+dWk
 4clKffjyu/cfh/Q=; b=GqYQ7QYnY6p8ntWAZ0c0Sau2KJAVZF+K8tX+CPKk/kQk
 SMNnLAiRFocBgRlTtLFfC2WFVetkuj4GjtNw8wWgcEp8z/mafmKlLPzQtCfNpJFc
 gYeAjOLWUgBk6rs8WMx1Ondcz6YOSo4vTP2K/enRk7XBRq5hkCZDL9NjEAfZqYx9
 pl47anAbd3dPchGyA2emhV+qYJRDfxcbczemhdkzBV0c7XYEhtIru8Rhc0D9MZI6
 dz+FHq3lAfZn+bYNRSn/YNUfuX/b7e14JwhI6cUGMTOy5OSe7R4nPltj4zi76Ojq
 nBQx3Z037jNcKRpzdmg2gvJezVVH2lOhOGv7lY7e8Q==
X-ME-Sender: <xms:AUIHY-hFCWccootUyWhoFcwtBEkQxzV4ic4c1xeu2c7toLFUVM6QrQ>
 <xme:AUIHY_BPlx1lMx5mxqAVlc1RmsbtWp7nWWXVW10XrZy4oqcWh05J1G24ka_rcoZDG
 1rVCHCXcM5bohyrX_Q>
X-ME-Received: <xmr:AUIHY2EB31PXnbBuY87J1YKThL2yRmAOhnxbmJ45YqxdRIKmTVVz--WqsH3-RR-fUrMDZSXdaDQoB9o3TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:AkIHY3QogLlb5KEyAMsjBNKQNMcthYvpKXOQTAyXRTjD4wbfE52aHw>
 <xmx:AkIHY7w1HT_BrgZwuBeaXtiw88n764rkItNVoJWAS_dpAEbtmhsT6w>
 <xmx:AkIHY15l7S9_U4gkBiCiLisf2K-aMCZiyYZfMrKVwtsP9gCV5Ny9Mw>
 <xmx:A0IHY9uCCJyCa7mePQuny_C0mbzSor5ZTvXqZCdfHYTXsS9TIgtGvw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 05:33:52 -0400 (EDT)
Date: Thu, 25 Aug 2022 11:33:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 1/3] hw/nvme: support irq(de)assertion with eventfd
Message-ID: <YwdB//iV62uWeqJK@apples>
References: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
 <20220825074746.2047420-2-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ycSIJHv0GabUe9eM"
Content-Disposition: inline
In-Reply-To: <20220825074746.2047420-2-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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


--ycSIJHv0GabUe9eM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 25 15:47, Jinhao Fan wrote:
> When the new option 'irq-eventfd' is turned on, the IO emulation code
> signals an eventfd when it want to (de)assert an irq. The main loop
> eventfd handler does the actual irq (de)assertion.  This paves the way
> for iothread support since QEMU's interrupt emulation is not thread
> safe.
>=20
> Asserting and deasseting irq with eventfd has some performance
> implications. For small queue depth it increases request latency but
> for large queue depth it effectively coalesces irqs.
>=20
> Comparision (KIOPS):
>=20
> QD            1   4  16  64
> QEMU         38 123 210 329
> irq-eventfd  32 106 240 364
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 136 ++++++++++++++++++++++++++++++++++++++++++-------
>  hw/nvme/nvme.h |   4 ++
>  2 files changed, 123 insertions(+), 17 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 87aeba0564..6ecf6fafd9 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1377,8 +1448,25 @@ static void nvme_post_cqes(void *opaque)
>          QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
>      }
>      if (cq->tail !=3D cq->head) {
> -        if (cq->irq_enabled && !pending) {
> -            n->cq_pending++;
> +        if (cq->irq_enabled) {
> +            if (!pending) {
> +                n->cq_pending++;
> +            }
> +
> +            if (unlikely(cq->first_io_cqe)) {
> +                /*
> +                 * Initilize event notifier when first cqe is posted. Fo=
r irqfd=20
> +                 * support we need to register the MSI message in KVM. We
> +                 * can not do this registration at CQ creation time beca=
use
> +                 * Linux's NVMe driver changes the MSI message after CQ =
creation.
> +                 */
> +                cq->first_io_cqe =3D false;
> +
> +                if (n->params.irq_eventfd) {
> +                    nvme_init_irq_notifier(n, cq);
> +                }
> +            }

I'm still a bit perplexed by this issue, so I just tried moving
nvme_init_irq_notifier() to the end of nvme_init_cq() and removing this
first_io_cqe thing. I did not observe any particular issues?

What bad behavior did you encounter, it seems to work fine to me?

--ycSIJHv0GabUe9eM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMHQfwACgkQTeGvMW1P
DekXPAf/UNeFr2IxLX/QLaUpYG7XDanpXQkxe5Aby4v41UPfGckxuh4QXbYrD+Cr
Nkkz8ZWub+KY9bBjqx0JAC7mH6VuYwOO4ITtN5SRa+3nT8F+IuJ1Ck0MEjBl7c9F
ywNajfkSWsa/Atj40Cz0n6HtdEHu9SjIPcKAAgczWPtuBGz6ZY2iwJjPJUYCt8He
7y9eCd+4AWJzC4XVL5did3kSeD3DpUAHOiaNzxfIwd/SWHjR7r7I4xIW6943YXKD
ogN8Y6cTlAJdE9z2KryUOo1aclJOQlQmm0p1nRwRQACa8nkNZmpVgaSy2inSSBwI
9iDsLhW4vLt+BFYvwBaUtgIPSzlHKA==
=A/Ad
-----END PGP SIGNATURE-----

--ycSIJHv0GabUe9eM--


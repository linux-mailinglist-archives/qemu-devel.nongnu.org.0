Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A6731714E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 21:26:12 +0100 (CET)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9w3u-0007Ai-VY
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 15:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9vxv-0005Vq-VA; Wed, 10 Feb 2021 15:20:00 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9vxm-0000QT-LO; Wed, 10 Feb 2021 15:19:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F26A5C0054;
 Wed, 10 Feb 2021 15:19:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 15:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=v9NKnMle0LYjvBeFdHcmwCHd54g
 lSLY+TVjbjsVW8zc=; b=a/RdDjIZr6wzNZK3CKJlIG7jaQdm18i3V2uxBcJodGL
 OkGpAMqTN3TdrlDcCyf91J1O4JJLd9oP5/2sCIKVcSzjD1/nDS86wMA9df9eQ3zE
 ymAsxcDYUmGl396dTW7ZjeYl3fxmBnFpXmN97B/qLQizrrU78QYs7AFBubsDVMW9
 L2bNmi5+lcpNTimiYMOHU3KjB0MWw46lTPSiLUjxnUAUsMFoiv+OtYxQpp4jFPmG
 0MZ3E4/4zK1fdDq/hWgH4uxcjreleVlYVOhUGYCcJtDmqdNc4b1rAl1ZbhZ0i63p
 WOFfjYJ8Jf2c5leGVSu3zws+1ZDJCRX0K7UL6Lit+9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=v9NKnM
 le0LYjvBeFdHcmwCHd54glSLY+TVjbjsVW8zc=; b=tCodTDQDJ7OZe1TpnHr5vq
 hLMrlRcu/OZnlPDaHv9H8wJaz4+Eh4Zbd/9pZWvD+539oqFNGEZpEbPGtyM9rpte
 PhPn7q44Ptkw/0B1Thp1mIq02vLYsMiSjns5rzEW8jJZ2mPkcXE5nzSj9YRV7sCd
 kBQOsW3GzjYeIEY27rf5rS8DAd1b7vmkV1sK0eQXmp21uJo44ZbXyX/5S8tups8K
 DK50S4YCswg3UL4XqiCJbPamPbMHNQClhYUlXBMBGjueU0UE2om9Hd9doSPaDHoL
 Z+PxxMeav6ySo/dNui1EldVRfR+r3fiCt1S0Jh1r5iXfcm+WlkZX8XSC6SqHNQug
 ==
X-ME-Sender: <xms:4j8kYMdQ8wiX9LK4Aveku2ZhVfgygrr4j10QcPQL0yz7sV6wmDe40w>
 <xme:4j8kYONKlrtUIU0gAh8skTthxSc08TCqT02AKkCKmuSnEUCoL6Qnt_A6mfSc-G23Q
 xSM9bvSksaNottkVn0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4j8kYNgs6sBPDrfLgMJcQNbwVm6i1ke3SGcoxakU45rFKjs46lcvVA>
 <xmx:4j8kYB-UAnRVqA0txbVKZ8lJbAP1KWb5CfduOLRUbhnVoDz0k-JDCg>
 <xmx:4j8kYIuvBGEHbJO8FD-0sn5gFsZQUNcCpW-wKvQzvW7QffJIIMk75g>
 <xmx:4z8kYCX7NnVKZuH0_oLOVIzK-Cm7LWjlrqfyuCIom32BJ-m-dtOWVw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 772841080059;
 Wed, 10 Feb 2021 15:19:45 -0500 (EST)
Date: Wed, 10 Feb 2021 21:19:43 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH 1/3] hw/block/nvme: set NVME_DNR in a single place
Message-ID: <YCQ/38kzPxdWDPqG@apples.localdomain>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-2-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Yk8p9lg/dSp84xaf"
Content-Disposition: inline
In-Reply-To: <20210210195252.19339-2-minwoo.im.dev@gmail.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Yk8p9lg/dSp84xaf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Feb 11 04:52, Minwoo Im wrote:
> @@ -945,6 +945,11 @@ static void nvme_post_cqes(void *opaque)
>  static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
>  {
>      assert(cq->cqid == req->sq->cqid);
> +
> +    if (req->status != NVME_SUCCESS) {
> +        req->status |= NVME_DNR;
> +    }

There are status codes where we do not set the DNR bit (e.g. Data
Transfer Error, and that might be the only one actually).

Maybe a switch such that we do not explicitly set DNR for Data Transfer
Error (and any other errors we identify), but only if we set it earlier
in the stack.

--Yk8p9lg/dSp84xaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAkP94ACgkQTeGvMW1P
DemNSgf8D4k/EtiIaET3O2cri2ppSKi+4qlS3cQQJmTIpylDA/9KUpKbAyw+/i3I
3BaB76pptF9xD4mu6Skz4Hp6bkKoLFbSm/o9yTj2WvxNDPABV0Ku/aGtihm50Z9K
QGG2Q70XjEfwleqNQoDtih7I1H9OsvV0XH7g6C8lkQ++iZuoU/FPVwv6ugikpNKh
YdJ4ecO9NkYV+01tjnJ1ZJyIIj6QhNoNk8OHERxmrdH9E6YEJQ0RqlhaA0XIBLe+
Nh7wP7ojTTsedXl6lx0P0qThvkWMLQXNjSpZSb1wbAe05ZDDMP1apmGRJuHVP1Fq
xEPsjSgiGRiGw0Jg8W/9BM8rWTxZkQ==
=Tamt
-----END PGP SIGNATURE-----

--Yk8p9lg/dSp84xaf--


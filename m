Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642763AB068
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:55:18 +0200 (CEST)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltok1-0007B8-6y
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltoNH-0002im-EG; Thu, 17 Jun 2021 05:31:48 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltoNF-000666-5q; Thu, 17 Jun 2021 05:31:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 102965C00E4;
 Thu, 17 Jun 2021 05:31:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Jun 2021 05:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=p5zQhiBV33GZuq3+MAo9fnziSt1
 bYCeg4WJykhUrgAI=; b=cS2jrwnj9EOLTbl2Ht/Gvn1MnxXGzjn6uS89He3BvxE
 RePw67mJ/csdXgmtrSfQpz7IJHnSK8lLFbs5MlHhfNsPxadezVtc5pJHcs2eRtn2
 Y/Oe4NC4kCdFw6btzKpvKuHGLEdNPjPMclDt4Je6oKAme7CRCWtviooAkvYwyGWZ
 9yqSlL+WY2IQc4sN1iFR22LYQYHdG0zD7f3fuY8UahyUPI9kWa0YqPQ0Er6c7zfr
 BVluVxEXGXBJhjqoZDDyEpEMtseRKD0z2L0cteAOZjpF73Xg52YY5GRh8HlE/WE1
 io+AUtqTQY0bwVhTej/hYhNOZIlWpNakuaxZk7412ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=p5zQhi
 BV33GZuq3+MAo9fnziSt1bYCeg4WJykhUrgAI=; b=BEi0lOUOG5SeMe7enhimwA
 /ohUh+ykQIKdV9ny7JxBpKv/+CBzsBL/+NJAlSxOHb6dKcHsx+ZpT3J4J2wlcrJa
 yIjbnXLZMQn2Zpxks/iVbeyeBaHAOPhPkjoex8sw4aDrfUZnV4n2unFK8Im6tJzb
 T9DmRFyV9wJ2D/HUbcE4Rnk91t9U4dR93u+V+Pn0sCXmvw/yiKbd5eD/OIxJJKji
 kxvL4qdjhSfcnYf9TjKnLMKiz944iHpN4uN/6auEZlXnib2pPGDxJ0XdQNKVeqEN
 MfS3lWFfA+Nu7ZSn/yrpGR1XN3q3pI14HsdTSnFi2C1LloWgpRzYyvrR7wSW6vAw
 ==
X-ME-Sender: <xms:fRbLYAKhZ9S3JpAoxw2GB5a-94RrbgHX7VGMBPdIjrKBzCT8b16JQQ>
 <xme:fRbLYAJ2lfyeEe8yBO1OJuaK1lPyk_HxT2X-SEE6rJRA_rcVhROztfoG_6LXUAdST
 8n3k97x86kh6Bnxc_4>
X-ME-Received: <xmr:fRbLYAtj4VANMAL2ot0eGRyFx-y8FxtQ2RD5RrNWdtQfau6VJ0-nmBt5Qm3RVR4bk8iqUgVsQyRUB5XLsOf1dc7art-r7XHw3NEcOTUoDeZLRFzyUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:fRbLYNZ5-gtNNSwTumBOtnQKqDoMGF_MwrpyuQkMgmxWqL9hJwDzeg>
 <xmx:fRbLYHbop0QZ3_CJTNhReaa7MUmM8Ej4E1PPJIsMzfMs8uB9NNX4kg>
 <xmx:fRbLYJCaBjjAei8vATsjIIV62DI2M5b8VuZFMUIf0_2yGCKEOfpYeQ>
 <xmx:fxbLYL6EMHgwwc0w2G0A4kUh1dDLzLCSyD93a_giFyA6gsHmiv8PlQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 05:31:40 -0400 (EDT)
Date: Thu, 17 Jun 2021 11:31:38 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v3 1/2] hw/nvme: fix endianess conversion and add
 controller list
Message-ID: <YMsWehNz6ncQPeVV@apples.localdomain>
References: <CGME20210614163337epcas5p2b9518d7f78fc59bc61361bab99f40f70@epcas5p2.samsung.com>
 <20210614162927.10515-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+OehKm9dq2dGhjTz"
Content-Disposition: inline
In-Reply-To: <20210614162927.10515-1-anaidu.gollu@samsung.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+OehKm9dq2dGhjTz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Jun 14 21:59, Gollu Appalanaidu wrote:
>Add the controller identifiers list CNS 0x13, available list of ctrls
>in NVM Subsystem that may or may not be attached to namespaces.
>
>In Identify Ctrl List of the CNS 0x12 and 0x13 no endian conversion
>for the nsid field.
>
>These two CNS values shows affect when there exists a Subsystem.
>Added condition if there is no Subsystem return invalid field in
>command.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>
>-v3:
> Added condition if there is no Subsystem return invalid field in
> command
>
>-v2:
> Fix the review comments from Klaus and squashed 2nd commit into
> 1st commit
>---
> hw/nvme/ctrl.c       | 26 ++++++++++++++++++--------
> hw/nvme/trace-events |  2 +-
> include/block/nvme.h |  1 +
> 3 files changed, 20 insertions(+), 9 deletions(-)
>

Series LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--+OehKm9dq2dGhjTz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDLFnYACgkQTeGvMW1P
DeluxQf9GRSBiQI18bhQ+begbWyKpSvAuxqgL60QJxuY93Pw5arOCc7EISZlenB1
scvIwpu/jgyPIcDh8CxCRTGsK2El1C8NTLkbO6ca+AmmWnmmYKZyzR8kQK55OBxl
aDcYRMSDqtHnEUeZRr7fiW8zQLos7Lk5+Dbjv4zg2ZXjMkTG5omschlwkZsT25Xn
oMzOJzQtNGzjsoTh9pOgZT/99qf70O5GBjZ1oeM99wTp6wcDZYFkt9C2FkcyA3S1
OChlwtDXMChrAp+nJpGG0Qb70YIsq1GrLtGjd0Pvtv8bBWHV/CY6ODbdlz8HXSXa
+mxp6NAE61A27PUTwaSalX8aq/dCkw==
=nAuv
-----END PGP SIGNATURE-----

--+OehKm9dq2dGhjTz--


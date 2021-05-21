Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38538C24E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 10:54:32 +0200 (CEST)
Received: from localhost ([::1]:41522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk0vP-0007Ex-Sd
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 04:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lk0qF-0002ti-M0; Fri, 21 May 2021 04:49:11 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:56485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lk0q2-0000mN-Eh; Fri, 21 May 2021 04:49:09 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id BBC231296;
 Fri, 21 May 2021 04:48:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 21 May 2021 04:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=mWuJKGhGA/YVLGAM2S+ROeUxbjT
 /Fqzf58w1R/QVPbk=; b=daIr5QKthHl3yEw1l7OmUvTWsje3D6jjz8rzJC2xyoU
 AgaAVRe/QrIQAJ/rBYMsu+AtVhq3fDVligxXnhnQv2NVXb5n/RSCpEGezzR9RtHJ
 n0RGrJ4vk60swe0KCXvaRTlda4AZLsmLNmKLBPGu/po6o75gjXcD1yO01xlOQV+n
 y5rjQqL+Q/xqxP/ZVKpb6KovWVPRwxRqPBTUipuCrlZ+vp/O87IaPsM+WWZhZm6f
 uH3l8y3KCYWwJhrRQSNIMucFSLYjEpU24C8gZbZL91R0J5xfXfnKvxAdHx74MeKN
 nnh4NgT986Vjnu1lnthDYOGaJUem2+z2bpwN8HnUjEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mWuJKG
 hGA/YVLGAM2S+ROeUxbjT/Fqzf58w1R/QVPbk=; b=R0yNefgIMhxFOIvcftGt9f
 pv2yjjZc7oVtNSdQEv/8N64zAubKURxrOwefl76UT9wl/JsEX31JUUsjQN5eFD+C
 TqNJjwVjfC5PCZB83b2C866cZlOyD3Wt5tYtaRH2d3gnryhlKD3SFEM6bm2RyLeg
 knpSQoTKO3XH7fn9gqdJe5FJYJYnlGp81zePMMZFtbHR3E4hts7CvlM0l3LuEKoa
 ya694QNa+dFU6dhV7mlbFoceLk9KdauFG7pAj8ZVMNh9Dba+2BpLtArCK0C2e2zs
 AP2Sx6yXNEggSoHLdPOUqmtIeNEuXP76yiWOtQ8Rx2vMFJVvzfDoeyROQLav6Ndw
 ==
X-ME-Sender: <xms:9HOnYPNpYVppF2_QJB8Xn8Kdqk9JyZObJv5Ot7toBPf-iD4lwBXgtQ>
 <xme:9HOnYJ-KpK6J1o3wicdDRyhM8FULKzidIiGXI2mtgSvHh9_86q7HeJI6WHNQU0m2A
 aA9f7bq4aYJXyTjLDo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejfedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:9HOnYOQ3jtST2eYPdN9wN24T1SaCL-AwfNaCqtafF-bGzTDbaWJy4A>
 <xmx:9HOnYDsQ2Mk_EoqckWmuYwl0oZICCySM36ZD5KgpvmFFnFshbyudvQ>
 <xmx:9HOnYHevO2w_6DrHp_AOVuQIylLWSMNR6iHm9qyRmjhVsGl4Mq6Iaw>
 <xmx:9XOnYO5hhC7eK-NNF19xwGRNZ-q8RK_Jd6xtz0VUB4mJG4mrW34BfQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 21 May 2021 04:48:51 -0400 (EDT)
Date: Fri, 21 May 2021 10:48:50 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: making a qdev bus available from a (non-qtree?) device
Message-ID: <YKdz8k+RqGjr6sAK@apples.localdomain>
References: <YJrKRsF4/38QheKn@apples.localdomain>
 <87im3o2m8l.fsf@dusky.pond.sub.org>
 <YKIQsI4F49R4hEmd@apples.localdomain>
 <878s48pmlh.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5w4OBfho6v2kzwxc"
Content-Disposition: inline
In-Reply-To: <878s48pmlh.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5w4OBfho6v2kzwxc
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On May 21 09:33, Markus Armbruster wrote:
>I'm about to drop off for two weeks of much-needed vacation.  I meant to
>study your explanation and give design advice before I leave, but I'm
>out of time.  Regrettable.  I hope Stefan can help you.  Or perhaps
>Paolo.  If you still have questions when I'm back, feel free to contact
>me again.
>

No worries Markus, enjoy :)

--5w4OBfho6v2kzwxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCnc/AACgkQTeGvMW1P
Deki2Qf+JWTYuEv0FM33eeUrDzPi3Y7NX/mMZ0aW1hnemMxVs0imd92w3iNTdMV5
SvatuAWmlJKsrb4LN6ZhjIUF6x92V7Snhz3+lmfevbLgD69h2H6ToVHvITf0X4hA
US4pyxCNIXFIAk5A1uUHtwATUoZD578J0VSIOLnTpCJDMyql+O1vo2e/ZuD4IjEI
LNesKj249q2djM8+W7XWN7zrh+vGB+3woygLzgLCjfUMoPN+XFqfqMQkZ5nMgmR4
gAO/j8k/hg6mUhvTyCQwyg1O2zMWfxOpFsINT25LEDAJ2g8UlJBAk/+h8hrp7rMO
kZfa4N88LjrUWR9AjEhnitri7Z8mYA==
=ryyx
-----END PGP SIGNATURE-----

--5w4OBfho6v2kzwxc--


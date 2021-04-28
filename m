Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E302C36D5A8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:19:53 +0200 (CEST)
Received: from localhost ([::1]:58076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhIO-0000nE-Si
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lbhBp-0005WO-FJ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:13:06 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1lbhBn-0000nO-CF
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:13:05 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 020005C00AA;
 Wed, 28 Apr 2021 06:13:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 28 Apr 2021 06:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=vwGyjs4dZ2XdWjeIy4wuzmmaJGs
 ZjdmCFjE4eu9xNzo=; b=Bj1ncTd1151pqCeEVGBcOpBtkdM25dhRcDMnzZcchVL
 QyTeIBr9QpZW1jhUviPnSXYhOyEKhzxbZ4V2EEQpg3f3hqLwOUZoiks+JbKba1xL
 bhsqhpCGhlm3Ou+AeXFEIx6Dqm5ujipYSIe9ZdRivy1daZV7qd7RcpzGU+JoDhRD
 CvznO8qfL5dys+snkur4JtT2b7ZgaZO8MZCAJGTyo6segJI6DNhzJpTVgyOtmtUH
 2/rtSLo6B6yzzsLeVwFSLCR/IxygQK1yL4mAIors5YirBm03n9GFxsjBJJ/Vxx2a
 DbG1890WHeawfqYelkMAmXkf9rxNIXnu2xGOvnY4cIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vwGyjs
 4dZ2XdWjeIy4wuzmmaJGsZjdmCFjE4eu9xNzo=; b=Yy60JoVu4G39U8vsqkSX9a
 7lAdp+LP/S6fGTAC/c284GhZ1lW0lfjApe9l+2rJpuzODMQyr16qTOlTU3FKyd0A
 vsGocAanFOWa2pS9EzUrsZIWwyZ4Lvlwyrofeoov+Z5ZQSxjPYUL5IewoJqnPKFq
 jMzBRTb1kcysUfWXKcs4wZJZ1MQ6U/4YNuQbTwBbXbFtINb4cyFwesLUgil2oH3m
 LPeiQPdUidllU214MURTZZgJpNy++4+Uoc0rJYajsN9ka5/iSPMhoDPYTbTb3v2d
 8VCtVWiWTVasX17YHFfIdGXtYReYcjrFftNF2j9lWMwXWqgYPp+qXbSEZMTrymXw
 ==
X-ME-Sender: <xms:LDWJYENGRKqIgQ9u80iPalCrr12qOC7DTsaS_XligfgmsqMmVGa-7A>
 <xme:LDWJYK847P2jsHq75MdekAdDZNyUzUWmXopxN9mz7rmNiLy6z33yAKBoBJs1RNmOV
 hFbk1rZBZbwWH2_RVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvvdcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderredttd
 ejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghn
 thdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeuleetveejud
 eileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudeltdenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirh
 hrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:LDWJYLS0NVOOunqmaA-S6OR7up-jcIgOzC2T3lQ1k4wZsF9VsT1QQA>
 <xmx:LDWJYMsUC6HDWa_NLQemLtPS-hWbUJIitvLcxHnzn6oO6QpKyVA7ag>
 <xmx:LDWJYMcAzvdLcJnwwireYJkSHs90fl-p5rf-U3_HMYgtqFPV0H634Q>
 <xmx:LDWJYNq_l1ZWRUlDhNxQKFCftEOqsRaJoBKsAYwpq1aKw4OEMwFBxg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 28 Apr 2021 06:12:59 -0400 (EDT)
Date: Wed, 28 Apr 2021 12:12:56 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Bug 1925496 <1925496@bugs.launchpad.net>
Subject: Re: [Bug 1925496] Re: nvme disk cannot be hotplugged after removal
Message-ID: <YIk1KG4dgT6mwChA@apples.localdomain>
References: <161909487037.10022.905940620153099238.malonedeb@wampee.canonical.com>
 <161960231059.11681.2408216748859225156.malone@wampee.canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KqnP3vt0jnlAvSrT"
Content-Disposition: inline
In-Reply-To: <161960231059.11681.2408216748859225156.malone@wampee.canonical.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KqnP3vt0jnlAvSrT
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 28 09:31, Oguz Bektas wrote:
>> My understanding is that this is the expected behavior. The reason is
>> that the drive cannot be deleted immediately when the device is
>> hot-unplugged, since it might not be safe (other parts of QEMU could
>> be using it, like background block jobs).
>>
>> On the other hand, the fact that if the drive is removed explicitly
>> through QMP (or in the monitor with drive_del), the drive id is
>> remains "in use". This might be a completely different bug that is
>> unrelated to the nvme device.
>
>using the same commands I can hot-plug and hot-unplug a scsi disk like
>this without issue - this behavior only appeared on nvme devices.
>

Kevin, Max, can you shed any light on this?

Specifically what the expected behavior is wrt. to the drive when=20
unplugging a device that has one attached?

If the scsi disk is capable of "cleaning up" immediately, then I suppose=20
that some steps are missing in the nvme unrealization.

--KqnP3vt0jnlAvSrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCJNSQACgkQTeGvMW1P
DenqSggAuzEn+euHDPUVETi6aGXfUNVweAJig1g6dzIy2ucRukTpS5B14P/Sf76e
YZDDGaQCiTFD33t88OiNxWcwzIkcgCopolBnfRh+j61rdgKdoAGZ8c9SCjNKaN43
10jAenyo9Xmc80tu2HkaVRxzv4csucyePT2mVMmv6Q62kzqh5DtvPh8GDjSoJmXn
gO/7MVABHYHoQN/OK5l/yJwdlY0mM8Duccz9ingXvqPFUs4PsB71eALkqRHiQaKF
PBZRhv7AUu1ElPKeCIxbPlhIlswLnp4FmH4KQ8u2UacooR1GTvJCttXLm0LpCSwJ
4NP+IWWGTG12OUA/fx9tgxdaeU4XpQ==
=CTxo
-----END PGP SIGNATURE-----

--KqnP3vt0jnlAvSrT--


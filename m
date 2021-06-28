Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C53B6771
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:15:24 +0200 (CEST)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuqx-00039b-2S
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxuit-0005Dw-15; Mon, 28 Jun 2021 13:07:04 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxuiq-0005Jn-VF; Mon, 28 Jun 2021 13:07:02 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 208685C00D0;
 Mon, 28 Jun 2021 13:07:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Jun 2021 13:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=16AaVsulvZ5LvQYtXX1iQf7iQEq
 EaeG9v7OQKRcor4c=; b=afYuV9J5XhOXmVUp+/f1J/ByzAUOtDTzQBGqnNAoM6Z
 eXZUGAGyt7y5bXZkyYMIx1BuEd2sRlB2ScKPMAYdF/wifxYG9dc7lV4eCixm+s2W
 4WrjM7nWo3RLF95f1kyErI0THrzFAh4SpXStqQ4VmRudtxOvXKbfGAVMFP/0bG3c
 NuZcusirV7aYmlI3+wrFQQo4U0K9r35HBmGedrfeaYXa81pspWyjDk/66XVmaW76
 wshWk141iJOaMMr/TksGD3ORWQUT9b9Cf1hCi5uQlWdCTx45yZHo7JtxqhdUT9Ky
 g+3/eyA+lloaU7HSKJCGK5VBzfuaVni2ih7freB56PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=16AaVs
 ulvZ5LvQYtXX1iQf7iQEqEaeG9v7OQKRcor4c=; b=YvPFD2IVkZZ+o9PZ5FVveB
 zwlmouANwjW2IA6HXx7pqMcAW32LZJePBD4nMYj7ICc0rbInxPZPte7l6CIeaXGY
 Fs4q9Se6DnBWpnOgXD902hu9AcERDcoPYVAERw5k1+wEMmbd7rJdEbsD8mxguIc+
 AztY8/juIUf6nnwGhnK6cJuN1k3UaJCazkx5vAgR8+1RcLOrpHzfaRewtl4tnoOP
 6WcwaB/Wu5wzXjQ8101t1FZ7/kT4iA+iFdWqnOjpc8LUyF9srhPgaX1HuUFy/6N7
 yOx9v1xgIyBL/kdVlyYg+f21Opvxj+v7Eob0IyXEXjpF89hX4Xh3OGzfjY+M6teA
 ==
X-ME-Sender: <xms:swHaYOTZbviR2uWibCOm6bHZFzyxUXeaY8e0RjxpiegFNjrM25f_sA>
 <xme:swHaYDy6Gz1WjU7aQxu7SHRDPQQy0p7CyHrVHeCZ741H7PA3NSAAbwbsQI6ArrgTA
 T7zcdetnI9hlkAF4vo>
X-ME-Received: <xmr:swHaYL2L0JxRbIMXzGmkPAdCJbGCtRiJgYu3SISPSrpdEI4fE4LRmb602dVZAC77JFF_4vRZ-93j5qXRUdIbNxl7HWAWL2Gi-w_6tSLLM-6iE7etBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 orredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeeuueffiefhgffgteehjeeiveelud
 fhteffhfehiefgheetjeeitedvtdegvdehtdenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:swHaYKC5dh8_WO91WcCxDe16EurnsHnRV5vpEYHFcQSu4ccplqKoFg>
 <xmx:swHaYHiNFixMUIKyVoorNWHpNYzPY_BWp5H9h8TU0Og2JFzc_xLbUA>
 <xmx:swHaYGqoOgQsympVIKS21U--ABR3gcZrCV_YE0ueOGb4Z7E5JEwX1w>
 <xmx:tAHaYHhLGJGFIgV23SUAsxRriOv5Gdoc8geDvUTusht_re_W21zBng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 13:06:56 -0400 (EDT)
Date: Mon, 28 Jun 2021 19:06:54 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v3 1/2] hw/nvme: fix endianess conversion and add
 controller list
Message-ID: <YNoBrqKaCnhrbNVa@apples.localdomain>
References: <CGME20210614163337epcas5p2b9518d7f78fc59bc61361bab99f40f70@epcas5p2.samsung.com>
 <20210614162927.10515-1-anaidu.gollu@samsung.com>
 <YMsWehNz6ncQPeVV@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3UHHsUpnSg0FekIW"
Content-Disposition: inline
In-Reply-To: <YMsWehNz6ncQPeVV@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--3UHHsUpnSg0FekIW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Jun 17 11:31, Klaus Jensen wrote:
>On Jun 14 21:59, Gollu Appalanaidu wrote:
>>Add the controller identifiers list CNS 0x13, available list of ctrls
>>in NVM Subsystem that may or may not be attached to namespaces.
>>
>>In Identify Ctrl List of the CNS 0x12 and 0x13 no endian conversion
>>for the nsid field.
>>
>>These two CNS values shows affect when there exists a Subsystem.
>>Added condition if there is no Subsystem return invalid field in
>>command.
>>
>>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>
>>-v3:
>>Added condition if there is no Subsystem return invalid field in
>>command
>>
>>-v2:
>>Fix the review comments from Klaus and squashed 2nd commit into
>>1st commit
>>---
>>hw/nvme/ctrl.c       | 26 ++++++++++++++++++--------
>>hw/nvme/trace-events |  2 +-
>>include/block/nvme.h |  1 +
>>3 files changed, 20 insertions(+), 9 deletions(-)
>>
>
>Series LGTM.
>
>Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

Applied to nvme-next. Thanks!

--3UHHsUpnSg0FekIW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDaAawACgkQTeGvMW1P
DekJUAgAhyJcT2eUIXTLB3hs+0fgT+Yzsm8LXT0XN+4cAPdplc5LsQRKZIKe+AvA
tKfd3ilzv6DYIt88B7mUd9IVOa2dbiv2dJCjl0aPHZhXIbZU7V3baZPB7+wU+yio
0Z8drGfOEZZwusjZzhS/9KLlGx2pPEpPzP573ocdy10BHtyMHoxcfWuJuiSPPKXJ
m1e9mHl+kz27JuAwD8E7YAcgJ8UN9Z0EWXycHkGAgvdLQdZt2Nj5ISU5RPme0Al7
ppYSCKhvNxHqINjfdQur0WXZtTCCHP/lHeFXNbpFBuhyheCe4krnEvk3/pPWb2ly
g27zha3RhWSmr0Nv5YGs0p2QlpoZwg==
=ltqN
-----END PGP SIGNATURE-----

--3UHHsUpnSg0FekIW--


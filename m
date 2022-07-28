Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9241583AA7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 10:51:21 +0200 (CEST)
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGzEj-0001jb-S5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 04:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGypo-0006lE-5c; Thu, 28 Jul 2022 04:25:32 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:53519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGypk-000563-Ny; Thu, 28 Jul 2022 04:25:31 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D30C75C00DA;
 Thu, 28 Jul 2022 04:25:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 28 Jul 2022 04:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658996725; x=1659083125; bh=JL
 LhjMhpxUlchWV4Zhke6fB4eURMOY9aWxU345USUK4=; b=odxLu8Mn60qJ9UWRzH
 cMF/6ug4SsT8GC/BV5nuhDJIDizNC6YTSPnYYyHXCWWBui20C/Zkt9IZ6u17Nj4f
 Fn6ostpIO3xDg43fYZZ0HaVUthaB0tdfvEZ3a5B5vPp8KJF7bq4SI3eZrHy3ELzm
 cBC4HtqvGcs5IVcgqd21sJPhg8CPMhYF/dMVLDYe9qMIVjsxZnhUGyCIazUI5dXi
 imwVNfQBvt5wilVUYTcdmF6d8J7ICkwLPB4SYktAoTxxMb8DVa2AsR3/uq8d1kJy
 5rmZKDVRYRLv4rhZ8CLKPRxrE1Tg1tcrL1uYvQFB64SOGGZaZyzcmzeIYY/6Ja+c
 U7yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1658996725; x=1659083125; bh=JLLhjMhpxUlch
 WV4Zhke6fB4eURMOY9aWxU345USUK4=; b=W9yuGrAqQ6uFWQY2EnFE7C2guBIKz
 BRNMjGtRJFye5isOc1Y5OHcIq1/8GcNUznRGhEQh2HeoEEK3ycxqnYrGzYdnU/5X
 aDyKBmEZHhrZ31Bngvm29y3DOf4U9NtK1wf8tmhfhsiMtXOkC3RXmMsEIkbYdum/
 +/O2LDow1ShtH+DPZ9qKZ2riwLy0ZfCDG8pg98e1vryjvuKfBFQtcdcPNXPIjp0h
 qgIFBPmlz4tZU77OeUGnTbY2Y2rCB3X5xW+DzvoDXt1w7DT9733guQzAu6BQBSnx
 S4NjCZQ4eGBX0EYFwU9iGyyYzagCdPN3vc/Usizw73FB0KTMmK9GltbQg==
X-ME-Sender: <xms:9EfiYhSzHsNP7RDfSNmk-YrwqgXss3FGN24dpphw6MheTC1H505X0A>
 <xme:9EfiYqxTXF9oiW5AANOLKNuEbOzJ0YaWOivYr6MfLc4p4Pb2NMWzQG-g9a6cYgiSa
 aWGPuiwBgQ9bclP2B8>
X-ME-Received: <xmr:9EfiYm2AbM9B2VPhqIfejftcAPq2dKgEmOXiLLXjjAfewevVNPII8VQuzWkYkUmUJ4oVQ_dh5TWSSkxDulcS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddufedgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepieehteejvdejkeelueehhffhffefuddvjeevleeijeeuheejgfettdfhteef
 hfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:9UfiYpAI9Pv-_YwSqYCS4ngsUAxgQvyV-XdCvwH9VeYM46PJsocv7w>
 <xmx:9UfiYqjJnIeY-hb0RTggQKccwfKrsoWZETlt_nSPf5fgVe52VzpQHg>
 <xmx:9UfiYtpotbLh9BLgYnsVAOMJhtzGXmYp5cz3-5mJYa3AbAeUpDhKmw>
 <xmx:9UfiYieU96M9rZBt1oJOq_o2Oir6XMzljPROnJ2sUZbVwUKPinl9NA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 04:25:23 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.1 0/3] hw/nvme: misc ioeventfd fixes
Date: Thu, 28 Jul 2022 10:25:19 +0200
Message-Id: <20220728082522.3161739-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Klaus Jensen <k.jensen@samsung.com>=0D

A set of fixes/changes to the ioeventfd support.=0D
=0D
Klaus Jensen (3):=0D
  hw/nvme: skip queue processing if notifier is cleared=0D
  hw/nvme: unregister the event notifier handler on the main loop=0D
  hw/nvme: do not enable ioeventfd by default=0D
=0D
 hw/nvme/ctrl.c | 12 +++++++++---=0D
 1 file changed, 9 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D


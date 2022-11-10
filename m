Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D44624D77
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 23:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otFia-0000BX-9m; Thu, 10 Nov 2022 17:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFiW-00009N-Bk; Thu, 10 Nov 2022 17:08:12 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFiU-0007bM-5H; Thu, 10 Nov 2022 17:08:12 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D8EFD5C0195;
 Thu, 10 Nov 2022 17:08:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 17:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668118088; x=1668204488; bh=hj
 1exfuLs4DcAh5P0NppuIGdvo8IWt3MeOBLLLhvMao=; b=PmesPLCXB/ZvppJEI0
 mxzfJPVDsxlIOY5ytR7Wj5Km73+BoCQJibStarm2K7HoRYQRc3T4vMz3++SqckOj
 qM0S6Ewjf6uXsc3eHrGZfj6+Oveac5Xsg7C5OdkV29eqDmcUFA5uxZldkRyeS4kT
 Y6bIDn+Dz/48LsphEG/sJVcAGqcgz1McM5yUqvZMTRC672l0seZZs/nTdrjNL0D9
 cJsJqf8BrGG4uTKQBNUTG86n0Xjxa69PgysWbQIsOqojVvhODUTzr0oMYCMuGcrw
 mPDPvRP6zrT1GoAa7DCu41yUdPzEIXib0AZ4p4ylFOvdZUGR0Iv8ldvRQ32fLwig
 Ipew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668118088; x=1668204488; bh=hj1exfuLs4DcA
 h5P0NppuIGdvo8IWt3MeOBLLLhvMao=; b=KOwVbmGSNChs/hF+uSoJHnZMCqWPH
 q8toz2zfLG/A7Xwxnx/7Kk8I74ECMFO6fuMSH0ZW5XdWel8g+cLGNEvM1PK4P8QJ
 jpwsPsJVVjkr+OFsvp/BnnA37f6EcdJ8vfdsCwP47pTvgfSO+z5iRnMHPKzL0Qs5
 qdn1SZ9qbrqvX3yqMz41dT6MqNQO86p+AXjo77W2ILF6UYXJJjQLZI9xgJCU0lVy
 EJTwdzJloXgqnZj2ohqTR0m0UyVHeJjmEx7yZWwif66AK/czOyr7cGt45h7khFRN
 GZzL/dzYPfqayhXVbKB4ERIM7aROhuV0xqSobjrT8G7EmcQ1izy+lOLcg==
X-ME-Sender: <xms:SHZtYxehsISopFbQnQ3XbwB-8XVxZFRj9nLcU5kq5KtMNb06TBkjcg>
 <xme:SHZtY_NcGeuYwzGtHpB7K-fAvtq6w1hzo0shhbotcQ2x5RsyDZMgGC0bCNQ1xEqXz
 y7auliV_rkdtyie7-E>
X-ME-Received: <xmr:SHZtY6g9s0R2wYy6cmALewQ45YtLNDncBh5J__zo50v3bsB727zbmuML-3Zduu5gim9nO99iC6oa0iJYfbqRdR4MREfw2nWFA4IS-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedujeeukeehtddtffeltdehheekleevhefghfeljedvteevueegudeiieevieej
 jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SHZtY6-ceRV-O8Q4nSSJBoiGUeAKmsdwiJ0PyoJjx4qRP4aIgSesVQ>
 <xmx:SHZtY9u0JNfbZqd3yKS13TJSUwrDrdTLq4XrvuRZ52Vk6yF_Iitvsw>
 <xmx:SHZtY5Ff6Lks2xkS9-PBHKb9zs04awTqXey-dfh-YbTP2l0KPZLlyg>
 <xmx:SHZtY3K8Kd1vIjVWNeq5ZdFnl-6KzDqe0vvQfF-WdfUPiN1Oe2iQBg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 17:08:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 0/2] hw/nvme: errp fixes
Date: Thu, 10 Nov 2022 23:08:03 +0100
Message-Id: <20221110220805.26816-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=391; i=k.jensen@samsung.com;
 h=from:subject; bh=JnUf99aU4OpPNkGrtvbozqbTFXrl+fM8MM6/1erbzHU=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNtdkW5hiyfc/AsJK3aNaIURoGHpPVi9/tusBuE
 ITZ8S0uC+YkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbXZFAAoJEE3hrzFtTw3p2F
 8IAI5+2oJtKX8Djuml6s4uIApNEQo9Yi3Lukajs4WpTFfGWPYHG2zD9h4KM2/5vIWI1ILdQ5TBbfpk
 TaRflX5LD6S1QKpM3n3tjzjMpGOzWlcIs7p0CI4poBdaZ67Q0s9K4Vg8rHrQyeR5kr9sugqTXeGFNx
 u2D7EXp7dz2HCfC9RIyzn/JQ3zaJhB5vcNa3CdncAQniVOs1DTwO2P5/ZBL31cXY5/fyLmpiuYB4nN
 MQBGF7Bxsazdw9OahDItf2OIORQ0HfWQc6M0+iHaHH1c6jluhk2oh36YAPz4IxnmUBG6d+1OqjRVDF
 Wn7Ft6dhNqmOqXZgyzLm3zEIpm5hj87uPOu6gE
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
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

From: Klaus Jensen <k.jensen@samsung.com>

Fix a couple of invalid errp usages.

v3:
 - reword the commit message in patch 1
 - fix an embarrassing bug in patch 2

Klaus Jensen (2):
  hw/nvme: fix incorrect use of errp/local_err
  hw/nvme: cleanup error reporting in nvme_init_pci()

 hw/nvme/ctrl.c | 71 +++++++++++++++++++++++---------------------------
 1 file changed, 33 insertions(+), 38 deletions(-)

-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8B36F347
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 02:51:22 +0200 (CEST)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHNK-0005wO-1O
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 20:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcGNo-0003Xw-TG
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:47:48 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcGNm-0007cY-I8
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:47:48 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 53A085C00D0;
 Thu, 29 Apr 2021 19:47:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 29 Apr 2021 19:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=mesmtp; bh=JsrABYTxIf6AJBXmP1JMNqW
 Fd0cYNoulI81hhYAIPa4=; b=MWp2rCTT4hG3ms42RNGMhKhdvVVop2riYfNr32J
 hin0FIDhDTtd15ansoJRJYbQanH9tiiWCfWQ4nwkYOBd0jSLOlro6VWSnTkGpNNb
 v9Yg2Gs+Mu5tUTDaJAhZ+HRu9fU6lyXFy4vncDTGlaAnR+/KLKTfGSrkJqiAfCYC
 JQFQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JsrABYTxIf6AJBXmP
 1JMNqWFd0cYNoulI81hhYAIPa4=; b=XIYVul0Yd4/DOXn1AoZ/sXFEV1CbEPzib
 ts8DXyVjryp6S9rk8qvAxgaX8us1XrEdwDT3ql9qEN0qrP+fNc7KI523vQzOr+Pt
 vTpghiBBQF3xYZoGC4I/gYL0VDGrXEO+7WhN67juvt3jZ5tnAhEJaYH3Zkci6oB3
 o2H30irqhtzz+Hi6XNLJnkHmjvsEgU8nwwXB9x8XjcjUeMlfQVwtczZhcSYphY+k
 2Mr1wNFy+Vpu66mHQQXEUu8vzPsYqU0F/nrVfvgsYA7T9tnQeBq5ytnSVTy0g4tO
 sk3MJznUgKZGvzYgxWyKRZAEI7lXGllvJh7X59jUyoYnwZDx+FFHA==
X-ME-Sender: <xms:nkWLYLrUKx3EVNeRwxZVdBeV8gyu4XOUXQ-19MM1VSmrnvtTANO2rA>
 <xme:nkWLYFrLNnwzCrbmk3l2VXmDhvcBSttXGJybWxnU5TuY6u5njO3Qjn2YT03z5PQ9S
 bMXgklbVaNbk0y4fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpehguhhsthgrvhho
 sehnohhrohhnhhgrrdgvthhirdgsrhenucggtffrrghtthgvrhhnpeelhfehffelffetue
 efieejveegjeeitedvfeeufefgheejtdejvdehgeekvdeiffenucfkphepvddtuddrkedt
 rddurdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epghhushhtrghvohesnhhorhhonhhhrgdrvghtihdrsghr
X-ME-Proxy: <xmx:nkWLYIPJX5jscYyyEOHmKBkFosnPVfX4h7vZkPw7U1oQ0xojSVu4hQ>
 <xmx:nkWLYO7qe5OSGdR6w6RkWi5lKjN2VedaowwyYaDYx8eY4dPwuEe5aw>
 <xmx:nkWLYK6fgFRPBeyYe-yjex6g790rLCAbbiiOKlvTB3eRxEX7iNVPxg>
 <xmx:n0WLYAmYym1QVF7u7bC0MOfK5oe0dNyniQmJi5m4-0ngGGzFxmJwYQ>
Received: from Gustavos-Mini.box (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 19:47:41 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] cocoa: keyboard quality of life
Date: Thu, 29 Apr 2021 20:47:03 -0300
Message-Id: <20210429234705.83206-1-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=gustavo@noronha.eti.br;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Apr 2021 20:48:06 -0400
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.eti.br>,
 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.eti.br>

This series adds two new options to the cocoa display:

 - full-grab causes it to use a global tap to steal system combos
   away from Mac OS X, so they can be handled by the VM

 - swap-option-command does what it says on the tin; while that is
   something you can do at the Mac OS X level or even supported by
   some keyboards, it is much more convenient to have qemu put
   Meta/Super and Alt where they belong if you are running a
   non-Mac VM

I propose to enable swap-option-command by default and leave full-grab
off because unfortunately it needs accessibility permissions for input
grabbing, so it requires more deliberate action by the user anyway.

Gustavo Noronha Silva (2):
  ui/cocoa: capture all keys and combos when mouse is grabbed
  ui/cocoa: add option to swap Option and Command, enable by default

 qapi/ui.json    |  20 +++++++
 qemu-options.hx |   4 ++
 ui/cocoa.m      | 139 +++++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 151 insertions(+), 12 deletions(-)

-- 
2.24.3 (Apple Git-128)



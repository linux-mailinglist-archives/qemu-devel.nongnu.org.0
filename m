Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1723C79F1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 01:03:35 +0200 (CEST)
Received: from localhost ([::1]:39226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3RR8-0002bz-VD
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 19:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.dev.br>)
 id 1m3Q0u-0001AM-Tz
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:32:25 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:55497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.dev.br>)
 id 1m3Q0o-0007Ss-LZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:32:21 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6929132008C3;
 Tue, 13 Jul 2021 17:32:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 13 Jul 2021 17:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.dev.br;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=IssmBKLjF2nfDMGM8DE+nvmPO5
 wleZvOFJQ1XD50ScE=; b=cjRwzjzC/ygwjHvCzrq0/4v47Ix0l7lQsJw+4NSLrG
 ihwbs4n0TUQSR5qJ6GnUummC8sUWHTHMWDol8H2EGwCrbbgC8ArhURbmbVSMP+wz
 hQpQrbVpvOcrQoj+tyMGc9xyt335IyIAkpF8RQ0rPx6eKQu6BLvcY2kv4zKABQJU
 vQH3f2gj/tDOCffvgbc7c/Nxm/8HFPhUE4+RbmZQIGHIHYvWqhqsKS5vwPnJa2aA
 qnIuIo37gGNciLaW2/lOH7IitJrxOHlSnCMo1ETaQSInfxhRDVDtcnxswZqofk9t
 Zkk7fxcDOUgZ28lRQtgJ1PAvi8Lf3DLbxj+REz8zIjbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IssmBKLjF2nfDMGM8
 DE+nvmPO5wleZvOFJQ1XD50ScE=; b=kBdUGwKkC46Ma27G+U+3HJY0cC93+taEY
 LtzFHPlDbH61l7gN8cAnluYh6FOfPIL4tMOBaZkkYNPsLFOJ/o7oAAy4kycMtTyd
 vsBOkY9G802Acc532TpfR+YeOM8sSf6Er0bqPPNMI563OU0zfBB+oO+ST+XuUQrK
 tr18tYm34XbkJLE7AbY4PJASWdcv11G24WlIGaVsXTPV9jWwVClNU8US3VBPmg5o
 JjSQ6GlyjFt/CooHwQsCx7WvAduDOUtFTRNkgKuGeH4KZZgQ0sGxOyus8k+WJYkU
 VjvEyTcLR7+4azH56RvKdpJUTxvfTXG7lEVCUD8j5JZgtzXKqneqQ==
X-ME-Sender: <xms:WgbuYFRRTgLllpoqWDtJLQY0Wog_RYqs9u3mxd3s3WZrkjpzB7qiNw>
 <xme:WgbuYOw00HFuJsgj6-bHqtGSFMcnea-0f23OSxRFIWVSF6Lbe9ApaBJkR1xst94JD
 7ZXZixM-aGTdV_IxQ>
X-ME-Received: <xmr:WgbuYK3oIu7O11aO0gGjSyZ8Fog5zaLWfutUpK3iRJ-3zJYukwwTzqeovg0tesZ1uQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeigddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepghhushhtrghvohes
 nhhorhhonhhhrgdruggvvhdrsghrnecuggftrfgrthhtvghrnhepvedvhedtjeetieejfe
 egffdtudekfedvleegtedvtedtjeevfeehieelgeevleefnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhushhtrghvohesnhhorhhonhhhrg
 druggvvhdrsghr
X-ME-Proxy: <xmx:WgbuYNDrR4xc-fmXnL_FLQiStefoj6e45HZPNY27vomTZXjtzq_EDA>
 <xmx:WgbuYOgLgFhVxnzQHqbFoUlh6NOjxnEsPRkfLf0L6SuMd5j-dtp-mA>
 <xmx:WgbuYBoe_mN56yM34HB_snlrDA8FOfjyNcSxD_we6P0xOMBipEQZtQ>
 <xmx:XAbuYJWzAjhJ9CTq9vHWbFOry7wb9CuxGWLBuixBZV5c1okfrARn3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 17:32:09 -0400 (EDT)
From: gustavo@noronha.dev.br
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/2] cocoa: keyboard quality of life
Date: Tue, 13 Jul 2021 18:31:58 -0300
Message-Id: <20210713213200.2547-1-gustavo@noronha.dev.br>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=gustavo@noronha.dev.br; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Jul 2021 19:01:02 -0400
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
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>,
 'Akihiko Odaki ' <akihiko.odaki@gmail.com>, 'Eric Blake ' <eblake@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.dev.br>

v5 addresses the casting issue pointed out by Akihiko Odaki.
Sorry it took me so long to update the patches, but here
they are! Hopefully we can get them in now ;D

Btw I also changed my email address slightly (.dev.br
instead of .eti.br).

-----

This series adds two new options to the cocoa display:

 - full-grab causes it to use a global tap to steal system combos
   away from Mac OS X, so they can be handled by the VM

 - swap-option-command does what it says on the tin; while that is
   something you can do at the Mac OS X level or even supported by
   some keyboards, it is much more convenient to have qemu put
   Meta/Super and Alt where they belong if you are running a
   non-Mac VM

Both are off by default. For full-grab in particular, it is off also
because unfortunately it needs accessibility permissions for input
grabbing, so it requires more deliberate action by the user anyway.

Gustavo Noronha Silva (2):
  ui/cocoa: capture all keys and combos when mouse is grabbed
  ui/cocoa: add option to swap Option and Command

 qapi/ui.json    |  22 +++++++++
 qemu-options.hx |   4 ++
 ui/cocoa.m      | 129 ++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 146 insertions(+), 9 deletions(-)

-- 
2.30.1 (Apple Git-130)



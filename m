Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D022837AEFE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 21:01:55 +0200 (CEST)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgXdi-0000oi-Oi
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 15:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgXY3-0008US-Gs
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:56:03 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgXXv-0005NE-PG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:56:03 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4ED28170E;
 Tue, 11 May 2021 14:55:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 11 May 2021 14:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=mesmtp; bh=nspUxtSpiIyKBhsWGX9sKOm
 oo48rdh+1kzg0wcXDtpY=; b=gMN4yMQEy+JjNp+e+EnhGO1z2KE8j/YSibo3xmT
 q4NgY5m3lW13KaY3KJgHeiTN2KK6UnfUsafEuJV5rR2bJ9feH+cWlfopBMBKryrX
 /sLhwQvRLn92iacrDCsC1sPEots6vEHdKzxpxEpslYjZV51vcTaxa2WmyRbIFy+C
 KUnQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nspUxtSpiIyKBhsWG
 X9sKOmoo48rdh+1kzg0wcXDtpY=; b=YXMGJ+cXKjlu6syqYsullGSMlhruLqswj
 AKasyDw+58BabxPaJa4eNmuGFmwRDPuH4AgCMI8IAZudAJw8EPF3YKU/3jpWKaCz
 PbQi55vmnumVwbFI2ZMOvS8ctZ4d+ZoBUtAfXFcNb9zL3cHALzvbjsL2kdKk/+Os
 Ma3OPRHN+bKbu2ZqBivh9034SEccKE4RDKyOyGBG3U4+fYr8CiHSkDpGCHl8sRYd
 9tiH6nst24GXxK/6U0yHQWISl0+FfITDAbgKxi99RluM5Y3xV239gA4zo+0jzD2N
 arNPxwLbcR2hTFbmfnFTIDLqucnkWaBNYbW+2ESZWGZEcRb+Ev6mA==
X-ME-Sender: <xms:ONOaYN1iacpjMnN4IbXyOJNTz3kRxj2-Uc-Mw78UrCRyYxy3yVI2EQ>
 <xme:ONOaYEHCY--QAix-B7IhP8b12Btenu1NPa4R72_-wBh4xEsNNoibkngrtZ5r1u3wG
 SRUozVJmT2JIrjlMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepghhushhtrghv
 ohesnhhorhhonhhhrgdrvghtihdrsghrnecuggftrfgrthhtvghrnheplefhheffleffte
 eufeeijeevgeejieetvdefueefgfehjedtjedvheegkedvieffnecukfhppedvtddurdek
 tddruddrieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehguhhsthgrvhhosehnohhrohhnhhgrrdgvthhirdgsrh
X-ME-Proxy: <xmx:ONOaYN5zTPcQLFoxQZSeMlQH8Lcq8ATwooennu64Nj4uTbjjcOP8Kw>
 <xmx:ONOaYK01MpV0KQLy5r4M04QoGEEp082RIdCa-9soT7yfL3KUqziqsA>
 <xmx:ONOaYAENWmApqh81hSbNNgdcGRLz-KiyjlywMZE0kWyp43CKOLIw6g>
 <xmx:ONOaYFNHqOkShxT2LiDp0sbZ1aH9FMbjjxZ0eIgwhH-YycRetJRvbw>
Received: from localhost.localdomain (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 14:55:50 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] cocoa: keyboard quality of life
Date: Tue, 11 May 2021 15:55:36 -0300
Message-Id: <20210511185538.29344-1-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21;
 envelope-from=gustavo@noronha.eti.br; helo=wout5-smtp.messagingengine.com
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>,
 'Akihiko Odaki ' <akihiko.odaki@gmail.com>,
 Gustavo Noronha Silva <gustavo@noronha.eti.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.eti.br>

v4 moves the code to add the tap to the set function, which
not only sidesteps the issue pointed out by Akihiko Odaki
but simply makes sense - full-grab is not a runtime toggle
and there is no reason to have the tap set up if it's not
turned on.

It also fixes the commit message for the swap-option-command
option to no longer lie about it being turned on by default,
as pointed out by Gerd.

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



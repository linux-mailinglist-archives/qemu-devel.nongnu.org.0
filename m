Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82113D9C59
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 05:42:26 +0200 (CEST)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8wwD-0002As-5N
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 23:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1m8wuC-00009c-8g
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 23:40:20 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1m8wuA-00020d-KN
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 23:40:20 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 379DA5C00F5;
 Wed, 28 Jul 2021 23:40:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 28 Jul 2021 23:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=ODwCBq7wegck/HFqBN+a32/MgY
 7o/asTBCljFCvCiv8=; b=F20r6A33IsvaD0qk9evvHG+RVe2OECIbQXSzoWBpE1
 3nw77roq/ZUMhGCDQi8ixKGPswRQrza2FbWdwx2xuU1+NZljVGru1dm0APx7BxNz
 xsOdW/JzhSr7GrqnJNQfnb4sHubrwa3sZMIiOcLap64roHoF31R+mxt3jIbKiAjG
 d1UxuMzr81Sig6zXcppQl136FqT/fMYWHxYKdyIyIJYA7lPRqgtRRp7ixv9wqYDc
 61oyTlwuzdhH3nrPHd1O05ue+XxcZUFprraj3ZGakqmvUPIWduVzVo70kn0ONebs
 hLyVYwRTVg3JO3/8YYBHikrkD0zSUvMD/UKkO7FYUcpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ODwCBq7wegck/HFqB
 N+a32/MgY7o/asTBCljFCvCiv8=; b=vbXUJ+JZpWvEp18f+fJut1kOXaaWXIHBu
 7wXZMVtpxmiP7Af6mzxKneZ6zOlp5YwoaSP/9EVSloPeOnFZT6jIfw1Fjc28Ld7B
 2joH6dEcrzHd+h4CL95P/hGhQvxf9lTcufPRUgK7vMvsi4y1o/sS5bakVGitYAWG
 7ab/hRl3cIX8C80lkRHyd7sUKReucGqe9MjgGUqVlmj5t0QALsA+nDuKp9q5D3qY
 xJaDFu8oZEEUzF9Z09M5KA9dDyjARidjmAwvRUPD2+NY3cs8+S/1AoYg0p21Cl+B
 CNI/ueWWisFOtIkG3tIG4J+PoAQ9zd9AKyRA4dM+GaVu/QvRvMCbg==
X-ME-Sender: <xms:HyMCYfPuHFz6vc3wL9bQs1tEaXPON_PMk2d0hKVdpKEowzPJiv4E8A>
 <xme:HyMCYZ8r-oCWV3AtGf6mdc7Vowsgq_f7Plh4UAkLpaeBXJRGN06X5NUFslU7vyCYo
 u2RvlbSVbdbpGZqHHc>
X-ME-Received: <xmr:HyMCYeTEqb1SajAOWUkszWMEdUyEEwxQ0BFFGMgcxVDqJ4L79mTW6RzAb8xQXHiApvRHz0rWS-HS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedtgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfejtdektdeuhedtieefteekve
 ffteejteefgeekveegffetvddugfeliefhtddunecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrth
 drtghomh
X-ME-Proxy: <xmx:HyMCYTsZQcdy59mvFKmmRf1kMQwt8fKW7DiQqp_eggVTif8dOR9e2w>
 <xmx:HyMCYXeECvxcySpVYliLJkRUVEnglW1f6Sozwyewplt704hcxtDPvw>
 <xmx:HyMCYf3sF5St0sk6-fept0UZLFXigHE1OKvqRLQjLVZp6kU_Y_4S0g>
 <xmx:ICMCYT4VgDyfu248AeNM65PiEn0ZDNV5Btov0-cdzYDBg3dkiKGt7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 23:40:12 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/mips/boston: ELF kernel support
Date: Thu, 29 Jul 2021 11:39:56 +0800
Message-Id: <20210729033959.6454-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
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
Cc: aleksandar.rikalo@syrmia.com, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jiaxun Yang (3):
  hw/mips/boston: Massage memory map information
  hw/mips/boston: Allow loading elf kernel and dtb
  hw/mips/boston: Add FDT generator

 hw/mips/boston.c | 351 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 323 insertions(+), 28 deletions(-)

-- 
2.32.0



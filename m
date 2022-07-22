Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96CE57E684
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 20:28:25 +0200 (CEST)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oExNw-0004lW-RE
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 14:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oExKt-0000QK-B7
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:25:15 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oExKq-0006WS-SY
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:25:14 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 295D6580AF1;
 Fri, 22 Jul 2022 14:25:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 22 Jul 2022 14:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1658514312; x=1658517912; bh=eY43z7V+xP
 SqseBkqisHqO0bop4505Xg8bYZOIpraBU=; b=G1nalh6t7+LtR1ig01ybmRb7/t
 Z2zjJmIqKfOzgPwAtAcPTVJQPvF1WJf1VCTyl50kDu7CJyM2A2ZByMRgmmkRsuiM
 kWikze6xsZLwIaMav8q4GT5AQjbDRaK0q38uLkZeF1q2qrek0/7fbDrOjqecu6N2
 aWBotE3zPj+q+Sog00D3S+ZPPNWWW05zilhwb1M8KSVlbYXmx/MG2+EZlpufS9xo
 8/HgU73Q4M7ut76AVC8dPoWnjPbgQXOz5L8gdCj0irxwck6u4zhTzIfy2qb2edpj
 5c/THK8WHG3QzlMggw4dq2PL58Zc42dUmxQFkMIXuTjzrtIw7Ca7s+RHOWDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1658514312; x=1658517912; bh=eY43z7V+xPSqs
 eBkqisHqO0bop4505Xg8bYZOIpraBU=; b=rZmb9Id6SeV3m4Adt8JpBncf5si8w
 QRB/vibN9IeS058/vmIfY6CDED2XTwrCLRFRckI08bjvHEK9dVdSrkgMjIRDqyrE
 D+TxpVYqxRps8rSIuAj9yc4abnxIxbSMXqwmU0R9xZnifPcrqnzcq3OiElnv6Tps
 ta1vL0YiS88tEnkk0q5IGMol9yAfnmfSO4n5+xXgo694u7dGQIi0d65eVyzhJ/BL
 TeP545cV5SFKJdvN/sGzwZ8UHuTIa9W3xRPq4EVK+O8jXsyKXHu7P98cmapAzRFk
 XuW0LhR3zgt281Famss3TnxwBPubG3Eex3F0WptWt2mQhlEdj8TAqeqcw==
X-ME-Sender: <xms:h-vaYsSzWX64UMBm_yKQQXhl8qeR1n4qy0IO2eivAx4wiMEy2m41zw>
 <xme:h-vaYpy-WVw0b8CMliahNslPRgipKAzEJGs6lK2ZlXPAO3ysNb7jtA0cc90ihFSmP
 1MDZc5ysHiEuxrlcmY>
X-ME-Received: <xmr:h-vaYp2opurKEc4U3PCnIOJ-ivokulG0XdrB0sFa6cp8U--0CBWNh1oSkbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtvddguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
 dtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepteffjeetjeeggfffvdeuhfegledugfefudeuledtfefgudfhteduteeu
 ueejueeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:h-vaYgBFEoAEl5bKqTYNMGja9OBWBKYS60h24S0JRXscG3ueqVMTkg>
 <xmx:h-vaYlglCcohS5Ibhp9y6NlHVQMVaVXuTCebyABSmZVy1M5DqSPW_A>
 <xmx:h-vaYsqSeHtgEDqji30XNQtSnh2kR9S-nEXs9cyh3KGVzZStb6P-yA>
 <xmx:iOvaYgWSa2hKfdHi5XZhh4hZTuEdMHisa8PoHcuMvU2O0CpXMri1CqdDAIs>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Jul 2022 14:25:11 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org, berrange@redhat.com,
 peter@pjd.dev
Subject: [PATCH v3 0/1] python/machine: Fix AF_UNIX path too long on macOS
Date: Fri, 22 Jul 2022 11:25:07 -0700
Message-Id: <20220722182508.89761-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM28=0.798, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v1: https://lore.kernel.org/qemu-devel/20220705214659.73369-1-peter@pjd.dev/
v2: https://lore.kernel.org/qemu-devel/20220716173434.17183-1-peter@pjd.dev/
v3:
    - Changed QEMUMachine._name to f"{id(self):x}". Suggestion was to do
      f"{id(self):02x}", but the id's look like they are probably just the
      object address (8-byte pointer), so the "02" had no effect.
    - Changed QMP socket name suffix from "-monitor.sock" to ".qmp".
    - Changed console socket name suffix from "-console.sock" to ".con".

Thanks for all the comments and suggestions! Glad to be fixing this.
Peter

Peter Delevoryas (1):
  python/machine: Fix AF_UNIX path too long on macOS

 python/qemu/machine/machine.py         | 6 +++---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.37.0



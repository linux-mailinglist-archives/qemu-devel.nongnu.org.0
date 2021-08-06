Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7CD3E2CEF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:51:57 +0200 (CEST)
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC1CW-0001GB-DM
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qyliss@x220.qyliss.net>)
 id 1mC1B2-00084b-ES
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:50:24 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:40155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qyliss@x220.qyliss.net>)
 id 1mC1Az-0002hf-Rq
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:50:24 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 13288320046E;
 Fri,  6 Aug 2021 10:50:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 06 Aug 2021 10:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=32JuJNA26l95V9hq43OzZjt7p6
 2jluxGcrx5aaLk0hw=; b=pujyBwx+K7Ig2Dl7VlT+aPsW9gd1HNgV7W0CF1ndZL
 Ih4iATU9S3gm6Tf+gD17zIhzJgZaetgXAVqOEj3GJZzYSqqKPU9Vc+7ROUCAGxHm
 Be36h+iMn3eH/OWJrc55s0k6oZQgE8T1/oWBZe9aMO6lNRN//fCYwDPxS1zI175D
 X0zV0xHDEHqOAlNVd6Hh+fT023mmz2FaFLJQ3B0C6WSSNGYPeW20U2hx1T3xEmQm
 xEUIPx83DLDtk1OpWEw2EMh57/4eX+X2rSsRYaaRHB+4pYy5Lu8su/MQDBSJgELG
 LIPiMCn6yjxqfSr7HLxVjL1ud5RichV8OMD3zg7O2fcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=32JuJNA26l95V9hq4
 3OzZjt7p62jluxGcrx5aaLk0hw=; b=akfE0acwnO3erTbqQrcWHtOiwjg5Y4U6u
 H9P0AR8IJl1Ri6k1Z6LL+np7jx0YnPLpwLhVqc7vzcQab8oF9UJnTnMzov6LixXb
 NIxbopH6PsfYEu0Ou1vTvqv0A+dmyxYfR8mERCMq3KMJmKbp9CcsxiPQL9C5/z8x
 18pELUSp2bseaTJ/O5JR2w/0Ft5JWku9KQA/0BvfWYRZ7SKQvlyXpfyaMr4cmgvr
 1yW6fKvRVmgyskhCcWHf6SFp8oyRoZVrC1i+BTKcUT7NM5k0xkbEnDhZ0l0tONeR
 jOs8QMjur+Fecz+rmNfBweM0djiyKEvZqX3V59yC0UPmSJmkWLSQw==
X-ME-Sender: <xms:K0wNYXEuw3t19jayM7qDj92UC6618LNKUDDmZJsAoBd1LaUsj05gMA>
 <xme:K0wNYUVo9iOPcb7HfIaNmbeFaAZ8kcz7Nn8_GFhCub3gnZ6vEOnNXpO2Kv8KdMC1y
 wK2GidSkk6_TOCQBw>
X-ME-Received: <xmr:K0wNYZK7lJ6k0n9-ZLUuukWLcNGkE8hoy5qGODDWKrAEsUINffn7MWHZJbq8FKttyYRBMT3ijVazJqzv0qY3zT8Z9WcLCQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedugdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlhihsshgrucft
 ohhsshcuoehhihesrghlhihsshgrrdhisheqnecuggftrfgrthhtvghrnhephedvfffghf
 etieejgfetfedtgffhvdehueehvdejudfggefgleejgfelfeevgfefnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepqhihlhhishhsseigvddvtd
 drqhihlhhishhsrdhnvght
X-ME-Proxy: <xmx:K0wNYVF1VPEsegNIu1VkyAXVsLniNUG2o6WJsYz32dafmudgdJ54BQ>
 <xmx:K0wNYdV9TEPf9SPD8_7FeldOdFi2pRvy2WQTcNsBVht76Jky3x22VA>
 <xmx:K0wNYQOO4Zce3WADjliwkS4mHT7c4zDHalm4oqBXj4cPqL3IHIMxXw>
 <xmx:K0wNYaiQl2YFNNsdVxiwSpXXCj9EvJqnxCiIC-DqnR8vP78QWpQYjg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Aug 2021 10:50:19 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id 711CA236; Fri,  6 Aug 2021 14:50:16 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: fix logic for gnutls check
Date: Fri,  6 Aug 2021 14:49:47 +0000
Message-Id: <20210806144947.321647-1-hi@alyssa.is>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=64.147.123.20;
 envelope-from=qyliss@x220.qyliss.net; helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The logic before was

	if not get_option('gnutls').auto() or have_system

Which is equivalent to

	if get_option('gnutls').enabled() or get_option('gnutls').disabled() or have_system

This means that the check for gnutls is performed even if gnutls is
disabled, which means that the build system will insist on having
libtasn1 if gnutls is found, even if gnutls support is disabled.

When gnutls is disabled, the check for gnutls shouldn't be performed,
to ensure that further build system logic (like the check for
libtasn1) doesn't make decisions based on the presence of gnutls,
rather than the gnutls option.

After making this change, I can successfully ./configure --disable-gnutls
on my system with gnutls installed, but not libtasn1.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index af9bbb83db..b3e7ec0e92 100644
--- a/meson.build
+++ b/meson.build
@@ -824,7 +824,7 @@ endif
 
 gnutls = not_found
 gnutls_crypto = not_found
-if not get_option('gnutls').auto() or have_system
+if get_option('gnutls').enabled() or (get_option('gnutls').auto() and have_system)
   # For general TLS support our min gnutls matches
   # that implied by our platform support matrix
   #
-- 
2.32.0



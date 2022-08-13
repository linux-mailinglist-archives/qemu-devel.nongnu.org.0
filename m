Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9EC591C04
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 18:32:57 +0200 (CEST)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMu4F-0005ha-GY
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 12:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oMtz3-00086u-M3
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 12:27:33 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:43891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oMtz1-0005TH-SV
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 12:27:33 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D75DE5C00D2;
 Sat, 13 Aug 2022 12:27:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 13 Aug 2022 12:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1660408049; x=1660494449; bh=XMqhHTPXNp47zQ+IQDA1BQeRR
 hq+b6efrKcP0FLn2As=; b=VYBJdZO5pI0jcerKHiSaLKynbAIM9O1nzpN3fAYAE
 aLVMIHsrUY37pcisaa92Ajl5RaA6J1yz54zhDKlGuiYxXqj83cB+PBH9S89AJHt2
 VTuGRoYfn+E22zEcBRkrpa+bvNo/FMGLtCb+wmyq4vuP4HGOtPPGqECN9k942FTj
 vJ7HbcPMvQ3xDBAAjJc+eQ73NtFl7eYI4RdmLf2wRdpUNHc8U7TRa2caMuJnIOoN
 8SWsRQ6yRsYVWlCOmaENdCn1zqqY6yRWdQNLP0c5ZNHNvVTfkfpAxEGYtuM6zwqG
 vuRAYxIHcd/5KfNHpM10ST+GerrpTnWxgYUDWufCjQ2XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1660408049; x=1660494449; bh=XMqhHTPXNp47zQ+IQDA1BQeRRhq+b6efrKc
 P0FLn2As=; b=IiKKJeyqXTRpkSHQQr0LvHpVJZBLBnWnXF6x4kpR+B3Q2orHm9x
 C3GhEPIcr7URk7x2JPAbQg+fRvv0He7jJiuOHyn0MnfxotPsAJhPb97CxQLO5652
 HSJiV0t0UVpX0+ISVpQXZWPDl4YsCbOz6wR7pVtHd0ZiRp9UL/yiOZeb//yxTpmK
 SAEEbBeTgLOx3v7FyqWvcYs9+2Wu8+R41xNZ+xbWthKPMXUhRbAKwesltr9mDikB
 T3FA/9iJvFTOGjJVAx1lTQPEGsFlydh0kQQBXHaWBwhlaFXkV4dn09as0PfOZIww
 i+nCi9EJeV1/obUdC9/RH9GMb9UPGwik+kQ==
X-ME-Sender: <xms:8dD3YoI6j52OuFOCWowzt7DKRTcYFpZxRHjL-mE0BcYDGbYs7U5P-g>
 <xme:8dD3YoLRWrjEX7px-BiFUxkdwwUZuDk4YW4xNBVkF6t4uJt3J0gsh8PQZK0Ul0NEO
 IEauX-L6n5SjjYYS4w>
X-ME-Received: <xmr:8dD3YotYHu5vt9uTRY9IBeWIJTFPXprLMV8gw5Imc1fhHmc8sbNj6OeusntZNEio1_aRUS4juy3lb8G6hum71fLuqOFZziBvNmU51t4YB5oe_yPKMWu3VSd3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegkedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
 dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedutdduveeileejje
 etffehueejudehgfffjeduhfeuleeludfffefgffevkeenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
 horghtrdgtohhm
X-ME-Proxy: <xmx:8dD3YlYBgBUQshNMZdr3aryIzDaMSUUlpoNTE4Wvh7vdANJq8wrjPg>
 <xmx:8dD3YvaZPzT2ZvklN0S7Cn52DTe_DURrU98v7nxmeUN7CCEbLglQhw>
 <xmx:8dD3YhAuFieAtJeSoF5fQIhS_-hcmVsh4HPToyQ1G1CL2Osoy2QwGg>
 <xmx:8dD3YmyhGf2ZAdZemg89XWbwhUYlXyoH5bcnsLxVGXe3muZ0SfsNjA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Aug 2022 12:27:28 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] hw/mips/boston: Initrd support
Date: Sat, 13 Aug 2022 17:27:18 +0100
Message-Id: <20220813162720.60008-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Hi all,

Just a small addition to make boston board easier to use :-)

Thanks
- Jiaxun

Jiaxun Yang (2):
  mips/boston: Support initrd for ELF kernel
  hw/mips/boston: Pack fdt in fdt filter

 hw/mips/boston.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

-- 
2.32.1 (Apple Git-133)



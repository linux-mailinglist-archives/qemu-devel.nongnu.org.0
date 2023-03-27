Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C926CA2E9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 13:57:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pglSL-0006vK-Ar; Mon, 27 Mar 2023 07:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1pglSF-0006u8-Ah; Mon, 27 Mar 2023 07:56:04 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1pglS9-0001ea-Nf; Mon, 27 Mar 2023 07:56:00 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3F7E4320077A;
 Mon, 27 Mar 2023 07:55:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 27 Mar 2023 07:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1679918152; x=1680004552; bh=Enlbqk+iZu
 4UIwjG8EbGt7vugYorEWZ9LU5bJH3YtBc=; b=md0OclHYscYnj6XKqaL8yBRF/E
 H6vaNIHP9ETbe6OnyRHyiKkGpQ9gYyneNM+FpUpq59fKN+y+4p4EiLSAwoAI0t2v
 buyuo7qFoi+fNOoOG++FI8ZUeBShzrqluCoPT++vLXF/2cZ+72DllKYdtM2/2vhh
 ueYLMemKtPCJmZL+d3kPSB7TmrrwEnL8yKzzhCkm0tmi+vSC3KkT+NCYOLI57U6+
 20wVczflKPpyI7dwHb2gLn9Tg0oJHZR/sQYMkoV0o12Epi+QRLVF8N8FXzF0TPwQ
 FsV5OtpE/WPebzVVhqeGqKA/fZGYRozQ6xRboZpr9uulQOJx7sStUmSXI22A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1679918152; x=1680004552; bh=Enlbqk+iZu4UI
 wjG8EbGt7vugYorEWZ9LU5bJH3YtBc=; b=RVy3LQEKuwVWQGWbG/t95q3jEc7sD
 ief9aQuShZaK7mLaR6Q2JF7dW6bYY/Iv85i2ek5I+JLw9GP/3X3YmdpCMTth8qMF
 xZiUzTlds0sm0boB5l/eDLdXQKrw6XoTfStuVvWZ+bGm8955Z41bTpPH3IImo9FE
 4aeAVZ/7MNHmkAhNl5yDs/kU87Raedx6lX8KKYuDyEPI6PN3YENaFFrVmebtQsb+
 407SkfYEYM2+0OoDHXlmE2Pvwp6RmjuF870jNL3WwmyLMTtF0JZMFNZHvqPhZv1x
 j7Xzw0fLcXCsCkW5saD/gLRbKIkxR6kEpfR0TdPB84oXh+CY5kYPzkxmQ==
X-ME-Sender: <xms:SIQhZFXnNpUFncZ13KdGXvkqcbQ4g7cva1BIppOpspTzYFLux9QRsQ>
 <xme:SIQhZFn5iByY5D-teJy-pY9bA31wzNJO0Ns7m7QCbMBDxZsRaNGPTYfSNq3YtiHEX
 BtzidcSHDQavt3c8Q>
X-ME-Received: <xmr:SIQhZBZ5xDmHtfkzYndSRgch3K2GJlP1oOE71fmiG6daqOG2VTrq9P0hAbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeffkeevjeekueegveehffdvuddutefgve
 dtieduleeuuefguedtgfdvffehleehffenucffohhmrghinhepghhithhlrggsrdgtohhm
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:SIQhZIW-nBZwwaep1dqddAN30Mlw5_O0II_qOLgUBbZFiMt-IzGiPQ>
 <xmx:SIQhZPlgyKgCBH2nZZKEcM_K1x0N529p7d23kW6DbuqjbB3-GkU5zA>
 <xmx:SIQhZFec47juLBET6y-6uex1rDU9mR8Rxkzpy51-m6CVkwlgwO6CNA>
 <xmx:SIQhZHs1GYSTc5N4kQeULmw9JykbZcMy0RATEJvEnR1w4fi5be1EWQ>
Feedback-ID: idfb84289:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 07:55:50 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	laurent@vivier.eu
Subject: [PATCH 0/2] linux-user: Clarify error on failure to map guest address
 space
Date: Mon, 27 Mar 2023 22:25:22 +1030
Message-Id: <20230327115524.1981482-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=andrew@aj.id.au;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello,

This series is a couple of trivial improvements to the error message from linux-user's ELF loader
when it fails to mmap() the guest's address space. Both issues caused me brief confusion when trying
to sort myself out after hitting https://gitlab.com/qemu-project/qemu/-/issues/447

I've build tested the two as a sanity check.

Cheers,

Andrew

Andrew Jeffery (2):
  linux-user: elfload: s/min_mmap_addr/mmap_min_addr/
  linux-user: elfload: Specify -R is an option for qemu-user binaries

 linux-user/elfload.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A63A58FB
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 16:17:52 +0200 (CEST)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsQvv-0006uf-PM
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 10:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1lsQqs-0003lF-C8; Sun, 13 Jun 2021 10:12:38 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:34172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1lsQqp-00010v-Us; Sun, 13 Jun 2021 10:12:37 -0400
Received: from fornax.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 8EFF42078B;
 Sun, 13 Jun 2021 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1623593551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PUQ1DJ4jG4ehC6EBnB+Us6a/GP6moAkXkqSSklhFaFA=;
 b=TcvRdo8qk2pjVBI9N6HRsp5O7IaPHIeYmEFPKHDjucXCVN1U7bXw6FtCfvIYW8tCBe+21C
 8VxTJ4l+nClg050ERkBqZF4TuJ/FIldgvoeSJhKW99uArNXY8IHZOXveo6pcKk5eTVWvSt
 ZF1LkifipGZUdw2qScmhCNFeDmSoxVg=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] QOMify Sifive UART Model
Date: Sun, 13 Jun 2021 16:12:20 +0200
Message-Id: <20210613141222.548357-1-lukas.juenger@greensocs.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.juenger@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, mark.burton@greensocs.com,
 marcandre.lureau@redhat.com, palmer@dabbelt.com, pbonzini@redhat.com,
 alistair.francis@wdc.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>,
 luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I have cleaned up the indentation as requested by Philippe.
Also I added reset and migration capabilities as requested by Peter.

Thank you for your feedback.
I hope this is satisfactory now.

Best regards,
Lukas

Lukas Jünger (2):
  hw/char: sifive_uart
  hw/char: sifive_uart

 include/hw/char/sifive_uart.h |  11 ++-
 hw/char/sifive_uart.c         | 152 +++++++++++++++++++++++++++-------
 2 files changed, 129 insertions(+), 34 deletions(-)

-- 
2.31.1



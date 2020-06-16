Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7CC1FAA01
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 09:35:21 +0200 (CEST)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl67s-0004U7-7r
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 03:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1jl66m-0003IC-0z
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 03:34:12 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:57322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1jl66k-0004mz-C3
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 03:34:11 -0400
Received: from localhost.localdomain (unknown
 [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
 by vultr.net.flygoat.com (Postfix) with ESMTPSA id B693920E84;
 Tue, 16 Jun 2020 07:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
 t=1592292848; bh=f0qrrdVDkBFjfoTw+NWQeF684YcrZ6BHmJ92t5J4Ims=;
 h=From:To:Cc:Subject:Date:From;
 b=CgRYFKdcUaZv8qwdqDjPLverv+LcRQkhLVUHgrbr3dyiMFwaXcx8RH9kNo4/tkPxZ
 8XQ++yLYGppMRZBuYtVuoQgroOA1NueaLLsKOAnSpDw9AGmBLHkLa141omEmobKd7W
 gAi524/QXBTHQPtRKFPN+LiWx7LRVYuRrkWBPuPW1Zs6HywEZFCrRLr7Y9EwBmQrW+
 0Oing1vnv+N0cFUEB/q8e5cH0ARcCzqviC6b0nFCEZZ3iw4mfWOnrn+uiTQM2oEYd7
 9Q3NR67FViClG5jxWjBy82oOI2zMBfUWFe7c39V/vsMEzg/hXFrXM56y+fqgb/8zoF
 h04BD2Tiy5u6A==
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] target/mips: Add two groups of loongson-ext
 instructions
Date: Tue, 16 Jun 2020 15:33:57 +0800
Message-Id: <20200616073359.2999656-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=149.28.68.211;
 envelope-from=jiaxun.yang@flygoat.com; helo=vultr.net.flygoat.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 03:30:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: chenhc@lemote.com, aleksandar.qemu.devel@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the sucessor of:
"Basic TCG Loongson-3A1000 Support"

Thanks!

Jiaxun Yang (2):
  target/mips: Add loongson-ext lsdc2 group of instructions
  target/mips: Add loongson-ext lswc2 group of instrustions

 target/mips/translate.c | 437 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 437 insertions(+)

-- 
2.27.0.rc2



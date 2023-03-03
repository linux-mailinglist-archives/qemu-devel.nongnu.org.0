Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E896A9CD0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:10:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8tr-00063t-RZ; Fri, 03 Mar 2023 12:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pY84X-0007Q4-T2
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:15:55 -0500
Received: from azure-sdnproxy.icoremail.net ([52.229.205.26])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <chenbaozi@phytium.com.cn>) id 1pY84U-0008NW-CC
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:15:52 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwBX0aKeHQJkd8IdAQ--.4329S2;
 Sat, 04 Mar 2023 00:17:34 +0800 (CST)
Received: from localhost (unknown [113.247.214.165])
 by mail (Coremail) with SMTP id AQAAfwBnRPQgHQJkp4AAAA--.554S2;
 Sat, 04 Mar 2023 00:15:30 +0800 (CST)
From: Chen Baozi <chenbaozi@phytium.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Define Impl. Def. registers for Neoverse-N1
Date: Sat,  4 Mar 2023 00:15:16 +0800
Message-Id: <20230303161518.3411149-1-chenbaozi@phytium.com.cn>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwBnRPQgHQJkp4AAAA--.554S2
X-CM-SenderInfo: hfkh0updr2xqxsk13x1xpou0fpof0/1tbiAQAHEWQA7A0IoQAJsy
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=chenbaozi@
 phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7XryxCrW8AFW5ury5ZF45GFg_yoWxZFgEgr
 yIqryDGr1jgFyjqayxAr18Ary3trWkWr1agF1DJF1YqFy2qr4kGr4DWrWkZry8AFWIvr18
 ArZ7JrWSkr17WjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=52.229.205.26;
 envelope-from=chenbaozi@phytium.com.cn; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 03 Mar 2023 12:08:53 -0500
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

When booting sbsa-ref board with Neoverse-N1, TF-A's would try to access
implementation defined registers in it as well as in DSU for errata.
Add the definitions for these system registers to make sbsa-ref boot
with Neoverse-N1.

I have noticed that there is a patch series under review which move TCG
CPUs into tcg/. Therefore this patch should be rework once that patch
has been merged.

Chen Baozi (2):
  target/arm: Add Neoverse-N1 registers
  target/arm: Add DynamIQ Shared Unit control registers

 target/arm/cpu64.c     |   2 +
 target/arm/cpu_tcg.c   | 114 +++++++++++++++++++++++++++++++++++++++++
 target/arm/internals.h |   2 +
 3 files changed, 118 insertions(+)

-- 
2.37.3



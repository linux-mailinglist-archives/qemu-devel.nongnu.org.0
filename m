Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E912F2A7E92
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 13:30:10 +0100 (CET)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaeP3-0001xL-V1
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 07:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kaeN2-0000cY-2J; Thu, 05 Nov 2020 07:28:04 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kaeMy-0004Hf-Nf; Thu, 05 Nov 2020 07:28:03 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CRjTK0mzyzkcW8;
 Thu,  5 Nov 2020 20:27:33 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 5 Nov 2020 20:27:31 +0800
From: shiliyang <shiliyang@huawei.com>
Subject: [PATCH V2 0/4] bsd-user: Fix some code style problems
To: <qemu-devel@nongnu.org>, <philmd@redhat.com>, <pbonzini@redhat.com>,
 <david@redhat.com>
Message-ID: <1644ceed-b448-782e-24ed-5ceaf3e16335@huawei.com>
Date: Thu, 5 Nov 2020 20:27:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=shiliyang@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 07:27:41
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series fixes error style problems found by checkpatch.pl.

V1->V2:
Add cover letter message.
Fix some style error in patch file before.

Liyang Shi (4):
  bsd-user: "foo * bar" should be "foo *bar"
  bsd-user: suspect code indent for conditional statements
  bsd-user: space required after semicolon
  bsd-user: do not use C99 // comments

 bsd-user/bsdload.c |  6 +++---
 bsd-user/elfload.c | 38 +++++++++++++++++++-------------------
 bsd-user/qemu.h    | 14 +++++++-------
 bsd-user/syscall.c |  6 +++---
 4 files changed, 32 insertions(+), 32 deletions(-)

-- 
2.29.1.59.gf9b6481aed


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B152F9766
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 02:43:27 +0100 (CET)
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1JZm-0006Tw-7t
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 20:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1l1JYX-00064B-P2
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 20:42:09 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:43430
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1l1JYV-00076s-0f
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 20:42:09 -0500
HMM_SOURCE_IP: 172.18.0.218:7872.1998259952
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-203.57.249.251?logid-52fd3e3c6e2b4271ba191963fb8f5716
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 788882800CB;
 Mon, 18 Jan 2021 09:41:53 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 52fd3e3c6e2b4271ba191963fb8f5716 for
 qemu-devel@nongnu.org; Mon Jan 18 09:41:55 2021
X-Transaction-ID: 52fd3e3c6e2b4271ba191963fb8f5716
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: <qemu-devel@nongnu.org>
Subject: [PATCH] docs: fix the annotations error of struct X86CPUClass
Date: Mon, 18 Jan 2021 09:41:51 +0800
Message-Id: <1610934111-59632-1-git-send-email-huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Hyman <huangy81@chinatelecom.cn>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman <huangy81@chinatelecom.cn>

change the 'cpu_def' to 'model' in struct X86CPUClass

Signed-off-by: Hyman <huangy81@chinatelecom.cn>
---
 target/i386/cpu-qom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index f9923ce..ab33370 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -37,7 +37,7 @@ typedef struct X86CPUModel X86CPUModel;
 
 /**
  * X86CPUClass:
- * @cpu_def: CPU model definition
+ * @model: CPU model definition
  * @host_cpuid_required: Whether CPU model requires cpuid from host.
  * @ordering: Ordering on the "-cpu help" CPU model list.
  * @migration_safe: See CpuDefinitionInfo::migration_safe
-- 
1.8.3.1



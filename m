Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881904CAD40
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:14:01 +0100 (CET)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTU8-0007ol-L8
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nPTCl-0000nu-Oy
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:56:07 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:34390
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nPTCk-0002Ta-0h
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:56:03 -0500
HMM_SOURCE_IP: 172.18.0.48:33516.1563282441
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.98 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 562132800A0;
 Thu,  3 Mar 2022 01:55:57 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 831308c7b6ce4acaa290387b2f33b8df for
 qemu-devel@nongnu.org; Thu, 03 Mar 2022 01:56:00 CST
X-Transaction-ID: 831308c7b6ce4acaa290387b2f33b8df
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v17 8/8] tests/qtest/qmp-cmd-test: Ignore
 query-vcpu-dirty-limit test
Date: Thu,  3 Mar 2022 01:55:14 +0800
Message-Id: <324b04870910c6fc489d0b1e4fe4e098737ae8c4.1646243447.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1646243252.git.huangy81@chinatelecom.cn>
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1646243447.git.huangy81@chinatelecom.cn>
References: <cover.1646243447.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

query-vcpu-dirty-limit success depends on enabling dirty
page rate limit, so just add it to the list of skipped
command to ensure qmp-cmd-test run successfully.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/qmp-cmd-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 7f103ea..4b216a0 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -110,6 +110,8 @@ static bool query_is_ignored(const char *cmd)
         "query-sev-capabilities",
         "query-sgx",
         "query-sgx-capabilities",
+        /* Success depends on enabling dirty page rate limit */
+        "query-vcpu-dirty-limit",
         NULL
     };
     int i;
-- 
1.8.3.1



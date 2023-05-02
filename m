Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFA56F4014
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmFa-0005Jf-AL; Tue, 02 May 2023 05:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFX-00056k-9Q
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:43 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFV-00044D-M2
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019480; bh=geucgPRYPav+0JfmPTY3isc1cSilmnjEYSHJMnbwUxk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=FTfc3tK3M3Hjp+6nb4CUNXC7i7jKZpuZDETtLjg7JuWFa6dON5NCJ+e3oYBBo76ev
 Uoit0YVUzWbuJlgdlK9RFVn06LbFXHlIp1P0+t/MWICryN496Mdp8mv0pigOpO18sC
 EbQO6J1cg0nHBk5dMbjJtXyNesL2yIsMGUbrrUvyWkUW84zLUuYdTXupXvoGzEiAi6
 RbPeommmStm21Y5ApXK++xQRUdi5VLSRTGqPEmBtm5G0o1U3JfaJprXsCu7CJLBGgW
 bmBu3O/JJf1EK/ekPxk8rY6esEaTZg8JPn8VXKEOBSap2znnI4l0IkBkhOHd8RqZC4
 sZ+emO1o1uMww==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 9C8AC2633A68;
 Tue,  2 May 2023 09:24:38 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 10/12] MAINTAINERS: add maintainer of simpletrace.py
Date: Tue,  2 May 2023 11:23:37 +0200
Message-Id: <20230502092339.27341-11-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=17.58.23.196; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06021701.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mads Ynddal <m.ynddal@samsung.com>

In my work to refactor simpletrace.py, I noticed that there's no
maintainer of it, and has the status of "odd fixes". I'm using it from
time to time, so I'd like to maintain the script.

I've added myself as reviewer under "Tracing" to be informed of changes
that might affect simpletrace.py.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5340de0515..19edec5dda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3035,7 +3035,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
-R: Darren Kenny <darren.kenny@oracle.com> 
+R: Darren Kenny <darren.kenny@oracle.com>
 R: Qiuhao Li <Qiuhao.Li@outlook.com>
 S: Maintained
 F: tests/qtest/fuzz/
@@ -3076,6 +3076,7 @@ F: stubs/
 
 Tracing
 M: Stefan Hajnoczi <stefanha@redhat.com>
+R: Mads Ynddal <mads@ynddal.dk>
 S: Maintained
 F: trace/
 F: trace-events
@@ -3088,6 +3089,11 @@ F: docs/tools/qemu-trace-stap.rst
 F: docs/devel/tracing.rst
 T: git https://github.com/stefanha/qemu.git tracing
 
+Simpletrace
+M: Mads Ynddal <mads@ynddal.dk>
+S: Maintained
+F: scripts/simpletrace.py
+
 TPM
 M: Stefan Berger <stefanb@linux.ibm.com>
 S: Maintained
-- 
2.38.1



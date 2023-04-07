Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ADA6DB574
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 22:50:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkt1u-0006ur-TL; Fri, 07 Apr 2023 16:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lauren@selfisekai.rocks>)
 id 1pkpE8-0006oh-6Y
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:46:17 -0400
Received: from mail.sakamoto.pl ([185.236.240.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lauren@selfisekai.rocks>)
 id 1pkpE4-00082M-9H
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:46:15 -0400
Authentication-Results: mail.sakamoto.pl;
	auth=pass (plain)
From: lauren@selfisekai.rocks
To: qemu-devel@nongnu.org
Cc: "Lauren N. Liberda" <lauren@selfisekai.rocks>
Subject: [PATCH] do not lockdown github PRs submitted to forks of official
 mirror
Date: Fri,  7 Apr 2023 18:45:59 +0200
Message-Id: <20230407164559.28357-1-lauren@selfisekai.rocks>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Haraka-GeoIP: NL
X-Haraka-GeoIP-Received: 2a10:3781:30b9:1:6c08:34bf:71ae:5452:NL
Received: from localhost (Unknown [127.0.0.1])
 by mail.sakamoto.pl (Haraka/2.8.28) with ESMTPSA id
 CC3F0CA8-1889-46F2-AB6A-C48DF83FE4A0.1
 envelope-from <lauren@selfisekai.rocks>
 tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
 Fri, 07 Apr 2023 18:46:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=selfisekai.rocks; s=s20191112983;
 h=from:subject:date:message-id:to:cc:mime-version;
 bh=pmSloob90lNlp0j2Kzn3XAVauEVBBgyIkfvjggpPfmY=;
 b=Wza2wji7vHUGIWEw+JGcIwg097Mko+aEgdMl6i58Z8RR1lxfjtFyUoKy5T9xpzFFYOhAdyiM7C
 P42qU7lspRGIRf9L4UqL0SLZr3SrR3BOMpfqUgB1Hf/xLJkYM2M4W4Gp3whv943rszDLwtsmXBzT
 5u2djGT4afiPo2ay9rykKcNM9fACz8kCcYIvYDBXN8pnmkAk/YSOjq23oRwmcQtO4kBsRNVBcfcF
 x4NhZTQUh8FOWZ5AnUJfI68trFQrrPhx9DMyPh9gu/pWgh8IppaXHypMahJ+2vfSl42W7cKEVw0z
 I5s0UzgFtSn1T8E749iQDAArZ/VLETFuqu02PFQA==
Received-SPF: pass client-ip=185.236.240.130;
 envelope-from=lauren@selfisekai.rocks; helo=mail.sakamoto.pl
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Apr 2023 16:49:52 -0400
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

From: "Lauren N. Liberda" <lauren@selfisekai.rocks>

qemu forks on github are typically the way of work on changes
to be upstreamed later, such as support for new devices. currently,
the workflow prevents any external contributors from submitting
code changes, and blindly points them to upstream instead.

Signed-off-by: Lauren N. Liberda <lauren@selfisekai.rocks>
---
 .github/workflows/lockdown.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/lockdown.yml b/.github/workflows/lockdown.yml
index d5e1265cff..370f1c8f7e 100644
--- a/.github/workflows/lockdown.yml
+++ b/.github/workflows/lockdown.yml
@@ -12,6 +12,7 @@ permissions:
 jobs:
   action:
     runs-on: ubuntu-latest
+    if: github.repository == 'qemu/qemu'
     steps:
       - uses: dessant/repo-lockdown@v2
         with:
-- 
2.40.0



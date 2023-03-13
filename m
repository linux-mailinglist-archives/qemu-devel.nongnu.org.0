Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA16B80D1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 19:34:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbmzp-0003M9-8Y; Mon, 13 Mar 2023 14:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbmzm-0003LH-Dt
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbmzk-0007ft-DB
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678732441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=F1i31qbkZv6CWPwg+wMSbJJ8+M5IWZ7hR8df6ZgJtNo=;
 b=Bp25GwfGk/yt51Yolcjcs0nvP8UEVDaMZxcC1yTSeoaLn2JxKjqfMsTGVsyHKgltgzmTU8
 l477OL7LPFd9LWzruRUEPDKG6jjezFZ4NicjJflTfC+7UkukPcegctpTnzLyEl7fH4ZQUN
 DGTMb5y6CecPi2NXqegrUgcIJI2I4cc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-XAPvAUu2NB6N8bm7guz-BA-1; Mon, 13 Mar 2023 14:33:56 -0400
X-MC-Unique: XAPvAUu2NB6N8bm7guz-BA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80DC429AA3B7;
 Mon, 13 Mar 2023 18:33:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE2640C845F;
 Mon, 13 Mar 2023 18:33:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] MAINTAINERS: Mark the Nios II CPU as orphan
Date: Mon, 13 Mar 2023 19:33:52 +0100
Message-Id: <20230313183352.274744-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Marek and Chris haven't been active for Nios II since years
(the last time seems to have been in 2017), and we've got
unhandled severe Nios II bug tickets in the bug tracker since
a long time, so to avoid wrong expectations of people who are
looking at the MAINTAINERS file, it's maybe best to mark the
Nios II entry as orphan nowadays.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Suggested by Richard here:
 https://lore.kernel.org/qemu-devel/cb2e92b7-40bb-4975-290d-6321c5574365@linaro.org/
 
 And bugs like this sound like the linux-user target is in a bad shape, too:
 https://gitlab.com/qemu-project/qemu/-/issues/261

 See also:
 https://bugs.launchpad.net/qemu/+bug/1791796 (comment 3)

 ... nobody tried to fix nios2 linux-user in years, maybe we should
 deprecate it?

 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 95c957d587..9780430626 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -257,9 +257,9 @@ F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/
 
 NiosII TCG CPUs
-M: Chris Wulff <crwulff@gmail.com>
-M: Marek Vasut <marex@denx.de>
-S: Maintained
+R: Chris Wulff <crwulff@gmail.com>
+R: Marek Vasut <marex@denx.de>
+S: Orphan
 F: target/nios2/
 F: hw/nios2/
 F: disas/nios2.c
-- 
2.31.1



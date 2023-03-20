Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB486C12B7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:07:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFB8-0001EJ-7o; Mon, 20 Mar 2023 09:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAv-0001Ap-8U
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAs-0006A3-45
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDR/fWUfzZfymef/vcOEC8wwFUJWqJ8Sokt6cxfB6tg=;
 b=dwQMDtzAI423VuBFlEYnTH7p3fG7m/KqKX6CI+1y8WGmFJL9BrP3+gdy1oRM1yCD4gU/yw
 9v5MeBRRzL1TWLqoBHVIMw6rYPbGj3ivJNHSme/zF6yrNnM2Lg61kMUA0oy4DB8eXMnFxg
 QCf/LHcdwbdYRkDKngNGQr6ZVW+O+4M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-ah2aIiHaMgqm5x022r6CHw-1; Mon, 20 Mar 2023 09:03:34 -0400
X-MC-Unique: ah2aIiHaMgqm5x022r6CHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2699D1008147;
 Mon, 20 Mar 2023 13:03:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12E7FC15BA0;
 Mon, 20 Mar 2023 13:03:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/24] MAINTAINERS: Mark the Nios II CPU as orphan
Date: Mon, 20 Mar 2023 14:03:07 +0100
Message-Id: <20230320130330.406378-2-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Message-Id: <20230313183352.274744-1-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1effad26d1..9b56ccdd92 100644
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



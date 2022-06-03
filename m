Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA8253C5D9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:18:30 +0200 (CEST)
Received: from localhost ([::1]:51132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1Zl-0002BC-Ks
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HL-0005fI-2x
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HJ-0003Jr-IH
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Cst2KRn5OjQf3Kyz+jgO4MMq3MKO36szn5u0CwQoQw=;
 b=NZ8dz2QMvAEaV2lyT5YS+zQGB4gtXmqBGGULJ5wmOS/ppKu26DbREkXBZBIwCWtY40O08F
 CKkfKWwSwPL9EVkKSGkilHxir6LOoLpnst6IQ4fMzhVXl5tqauVagwQToHi2GK9pH7900m
 fQRCxYkWbManc7Q1TrDNU0WH5PsZfHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-8Uohbwu8M_SGeEiShfGfsA-1; Fri, 03 Jun 2022 02:59:23 -0400
X-MC-Unique: 8Uohbwu8M_SGeEiShfGfsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F118180159B;
 Fri,  3 Jun 2022 06:59:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C900B2166B26;
 Fri,  3 Jun 2022 06:59:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Gonglei <arei.gonglei@huawei.com>, Zhang Chen <chen.zhang@intel.com>
Subject: [PULL 06/12] MAINTAINERS: Change my email address
Date: Fri,  3 Jun 2022 08:58:59 +0200
Message-Id: <20220603065905.23805-7-thuth@redhat.com>
In-Reply-To: <20220603065905.23805-1-thuth@redhat.com>
References: <20220603065905.23805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hailiang Zhang <zhanghailiang@xfusion.com>

The zhang.zhanghailiang@huawei.com email address has been
stopped. Change it to my new email address.

Signed-off-by: Hailiang Zhang <zhanghailiang@xfusion.com>
Message-Id: <20211214075424.6920-1-zhanghailiang@xfusion.com>
Acked-by: Gonglei <arei.gonglei@huawei.com>
Acked-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b7d3f9c02..ee9693dc3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3102,7 +3102,7 @@ F: include/qemu/yank.h
 F: qapi/yank.json
 
 COLO Framework
-M: zhanghailiang <zhang.zhanghailiang@huawei.com>
+M: Hailiang Zhang <zhanghailiang@xfusion.com>
 S: Maintained
 F: migration/colo*
 F: include/migration/colo.h
-- 
2.31.1



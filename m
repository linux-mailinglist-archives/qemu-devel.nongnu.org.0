Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4D268929A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:48:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNri6-0008RR-OQ; Fri, 03 Feb 2023 03:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhm-0008IV-F0
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhk-0007TI-1N
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1R2RhzTJi+l/O2B8GaVDpG5tSnL6LCRtlIgiAtH/p8=;
 b=RHwKJzNqK+3oJVBXhr0dJUStgvFZ4yDXXXQ2AV8SZHMShCdR8+sbnbZNRdU1Na5WROKJPt
 Nj59M1BmWi3AJMRL92KvbPDijSNZdXoKCcClf4nOLcCc5st0PgpIOdWMDtlBfrbGKYlCtE
 7v5UdbSvHkej+Cj7iDzy0iP68hRjzr0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-A93htLPfNQSEZJ9cqXj-Ag-1; Fri, 03 Feb 2023 03:45:51 -0500
X-MC-Unique: A93htLPfNQSEZJ9cqXj-Ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27EBF3C10174;
 Fri,  3 Feb 2023 08:45:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6FC2400F756;
 Fri,  3 Feb 2023 08:45:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B34E121E6A21; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 02/35] MAINTAINERS: Cover include/sysemu/accel-blocker.h
Date: Fri,  3 Feb 2023 09:45:16 +0100
Message-Id: <20230203084549.2622302-3-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Commit bd688fc931 "accel: introduce accelerator blocker API" aded
include/sysemu/accel-blocker.h and accel/accel-blocker.c.  MAINTAINERS
covers the latter in section "Guest CPU Cores (other accelerators) /
Overall", but not the former.  Fix that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230119091545.3116376-3-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5288eb8271..190a6f5a0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -437,7 +437,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/accel.h
-F: include/sysemu/accel-ops.h
+F: include/sysemu/accel-*.h
 F: include/hw/core/accel-cpu.h
 F: accel/accel-*.c
 F: accel/Makefile.objs
-- 
2.39.0



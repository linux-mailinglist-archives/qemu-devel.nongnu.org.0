Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8561D675AB9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 18:04:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIulw-0006KW-II; Fri, 20 Jan 2023 12:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIulN-0005zV-Ov
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:01:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIulK-0001Pi-Qf
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674234069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcB7iRWXE8mypCSvd94LlPQORJVh0f85NNfs8bSLRCQ=;
 b=Kkz8hEm7uXWVOvWxg1c9mEehEvi/o+RoiMbrOYYa3w50RthZ3+fV503d/xakQj2cFqcurx
 /SW6D99PgbC2WJj5+65pzwhCuFnNmoCYqSWZI3Xhj+Cs3oJdsunvSzrREvinI/NtDjsNXz
 N4K3EXicHPnSc8c8SpvkbRirGNJx5Rk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-5i1kaK1MOmO-xpJE30TMAg-1; Fri, 20 Jan 2023 12:01:07 -0500
X-MC-Unique: 5i1kaK1MOmO-xpJE30TMAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4071101A55E;
 Fri, 20 Jan 2023 17:01:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD1D940C6EC4;
 Fri, 20 Jan 2023 17:01:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 006D421E6A28; Fri, 20 Jan 2023 18:01:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanb@linux.ibm.com
Subject: [PATCH 3/2] MAINTAINERS: Cover tpm.c again
Date: Fri, 20 Jan 2023 18:01:04 +0100
Message-Id: <20230120170104.359690-1-armbru@redhat.com>
In-Reply-To: <20230119091545.3116376-1-armbru@redhat.com>
References: <20230119091545.3116376-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Commit 800d4deda0 "softmmu: move more files to softmmu/" (v5.2.0)
updated MAINTAINERS for all moved files but one.  Fix that.

Fixes: 800d4deda04be016a95fbbf397c830a2d14ff9f6
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c888ccaf7a..27a2dac726 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3068,7 +3068,7 @@ T: git https://github.com/stefanha/qemu.git tracing
 TPM
 M: Stefan Berger <stefanb@linux.ibm.com>
 S: Maintained
-F: tpm.c
+F: softmmu/tpm.c
 F: hw/tpm/*
 F: include/hw/acpi/tpm.h
 F: include/sysemu/tpm*
-- 
2.39.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9453C600
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:24:36 +0200 (CEST)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1ff-0007oW-I5
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HM-0005fk-R1
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HL-0003K2-95
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SX0sE1vCpMpI47SmMLm5WvHEkaFNDJfcV/cBwIY/qDI=;
 b=g3b2zjWvu+zksfVq2mMNEwyWZmTEy+FU65kgKGByVBbrY9sNZXvrMrzYIa4HInxLKU6/gm
 dwZYxUIP/vGjjcb89DGcStZoC/E1aw5J9xMrWBtwJpRG6SEzZqi4H1fUbE+qiZTzS/75+7
 wb8DX3sBLCJS6K9XONpAmAQQi42uwC0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-oD0a0b2KO-in9Z1TZ4mMdQ-1; Fri, 03 Jun 2022 02:59:25 -0400
X-MC-Unique: oD0a0b2KO-in9Z1TZ4mMdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EEB8185A794;
 Fri,  3 Jun 2022 06:59:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 571792166B26;
 Fri,  3 Jun 2022 06:59:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Hang Yuan <hang.yuan@intel.com>
Subject: [PULL 07/12] MAINTAINERS: Update maintainers for Guest x86 HAXM CPUs
Date: Fri,  3 Jun 2022 08:59:00 +0200
Message-Id: <20220603065905.23805-8-thuth@redhat.com>
In-Reply-To: <20220603065905.23805-1-thuth@redhat.com>
References: <20220603065905.23805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Wenchao Wang <wenchao.wang@intel.com>

Clean up the maintainer list.

Reviewed-by: Hang Yuan <hang.yuan@intel.com>
Signed-off-by: Wenchao Wang <wenchao.wang@intel.com>
Message-Id: <DM6PR11MB4090A58ACCA4AD8C752AEEA587199@DM6PR11MB4090.namprd11.prod.outlook.com>
[thuth: Note: Colin Xu's address bounces]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee9693dc3a..5fe8f7eca2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -488,7 +488,6 @@ Guest CPU Cores (HAXM)
 ---------------------
 X86 HAXM CPUs
 M: Wenchao Wang <wenchao.wang@intel.com>
-M: Colin Xu <colin.xu@intel.com>
 L: haxm-team@intel.com
 W: https://github.com/intel/haxm/issues
 S: Maintained
-- 
2.31.1



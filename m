Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E52CA099
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:59:32 +0100 (CET)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3Nb-0001EB-R7
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30V-0002fs-S2
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30G-0003sf-Gt
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXxgg6srxt7xRfadKq9QJ/nuaQ+cvM/Ydzs2egVLJ+U=;
 b=NNgzh12PZ3j67LDTMn1kCUsBsbczoJqHAVpHv1FqRT6g49fnBJCe0isQo7NqKiNuf7WlUN
 wyGmGLYE/y0I+UbgrDHz0RMZG2bT7NbywETZY4RE0BWdeI5TEou5tC/cGXEgYp+Zh2hXS4
 0hswp3iqXiqtKOQUUMOmBfMBHiJphUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-qmQ59T9FNu-tF-vM7V1jAg-1; Tue, 01 Dec 2020 05:35:17 -0500
X-MC-Unique: qmQ59T9FNu-tF-vM7V1jAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81C29425CB;
 Tue,  1 Dec 2020 10:35:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4047E60C0F;
 Tue,  1 Dec 2020 10:35:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/32] Revert "docs: temporarily disable the kernel-doc
 extension"
Date: Tue,  1 Dec 2020 05:35:01 -0500
Message-Id: <20201201103502.4024573-32-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit fd68a72875cf318f4310726f842139119c5f45d5.  We're
done with the update of kernel-doc and we can restore kernel-doc's
functionality.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/sphinx/kerneldoc.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
index 079aadced3..bf44215016 100644
--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -80,9 +80,6 @@ class KernelDocDirective(Directive):
         # Tell sphinx of the dependency
         env.note_dependency(os.path.abspath(filename))
 
-        # Disabled temporarily while scripts/kernel-doc is updated
-        return []
-
         tab_width = self.options.get('tab-width', self.state.document.settings.tab_width)
 
         # FIXME: make this nicer and more robust against errors
-- 
2.26.2




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D12CB8F8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:36:44 +0100 (CET)
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOZ1-0000E6-CX
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDT-00048W-IU
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCh-0003tV-Lb
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEZ4bKBmLgXP1GaPE/TykVdYqezDQVYguILf+dYH7QQ=;
 b=UTAwK21PQAr2597Nj6wkA6saaQzTY85saZLQXjOH0r2z9ozYZ7D9bZyww6HOD3HoNUA8zU
 QU360GnSZQpk9QXYhgaH1JyPQ5UPWYjGA4MeiUXMjtn/89XbM/QkgCQ7JJb23MQ+zsuJ72
 kYDRPrbRbiILVCR8nvfeYZ3YjPM5Qqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-7md_NVVuP9ecGds20FFclA-1; Wed, 02 Dec 2020 03:09:33 -0500
X-MC-Unique: 7md_NVVuP9ecGds20FFclA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70E8C1074641
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3685D60C17
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 112/113] Revert "docs: temporarily disable the kernel-doc
 extension"
Date: Wed,  2 Dec 2020 03:08:48 -0500
Message-Id: <20201202080849.4125477-113-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit fd68a72875cf318f4310726f842139119c5f45d5.  We're
done with the update of kernel-doc and we can restore kernel-doc's
functionality.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

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




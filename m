Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB2B2CB820
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:09:14 +0100 (CET)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO8P-000170-1a
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDI-0003j0-8Z
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCW-0003nv-PW
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORkokebyZd7uYE6EL+PNhLAzVgs7mxSX6u3wc+B7flk=;
 b=OfnHUp50PJtISADiBnoB8fs6Fk8vks67nz4NtzDtDRldVvJgamdwIXYfzJHMnvxL0i3WBr
 /+1EntdB+iNVXhQPj1io2NRKSjTEmgYvmNV0zex2Vib88kPHrGRMhFq0E09+CX8sSNhzLO
 WqbBxD6GIqs6stXF2UR3NBNpBp6UaZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-dYWNEmzbN2aHMKgM7WsYPg-1; Wed, 02 Dec 2020 03:09:21 -0500
X-MC-Unique: dYWNEmzbN2aHMKgM7WsYPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 922721074641
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FAE260854
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 082/113] docs: temporarily disable the kernel-doc extension
Date: Wed,  2 Dec 2020 03:08:18 -0500
Message-Id: <20201202080849.4125477-83-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Preserve bisectability while we update scripts/kernel-doc from Linux.
Without this patch, building with Sphinx 3 would break while we
revert our own Sphinx 3 support and replace it with Linux's.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/sphinx/kerneldoc.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
index 3ac277d162..9124fcbff1 100644
--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -75,6 +75,9 @@ class KernelDocDirective(Directive):
         # Tell sphinx of the dependency
         env.note_dependency(os.path.abspath(filename))
 
+        # Disabled temporarily while scripts/kernel-doc is updated
+        return []
+
         tab_width = self.options.get('tab-width', self.state.document.settings.tab_width)
 
         # FIXME: make this nicer and more robust against errors
-- 
2.26.2




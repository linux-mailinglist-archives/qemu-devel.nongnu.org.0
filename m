Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945F290459
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 13:50:46 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTOFx-00022R-L7
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 07:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTODd-0000IY-7O
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTODb-0002no-GC
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602848898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n66gcb6JPvi1HUeyWqEtPpl5bDBAMxwb7H9A1rO31qA=;
 b=MsZO+Vqee4WdkcVugDeFcdDGCmS+HTLNQM0rfrMdFcpj/p197b8NL9XaOocUMEYY4bSuMP
 luO/5r5+5biWJ296f8gGf8d/uhvhapLdxKl194o7rG8r/lR6iTTfo1WiV/99GiezoyY7T2
 aGbWjicjoMsSsBGLGk1zqtW1VFwUfQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-nR1iz4zFMH6xR3OP6-H7Iw-1; Fri, 16 Oct 2020 07:48:16 -0400
X-MC-Unique: nR1iz4zFMH6xR3OP6-H7Iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DCE618A8233;
 Fri, 16 Oct 2020 11:48:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E14876640;
 Fri, 16 Oct 2020 11:48:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/22] Makefile: Ensure cscope.out/tags/TAGS are generated in
 the source tree
Date: Fri, 16 Oct 2020 07:47:54 -0400
Message-Id: <20201016114814.1564523-3-pbonzini@redhat.com>
In-Reply-To: <20201016114814.1564523-1-pbonzini@redhat.com>
References: <20201016114814.1564523-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Tools usually expect the index files to be in the source tree, eg. emacs.
This is already the case when doing out-of-tree builds, but with in-tree
builds they end up in the build directory.

Force cscope, ctags and etags to put them in the source tree.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160277334665.1754102.10921580280105870386.stgit@bahia.lan>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index c37e513431..d20c7a3f80 100644
--- a/Makefile
+++ b/Makefile
@@ -194,19 +194,19 @@ find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o -name "*
 
 .PHONY: ctags
 ctags:
-	rm -f tags
-	$(find-src-path) -exec ctags --append {} +
+	rm -f "$(SRC_PATH)/"tags
+	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
 
 .PHONY: TAGS
 TAGS:
-	rm -f TAGS
-	$(find-src-path) -exec etags --append {} +
+	rm -f "$(SRC_PATH)/"TAGS
+	$(find-src-path) -exec etags -f "$(SRC_PATH)/"TAGS --append {} +
 
 .PHONY: cscope
 cscope:
 	rm -f "$(SRC_PATH)"/cscope.*
 	$(find-src-path) -print | sed -e 's,^\./,,' > "$(SRC_PATH)/cscope.files"
-	cscope -b -i"$(SRC_PATH)/cscope.files"
+	cscope -b -i"$(SRC_PATH)/cscope.files" -f"$(SRC_PATH)"/cscope.out
 
 # Needed by "meson install"
 export DESTDIR
-- 
2.26.2




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5212643E8BD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:02:36 +0200 (CEST)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgAfa-0004y4-Tb
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgAcb-0003HM-FM
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgAcW-0008Cd-2h
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635447563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkfJKsSlZdu051lRspIVZAAfoMLfgkV7GV+Eh4L/USU=;
 b=Ht8djlXwZbnqUPAxmSWFifwXP4LvXyaLKQ4HhDbct8BFG5OjeEJaSLERbasqBpyjUz6ZE2
 jQYWgEC47R3TYQxsF8uJly6C/Uov9slsAMFz+PoXFyiKFILvspiKc2ceEU/CNSm7NKSPRM
 fHx/+N15Z2WFx/WBe8hJcg+FRu1bsJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-iEWxzidDOD-IzBJ_gxl-qQ-1; Thu, 28 Oct 2021 14:59:21 -0400
X-MC-Unique: iEWxzidDOD-IzBJ_gxl-qQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E73201054F90
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 18:59:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 909C0694B6;
 Thu, 28 Oct 2021 18:59:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/4] configure: Remove the check for the __thread keyword
Date: Thu, 28 Oct 2021 20:59:07 +0200
Message-Id: <20211028185910.1729744-2-thuth@redhat.com>
In-Reply-To: <20211028185910.1729744-1-thuth@redhat.com>
References: <20211028185910.1729744-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We recently bumped our minimum required version of GCC to 7.4
and Clang to 6.0, and those compiler versions should support
the __thread keyword already.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/configure b/configure
index 039467c04b..8fe03b6230 100755
--- a/configure
+++ b/configure
@@ -1749,17 +1749,6 @@ if test "$static" = "yes" ; then
   fi
 fi
 
-# Unconditional check for compiler __thread support
-  cat > $TMPC << EOF
-static __thread int tls_var;
-int main(void) { return tls_var; }
-EOF
-
-if ! compile_prog "-Werror" "" ; then
-    error_exit "Your compiler does not support the __thread specifier for " \
-	"Thread-Local Storage (TLS). Please upgrade to a version that does."
-fi
-
 cat > $TMPC << EOF
 
 #ifdef __linux__
-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7F2DB3B8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:29:03 +0100 (CET)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpF4I-0006En-PL
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXp-0003PL-Aq
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXc-0001ZU-9F
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wD6BzNQHznVCRligv18YzZy8TM61WeWPm2MJ1XRzTo=;
 b=IX5oEYRNglLo8l5npiGLrgxj1P8UWszYMwZo2EySYE7Ep3mseqOQCluP6uMOzCQFmNoPGl
 xIOLSy3MNfeS2nspbBc6qvKJB5/JVRO33NKAIAvWjmjN9/0W/IYOsY8IQIlC9a2Bjmh62u
 NaOh73CvWWnh5cnhb0UbtzrFWBt9dRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-gf3lJWW4OaOJd0i7NcTI2A-1; Tue, 15 Dec 2020 12:55:11 -0500
X-MC-Unique: gf3lJWW4OaOJd0i7NcTI2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FDDE51080;
 Tue, 15 Dec 2020 17:55:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EFF360854;
 Tue, 15 Dec 2020 17:55:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/45] xen: remove GNUC check
Date: Tue, 15 Dec 2020 12:54:40 -0500
Message-Id: <20201215175445.1272776-41-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires Clang or GCC, that define and support __GNUC__ extensions

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <20201210134752.780923-11-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/xen/interface/io/ring.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/hw/xen/interface/io/ring.h b/include/hw/xen/interface/io/ring.h
index 5d048b335c..115705f3f4 100644
--- a/include/hw/xen/interface/io/ring.h
+++ b/include/hw/xen/interface/io/ring.h
@@ -206,21 +206,12 @@ typedef struct __name##_back_ring __name##_back_ring_t
 #define RING_HAS_UNCONSUMED_RESPONSES(_r)                               \
     ((_r)->sring->rsp_prod - (_r)->rsp_cons)
 
-#ifdef __GNUC__
 #define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             \
     unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;          \
     unsigned int rsp = RING_SIZE(_r) -                                  \
         ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \
     req < rsp ? req : rsp;                                              \
 })
-#else
-/* Same as above, but without the nice GCC ({ ... }) syntax. */
-#define RING_HAS_UNCONSUMED_REQUESTS(_r)                                \
-    ((((_r)->sring->req_prod - (_r)->req_cons) <                        \
-      (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt))) ?        \
-     ((_r)->sring->req_prod - (_r)->req_cons) :                         \
-     (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt)))
-#endif
 
 /* Direct access to individual ring elements, by index. */
 #define RING_GET_REQUEST(_r, _idx)                                      \
-- 
2.26.2




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7D342BD8A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:45:14 +0200 (CEST)
Received: from localhost ([::1]:42454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabl2-0007hi-WE
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabiI-0004Un-C4
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabiG-0007JC-HH
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634121739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KV1UzSu/dfBqv39FkZcvqMEG7LTj87cKAMHcgkxcYc=;
 b=B0AG1YmcpIbta2ELHhG+CD5LTQ+wCi9SF3QfC5u59d1zZutbRnyg5ZIoPVpC9Q/35jTIHw
 MD4bJkBrk81fhIynM6wYJanfuNLB8N9Noj4q4KQXXUWwxQb0jUIS5vyr1BvpeTXWZjGNZf
 f33lZLksDrtt+2D1rXbTrQCQny5QOpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-pGTXNjp_MA6vZTI1fy6W1g-1; Wed, 13 Oct 2021 06:42:18 -0400
X-MC-Unique: pGTXNjp_MA6vZTI1fy6W1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66C959126D;
 Wed, 13 Oct 2021 10:42:17 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3B085D9D5;
 Wed, 13 Oct 2021 10:41:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 14/15] libvhost-user: Increase VHOST_USER_MAX_RAM_SLOTS to
 4096
Date: Wed, 13 Oct 2021 12:33:29 +0200
Message-Id: <20211013103330.26869-15-david@redhat.com>
In-Reply-To: <20211013103330.26869-1-david@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

4096 is the maximum we can have right now in QEMU with vhost-user, so
increase the libvhost-user limit as well.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 3d13dfadde..d9628ed9f0 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -30,11 +30,8 @@
 
 #define VHOST_MEMORY_BASELINE_NREGIONS 8
 
-/*
- * Set a reasonable maximum number of ram slots, which will be supported by
- * any architecture.
- */
-#define VHOST_USER_MAX_RAM_SLOTS 32
+/* Set the RAM slots based on the maximum supported by QEMU vhost-user. */
+#define VHOST_USER_MAX_RAM_SLOTS 4096
 
 #define VHOST_USER_HDR_SIZE offsetof(VhostUserMsg, payload.u64)
 
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9747B2D5C8C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:57:54 +0100 (CET)
Received: from localhost ([::1]:57558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMS9-0003xu-JZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMJl-0002cM-0o
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:49:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMJj-0002lo-HJ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607608150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7laBw/T720iHN/BJanY29fxaiafvWQ3ZmcJva9ZXuMM=;
 b=Wv1DpRygaa2SVfAeF95ABzbcvyj6tyKJjhQ8omb8yO1AFcPMoGEkfo/ZMK0ThZ+Kqq9Avk
 BG76s3CCY4LZ59v1VeWCOvHbVpg2d5SSJ15xZsMdFqfbzK/At83N2oTym2I7jUa/I3RPSI
 DAhvRN7VhNMiltLQyE3xbiARIj5vlaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-tt29vyJuMMCsKfnRw_kDUw-1; Thu, 10 Dec 2020 08:49:08 -0500
X-MC-Unique: tt29vyJuMMCsKfnRw_kDUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B9315732;
 Thu, 10 Dec 2020 13:49:07 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E42817046C;
 Thu, 10 Dec 2020 13:48:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] qemu-plugin.h: remove GCC < 4
Date: Thu, 10 Dec 2020 17:47:43 +0400
Message-Id: <20201210134752.780923-5-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8.

(clang >= 3.4 advertizes itself as GCC >= 4.2 compatible)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index bab8b0d4b3..5775e82c4e 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -28,13 +28,8 @@
   #endif
   #define QEMU_PLUGIN_LOCAL
 #else
-  #if __GNUC__ >= 4
-    #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
-    #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
-  #else
-    #define QEMU_PLUGIN_EXPORT
-    #define QEMU_PLUGIN_LOCAL
-  #endif
+  #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
+  #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
 #endif
 
 typedef uint64_t qemu_plugin_id_t;
-- 
2.29.0



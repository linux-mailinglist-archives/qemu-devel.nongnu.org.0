Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120CD2D5C6A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:54:41 +0100 (CET)
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMP2-0000K6-1j
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMKt-0004Mz-D0
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:50:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMKr-0003DG-KA
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607608220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=655teq4WQH113PO8F0kS3wL4OZKf3txyzGY5haGVOpE=;
 b=iOk1ZZZbmSaC4t74ALXYq1wQzlzd/EaoS6VEfl+7CHTEfP8Cso0/cPKRJXn0Sb1grYaQXE
 7ajBmjD3E9tFgCpbgln2IcAQY1vzhwLw7NywdoieILo0I6/NNcpsWc80Y4403Z6AtaJSDw
 LIe/63q7kPRTTldA3uE4vxIanyzXLGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-Gmi7SMuINcumk-1cNlsFsA-1; Thu, 10 Dec 2020 08:50:19 -0500
X-MC-Unique: Gmi7SMuINcumk-1cNlsFsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79F67100C662;
 Thu, 10 Dec 2020 13:50:17 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06182709A0;
 Thu, 10 Dec 2020 13:50:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/13] poison: remove GNUC check
Date: Thu, 10 Dec 2020 17:47:48 +0400
Message-Id: <20201210134752.780923-10-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
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

QEMU requires Clang or GCC, that define and support __GNUC__ extensions

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/poison.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 7b9ac361dc..d7ae1f23e7 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -3,7 +3,6 @@
 
 #ifndef HW_POISON_H
 #define HW_POISON_H
-#ifdef __GNUC__
 
 #pragma GCC poison TARGET_I386
 #pragma GCC poison TARGET_X86_64
@@ -93,4 +92,3 @@
 #pragma GCC poison CONFIG_SOFTMMU
 
 #endif
-#endif
-- 
2.29.0



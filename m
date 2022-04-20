Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B0F5089FC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:03:26 +0200 (CEST)
Received: from localhost ([::1]:45056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhAvV-0006d4-T4
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAM0-0005WC-U4
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhALz-0004NB-9J
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnsN6U4Ld1nk6Xoe057Z1PMfVczejpxFUGyAUACpYIk=;
 b=EK80xeN+63RtP4D7gjySxpGZjQjWmAjM1V5KZcDixaz3tKIYPqGEduYGup4+YxXpH7S3MX
 WM0bIbANT2TXwS9G83C3f/OHmgqVuUpbP4w+/zoP6L4XVOaasEhD3OYeBbwhsuisQ+1kOr
 +gh6A68uc7TqIEFQrXqDqS1I5OSy5lc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-FSMXu2Y9MiWlJK-i5Xahmw-1; Wed, 20 Apr 2022 09:26:41 -0400
X-MC-Unique: FSMXu2Y9MiWlJK-i5Xahmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 324121C05134
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:26:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 425B3140EBD5;
 Wed, 20 Apr 2022 13:26:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 03/41] scripts/analyze-inclusions: drop qemu-common.h from
 analysis
Date: Wed, 20 Apr 2022 17:25:46 +0400
Message-Id: <20220420132624.2439741-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The header is no longer commonly included.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/analyze-inclusions | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/analyze-inclusions b/scripts/analyze-inclusions
index 14806e18c6e1..45c821de32b3 100644
--- a/scripts/analyze-inclusions
+++ b/scripts/analyze-inclusions
@@ -46,7 +46,6 @@ grep_include() {
 }
 
 echo Found $(find . -name "*.d" | wc -l) object files
-echo $(grep_include -F 'include/qemu-common.h') files include qemu-common.h
 echo $(grep_include -F 'hw/hw.h') files include hw/hw.h
 echo $(grep_include 'target/[a-z0-9]*/cpu\.h') files include cpu.h
 echo $(grep_include -F 'qapi-types.h') files include qapi-types.h
@@ -86,9 +85,6 @@ analyze() {
 echo osdep.h:
 analyze ../include/qemu/osdep.h
 
-echo qemu-common.h:
-analyze  -include ../include/qemu/osdep.h ../include/qemu-common.h
-
 echo hw/hw.h:
 analyze -include ../include/qemu/osdep.h ../include/hw/hw.h
 
-- 
2.35.1.693.g805e0a68082a



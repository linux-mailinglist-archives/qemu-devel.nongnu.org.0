Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0A50A13D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:52:57 +0200 (CEST)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXEu-0005lo-4S
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXC4-0002LR-GX
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXC1-0005k2-Q2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650548997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rc6IT/fXlRgD+JPRsqm1Q44yPKB5H1QzLG2ISYV77Z0=;
 b=M8ItE3B0YxBDIPXwceK8zMVH4FZe1xtj5Zf49fbxz2YB651s9vxNmHfBhVBYzIr7NtmC3L
 o0cm0mjyDofgOnSt/APAyN5mLDo7a5y0daYnxJ37GDtiVEFTDWFLmTUV03OMaDTNpDrJfU
 gFZhMjE5EjFNt5nQgqnJa6ZZh+EJiwI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-VpkqKad-MAi6camNET70Lg-1; Thu, 21 Apr 2022 09:49:53 -0400
X-MC-Unique: VpkqKad-MAi6camNET70Lg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 976791C0E0E5;
 Thu, 21 Apr 2022 13:49:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 939D7145BA52;
 Thu, 21 Apr 2022 13:49:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 02/30] scripts/analyze-inclusions: drop qemu-common.h from
 analysis
Date: Thu, 21 Apr 2022 17:49:12 +0400
Message-Id: <20220421134940.2887768-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The header is no longer commonly included.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-4-marcandre.lureau@redhat.com>
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
2.36.0



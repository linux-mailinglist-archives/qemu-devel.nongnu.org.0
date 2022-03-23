Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5224E5641
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:22:12 +0100 (CET)
Received: from localhost ([::1]:34076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3kR-0006i5-UN
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:22:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Os-0004f2-9P
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Oq-00055Z-UO
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DndEasqvwyyDT330/BQXLAJDbnl88MveBBFOqN3Mmgo=;
 b=P3l2z9uQaCVoVPO4owuo4LJ9ACqRi3k0mfDxtEX1rsdqOoNr8+WHB6F+Huo61BV/vGL2ER
 uiKG5EPETguqKCZPbsSD7mIG/ongUgGKvUgSyrbcnts857MV2dy+L5xi8z4SnVISfWAUAW
 j3mzJ9WLs8BH0s/hhlehR20UX5qk5bg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-_OdLQp_NMlWmX98ku-mdYA-1; Wed, 23 Mar 2022 11:59:50 -0400
X-MC-Unique: _OdLQp_NMlWmX98ku-mdYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88F0285A5BE
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:59:50 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78DAB141DC5F;
 Wed, 23 Mar 2022 15:59:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 14/32] util: rename qemu-error.c to match its header name
Date: Wed, 23 Mar 2022 19:57:25 +0400
Message-Id: <20220323155743.1585078-15-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The header name is more appropriate.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/{qemu-error.c => error-report.c} | 0
 util/meson.build                      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename util/{qemu-error.c => error-report.c} (100%)

diff --git a/util/qemu-error.c b/util/error-report.c
similarity index 100%
rename from util/qemu-error.c
rename to util/error-report.c
diff --git a/util/meson.build b/util/meson.build
index 2d71ab57a42e..82eec004e223 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -28,7 +28,7 @@ util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
 util_ss.add(files('fifo8.c'))
 util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
-util_ss.add(files('error.c', 'qemu-error.c'))
+util_ss.add(files('error.c', 'error-report.c'))
 util_ss.add(files('qemu-print.c'))
 util_ss.add(files('id.c'))
 util_ss.add(files('qemu-config.c', 'notify.c'))
-- 
2.35.1.273.ge6ebfd0e8cbb



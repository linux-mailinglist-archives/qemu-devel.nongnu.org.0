Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3658EC8B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 14:58:34 +0200 (CEST)
Received: from localhost ([::1]:36536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlI9-0002mk-TC
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 08:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl96-0001P6-Da
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl95-0007P8-1N
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660135750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7B8zoi12JI7J5DVOiEMpNRxnLo9t28miZfDuM0uHiM=;
 b=VVJGQ942dfmYwv9uC/V2N7wi+FqlJ4rpwV1FT6U86IHSnSv+iNcgqTFI+XMSQ2CVI3d//s
 +kCMM1qTGYda0TixI11kLpY0FY6OSXN1JxqMls4l5Ot+lvBNhCKAxFHkoc8hhL8AhbqMlZ
 Rsz1jhgDWQy5Y8wr6lAZZS6GfT06pM8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-Wllek6EXMy-sRqS6MDmQkQ-1; Wed, 10 Aug 2022 08:49:09 -0400
X-MC-Unique: Wllek6EXMy-sRqS6MDmQkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FE133C10237;
 Wed, 10 Aug 2022 12:49:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABBEA9457F;
 Wed, 10 Aug 2022 12:49:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 01/16] error-report: misc comment fix
Date: Wed, 10 Aug 2022 16:48:42 +0400
Message-Id: <20220810124857.1360211-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
References: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Missed in commit beeb175c0d "util/qemu-error: Rename error_print_loc()
to be more generic".

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 util/error-report.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/error-report.c b/util/error-report.c
index 5edb2e6040..98f242b75b 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -390,7 +390,7 @@ void error_init(const char *argv0)
 {
     const char *p = strrchr(argv0, '/');
 
-    /* Set the program name for error_print_loc(). */
+    /* Set the program name for print_loc(). */
     g_set_prgname(p ? p + 1 : argv0);
 
     /*
-- 
2.37.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F069F6F6711
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:14:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puU6D-0002DK-MT; Thu, 04 May 2023 04:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puU6B-0002DA-Vn
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puU69-00036o-7l
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683188036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wU6PU/V6CadYwVYop2VNjDrATOSq0MUjpoH9IdjaOUs=;
 b=h7Txil2lHCXUkl4NS4d/dnRirCxZM0PeFvn678MtbvZzshSrQrAG37apceuCJ296ZP1ay5
 9JjdjJP9F+8G7xIcA9uKf+9kkHYQmBq48js8dpOv8gOyMsITLmBfJ8ptUyLbY5dUm7V7Ob
 bFy4WHWaiCn52v7MFujdfFkRTA0P0ew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-kobsCNk1MBSNjGFTN8aC9w-1; Thu, 04 May 2023 04:13:54 -0400
X-MC-Unique: kobsCNk1MBSNjGFTN8aC9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14E17857A81;
 Thu,  4 May 2023 08:13:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C41A72026D16;
 Thu,  4 May 2023 08:13:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] include/qemu/osdep.h: Bump _WIN32_WINNT to the Windows 8 API
Date: Thu,  4 May 2023 10:13:51 +0200
Message-Id: <20230504081351.125140-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit cf60ccc330 ("cutils: Introduce bundle mechanism") abandoned
compatibility with Windows older than 8 - we should reflect this
in our _WIN32_WINNT and set it to the value that corresponds to
Windows 8.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 9eff0be95b..cc61b00ba9 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -75,7 +75,7 @@ QEMU_EXTERN_C int daemon(int, int);
 #ifdef _WIN32
 /* as defined in sdkddkver.h */
 #ifndef _WIN32_WINNT
-#define _WIN32_WINNT 0x0601 /* Windows 7 API (should be in sync with glib) */
+#define _WIN32_WINNT 0x0602 /* Windows 8 API (should be >= the one from glib) */
 #endif
 /* reduces the number of implicitly included headers */
 #ifndef WIN32_LEAN_AND_MEAN
-- 
2.31.1



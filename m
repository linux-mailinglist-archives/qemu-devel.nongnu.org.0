Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E46ADECB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:32:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWT8-0005dp-Bu; Tue, 07 Mar 2023 07:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZWSl-0005cA-3B
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:30:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZWSh-0001Le-AG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678192234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W/xygaV5zNwl24sboAHefhTVlFZzLxG2ECiuD24xvwo=;
 b=IJ697Kge44s9Uh4UBNsXtOLgkiFD2XUsTQNy+YD63eLWhSgyKV0O3O6L0cAZKdvqdURwed
 ErkQQQG4Ge6mRB1yudKtUSBYqNvNKDeWU+/Gyp0dU0YJo2DbRUXlha/DYGENxDjVnOlK+u
 owrgUYSw9LAP7eJ0LxmoVvr9vwk65NY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-D-fHqz0pPGqbnHUYmWK4Yw-1; Tue, 07 Mar 2023 07:30:33 -0500
X-MC-Unique: D-fHqz0pPGqbnHUYmWK4Yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A4661C17423
 for <qemu-devel@nongnu.org>; Tue,  7 Mar 2023 12:30:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EBF24011AC8;
 Tue,  7 Mar 2023 12:30:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] .editorconfig: set max line at 70 chars for QAPI files
Date: Tue,  7 Mar 2023 16:30:27 +0400
Message-Id: <20230307123027.2485499-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This seems to be the preferred style.

The EditorConfig property is not supported by all editors:
https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties#max_line_length

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .editorconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.editorconfig b/.editorconfig
index 7303759ed7..8c5ebc6a1b 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -47,3 +47,4 @@ emacs_mode = glsl
 [*.json]
 indent_style = space
 emacs_mode = python
+max_line_length = 70
-- 
2.39.2



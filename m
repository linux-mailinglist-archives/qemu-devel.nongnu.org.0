Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565251AB3E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:41:11 +0200 (CEST)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIzt-00029i-Nh
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIqc-0006YW-6I
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmIqa-0003m7-KA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 13:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651685491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWpOBm9oDnJ+4pUfUjoxYw2o4zWYr04d1Oc2pnyGOt8=;
 b=QI290BSHSmrtA+FYC9e1W35WmMO03+WANJkZcBHUAS7ylnX8KAizV1j4d/V751GgSDmRTS
 aO+2yGB2eblUmNaryTAiYrzZ4N+yyTkjmirAXsBr5zsdoXrXNcMWh3kc/3D3TGVqo87Xd9
 ZbRh0vXY932NemuYtkwkC4AduhzDawM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-wM6tNMQxMnG6tuToOwkp4w-1; Wed, 04 May 2022 13:31:30 -0400
X-MC-Unique: wM6tNMQxMnG6tuToOwkp4w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C347A185A79C;
 Wed,  4 May 2022 17:31:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F06841373D;
 Wed,  4 May 2022 17:31:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bandan Das <bsd@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 06/16] include: adjust header guards after renaming
Date: Wed,  4 May 2022 21:30:15 +0400
Message-Id: <20220504173025.650167-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220504173025.650167-1-marcandre.lureau@redhat.com>
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/help-texts.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/help-texts.h b/include/qemu/help-texts.h
index ba32cc8b1f39..4f265fed8df1 100644
--- a/include/qemu/help-texts.h
+++ b/include/qemu/help-texts.h
@@ -1,5 +1,5 @@
-#ifndef QEMU_COMMON_H
-#define QEMU_COMMON_H
+#ifndef QEMU_HELP_TEXTS_H
+#define QEMU_HELP_TEXTS_H
 
 /* Copyright string for -version arguments, About dialogs, etc */
 #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
-- 
2.36.0.44.g0f828332d5ac



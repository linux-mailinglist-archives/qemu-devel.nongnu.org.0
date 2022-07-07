Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B056A885
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:46:42 +0200 (CEST)
Received: from localhost ([::1]:53426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9UeH-0008Q2-7T
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVy-0008Su-DJ
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVr-0006pc-VP
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657211878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpO3X2dhWNMDcL2RL5PGtLi0467hFdMwo9K3xsRLDsY=;
 b=KKq4wcdXs34+zUbFMQibXlXXmcn5DpiJiv5lppvVFIWK0M+VBfrlUbVXJQiaZzFSEKZt4h
 IWUwCVizAERuatdMi/LkBLpLfK33ICKD8vGJw9hrjGZjZL4Z6mEFRGy3Z289DI+1FVddrL
 zQqq2aXZ/QnSZzfmNhOFvk9evR/+KVc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-cV5p6PgdPICvyQhtJgEryQ-1; Thu, 07 Jul 2022 12:37:55 -0400
X-MC-Unique: cV5p6PgdPICvyQhtJgEryQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 795D4833A0D;
 Thu,  7 Jul 2022 16:37:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F9EF40315C;
 Thu,  7 Jul 2022 16:37:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 9/9] tests/style: check qemu/osdep.h is NOT included in all
 .h/.c.inc files
Date: Thu,  7 Jul 2022 17:37:20 +0100
Message-Id: <20220707163720.1421716-10-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-1-berrange@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

Since the qemu/osdep.h file must be included as the very first header
in all C source files, there is no reason to include it in .h or .c.in
files.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/style.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/style.yml b/tests/style.yml
index 6d91ac6115..d2a0299a33 100644
--- a/tests/style.yml
+++ b/tests/style.yml
@@ -143,3 +143,8 @@ osdep_h_in_source:
     - tests/uefi-test-tools/.*
     - tests/unit/test-rcu-(simpleq|slist|tailq)\.c
     - tools/ebpf/rss.bpf.c
+
+osdep_h_in_header:
+  files: \.(h|c\.inc)$
+  prohibit: '#include "qemu/osdep\.h"'
+  message: only C source files may include qemu/osdep.h
-- 
2.36.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD406E8FA5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:13:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHZ-0000mq-L7; Thu, 20 Apr 2023 06:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHP-0000co-JN
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHF-0007zm-6L
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73csaOo0EFzMPksyoiHw/3QxWFkuSG1Pk86AxiaXNjI=;
 b=g94Om3lstpbYhMGZGO9dhqwkpuXIQmrABS8E6Tzr+cykSxqr9pKP/iy86U2DlRgABPHo7f
 KeaIe6hSQjXbIWJAcIJWA/1ZT2UEgZzJd+Qak4Audau5OKkGqZn/9xDZXCPGa4Fuy6Q7NT
 z+a02SsxCBCk6vhA9fdDDCsidl2qrbA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-b1pO0H2DPwKk8wwIO0xw3A-1; Thu, 20 Apr 2023 06:12:24 -0400
X-MC-Unique: b1pO0H2DPwKk8wwIO0xw3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEA8729AA3B8;
 Thu, 20 Apr 2023 10:12:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6137440BC;
 Thu, 20 Apr 2023 10:12:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/23] docs: Fix typo (wphx => whpx)
Date: Thu, 20 Apr 2023 12:11:55 +0200
Message-Id: <20230420101216.786304-3-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Stefan Weil <sw@weilnetz.de>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1529
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20230409201007.1157671-1-sw@weilnetz.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/introduction.rst b/docs/system/introduction.rst
index c8a9fe6c1d..3e256f8326 100644
--- a/docs/system/introduction.rst
+++ b/docs/system/introduction.rst
@@ -27,7 +27,7 @@ Tiny Code Generator (TCG) capable of emulating many CPUs.
   * - Hypervisor Framework (hvf)
     - MacOS
     - x86 (64 bit only), Arm (64 bit only)
-  * - Windows Hypervisor Platform (wphx)
+  * - Windows Hypervisor Platform (whpx)
     - Windows
     - x86
   * - NetBSD Virtual Machine Monitor (nvmm)
-- 
2.31.1



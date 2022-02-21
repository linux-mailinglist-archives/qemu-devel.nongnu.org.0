Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695124BD9C0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:59:23 +0100 (CET)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8Hi-00075K-6P
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:59:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7OK-0004RT-GZ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7OI-0000xq-9C
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SKUrD2tcuSxGW7XYT6Oiv7FEIGl4n5li/VYozanA0w=;
 b=R+m+4nQeS0A3fftoOh6byf+DSjwQXTRiEjT0by549jAsHQ0g5OEGAxS5/gemCCyQhIM2L1
 0Y89y0t9uR0pM/tWOgep7pEh7jKvfNrvU4VvM435Svx2G7DTwgWt1t6roi1YH4wbjXxcMR
 nm8XNiwYKsYUlECHRs5xfhaxM14WGME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-TGsuIum-OZCOKtEPHvgnHg-1; Mon, 21 Feb 2022 07:02:04 -0500
X-MC-Unique: TGsuIum-OZCOKtEPHvgnHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55F00814246;
 Mon, 21 Feb 2022 12:02:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 275E773165;
 Mon, 21 Feb 2022 12:02:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/25] hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
Date: Mon, 21 Feb 2022 13:00:07 +0100
Message-Id: <20220221120008.600114-25-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

hwaddr type is defined in "exec/hwaddr.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220209215446.58402-3-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/m68k/mcf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
index decf17ce42..8cbd587bbf 100644
--- a/include/hw/m68k/mcf.h
+++ b/include/hw/m68k/mcf.h
@@ -2,6 +2,7 @@
 #define HW_MCF_H
 /* Motorola ColdFire device prototypes.  */
 
+#include "exec/hwaddr.h"
 #include "target/m68k/cpu-qom.h"
 
 /* mcf_uart.c */
-- 
2.27.0



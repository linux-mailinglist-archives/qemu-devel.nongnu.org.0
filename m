Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39C064A5A3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:14:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4mMX-0000Iz-JD; Mon, 12 Dec 2022 12:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4mMV-0000Ia-3r
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:13:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4mMT-0007lk-HH
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670865184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9ST4BC4gt0MQHp5j2peeaKCMEaTNxiOLFZJ3o05CYv0=;
 b=akZMLWaWMLbcwknXUX/paSk3t4QCdoXyYIOTky6SAlXE+t9l6EwrUOuXuDWAGojt+wvfsP
 3s1Tj+y0DokuU2x8iZT2wSdefkuve9gL4gt8Q7UTVCeXgYyfGi0TgI79NzDM04WKTU983h
 gUWa9K4jtSs1kBytGuU+ksIeXBkIeJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-F0EpHXm_NLmcmc1jAQNHvA-1; Mon, 12 Dec 2022 12:12:57 -0500
X-MC-Unique: F0EpHXm_NLmcmc1jAQNHvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63BAF185A7A8;
 Mon, 12 Dec 2022 17:12:57 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93AF1492C14;
 Mon, 12 Dec 2022 17:12:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MAINTAINERS: Add MIPS-related docs and configs to the MIPS
 architecture section
Date: Mon, 12 Dec 2022 18:12:52 +0100
Message-Id: <20221212171252.194864-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

docs/system/target-mips.rst and configs/targets/mips* are not covered
in our MAINTAINERS file yet, so let's add them now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..4e0e2ba36f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -112,6 +112,8 @@ M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Odd Fixes
 K: ^Subject:.*(?i)mips
+F: docs/system/target-mips.rst
+F: configs/targets/mips*
 
 Guest CPU cores (TCG)
 ---------------------
-- 
2.31.1



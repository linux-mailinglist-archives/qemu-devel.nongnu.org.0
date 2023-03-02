Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3881E6A866C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:32:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlq7-0006rQ-Rr; Thu, 02 Mar 2023 11:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXlq4-0006hI-IJ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:31:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXlq1-0006cr-PH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1se1EgyXTtHuqpHB7dBmmrL51sYg+NfS/rBJP2j3pQw=;
 b=Etut81HP4wAgWGR1WmSLqU05m5ERBxVJ8tdvkT/xsKHYS9vrnuOJLWnbZ+NkUy1ke5kGoq
 RfhWVYHT4GJcdzWInd3SzX5ImFLaiRBnENKrCzoWszXA/w2J0hmTCDp9TKOxekg/wJrUuD
 U8973dbpM7w84xxGOStHWajTGkCHEmg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-ZxoOLkewNeO0183HdIaMUA-1; Thu, 02 Mar 2023 11:31:22 -0500
X-MC-Unique: ZxoOLkewNeO0183HdIaMUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EF7938012E7;
 Thu,  2 Mar 2023 16:31:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2FE6400EA93;
 Thu,  2 Mar 2023 16:31:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v2 4/6] docs/about/deprecated: Deprecate the qemu-system-arm
 binary
Date: Thu,  2 Mar 2023 17:31:04 +0100
Message-Id: <20230302163106.465559-5-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

qemu-system-aarch64 is a proper superset of qemu-system-arm,
and the latter was mainly still required for 32-bit KVM support.
But this 32-bit KVM arm support has been dropped in the Linux
kernel a couple of years ago already, so we don't really need
qemu-system-arm anymore, thus deprecated it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index a30aa8dfdf..21ce70b5c9 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
 on x86_64 hosts. Thus users are recommended to reconfigure their systems
 to use the ``qemu-system-x86_64`` binary instead.
 
+``qemu-system-arm`` binary (since 8.0)
+''''''''''''''''''''''''''''''''''''''
+
+``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
+latter was mainly a requirement for running KVM on 32-bit arm hosts, but
+this 32-bit KVM support has been removed some years ago already (see:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4
+). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
+future release. Use ``qemu-system-aarch64`` instead.
+
 
 System emulator command line arguments
 --------------------------------------
-- 
2.31.1



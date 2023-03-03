Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE236A9509
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:17:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2Rm-00060V-UY; Fri, 03 Mar 2023 05:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY2RP-0005wG-1E
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:15:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY2RN-0000jq-9i
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677838503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHZuso5/0DhJfAOxX6dvaVSE+Y2aY/gn2NzRTirrpYs=;
 b=JaRLuD4Gd1/h2VcMKwlyGp3ZjICeTBZr5lljPZJTK1j6aREi16K4b2ouabATo7U+4xIAaj
 uszqCl15J+mQHAcqtNHcBsLQfFmQbTHVNlQTwSqRjbjhoFx9IPAH8ShMLD++4lvdn/vVvm
 SEftGFy9YrKps5jHKC3/H+MMrHd6zrw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-mpFHp4drOdGIlxtLMzSiMw-1; Fri, 03 Mar 2023 05:15:00 -0500
X-MC-Unique: mpFHp4drOdGIlxtLMzSiMw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEE061871D9C;
 Fri,  3 Mar 2023 10:14:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3771B492C14;
 Fri,  3 Mar 2023 10:14:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 1/6] docs/about/deprecated: Deprecate 32-bit x86 hosts
Date: Fri,  3 Mar 2023 11:14:47 +0100
Message-Id: <20230303101452.769367-2-thuth@redhat.com>
In-Reply-To: <20230303101452.769367-1-thuth@redhat.com>
References: <20230303101452.769367-1-thuth@redhat.com>
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

Hardly anybody still uses 32-bit x86 hosts today, so we should start
deprecating them to stop wasting our time and CI minutes here.
For example, there are also still some unresolved problems with these:
When emulating 64-bit binaries in user mode, TCG does not honor atomicity
for 64-bit accesses, which is "perhaps worse than not working at all"
(quoting Richard). Let's simply make it clear that people should use
64-bit x86 hosts nowadays and we do not intend to fix/maintain the old
32-bit stuff.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..f0c1e6b545 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -196,6 +196,18 @@ CI coverage support may bitrot away before the deprecation process
 completes. The little endian variants of MIPS (both 32 and 64 bit) are
 still a supported host architecture.
 
+32-bit x86 hosts (since 8.0)
+''''''''''''''''''''''''''''
+
+Support for 32-bit x86 host deployments is increasingly uncommon in
+mainstream OS distributions given the widespread availability of 64-bit
+x86 hardware. The QEMU project no longer considers 32-bit x86 support
+to be an effective use of its limited resources, and thus intends to
+discontinue it. Since all recent x86 hardware from the past >10 years
+is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
+should be used instead.
+
+
 QEMU API (QAPI) events
 ----------------------
 
-- 
2.31.1



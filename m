Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71E680C2F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSaZ-0003K7-M1; Mon, 30 Jan 2023 06:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMSaX-0003Jw-65
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:44:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMSaV-0003T2-Kx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675079078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=uUjXl4P7i3WaUXG0bX4fH8Er6/TzZZyJmvog7bIAq1c=;
 b=TSnLuFlwH8UKeLl6UPronU9TxC+0GXaDUqqZEEITiNC5VAOAtsnu+h2iJD+Mw/nhNd+wg4
 kMsasUNVmWPNYW4e9Z/3yCFW8nPzxscSA0x93O5w3t5H/3xAWKm+NRc4Nqg3PIeJdvAJuD
 lWonqhvC/EI0ak0qvQPoLFgpRhlVosM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-wG8pVAI7ObyjVLph3ncUlg-1; Mon, 30 Jan 2023 06:44:34 -0500
X-MC-Unique: wG8pVAI7ObyjVLph3ncUlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A916A80006E;
 Mon, 30 Jan 2023 11:44:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA73E175AD;
 Mon, 30 Jan 2023 11:44:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>
Subject: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Date: Mon, 30 Jan 2023 12:44:28 +0100
Message-Id: <20230130114428.1297295-1-thuth@redhat.com>
MIME-Version: 1.0
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

Testing 32-bit host OS support takes a lot of precious time during the QEMU
contiguous integration tests, and considering that many OS vendors stopped
shipping 32-bit variants of their OS distributions and most hardware from
the past >10 years is capable of 64-bit, keeping the 32-bit support alive
is an inadequate burden for the QEMU project. Let's mark the 32-bit
support as deprecated so we can drop it after a while - this will help
us to cut down our limited CI minutes in the gitlab CI, for example.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 9f1bbc495d..ce6463e72b 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -181,9 +181,20 @@ As Debian 10 ("Buster") moved into LTS the big endian 32 bit version of
 MIPS moved out of support making it hard to maintain our
 cross-compilation CI tests of the architecture. As we no longer have
 CI coverage support may bitrot away before the deprecation process
-completes. The little endian variants of MIPS (both 32 and 64 bit) are
+completes. The little endian variants of MIPS are
 still a supported host architecture.
 
+32-bit host operating systems (since 8.0)
+'''''''''''''''''''''''''''''''''''''''''
+
+Testing 32-bit host OS support takes a lot of precious time during the QEMU
+contiguous integration tests, and considering that many OS vendors stopped
+shipping 32-bit variants of their OS distributions and most hardware from
+the past >10 years is capable of 64-bit, keeping the 32-bit support alive
+is an inadequate burden for the QEMU project. Thus QEMU will soon drop the
+support for 32-bit host systems.
+
+
 QEMU API (QAPI) events
 ----------------------
 
-- 
2.31.1



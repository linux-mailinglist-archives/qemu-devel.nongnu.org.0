Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD3337236F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:08:21 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhfo-0002Kj-1A
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhIR-0002Zg-6N
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhIK-0007L3-Jk
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620081843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYCiztV39YHwEV3sqrXCCHIgKfbUf8r53FvbNUnCnCI=;
 b=hAqCRXwxZZqPVkg7o3W7Q4HYssI7E+k0n/S9dQrePjJ1w5Vk4JklV0Q2eVEXmVfZlIEVsn
 VZMzyyDTXUeZfHPHhNSZY2StXyx0d+0PKFXIBjGOp9JhyiwJfUJuAS8S3sLrD3MLUHRr8l
 hEP5wD7TrUZpVvhx0V13Ti1XBxPhmHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-9gt7kKS8MGuQqMGXbFmXWA-1; Mon, 03 May 2021 18:44:01 -0400
X-MC-Unique: 9gt7kKS8MGuQqMGXbFmXWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B60F5107ACCA
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 22:44:00 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-131.gru2.redhat.com
 [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4FFC60C5C;
 Mon,  3 May 2021 22:43:57 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] tests/acceptance: replay_kernel: Remove unused
 wait_for_console_pattern
Date: Mon,  3 May 2021 19:43:24 -0300
Message-Id: <20210503224326.206208-6-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-1-wainersm@redhat.com>
References: <20210503224326.206208-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: willianr@redhat.com, philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ReplayKernelBase class uses the wait_for_console_pattern from its
parent LinuxKernelTest class, thus it doesn't need to import that method
from avocado_qemu.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/replay_kernel.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 71facdaa75..6d4e202723 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -17,7 +17,6 @@
 from avocado import skip
 from avocado import skipIf
 from avocado import skipUnless
-from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
 from avocado.utils import process
 from boot_linux_console import LinuxKernelTest
-- 
2.29.2



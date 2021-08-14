Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493D13EC0DB
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:14:29 +0200 (CEST)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEmw8-0006Jz-Bw
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEmsD-0006tw-NP
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEmsA-0004SX-Sg
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BS7GMsw9Yp0MSmoS/qbbGflDRDXV8ZDFzKX+nDE5oX0=;
 b=RVRfAZHMUeOEXGwTH6O1OtLWrLPSnx0tNN5XuNrB2ItZ3IyBltbBv8kU1Pf9leAstoobB0
 svX4w9S/fTZobgnNwRb7hnnBJei3kUcbp7Imry/MzJC1gWjMoOlOoGKnv+lVARqRYD624Y
 gD39g6MfeoIh1zuL1RaEmyQQ5NUoNbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330--Dq8BchPP-WDFq6T0Or0Lg-1; Sat, 14 Aug 2021 02:10:20 -0400
X-MC-Unique: -Dq8BchPP-WDFq6T0Or0Lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73A3D802920;
 Sat, 14 Aug 2021 06:10:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B202D5D9FC;
 Sat, 14 Aug 2021 06:10:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 11/11] docs/about/removed-features: Document removed machines
 from older QEMU versions
Date: Sat, 14 Aug 2021 08:09:56 +0200
Message-Id: <20210814060956.12852-12-thuth@redhat.com>
In-Reply-To: <20210814060956.12852-1-thuth@redhat.com>
References: <20210814060956.12852-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.701, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These machines had been removed in the QEMU v2.6 up to 4.0 time frame.

Message-Id: <20210811084103.74832-7-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 0c860be62d..cbfa1a8e31 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -473,6 +473,22 @@ Removed without replacement.
 System emulator machines
 ------------------------
 
+``s390-virtio`` (removed in 2.6)
+''''''''''''''''''''''''''''''''
+
+Use the ``s390-ccw-virtio`` machine instead.
+
+The m68k ``dummy`` machine (removed in 2.9)
+'''''''''''''''''''''''''''''''''''''''''''
+
+Use the ``none`` machine with the ``loader`` device instead.
+
+``xlnx-ep108`` (removed in 3.0)
+'''''''''''''''''''''''''''''''
+
+The EP108 was an early access development board that is no longer used.
+Use the ``xlnx-zcu102`` machine instead.
+
 ``spike_v1.9.1`` and ``spike_v1.10`` (removed in 5.1)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''
 
@@ -491,8 +507,8 @@ mips ``fulong2e`` machine alias (removed in 6.0)
 
 This machine has been renamed ``fuloong2e``.
 
-``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (removed in 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``pc-0.10`` up to ``pc-1.3`` (removed in 4.0 up to 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 These machine types were very old and likely could not be used for live
 migration from old QEMU versions anymore. Use a newer machine type instead.
-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8933E2D61
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:13:06 +0200 (CEST)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC1Wz-0004kb-Me
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC1Ua-0008Nq-5r
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC1UY-0008O1-In
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628262633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5kc3qOWPe1aP/yAd5S3cTILPuMbxyhfrYZ0LHa4A/M=;
 b=irgCacLjTv7Q7HQNKmFKO1AwgfyGjeBDnz/rUtWHnROOnmK1aMNn4ZoMKems6/rw2RfH2w
 488j53osOfVdySFQwNxMuR6yHxNa5975KthpuvO+1ZzcvdKag2V6FL8oulTb5S1uw9l/tF
 dJVfNbPGymD9Tsxb9GpgY0qpPrTHMOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-NaZefR87MumczALcDkFBZA-1; Fri, 06 Aug 2021 11:10:32 -0400
X-MC-Unique: NaZefR87MumczALcDkFBZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5F3587D541;
 Fri,  6 Aug 2021 15:10:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F94119811;
 Fri,  6 Aug 2021 15:10:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] docs/about/removed-features: Document removed machines
 from older QEMU versions
Date: Fri,  6 Aug 2021 17:10:12 +0200
Message-Id: <20210806151012.103108-7-thuth@redhat.com>
In-Reply-To: <20210806151012.103108-1-thuth@redhat.com>
References: <20210806151012.103108-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These machines had been removed in the QEMU v2.6 up to 4.0 time frame.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index ffb82c4a99..b1d394d207 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -470,6 +470,22 @@ Removed without replacement.
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
 
@@ -488,8 +504,8 @@ mips ``fulong2e`` machine alias (removed in 6.0)
 
 This machine has been renamed ``fuloong2e``.
 
-``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (removed in 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``pc-0.10`` up to ``pc-1.3`` (removed in 4.0 up to 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 These machine types were very old and likely could not be used for live
 migration from old QEMU versions anymore. Use a newer machine type instead.
-- 
2.27.0



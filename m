Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774EC3E8C3A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:45:04 +0200 (CEST)
Received: from localhost ([::1]:44680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjrD-0004mM-DD
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDjnh-0004wl-SH
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:41:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDjnf-0007mr-1M
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628671282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7D/171oJBqPQGXTp07oB06EzENowvLpm1eRT9JsHv2s=;
 b=ZEqyRIyzKU5TZrNrZhB3fFt8LCL5yKBSz3qoukATxtFVmd4U4OZ7TJnWxBvR8seF5zwNuv
 Z5doqVdnngZTNA338bpipTTAKDmwpU7NnRuCxhIhwweHq9k1GsCtlUT6Q1L0HQkP/DXqP8
 bWgcWemJJnUU2Rdu9ZL9T7CQxYN1bzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-Is2GZ4EuPAWmYypfMmWVAA-1; Wed, 11 Aug 2021 04:41:21 -0400
X-MC-Unique: Is2GZ4EuPAWmYypfMmWVAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BEC3760C8;
 Wed, 11 Aug 2021 08:41:20 +0000 (UTC)
Received: from thuth.com (reserved-198-128.str.redhat.com [10.33.198.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A18F1B5C0;
 Wed, 11 Aug 2021 08:41:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v2 6/6] docs/about/removed-features: Document removed machines
 from older QEMU versions
Date: Wed, 11 Aug 2021 10:41:03 +0200
Message-Id: <20210811084103.74832-7-thuth@redhat.com>
In-Reply-To: <20210811084103.74832-1-thuth@redhat.com>
References: <20210811084103.74832-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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



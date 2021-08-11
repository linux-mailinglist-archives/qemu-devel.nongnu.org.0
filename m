Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA13E8C4E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:46:22 +0200 (CEST)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjsT-0007g0-Rc
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDjoI-0007PV-Qz
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDjoG-00089C-1g
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628671319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRLRlwCoW/dtPClSvtzWqcb032Rf5AxPv989TdYF59U=;
 b=INFMhXYUmmY0tJh+FvGHu8qapa51MqMS8U7OYBDdCfjgSYY9JWBr4I6nQcG+5c7jFGRwaJ
 LVWJV8rYR7pGVeATVmSk9ovi2tX8pFKAQj6hJyMNquglke8o7C1UrHSN14WPaBkj7NhnYq
 oub/2Fj92AwvRD6DlqZRWVzZtOItvEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-FRfMI--eMIWZ2VLEF_oVAA-1; Wed, 11 Aug 2021 04:41:18 -0400
X-MC-Unique: FRfMI--eMIWZ2VLEF_oVAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71CE3760C1;
 Wed, 11 Aug 2021 08:41:17 +0000 (UTC)
Received: from thuth.com (reserved-198-128.str.redhat.com [10.33.198.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E4011B5C0;
 Wed, 11 Aug 2021 08:41:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v2 4/6] docs/about/removed-features: Document removed HMP
 commands from QEMU v2.12
Date: Wed, 11 Aug 2021 10:41:01 +0200
Message-Id: <20210811084103.74832-5-thuth@redhat.com>
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

These HMP commands had been removed/replaced in QEMU v2.12. Still, some
people might want to update from older versions to the recent QEMU version,
so we should give some recommendations for the replacements in our
documentation.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 40d2cc4ffa..8bf3ebecab 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -356,6 +356,17 @@ Specify the properties for the object as top-level arguments instead.
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
+``usb_add`` and ``usb_remove`` (removed in 2.12)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Replaced by ``device_add`` and ``device_del`` (use ``device_add help`` for a
+list of available devices).
+
+``host_net_add`` and ``host_net_remove`` (removed in 2.12)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Replaced by ``netdev_add`` and ``netdev_del``.
+
 The ``hub_id`` parameter of ``hostfwd_add`` / ``hostfwd_remove`` (removed in 5.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
-- 
2.27.0



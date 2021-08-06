Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002B3E2D6C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:16:42 +0200 (CEST)
Received: from localhost ([::1]:49130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC1aT-000333-Bi
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC1UW-0008DY-Mo
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:10:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC1UV-0008Ln-46
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628262630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvacpxvFOFULSmU2qWuwdvjQ1+at4gwunYMpvCg7RdE=;
 b=AZGXD6ILPr+pZxPPv+U/v2MWlp1RkLeddUmdKpGG/ZLgbx/3VqIWykd6SfWPCMROLnhQDx
 LKTtItA8DhBj9jWFq+S0FhWAPbSlz8bh5uxw6R+vEO6dt1U3lOsNh1iwBTO2GYw72Cb/gV
 YBEYy5zS24xRg76AqeW+QzeVt8oBtz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-9vgz_6lrNgqmhOn8-ixS5w-1; Fri, 06 Aug 2021 11:10:29 -0400
X-MC-Unique: 9vgz_6lrNgqmhOn8-ixS5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B00E801AE7;
 Fri,  6 Aug 2021 15:10:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AC4819811;
 Fri,  6 Aug 2021 15:10:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] docs/about/removed-features: Document removed HMP
 commands from QEMU v2.12
Date: Fri,  6 Aug 2021 17:10:10 +0200
Message-Id: <20210806151012.103108-5-thuth@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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

These HMP commands had been removed/replaced in QEMU v2.12. Still, some
people might want to update from older versions to the recent QEMU version,
so we should give some recommendations for the replacements in our
documentation.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index af4f286f73..568a2c725b 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -353,6 +353,17 @@ Specify the properties for the object as top-level arguments instead.
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EC8228F4C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 06:42:43 +0200 (CEST)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jy6aY-0004YK-2h
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 00:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jy6Yb-0002qA-3I
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 00:40:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28688
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jy6YY-0002lp-3e
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 00:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595392837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuU2C4DXYOazrUfiQAllmCLbpXnQAtJl/+AKDkt9d0U=;
 b=GIRGI5pfpGuifak1AV9DXHTz1RhTqDuhqOlOSI/qG0m5vllzNd3z3aHnHrcpA9QWYebycU
 h9EO7L6YcbX2JZ84eIj1msvWaXA+03E1wWQsjBxO1I+XBvxUs5pjTboATAW2f9uYnWoSkh
 Tqwa8OIwOUD0Gvvn0uoDp0dTgbPnQT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-UTUQFqSQPaqnyKuSmZWTKQ-1; Wed, 22 Jul 2020 00:40:34 -0400
X-MC-Unique: UTUQFqSQPaqnyKuSmZWTKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F4D100A8E8;
 Wed, 22 Jul 2020 04:40:33 +0000 (UTC)
Received: from thuth.com (ovpn-112-92.ams2.redhat.com [10.36.112.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E668F726A2;
 Wed, 22 Jul 2020 04:40:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: [PATCH v2 1/4] qga/qapi-schema: Document -1 for invalid PCI address
 fields
Date: Wed, 22 Jul 2020 06:40:25 +0200
Message-Id: <20200722044028.4059-2-thuth@redhat.com>
In-Reply-To: <20200722044028.4059-1-thuth@redhat.com>
References: <20200722044028.4059-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 00:40:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "guest-get-fsinfo" could also be used for non-PCI devices in the
future. And the code in GuestPCIAddress() in qga/commands-win32.c seems
to be using "-1" for fields that it can not determine already. Thus
let's properly document "-1" as value for invalid PCI address fields.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qga/qapi-schema.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 4be9aad48e..408a662ea5 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -846,7 +846,7 @@
 ##
 # @GuestDiskAddress:
 #
-# @pci-controller: controller's PCI address
+# @pci-controller: controller's PCI address (fields are set to -1 if invalid)
 # @bus-type: bus type
 # @bus: bus id
 # @target: target id
-- 
2.18.1



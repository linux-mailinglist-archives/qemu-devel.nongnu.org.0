Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0DC20090D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 14:57:20 +0200 (CEST)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmGa7-0000U3-Jr
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 08:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1jmGYN-0006zt-TV
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 08:55:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49552
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1jmGYL-0007fU-GY
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 08:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592571328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tZz55LheD7/bhc78LTwYnGmrvbU426R+flWtx3GUyT0=;
 b=fHmceWfeH8Xt+bJAKuF01z6vKioh3vmOQeq27tq3S3tZz4IXk7jSPKPqs1WbRG1hebe0Ma
 p2QB4qacrdMb9NkAKFW9a5v19eqxBbdID2dehE4Dg+LjBgeugw/8sxwleaXk216Qk9Z4SR
 eTEd9Gi6dnhTSAyQi9vPrLBHamszPS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-4-yY0MuAPEyXiEE-Ei3SgQ-1; Fri, 19 Jun 2020 08:54:17 -0400
X-MC-Unique: 4-yY0MuAPEyXiEE-Ei3SgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF4DB8018A5;
 Fri, 19 Jun 2020 12:54:16 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1FEF10013C4;
 Fri, 19 Jun 2020 12:54:13 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cpu-models-x86: Fix CPU model name - s/IBR/IBRS/
Date: Fri, 19 Jun 2020 14:54:13 +0200
Message-Id: <20200619125413.2210-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kchamart@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 03:15:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is specified as a literal CPU model, so worth fixing it.

Although the reader might eventually learn the correct name, assuming
they where to look -- `qemu-system-x86 -cpu help`.

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/system/cpu-models-x86.rst.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
index 9a2327828e..9b025c04cc 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -66,7 +66,7 @@ across all desired hosts.
 ``Haswell``, ``Haswell-IBRS``, ``Haswell-noTSX``, ``Haswell-noTSX-IBRS``
     Intel Core Processor (Haswell, 2013)
 
-``IvyBridge``, ``IvyBridge-IBR``
+``IvyBridge``, ``IvyBridge-IBRS``
     Intel Xeon E3-12xx v2 (Ivy Bridge, 2012)
 
 ``SandyBridge``, ``SandyBridge-IBRS``
-- 
2.21.1



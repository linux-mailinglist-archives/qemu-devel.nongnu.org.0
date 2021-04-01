Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D73350EFA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 08:26:01 +0200 (CEST)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRqmF-0003Dh-OW
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 02:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRqkt-0002oL-Sz
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 02:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRqkr-0006Ud-An
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 02:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617258272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hUS7u0ynKTqR9LR9ihs1z/FeBSVIqUj+SP2gTdj+SjM=;
 b=bAIz7Pm+jZQJrzD8QPsds8NnO83T22VK099utfoanfTLav60crN2bb7Gp9UaV0+hx1eWB3
 OCy4yleleJmF0P7KIg+wq3C1oZjU8qpZb5fdoiGKu4WkERH7EfKyZsaO+00A5cGGKpaj1Y
 NFj7uB0CJCYo6AtoTWlqDe5/pInWtPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-FICYTuyJMm-FB90fXp1CVA-1; Thu, 01 Apr 2021 02:24:31 -0400
X-MC-Unique: FICYTuyJMm-FB90fXp1CVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E848800D53;
 Thu,  1 Apr 2021 06:24:30 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A2835C1BB;
 Thu,  1 Apr 2021 06:24:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Sarah Harris <S.E.Harris@kent.ac.uk>
Subject: [PATCH] MAINTAINERS: Drop the lines with Sarah Harris
Date: Thu,  1 Apr 2021 08:24:26 +0200
Message-Id: <20210401062426.3192118-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In a mail to the qemu-devel mailing list, Sarah wrote:

"I was added as a reviewer (in MAINTAINERS) for the AVR target for the
 duration of my research work using it.
 The funding for my project expires in the middle of April, so I will not be
 able to provide time for reviewing patches from that point."

Thus let's remove the corresponding lines in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 554be84b32..e7b54372c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -174,7 +174,6 @@ F: include/hw/arm/smmu*
 
 AVR TCG CPUs
 M: Michael Rolnik <mrolnik@gmail.com>
-R: Sarah Harris <S.E.Harris@kent.ac.uk>
 S: Maintained
 F: docs/system/target-avr.rst
 F: gdb-xml/avr-cpu.xml
@@ -1045,7 +1044,6 @@ AVR Machines
 
 AVR MCUs
 M: Michael Rolnik <mrolnik@gmail.com>
-R: Sarah Harris <S.E.Harris@kent.ac.uk>
 S: Maintained
 F: default-configs/*/avr-softmmu.mak
 F: hw/avr/
@@ -1058,7 +1056,6 @@ F: hw/misc/avr_power.c
 
 Arduino
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
-R: Sarah Harris <S.E.Harris@kent.ac.uk>
 S: Maintained
 F: hw/avr/arduino.c
 
-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7B2351509
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:17:42 +0200 (CEST)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxCf-0006qh-E0
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7o-0001rD-K9
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7m-0004R7-JH
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nn+GfuogsEZgDw99ULTfdHMBsuK9Na3RsldL0rxHxPU=;
 b=VBQugSso+xkP10MbYyh2qlseHDCm3JEPDvCcN+5/LsWWs90FbqAJLzFqUZ//t7HFkObROX
 +q3bPhj3CQFRIuulCKw8QdPl9YQgzYjj5rZXla9XIou2Y8/kIBjB9ss+qxQbmgpIE73XE+
 JAaFN8m3YfaeISnYBDjybAASB9WyQG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-PtnQa7h6MN2LZC34ooOpqw-1; Thu, 01 Apr 2021 09:12:33 -0400
X-MC-Unique: PtnQa7h6MN2LZC34ooOpqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39899801597;
 Thu,  1 Apr 2021 13:12:32 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 238071378E;
 Thu,  1 Apr 2021 13:12:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/13] MAINTAINERS: Drop the lines with Sarah Harris
Date: Thu,  1 Apr 2021 15:12:10 +0200
Message-Id: <20210401131220.3252320-4-thuth@redhat.com>
In-Reply-To: <20210401131220.3252320-1-thuth@redhat.com>
References: <20210401131220.3252320-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In a mail to the qemu-devel mailing list, Sarah wrote:

"I was added as a reviewer (in MAINTAINERS) for the AVR target for the
 duration of my research work using it.
 The funding for my project expires in the middle of April, so I will not be
 able to provide time for reviewing patches from that point."

Thus let's remove the corresponding lines in the MAINTAINERS file.

Message-Id: <20210401062426.3192118-1-thuth@redhat.com>
Reviewed-by: Sarah Harris <S.E.Harris@kent.ac.uk>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcd8da53ae..0abe6182e5 100644
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



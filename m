Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06B2BAF41
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:48:41 +0100 (CET)
Received: from localhost ([::1]:54662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8eO-0001op-D7
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg8bF-00065t-Ip
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg8b4-0002Rf-4K
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605887112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dSwF+75twEr2TOiFFX6aSpce8ZVW3TIuyYXhCYdXwGk=;
 b=Y1FQ6Q9Y4uapuyjYyVcrgxfnElJNkyaqAsjRxYFhzT1NQtPq01nlr7YEbHSqJAL58wlYza
 /+JfT+HRNYeam4TEE/OkKcFftW6zo9Lbj48Nx7EyTfGXTXZyt8vqEgIpWV1m5ZDEBBz95d
 vsQYlw/cwGV5eEppVZ9sL1dyFhxTkks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-i4vt4cjQP4CxyDUlmcGL7Q-1; Fri, 20 Nov 2020 10:45:11 -0500
X-MC-Unique: i4vt4cjQP4CxyDUlmcGL7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EE491005D65;
 Fri, 20 Nov 2020 15:45:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C057360C17;
 Fri, 20 Nov 2020 15:45:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] usb: fix kconfig for usb-xhci-sysbus
Date: Fri, 20 Nov 2020 10:45:06 -0500
Message-Id: <20201120154506.2496906-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the "default y" for USB_XHCI_SYSBUS because
sysbus devices are not user creatable; boards that use them will
specify them manually with "imply" or "select" clauses.

It would be nice to keep the ability to remove PCIe and USB from microvm,
since thos can be disabled on the command line and therefore should not
be included if QEMU is configured --without-default-devices.  However
it's too late for 5.2 to figure out a place for the DSDT creation code.

Reported-by: Bruce Rogers <brogers@suse.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/usb/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 3b07d9cf68..7fbae18bc8 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -47,7 +47,6 @@ config USB_XHCI_NEC
 
 config USB_XHCI_SYSBUS
     bool
-    default y
     select USB_XHCI
 
 config USB_MUSB
-- 
2.26.2



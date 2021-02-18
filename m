Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310C31E957
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 12:55:11 +0100 (CET)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lChtm-0000na-3C
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 06:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lChr0-0007Lb-57
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:52:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lChqu-0004nW-1f
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613649130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhQhnDzoROLQ360Dw8zGWGwb9pzcbAwZh8U1ogxY2qk=;
 b=QDbwlrMVfYq3EM1pxwnGQ8J4OUAjVwxLA3fR6f81poFIQGv5hhab7l+iR5QDj/Q068fRB0
 mJRTBhUrDBikO75uPB8BegQmiaTz4e4r2qeD+4q+qNQ68KF8KWNeQSdi+oHoP8cIvpCweJ
 00FIPILzGbs79CjXSMWVzVZS6F/0S/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-o0CSy2SeMkGoSAFL1kwmKg-1; Thu, 18 Feb 2021 06:52:09 -0500
X-MC-Unique: o0CSy2SeMkGoSAFL1kwmKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ED03107AD29
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 11:52:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45D6360C61;
 Thu, 18 Feb 2021 11:52:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C04E31800383; Thu, 18 Feb 2021 12:52:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] usb/pcap: set flag_setup
Date: Thu, 18 Feb 2021 12:52:01 +0100
Message-Id: <20210218115201.2765071-3-kraxel@redhat.com>
In-Reply-To: <20210218115201.2765071-1-kraxel@redhat.com>
References: <20210218115201.2765071-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without that wireshark complains about invalid control setup data
for non-control transfers.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210216144939.841873-1-kraxel@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/pcap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/pcap.c b/hw/usb/pcap.c
index 4350989d3a71..dbff00be252e 100644
--- a/hw/usb/pcap.c
+++ b/hw/usb/pcap.c
@@ -127,6 +127,7 @@ static void do_usb_pcap_ctrl(FILE *fp, USBPacket *p, bool setup)
         .xfer_type  = usbmon_xfer_type[USB_ENDPOINT_XFER_CONTROL],
         .epnum      = in ? 0x80 : 0,
         .devnum     = dev->addr,
+        .flag_setup = setup ? 0 : '-',
         .flag_data  = '=',
         .length     = dev->setup_len,
     };
@@ -169,6 +170,7 @@ static void do_usb_pcap_data(FILE *fp, USBPacket *p, bool setup)
         .xfer_type  = usbmon_xfer_type[p->ep->type],
         .epnum      = usbmon_epnum(p),
         .devnum     = p->ep->dev->addr,
+        .flag_setup = '-',
         .flag_data  = '=',
         .length     = p->iov.size,
     };
-- 
2.29.2



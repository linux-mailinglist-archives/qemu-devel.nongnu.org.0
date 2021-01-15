Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E721F2F757D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:33:21 +0100 (CET)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LTs-0001LF-UQ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0LSG-0000SN-3c
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:31:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0LSB-0008RC-K1
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:31:39 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543--1QW-hSuPsai-jvzUBKPHg-1; Fri, 15 Jan 2021 04:31:32 -0500
X-MC-Unique: -1QW-hSuPsai-jvzUBKPHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0A88107ACF8;
 Fri, 15 Jan 2021 09:31:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B46335C1A3;
 Fri, 15 Jan 2021 09:31:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1C8931800606; Fri, 15 Jan 2021 10:31:29 +0100 (CET)
Date: Fri, 15 Jan 2021 10:31:29 +0100
From: Gerd Hoffmann <gerd@kraxel.org>
To: "Pagan, Angel" <Angel.Pagan@stratus.com>
Subject: Re: USB Gen2 passthrough not working
Message-ID: <20210115093129.5bqkyme4uz2zzczx@sirius.home.kraxel.org>
References: <BL0PR08MB4676559855A6894E3B987514E5A80@BL0PR08MB4676.namprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BL0PR08MB4676559855A6894E3B987514E5A80@BL0PR08MB4676.namprd08.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

>  usb 2-3: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd

> localhost login: [   72.763264] usb 1-4: new low-speed USB device number 3 using xhci_hcd

ilibusb reports LIBUSB_SPEED_SUPER_PLUS and qemu
doesn't handle it ...

Lets treat it like superspeed for now, does that help?

--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -186,6 +186,7 @@ static const char *speed_name[] = {
     [LIBUSB_SPEED_FULL]    = "12",
     [LIBUSB_SPEED_HIGH]    = "480",
     [LIBUSB_SPEED_SUPER]   = "5000",
+    [LIBUSB_SPEED_SUPER_PLUS] = "5000+",
 };
 
 static const unsigned int speed_map[] = {
@@ -193,6 +194,7 @@ static const unsigned int speed_map[] = {
     [LIBUSB_SPEED_FULL]    = USB_SPEED_FULL,
     [LIBUSB_SPEED_HIGH]    = USB_SPEED_HIGH,
     [LIBUSB_SPEED_SUPER]   = USB_SPEED_SUPER,
+    [LIBUSB_SPEED_SUPER_PLUS] = USB_SPEED_SUPER,
 };
 
 static const unsigned int status_map[] = {



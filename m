Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5351D35972F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 10:09:00 +0200 (CEST)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUmCI-0000Gj-TV
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 04:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUmBZ-0008HP-71
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:08:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUmBW-0006TO-Oo
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:08:12 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-A_s4pkQQPviDeXncQPSpEA-1; Fri, 09 Apr 2021 04:08:07 -0400
X-MC-Unique: A_s4pkQQPviDeXncQPSpEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B25141882FD2;
 Fri,  9 Apr 2021 08:08:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 676615D71D;
 Fri,  9 Apr 2021 08:08:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A008918000AB; Fri,  9 Apr 2021 10:08:04 +0200 (CEST)
Date: Fri, 9 Apr 2021 10:08:04 +0200
From: Gerd Hoffmann <gerd@kraxel.org>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: Mac OS real USB device support issue
Message-ID: <20210409080804.vs2r546gy3ntdmgr@sirius.home.kraxel.org>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <20210408110523.eh3i7djynv54cqi2@sirius.home.kraxel.org>
 <C055FBC4-09F8-4057-9742-99C660F97607@gmail.com>
MIME-Version: 1.0
In-Reply-To: <C055FBC4-09F8-4057-9742-99C660F97607@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> The questions that come to mind are:
> - Does libusb_detach_kernel_driver() work on Mac OS?
> - Is libusb_detach_kernel_driver() called on Mac OS in QEMU?
> 
> The only mention of this function in QEMU comes from host-libusb.c. 
> 
> After some tests I found out the function
> host-libusb.c:usb_host_detach_kernel() is being called on Mac OS 11.1.
> It never reaches the libusb_detach_kernel_driver() function. It stops
> at the continue statement.

Yep.  Most likely libusb_kernel_driver_active() returns 0 because the
kernel driver management functions are not implemented for macos.

take care,
  Gerd



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77D3089B8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:07:46 +0100 (CET)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VNB-0005LR-By
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5VKY-0004So-FZ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:05:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5VKW-0001oj-LG
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611932699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n7pGB0zD2lIng4M22Ij/wazrCiW0NsY2Muo/HtZQFEw=;
 b=DwFPrQ/W7zw2dS97W2rpHolLNaUClj3WWtizb1Wqf/tw5VtoJz8ZJx62BU8CCI1NO7zzYT
 sNeIWRdcElxuc24Zluu8S4PPXMSafBEVrFK1cGGE3nZ1jHM0I45ckdws9IpI8jKf3eXYRz
 Z9nKhWFZkiAUvKaYIbYGTJH+1O+aVDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-0RmDT_qSNTi7H8EzDIIHRw-1; Fri, 29 Jan 2021 10:04:57 -0500
X-MC-Unique: 0RmDT_qSNTi7H8EzDIIHRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 474C3107ACE3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:04:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECF2F77712;
 Fri, 29 Jan 2021 15:04:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1E373180038D; Fri, 29 Jan 2021 16:04:54 +0100 (CET)
Date: Fri, 29 Jan 2021 16:04:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129150454.fgfhrcrqao7aqee5@sirius.home.kraxel.org>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Unless we para-virtualize the keyboard?

The main advantage of paste via key events is that it doesn't require
guest support.  Requiring any kind of software in the guest (paravirt
keyboard driver, agent figuring the keymap, whatever else) kills that
advantage.  And if we need guest cooperation anyway it is much better
to just read/write the guest clipboard directly.

Standard keyboard seems to not be an option either.  The HID specs
(https://usb.org/document-library/hid-usage-tables-121) lists a
Unicode Page (Section 18), which looks like it could be used to
send unicode chars to the guest.  Problem is (a) this is 16bit
only (so no emoji) and (b) widely unimplemented in guest OSes.

take care,
  Gerd



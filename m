Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967133D3485
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:19:30 +0200 (CEST)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oWv-0004qM-MH
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6oWC-0004Bm-UC
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:18:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6oW9-0000xD-Ue
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627021120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JvZQXMnw7yfOePZIUWdyKBCP6UsSehgxxE2YA32Del8=;
 b=PIgLps0MCeGPZYJ6ZwRETwrIq8hcYXgNDOm48yVVL8AwspCTo7RueLkDAcKY9ih26SL/kg
 jjmSKvB7HkQZqRiTFsdLBXqQ51D67Ov2MKxuT9uNYkcCUWBYu8CHwhpD75RU9Q2HsFt3Qr
 R9/WdqNiX0WplLoURTM+5bDoksEef1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-kab04DbDP_6FeDJtl9lGqQ-1; Fri, 23 Jul 2021 02:18:39 -0400
X-MC-Unique: kab04DbDP_6FeDJtl9lGqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 411E2100F764;
 Fri, 23 Jul 2021 06:18:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 854995D9C6;
 Fri, 23 Jul 2021 06:18:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DE7A01800926; Fri, 23 Jul 2021 08:18:32 +0200 (CEST)
Date: Fri, 23 Jul 2021 08:18:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PULL 37/48] usb: build usb-host as module
Message-ID: <20210723061832.vhzptuht3ejsuhw7@sirius.home.kraxel.org>
References: <20210708151748.408754-1-pbonzini@redhat.com>
 <20210708151748.408754-38-pbonzini@redhat.com>
 <YPl8O8d1riAgeBD6@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <YPl8O8d1riAgeBD6@angien.pipo.sk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +if config_host.has_key('CONFIG_USB_LIBUSB')
> 
> The problem is in this condition as it's evaluated as false. When I
> replace it with libusb.found(), everything works as it used to.

Correct fix, paolo has a pending pull request containing it.

> Unfortunately I don't know what the real goa behind using
> CONFIG_USB_LIBUSB here was to see whether my approach is good.

Used to be the correct approach before libusb detection was
switched from configure to meson.

take care,
  Gerd



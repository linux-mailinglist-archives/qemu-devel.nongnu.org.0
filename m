Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6682F9E71
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:40:18 +0100 (CET)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1StN-0007mx-6T
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1SpA-0003lo-9h
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:35:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1Sp6-0001pA-Pk
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610969751;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7L4LOYtOR2k3hFpvGkai+pLEVq+Idc3r82WR55pL/g=;
 b=TKmBf3SGlIHHxV6EoH/J5Yab27jVnM/32qflgRF+6Eyg/0a8vM6ZsCgYQQsrJ8a9blzZo+
 uvpFybl/T7rqt7XkJGcJ3wWR6i2uHe3ZCWh3iB3rh4Qzs+r874aYY57DwruAfYwO7tB+3T
 GV/jovaR0X/StT9g6YDx3pfBsQ65y5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-D7C_o4O0Oqq7RyGrZjICnQ-1; Mon, 18 Jan 2021 06:35:46 -0500
X-MC-Unique: D7C_o4O0Oqq7RyGrZjICnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3496159;
 Mon, 18 Jan 2021 11:35:45 +0000 (UTC)
Received: from redhat.com (ovpn-116-34.ams2.redhat.com [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D49D13805;
 Mon, 18 Jan 2021 11:35:40 +0000 (UTC)
Date: Mon, 18 Jan 2021 11:35:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PULL 7/7] hw/usb: avoid format truncation warning
 when formatting port name
Message-ID: <20210118113538.GF1789637@redhat.com>
References: <20190503065954.17069-1-kraxel@redhat.com>
 <20190503065954.17069-8-kraxel@redhat.com>
 <227c9e6b-61e4-d9ec-1b4b-b33d6323bbd9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <227c9e6b-61e4-d9ec-1b4b-b33d6323bbd9@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 12:31:07PM +0100, Philippe Mathieu-Daudé wrote:
> Hello,
> 
> On 5/3/19 8:59 AM, Gerd Hoffmann wrote:
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > hw/usb/hcd-xhci.c: In function ‘usb_xhci_realize’:
> > hw/usb/hcd-xhci.c:3339:66: warning: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 5 [-Wformat-trunca\
> > tion=]
> >  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
> >       |                                                                  ^~
> > hw/usb/hcd-xhci.c:3339:54: note: directive argument in the range [1, 2147483647]
> >  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
> >       |                                                      ^~~~~~~~~~~~~~~
> > 
> > The xhci code formats the port name into a fixed length
> > buffer which is only large enough to hold port numbers
> > upto 5 digits in decimal representation. We're never
> > going to have a port number that large, so aserting the
> > port number is sensible is sufficient to tell GCC the
> > formatted string won't be truncated.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > Message-Id: <20190412121626.19829-5-berrange@redhat.com>
> > 
> > [ kraxel: also s/int/unsigned int/ to tell gcc they can't
> >           go negative. ]
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  hw/usb/hcd-xhci.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> > index d8472b4fea7f..2e9a839f2bf9 100644
> > --- a/hw/usb/hcd-xhci.c
> > +++ b/hw/usb/hcd-xhci.c
> > @@ -3306,7 +3306,7 @@ static void usb_xhci_init(XHCIState *xhci)
> >  {
> >      DeviceState *dev = DEVICE(xhci);
> >      XHCIPort *port;
> > -    int i, usbports, speedmask;
> > +    unsigned int i, usbports, speedmask;
> >  
> >      xhci->usbsts = USBSTS_HCH;
> >  
> > @@ -3336,6 +3336,7 @@ static void usb_xhci_init(XHCIState *xhci)
> >                  USB_SPEED_MASK_LOW  |
> >                  USB_SPEED_MASK_FULL |
> >                  USB_SPEED_MASK_HIGH;
> > +            assert(i < MAXPORTS);
> >              snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
> >              speedmask |= port->speedmask;
> >          }
> > @@ -3349,6 +3350,7 @@ static void usb_xhci_init(XHCIState *xhci)
> >              }
> >              port->uport = &xhci->uports[i];
> >              port->speedmask = USB_SPEED_MASK_SUPER;
> > +            assert(i < MAXPORTS);
> >              snprintf(port->name, sizeof(port->name), "usb3 port #%d", i+1);
> >              speedmask |= port->speedmask;
> >          }
> > 
> 
> I am confused, I upgraded Fedora 32 -> 33 and am now getting this
> error back, the assertion being apparently ignored:

I'm not seeing this on F33 myself, but our CI is still F32. We
should upgrade that.

What are your configure args ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



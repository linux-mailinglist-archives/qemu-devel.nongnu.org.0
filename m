Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D2F3D253F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:11:36 +0200 (CEST)
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ZQF-00044E-FP
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1m6ZPL-0003PV-QK
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1m6ZPI-0004dk-OS
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626963035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HYd8aE7NbS8ULW5+t/D/yMIly5Q11o5fjXo4gZVd5oo=;
 b=TKK26IAv0+FXc52Yz0mzp5pD633sj3dp895ehxc5GPGRDwl6PCMUhqx+FH/7s8iHh+q7pX
 lzWbgdM9KxeDEUXSTjeotQce9dRQxs6VKJQ4nPWBfa1M89rxbgaQD/YX0nsBs3xB/eeKA4
 fS7TKVFuostesYM0MnyO6OdF2Uv8+AY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-zJ_XJ4pMMTWkNJBZPC7GwQ-1; Thu, 22 Jul 2021 10:10:34 -0400
X-MC-Unique: zJ_XJ4pMMTWkNJBZPC7GwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 230E41026211;
 Thu, 22 Jul 2021 14:10:33 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAAA63AE1;
 Thu, 22 Jul 2021 14:10:07 +0000 (UTC)
Date: Thu, 22 Jul 2021 16:10:03 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 37/48] usb: build usb-host as module
Message-ID: <YPl8O8d1riAgeBD6@angien.pipo.sk>
References: <20210708151748.408754-1-pbonzini@redhat.com>
 <20210708151748.408754-38-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708151748.408754-38-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
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
Cc: libvir-list@redhat.com, "Jose R . Ziviani" <jziviani@suse.de>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

adding libvirt-list

On Thu, Jul 08, 2021 at 17:17:37 +0200, Paolo Bonzini wrote:
> From: Gerd Hoffmann <kraxel@redhat.com>
> 
> Drop one more shared library dependency (libusb) from core qemu.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
> Message-Id: <20210624103836.2382472-34-kraxel@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/usb/host-libusb.c | 1 +
>  hw/usb/meson.build   | 8 ++++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

After this commit libvirt is no longer detecting the 'hostdevice'
property of 'usb-host'. In fact 'device-list-properties' is returning:

"desc": "Device 'usb-host' not found"

> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index 2b7f87872c..c0f314462a 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -1777,6 +1777,7 @@ static TypeInfo usb_host_dev_info = {
>      .class_init    = usb_host_class_initfn,
>      .instance_init = usb_host_instance_init,
>  };
> +module_obj(TYPE_USB_HOST_DEVICE);
>  
>  static void usb_host_register_types(void)
>  {
> diff --git a/hw/usb/meson.build b/hw/usb/meson.build
> index 817f3e027a..3ca6127937 100644
> --- a/hw/usb/meson.build
> +++ b/hw/usb/meson.build
> @@ -72,8 +72,12 @@ if usbredir.found()
>  endif
>  
>  # usb pass-through
> -softmmu_ss.add(when: ['CONFIG_USB', libusb],
> -               if_true: files('host-libusb.c'))
> +if config_host.has_key('CONFIG_USB_LIBUSB')

The problem is in this condition as it's evaluated as false. When I
replace it with libusb.found(), everything works as it used to.

Unfortunately I don't know what the real goa behind using
CONFIG_USB_LIBUSB here was to see whether my approach is good.

> +  usbhost_ss = ss.source_set()
> +  usbhost_ss.add(when: ['CONFIG_USB', libusb],
> +                 if_true: files('host-libusb.c'))
> +  hw_usb_modules += {'host': usbhost_ss}
> +endif
>  
>  softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
>  
> -- 
> 2.31.1
> 
> 
> 



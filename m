Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A833F60B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:51:47 +0100 (CET)
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZOc-0000WX-KI
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMYt2-0006J5-1w
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:19:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMYsw-0007E3-Jt
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615997940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=um7nWXWDtjrvzttPPpyWEubDdZm5njBRag//a+bbMss=;
 b=Ej9L7h3lrZTsM+0QLM2d207APRpnJo8PMi8zlSx3G1BFydgKlEcI8EurjB1eIilCWYgo5Y
 AkEzuXrFGPG6PtJXwZH/ngIcItExUTCYgIMKdjyFDFAXUraqRbo1fC6Z4IDDt8sFzlBsU5
 dPQCU/nTlleIdbcF3pC+npf1is9/Rl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-nj7N6kX1Oxu5qHSYi-Onww-1; Wed, 17 Mar 2021 12:18:58 -0400
X-MC-Unique: nj7N6kX1Oxu5qHSYi-Onww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49898180FCA3;
 Wed, 17 Mar 2021 16:18:57 +0000 (UTC)
Received: from redhat.com (ovpn-113-247.ams2.redhat.com [10.36.113.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71F622BFEC;
 Wed, 17 Mar 2021 16:18:56 +0000 (UTC)
Date: Wed, 17 Mar 2021 16:18:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: Win10 always takes 100% cpu power even when idle
Message-ID: <YFIr7YJvjGXURoRl@redhat.com>
References: <YFIqKhlRclmy+kwN@diablo.13thmonkey.org>
MIME-Version: 1.0
In-Reply-To: <YFIqKhlRclmy+kwN@diablo.13thmonkey.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 05:11:22PM +0100, Reinoud Zandijk wrote:
> Hi,
> 
> when executing Qemu with
> 
>   qemu-system-x86_64 -m 4G -smp cores=2 -M q35 -snapshot \
>     -drive file=/home/reinoud/Downloads/Win10-demo.raw,format=raw \
>     -rtc base=localtime,clock=host -spice port=5924,disable-ticketing=on \
>     -vga qxl -usb -device usb-tablet -net nic -net tap,ifname=tap0,script=no
> 
> my cpu usage in Windows10 *allways* reports 100% cpu usage. On the host system
> its always 190%+ ie it is really taking two cores completely.
> 
> Using our NVMM accelerator makes it run a whole lot faster, as good as native
> speed, but it always takes up the whole two processors too! Windows10 also
> *allways* reports 100% cpu usage. Its not a startup thing for even when
> letting it run for quite some time never reduces the cpu time.
> 
> In contrast, running NetBSD in the VM takes no CPU time at all when idle.
> 
> When Googling about this, I saw this come by quite often. Is there something
> Qemu can do about this? What makes it spin like this and why is it Windows10
> specific? This is a specific VM aware version too if I may believe it saying
> so. I already replaced drivers to virtio etc but to no avail. Always 100% CPU
> time for all CPUs.
> 
> Could this also be an ACPI thing?

IIRC,  "-usb" still adds a USB-1 controller and that's known to be bad
for causing high load in Windows guests in particular. So before
debugging anything else, I'd suggest configuring a USB-3 controller
instead - see docs/usb2.txt XHCI info.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



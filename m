Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A286133F647
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:08:52 +0100 (CET)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZf9-00059c-Ln
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMZcI-0003Tk-0Q
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMZcE-0002HO-1M
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616000747;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82g/nrUa+b6LbZUe73RegfMJrk7ae4fIgx7vlIBJA/A=;
 b=DCuOdnOjBfHG6KEGTvK7S1MvS7emYYN71pf8hzD9mdHYDCVxTwUtepAF7Pvn8zUU+PvSsn
 7v5OOUm1fqDaz7/vxYEyOtaPxSLxuCGOrzBgki6lRH6QdeednWbHgtQgf0yZ0yRrYExM/P
 GqEqON3qn3EUnJHE88ukTiBl1uLQAEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-bQD-m6F-P_-WceyqWF4IdA-1; Wed, 17 Mar 2021 13:05:43 -0400
X-MC-Unique: bQD-m6F-P_-WceyqWF4IdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5E8A80006E;
 Wed, 17 Mar 2021 17:05:42 +0000 (UTC)
Received: from redhat.com (ovpn-113-247.ams2.redhat.com [10.36.113.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E347C37DD;
 Wed, 17 Mar 2021 17:05:41 +0000 (UTC)
Date: Wed, 17 Mar 2021 17:05:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: Win10 always takes 100% cpu power even when idle
Message-ID: <YFI24wf3rg993d7H@redhat.com>
References: <YFIqKhlRclmy+kwN@diablo.13thmonkey.org>
 <YFIr7YJvjGXURoRl@redhat.com>
 <YFI1tThW/xpwNOsc@diablo.13thmonkey.org>
MIME-Version: 1.0
In-Reply-To: <YFI1tThW/xpwNOsc@diablo.13thmonkey.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Wed, Mar 17, 2021 at 06:00:37PM +0100, Reinoud Zandijk wrote:
> On Wed, Mar 17, 2021 at 04:18:53PM +0000, Daniel P. Berrangé wrote:
> > On Wed, Mar 17, 2021 at 05:11:22PM +0100, Reinoud Zandijk wrote:
> > > when executing Qemu with
> > > 
> > >   qemu-system-x86_64 -m 4G -smp cores=2 -M q35 -snapshot \
> > >     -drive file=/home/reinoud/Downloads/Win10-demo.raw,format=raw \
> > >     -rtc base=localtime,clock=host -spice port=5924,disable-ticketing=on \
> > >     -vga qxl -usb -device usb-tablet -net nic -net tap,ifname=tap0,script=no
> > > 
> > > my cpu usage in Windows10 *allways* reports 100% cpu usage. On the host system
> > > its always 190%+ ie it is really taking two cores completely.
> 
> > IIRC,  "-usb" still adds a USB-1 controller and that's known to be bad for
> > causing high load in Windows guests in particular. So before debugging
> > anything else, I'd suggest configuring a USB-3 controller instead - see
> > docs/usb2.txt XHCI info.
> 
> I tried that and added `-device qemu-xhci' instead of the `-usb' and it indeed
> showed an USB 3 interface. It didn't help though; its still consuming 100% CPU
> from both configured CPUs.
> 
> When I completely remove USB, i get the jagged mouse again but it makes no
> difference :-/

Possibly you need some of the hyperv enlightenments enabled too. Though
I can't recall the precise command line offhand, as I just rely on
virt-install virt-manager to do the right thing for Windows guests.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



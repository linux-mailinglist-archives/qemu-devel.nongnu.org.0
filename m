Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959FB308856
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:37:04 +0100 (CET)
Received: from localhost ([::1]:36270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S5H-0002gz-L5
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Rdg-0007mN-Nn
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:08:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Rdc-0001qg-2u
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611918506;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=L8X/XGGQY/QEa+82/5sJCQj6sgTF93xszKIHOdSnweI=;
 b=ZXLMIZyQa602+bSbuwYDHTMGXgsnOG2BT12eNEKFf94hm3StCkwS02Qdn9Rv2JmNaiARyN
 W+zDhnY7JzUSXK5TcKf/tUAkQdM4r2SeSJgJtrJaTYMA0Tpbex60yYXGBtEIbFXQuk4Ect
 oLH2cFuNmlufCA0o23+fXQ7CueNJb74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-X8Je4NGhNrOVzhcJkvDeug-1; Fri, 29 Jan 2021 06:08:21 -0500
X-MC-Unique: X8Je4NGhNrOVzhcJkvDeug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E903859
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:08:20 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0338F5C1B4;
 Fri, 29 Jan 2021 11:08:16 +0000 (UTC)
Date: Fri, 29 Jan 2021 11:08:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129110814.GF4001740@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 11:50:10AM +0100, Christophe de Dinechin wrote:
> 
> 
> > On 29 Jan 2021, at 09:03, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > 
> >  Hi,
> > 
> >>> (1) Have some guest agent (spice does it that way).
> >>>     Advantage: more flexible, allows more features.
> >>>     Disadvantage: requires agent in the guest.
> >> 
> >> What about running the option to relay data to a VNC server in the
> >> guest if there is one running? In other words, using an existing
> >> VNC server as an agent, with the option of having a stripped-down,
> >> clipboard only VNC server as a later optimization.
> > 
> > Well, if you run Xvnc in the guest anyway why use the qemu vnc server
> > in the first place?
> 
> I assume that if you use the qemu VNC, it's because you you don't want to
> run Xvnc on some external network, or care about accessing the guest
> before Xvnc can be launched. There can be many reasons.
> 
> Again, I want to make it clear that my suggestion is _not_ simply to access
> the existing Xvnc as is, but rather to stick with some VNC server code to handle
> the clipboard if / when possible.
> 
> Let me try to imagine a scenario, where I'll use a macOS guest intentionally
> to clarify what I was thinking about.
> 
> - During early boot, there is no in-guest VNC server, so to address that,
> you connect to the qemu VNC. At this stage, all screen refresh is handled
> by the qemu VNC, and the best you can do if you want to support any
> kind of copy-paste is to convert it to virtual keystrokes. The same would
> be true for Linux on a text console.
> 
> - Then comes up you macOS guest, and it still has no VNC port open,
> so you are stuck with qemu-vnc doing all the work. But now you can
> enable screen sharing, and that launches the Apple-maintained macOS
> VNC server.
> 
> - Let's assume for illustration that this listens on some private network
> that qemu can access, but that is not visible externally. In this case,
> you could not VNC to the guest, but you can still VNC to qemu.
> 
> - What I'm suggesting is that qemu-vnc could then switch to simply
> relaying VNC traffic to that in-guest server. You'd get the smart update
> algorithm that Apple has put in place to deal with transparency and the
> like, as well as a level of guest OS integration that would otherwise be
> much harder to replicate.

IMHO that's an awful lot of complexity to add to the system
that isn't especially useful and this opens up new attack
vectors for the guest to exploit the host.

If people have VNC/RDP/whatever configured inside their guest
OS, then there's really little to no reason for them to want
to connect to the QEMU VNC server, as viewing initial bootup
phase is not required in normal case. The only time such
people will need to use the QEMU VNC server is if the guest
OS has broken in some way before it fully booted and thus failed
to start the guest VNC server. There is no guest VNC server
to hand off to in this scenario.

The value of the QEMU host side VNC server is that it works
for all possible guest OS, no matter whether they are running
normally or broken, regardless of what the guest admin has
configured in terms of guest level remote desktop.

IOW, if you have a guest remote desktop solution you'll just
use that 99% of the time. If you don't have that, then you'll
use QEMU VNC/SPICE server, and there won't be anything in the
guest for that to proxy to/from.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



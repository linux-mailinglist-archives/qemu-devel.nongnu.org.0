Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773F3308991
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:36:26 +0100 (CET)
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Usr-00079F-94
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Upj-00063O-Kk
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Upf-0004ns-Hf
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611930785;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmeVeme2a0jDKTNOPJqKP7SH/bz6tNXCL1asP/UZF/A=;
 b=D5NJN0WVXpl4JdFFeRQDBLKLkx6RSGISchwbOSJUZjWIATQupX3tN3E9MRXmoj4rorQ/vo
 ImGezotvLX5fD6LihjmD3x7z++ljzNxuSo0wsORToJ5XPphoUUdAAx+Rw3miC1nGxMsM1I
 /kP4l0yj5mTVyib0/JQlDIRwy358Ubw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-Dra750PLMcmGVfAn-ql5Cg-1; Fri, 29 Jan 2021 09:33:00 -0500
X-MC-Unique: Dra750PLMcmGVfAn-ql5Cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 273ABAFA82
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 14:32:59 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46A2A6F7E7;
 Fri, 29 Jan 2021 14:32:55 +0000 (UTC)
Date: Fri, 29 Jan 2021 14:32:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129143252.GE4008275@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 03:19:45PM +0100, Christophe de Dinechin wrote:
> 
> 
> > On 29 Jan 2021, at 12:08, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > On Fri, Jan 29, 2021 at 11:50:10AM +0100, Christophe de Dinechin wrote:
> >> 
> >> 
> >>> On 29 Jan 2021, at 09:03, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >>> 
> >>> Hi,
> >>> 
> >>>>> (1) Have some guest agent (spice does it that way).
> >>>>>    Advantage: more flexible, allows more features.
> >>>>>    Disadvantage: requires agent in the guest.
> >>>> 
> >>>> What about running the option to relay data to a VNC server in the
> >>>> guest if there is one running? In other words, using an existing
> >>>> VNC server as an agent, with the option of having a stripped-down,
> >>>> clipboard only VNC server as a later optimization.
> >>> 
> >>> Well, if you run Xvnc in the guest anyway why use the qemu vnc server
> >>> in the first place?
> >> 
> >> I assume that if you use the qemu VNC, it's because you you don't want to
> >> run Xvnc on some external network, or care about accessing the guest
> >> before Xvnc can be launched. There can be many reasons.
> >> 
> >> Again, I want to make it clear that my suggestion is _not_ simply to access
> >> the existing Xvnc as is, but rather to stick with some VNC server code to handle
> >> the clipboard if / when possible.
> >> 
> >> Let me try to imagine a scenario, where I'll use a macOS guest intentionally
> >> to clarify what I was thinking about.
> >> 
> >> - During early boot, there is no in-guest VNC server, so to address that,
> >> you connect to the qemu VNC. At this stage, all screen refresh is handled
> >> by the qemu VNC, and the best you can do if you want to support any
> >> kind of copy-paste is to convert it to virtual keystrokes. The same would
> >> be true for Linux on a text console.
> >> 
> >> - Then comes up you macOS guest, and it still has no VNC port open,
> >> so you are stuck with qemu-vnc doing all the work. But now you can
> >> enable screen sharing, and that launches the Apple-maintained macOS
> >> VNC server.
> >> 
> >> - Let's assume for illustration that this listens on some private network
> >> that qemu can access, but that is not visible externally. In this case,
> >> you could not VNC to the guest, but you can still VNC to qemu.
> >> 
> >> - What I'm suggesting is that qemu-vnc could then switch to simply
> >> relaying VNC traffic to that in-guest server. You'd get the smart update
> >> algorithm that Apple has put in place to deal with transparency and the
> >> like, as well as a level of guest OS integration that would otherwise be
> >> much harder to replicate.
> > 
> > IMHO that's an awful lot of complexity to add to the system
> > that isn't especially useful and this opens up new attack
> > vectors for the guest to exploit the host.
> > 
> > If people have VNC/RDP/whatever configured inside their guest
> > OS, then there's really little to no reason for them to want
> > to connect to the QEMU VNC server, as viewing initial bootup
> > phase is not required in normal case. The only time such
> > people will need to use the QEMU VNC server is if the guest
> > OS has broken in some way before it fully booted and thus failed
> > to start the guest VNC server. There is no guest VNC server
> > to hand off to in this scenario.
> 
> It's a matter of what you want to do with that qemu vnc.
> 
> If it's only a backup when there's nothing in the guest to help,
> then maybe trying to support copy-paste is not a good idea.
> 
> If it's a standard go-to access point for connecting to your
> guest, then making it smart is hard, but useful.
> 
> > 
> > The value of the QEMU host side VNC server is that it works
> > for all possible guest OS, no matter whether they are running
> > normally or broken, regardless of what the guest admin has
> > configured in terms of guest level remote desktop.
> 
> Understood.
> 
> The downside is that there are things it can't do. It cannot correctly
> determine the keyboard map, because that's controlled in software
> in the guest.

There is no need for the remote desktop server to care about the
keymap. The remote client takes scancodes and passes them to the
server, which then passes them to the guest.

The person connected to the remote server simply has to configure
their guest OS keymap to match the physical keyboard they currently
have plugged in.

The only reason a remote server would need to know the keymap is
if it was trying to translate from keycodes back into scancodes.
This is what VNC protocol had to do originally, but VNC was since
extended to pass raw scancodes instead of keycodes, precisely to
avoid needing to care about keymaps.

> > IOW, if you have a guest remote desktop solution you'll just
> > use that 99% of the time. If you don't have that, then you'll
> > use QEMU VNC/SPICE server, and there won't be anything in the
> > guest for that to proxy to/from.
> 
> If really the assumption is there is nothing in the guest to help
> us, then I'd say "paste" should come up with a warning "do you want
> me to try and translate that into keystrokes", and I don't see how to
> implement copy from a graphical display without OCR…

I'm not saying we can't use stuff in the guest, just that we should be
pragmatic about what we interact with in the guest and degrade nicely.
I don't think that proxying from a host VNC server to a guest VNC server
is sensible, but making use of a guest agent of some kind is not
unreasonable, especially if we can use one that already exists.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



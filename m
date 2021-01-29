Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC4F3087A2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:03:57 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QdA-00081n-Nd
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Qbz-0007Xu-VD
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Qbw-0007c3-AK
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611914556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuj2QxTlXChf1k6zSNCZTpbI1/Qd3/T77oxmpbNdEmI=;
 b=Lngi3ofO8Yqp8g3WyZsYlAzKYUjpX2H8B+ouAXCiNgYZGgE100aH5WaBWVVd6bUxTIveAA
 H2x1O2XtGItBr4E8FWrD/lF0UI5P3gvzpL1sdvPOJ381GKbKB2AmK5+jvO5XTzBrAHsNvf
 KJwKcFjEU/lawStAnmVGp3rdKI0JYfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-Ii8mqpt0NHWn1JlPEIz_OA-1; Fri, 29 Jan 2021 05:02:34 -0500
X-MC-Unique: Ii8mqpt0NHWn1JlPEIz_OA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D1DE107ACE3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 10:02:33 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90E5860BE2;
 Fri, 29 Jan 2021 10:02:29 +0000 (UTC)
Date: Fri, 29 Jan 2021 10:02:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129100226.GD4001740@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <e5231182-aee5-a706-a261-1a5bab072402@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e5231182-aee5-a706-a261-1a5bab072402@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Thu, Jan 28, 2021 at 06:57:24PM +0100, Laszlo Ersek wrote:
> On 01/28/21 18:12, Gerd Hoffmann wrote:
> >   Hi folks,
> > 
> > I'm looking for a good way to implement cut+paste support for vnc.
> > 
> > The vnc core protocol has support for text/plain cut+paste, and there
> > is an extension adding support for other formats.  That'll cover one
> > part of the problem, exchanging cut+paste data between vnc client and
> > qemu vnc server.
> > 
> > The tricky part is the second: the guest <=> qemu communication.
> > I see basically two possible approaches here:
> > 
> >   (1) Have some guest agent (spice does it that way).
> >       Advantage: more flexible, allows more features.
> >       Disadvantage: requires agent in the guest.
> >   
> >   (2) Send text as key events.
> >       Advantage: no guest agent needed.
> >       Disadvantage: is translated by guests keyboard map, so qemu
> >       needs to know the map for proper char -> key event translation.
> >       Only works for text/plain and only for chars you can easily
> >       type, anything needing input methods (emoji 😊 for example)
> >       isn't going to fly.
> > 
> > I think that (1) is clearly the better way.  Given that the agent
> > would need to run in user wayland/xorg session context the existing
> > qemu-guest-agent will not work.  Also linking against some UI library
> > like gtk3 for clipboard handling is not something we want for the
> > qemu-guest-agent.  So we need another one, I'll name it
> > qemu-clipboard-agent for the rest of this mail.  And we need a
> > communication channel.
> > 
> > I'd tend to model the qemu-clipboard-agent simliar to the
> > qemu-guest-agent, i.e. have some stream as communication path and run
> > some stream protocol over it.
> > 
> > Stream options I see are (in order of personal preference):
> > 
> >   (1) New virtio-serial port.  virtio-serial likely is there anyway
> >       for the qemu-guest-agent ...
> > 
> >   (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent
> >       channel, i.e. qemu-clipboard-agent will proxy everything through
> >       qemu-guest-agent (spice does it that way).
> > 
> > Protocol options I see are (not sure yet which to prefer, need to have
> > a closer look at the candidates):
> > 
> >   (1) Add clipboard commands to QMP and use these.
> > 
> >   (2) Reuse the clipboard bits of the vnc protocol (forward
> >       VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)
> > 
> >   (3) Reuse the clipboard bits of the spice-agent protocol.
> > 
> >   (4) Reuse the clipboard bits of the wayland protocol.
> > 
> > Once we have sorted the qemu <-> guest communication path it should be
> > possible to also hook up other UIs (specifically gtk) without too much
> > effort.  Which probably makes (2) a rather poor choice.
> > 
> > Comments?
> > Suggestions?
> > Other ideas?
> 
> Just a random thought: the guest should not be able to sniff, steal, or
> overwrite host-side clipboard (selection) content, without the host user
> explicitly requesting a clipboard operation. I understand this is
> generally a problem between X11 applications (not so on Wayland, if I
> understand correctly), but I assume it becomes graver with
> virtualization -- there shouldn't be an unintended channel between
> host/guest, or even multiple guests. (Analogy: you can "ssh -X -Y" to
> two remote machines at the same time, and assuming "xauth" etc on both
> of those remote machines, you can run "gedit" on each of those remote
> machines, and cut'n'paste will work between them, *even if* you don't
> ask for it -- that's why ssh has a separate option called "-Y".
> Cut'n'paste does not work without "-Y". So I believe this is something
> to consider here.)

Yes, that's a known risk. SPICE lets you disable clipboard synchronization
in QEMU, and any client app should also support doing the same. Basically
only want clipboard sync if you're using a trustworthy guest. eg where
both host and guest admin are the same person, and even then you might
not want it sometimes.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



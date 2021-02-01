Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C53C30AE3F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:44:22 +0100 (CET)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6dFN-0007EO-G4
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6dBu-0005AS-BK
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:40:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6dBi-0002IJ-At
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612201231;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/s6CBQH4JgZVbew2AtTnQjbjdpYFE4iu76eh6qZ9gHI=;
 b=f3gh9+zjLma6LONPv7an9oZiR5m7d1Pn/oEoXbAyy+UEZ3Arz+4JXfKp7u7BfRv/waeUQh
 QwY3z64LBq2ADWRRBSdsiyuxJjRZxhnaYKKy0RPfckBbajBLhko43xkMJ0ZeDNOoED9Pr2
 OPoIIs7cNJ+1TVPU7Nh7XNBjo0ZS8QE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-rDVS-dwaPTqbVzLnytsMug-1; Mon, 01 Feb 2021 12:40:26 -0500
X-MC-Unique: rDVS-dwaPTqbVzLnytsMug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FC338144E2
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 17:40:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-195.ams2.redhat.com [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B37F15D9DC;
 Mon,  1 Feb 2021 17:40:21 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:40:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210201174018.GP4131462@redhat.com>
References: <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129143252.GE4008275@redhat.com>
 <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
MIME-Version: 1.0
In-Reply-To: <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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

On Mon, Feb 01, 2021 at 06:28:38PM +0100, Christophe de Dinechin wrote:
> 
> 
> > On 1 Feb 2021, at 17:56, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > On Mon, Feb 01, 2021 at 05:31:52PM +0100, Christophe de Dinechin wrote:
> >> 
> >> 
> >> 
> >> But the VNC clipboard protocol is not scancode based. So where
> >> would the clipboard->scancode conversion happen?
> > 
> > If using keyboard injection there's not really much point in
> > using the VNC clipboard protocol at all. It just complicates
> > life since now we have to configure QEMU with a keymap so that
> > it can turn text back into scancodes. We went through alot of
> > effort precisely to *stop* telling QEMU about keymaps, so that
> > is not an viable option.
> 
> How do you get rid of keymaps for local input in qemu?

Don't look at the RFC spec for the RFB protocol. Instead look
at the community spec which defines all the extensions that
clients and servers have implemented. In this case, QEMU defined
an extension for scancodes:

  https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#qemu-extended-key-event-message

this is since implemented by alot of VNC clients and severs.


> > IOW, if we want to use keyboard injection to fake the clipboard
> > then the VNC Clients should just implemnet this natively and
> > use the VNC keyboard protocol messages instead, so scancode
> > conversion is client side. It is still painful, because text
> > to scancode is inherantly a lossy conversion, but it is better
> > than doing it on the QEMU code.
> 
> How many brands of VNC clients are there?
> 
> What happens if qemu receives clipboard messages from an old client?
> 
> Do you plan some new VNC capability to tell the client "I want scancodes"?

The ability to send keyboard events as scancodes has already
existed since 2008 :-)

> What would prevent a client from sending dangerous scancodes,
> like Control C or Alt TAB?

Nothing, but then this is largely a case of a user shooting themselves
in the foot, not a security issue.

> How would you prevent the user from typing something in the middle?

You can't.

> How do you rate-limit intelligently to avoid overflowing the guest keyboard buffers?

Like I said earlier in this thread, this is a big problem with
keyboard injection.

IMHO keyboard injection is only barely better than no clipboard
at all, and I don't think we should settle for that as a solution.

My preferred solution is to have QEMU leverage the existing SPICE
guest agent if at all possible, because that's already widely
available in existing guest OS.

> >> Also, any idea how to copy from the guest in that case?
> > 
> > If using keyboard injection the clipboard will be unidirectional
> > only.
> > 
> > Bi-directional clipboard needs a guest agent.
> 
> OK.
> 
> What is the use case for single-directional text-only clipboard?

It is better no clipboard at all.... but only just.


> > That's not really isolating it from VNC - that's describing a guest
> > agent the host QEMU can use to support its built-in VNC server.
> > Confusingly this suggested guest agent happens to use a subset of
> > the VNC protocol for transferring clipboard data between QEMU and
> > the guest OS. This part is rather crazy since the VNC clipboard
> > protocol is incredibly simplistic. Any new guest agent should
> > learn from the mistakes of VNC and SPICE wrt clipboard.
> 
> Well, to me, the trick is that you got a VNC server in qemu that
> receives VNC clipboard data. The question is how you transfer
> that to the guest. Indeed, the protocol is simplistic, but you still
> need a new data path, e.g. a character device that your in-guest
> agent listens to, a bit like the SPICE agent. So the picture becomes:
> 
> Normal VNC
> Client --> (guest network) --> In-guest VNC server
> 
> QEMU VNC:
> Client --> (host network) --> qemu-VNC server --> char device --> in-guest VNC clipboard server
> 
> Only the data path changes, but the protocol can remain
> essentially the same.

We should not be relying on the guest OS using VNC at all. On Windows
it is much more common to use RDP and GNOME looks to be going the same
way for Linux. We none the less want to be able to still use VNC from
the host side.

We need something to be running in the guest, and that should be
agnostic of whatever other software the guest chooses to use for
remote desktop, and should not assume the guest even has remote
desktop setup. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



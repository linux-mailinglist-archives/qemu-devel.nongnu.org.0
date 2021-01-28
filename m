Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58ED307CD2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:43:18 +0100 (CET)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BK9-0007WT-L6
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5BCY-0001bO-E3
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:35:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5BCR-0005cR-5d
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611855315;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82nHlhQNsStotxbItmz1Tax93QjjpJ2vvEVrireUhnM=;
 b=EE+6xWEFNaotQ0wpklYjC9yZchdFQkgWO50KodlA17Xfy/9EH6fgldgdFZ+5+wjpdNGWJo
 Oyqdy9pLtx//CpABrrdhJhV0Ldb+pyD3z8WFZ4eqrzyZ1MZu9v39Rv+64tndXOvq2bstBn
 pBGV9RzDwGFlvRtIfcq0tWM1/PQ+5Ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-hKLv1L2iOx2MGwFrHaH6lg-1; Thu, 28 Jan 2021 12:35:13 -0500
X-MC-Unique: hKLv1L2iOx2MGwFrHaH6lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12E13193578E
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:35:13 +0000 (UTC)
Received: from redhat.com (ovpn-115-133.ams2.redhat.com [10.36.115.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 287A360C6D;
 Thu, 28 Jan 2021 17:35:07 +0000 (UTC)
Date: Thu, 28 Jan 2021 17:35:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210128173504.GS3832029@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 06:12:24PM +0100, Gerd Hoffmann wrote:
>   Hi folks,
> 
> I'm looking for a good way to implement cut+paste support for vnc.
> 
> The vnc core protocol has support for text/plain cut+paste, and there
> is an extension adding support for other formats.  That'll cover one
> part of the problem, exchanging cut+paste data between vnc client and
> qemu vnc server.

NB the VNC cut+paste impl is technically undefined  for non-7-bit ascii
data. In reality though I'd assume most servers/clients and up sending
UTF8. 

> The tricky part is the second: the guest <=> qemu communication.
> I see basically two possible approaches here:
> 
>   (1) Have some guest agent (spice does it that way).
>       Advantage: more flexible, allows more features.
>       Disadvantage: requires agent in the guest.



>   
>   (2) Send text as key events.
>       Advantage: no guest agent needed.
>       Disadvantage: is translated by guests keyboard map, so qemu
>       needs to know the map for proper char -> key event translation.
>       Only works for text/plain and only for chars you can easily
>       type, anything needing input methods (emoji 😊 for example)
>       isn't going to fly.
> 
> I think that (1) is clearly the better way.

I agree - the agent based approach also lets you have a bi-directional
solution. ie copy in the guest, paste in the host, which you can't
do by simulating key presses.  Simulating keypress is insanely slow
too, so useless for more than 100 bytes of text really.

>                                              Given that the agent
> would need to run in user wayland/xorg session context the existing
> qemu-guest-agent will not work.  Also linking against some UI library
> like gtk3 for clipboard handling is not something we want for the
> qemu-guest-agent.  So we need another one, I'll name it
> qemu-clipboard-agent for the rest of this mail.  And we need a
> communication channel.

I've never looked at the spice-guest-agent code, but I wonder if there
is any scope for re-using it with VNC, or is it too closely tangled
up with SPICE ?  The advantage of reuse is that all existing guest
OS with spice-guest-agent installed will "just work".

> I'd tend to model the qemu-clipboard-agent simliar to the
> qemu-guest-agent, i.e. have some stream as communication path and run
> some stream protocol over it.
> 
> Stream options I see are (in order of personal preference):
> 
>   (1) New virtio-serial port.  virtio-serial likely is there anyway
>       for the qemu-guest-agent ...
> 
>   (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent
>       channel, i.e. qemu-clipboard-agent will proxy everything through
>       qemu-guest-agent (spice does it that way).
> 
> Protocol options I see are (not sure yet which to prefer, need to have
> a closer look at the candidates):
> 
>   (1) Add clipboard commands to QMP and use these.
> 
>   (2) Reuse the clipboard bits of the vnc protocol (forward
>       VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)
> 
>   (3) Reuse the clipboard bits of the spice-agent protocol.
> 
>   (4) Reuse the clipboard bits of the wayland protocol.
> 
> Once we have sorted the qemu <-> guest communication path it should be
> possible to also hook up other UIs (specifically gtk) without too much
> effort.  Which probably makes (2) a rather poor choice.

I think the VNC clipboard stuff is too crude to base a long term
design on. I figure we'll want to be at least inspired by (3) or
(4).

> Comments?
> Suggestions?
> Other ideas?

The QEMU guest agent is a single system level agent. IIUC, with SPICE
you have a single system level agent, and then zero or more session
level agents - one per desktop login basically. I assume we'll want
to support the latter too, at least from a design level, even if we
don't implemnet multi session straight away.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F692307D51
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:05:26 +0100 (CET)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BfZ-0008Vd-8L
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l5BY7-0004YI-Lh
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l5BY4-0005Rp-9J
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611856657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/QyA+RynvO4qpBlfgW4v3toNJYVy++q7UYr7weZks8=;
 b=Mt+NTTFf3UcsXlhvrbeji/ylHd0N4ELl+ZNsp92ukecOsLK4Qg6Gsdwm8a4rIc3+F1rU6o
 BpF13uIvC51jcy/IZ6zt/WBCldsyRsq9VvufezNil7IBPCVSUGIAmwPx9U7JKS9QxYdGi2
 Tw0X0AdwBgFGQKeVJXVjC/PTbhJ9ALk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-M2E1PuA5MTaB8KoYC70xkA-1; Thu, 28 Jan 2021 12:57:30 -0500
X-MC-Unique: M2E1PuA5MTaB8KoYC70xkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BF2559
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:57:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-24.ams2.redhat.com
 [10.36.112.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1B910016F5;
 Thu, 28 Jan 2021 17:57:25 +0000 (UTC)
Subject: Re: vnc clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e5231182-aee5-a706-a261-1a5bab072402@redhat.com>
Date: Thu, 28 Jan 2021 18:57:24 +0100
MIME-Version: 1.0
In-Reply-To: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/28/21 18:12, Gerd Hoffmann wrote:
>   Hi folks,
> 
> I'm looking for a good way to implement cut+paste support for vnc.
> 
> The vnc core protocol has support for text/plain cut+paste, and there
> is an extension adding support for other formats.  That'll cover one
> part of the problem, exchanging cut+paste data between vnc client and
> qemu vnc server.
> 
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
> I think that (1) is clearly the better way.  Given that the agent
> would need to run in user wayland/xorg session context the existing
> qemu-guest-agent will not work.  Also linking against some UI library
> like gtk3 for clipboard handling is not something we want for the
> qemu-guest-agent.  So we need another one, I'll name it
> qemu-clipboard-agent for the rest of this mail.  And we need a
> communication channel.
> 
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
> 
> Comments?
> Suggestions?
> Other ideas?

Just a random thought: the guest should not be able to sniff, steal, or
overwrite host-side clipboard (selection) content, without the host user
explicitly requesting a clipboard operation. I understand this is
generally a problem between X11 applications (not so on Wayland, if I
understand correctly), but I assume it becomes graver with
virtualization -- there shouldn't be an unintended channel between
host/guest, or even multiple guests. (Analogy: you can "ssh -X -Y" to
two remote machines at the same time, and assuming "xauth" etc on both
of those remote machines, you can run "gedit" on each of those remote
machines, and cut'n'paste will work between them, *even if* you don't
ask for it -- that's why ssh has a separate option called "-Y".
Cut'n'paste does not work without "-Y". So I believe this is something
to consider here.)

Thanks,
Laszlo



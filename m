Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4F41D76FA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 13:25:56 +0200 (CEST)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jadu8-0003qt-0s
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 07:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jadtC-0002iK-Jh
 for qemu-devel@nongnu.org; Mon, 18 May 2020 07:24:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38097
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jadtB-0008T7-Kn
 for qemu-devel@nongnu.org; Mon, 18 May 2020 07:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589801096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPMsPnukbvvQ44F4RZY24VePaqw10LbxErEUM+FfA8g=;
 b=JOk/jSuWWRWY8JYCY296YURaXf8X2J1LiykAdHUD0P5htDnrXZ5rBBjFH3xKdiG5Bpi4lG
 ox6g4PiFNYTNL0vBUV/7cnaSJkOqsGQPoHRQtEqFd8ENA7JVSZYvs6SeRzW9iPQhzUboAG
 jd2Gl8IBhIa/BE4LcZYUB32oJb0fCXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-QGZmp3PMM-S2cvRTNVvXvA-1; Mon, 18 May 2020 07:24:53 -0400
X-MC-Unique: QGZmp3PMM-S2cvRTNVvXvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD149800D24
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 11:24:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C39A583841;
 Mon, 18 May 2020 11:24:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D016017444; Mon, 18 May 2020 13:24:48 +0200 (CEST)
Date: Mon, 18 May 2020 13:24:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 11/13] audio: deprecate -soundhw pcspk
Message-ID: <20200518112448.7lwjol4elj4d76bq@sirius.home.kraxel.org>
References: <20200515143528.13591-1-kraxel@redhat.com>
 <20200515143528.13591-12-kraxel@redhat.com>
 <20200515150823.GA738369@lpt>
 <20200518101628.3j4d6hwq6pitjfo3@sirius.home.kraxel.org>
 <20200518102650.GG1430944@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200518102650.GG1430944@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?utf-8?Q?J=C3=A1n?= Tomko <jtomko@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 18, 2020 at 11:26:50AM +0100, Daniel P. Berrangé wrote:
> On Mon, May 18, 2020 at 12:16:28PM +0200, Gerd Hoffmann wrote:
> > On Fri, May 15, 2020 at 05:08:23PM +0200, Ján Tomko wrote:
> > > On a Friday in 2020, Gerd Hoffmann wrote:
> > > > Add deprecation message to the audio init function.
> > > > 
> > > > Factor out audio initialization and call that from
> > > > both audio init and realize, so setting audiodev via
> > > > -global is enough to properly initialize pcspk.
> > > > 
> > > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > > ---
> > > > hw/audio/pcspk.c | 24 +++++++++++++++++++++---
> > > > 1 file changed, 21 insertions(+), 3 deletions(-)
> > > > 
> > > > @@ -236,9 +245,18 @@ static const TypeInfo pcspk_info = {
> > > >     .class_init     = pcspk_class_initfn,
> > > > };
> > > > 
> > > > +static int pcspk_audio_init_soundhw(ISABus *bus)
> > > > +{
> > > > +    PCSpkState *s = pcspk_state;
> > > > +
> > > > +    warn_report("'-soundhw pcspk' is deprecated, "
> > > > +                "please set a backend using '-global isa-pcspk.audiodev=<name>' instead");
> > > > +    return pcspk_audio_init(s);
> > > 
> > > -soundhw pcspk is the only soundhw device present in libvirt git.
> > > 
> > > Is there a way to probe for this change via QMP?
> > 
> > Oops.  I'm surprised libvirt actually supports pcspk.
> > 
> > There is no way to see that in qmp, and I can't think of an easy way
> > to add that.  Does libvirt check for command line switches still?
> > So it could see -soundhw going away if that happens?
> 
> IIUC, instead of probing for whether -soundhw is deprecated, it should
> be suffiicent for us to probe if "isa-pcspk.audiodev" exists. Assuming
> we always use isa-pcspk.audiodev if it exists, then we'll trivially
> avoid using the -soundhw arg.

It's not that easy unfortunately.  We have .audiodev for a few releases
already.  But just setting that isn't enough to initialize pcspk in
current qemu, "-soundhw pcspk" is still needed ...

I'm looking at how to initialize onboard audio devices currently, maybe
the best way to handle that is to do it flash-style with machine
properties (i.e have a pc.pcslk alias for pcspk.audiodev, simliar to
pc.flash0 being an alias for pflash.drive).  That'll be better that
-global and it'll also be visible in QOM.

Initialization order looks tricky though.  I'd have to create pcspk
early, simliar to flash, in pc_machine_initfn().  Problem is I don't
have a isa bus yet at that point (flash is sysbus and doesn't have this
problem).  I'm open to suggestions hiow do deal with that best.

take care,
  Gerd



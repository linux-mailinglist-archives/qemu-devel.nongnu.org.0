Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4801B3A1387
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:54:55 +0200 (CEST)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwnO-0003WD-4j
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqwmd-0002pU-IA
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqwmZ-0001Q7-Gm
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623239642;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qazg5EYp2vWzf5uM7lsIdi3tq9UV4VUp4Hf4vy4JAII=;
 b=L4gDBi4voNNEMzQ7Gpx1DpDJHK1UvZ9RNCYXmpqCsI3BFwNVGITAXmZAm3U1e8Q9B41o1O
 tVkspUu3dSLmfheF50j6+Wkdm2jaZ9vsPCsUMdJG7psjw2xnr0myNA6AmJJ3OpEMzSSCBg
 v7TMlfQkh74+GhzyyVPPIkWerGHMOSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-Ed3wSF9COGe556geREXLyA-1; Wed, 09 Jun 2021 07:54:01 -0400
X-MC-Unique: Ed3wSF9COGe556geREXLyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CA45100CF6A
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 11:54:00 +0000 (UTC)
Received: from redhat.com (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD5DA19C45;
 Wed,  9 Jun 2021 11:53:49 +0000 (UTC)
Date: Wed, 9 Jun 2021 12:53:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
Message-ID: <YMCrytyvkuZX6bZW@redhat.com>
References: <20210609100240.1285032-1-thuth@redhat.com>
 <20210609112405.pyv62l22g5ympoe4@sirius.home.kraxel.org>
 <YMCmNrcNByZ+Ozxn@redhat.com>
 <20210609114921.mc4upvizeobfruaw@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210609114921.mc4upvizeobfruaw@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Thomas Huth <thuth@redhat.com>, libvir-list@redhat.com, smitterl@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 01:49:21PM +0200, Gerd Hoffmann wrote:
> On Wed, Jun 09, 2021 at 12:29:58PM +0100, Daniel P. Berrangé wrote:
> > On Wed, Jun 09, 2021 at 01:24:05PM +0200, Gerd Hoffmann wrote:
> > > On Wed, Jun 09, 2021 at 12:02:40PM +0200, Thomas Huth wrote:
> > > > Libvirt's "domcapabilities" command has a way to state whether
> > > > certain graphic frontends are available in QEMU or not. Originally,
> > > > libvirt looked at the "--help" output of the QEMU binary to determine
> > > > whether SDL was available or not (by looking for the "-sdl" parameter
> > > > in the help text), but since libvirt stopped doing this analysis of
> > > > the help text, the detection of SDL is currently broken, see:
> > > > 
> > > >  https://bugzilla.redhat.com/show_bug.cgi?id=1790902
> > > > 
> > > > QEMU should provide a way via the QMP interface instead. The simplest
> > > > way, without introducing additional commands, is to make the DisplayType
> > > > enum entries conditional, so that the enum only contains the entries if
> > > > the corresponding CONFIG_xxx switches have been set.
> > > 
> > > Hmm, that'll break for the "dnf remove qemu-ui-sdl" case ...
> > 
> > Note tht libvirt invalidates its cache of QEMU capabilities when it
> > sees the /usr/lib64/qemu directory timestamp change. So it ought to
> > pick up changes caused by installing/removing QEMU modules, and apply
> > this to future queries for domcapabilities, or when starting future
> > QEMU guests.
> 
> That'll work fine for modules implementing qom objects / devices,
> because the list of available objects changes accordingly and libvirt
> can see that.
> 
> The #if CONFIG_SDL approach will not work because qemu will continue to
> report sdl as supported even when the sdl module is not installed any
> more.

Ah see what you mean now.  So libvirt can't merely query members of
the DisplayType enum. We need an actual 'query-display-types' command
that returns an array of DisplayType values corresponding to what is
actually built-in or available as a module at that instant.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



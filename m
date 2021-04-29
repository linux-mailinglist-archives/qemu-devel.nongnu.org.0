Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8B636E8F1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:38:03 +0200 (CEST)
Received: from localhost ([::1]:32784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc43W-0002RQ-4S
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lc41T-0001ZX-06
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lc41R-0007Jk-8v
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619692549;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnJjYHXczK7ZuQoVXokJPXl47HBsLHbEyVorPGZvCLk=;
 b=jPHtJ3tOiQIeGlTeiLVs7q0VziEeoZlI/AqTh1jp536tXL0gGURlopqDOpZY5+5OCFQnTT
 6tE4l9gIteAEj7QLrkyIn4ebHp2rKGTZVODrNfDJD/qsDIbiH8c1GQbmPGWZq2K8R517nj
 yZOckWxw61qoo4g0TsFiyuaKVz7jkEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-bFuy1lYCO7iVMLNQQP2DIw-1; Thu, 29 Apr 2021 06:35:45 -0400
X-MC-Unique: bFuy1lYCO7iVMLNQQP2DIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B32D501F5;
 Thu, 29 Apr 2021 10:35:44 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6450E6A90B;
 Thu, 29 Apr 2021 10:35:28 +0000 (UTC)
Date: Thu, 29 Apr 2021 11:35:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <YIqL7dSxR/C6URkX@redhat.com>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <20210429101842.hupkajdlkttq6l4v@sirius.home.kraxel.org>
 <YIqJY1Z4jqruCu17@redhat.com>
 <CAFEAcA-_UTcs-XgPD6OLnKBUYJ9xnYRg9FAorinxejp7XZCxpQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_UTcs-XgPD6OLnKBUYJ9xnYRg9FAorinxejp7XZCxpQ@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 11:29:42AM +0100, Peter Maydell wrote:
> On Thu, 29 Apr 2021 at 11:28, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Apr 29, 2021 at 12:18:42PM +0200, Gerd Hoffmann wrote:
> > >   Hi,
> > >
> > > >     ``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since 4.0)
> > > >     Creating sound card devices and vnc without ``audiodev=`` property (since 4.2)
> > > >     Creating sound card devices using ``-soundhw`` (since 5.1)
> > >
> > > I think these three should be dropped together, to minimize disruption.
> > >
> > > Where do we strand in terms of libvirt support?  IIRC audiodev= support
> > > in libvirt is rather recent (merged this year).  I'd tend to wait a bit
> > > longer because of that.
> > >
> > > Daniel?
> >
> > Libvirt added supoort for -audio in 7.2.0, release April 4th, so only
> > one month ago.
> >
> > If we drop the features in QEMU in this dev cycle though, this won't
> > impact most users until QEMU 6.1 releases in mid August. I'm perfectly
> > ok with people who use unreleased QEMU git master needing to update
> > their libvirt. The final release date is far enough away that distros
> > will have had new enough libvirt for a good while.
> 
> It does feel to me that dropping the old options now would be being
> a bit over-eager, though. The deprecation cycle time is a minimum, not
> a target :-)

Note the QEMU since has been ready since 4.0, in April 2019 so 2 years.
We dropped the ball on getting this implemented in libvirt, since we
had almost no config options for sound at all in libvirt. We had just
hardcoded 3 sound backends based on the graphics frontend.

So in terms of historic libvirt compatibility, we've only ever relied
on the QEMU_AUDIODRIVER env, none of the other million audio env vars.

IOW, if QEMU was to be conservative, you can drop all env vars except
the main QEMU_AUDIODRIVER.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



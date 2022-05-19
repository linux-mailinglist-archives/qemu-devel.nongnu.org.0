Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9252CE50
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 10:29:19 +0200 (CEST)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrbX4-0007wU-3W
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 04:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrbTF-0005zu-No
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrbTC-000728-Ha
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652948717;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OfymiJBhGVEwEinT0wt0mo2cIdEOzCfVWZn3rk3DVRU=;
 b=ZBGGMLgQGnwXOGiADYOQud310LHg243YjQ1tl2t6M1+KkqpyGRtNX1ZhiEL8INjm7vtine
 zC46fgFubFKh0JPQVwUYM16YIK9nim7JY/OuqD6VH7nnOeL2QaM0DxNsJQtGsjHrYYe3Tz
 Ixc/r1ZQeBLTb9W8Z35xn2g5EhXVgfk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-_DklCIHTNN2wtderHNzjXw-1; Thu, 19 May 2022 04:25:14 -0400
X-MC-Unique: _DklCIHTNN2wtderHNzjXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D896F811E78;
 Thu, 19 May 2022 08:25:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE0EE1121314;
 Thu, 19 May 2022 08:25:12 +0000 (UTC)
Date: Thu, 19 May 2022 09:25:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: The fate of iotest 297
Message-ID: <YoX+5VEe/ET8+5W8@redhat.com>
References: <CAFn=p-aEc=uWyGi2758wDwJF=St4ZThkvuDqVXoxTtcHLFZkhA@mail.gmail.com>
 <YoUgufuA8/pjYwTE@redhat.com>
 <CAFn=p-YUQm-spxrbOgv8xKB3wDMWdTRfSVB6oVOiYh=Eqw=sfA@mail.gmail.com>
 <YoX30Aa0x40CKe7G@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YoX30Aa0x40CKe7G@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 19, 2022 at 09:54:56AM +0200, Kevin Wolf wrote:
> Am 18.05.2022 um 20:21 hat John Snow geschrieben:
> > To wire it up to "make check" by *default*, I believe I need to expand the
> > configure script to poll for certain requisites and then create some
> > wrapper script of some kind that only engages the python tests if the
> > requisites were met ... and I lose some control over the mypy/pylint
> > versioning windows. I have to tolerate a wider versioning, or it'll never
> > get run in practice.
> > 
> > I have some reluctance to doing this, because pylint and mypy change so
> > frequently that I don't want "make check" to fail spuriously in the future.
> > 
> > (In practice, these failures occur 100% of the time when I am on vacation.)
> 
> So we seem to agree that it's something that we do expect to fail from
> time to time. Maybe this is how I could express my point better: If it's
> a hard failure, it should fail as early as possible - i.e. ideally
> before the developer sends a patch, but certainly before failing a pull
> request.

At least with pylint we can make an explicit list of which lint
checks we want to run, so we should not get new failures when a
new pylint is released. If there are rare cases where we none
the less see a new failure from a new release, then so be it,
whoever hits it first can send a patch. IOW, I think we should
just enable pylint all the time with a fixed list of tests we
care about. Over time we can enable more of its checks when
desired.

I don't know enough about mypy to know if it can provide similar
level of control. Possibly the answer for "should we run it by default"
will be different for pylint vs mypy.

Still, none of this is all that different from the case where
new GCC or CLang are released and developers find new warnings
have arrived. People just send patches when they hit this.
Given python is a core part of QEMU's dev tooling, I think it
is reasonable to expect developers to cope with this for python
too, as long as the frequency of problems is not unreasonably
high.

> > That said ... maybe I can add a controlled venv version of "check-python"
> > and just have a --disable-check-python or something that spec files can opt
> > into. Maybe that will work well enough?
> > 
> > i.e. maybe configure can check for the presence of pip, the python venv
> > module (debian doesnt ship it standard...), and PyPI connectivity and if
> > so, enables the test. Otherwise, we skip it.
> 
> I think this should work. If detecting the right environment is hard, I
> don't think there is even a requirement to do so. You can make
> --enable-check-python the default and if people don't want it, they can
> explicitly disable it. (I understand that until you run 'make check', it
> doesn't make a difference anyway, so pure users would never have to
> change the option, right?)

I think it should just be the default too. Contributors have to accept
that python is a core part of our project and we expect such code to
pass various python quality control tests, on the wide variety of OS
platforms we run on.

> > Got it. I'll see what I can come up with that checks the boxes for
> > everyone, thanks for clarifying yours.
> > 
> > I want to make everything "just work" but I'm also afraid of writing too
> > much magic crap that could break and frustrate people who have no desire to
> > understand python packaging junk, so I'm trying to balance that.
> 
> Yes, sounds like we need to find some balance there. Test infrastructure
> breaking locally for no obvious reason can be quite frustrating. But
> sending a patch and getting it queued, only to be notified that it's
> dropped again because of a mypy problem two weeks later when the
> maintainer sends the pull request, can be equally (if not even more)
> frustrating.

The other benefit to having the checks turned on by default for everyone
is that it removes John as the centralized point responsible for finding,
investigating and addressing python style issues, and distributes it
amongst all the QEMU contributors.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



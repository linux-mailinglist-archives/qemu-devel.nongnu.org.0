Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AB4E60DB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 10:07:05 +0100 (CET)
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJQu-0002m6-GS
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 05:07:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJNF-0000tR-Ep
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:03:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJND-0005nC-EF
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648112594;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27Qca326sVP3pkgl4TLqiZbmMp7d49HLROrc94Aa7aA=;
 b=bsBR1qH4em5gHyY9m1+pL9XS51Z3BfO9kHcubA20//gQZovXcyidJd/2tCreGsoYGNv6D5
 9/mFEGRy7zdz8doefliLaCtqC0QsFYAvy/x+SG5gVLmDso2WvGOuTkRe8VaiRqgd4ehClw
 aF4sbvpBfnLMfp+/XhOgd0o+sKoz/Mo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-MHWdWVzGM2GU-eybEgJEMQ-1; Thu, 24 Mar 2022 05:03:11 -0400
X-MC-Unique: MHWdWVzGM2GU-eybEgJEMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10135803524;
 Thu, 24 Mar 2022 09:03:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73240C27D86;
 Thu, 24 Mar 2022 09:03:09 +0000 (UTC)
Date: Thu, 24 Mar 2022 09:03:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
Message-ID: <Yjwzy97JAHKhvCHn@redhat.com>
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
 <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
 <YjwzCM3/wZ4S2fxf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YjwzCM3/wZ4S2fxf@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Mar 24, 2022 at 09:00:05AM +0000, Daniel P. Berrangé wrote:
> On Wed, Mar 23, 2022 at 05:47:48PM -0400, John Snow wrote:
> > On Mon, Mar 21, 2022 at 5:08 PM John Snow <jsnow@redhat.com> wrote:
> > >
> > > The legacy.py module is heavily based on the QMP module by Luiz
> > > Capitulino (et al) which is licensed as explicit GPLv2-only. The async
> > > QMP package is currently licensed similarly, but I intend to relicense
> > > the async package to the more flexible GPLv2+.
> > >
> > > In preparation for that change, make the license on legacy.py explicit.
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >  python/qemu/aqmp/legacy.py | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> > > index 46026e9fdc..f86cb29804 100644
> > > --- a/python/qemu/aqmp/legacy.py
> > > +++ b/python/qemu/aqmp/legacy.py
> > > @@ -4,6 +4,17 @@
> > >  This class pretends to be qemu.qmp.QEMUMonitorProtocol.
> > >  """
> > >
> > > +#
> > > +# Copyright (C) 2009-2022 Red Hat Inc.
> > > +#
> > > +# Authors:
> > > +#  Luiz Capitulino <lcapitulino@redhat.com>
> > > +#  John Snow <jsnow@redhat.com>
> > > +#
> > > +# This work is licensed under the terms of the GNU GPL, version 2.  See
> > > +# the COPYING file in the top-level directory.
> > > +#
> > > +
> > >  import asyncio
> > >  from typing import (
> > >      Any,
> > > --
> > > 2.34.1
> > >
> > 
> > Anyone have any strong feelings on me doing this? CC'ing people with
> > known strong feelings on licenses.
> > 
> > I'm:
> > 
> > (1) Re-affirming that the legacy interface for async QMP is GPLv2
> > (like the classic QMP library is), because the interface and
> > docstrings here are largely copy-pasted from that library. It's
> > heavily remixed and modified, but it is undeniably derivative. (This
> > patch)
> 
> If this is going to live for any length of time it is desirable to
> relience the legacy code to GPLv2+ too.
> 
> I've not fully audited the git history, but what little I've looked
> at, the relicensing doesn't look too hard. The overwhealming majority
> of code was by @redhat.com authors, so we can cope with that fairly
> easily. There are a handful of other contributors still around in
> QEMU, and some of the patches are so trivial you couldn't claim
> copyright on them ie where adding 1 parameter to a method call is 
> literally the only possible way you could implmenent the change.
> It is never fun to contact everyone, but it looks viable.
> 
> > (2) Re-licensing async QMP as GPLv2+. (Next patch)
> > 
> > (3) Someday, eventually, adding a different sync interface that
> > doesn't re-mix this specific compatibility interface and will provide
> > better event-waiting primitives and so on. legacy.py will get dropped
> > at that point and the sub-project will become wholly GPLv2+. Until
> > then, it will be mixed.
> 
> Overall making it *all* GPLv2+ compat is going to be important if you
> want people to be comfortable using it. If it has a mix of GPLv2+
> and GPLv2-only code in the source tarball, then the overall combined
> work will have to be considered GPLv2-only and that will put people
> off using it. Even if they could theoreticallly restrict their usage
> to only the GPLv2+ parts, many won't get that far before moving on.

Actually I'll go furthuer and suggest that if we're going to do a
relicensing at all, and your goal is to encourage usage, then GPLv2+
is the wrong choice. Use LGPLv2+ if you want to facilitate usage, while
retaining a copyleft license.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



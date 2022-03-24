Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF894E60E1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 10:09:08 +0100 (CET)
Received: from localhost ([::1]:41180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJSt-000412-QE
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 05:09:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJKO-0007KW-7Y
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXJKG-00059E-QD
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648112411;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1HgT4RGf6UKcNJm19/DPNxiy00HujPuLpr3Q9AJjUso=;
 b=B8d3DiVvGFWHsz9ilLZSaY8lLcGZJKstvvNHrS+64rHIpSvps3O/De0I6nZN9mH8+Y2Efg
 R2kp/1nwgzprDiURHPbvYl7vyAWHYI56moq0D3oYp5PjGG8a9H1TiZT7/+mOQuFLGOnrdk
 tC37SreCm25kul4W+qnKPkNz6TgSk4Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-ssuGQ9DlN2mrYgpKTEi3jw-1; Thu, 24 Mar 2022 05:00:06 -0400
X-MC-Unique: ssuGQ9DlN2mrYgpKTEi3jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A89B228035F5;
 Thu, 24 Mar 2022 09:00:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E47E7ADA;
 Thu, 24 Mar 2022 08:59:54 +0000 (UTC)
Date: Thu, 24 Mar 2022 08:59:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
Message-ID: <YjwzCM3/wZ4S2fxf@redhat.com>
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
 <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 05:47:48PM -0400, John Snow wrote:
> On Mon, Mar 21, 2022 at 5:08 PM John Snow <jsnow@redhat.com> wrote:
> >
> > The legacy.py module is heavily based on the QMP module by Luiz
> > Capitulino (et al) which is licensed as explicit GPLv2-only. The async
> > QMP package is currently licensed similarly, but I intend to relicense
> > the async package to the more flexible GPLv2+.
> >
> > In preparation for that change, make the license on legacy.py explicit.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/aqmp/legacy.py | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> > index 46026e9fdc..f86cb29804 100644
> > --- a/python/qemu/aqmp/legacy.py
> > +++ b/python/qemu/aqmp/legacy.py
> > @@ -4,6 +4,17 @@
> >  This class pretends to be qemu.qmp.QEMUMonitorProtocol.
> >  """
> >
> > +#
> > +# Copyright (C) 2009-2022 Red Hat Inc.
> > +#
> > +# Authors:
> > +#  Luiz Capitulino <lcapitulino@redhat.com>
> > +#  John Snow <jsnow@redhat.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2.  See
> > +# the COPYING file in the top-level directory.
> > +#
> > +
> >  import asyncio
> >  from typing import (
> >      Any,
> > --
> > 2.34.1
> >
> 
> Anyone have any strong feelings on me doing this? CC'ing people with
> known strong feelings on licenses.
> 
> I'm:
> 
> (1) Re-affirming that the legacy interface for async QMP is GPLv2
> (like the classic QMP library is), because the interface and
> docstrings here are largely copy-pasted from that library. It's
> heavily remixed and modified, but it is undeniably derivative. (This
> patch)

If this is going to live for any length of time it is desirable to
relience the legacy code to GPLv2+ too.

I've not fully audited the git history, but what little I've looked
at, the relicensing doesn't look too hard. The overwhealming majority
of code was by @redhat.com authors, so we can cope with that fairly
easily. There are a handful of other contributors still around in
QEMU, and some of the patches are so trivial you couldn't claim
copyright on them ie where adding 1 parameter to a method call is 
literally the only possible way you could implmenent the change.
It is never fun to contact everyone, but it looks viable.

> (2) Re-licensing async QMP as GPLv2+. (Next patch)
> 
> (3) Someday, eventually, adding a different sync interface that
> doesn't re-mix this specific compatibility interface and will provide
> better event-waiting primitives and so on. legacy.py will get dropped
> at that point and the sub-project will become wholly GPLv2+. Until
> then, it will be mixed.

Overall making it *all* GPLv2+ compat is going to be important if you
want people to be comfortable using it. If it has a mix of GPLv2+
and GPLv2-only code in the source tarball, then the overall combined
work will have to be considered GPLv2-only and that will put people
off using it. Even if they could theoreticallly restrict their usage
to only the GPLv2+ parts, many won't get that far before moving on.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



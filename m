Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5DD40A911
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 10:22:29 +0200 (CEST)
Received: from localhost ([::1]:35140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ3i0-0001m3-Ui
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 04:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ3gh-0008MD-7F
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:21:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ3gb-0006As-LE
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631607660;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDT35quz9nszWkfZm4wxsDBm32uD2+Llx7qdHYfvl+o=;
 b=hnwE4Mu83cIG3zNdTWLyCKfROd+Mp9+fCLxyc6nkazKTE2Tp2RC5pYd/DB9Tr4ozaXmxPj
 Nz8hy8bdiBMtKzaqzj2o57QOURMMV17qaAkaTBJiHmeMLTHPAFPZoro4/IRAua/mNx6rBc
 9BTONyEWf5WbvGP9uso6xxjPFwGeWc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-459SCjRTOZC2_9Tx86zsOg-1; Tue, 14 Sep 2021 04:20:54 -0400
X-MC-Unique: 459SCjRTOZC2_9Tx86zsOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC6F1802929;
 Tue, 14 Sep 2021 08:20:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C13D860C4A;
 Tue, 14 Sep 2021 08:20:48 +0000 (UTC)
Date: Tue, 14 Sep 2021 09:20:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web RFC PATCH] Add Sponsors page
Message-ID: <YUBbXjND2sZlXY7Z@redhat.com>
References: <20210913182512.1021618-1-philmd@redhat.com>
 <d57973da-49ac-f231-1652-cf78769e884a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d57973da-49ac-f231-1652-cf78769e884a@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 07:41:47AM +0200, Thomas Huth wrote:
> On 13/09/2021 20.25, Philippe Mathieu-Daudé wrote:
> > Add a page listing QEMU sponsors and displaying their logos.
> > 
> > Logo sources:
> > - https://www.rackspace.com/es/newsroom/media-kit
> > - https://developer.arm.com/solutions/infrastructure/works-on-arm
> > - https://gitlab.com/fosshost/assets/logo
> > - https://www.linkedin.com/company/cip-united
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> > There are probably more, but I'm not aware of them.
> > 
> > Maybe we should list past sponsors, precising a year range?
> 
> I think we might have a hard time to compile a complete list, so I'd rather
> not start that job.
> 
> > ---
> >   _includes/nav.html      |   1 +
> >   sponsors.md             |  22 ++++++++++++++++++++++
> >   sponsors/cipunited.jpg  | Bin 0 -> 10607 bytes
> >   sponsors/fosshost.png   | Bin 0 -> 18251 bytes
> >   sponsors/rackspace.png  | Bin 0 -> 7363 bytes
> >   sponsors/worksonarm.png | Bin 0 -> 9965 bytes
> >   6 files changed, 23 insertions(+)
> >   create mode 100644 sponsors.md
> >   create mode 100644 sponsors/cipunited.jpg
> >   create mode 100644 sponsors/fosshost.png
> >   create mode 100644 sponsors/rackspace.png
> >   create mode 100644 sponsors/worksonarm.png
> > 
> > diff --git a/_includes/nav.html b/_includes/nav.html
> > index 73b39b3..49ad4cd 100644
> > --- a/_includes/nav.html
> > +++ b/_includes/nav.html
> > @@ -8,6 +8,7 @@
> >   			</li><li {% if current[1] == 'contribute' %}class='current'{% endif %}><a href="{{ relative_root }}/contribute">Contribute</a>
> >   			</li><li {% if current[1] == 'documentation' %}class='current'{% endif %}><a href="{{ relative_root }}/documentation">Docs</a>
> >   			</li><li><a href="https://wiki.qemu.org">Wiki</a>
> > +			</li><li {% if current[1] == 'sponsors' %}class='current'{% endif %}><a href="{{ relative_root }}/sponsors">Sponsors</a>
> 
> Not sure whether we need that link on every page (i.e. in the navigation
> menu)? Maybe it's enough to put the link somewhere on the home page?

Yes, we definitely don't want this in the top navbar as it is irrelevant
information to essentially every single visitor. We're only adding this
because one of the sponsors asked for it.

I'd say it can be linked in the footer, adjacent to the link to
the SFC.

Or maybe we just replace the SFC link with a link "About QEMU" and
on that page document that we're a member of the SFC and also
document official sponsors, and any other companies whose services
we rely on unofficially (eg the gitlab point below).

> >   			</li><li {% if current[1] == 'blog' %}class='current'{% endif %}><a href="{{ relative_root }}/blog">Blog</a></li>
> >   		</ul>
> >   	</nav>
> > diff --git a/sponsors.md b/sponsors.md
> > new file mode 100644
> > index 0000000..da1bf19
> > --- /dev/null
> > +++ b/sponsors.md
> > @@ -0,0 +1,22 @@
> > +---
> > +title: QEMU sponsors
> > +permalink: /sponsors/
> > +---
> > +
> > +QEMU has sponsors!
> > +
> > +The website is hosted by [Rackspace Technology](https://www.rackspace.com/).
> > +
> > +For continuous integration and testing, hardware is provided by:
> > +- Arm and Equinix Metal via the [Works on Arm program](https://www.worksonarm.com/)
> > +- [Fosshost](https://fosshost.org/)
> > +- [CIP United](https://www.cipunited.com/)
> > +
> > +
> > +![Rackspace Technology](rackspace.png)
> > +
> > +![Works on Arm](worksonarm.png)
> > +
> > +![Fosshost](fosshost.png)
> > +
> > +![CIP United](cipunited.jpg)
> 
> Some remarks:
> 
> 1) Could you please use the original URLs as source for the pictures instead
> of copying them over into our website? Some folks don't like it when their
> images are copied...

More importantly than that, do the trademark terms for each company
here permit us to actually use their logo on our website ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA838CADD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 18:20:16 +0200 (CEST)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7sl-0001lQ-NJ
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 12:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lk7rE-0008Iz-6s
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lk7rC-00081F-8d
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621613917;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGAyTqdEZHr6RRkrW/jGO2NRSXGkSYn5qDqE3v8g/+M=;
 b=D3AEygHio5/c5c6w0ISb3VSNo3cYXMt4/Ocwc7WYcId6cXFybz8aTcKOOiV0JmINCjO7uu
 cHRegc/LwSzWQbARrIJJlRmS9+dVeVqEByrnRbg0vCKk5tJp7+uG8qg5nUWPrIRfqyHQpo
 Ng27J4xjx2+sZB341Fcafuhcp9a3FSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-ToPbVRDNN6-w0AVdpLyYQw-1; Fri, 21 May 2021 12:18:31 -0400
X-MC-Unique: ToPbVRDNN6-w0AVdpLyYQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F363B1922964;
 Fri, 21 May 2021 16:18:29 +0000 (UTC)
Received: from redhat.com (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 983B160BD8;
 Fri, 21 May 2021 16:18:17 +0000 (UTC)
Date: Fri, 21 May 2021 17:18:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/2] Gitlab: Add "Feature Request" issue template.
Message-ID: <YKfdRqzTKt6QacLT@redhat.com>
References: <20210519213202.3979359-1-jsnow@redhat.com>
 <20210519213202.3979359-3-jsnow@redhat.com>
 <e79bc75c-93b7-6810-e07e-35c03c9c2983@redhat.com>
 <9a619043-aa44-caa7-b242-bc590008ebb4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9a619043-aa44-caa7-b242-bc590008ebb4@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 11:49:39AM -0400, John Snow wrote:
> On 5/20/21 2:52 AM, Thomas Huth wrote:
> > On 19/05/2021 23.32, John Snow wrote:
> > > Copied from Peter Krempa's libvirt template, feature.md.
> > > 
> > > CC: Peter Krempa <pkrempa@redhat.com>
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   .gitlab/issue_templates/feature_request.md | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > >   create mode 100644 .gitlab/issue_templates/feature_request.md
> > > 
> > > diff --git a/.gitlab/issue_templates/feature_request.md
> > > b/.gitlab/issue_templates/feature_request.md
> > > new file mode 100644
> > > index 00000000000..26901ff00c4
> > > --- /dev/null
> > > +++ b/.gitlab/issue_templates/feature_request.md
> > > @@ -0,0 +1,13 @@
> > > +## Goal
> > > +<!-- Describe the final result you want to achieve. Avoid design
> > > specifics. -->
> > 
> > Since some people apparently had wrong expectations when filing a
> > feature request in the past, it might be good to add some words about
> > what to expect. Maybe something like this (re-using some wording that
> > Daniel already added to some tickets in the past IIRC):
> > 
> >   Please note that the QEMU, like most open source projects, relies on
> > contributors who have motivation, skills and available time to work on
> > implementing particular features. Contributors naturally tend to focus
> > on features that result in the greatest benefit to their own use cases.
> > Thus the QEMU project doesn't implement new big features (like target
> > architectures or board models) on demand based on feature requests here;
> > they're a lot of work to do. Instead we simply code-review and
> > incorporate new big features as and when people decide to write them and
> > submit the patches. So please only submit small requests here. Thanks!
> > 
> > ?
> > 
> 
> OK, I may edit it just a little bit to appear a touch softer. A concern I
> have is that users may not really know the difference between a 'small' and
> a 'big' feature, necessarily.
> 
> Still, setting an expectation might help...

Yeah, I think we could be a little more positive in how we phrase it.
Perhaps ust focus on what filing a feature request does achieve.

The value is primarily about illustrating & recording a use case to
the project, and providing a place to discuss it and guage interest
from others.

There should be no expectation that anyone will work on it, but seeing
the feature request might pique someone's interest enough that they
want to work on it. I think probably the big vs small distinction
doesn't really matter much.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



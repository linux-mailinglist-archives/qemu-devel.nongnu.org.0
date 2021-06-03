Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B65239A3D8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:59:54 +0200 (CEST)
Received: from localhost ([::1]:35372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loop7-00058F-EV
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1loon3-0003bO-CF
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1loon0-0003xP-K1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622732261;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aDVqCEq0IO+tPaR611FUJ249p0B7Sy1HULgr5NwP5qQ=;
 b=aJycSZFvoonT/vXyQn4fiohWcZxr4zzBYxd+TT2PonI8BLTaCdA4QuDrv6ixptpZDKMFuk
 TtwvYXJCJw3Yiz9iisf/7mrsrCXw+R4k6g69OEQmkWfNjOAB3cIuWTVj9/7Oc1mM5iuk8/
 c3WddU5fRK7Y/t2mKy0VFHLypMXjz/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-WLqqJt9JMWG9yJ1hnfxl-w-1; Thu, 03 Jun 2021 10:57:37 -0400
X-MC-Unique: WLqqJt9JMWG9yJ1hnfxl-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B93D1013739;
 Thu,  3 Jun 2021 14:57:36 +0000 (UTC)
Received: from redhat.com (ovpn-112-34.ams2.redhat.com [10.36.112.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A21E85D719;
 Thu,  3 Jun 2021 14:57:25 +0000 (UTC)
Date: Thu, 3 Jun 2021 15:57:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 1/2] GitLab: Add "Bug" issue reporting template
Message-ID: <YLjt0kMifzmDZfm5@redhat.com>
References: <20210603001129.1319515-1-jsnow@redhat.com>
 <20210603001129.1319515-2-jsnow@redhat.com>
 <YLiWt21tQdFJo/4c@stefanha-x1.localdomain>
 <YLie2HCFd5asHyga@redhat.com>
 <f07af492-f535-8efb-0aa2-b6f6b7d0c0e0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f07af492-f535-8efb-0aa2-b6f6b7d0c0e0@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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

On Thu, Jun 03, 2021 at 10:44:13AM -0400, John Snow wrote:
> On 6/3/21 5:20 AM, Daniel P. Berrangé wrote:
> > On Thu, Jun 03, 2021 at 09:45:43AM +0100, Stefan Hajnoczi wrote:
> > > On Wed, Jun 02, 2021 at 08:11:28PM -0400, John Snow wrote:
> > > > Based loosely on libvirt's template, written by Peter Krempa.
> > > > 
> > > > CC: Peter Krempa <pkrempa@redhat.com>
> > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > ---
> > > >   .gitlab/issue_templates/bug.md | 63 ++++++++++++++++++++++++++++++++++
> > > >   1 file changed, 63 insertions(+)
> > > >   create mode 100644 .gitlab/issue_templates/bug.md
> > > > 
> > > > diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
> > > > new file mode 100644
> > > > index 00000000000..9445777252b
> > > > --- /dev/null
> > > > +++ b/.gitlab/issue_templates/bug.md
> > > > @@ -0,0 +1,63 @@
> > > > +<!--
> > > > +This is the upstream QEMU issue tracker.
> > > > +
> > > > +Before submitting a bug, please attempt to reproduce your problem using
> > > > +the latest development version of QEMU, built from source. See
> > > > +https://www.qemu.org/download/#source for instructions on how to do
> > > > +this.
> > > 
> > > It's likely that those unfamiliar with QEMU, especially non-developers,
> > > won't be able to do this:
> > > 
> > > The wording requires the reader to figure out that "latest development
> > > version of QEMU" is none of the big 6.0.0, 5.2.0, etc download links at
> > > the top of the page but the small text "The latest development happens
> > > on the master branch" sentence below the fold. Then they need to look
> > > around the page to find out how to download the master branch and build
> > > from source.
> > > 
> > > I suggest referring directly to the build instructions instead of
> > > requiring the reader to make several connections in order to do what
> > > we're (indirectly) asking:
> > > 
> > >    Before submitting a bug, please attempt to reproduce the problem with
> > >    the latest qemu.git master built from source. See the "To download and
> > >    build QEMU from git" section at https://www.qemu.org/download/#source
> > >    for instructions.
> > 
> > I do wonder if this will discourage people from submitting  a bug report,
> > if they're unable to actually do this. We have a fairly frequent stream
> > of users who seek help trying to build QEMU - usually they fail to even
> > get the right depedancies installed.
> > 
> > Perhaps word it so it doesn't come across as such a strict sounding
> > requirement ? I'm not entirely happy with the below text, but something
> > more forgiving like:
> > 
> >     If you are able to, it will facilitate QEMU bug triage if an attempt
> >     is made to reproduce the problem with the latest qemu.git master
> >     built from source. ...etc..
> > 
> > Regards,
> > Daniel
> > 
> 
> How about:
> 
> 
> If you are able to, it will greatly facilitate bug triage if you attempt
> to reproduce the problem with the latest qemu.git master built from
> source. See https://www.qemu.org/download/#source for instructions on
> how to do this.
> 
> QEMU generally supports the last two releases advertised on
> https://www.qemu.org/. Problems with distro-packaged versions of QEMU
> older than this should be reported to the distribution instead.
> 
> 
> - I put an emphasis on facilitate (It's in YOUR interest to do this.)
> - I rephrased "if an attempt is made to" to "if you attempt to", a less
>   passive (and shorter) sentence.

Fine with me

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



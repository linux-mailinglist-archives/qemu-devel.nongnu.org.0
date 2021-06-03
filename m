Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660B399DA0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:21:54 +0200 (CEST)
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojY1-0001kN-F7
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lojWx-0000Cp-HC
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:20:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lojWs-0003vS-Mv
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622712041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5Cm8fOe4fOCjadE0eAmiCVczcvJYl1h1bnP1CMlvczo=;
 b=eO6FY8y4uw12jBYP7A0dkoMiMNK6J0CRFHWet0R0/SDRgcVyNbqs9mTUVB5cK1QbljVeQ6
 TnrVNh+X4CHj2AeK1HliRYlNhkOwY3rdhoJog3a6qDh1DHysiajyF4gcDBsm3fONjPo5uN
 JBpMhQuCZe27FIVjsE6MuempIo1IT1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-Y-Mh4fxRNYitpzOwranfmA-1; Thu, 03 Jun 2021 05:20:36 -0400
X-MC-Unique: Y-Mh4fxRNYitpzOwranfmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A741D107ACE3;
 Thu,  3 Jun 2021 09:20:35 +0000 (UTC)
Received: from redhat.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0177D7012D;
 Thu,  3 Jun 2021 09:20:27 +0000 (UTC)
Date: Thu, 3 Jun 2021 10:20:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 1/2] GitLab: Add "Bug" issue reporting template
Message-ID: <YLie2HCFd5asHyga@redhat.com>
References: <20210603001129.1319515-1-jsnow@redhat.com>
 <20210603001129.1319515-2-jsnow@redhat.com>
 <YLiWt21tQdFJo/4c@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YLiWt21tQdFJo/4c@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 Peter Krempa <pkrempa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 09:45:43AM +0100, Stefan Hajnoczi wrote:
> On Wed, Jun 02, 2021 at 08:11:28PM -0400, John Snow wrote:
> > Based loosely on libvirt's template, written by Peter Krempa.
> > 
> > CC: Peter Krempa <pkrempa@redhat.com>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  .gitlab/issue_templates/bug.md | 63 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >  create mode 100644 .gitlab/issue_templates/bug.md
> > 
> > diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
> > new file mode 100644
> > index 00000000000..9445777252b
> > --- /dev/null
> > +++ b/.gitlab/issue_templates/bug.md
> > @@ -0,0 +1,63 @@
> > +<!--
> > +This is the upstream QEMU issue tracker.
> > +
> > +Before submitting a bug, please attempt to reproduce your problem using
> > +the latest development version of QEMU, built from source. See
> > +https://www.qemu.org/download/#source for instructions on how to do
> > +this.
> 
> It's likely that those unfamiliar with QEMU, especially non-developers,
> won't be able to do this:
> 
> The wording requires the reader to figure out that "latest development
> version of QEMU" is none of the big 6.0.0, 5.2.0, etc download links at
> the top of the page but the small text "The latest development happens
> on the master branch" sentence below the fold. Then they need to look
> around the page to find out how to download the master branch and build
> from source.
> 
> I suggest referring directly to the build instructions instead of
> requiring the reader to make several connections in order to do what
> we're (indirectly) asking:
> 
>   Before submitting a bug, please attempt to reproduce the problem with
>   the latest qemu.git master built from source. See the "To download and
>   build QEMU from git" section at https://www.qemu.org/download/#source
>   for instructions.

I do wonder if this will discourage people from submitting  a bug report,
if they're unable to actually do this. We have a fairly frequent stream
of users who seek help trying to build QEMU - usually they fail to even
get the right depedancies installed.

Perhaps word it so it doesn't come across as such a strict sounding
requirement ? I'm not entirely happy with the below text, but something
more forgiving like:

   If you are able to, it will facilitate QEMU bug triage if an attempt
   is made to reproduce the problem with the latest qemu.git master
   built from source. ...etc..

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B54837C4DD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:33:09 +0200 (CEST)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqrE-0005AY-GS
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgqo2-0002eo-6v
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgqny-0007U1-ES
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620833385;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WsnvTC5U8+wybhxC+btUhAhg4gmy0sFxVAWBTKwvMqg=;
 b=fZD7FsI561mPjEvMKrNUBM48exYHpz55PYOEDvONd/7f2UIb3I1eOfmW3RuVaFQ3/Rf2KX
 zUvvykGGpvdXWVohRzA+dQwxFIHY75dg+Fu/hUdxk7vPQn1BbVv9bUxG45QZCab7PHihi/
 fyrzBVypNpWSyBIzlsDXE5sVD08HSdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-o5XFSlFKMXqM8YIDGw0-yQ-1; Wed, 12 May 2021 11:29:36 -0400
X-MC-Unique: o5XFSlFKMXqM8YIDGw0-yQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E2EA1083E9B;
 Wed, 12 May 2021 15:29:35 +0000 (UTC)
Received: from redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 289A35D9C0;
 Wed, 12 May 2021 15:29:28 +0000 (UTC)
Date: Wed, 12 May 2021 16:29:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: non-x86 runners in the Gitlab-CI (was: Re: [PATCH 12/12]
 configure: bump min required CLang to 7.0.0 / XCode 10.2)
Message-ID: <YJv0Vjrz1kvTmtID@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
 <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
 <5b582933-6004-3549-b5fe-208c182d5efe@redhat.com>
 <CAKJDGDZUScyzVzhwpG+d6di3Wa0+Txk0SONVXiC++dukzNeTew@mail.gmail.com>
 <93b24ba1-0898-250f-0f8c-87bc08934220@redhat.com>
 <YJvfcLiItG4xbnvE@redhat.com>
 <CAP+75-UesRXMwgvywUxdT8FsP0zW5xfucHFk0DyqHcSu+iB6Sw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP+75-UesRXMwgvywUxdT8FsP0zW5xfucHFk0DyqHcSu+iB6Sw@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ademar Reis Jr <areis@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 04:51:25PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> On Wed, May 12, 2021 at 4:00 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > On Wed, May 12, 2021 at 03:55:59PM +0200, Thomas Huth wrote:
> > > On 12/05/2021 15.47, Willian Rampazzo wrote:
> 
> > > > I don't know if you saw this:
> > > > https://docs.travis-ci.com/user/billing-overview/#partner-queue-solution.
> > > >
> > > > tl;dr, Travis now has support from partners to run non-x86 arch. It is
> > > > always good to have a plan B, like qemu own CI runners, but, at least,
> > > > with these non-x86 arch available on Travis, we will have some time to
> > > > breathe.
> 
> >   "The build job under Partner Queue Solution costs 0 credits per
> >    started minute. At the moment of introducing Partner Queue Solution
> >    active accounts on the Usage based Plans, including the Free Plan,
> >    with a balance of zero or fewer credits, balance is updated to
> >    hold 1 credit. Thus everybody can use Partner Queues without
> >    requesting Travis CI support to grant additional credits. If you
> >    run into a negative account balance after that, you still need to
> >    file an additional request."
> >
> > IOW, anyone ought to be able to use non-x86 jobs, bt if you accidentally
> > run an x86 job and get into 0 (or negative) credits, then you won't even
> > be able to use non-x86 jobs.
> 
> You once showed a script on GitLab triggering Travis-CI jobs and reporting
> the success/failure on GitLab (or was it Cirrus-CI?). Is it possible to use
> something similar with QEMU to integrate Travis-CI jobs with GitLab
> pipeline?

If you login to Travis using GitLab  SSO, instead of GitHub SSO,
then it will magically create an extra stage in your GitLab pipeline
and report Travis results there. I mentioned this here:

  https://wiki.qemu.org/Testing/CI/Integrated#Travis_CI_setup

though I never tried it out in anger - it was more a case of me
noticing it happening by accident.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



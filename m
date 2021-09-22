Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56781414A85
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:27:14 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2HI-0001su-MW
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT29e-0002WN-5g
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT29X-0008TC-B5
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632316750;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GHur5CKS6bsOzS2nRhoitxU67ZwbyegVKtgB0VlUkt8=;
 b=ROdSNvVJzBb/Ynd9ygMVQCWKSf0A2BmSy4ICKKQWCrE/KzmHjtH/oQlAZsJO94r5nvoZ60
 gCCvvE76WOP+HTs+dNOkc3KjOyyJvPAVEHmBlwq3dh3iSzbcV/V004ZUMtgukmEW7uq6oP
 miuWbYLPf2gAFmo42kwVeDvo9Y3DaBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-DBZgGR_MMOWspCHwvD-FqQ-1; Wed, 22 Sep 2021 09:18:58 -0400
X-MC-Unique: DBZgGR_MMOWspCHwvD-FqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29CBE1922960;
 Wed, 22 Sep 2021 13:18:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18B6D189C4;
 Wed, 22 Sep 2021 13:18:54 +0000 (UTC)
Date: Wed, 22 Sep 2021 14:18:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/3] docs: rSTify the "TrivialPatches" wiki
Message-ID: <YUstPKbr4JWJdycY@redhat.com>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <20210922121054.1458051-3-kchamart@redhat.com>
 <09166fcf-7170-e466-0221-958703146fc5@amsat.org>
MIME-Version: 1.0
In-Reply-To: <09166fcf-7170-e466-0221-958703146fc5@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 03:05:02PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Kashyap,
> 
> On 9/22/21 14:10, Kashyap Chamarthy wrote:
> > The original wiki is here[1].  I converted by copying the wiki source
> > into a .wiki file and convert to rST using `pandoc`:
> > 
> >          $ pandoc -f Mediawiki -t rst trivial-patches.wiki -o trivial-patches.rst
> > 
> > [1] https://wiki.qemu.org/Contribute/TrivialPatches
> > 
> > Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> > ---
> >   docs/devel/trivial-patches.rst | 53 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 53 insertions(+)
> >   create mode 100644 docs/devel/trivial-patches.rst
> > 
> > diff --git a/docs/devel/trivial-patches.rst b/docs/devel/trivial-patches.rst
> > new file mode 100644
> > index 0000000000..4ad0d25b9d
> > --- /dev/null
> > +++ b/docs/devel/trivial-patches.rst
> > @@ -0,0 +1,53 @@
> > +===============
> > +Trivial Patches
> > +===============
> > +
> > +Overview
> > +========
> > +
> > +Trivial patches that change just a few lines of code sometimes languish
> > +on the mailing list even though they require only a small amount of
> > +review. This is often the case for patches that do not fall under an
> > +actively maintained subsystem and therefore fall through the cracks.
> > +
> > +The trivial patches team take on the task of reviewing and building pull
> > +requests for patches that:
> > +
> > +- Do not fall under an actively maintained subsystem.
> > +- Are single patches or short series (max 2-4 patches).
> > +- Only touch a few lines of code.
> > +
> > +**You should hint that your patch is a candidate by CCing
> > +qemu-trivial@nongnu.org.**
> > +
> > +Repositories
> > +============
> > +
> > +Since the trivial patch team rotates maintainership there is only one
> > +active repository at a time:
> > +
> > +- git://git.corpit.ru/qemu.git trivial-patches - `browse <http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches>`__
> > +- git://github.com/vivier/qemu.git trivial-patches - `browse <https://github.com/vivier/qemu/tree/trivial-patches>`__
> > +
> > +Workflow
> > +========
> > +
> > +The trivial patches team rotates the duty of collecting trivial patches
> > +amongst its members. A team member's job is to:
> > +
> > +1. Identify trivial patches on the development mailing list.
> > +2. Review trivial patches, merge them into a git tree, and reply to state
> > +   that the patch is queued.
> > +3. Send pull requests to the development mailing list once a week.
> > +
> > +A single team member can be on duty as long as they like. The suggested
> > +time is 1 week before handing off to the next member.
> > +
> > +Team
> > +====
> > +
> > +If you would like to join the trivial patches team, contact Michael
> > +Tokarev. The current team includes:
> > +
> > +- Michael Tokarev
> > +- `Laurent Vivier <mailto:laurent@vivier.eu>`__
> 
> I asked Michael if he could send a qemu-trivial@ pullreq last month
> when Laurent was on PTO and he said he hasn't done it in years.
> 
> Indeed:
> 
> $ git log --committer='Michael Tokarev'
> commit 9a232487aab8a7640ff8853d7d8d7c27106b44f8
> Date:   Fri Apr 13 18:45:45 2018 +0200
> 
> So I think you are trying to commit obsolete information.

That's wikis for you.... pages of obsolete information. Bad info
is more likely to be noticed & updated if we have it in the qemu.git
repo where most developers work !


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



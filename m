Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055837BF3F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:05:08 +0200 (CEST)
Received: from localhost ([::1]:60978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpU3-00071h-5a
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgpPk-0000gw-Mf
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgpPg-0003WN-K5
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620828035;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPwhuaNggaTzon4KsBMDwdhsCZK6kIiCFrTmeQ8iIEE=;
 b=CmDNnW3hvCPKItzpMlidH137UJmN6V9c+5UfuvqTIFdNYO4OObejR3TQVKTV4DhN07JXpE
 VAJE13ah9rjgC005tKUAFQPJiLccH5CeXbKKaB3e3mVwG0wLGzSiItdEN+HFj3vC7XUo2D
 my7kyRPmDFjIsd6+FHfgyA3qBE70Wjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-vlORnuInO4G8nWbFKeeCnA-1; Wed, 12 May 2021 10:00:27 -0400
X-MC-Unique: vlORnuInO4G8nWbFKeeCnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B31C4195D563;
 Wed, 12 May 2021 14:00:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7E95D9E3;
 Wed, 12 May 2021 14:00:19 +0000 (UTC)
Date: Wed, 12 May 2021 15:00:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: non-x86 runners in the Gitlab-CI (was: Re: [PATCH 12/12]
 configure: bump min required CLang to 7.0.0 / XCode 10.2)
Message-ID: <YJvfcLiItG4xbnvE@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
 <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
 <5b582933-6004-3549-b5fe-208c182d5efe@redhat.com>
 <CAKJDGDZUScyzVzhwpG+d6di3Wa0+Txk0SONVXiC++dukzNeTew@mail.gmail.com>
 <93b24ba1-0898-250f-0f8c-87bc08934220@redhat.com>
MIME-Version: 1.0
In-Reply-To: <93b24ba1-0898-250f-0f8c-87bc08934220@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_PRE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ademar Reis Jr <areis@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 03:55:59PM +0200, Thomas Huth wrote:
> On 12/05/2021 15.47, Willian Rampazzo wrote:
> > Hi Thomas,
> > 
> > On Wed, May 12, 2021 at 8:54 AM Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > On 12/05/2021 13.44, Philippe Mathieu-Daudé wrote:
> > > > On 5/11/21 3:26 PM, Daniel P. Berrangé wrote:
> > > > > Several distros have been dropped since the last time we bumped the
> > > > > minimum required CLang version.
> > > > > 
> > > > > Per repology, currently shipping versions are:
> > > > > 
> > > > >                RHEL-8: 10.0.1
> > > > >        Debian Stretch: 7.0.1
> > > > >         Debian Buster: 7.0.1
> > > > >    openSUSE Leap 15.2: 9.0.1
> > > > >      Ubuntu LTS 18.04: 10.0.0
> > > > >      Ubuntu LTS 20.04: 11.0.0
> > > > >            FreeBSD 12: 8.0.1
> > > > >             Fedora 33: 11.0.0
> > > > >             Fedora 34: 11.1.0
> > > > > 
> > > > > With this list Debian Stretch is the constraint at 7.0.1
> > > > > 
> > > > > An LLVM version of 7.0.1 corresponds to macOS XCode version of 10.2
> > > > > which dates from March 2019.
> > > > 
> > > > But we still rely on Travis-CI (Ubuntu Bionic 18.04 LTS)
> > > > for non-x86 targets until we have figured out who is willing
> > > > to share/maintain such non-x86 native runners on Gitlab.
> > > 
> > >    Hi Cleber,
> > > 
> > > by the way, what's the status of your patch series to get the dedicated CI
> > > machines (s390x, aarch64, ...) running in our Gitlab-CI? AFAIK the last
> > > iteration of your patches has been weeks ago, so I wonder whether you could
> > > finally send a new version with the requested fixes included? ... this topic
> > > slowly gets more and more urgent now that our Travis-CI is in process of
> > > dying...
> > 
> > I don't know if you saw this:
> > https://docs.travis-ci.com/user/billing-overview/#partner-queue-solution.
> > 
> > tl;dr, Travis now has support from partners to run non-x86 arch. It is
> > always good to have a plan B, like qemu own CI runners, but, at least,
> > with these non-x86 arch available on Travis, we will have some time to
> > breathe.
> 
> Uh, that's what we're already using in our travis.yml ... but I guess you've
> rather missed:
> 
>  https://blog.travis-ci.com/2021-05-07-orgshutdown
> 
> and on travis-ci.com, the CI minutes are not for free anymore. At least not
> for the QEMU project. Or do you know of a sponsor who is going to pay the CI
> minutes for us there?

The link above explicitly says the non-x86 jobs cost 0 credits:


  "The build job under Partner Queue Solution costs 0 credits per 
   started minute. At the moment of introducing Partner Queue Solution
   active accounts on the Usage based Plans, including the Free Plan,
   with a balance of zero or fewer credits, balance is updated to 
   hold 1 credit. Thus everybody can use Partner Queues without 
   requesting Travis CI support to grant additional credits. If you
   run into a negative account balance after that, you still need to
   file an additional request."

IOW, anyone ought to be able to use non-x86 jobs, bt if you accidentally
run an x86 job and get into 0 (or negative) credits, then you won't even
be able to use non-x86 jobs.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



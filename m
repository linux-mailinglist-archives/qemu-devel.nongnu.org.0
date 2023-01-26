Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2A67CE26
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:32:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3HN-0005Ox-1N; Thu, 26 Jan 2023 09:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL3HI-0005Op-HJ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL3HG-0004Rs-K0
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674743457;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+cWAAW7TkenG4PdfC0YY+XcLOsqtVdU25p6FEkWiyw=;
 b=UuK5rJC+rU7CiJWBXopJh/UvbgnorWvl/2liCYUZ7bZoTtDSgT3FCHV+nwZvHPQjQx8gbA
 qsXIsZgshyxPVcmOogK5Dx7SPRY6DlbwQBOW4OybP/TxFlvxFMLQEdafQlWAd9I+t9bL0m
 GzFJ0IV5Xoy1glch/idLw31mCZYXBMI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-QvwVO1UwPZSWkYv6fdJ73A-1; Thu, 26 Jan 2023 09:30:55 -0500
X-MC-Unique: QvwVO1UwPZSWkYv6fdJ73A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C039985C6E3;
 Thu, 26 Jan 2023 14:30:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BACD040C2064;
 Thu, 26 Jan 2023 14:30:53 +0000 (UTC)
Date: Thu, 26 Jan 2023 14:30:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eldon Stegall <eldon-qemu@eldondev.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: no more pullreq processing til February
Message-ID: <Y9KOm61iNRlpq/qU@redhat.com>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <Y9KFp06pp/qohgV1@invalid> <Y9KLr691LwO8WUgI@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9KLr691LwO8WUgI@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 02:18:23PM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 26, 2023 at 01:52:39PM +0000, Eldon Stegall wrote:
> > On Thu, Jan 26, 2023 at 01:22:32PM +0000, Peter Maydell wrote:
> > > Hi; we've run out of gitlab CI pipeline minutes for this month.
> > > This leaves us the choice of:
> > >  (a) don't process any more pullreqs til we get more minutes in Feb
> > >  (b) merge pullreqs blindly without CI testing
> > >  (c) buy more minutes
> > > 
> > > For the moment I propose to take option (a). My mail filter will
> > > continue to track pullreqs that get sent to the list, but I won't
> > > do anything with them.
> > > 
> > > If anybody has a better suggestion feel free :-)
> > 
> > Would it be possible if (d) were to run self-hosted instances of the
> > runner? I am not sure how gitlab pricing works, but I believe on github
> > self-hosted runners are free.
> > 
> > I have several baremetal machines colocated that I could dedicate to
> > execute these runs, dual processor xeons with a couple hundred gigs of
> > RAM. I would need approx 48 hours notice to initially provision the
> > machines. I would be happy to provide root credentials and work out IPMI
> > access if that becomes necessary.
> 
> We do currently have some private runners registered against the
> /qemu-project namespace, so we can do some non-x86 native testing.
> 
> The challenge is the integration and configuration. The GitLab CI
> YAML config rules need to be written such that specific jobs  get
> targetted for the right private runners, instead of the shared
> runners, by including the 'tags' element in the job config, and
> some 'rules' logic.

Scratch that, it is actually possible to configure private runners
to pick up un-tagged jobs

https://docs.gitlab.com/ee/ci/runners/configure_runners.html#runner-is-allowed-to-run-untagged-jobs

i'm not sure what the prioritization  is between shared and private
runners when using untagged jobs though. If a share runners will
pick up untagged jobs and then error them due to lack of CI credits
that might prevent our private runner picking up the untagged jobs.
We could turn off shared runners entirely potentially.

We would need the private runner to be configured with the docker
engine, so it can handle our container based approach.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



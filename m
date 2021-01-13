Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF862F4F34
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:51:52 +0100 (CET)
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziR5-0003ZO-4R
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kziP2-0001xU-Ho
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:49:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kziP0-0007ec-EH
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610552981;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJz2Jjk4YDf++IUGRHZh9UcISr57fPwYQYa/LGa4l9k=;
 b=giAHbJ/vPofIAPxzh5R75Ktp8NRGPjsFYDIFRqSOK0vgKXOEwzH7+Lyxxk8Pv8SIie5WQ0
 iECLFBR9bnxLaTViWQk0G48E4hTizV5WtNj1bJvDeSuvOgxUc4hPNc0hBJjgsq3ar2SVHh
 dAim1hlUzUMakrRBlM8npFJK7khf8JI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-f9oFY3KBOhqm_hEKfhVEpQ-1; Wed, 13 Jan 2021 10:49:37 -0500
X-MC-Unique: f9oFY3KBOhqm_hEKfhVEpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A31E08066E1;
 Wed, 13 Jan 2021 15:49:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-107.ams2.redhat.com [10.36.115.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BCBF5D71D;
 Wed, 13 Jan 2021 15:49:28 +0000 (UTC)
Date: Wed, 13 Jan 2021 15:49:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 9/9] gitlab: move docs and tools build across from
 Travis
Message-ID: <20210113154926.GG1568240@redhat.com>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
 <20210113151408.27939-10-alex.bennee@linaro.org>
 <20210113153728.GF1568240@redhat.com>
 <CAFEAcA_VJV_rUweM_mwd1AXNWHYQKYZ0uQbwAe+xZYJvozjrmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_VJV_rUweM_mwd1AXNWHYQKYZ0uQbwAe+xZYJvozjrmA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 03:46:17PM +0000, Peter Maydell wrote:
> On Wed, 13 Jan 2021 at 15:40, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Jan 13, 2021 at 03:14:08PM +0000, Alex Bennée wrote:
> > > While we are at it we might as well check the tag generation. For
> > > bonus points we run GNU globals htags into the public pages directory
> > > for publishing with the auto generated pages.
> 
> > > +build-tools-and-docs-debian:
> > > +  <<: *native_build_job_definition
> > > +  variables:
> > > +    IMAGE: debian-amd64
> > > +    MAKE_CHECK_ARGS: ctags gtags TAGS cscope
> > > +    CONFIGURE_ARGS: --enable-docs --enable-tools
> > > +  artifacts:
> > > +    expire_in: 2 days
> > > +    paths:
> > > +      - build
> >
> > Do we actually need this job at all ?
> >
> > Assuming the depenedancies are in the dockerfile, then all the
> > build jobs will be testing docs and tools already, as meson will
> > auto enable it.
> 
> What I would like to see is a set of "just build the docs"
> CI jobs which test all our supported Sphinx versions
> (eg 1.6, 2.0, 2.4, 3.0, 3.2), since we've found that Sphinx
> is not great about consistency of accepted syntax from
> version to version. (Somebody sent a patch for this ages
> ago, but it was for a Travis CI job IIRC, which we're trying
> to move away from.)

We only care about the Sphinx versions that exist in the OS distros that
we're targetting as build platforms. So as long as we have build jobs for
all the distros we have dockerfiles for, then we're covering all the
sphinx versions that matter.  IOW, I think our gitlab jobs are already
covering a good variety of sphinx versions. There are possibly gaps because
our dockerfiles have a horribly inconsistent set of RPMs listed. This
inconsistency is addressed in this patch series of mine to autogenerate
the dockerfiles:

 https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00189.html

which will ensure all our dockerfiles have the deps needed to satisfy
all features in QEMU.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



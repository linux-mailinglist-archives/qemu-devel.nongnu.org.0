Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F42DC3FF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:23:35 +0100 (CET)
Received: from localhost ([::1]:48224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZaP-00056f-W7
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpZUL-0007GU-ON
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:17:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpZUI-00062N-6J
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608135432;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpHVLgkBng9PNl0tDoWYNIYCMOznGDfwcBeFGZIYvBw=;
 b=f8dikrOUOT6yq92osyD7lq5GCz1Zh3DE0vss5ODDk6mVSGDJk6O6Jl1x1RR/UOzfin4di3
 kl6813Eu1zkjM2WOqg9r44h4EtmThvHIUN7X2bLXLOYsSV7cw+ool+tIlQPFhEZa6zWjae
 Z4ii1e7zEMbAhveTwsPWjF+/BcaF+xI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-jGY1FK-0Npq_EXQkSj7o5A-1; Wed, 16 Dec 2020 11:17:02 -0500
X-MC-Unique: jGY1FK-0Npq_EXQkSj7o5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 873BC8144E2;
 Wed, 16 Dec 2020 16:17:01 +0000 (UTC)
Received: from redhat.com (ovpn-115-177.ams2.redhat.com [10.36.115.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2374D5D9C0;
 Wed, 16 Dec 2020 16:16:59 +0000 (UTC)
Date: Wed, 16 Dec 2020 16:16:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests: update for rename of CentOS8 PowerTools repo
Message-ID: <20201216161657.GL189795@redhat.com>
References: <20201216141653.213980-1-berrange@redhat.com>
 <CAFEAcA_QnRHEefC5sjDRc4V6GvxTn96wDf-b7gyg5wSRoJ7nmQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_QnRHEefC5sjDRc4V6GvxTn96wDf-b7gyg5wSRoJ7nmQ@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 16, 2020 at 04:10:56PM +0000, Peter Maydell wrote:
> On Wed, 16 Dec 2020 at 14:21, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > This was intentionally renamed recently to be all lowercase:
> >
> > https://bugs.centos.org/view.php?id=17920
> > https://wiki.centos.org/Manuals/ReleaseNotes/CentOS8.2011#Yum_repo_file_and_repoid_changes
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >
> > This needs to be merged asap, as CI will break for anyone whose branch
> > triggers a rebuild of the centos container image.
> >
> > eg current broken git master:
> >
> >   https://gitlab.com/berrange/qemu/-/jobs/915852165
> >
> > vs with this fix
> >
> >   https://gitlab.com/berrange/qemu/-/jobs/915862731
> >
> >  tests/docker/dockerfiles/centos8.docker | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> > index 54bc6d54cd..06b67962fd 100644
> > --- a/tests/docker/dockerfiles/centos8.docker
> > +++ b/tests/docker/dockerfiles/centos8.docker
> > @@ -31,6 +31,6 @@ ENV PACKAGES \
> >      zlib-devel
> >
> >  RUN dnf install -y dnf-plugins-core && \
> > -  dnf config-manager --set-enabled PowerTools && \
> > +  dnf config-manager --set-enabled powertools && \
> >    dnf install -y $PACKAGES
> >  RUN rpm -q $PACKAGES | sort > /packages.txt
> 
> I tried a test merge of this but it fails in Gitlab CI:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/916041167
> 
> #6 7.706 Error: No matching repo to modify: powertools.
> #6 ERROR: executor failed running [/bin/sh -c dnf install -y
> dnf-plugins-core && dnf config-manager --set-enabled powertools && dnf
> install -y $PACKAGES]: exit code: 1


#4 [1/4] FROM docker.io/library/centos:8.1.1911@sha256:fe8d824220415eed5477...
#4 DONE 0.0s

#5 [2/4] RUN dnf -y update
#5 CACHED


Looks like in the main repo, it is using cached container layer for
the "dnf -y update" command, and so not pulling in the new centos-release
package.

In forks where the cache is not valid, it'll really run the "dnf update"
command and see the failure.

I think if you go to

  https://gitlab.com/qemu-project/qemu/container_registry

and delete the currently cached centos8 image, then all subsequent runs
will fail until this patch is merged.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



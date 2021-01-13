Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD62F500E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:35:13 +0100 (CET)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzj72-0004WE-Nw
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzj4a-0003Kk-Ou
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:32:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzj4X-0002mQ-Nw
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610555557;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDW3uW7B615nCym6YE9S1dJbgpBKl2PAnVqIq8vTGco=;
 b=EPdBbDqFFa6yAOWpQderSOA6Ozd7ax2QjKN6w7DrTMrOYPUgIUPV05jJ67vOQSuvyQt5x+
 Np7czGn3LnBnNFEdo4OK6dUdOxj+rgaXZU9LvQ+mc8WHBIk455BPhuAldLw4ACiOLD/9AV
 UJpHXmoemEM8z24fbvIsniJPd8CYvTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-rdR2Vlg9MVmrGR2TN6L5Dg-1; Wed, 13 Jan 2021 11:32:32 -0500
X-MC-Unique: rdR2Vlg9MVmrGR2TN6L5Dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2ECC100C678;
 Wed, 13 Jan 2021 16:32:31 +0000 (UTC)
Received: from redhat.com (ovpn-115-107.ams2.redhat.com [10.36.115.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72ADC5D9EF;
 Wed, 13 Jan 2021 16:32:27 +0000 (UTC)
Date: Wed, 13 Jan 2021 16:32:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 9/9] gitlab: move docs and tools build across from
 Travis
Message-ID: <20210113163224.GH1568240@redhat.com>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
 <20210113151408.27939-10-alex.bennee@linaro.org>
 <20210113153728.GF1568240@redhat.com> <8735z4n6kz.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8735z4n6kz.fsf@linaro.org>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 04:27:54PM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Wed, Jan 13, 2021 at 03:14:08PM +0000, Alex Bennée wrote:
> >> While we are at it we might as well check the tag generation. For
> >> bonus points we run GNU globals htags into the public pages directory
> >> for publishing with the auto generated pages.
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> ---
> >>  .gitlab-ci.yml | 22 ++++++++++++++++------
> >>  .travis.yml    | 16 ----------------
> >>  2 files changed, 16 insertions(+), 22 deletions(-)
> >> 
> >> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> >> index 4532f1718a..c07064a4f7 100644
> >> --- a/.gitlab-ci.yml
> >> +++ b/.gitlab-ci.yml
> >> @@ -79,7 +79,6 @@ build-system-ubuntu:
> >>      TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
> >>        moxie-softmmu microblazeel-softmmu mips64el-softmmu
> >>      MAKE_CHECK_ARGS: check-build
> >> -    CONFIGURE_ARGS: --enable-docs
> >>    artifacts:
> >>      expire_in: 2 days
> >>      paths:
> >> @@ -111,7 +110,6 @@ build-system-debian:
> >>      TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
> >>        riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
> >>      MAKE_CHECK_ARGS: check-build
> >> -    CONFIGURE_ARGS: --enable-docs
> >>    artifacts:
> >>      expire_in: 2 days
> >>      paths:
> >> @@ -126,6 +124,17 @@ check-system-debian:
> >>      IMAGE: debian-amd64
> >>      MAKE_CHECK_ARGS: check
> >>  
> >> +build-tools-and-docs-debian:
> >> +  <<: *native_build_job_definition
> >> +  variables:
> >> +    IMAGE: debian-amd64
> >> +    MAKE_CHECK_ARGS: ctags gtags TAGS cscope
> >> +    CONFIGURE_ARGS: --enable-docs --enable-tools
> >> +  artifacts:
> >> +    expire_in: 2 days
> >> +    paths:
> >> +      - build
> >
> > Do we actually need this job at all ?
> >
> > Assuming the depenedancies are in the dockerfile, then all the
> > build jobs will be testing docs and tools already, as meson will
> > auto enable it.
> 
> I pondered making an explicit --disable-docs to save some run time but
> really this is providing a golden build of the docs which can tehn be
> deployed bypages.

Oh right I missed that subtle detail. I saw the separate pages job
but didn't realize this was a pre-req of it.

So with that in mind no objection.

> It also ensure the tag generation works for the various tag outputs -
> the GNU global output being used to also publish a HTML navigable
> version of the source tree.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



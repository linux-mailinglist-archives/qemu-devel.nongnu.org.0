Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADEB30F032
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:13:14 +0100 (CET)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bdR-0002S4-Mv
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7bRB-0004Eq-IN
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:00:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7bQy-0000qY-G4
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612432819;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kMYK4+SI4YEuqtoT8f59PIAti8w/i9T3p9qxNeagpo=;
 b=KfvZVUgKeH5nn83MxA5WFAini1yeEbpc7A1f/SMqXDCkDv+zQzyiAkJ8a4xT7bqtf3OrF8
 tKfebyKX1u5i8jL4hGA7S1rD8qpIBjJ77cLrxeMIVif4s3Z4r/Lv8Kex9Ll/7XqkphOqw0
 QfZYrZw1yrWJrld8c7riYM6rzTI5hxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-MkPC-z1VPU-h7JR8eL9uxA-1; Thu, 04 Feb 2021 05:00:17 -0500
X-MC-Unique: MkPC-z1VPU-h7JR8eL9uxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1A7480402E;
 Thu,  4 Feb 2021 10:00:16 +0000 (UTC)
Received: from redhat.com (ovpn-115-169.ams2.redhat.com [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD1A85B697;
 Thu,  4 Feb 2021 10:00:12 +0000 (UTC)
Date: Thu, 4 Feb 2021 10:00:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: gitlab containers are broken
Message-ID: <20210204100009.GE549438@redhat.com>
References: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
 <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
 <8238fe1d-c7c0-ab72-fa2f-c4cf9ce018bc@linaro.org>
 <6ec7bebe-587d-df2d-0221-e12cb6f4c775@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6ec7bebe-587d-df2d-0221-e12cb6f4c775@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 09:08:13AM +0100, Thomas Huth wrote:
> On 04/02/2021 07.27, Richard Henderson wrote:
> > On 2/3/21 8:03 PM, Thomas Huth wrote:
> > > On 04/02/2021 00.04, Richard Henderson wrote:
> > > > Something has gone wrong with the building of the containers
> > > > in gitlab, because *all* off them are installing Alpine Linux.
> > > > 
> > > > https://gitlab.com/rth7680/qemu/-/jobs/1006336396#L155
> > > 
> > > I think that's ok ... the output about alpine that you see there is just the
> > > output from the container that builds the final container. Later you can see
> > > some "yum install" lines in that output, too, that's where the CentOS container
> > > gets build. And the final compilation job runs on CentOS, too:
> > > 
> > >   https://gitlab.com/rth7680/qemu/-/jobs/1006336699#L35
> > > 
> > > (look for the string "Red Hat" there)
> > 
> > Hmm.  Is there any way to get the full output of the container build?  At
> > present it's being truncated:
> > 
> > #7 [4/5] RUN yum install -y bzip2     bzip2-devel     ccache     csnappy-de...
> > 
> > 
> > In particular, I'm trying to add a new test, and I have added libffi-devel.i686
> > to the fedora-i386-cross.docker file, but then the actual build fails because
> > the libffi header file is missing.
> > 
> > I know you may need the actual patch to comment, but pointers to how to debug
> > this sort of failure are welcome.
> 
> I don't have a clue, all that container magic has been done by Daniel
> initially - maybe he can help (now on CC:) ...

I honestly never bother with the local QEMU container build sripts as
they've over-engineered IMHO.  If I need to debug something locally
I'd just do  "podman build -f path/to/docker-file /path/to/docker-dir".

Alternatively just make your changes to the dockerfiles and thne push
the branch to gitlab. Gitlab will run the build and you can pull down
the docker image from your fork's docker registry


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



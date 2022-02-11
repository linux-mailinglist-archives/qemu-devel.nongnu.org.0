Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F324B2C6F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:10:41 +0100 (CET)
Received: from localhost ([::1]:43120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIaNS-0006l6-Ai
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:10:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nIaMG-0005na-67
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 13:09:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nIaMC-0008K7-SX
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 13:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644602958;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AeU/fB1grqCZm2OZfuQDH//aao0QgUotcd6h2nL3858=;
 b=VgAUDHYEKk35LGW2x/YKXauBZe99x7PzBsZqN0C6ZTTVGQzdBVJXh27vMZq21++/9kbBqF
 BhItbiPfV0fNnS5tdYijg3TP2o2w+78NYZvS2Xi0byvHwJEeVUwp3e6JAz8DvRRT7iRPba
 lkEQ2xkTTlgKWDtUBKqx5j0IukmHvu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-Owi-pmM0ODqIV9Capm-wig-1; Fri, 11 Feb 2022 13:09:14 -0500
X-MC-Unique: Owi-pmM0ODqIV9Capm-wig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B1448144E0;
 Fri, 11 Feb 2022 18:09:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 258E77E11E;
 Fri, 11 Feb 2022 18:08:50 +0000 (UTC)
Date: Fri, 11 Feb 2022 18:08:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 02/11] tests/docker: add NOUSER for alpine image
Message-ID: <YgamMKSpfg9Zskc0@redhat.com>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-3-alex.bennee@linaro.org>
 <YgaNZyojexpreBWj@redhat.com> <87o83dcmjl.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87o83dcmjl.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 05:51:25PM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Fri, Feb 11, 2022 at 04:03:00PM +0000, Alex Bennée wrote:
> >> The alpine image doesn't have a standard useradd binary so disable
> >> this convenience feature for it.
> >
> > Hmm, can you elaborate on the problem here ?
> >
> > IIUC, the NOUSER env was just about controlling what docker
> > flags we added. I didn't know it had a dependancy on stuff
> > inside the image ?
> 
> The docker.py script expands the dockerfiles with a:
> 
>   "RUN id %s 2>/dev/null || useradd -u %d -U %s"
> 
> when they are built so when they are invoked for building TCG tests they
> won't mess up permissions of the final files. It is a useful convenience
> for the other images as well so you can access compilers and tools with
> something like:
> 
>   docker run --rm -it -u (id -u) -v $HOME:$HOME -w (pwd) qemu/debian-arm64-cross /bin/bash
> 
> however it's not required for the normal cross-compile tests as they are
> all done inside the docker image. The alpine image being slim doesn't
> have this nicety although there is an adduser binary. However given we
> don't use alpine for TCG tests I demurred from adding more complexity to
> docker.py to handle it.

Ah, I understand now, so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



> 
> >
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> ---
> >>  tests/docker/Makefile.include | 3 +++
> >>  1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> >> index 0ec59b2193..286f0ac5b5 100644
> >> --- a/tests/docker/Makefile.include
> >> +++ b/tests/docker/Makefile.include
> >> @@ -158,6 +158,9 @@ docker-image-debian-native: DOCKER_REGISTRY=
> >>  docker-image-debian10: NOUSER=1
> >>  docker-image-debian11: NOUSER=1
> >>  
> >> +# alpine has no adduser
> >> +docker-image-alpine: NOUSER=1
> >> +
> >>  #
> >>  # The build rule for hexagon-cross is special in so far for most of
> >>  # the time we don't want to build it. While dockers caching does avoid
> >> -- 
> >> 2.30.2
> >> 
> >
> > Regards,
> > Daniel
> 
> 
> -- 
> Alex Bennée
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



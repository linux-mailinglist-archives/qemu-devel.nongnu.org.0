Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DB940C7E1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 17:07:35 +0200 (CEST)
Received: from localhost ([::1]:33630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQWVa-0002z8-7B
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 11:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQWS5-0000Gy-GQ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQWS3-0005Ad-Ig
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631718235;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoVPpb84d+lO3c9KREsu5ZfPf1ya4GwXO0RKlncmKkg=;
 b=XWt8VnzKII7M9f6yL1i46gr5haeuRiltLfYQOUPsq0DPLE5PqttxdSOyd2EG2eq10homAH
 vrI8BRkfpNtWzPC8Pl+2rEd4UcKaYoduCLQxNhDPNOAkeEDj0ecM4GjawTIOmf9p8fQkhx
 0WFwuiSCjzqpjOB1yumWxJwf5HTy4lI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-BUJRPCQSNdSV7nIPYdvVDA-1; Wed, 15 Sep 2021 11:03:52 -0400
X-MC-Unique: BUJRPCQSNdSV7nIPYdvVDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0B5D1084686;
 Wed, 15 Sep 2021 15:03:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F74188E4;
 Wed, 15 Sep 2021 15:03:40 +0000 (UTC)
Date: Wed, 15 Sep 2021 16:03:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] tests/docker: promote debian-riscv64-cross to a full
 image
Message-ID: <YUILSp1ssORl9zir@redhat.com>
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
 <20210914185830.1378771-2-richard.henderson@linaro.org>
 <14f98dad-fb1c-7b1b-4194-484973a53c90@amsat.org>
 <87v932tfn2.fsf@linaro.org>
 <145f1b51-bffc-85c2-f4d6-3240ba51611a@amsat.org>
MIME-Version: 1.0
In-Reply-To: <145f1b51-bffc-85c2-f4d6-3240ba51611a@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, wainersm@redhat.com, willianr@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 05:01:23PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/15/21 10:15 AM, Alex Bennée wrote:
> > Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> >> On 9/14/21 8:58 PM, Richard Henderson wrote:
> >>> From: Alex Bennée <alex.bennee@linaro.org>
> >>>
> >>> To be able to cross build QEMU itself we need to include a few more
> >>> libraries. These are only available in Debian's unstable ports repo
> >>> for now so we need to base the riscv64 image on sid with the the
> >>> minimal libs needed to build QEMU (glib/pixman).
> >>>
> >>> The result works but is not as clean as using build-dep to bring in
> >>> more dependencies. However sid is by definition a shifting pile of
> >>> sand and by keeping the list of libs minimal we reduce the chance of
> >>> having an image we can't build. It's good enough for a basic cross
> >>> build testing of TCG.
> >>>
> > <snip>
> >>> diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
> >>> index 2bbff19772..594d97982c 100644
> >>> --- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
> >>> +++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
> >>> @@ -1,12 +1,48 @@
> >>>  #
> >>> -# Docker cross-compiler target
> >>> +# Docker cross-compiler target for riscv64
> >>>  #
> >>> -# This docker target builds on the debian Buster base image.
> >>> +# Currently the only distro that gets close to cross compiling riscv64
> >>> +# images is Debian Sid (with unofficial ports). As this is a moving
> >>> +# target we keep the library list minimal and are aiming to migrate
> >>> +# from this hack as soon as we are able.
> >>>  #
> >>> -FROM qemu/debian10
> >>> +FROM docker.io/library/debian:sid-slim
> >>> +
> >>> +# Add ports
> >>> +RUN apt update && \
> >>> +    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
> >>> +    DEBIAN_FRONTEND=noninteractive eatmydata apt update -yy && \
> >>> +    DEBIAN_FRONTEND=noninteractive eatmydata apt upgrade -yy
> >>> +
> >>> +# Install common build utilities
> >>> +RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
> >>> +    bc \
> >>> +    build-essential \
> >>> +    ca-certificates \
> >>> +    debian-ports-archive-keyring \
> >>> +    dpkg-dev \
> >>> +    gettext \
> >>> +    git \
> >>> +    ninja-build \
> >>> +    pkg-config \
> >>> +    python3
> >>
> >> Alex, why not using a debian-sid intermediate image?
> > 
> > Well we removed the original debian-sid image a while ago having excised
> > images that used it. Basing things on sid does cause problems given it's
> > such a moving feast. Rather than encouraging others to build sid based
> > images we decided it made more sense to make this a pure standalone
> > image which we can migrate away from at the first opportunity.
> 
> Yeah, which is why I'm worried we'll get the same problem...
> 
> So this image can't be used as gating IMO.

Yeah, IME from babysitting libvirt CI, 'sid' containers break in dep
solving more often than is acceptable for a mandatory job, especially
for non-x86 arches.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



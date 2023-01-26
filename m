Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B469667CE5A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:39:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3Od-0002Vt-9g; Thu, 26 Jan 2023 09:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL3Ob-0002Ts-Hz
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:38:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL3OZ-0001Lv-Mk
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674743910;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1FdDMJDf8s3jFoEBuGPQK8AioGe12gP8UGNnUxg1c0=;
 b=TvYdZVBnJuLSN7cnLrGbcG3/DvMaEPEyz9rXYAIUppkZVwJcPdoIDgMQ5Tv9fokg4e8zzu
 1y+DbevUXhj9cdLZc54NqustNE6PugxkI9CsFhU+tGa1oUko/eUzgILq3Avl+3lWaOLAFh
 b8rOwN+IVnNKR2+K3xy1yZgd8rzI4r4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-9rzK8bonNhWaVsEGl23GWQ-1; Thu, 26 Jan 2023 09:38:26 -0500
X-MC-Unique: 9rzK8bonNhWaVsEGl23GWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 674D73815F6B;
 Thu, 26 Jan 2023 14:38:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 562112026D4B;
 Thu, 26 Jan 2023 14:38:25 +0000 (UTC)
Date: Thu, 26 Jan 2023 14:38:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Eldon Stegall <eldon-qemu@eldondev.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: no more pullreq processing til February
Message-ID: <Y9KQX2pa6I7n/uvT@redhat.com>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <Y9KFp06pp/qohgV1@invalid> <87h6wdpeig.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6wdpeig.fsf@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Jan 26, 2023 at 02:13:22PM +0000, Alex Bennée wrote:
> 
> Eldon Stegall <eldon-qemu@eldondev.com> writes:
> 
> > On Thu, Jan 26, 2023 at 01:22:32PM +0000, Peter Maydell wrote:
> >> Hi; we've run out of gitlab CI pipeline minutes for this month.
> >> This leaves us the choice of:
> >>  (a) don't process any more pullreqs til we get more minutes in Feb
> >>  (b) merge pullreqs blindly without CI testing
> >>  (c) buy more minutes
> >> 
> >> For the moment I propose to take option (a). My mail filter will
> >> continue to track pullreqs that get sent to the list, but I won't
> >> do anything with them.
> >> 
> >> If anybody has a better suggestion feel free :-)
> >
> > Would it be possible if (d) were to run self-hosted instances of the
> > runner? I am not sure how gitlab pricing works, but I believe on github
> > self-hosted runners are free.
> 
> Yes running more stuff on custom runners would be great (and also
> possibly not as slow as the heavily loaded shared runners).
> 
> > I have several baremetal machines colocated that I could dedicate to
> > execute these runs, dual processor xeons with a couple hundred gigs of
> > RAM. I would need approx 48 hours notice to initially provision the
> > machines. I would be happy to provide root credentials and work out IPMI
> > access if that becomes necessary.
> 
> I think we would need:
> 
>   - provisioning scripts in scripts/ci/setup (if existing not already
>     good enough)

The current approach for provisioning our private runners is highly
undesirable IMHO. We are installing the full set of build deps on
the host OS install, at time of provisioning the runner.

We should instead be provisioning the hosts exclusively to have
docker, and then use containers for the build + test environment,
so we don't need to have sysadmin intervention on the runners when
a merge request adds a build dep.

If we want to new private runners to replace the shared runners
transparently, then the use of docker is basically a must have.

>   - tweak to handle multiple runner instances (or more -j on the build)
>   - changes to .gitlab-ci.d/ so we can use those machines while keeping
>     ability to run on shared runners for those outside the project

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



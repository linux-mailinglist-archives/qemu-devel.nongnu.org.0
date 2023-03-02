Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4736A81D3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:01:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhc3-00058M-KC; Thu, 02 Mar 2023 07:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXhbd-00057i-Mw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:00:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXhbZ-00036k-BR
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677758411;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYCSLSMSu8ECZjX6E4Wkl5l6TY+nb5V2+/dtijt1rDA=;
 b=WoPnP9C/xxLP7VsTmifdHdiO0fF7FiEAKDGWSsaFX/BJ55dq7KHTjAesejaxtS0d8jhQkd
 l9Al+zdnxGcAOnjd6hSIoWkZdfYXYWf4EGefvBRLdJIURsHV75J9ZWjZSp8x+cYk8KiTrf
 srRGrIYcD9ViaG+wfYyrSqk0SgqfnDM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-2s8LRhk5OfmGkcybDgruQg-1; Thu, 02 Mar 2023 07:00:08 -0500
X-MC-Unique: 2s8LRhk5OfmGkcybDgruQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4067A3C0F425;
 Thu,  2 Mar 2023 12:00:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86EC81121318;
 Thu,  2 Mar 2023 12:00:07 +0000 (UTC)
Date: Thu, 2 Mar 2023 12:00:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker,
 avocado, windows)
Message-ID: <ZACPxabcSrkpGMBQ@redhat.com>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
 <87lekfbdi0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lekfbdi0.fsf@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Mar 02, 2023 at 11:24:36AM +0000, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Wed, 1 Mar 2023 at 19:47, Alex Bennée <alex.bennee@linaro.org> wrote:
> >>
> >> From the other thread:
> >>
> >> I think the underlying config needs updating:
> >>
> >>   .git/modules/tests/fp/berkeley-testfloat-3/config
> >>
> >> I'm surprised the git config for submodules doesn't carry the metadata.
> >
> > Yeah, in my local repo that I merge stuff with that file
> > does still have a github URL:
> > url = git://github.com/cota/berkeley-testfloat-3
> >
> > So I guess my questions are:
> >  (1) why hasn't this been a problem up til now ?
> 
> Well this is the first time we've had to tweak testfloat since Emilio
> introduced it when we first added the fp tests.
> 
> >  (2) does this mean that if I merge this then everybody will
> >      need to manually go in and update this file somehow
> >      to be able to pull the updated qemu master ?
> 
> It will depend on how old their checkout is. I don't know why git does
> just honour the metadata in .git-submodules - maybe there is a command
> line stanza to reset the origin repo of submodules?

Aside from what's mention in other replies, the general "restore sanity"
option for submodules is  'git submodule deinit --all --force' which
should purge all local state / checkouts of them.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



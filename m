Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF33D55D4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:47:03 +0200 (CEST)
Received: from localhost ([::1]:45546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wGM-0001Wt-Qu
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m7wFL-0000qq-F7
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:46:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m7wFH-0001LH-71
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627289152;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNx4YweyP0j/kYcuafl5O8xr9R2I1u+/nnf7tngTLvc=;
 b=ZJZV0/ekusmAQGBPQ4NH7DHKSkCxLvJSJRoh1ZwMIyTN0AJskJpQUbv6kZeQwIxLBGb6gA
 ed0vL4VZmpRpcth8m/vKQ3Axu0he2tuouu65GOAGjhy0jlasDC/vivJ8fyP8AW2WnSNFER
 PL4Tm/yKBOv5kujbimShgsM0D3hcALg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-eDQHXm2oNs2LDLEz2o_ntg-1; Mon, 26 Jul 2021 04:45:49 -0400
X-MC-Unique: eDQHXm2oNs2LDLEz2o_ntg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A54F192CC41;
 Mon, 26 Jul 2021 08:45:48 +0000 (UTC)
Received: from redhat.com (ovpn-113-137.ams2.redhat.com [10.36.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E89D918A9E;
 Mon, 26 Jul 2021 08:45:46 +0000 (UTC)
Date: Mon, 26 Jul 2021 09:45:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL for 6.1-rc1 00/28] doc, metadata, plugin and testing updates
Message-ID: <YP52ODpqY/1nfNmA@redhat.com>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
 <e66f26d0-f2d6-c10a-8da3-de7d03d13391@redhat.com>
 <CAFEAcA9zijOBP++1HsUTiOpE6gt1fnUpYEzHXuDrMWsUxvPz+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9zijOBP++1HsUTiOpE6gt1fnUpYEzHXuDrMWsUxvPz+g@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 24, 2021 at 11:04:03AM +0100, Peter Maydell wrote:
> On Fri, 23 Jul 2021 at 18:44, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >
> > On 7/23/21 7:03 PM, Alex Bennée wrote:
> > > I realised I'm on holiday next week so I thought I'd better send this now.
> > >
> > > The following changes since commit a146af86c8247f41b641783428b95ee71eb0e43f:
> > >
> > >   Merge remote-tracking branch 'remotes/kraxel/tags/vga-20210723-pull-request' into staging (2021-07-23 12:16:12 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/stsquad/qemu.git tags/pull-for-6.1-rc1-230721-1
> > >
> > > for you to fetch changes up to 0a9487d80af9ed6fa14d2696bc34a920b32e53e5:
> > >
> > >   gitlab-ci: Extract OpenSBI job rules to reusable section (2021-07-23 17:22:16 +0100)
> > >
> > > ----------------------------------------------------------------
> > > Doc, metadata, plugin and testing updates for 6.1-rc1:
> > >
> > >   - git ignore some file editor detritus
> > >   - add overview on device emulation terminology
> > >   - remove needless if leg in configure custom devices logic
> > >   - numerous gitdm/mailmap updates
> > >   - fix plugin_exit race for linux-user
> > >   - fix a few bugs in cache modelling plugin
> > >   - fix plugin calculation of physical address
> > >   - handle pure assembler/linker tcg tests outside of docker
> > >   - add tricore build to gitlab
> > >   - remove superfluous MacOSX task
> > >   - generalise the OpenBSI gitlab rules
> > >
> > > ----------------------------------------------------------------
> >
> >
> > > Philippe Mathieu-Daudé (1):
> > >       gitlab-ci: Extract OpenSBI job rules to reusable section
> >
> > Oops this isn't to latest version of this patch :/
> >
> > https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg06130.html
> 
> Given Alex is on holiday, should I apply this pullreq anyway and
> then you could send a patch to fix up the differences afterwards,
> or should we drop the pullreq (and maybe this stuff doesn't
> go in for rc1)?

I think it is fine to apply the pullreq anyway.

While there is a bug in the OpenSBI job rules patch, it is still better
than what currently exists in git master. We've also already merged the
identical rules change into the EDK job. So no matter what we'll need
to followup later with more fixes.

The bug in the patch merely means that if the container build fails,
we'll then still try the next build job which will now also possibly
fail.  This is annoying but functionally harmless, as the overall
pipeline will be in a fail state no matter what.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



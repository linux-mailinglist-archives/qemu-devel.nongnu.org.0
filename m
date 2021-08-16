Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B463ED2E9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:12:02 +0200 (CEST)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFaXB-0000WN-MV
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFaWP-0008Gk-VX
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFaWN-0000Df-VD
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629112270;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=816LqPon2f5h2eJYBYauU24wOWGF7Jqr/lOQ9HSW4NA=;
 b=aurNwqUBPdnAgbfO3Dkb3tySCEa9w/+5CZJupQdb8qBbPEy6JwywNnXy9BaEtfbnRyhUWS
 tbntlnNIxKBbGJLMSreVlmji+xfyRqFZOdKCt4Z0874HKC/fEFDyAUtJdA2zJ0lHoe3iKP
 C2fQ8m98/m243OFL5bokfAnm1bKDKv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-PdS3WcsVP4ulCH7QiWEDfg-1; Mon, 16 Aug 2021 07:11:07 -0400
X-MC-Unique: PdS3WcsVP4ulCH7QiWEDfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1A376409B;
 Mon, 16 Aug 2021 11:11:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D208669F3;
 Mon, 16 Aug 2021 11:11:04 +0000 (UTC)
Date: Mon, 16 Aug 2021 12:11:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PULL 00/11] Optional gitlab-CI and doc fixes for -rc4
Message-ID: <YRpHxjyz8+Su4ziA@redhat.com>
References: <20210814060956.12852-1-thuth@redhat.com>
 <CAFEAcA9ur-HX4r30QgEAL73VEgA+=XXpWW6v9arKcM=ijEsHvA@mail.gmail.com>
 <20210816102246.z4ybsgpmrn4isdoj@mozz.bu.edu>
MIME-Version: 1.0
In-Reply-To: <20210816102246.z4ybsgpmrn4isdoj@mozz.bu.edu>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 06:22:46AM -0400, Alexander Bulekov wrote:
> On 210816 1001, Peter Maydell wrote:
> > On Sat, 14 Aug 2021 at 07:10, Thomas Huth <thuth@redhat.com> wrote:
> > >
> > >  Hi Peter,
> > >
> > > in case we're going to have an -rc4, here's a pull request that contains
> > > the fixes for getting the gitlab-CI green again. I also added some doc
> > > updates since they should be completely riskless. But if we won't have an
> > > rc4 due to other reasons, this pull request here certainly also does not
> > > justify another RC, so please ignore this PR in that case.
> > >
> > > The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
> > >
> > >   Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-08-11
> > >
> > > for you to fetch changes up to 36b508993c4dcc6b3ef4b5c00e293ee9560926ee:
> > >
> > >   docs/about/removed-features: Document removed machines from older QEMU versions (2021-08-11 15:39:09 +0200)
> > >
> > > CI run can be seen here:
> > >
> > >  https://gitlab.com/thuth/qemu/-/pipelines/351602605
> > >
> > > ----------------------------------------------------------------
> > > * Fixes for the gitlab-CI (fix the hanging  build-oss-fuzz pipeline)
> > > * Add documentation about features that have been removed in older versions
> > >
> > 
> > 
> > Applied, thanks.
> > 
> > Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
> > for any user-visible changes.
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1505950978
> Looks like build-oss-fuzz is still timing out, even without the issue
> in the vhost-usr-blk test. At this point the job should essentially just
> build + test qemu-system-i386 with some extra time spent on linking
> the fuzzer and briefly running through all the fuzzer configs. Maybe the
> only way to make this work is to split the job into a build + test
> stage?

At this point I think we should just disable the job in gitlab entirely.
We've spent too long debugging this, while leaving CI red for everyone.

Whomever is interested in this can then work to find a way to make it
reliable and request it be re-enabled once confident that it will work.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



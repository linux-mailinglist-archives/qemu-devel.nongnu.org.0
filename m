Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E4C6C4B0E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:48:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexsx-0004EX-31; Wed, 22 Mar 2023 08:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pexss-0004EI-8b
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:48:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pexsq-00034S-Bt
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679489283;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ec35Soti2skEVUahX2PvIOpeOr41INDqNZuucdpuVyM=;
 b=dPYfI21mS2R/KJgJXLP50UirhJVoK+2EzaojZOjbRkUNyOpLRVKTDsoAI5rRZaH7Xcpzqs
 EBy4SVvcSR05XhV8xQjcMb4z71t2pEDoLeGwpNrHxNFwNDZ7JFDd/1TXs1c+b61FyskBQ1
 YtQikKGpaWY6n53/A8FSvrwZoc4T2oE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-SQVd0QyPNqqH_QKwazbvFQ-1; Wed, 22 Mar 2023 08:48:02 -0400
X-MC-Unique: SQVd0QyPNqqH_QKwazbvFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0D9C858297;
 Wed, 22 Mar 2023 12:48:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05843C15BA0;
 Wed, 22 Mar 2023 12:48:00 +0000 (UTC)
Date: Wed, 22 Mar 2023 12:47:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PULL 00/31] various fixes (testing, plugins, gitdm)
Message-ID: <ZBr4/i1Vqdl1MgxO@redhat.com>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
 <CAFEAcA-f=tDQqmisqaJQxwYjgYOv+1XbCUDcaZkH_Jikt1iYNg@mail.gmail.com>
 <ZBhqd7uyT0X6tRK7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBhqd7uyT0X6tRK7@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Mon, Mar 20, 2023 at 02:15:19PM +0000, Daniel P. Berrangé wrote:
> On Mon, Mar 20, 2023 at 01:42:46PM +0000, Peter Maydell wrote:
> > On Sat, 18 Mar 2023 at 11:46, Alex Bennée <alex.bennee@linaro.org> wrote:
> > >
> > > The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:
> > >
> > >   Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-170323-4
> > >
> > > for you to fetch changes up to 4f2c431acd43d0aa505494229d05fa343762f272:
> > >
> > >   qtests: avoid printing comments before g_test_init() (2023-03-17
> > >   17:50:19 +0000)
> > >
> > > You can see my CI run on the branch here:
> > >
> > >   https://gitlab.com/stsquad/qemu/-/pipelines/810271620
> > >
> > > The failures:
> > >
> > >   FreeBSD's time out on a migration test
> > >   Centos8 Stream because my private runner needs more disk space
> > >
> > > ----------------------------------------------------------------
> > > Misc fixes for 8.0 (testing, plugins, gitdm)
> > >
> > >   - update Alpine image used for testing images
> > >   - include libslirp in custom runner build env
> > >   - update gitlab-runner recipe for CentOS
> > >   - update docker calls for better caching behaviour
> > >   - document some plugin callbacks
> > >   - don't use tags to define drives for lkft baseline tests
> > >   - fix missing clear of plugin_mem_cbs
> > >   - fix iotests to report individual results
> > >   - update the gitdm metadata for contributors
> > >   - avoid printing comments before g_test_init()
> > >

snip

> > The iotests also don't seem to pass on the OpenBSD VM after this;
> > which test fails varies from run to run but the common factor
> > is a complaint about running out of disk space:
> 
> This must be caused by the change in the way we register the
> iotests with meson, as I don't see any other interesting changes
> in this series.

snip

> So the change in parallelism is that we can potentially run the
> block I/O tests in parallel with unit tests. Maybe parallel with
> avocado tests too, I'm not sure ?

So the increased parallelism was the trigger, but the root cause is
in the VM. The openbsd image, despite being 20 GB in size, only
has 3.5 GB available for /home. The rest is wasted on assignments
to other partitions we're not even using :-( I've proposed a patch
to create a saner partitioning scheme

  https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05613.html

I could reproduce the ENOSPC easily myself, and after applying this
series above, the ENOSPC unsurprisingly goes away.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



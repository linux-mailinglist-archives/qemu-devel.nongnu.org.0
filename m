Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F23BB9D7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:05:43 +0200 (CEST)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KXt-0001Nx-Hp
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0KWW-0008QZ-RQ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:04:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0KWU-0007G2-TB
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625475854;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BHUHCJk8aBA1fdcv7TKDQvuqK+mKb9UFc7QjVy4aMvU=;
 b=hm0+UyZtCvkwUadXNU5oM+UuRl6iOJItt2MtVTLx7jG9OV+UFFNvdS70l6myXwdZy9uZnT
 dS1xfNEMns2/6t55gcsnp/pMOOK4PsZVIwjS7LxQO8GVYDxzcCgYzmxbDqGPBX9i0z5GVV
 nub4D1LrTrtfDxlzCebWaP7raAxaJMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-kKeSfaxlM8OD__y7uCaPiQ-1; Mon, 05 Jul 2021 05:04:02 -0400
X-MC-Unique: kKeSfaxlM8OD__y7uCaPiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A089080430F;
 Mon,  5 Jul 2021 09:04:00 +0000 (UTC)
Received: from redhat.com (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76B455C1A1;
 Mon,  5 Jul 2021 09:03:54 +0000 (UTC)
Date: Mon, 5 Jul 2021 10:03:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/20] migration queue
Message-ID: <YOLK94kSQJzq4Rl+@redhat.com>
References: <20210701141545.193571-1-dgilbert@redhat.com>
 <CAFEAcA8SfuHm6Q_8jLYNuxB3VFHSFUECGXsp42YONZSuT0fpsg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8SfuHm6Q_8jLYNuxB3VFHSFUECGXsp42YONZSuT0fpsg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
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
Cc: Laurent Vivier <lvivier@redhat.com>, linfeng23@huawei.com,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, huangy81@chinatelecom.cn,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, leobras@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05, 2021 at 09:57:20AM +0100, Peter Maydell wrote:
> On Thu, 1 Jul 2021 at 15:19, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The following changes since commit 1ec2cd0ce2ca94292ce237becc2c21b4eb9edca0:
> >
> >   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-06-30 21:09:27 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210701a
> >
> > for you to fetch changes up to 9c21e61435e09a7a67f951a096b93183a7a5ad89:
> >
> >   migration/rdma: Use error_report to suppress errno message (2021-07-01 12:21:32 +0100)
> >
> > ----------------------------------------------------------------
> > Migration and virtiofs pull 2021-07-01
> >
> > A bunch of small fixes and improvements; two particular to note:
> >   a) Peter's fix to migration-test for uffd, means that a lot of
> > migration tests will start running in a lot of places again when they'd
> > previously been skipped.

Presumably this change is the cause of....

> >   b) Vivek's 'Fix fuse_setxattr...' fixes our build against an API
> > breakage in the kernel headers.
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> 
> This seems to reliably cause 'make check' to hang in the openbsd VM.
> (The NetBSD and FreeBSD VMs are OK.)

...the openbsd VM failure

Guess there was a pre-existing bug affect openbsd we've now exposed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



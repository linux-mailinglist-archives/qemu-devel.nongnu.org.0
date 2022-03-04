Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA14CDD4C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:23:26 +0100 (CET)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDWP-0001VO-3T
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:23:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDP4-0005e1-9k
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDP1-0003Si-2C
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646421345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=FFhUazy9sO26itPr9/p8fmbXx5GvKmF7Oanm+sZGdOc=;
 b=J2y4Pva6xwCtmnTmrT5EIQjhu0RAWZ1/d+xDdHBaBpBWznOFB8zEiQCjg4L/saK4ZDuuGm
 l53Lgtby5fKZRQRDUGmLLewV7syKeT/4/KyoHmVRVMA/dSFSegw6OqDaIuRbKo2mpW7G/F
 PsO89Ehr0RhfzNEwA/CZcApqOeRUUR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-werTZXTtN8-hAXdCcRsN0Q-1; Fri, 04 Mar 2022 14:15:39 -0500
X-MC-Unique: werTZXTtN8-hAXdCcRsN0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77F491854E2A;
 Fri,  4 Mar 2022 19:15:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F0105C629;
 Fri,  4 Mar 2022 19:15:24 +0000 (UTC)
Date: Fri, 4 Mar 2022 19:15:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/11] QEMU changes for 2021-03-02
Message-ID: <YiJlSlJube4dOk/m@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
 <CAFEAcA8=8tiqmFTFPaNXcqjXy6Rb5xR59Q2VYUXOTbN91rbYuA@mail.gmail.com>
 <088024f5-7066-e6ec-953e-f55d7ff83b96@redhat.com>
 <CAFEAcA--dtmffH4FJUuuE1d6yR-4Mweu481p_y-EsJKEtPRjTw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--dtmffH4FJUuuE1d6yR-4Mweu481p_y-EsJKEtPRjTw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 06:46:51PM +0000, Peter Maydell wrote:
> On Fri, 4 Mar 2022 at 17:41, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > The test seems to be flaky, I've been fighting with it all week---trying
> > multiple versions of this pull request and removing patches until
> > build-oss-fuzz passed.  The set of patches that triggered it or not was
> > completely random, but I'll not that it did pass with this exact commit
> > I'm submitting (https://gitlab.com/bonzini/qemu/-/jobs/2154365356).
> >
> > I wanted to look at this today again before replying to you, but as you
> > know I was sidetracked by work on the qemu.org infrastructure.  So, I
> > can look at this but I really need to ask you one of two favors:
> >
> > 1) decide that the test is flaky and merge this pull request, and then
> > I'll send before Monday the changes that I've omitted here (which again
> > have nothing to do with qos-test).  I'll look at qos-test during soft
> > freeze.
> >
> > 2) accept that I'll send another x86 pull request (not a large one)
> > after soft freeze, so that I have more time to debug this (likely
> > unrelated) build-oss-fuzz issue.
> 
> Either of these is fine; my requirement is only that either:
>  (1) the oss-fuzz gitlab CI job needs to in practice actually
> pass at least most of the time
>  (2) we need to switch it to ok-to-fail or disable it
> 
> so I don't have CI failing for every merge I make.

This is far from the first time that oss-fuzz has caused us pain. It
feels like it has been flaky  for prolonged periods of time, for as
long as it has existed.

When I tried to switch CI to use Fedora 35 oss-fuzz was consistently
failing for months for no obvious reason that I could determine
despite days of debugging. Then one day I woke up and it magically
started working again, for no obvious reason. Inexplicable.

Conceptually we benefit from fuzzing to find obscure bugs.
Have we actually found any real bugs from the oss-fuzz CI
job we have though ? Between us all, we've certainly lost
many many many days of developer time debugging the thing
for false failures.

The magic set of args needed to run it make it even more
unpleasant to deal with, and that scripts/oss-fuzz/build.sh
runs different code inside GitLab vs outside GitLab also
make debugging worse.

Personally I favour turning it into a non-gating job as
I don't want to invest more of my own time debugging
non-bugs in it.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



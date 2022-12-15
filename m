Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE9564DD88
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 16:14:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5pvu-0007jr-4q; Thu, 15 Dec 2022 10:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5pvr-0007jF-6Q
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:13:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5pvp-00016t-IS
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671117236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OjWAdyp5TtF88Pr8hS6hQ6dFSRtu3kJnyof6NRdYIsw=;
 b=LE6s+HkQEsDdDWLli6KgROpfYibPwwjZONP74AAIRFCo9OAoCcN4SsrFY2UwBpUTL+cqIt
 o+F6lUkx6a1Yo98XMj54/TyIgJioGeTYCj0fMC2n312xvfcj8NLvQs29pcYtTkAeslbDCo
 gJxjpGALi1QdLuMu6cYOH2sdZ0ZUK58=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-jmEu40ruNeKGvFnQukUXDw-1; Thu, 15 Dec 2022 10:13:52 -0500
X-MC-Unique: jmEu40ruNeKGvFnQukUXDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56D3F88646C;
 Thu, 15 Dec 2022 15:13:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 999F12166B26;
 Thu, 15 Dec 2022 15:13:51 +0000 (UTC)
Date: Thu, 15 Dec 2022 16:13:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/51] Block layer patches
Message-ID: <Y5s5rMp6WmLP7+bM@redhat.com>
References: <20221215115900.30044-1-kwolf@redhat.com>
 <CAFEAcA9niEUk+JwDhOTqa6owskGmJq0jSJXxeRmUtfG3mp_4mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9niEUk+JwDhOTqa6owskGmJq0jSJXxeRmUtfG3mp_4mA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 15.12.2022 um 15:44 hat Peter Maydell geschrieben:
> On Thu, 15 Dec 2022 at 11:59, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:
> >
> >   mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)
> >
> > are available in the Git repository at:
> >
> >   https://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to 347fe9e156a3e00c40ae1802978276a1f7d5545f:
> >
> >   block: GRAPH_RDLOCK for functions only called by co_wrappers (2022-12-15 10:11:45 +0100)
> >
> > v2:
> > - Changed TSA capability name to "mutex" to work with older clang
> >   versions. The tsan-build CI job succeeds now.
> >
> > ----------------------------------------------------------------
> > Block layer patches
> >
> > - Code cleanups around block graph modification
> > - Simplify drain
> > - coroutine_fn correctness fixes, including splitting generated
> >   coroutine wrappers into co_wrapper (to be called only from
> >   non-coroutine context) and co_wrapper_mixed (both coroutine and
> >   non-coroutine context)
> > - Introduce a block graph rwlock
> 
> This fails to compile on the FreeBSD 12 and 13 jobs:
> https://gitlab.com/qemu-project/qemu/-/jobs/3479763741
> https://gitlab.com/qemu-project/qemu/-/jobs/3479763746
> 
> The compiler is producing -Wthread-safety-analysis
> warnings on code in qemu-thread-posix.c, which are a
> compile failure because of -Werror.

Hmm... FreeBSD actually annotates it pthread locking functions for TSA,
so all callers need to be annotated as well. I guess it's nice in
theory, but hard to enable for a huge codebase like QEMU...

I'll just drop "configure: Enable -Wthread-safety if present" for now.

Maybe we can have a configure check later to enable it by default on
glibc at least. Or we really need to go through all locks in QEMU and
annotate them properly. This might be a bit too painful, though, so we
may end up leaving FreeBSD unchecked even if that seems to be the OS to
care most about it...

Kevin



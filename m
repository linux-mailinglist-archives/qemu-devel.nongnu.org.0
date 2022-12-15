Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DD964D8F5
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 10:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5knG-0008WA-OU; Thu, 15 Dec 2022 04:44:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5knD-0008RU-TW
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:44:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5knC-0005Ar-9A
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671097481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eXq8TEWL0e7a1/Jekml4L1JrCOMyBvm4qNOLRc2H/Z0=;
 b=U8d1BlhMxo+nI1NPo/tskL6yJUXdSCN1JkfJSbw0jdpdibuvNkC1Iwk/i5/hwwgEI0HvzQ
 ykF7B4Z5dTSb/x4OND3FmBMsOKv3UJDx4QO4xufCa+b3InQtZBisk5gI5u77MhBRkjO8IB
 7sWQKc+/VNGCqirQiuuARrqSrzj5ZNI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-U6vCluAyORS_8NASqJBEXg-1; Thu, 15 Dec 2022 04:44:38 -0500
X-MC-Unique: U6vCluAyORS_8NASqJBEXg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5FC3858F0E;
 Thu, 15 Dec 2022 09:44:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F045492C14;
 Thu, 15 Dec 2022 09:44:37 +0000 (UTC)
Date: Thu, 15 Dec 2022 10:44:33 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PULL 00/51] Block layer patches
Message-ID: <Y5rsgebnZc3bSWVX@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
 <CAFEAcA8Tob4eV_cGAT050b0oGHjRVEmWVnuJ7ugURVi4o_X7pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8Tob4eV_cGAT050b0oGHjRVEmWVnuJ7ugURVi4o_X7pg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 14.12.2022 um 23:35 hat Peter Maydell geschrieben:
> On Wed, 14 Dec 2022 at 13:45, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:
> >
> >   mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)
> >
> > are available in the Git repository at:
> >
> >   https://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to 2ad19e5dc950d4b340894846b9e71c0b20f9a1cc:
> >
> >   block: GRAPH_RDLOCK for functions only called by co_wrappers (2022-12-14 13:13:07 +0100)
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
> >
> > ----------------------------------------------------------------
> 
> Fails to build on the tsan-build job:
> https://gitlab.com/qemu-project/qemu/-/jobs/3476176683
> 
> In file included from ../hw/nvram/fw_cfg-interface.c:10:
> In file included from /builds/qemu-project/qemu/include/hw/nvram/fw_cfg.h:7:
> In file included from /builds/qemu-project/qemu/include/sysemu/dma.h:15:
> In file included from /builds/qemu-project/qemu/include/block/block.h:27:
> In file included from
> /builds/qemu-project/qemu/include/block/block-global-state.h:27:
> In file included from /builds/qemu-project/qemu/include/block/block-common.h:27:
> In file included from /builds/qemu-project/qemu/include/block/aio.h:25:
> /builds/qemu-project/qemu/include/block/graph-lock.h:62:31: error:
> invalid capability name 'graph-lock'; capability name must be 'mutex'
> or 'role' [-Werror,-Wthread-safety-attributes]
> typedef struct TSA_CAPABILITY("graph-lock") BdrvGraphLock {
>                                ^
> 
> (I see the same error on my x86 macos system.)

Ah, surprise, clang 11 lifted this arbitrary restriction for capability
names and that it existed in older compiler versions isn't documented
(any more?).

We can either just name it "mutex" and have slightly misleading error
messages (it's semantically not a mutex, but an rwlock), or add a
configure check and leave TSA disabled if it doesn't work. I think I'll
try the former for now, "mutex 'graph_lock'" should still be good enough
to know what it means.

Kevin



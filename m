Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC45F6355
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:09:52 +0200 (CEST)
Received: from localhost ([::1]:49048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMt5-0003sj-E9
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogMVy-0003Ig-AS
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:46:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogMVu-0007gx-0A
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665045952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P+kzzhAXU+e7QgyRhO4/TtQoYWS9755q6EtXtkDlIBU=;
 b=EjGGIEjMrML2ne/hG8Xzs9wprquxb7L9JLHSpB21YX9TDWnMBA+3LALPaEydndE8r9vZAp
 ks0ZiUO7aDKrQrAR/gOUE8ETb4lGoLKSoVyXOSjRMDOfn6kbtTErRsJlMGiKzc5uGIUtYX
 kqUAlY1irO1esS4ybMGpkKLsiCk4j1U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-U3GZtXLiNGWvquXJFUclNA-1; Thu, 06 Oct 2022 04:45:51 -0400
X-MC-Unique: U3GZtXLiNGWvquXJFUclNA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D6B62932499;
 Thu,  6 Oct 2022 08:45:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62BA54A927B;
 Thu,  6 Oct 2022 08:45:50 +0000 (UTC)
Date: Thu, 6 Oct 2022 10:45:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Alberto Campinho Faria <afaria@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 06/26] blkdebug: add missing coroutine_fn annotations
Message-ID: <Yz6VveEZA0dWRjP6@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
 <20220922084924.201610-7-pbonzini@redhat.com>
 <Yz1dONxeQIVqysmL@redhat.com>
 <CABgObfYmjrVbUmz9xtbVnzdDEPBEMZxtV-sYtNuO-0ZPBECstA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfYmjrVbUmz9xtbVnzdDEPBEMZxtV-sYtNuO-0ZPBECstA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.10.2022 um 23:11 hat Paolo Bonzini geschrieben:
> Il mer 5 ott 2022, 06:32 Kevin Wolf <kwolf@redhat.com> ha scritto:
> 
> > Hm... blkdebug_debug_event() is called from bdrv_debug_event(), which is
> > not coroutine_fn. And I think that it's not coroutine_fn is correct:
> > For example, with 'qemu-img snapshot -c' you get img_snapshot() ->
> > bdrv_snapshot_create() -> qcow2_snapshot_create() ->
> > qcow2_alloc_clusters() -> BLKDBG_EVENT. I'm sure many other calls in
> > qcow2 can be reached from non-coroutine context as well.
> >
> > It almost looks like your code analysis didn't consider calls through
> > function pointers?
> >
> 
> No, that is not what happened. Rather it's that the analysis goes the
> other way round: because SUSPEND rules call qemu_coroutine_yield(),
> clang wants all the callers to be coroutine_fn too.

Ah, ok, makes sense. So checking the callers is indeed something that
requires manual review.

> It is technically incorrect that bdrv_debug_events sometimes are
> placed outside coroutine context, and QEMU would crash if those events
> were associated with a suspend rule.

Yes, looks like a bug. As long as it's only in blkdebug, we can probably
live with it (the easiest fix would probably be generating coroutine
wrappers for bdrv_debug_event(), too).

> I guess I (or you) can just drop this patch?

Yes, I can do that.

Kevin



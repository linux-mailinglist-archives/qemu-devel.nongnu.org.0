Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64830628E4D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:27:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouirS-0004nK-KT; Mon, 14 Nov 2022 18:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ouihF-0004k1-3b
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:16:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ouX8r-0002wM-0d
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 05:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668423399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g7PO7dvelaaBhZ6lKYjRM8WatYv5b1iKZpXDU6NL7TE=;
 b=XETT+w969+LRSp8/TEbKMyHGYM9AEFta6xkb1vCNB8xVa0NJkICKXdu0BW1OFWnZcAJWjq
 lfYi4nMIjfeoGp2FxZofLwOKzBxL4CsQENrCeVwjUj+4iHfcPYptWWlJVX9yBwoq+MQCQX
 lwNiFpttoayi6Csege0l5Fx08/mOtVw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-wP3yZ6U_Mh-sEA_5grqWJw-1; Mon, 14 Nov 2022 05:56:38 -0500
X-MC-Unique: wP3yZ6U_Mh-sEA_5grqWJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CED1D29AB3EE;
 Mon, 14 Nov 2022 10:56:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB60B40C83EE;
 Mon, 14 Nov 2022 10:56:36 +0000 (UTC)
Date: Mon, 14 Nov 2022 11:56:33 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 stefanha@redhat.com, qemu-devel@nongnu.org, jsnow@redhat.com
Subject: Re: [PULL 00/11] Block layer patches
Message-ID: <Y3Ie4aH6Da4qgWbU@redhat.com>
References: <20221111152744.261358-1-kwolf@redhat.com>
 <CAJSP0QVgzEAEdzrBd2Q3KsPBmCPTwzdO1dOb6KrY729esKLkZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QVgzEAEdzrBd2Q3KsPBmCPTwzdO1dOb6KrY729esKLkZA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Am 11.11.2022 um 20:20 hat Stefan Hajnoczi geschrieben:
> > Hanna Reitz (9):
> >       block/mirror: Do not wait for active writes
> >       block/mirror: Drop mirror_wait_for_any_operation()
> >       block/mirror: Fix NULL s->job in active writes
> >       iotests/151: Test that active mirror progresses
> >       iotests/151: Test active requests on mirror start
> >       block: Make bdrv_child_get_parent_aio_context I/O
> >       block-backend: Update ctx immediately after root
> >       block: Start/end drain on correct AioContext
> >       tests/stream-under-throttle: New test
> 
> Hi Hanna,
> This test is broken, probably due to the minimum Python version:
> https://gitlab.com/qemu-project/qemu/-/jobs/3311521303

This is exactly the problem I saw with running linters in a gating CI,
but not during 'make check'. And of course, we're hitting it during the
-rc phase now. :-(

But yes, it seems that asyncio.TimeoutError should be used instead of
asyncio.exceptions.TimeoutError, and Python 3.6 has only the former.
I'll fix this up and send a v2 if it fixes check-python-pipenv.

Kevin



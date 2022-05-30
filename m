Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC6537B7E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:26:12 +0200 (CEST)
Received: from localhost ([::1]:50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfPP-0007ek-8P
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nvfLn-0004lE-9y
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:22:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nvfLl-0002xV-Bj
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653916943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E1lvsFkwR9PgYpPUAbMvyzPhwil8V5wkEG+WaNEb5R8=;
 b=RmkhHtjzTiRZDY9CkMU12B8OXDuQ/36R7d+3W0PXDvxCsWdx1/HSjq3qi9J2xqCKOSzykE
 SEUSm+/DTT42QxsuprzG4CNSOQL5I6RTbXyC9JN/06f59Tn3pD+lqUbAETmH4RBF6zQxLl
 oxwSnSuoytAd9JBl9tOp+xg/ryt8vuM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-bdKkpou4PSS9K2qsYcqEGA-1; Mon, 30 May 2022 09:22:22 -0400
X-MC-Unique: bdKkpou4PSS9K2qsYcqEGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D42B3811E75;
 Mon, 30 May 2022 13:22:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0F0EC23DBF;
 Mon, 30 May 2022 13:22:20 +0000 (UTC)
Date: Mon, 30 May 2022 15:22:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Subject: Re: [PATCH] nbd: Drop dead code spotted by Coverity
Message-ID: <YpTFC/EW+hylhGJG@redhat.com>
References: <20220516210519.76135-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516210519.76135-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.05.2022 um 23:05 hat Eric Blake geschrieben:
> CID 1488362 points out that the second 'rc >= 0' check is now dead
> code.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 172f5f1a40(nbd: remove peppering of nbd_client_connected)
> Signed-off-by: Eric Blake <eblake@redhat.com>

Thanks, applied to the block branch.

Kevin



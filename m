Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D67F6328F0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:03:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9FE-0005J1-DZ; Mon, 21 Nov 2022 11:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ox9F9-0005II-Hl
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:02:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ox9F2-0004nm-41
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669046511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DoY7E0NlYewfrflBQjU41cLatH2XrISuX9oqDnVhi9k=;
 b=SIIhZK4ZxibPqbroCURjlfgcKboL8+IjorirP2+Lji2USMh9+lwj680FOZ+gOKQSsPAfXD
 A7Gbo89z47fPy0YQ4+ZOqx7oMSObc8j0wEOESl7RXBhLZRuyDVhI8GdRG57qLasoeAhdD1
 vfgTpep1foyQ7jDp41nE30yxgkqdytc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-RFib2cX5MQekAa2zQA2VLQ-1; Mon, 21 Nov 2022 11:01:45 -0500
X-MC-Unique: RFib2cX5MQekAa2zQA2VLQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5113811E7A;
 Mon, 21 Nov 2022 16:01:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABF3D492CA2;
 Mon, 21 Nov 2022 16:01:43 +0000 (UTC)
Date: Mon, 21 Nov 2022 17:01:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 07/11] block/vmdk: add missing coroutine_fn annotations
Message-ID: <Y3ug5AlK0+h6c1tu@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116122241.2856527-8-eesposit@redhat.com>
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

Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> These functions end up calling bdrv_create() implemented as generated_co_wrapper
> functions.
> In addition, they also happen to be always called in coroutine context,
> meaning all callers are coroutine_fn.
> This means that the g_c_w function will enter the qemu_in_coroutine()
> case and eventually suspend (or in other words call qemu_coroutine_yield()).
> Therefore we need to mark such functions coroutine_fn too.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Just one remark about patch ordering: This doesn't require the
g_c_w_simple patches, so wouldn't it make more sense to move the
g_c_w_simple right before the first patch that actually makes use of
them?

Reviewed-by: Kevin Wolf <kwolf@redhat.com>



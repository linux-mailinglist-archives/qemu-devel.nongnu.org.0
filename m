Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B6582EE7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:18:56 +0200 (CEST)
Received: from localhost ([::1]:52946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkgQ-000637-4k
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGk94-0001Ha-RY
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 12:44:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGk91-0000PR-1Y
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 12:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658940261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kVXU4wTwMF0FvWTrLiBffHoTFCcQcfcfXhm9LNWOQY=;
 b=L2MG+Wn0VilLaMAd6lLx5WyR1WxFrSoFy7u4rRdPBU6kEPnF+H9jWzr+XgzOfHMX4XMmc3
 uo0CP/osocm1r+stwdbwrWQ9Eppw4y67OqNFieH2M7Fd8LOPUhIGsuBCOU4Zt2v6Sq2yWD
 FDSl1fKk+VO1wpq/f04UDmZHUOYVcZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-GnthmNQFNtmCnsy4eSYbVg-1; Wed, 27 Jul 2022 12:44:18 -0400
X-MC-Unique: GnthmNQFNtmCnsy4eSYbVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F26B101A54E;
 Wed, 27 Jul 2022 16:44:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 680052166B26;
 Wed, 27 Jul 2022 16:44:16 +0000 (UTC)
Date: Wed, 27 Jul 2022 18:44:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 its@irrelevant.dk, kbusch@kernel.org,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Linux io_uring" <qemu-block@nongnu.org>
Subject: Re: [PATCH] block/io_uring: add missing include file
Message-ID: <YuFrX31f836vaPVW@redhat.com>
References: <20220721065645.577404-1-fanjinhao21s@ict.ac.cn>
 <20220721070956.js5rqulrpjx4i5ab@sgarzare-redhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721070956.js5rqulrpjx4i5ab@sgarzare-redhat>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 21.07.2022 um 09:09 hat Stefano Garzarella geschrieben:
> On Thu, Jul 21, 2022 at 02:56:45PM +0800, Jinhao Fan wrote:
> > The commit "Use io_uring_register_ring_fd() to skip fd operations" uses
> > warn_report but did not include the header file "qemu/error-report.h".
> > This causes "error: implicit declaration of function ‘warn_report’".
> > Include this header file.
> > 
> 
> We could add:
> 
> Fixes: e2848bc574 ("Use io_uring_register_ring_fd() to skip fd operations")
> 
> > Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> > ---
> > block/io_uring.c | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/block/io_uring.c b/block/io_uring.c
> > index f8a19fd97f..a1760152e0 100644
> > --- a/block/io_uring.c
> > +++ b/block/io_uring.c
> > @@ -11,6 +11,7 @@
> > #include "qemu/osdep.h"
> > #include <liburing.h>
> > #include "block/aio.h"
> > +#include "qemu/error-report.h"
> > #include "qemu/queue.h"
> > #include "block/block.h"
> > #include "block/raw-aio.h"
> > -- 
> > 2.25.1
> > 
> > 
> 
> Thanks for the fix:
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks, applied to the block branch.

Kevin



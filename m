Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B94A5EB9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 15:58:37 +0100 (CET)
Received: from localhost ([::1]:42598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEuc8-0006wn-Ck
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 09:58:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsRU-0007gD-Hl
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsRQ-0001hy-SI
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643719164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QdXWEtE719zDIoZwgC24Z3i9KrWnFsAsm5Okw2Z3XTY=;
 b=d6lvAE8BX6Nlg0Ov+ZzHlkaWnPxZ8gXwTcxw+MjLPXk1W9rjbIyrTodvTkb0TeMOyrfTyH
 g0Oc70yrwhG47zc5Xuk2wAxo6ks5psdPe5DGQjXftSESkh5+LxfNrFNz1qayy1e+Ly0YUT
 cVPcQP5PxaX1J14hB1a44ZgdTrv/MPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-xxLJ6cl2Pn-KKfejR9g7oA-1; Tue, 01 Feb 2022 07:39:21 -0500
X-MC-Unique: xxLJ6cl2Pn-KKfejR9g7oA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42AF58519E2;
 Tue,  1 Feb 2022 12:39:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C86E6E1E7;
 Tue,  1 Feb 2022 12:39:19 +0000 (UTC)
Date: Tue, 1 Feb 2022 13:39:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH] block.h: remove outdated comment
Message-ID: <Yfkp9WicLbTTBG8n@redhat.com>
References: <20220131125615.74612-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131125615.74612-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 31.01.2022 um 13:56 hat Emanuele Giuseppe Esposito geschrieben:
> The comment "disk I/O throttling" doesn't make any sense at all
> any more. It was added in commit 0563e191516 to describe
> bdrv_io_limits_enable()/disable(), which were removed in commit
> 97148076, so the comment is just a forgotten leftover.
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Thanks, applied to the block branch.

Kevin



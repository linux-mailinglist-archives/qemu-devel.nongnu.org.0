Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E71358A50
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:56:56 +0200 (CEST)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXxf-0005TA-6I
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUXvN-0004YM-14; Thu, 08 Apr 2021 12:54:34 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:40184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUXvF-00063A-9e; Thu, 08 Apr 2021 12:54:32 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 4940A2E1689;
 Thu,  8 Apr 2021 19:54:20 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 BLkwvGGf4p-sJ0uNW2h; Thu, 08 Apr 2021 19:54:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617900860; bh=Erq6VkXWo6+epZ2RMeAm4koN7n6BK1lxvtMFhXmEqys=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=L+H9nwBmMjBiIpJhtaepeKmaJ2MMRMTAOOVQIlfmQHSDY/XuXNUhzLsH+Lh1B7Mcx
 2hjP/TGkp3JxJLXiEa4+bcP+PYnvBOK5jWvZ0vTysxRxIMr1xhmN9YAmFmm0+js2Wn
 4H5acGb+0Mn5j79cVIH6iN1sG8hiXNKJrZPpSUys=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 kmg8NatmVm-sJp4flOZ; Thu, 08 Apr 2021 19:54:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 8 Apr 2021 19:54:16 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 08/10] block/nbd: rename NBDConnectThread to
 NBDClientConnection
Message-ID: <YG81OIVRe19zZ6ec@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
 <20210408140827.332915-9-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408140827.332915-9-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 05:08:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are going to move connection code to own file and want clear names
> and APIs.
> 
> The structure is shared between user and (possibly) several runs of
> connect-thread. So it's wrong to call it "thread". Let's rename to
> something more generic.
> 
> Appropriately rename connect_thread and thr variables to conn.
> 
> connect_thread_state_unref() function gets new appropriate name too
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 127 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 63 insertions(+), 64 deletions(-)

[To other reviewers: in addition to renaming there's one blank line
removed, hence the difference between (+) and (-)]

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A79A64F067
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 18:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6EY1-00012Q-Ua; Fri, 16 Dec 2022 12:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6EXn-0000zd-OF; Fri, 16 Dec 2022 12:30:52 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6EXi-0000aR-S6; Fri, 16 Dec 2022 12:30:46 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id CC1955E6D8;
 Fri, 16 Dec 2022 20:30:31 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58d::1:2b] (unknown
 [2a02:6b8:b081:b58d::1:2b])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 UUlG0G0OGuQ1-1RVIcjHw; Fri, 16 Dec 2022 20:30:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1671211831; bh=BUib1N3+wFMH+P3ysjzzkxKDl/X5HSyaKpXU/Ic3gW8=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=VH6r6/B/xvkhZuTTEn+w7KtEc/w1zeDDzM1VjMBzhH9hxyAZbHyGFnYhy7nhIGDkg
 O76U6cI1Rqwx3WsSKJ/i7F5TWGq16PuZct1eYHGYSllNVHyvfMhtvOCgh/KEAJ1GVs
 zHiOxJdbVdTxINMQGaA++8M+K/3rKGHr7/OnQqJ0=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f39e40f2-981a-dc14-eaee-6e2f05ab475a@yandex-team.ru>
Date: Fri, 16 Dec 2022 20:30:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 14/14] block: Rename newly converted BlockDriver IO
 coroutine functions
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, eesposit@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221213085320.95673-1-kwolf@redhat.com>
 <20221213085320.95673-15-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221213085320.95673-15-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/13/22 11:53, Kevin Wolf wrote:
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index 4265ca125e..d8e199d59c 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -1076,7 +1076,7 @@ static BlockDriver bdrv_blkdebug = {
>       .bdrv_reopen_prepare    = blkdebug_reopen_prepare,
>       .bdrv_child_perm        = blkdebug_child_perm,
>   
> -    .bdrv_getlength         = blkdebug_getlength,
> +    .bdrv_co_getlength      = blkdebug_getlength,

To follow usual practice, we should also rename blkdebug_getlength, IMHO

-- 
Best regards,
Vladimir



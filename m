Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB266C1161
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 13:01:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peEBY-0008Nz-SD; Mon, 20 Mar 2023 08:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1peEBQ-0008MN-Sv; Mon, 20 Mar 2023 08:00:12 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1peEBO-0000Yz-MU; Mon, 20 Mar 2023 08:00:12 -0400
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:5708:0:640:5704:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id CB4B1602CB;
 Mon, 20 Mar 2023 14:59:57 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b71c::1:38] (unknown
 [2a02:6b8:b081:b71c::1:38])
 by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id vxmuH11hwiE0-rX7e0dSC; Mon, 20 Mar 2023 14:59:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1679313597; bh=7z+ljWmirFRpRXkXutpVJx8eeQ4kk0buH5EOYZH+ydk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=RIYmyCXPoIbfawBLv6D9Bua4nh8AfUUzosuucATxKAfHNg++Q5NTFrXDcgpvYGnRW
 tUtwTiNDE35XOh25hGbYAg59wBqymMhqizdsJOVeN+a5RuGRvDcKggGqRchQNMdr4S
 hILZplAtsJBC4OEnUY9rrSlbIJzNBzX5eRS2BbTM=
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <fbdd77b6-c95f-8af3-f48e-383974257e82@yandex-team.ru>
Date: Mon, 20 Mar 2023 14:59:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] util/iov: Remove qemu_iovec_init_extended()
Content-Language: en-US
To: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230317175019.10857-1-hreitz@redhat.com>
 <20230317175019.10857-4-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230317175019.10857-4-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17.03.23 20:50, Hanna Czenczek wrote:
> bdrv_pad_request() was the main user of qemu_iovec_init_extended().
> HEAD^ has removed that use, so we can remove qemu_iovec_init_extended()
> now.
> 
> The only remaining user is qemu_iovec_init_slice(), which can easily
> inline the small part it really needs.
> 
> Note that qemu_iovec_init_extended() offered a memcpy() optimization to
> initialize the new I/O vector.  qemu_iovec_concat_iov(), which is used
> to replace its functionality, does not, but calls qemu_iovec_add() for
> every single element.  If we decide this optimization was important, we
> will need to re-implement it in qemu_iovec_concat_iov(), which might
> also benefit its pre-existing users.
> 
> Signed-off-by: Hanna Czenczek<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir



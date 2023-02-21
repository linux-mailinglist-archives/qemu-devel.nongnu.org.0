Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114769E402
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUy8-00072m-GF; Tue, 21 Feb 2023 10:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUUxx-0006Rn-2c; Tue, 21 Feb 2023 10:54:08 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUUxt-0005OR-MT; Tue, 21 Feb 2023 10:54:04 -0500
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:8923:0:640:c717:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id D79A3620C0;
 Tue, 21 Feb 2023 18:53:53 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b584::1:19] (unknown
 [2a02:6b8:b081:b584::1:19])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id qrsOC10KaeA0-WrTA4cWR; Tue, 21 Feb 2023 18:53:52 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass
Message-ID: <88062c49-f955-8a11-0a0b-d986cac2ef32@yandex-team.ru>
Date: Tue, 21 Feb 2023 18:53:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 0/5] block: refactor blockdev transactions
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 alexander.ivanov@virtuozzo.com, den@openvz.org
References: <20230221155051.746312-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230221155051.746312-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
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

On 21.02.23 18:50, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> v7: fixed my email, sorry for the noise.

Ohh. fixed in s-o-b, but not in "Author: ". :). Will fix on next version to avoid one more extra resend. Please don't merge with wrong emails.

> 
> That's a next portion of old good
> "[PATCH v5 00/45] Transactional block-graph modifying API", rebased to
> master.
> 
> Now, refactor QMP transactions implementation into new (relatively)
> transaction API.
> 
> Vladimir Sementsov-Ogievskiy (5):
>    blockdev: refactor transaction to use Transaction API
>    blockdev: transactions: rename some things
>    blockdev: qmp_transaction: refactor loop to classic for
>    blockdev: transaction: refactor handling transaction properties
>    blockdev: qmp_transaction: drop extra generic layer
> 
>   blockdev.c | 612 ++++++++++++++++++++++-------------------------------
>   1 file changed, 255 insertions(+), 357 deletions(-)
> 

-- 
Best regards,
Vladimir



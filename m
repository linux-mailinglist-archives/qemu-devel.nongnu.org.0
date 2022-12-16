Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271464EFD9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:56:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6E0Y-0002mi-Pu; Fri, 16 Dec 2022 11:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6E0K-0002lc-8X; Fri, 16 Dec 2022 11:56:14 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6E0D-0000Za-Do; Fri, 16 Dec 2022 11:56:10 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 430335FF2F;
 Fri, 16 Dec 2022 19:55:42 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58d::1:2b] (unknown
 [2a02:6b8:b081:b58d::1:2b])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ftkD1A0Qf8c1-lpT15qqx; Fri, 16 Dec 2022 19:55:41 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1671209741; bh=xP3jAEiM9jEZQ/xfuzsAi2kcFLHgg7Iv89pNOIBQRWE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=JagO26c5lgCjh70MS6WfIqJ+bm+TZ3SmVT7/AVVzKTLSXXTgYGQ+TAkRZwA00RG3A
 w5bnhn4UNAycPHcrRCWuTu7FXwHvKOEhNZcHfIMcAhllvqYAZlFV7Wigejk1h6hMS1
 f75TRvUeH8XP0VS1YDlHI0PaJVeXQxWAWyQw3NbE=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a86911eb-d298-a3fc-05ba-5ffef31d9b87@yandex-team.ru>
Date: Fri, 16 Dec 2022 19:55:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/14] block: Rename refresh_total_sectors to
 bdrv_refresh_total_sectors
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, eesposit@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221213085320.95673-1-kwolf@redhat.com>
 <20221213085320.95673-5-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221213085320.95673-5-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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
> From: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> 
> The name is not good, not the least because we are going to convert this
> to a generated co_wrapper, which adds a _co infix after the first part
> of the name.
> 
> No functional change intended.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir



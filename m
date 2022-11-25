Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11EC638EEF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:22:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycOY-00084E-1f; Fri, 25 Nov 2022 12:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oycOU-00082s-Cu; Fri, 25 Nov 2022 12:21:42 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oycOR-0000jR-CS; Fri, 25 Nov 2022 12:21:42 -0500
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 03D4F5F10B;
 Fri, 25 Nov 2022 20:21:19 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id HLQos10Nq8c1-b25uDXGJ; Fri, 25 Nov 2022 20:21:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669396878; bh=+NS0hbMvLjrB/FgcdvhEdYRBVXFEgnnRRHO9vWgv3s8=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=U4I/PVnSCZLeoJRysCSMiDVbztI4YIU1bHZew4kkmSIGG/E5mLmE+8KC1PzA4veEl
 REGYNmQ7G71AuIbR8MqLLbxEWs1ggtYBAqerKod7rWUqhnu8BzNetlgf77lrhAfwid
 oHqK5hBgiAKllJR06DVD86++UpbGgw8Jcp7N9nzU=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e5363743-5404-e22a-dc9a-7e849f54362d@yandex-team.ru>
Date: Fri, 25 Nov 2022 20:21:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 05/14] block/vmdk: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20221125133518.418328-1-eesposit@redhat.com>
 <20221125133518.418328-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221125133518.418328-6-eesposit@redhat.com>
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

On 11/25/22 16:35, Emanuele Giuseppe Esposito wrote:
> These functions end up calling bdrv_create() implemented as generated_co_wrapper
> functions.
> In addition, they also happen to be always called in coroutine context,
> meaning all callers are coroutine_fn.
> This means that the g_c_w function will enter the qemu_in_coroutine()
> case and eventually suspend (or in other words call qemu_coroutine_yield()).
> Therefore we need to mark such functions coroutine_fn too.

same as 02 and 03

> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> Reviewed-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Kevin Wolf<kwolf@redhat.com>



Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


-- 
Best regards,
Vladimir



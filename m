Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ABF5EA0ED
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:43:16 +0200 (CEST)
Received: from localhost ([::1]:46494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclZz-0006hh-QC
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ockzV-00014z-RV; Mon, 26 Sep 2022 06:05:33 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:42462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ockzS-0005Gk-1l; Mon, 26 Sep 2022 06:05:32 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 3474B2E0F64;
 Mon, 26 Sep 2022 13:05:16 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b683::1:39] (unknown
 [2a02:6b8:b081:b683::1:39])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 MHBTArLOuU-5FPm7l3F; Mon, 26 Sep 2022 13:05:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1664186715; bh=fZM910odFfpMb5G6+gEsn2vWLLtQawXJgNgrfG5LJnc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=kuCfkMpj38OOcOzcMWWv8671TOzYh4WtRhuNKY7by1yqUEBXVWDlEkm61wnT1ZcAw
 CI9k/G/U45lZunir/VHLYqGAtSS/CFQFlMX0RE/86Uo0zCfBA8yOZtQ7/iqgcnzcf6
 XqieelspoOWFF0paY/qEvziF6wXiLBzB1Fs0Kwn0=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <2718426c-dd89-5b50-29c4-63f0d6c9b25f@yandex-team.ru>
Date: Mon, 26 Sep 2022 13:05:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] qemu-nbd: set timeout to qemu-nbd socket
Content-Language: en-US
To: luzhipeng <luzhipeng@cestc.cn>, qemu-devel <qemu-devel@nongnu.org>
Cc: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@virtuozzo.com>
References: <20220925135308.481-1-luzhipeng@cestc.cn>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220925135308.481-1-luzhipeng@cestc.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.766,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[+ Den]

On 9/25/22 16:53, luzhipeng wrote:
> From: lu zhipeng <luzhipeng@cestc.cn>
> 
> Prevent the NBD socket stuck all the time, So
> set timeout.
> 
> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
> ---
>   nbd/client.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/nbd/client.c b/nbd/client.c
> index 30d5383cb1..89dde53a0f 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -24,6 +24,8 @@
>   #include "nbd-internal.h"
>   #include "qemu/cutils.h"
>   
> +#define NBD_DEFAULT_TIMEOUT 30
> +
>   /* Definitions for opaque data types */
>   
>   static QTAILQ_HEAD(, NBDExport) exports = QTAILQ_HEAD_INITIALIZER(exports);
> @@ -1301,6 +1303,12 @@ int nbd_init(int fd, QIOChannelSocket *sioc, NBDExportInfo *info,
>           }
>       }
>   
> +    if (ioctl(fd, NBD_SET_TIMEOUT, NBD_DEFAULT_TIMEOUT) < 0) {
> +        int serrno = errno;
> +        error_setg(errp, "Failed setting timeout");
> +        return -serrno;
> +    }
> +
>       trace_nbd_init_finish();
>   
>       return 0;


Personally, I don't see a problem in enabling timeout by default.. But probably we need a new option instead?


-- 
Best regards,
Vladimir


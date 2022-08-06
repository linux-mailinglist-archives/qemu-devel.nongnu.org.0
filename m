Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B5D58B852
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 22:58:12 +0200 (CEST)
Received: from localhost ([::1]:58698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKQs7-0001LZ-1a
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 16:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oKQqe-0008Hu-Ru; Sat, 06 Aug 2022 16:56:40 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:48012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oKQqb-0002uA-3o; Sat, 06 Aug 2022 16:56:39 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 0663E2E0346;
 Sat,  6 Aug 2022 23:56:22 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:215::1:1d] (unknown
 [2a02:6b8:b081:215::1:1d])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 zj4IVlKAnv-uKPaMtHV; Sat, 06 Aug 2022 23:56:21 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1659819381; bh=wnMr0fAw483Xt4fw25SvZQ/bRVBbPHKeVs0h2Ihf5yQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=pfMK9BEeFRqp4ZYmvIeW2AjUaQkVr6tDW7apL5eEjcf7XnBSgyWuHLP1vDh1078Dv
 7VILtXnt+I9H32f+l4UhTw8u7vBsSik7bWNEOJMMn5fjQuGvEKH4yxYTaiMubVjRJq
 hR5fgiW+IFl9vLr+qHW4Csreq7aC+pDrD/+PEYOw=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <da4a04cf-0353-1310-96d0-fb730811fc2a@yandex-team.ru>
Date: Sat, 6 Aug 2022 23:56:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] iotests, parallels: Add a test for duplicated
 clusters
Content-Language: en-US
To: alexander.ivanov@virtuozzo.com, qemu-devel@nongnu.org
Cc: den@virtuozzo.com, natalia.kuzmina@openvz.org, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
References: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
 <20220805154752.799395-4-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220805154752.799395-4-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/5/22 18:47, alexander.ivanov@virtuozzo.com wrote:
> From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> 
> Check if original and duplicated offsets refer to the same cluster.
> Repair the image and check that writing to a referred cluster
> doesn't affects another referred cluster.
> 
> Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   tests/qemu-iotests/314                        |  89 ++++++++++++++++++

New tests should be added to tests/qemu-iotests/tests with good file names.

>   tests/qemu-iotests/314.out                    |  36 +++++++
>   .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
>   3 files changed, 125 insertions(+)
>   create mode 100755 tests/qemu-iotests/314
>   create mode 100644 tests/qemu-iotests/314.out
>   create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2
> 
> diff --git a/tests/qemu-iotests/314 b/tests/qemu-iotests/314
> new file mode 100755
> index 0000000000..79b4d3a749
> --- /dev/null
> +++ b/tests/qemu-iotests/314
> @@ -0,0 +1,89 @@
> +#!/usr/bin/env bash
> +# group: rw auto quick
> +#

[..]

> +
> +#read one cluster from original offset
> +$QEMU_IO -c "read -P 0x55 0 $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +#read copied data from new offset
> +$QEMU_IO -c "read -P 0x55 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +#change data from original offset
> +$QEMU_IO -c "write -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io
> +#read from new offset (fail, now this data was left unchanged)
> +$QEMU_IO -c "read -P 0x11 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
> +    _filter_qemu_io

Maybe, add also read -P 0x55 for 4th cluster, to be sure that it's really unchanged.
And maybe read 0x11 for 0th cluster, to be sure that it's really rewritten.

> +
> +echo
> +echo
> +# success, all done
> +echo "*** done"
> +rm -f $seq.full
> +status=0

[..]

> zcmZ>Y%CIzaj8qGboOfsS0tPO%`U`(O5*Pv)I2hO&I2yDPt~od`068263_Exd7-leV
> zwiz(^Ft8k0sa3TsBZG0}Vv}35zt?O%VET5A+3Q2o4%bdpm~pLC^&`WR2CW6$VGH;&
> vm{u|@;OhXBE0|U>d|v){U)AOQJ)h70iu-<&;S?CYW~db}a<vGU0CEKYoE$uo
> 
> literal 0
> HcmV?d00001
> 

With at least new test renamed and moved to tests/qemu-iotests/tests:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66233AE31
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:08:29 +0100 (CET)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjD9-0004kp-JQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lLjBi-0003xJ-Eo; Mon, 15 Mar 2021 05:06:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lLjBg-000378-5U; Mon, 15 Mar 2021 05:06:58 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DzVqX5pBpz8yVd;
 Mon, 15 Mar 2021 17:04:56 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 17:05:43 +0800
Subject: Re: [PATCH 0/3] hw: Constify VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210313171150.2122409-1-f4bug@amsat.org>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <bd47e690-dab6-e8db-2d8c-aa729c41abad@huawei.com>
Date: Mon, 15 Mar 2021 17:05:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210313171150.2122409-1-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

It seems that vmstate_ecc_state and vmstate_x86_cpu can also be constified.
Found by <git grep "VMStateDescription" | grep -v "const">.

Thanks,
Keqian

On 2021/3/14 1:11, Philippe Mathieu-Daudé wrote:
> VMStateDescription isn't supposed to be modified.
> 
> 
> 
> Philippe Mathieu-Daudé (3):
> 
>   hw/arm: Constify VMStateDescription
> 
>   hw/display/qxl: Constify VMStateDescription
> 
>   hw/usb: Constify VMStateDescription
> 
> 
> 
>  hw/arm/highbank.c             | 2 +-
> 
>  hw/arm/pxa2xx_pic.c           | 2 +-
> 
>  hw/arm/spitz.c                | 4 ++--
> 
>  hw/arm/strongarm.c            | 2 +-
> 
>  hw/arm/z2.c                   | 4 ++--
> 
>  hw/display/qxl.c              | 8 ++++----
> 
>  hw/dma/pxa2xx_dma.c           | 4 ++--
> 
>  hw/misc/mst_fpga.c            | 2 +-
> 
>  hw/usb/ccid-card-passthru.c   | 2 +-
> 
>  hw/usb/dev-smartcard-reader.c | 8 ++++----
> 
>  10 files changed, 19 insertions(+), 19 deletions(-)
> 
> 
> 


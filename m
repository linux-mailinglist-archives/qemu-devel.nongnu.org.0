Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085DE53580C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 05:34:41 +0200 (CEST)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuQkJ-0004S2-L5
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 23:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1nuQhS-0002DU-FT; Thu, 26 May 2022 23:31:42 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1nuQhE-0004je-5O; Thu, 26 May 2022 23:31:41 -0400
Received: from kwepemi500017.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L8VfX0JX9zfZMy;
 Fri, 27 May 2022 11:29:40 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 kwepemi500017.china.huawei.com (7.221.188.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 11:31:13 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 11:31:12 +0800
Subject: Re: [PATCH] target/arm/hvf: Include missing "cpregs.h"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@fungible.com>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Alexander Graf
 <agraf@csgraf.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, 
 Duncan Bayne <duncan@bayne.id.au>
References: <20220525161926.34233-1-philmd@fungible.com>
Message-ID: <5dacd767-6e69-64ed-7ca5-f9fbf8b36acd@huawei.com>
Date: Fri, 27 May 2022 11:31:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20220525161926.34233-1-philmd@fungible.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>

On 2022/5/26 0:19, Philippe Mathieu-Daudé wrote:
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 86710509d2..1fdc5eef92 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -17,6 +17,7 @@
>  #include "sysemu/hvf_int.h"
>  #include "sysemu/hw_accel.h"
>  #include "hvf_arm.h"
> +#include "cpregs.h"

Compile tested on my MacBook, thanks.

P.S., Looks like we don't need to include "target/arm/cpu.h"
explicitly in hvf.c.


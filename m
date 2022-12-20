Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88F6517A4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 02:14:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7RB7-0003n4-Q7; Mon, 19 Dec 2022 20:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p7RB3-0003mm-84
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 20:12:18 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p7RB0-0006q4-Fp
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 20:12:17 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R431e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VXipyY2_1671498722; 
Received: from 30.121.5.86(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VXipyY2_1671498722) by smtp.aliyun-inc.com;
 Tue, 20 Dec 2022 09:12:02 +0800
Message-ID: <b674a0e9-28a7-76b6-d1a1-d34807a803de@linux.alibaba.com>
Date: Tue, 20 Dec 2022 09:11:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/11] contrib/gitdm: add C-Sky to the domain map
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Guo Ren <ren_guo@c-sky.com>, Liu Zhiwei <zhiwei_liu@c-sky.com>,
 guo_ren@linux.alibaba.com
References: <20221219121914.851488-1-alex.bennee@linaro.org>
 <20221219121914.851488-2-alex.bennee@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221219121914.851488-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
X-Spam_score_int: -109
X-Spam_score: -11.0
X-Spam_bar: -----------
X-Spam_report: (-11.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

The c-sky domain mail is no longer being used for Guo Ren and me.

C-SKY company and C-SKY arch is still existing, but its website domain 
has been moved to https://www.t-head.cn/.

Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>


Thanks,
Zhiwei

On 2022/12/19 20:19, Alex Bennée wrote:
> Although the majority of the recent work has been done by LIU Zhiwei
> it does appear to be a corporate effort.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Guo Ren <ren_guo@c-sky.com>
> Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   contrib/gitdm/domain-map | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 3727918641..6f3a24b399 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -7,6 +7,7 @@
>   amd.com         AMD
>   baidu.com       Baidu
>   bytedance.com   ByteDance
> +c-sky.com       C-Sky
>   cmss.chinamobile.com China Mobile
>   citrix.com      Citrix
>   crudebyte.com   Crudebyte


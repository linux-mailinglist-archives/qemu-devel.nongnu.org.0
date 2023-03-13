Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BED6B6D0B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 02:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbWsW-0007JV-Rq; Sun, 12 Mar 2023 21:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pbWsP-0007I6-Jg
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 21:21:25 -0400
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pbWsM-0003Rw-FW
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 21:21:25 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VdeQAqF_1678670467; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdeQAqF_1678670467) by smtp.aliyun-inc.com;
 Mon, 13 Mar 2023 09:21:07 +0800
Message-ID: <b59cc6fe-b10f-c737-f022-07864c4a8852@linux.alibaba.com>
Date: Mon, 13 Mar 2023 09:21:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/10] contrib/gitdm: add Alibaba to the domain-map
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-8-alex.bennee@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230310180332.2274827-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


On 2023/3/11 2:03, Alex Bennée wrote:
> This replaces the previous attempt to add c-sky.com so I've dropped
> the review/ack tags. Group everything under Alibaba now.
>
> Added as requested by LIU Zhiwei.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Cc: Guo Ren <guoren@kernel.org>
> ---
>   contrib/gitdm/domain-map        | 1 +
>   contrib/gitdm/group-map-alibaba | 7 +++++++
>   gitdm.config                    | 1 +
>   3 files changed, 9 insertions(+)
>   create mode 100644 contrib/gitdm/group-map-alibaba
>
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 0261533990..e678c23a9c 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -4,6 +4,7 @@
>   # This maps email domains to nice easy to read company names
>   #
>   
> +linux.alibaba.com Alibaba
>   amazon.com      Amazon
>   amazon.co.uk    Amazon
>   amd.com         AMD
> diff --git a/contrib/gitdm/group-map-alibaba b/contrib/gitdm/group-map-alibaba
> new file mode 100644
> index 0000000000..0ebbe6b06e
> --- /dev/null
> +++ b/contrib/gitdm/group-map-alibaba
> @@ -0,0 +1,7 @@
> +#
> +# Alibaba contributors including its subsidiaries
> +#
> +
> +# c-sky.com, now part of T-Head, wholly-owned entity of Alibaba Group
> +ren_guo@c-sky.com
> +zhiwei_liu@c-sky.com
> diff --git a/gitdm.config b/gitdm.config
> index 4b52ee47be..6908ddbd19 100644
> --- a/gitdm.config
> +++ b/gitdm.config
> @@ -31,6 +31,7 @@ EmailMap contrib/gitdm/domain-map
>   # identifiable corporate emails. Please keep this list sorted.
>   #
>   
> +GroupMap contrib/gitdm/group-map-alibaba Alibaba

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
>   GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
>   GroupMap contrib/gitdm/group-map-facebook Facebook


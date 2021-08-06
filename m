Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB883E261A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 10:29:08 +0200 (CEST)
Received: from localhost ([::1]:54828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBvE3-0000QJ-9M
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 04:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mBvCy-0007qD-0I
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:28:00 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mBvCu-0005OX-Hd
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:27:59 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ggz682GrLzZy6F;
 Fri,  6 Aug 2021 16:24:16 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 6 Aug 2021 16:27:51 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 6 Aug 2021 16:27:50 +0800
Subject: Re: [PATCH for-6.1 v5 1/1] machine: Disallow specifying topology
 parameters as zero
To: <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210723095731.4976-1-wangyanan55@huawei.com>
 <20210723095731.4976-2-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <45af8039-09ea-b976-f02b-f636933f6302@huawei.com>
Date: Fri, 6 Aug 2021 16:27:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210723095731.4976-2-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia
 Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A gentle ping ...

Will this patch be picked up soon for 6.1 or is there anything else to 
tweak?

Thanks,
Yanan

On 2021/7/23 17:57, Yanan Wang wrote:
> In the SMP configuration, we should either specify a topology
> parameter with a reasonable value (equal to or greater than 1)
> or just leave it omitted and QEMU will calculate its value.
> Configurations which explicitly specify the topology parameters
> as zero like "sockets=0" are meaningless, so disallow them.
>
> However, the commit 1e63fe685804d
> (machine: pass QAPI struct to mc->smp_parse) has documented that
> '0' has the same semantics as omitting a parameter in the qapi
> comment for SMPConfiguration. So this patch fixes the doc and
> also adds the corresponding sanity check.
>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> Tested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   hw/core/machine.c | 14 ++++++++++++++
>   qapi/machine.json |  6 +++---
>   qemu-options.hx   | 12 +++++++-----
>   3 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 775add0795..e1533dfc47 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -829,6 +829,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>           return;
>       }
>   
> +    /*
> +     * The CPU topology parameters must be specified greater than zero or
> +     * just omitted, explicit configuration like "cpus=0" is not allowed.
> +     */
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        error_setg(errp, "CPU topology parameters must be greater than zero");
> +        goto out_free;
> +    }
> +
>       mc->smp_parse(ms, config, errp);
>       if (errp) {
>           goto out_free;
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb..9272cb3cf8 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1288,8 +1288,8 @@
>   ##
>   # @SMPConfiguration:
>   #
> -# Schema for CPU topology configuration.  "0" or a missing value lets
> -# QEMU figure out a suitable value based on the ones that are provided.
> +# Schema for CPU topology configuration. A missing value lets QEMU
> +# figure out a suitable value based on the ones that are provided.
>   #
>   # @cpus: number of virtual CPUs in the virtual machine
>   #
> @@ -1297,7 +1297,7 @@
>   #
>   # @dies: number of dies per socket in the CPU topology
>   #
> -# @cores: number of cores per thread in the CPU topology
> +# @cores: number of cores per die in the CPU topology
>   #
>   # @threads: number of threads per core in the CPU topology
>   #
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 99ed5ec5f1..e077aa80bf 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -223,11 +223,13 @@ SRST
>       of computing the CPU maximum count.
>   
>       Either the initial CPU count, or at least one of the topology parameters
> -    must be specified. Values for any omitted parameters will be computed
> -    from those which are given. Historically preference was given to the
> -    coarsest topology parameters when computing missing values (ie sockets
> -    preferred over cores, which were preferred over threads), however, this
> -    behaviour is considered liable to change.
> +    must be specified. The specified parameters must be greater than zero,
> +    explicit configuration like "cpus=0" is not allowed. Values for any
> +    omitted parameters will be computed from those which are given.
> +    Historically preference was given to the coarsest topology parameters
> +    when computing missing values (ie sockets preferred over cores, which
> +    were preferred over threads), however, this behaviour is considered
> +    liable to change.
>   ERST
>   
>   DEF("numa", HAS_ARG, QEMU_OPTION_numa,



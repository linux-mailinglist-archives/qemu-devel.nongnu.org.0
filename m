Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A63B5F56
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:47:23 +0200 (CEST)
Received: from localhost ([::1]:44500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrbe-0006Ye-MB
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lxram-0005pT-EP
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:46:28 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lxrai-0008Iq-52
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:46:28 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GD81s5DMyz758J;
 Mon, 28 Jun 2021 21:42:57 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 21:46:17 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 21:46:17 +0800
Subject: Re: [PATCH 4/4] qemu-options: rewrite help for -smp options
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20210628113047.462498-1-berrange@redhat.com>
 <20210628113047.462498-5-berrange@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <0fe6ae73-62f2-569b-1e9d-04bd7da7458a@huawei.com>
Date: Mon, 28 Jun 2021 21:46:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210628113047.462498-5-berrange@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On 2021/6/28 19:30, Daniel P. Berrangé wrote:
> The -smp option help is peculiarly specific about mentioning the CPU
> upper limits, but these are wrong. The "PC" target has varying max
> CPU counts depending on the machine type picked. Notes about guest
> OS limits are inappropriate for QEMU docs. There are way too many
> machine types for it to be practical to mention actual limits, and
> some limits are even modified by downstream distribtions. Thus it
> is better to remove the specific limits entirely.
>
> The CPU topology reporting is also not neccessarily specific to the
> PC platform and descriptions around the rules of usage are somewhat
> terse. Expand this information with some examples to show effects
> of defaulting.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   qemu-options.hx | 29 +++++++++++++++++++++--------
>   1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5871df7291..0021e9ec7b 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -207,14 +207,27 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
>           QEMU_ARCH_ALL)
>   SRST
>   ``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
> -    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
> -    are supported. On Sparc32 target, Linux limits the number of usable
> -    CPUs to 4. For the PC target, the number of cores per die, the
> -    number of threads per cores, the number of dies per packages and the
> -    total number of sockets can be specified. Missing values will be
> -    computed. If any on the three values is given, the total number of
> -    CPUs n can be omitted. maxcpus specifies the maximum number of
> -    hotpluggable CPUs.
> +    Simulate an SMP system with '\ ``n``\ ' CPUs initially present on
Should be "a SMP system".
> +    the machine type board. On boards supporting CPU hotplug, the optional
> +    '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
> +    added at runtime. If omitted the maximum number of CPUs will be
> +    set to match the initial CPU count. Both parameters are subject to
> +    an upper limit that is determined by the specific machine type chosen.
> +
> +    To control reporting of CPU topology information, the number of sockets,
> +    dies per socket, cores per die, and threads per core can be specified.
> +    The sum `` sockets * cores * dies * threads `` must be equal to the
> +    maximum CPU count. CPU targets may only support a subset of the topology
> +    parameters. Where a CPU target does not support use of a particular
> +    topology parameter, its value should be assumed to be 1 for the purpose
> +    of computing the CPU maximum count.
> +
Explicitly saying "sockets * dies * cores * threads" seems not 
arch-neutral at
first glance, although we have the explanation behind. How about the
following statement for this paragraph?

"
To control reporting of CPU topology information, at most the number of 
sockets,
dies per socket, cores per die, and threads per core can be specified. 
CPU targets
may only support a subset of the topology parameters. If a CPU target 
does not
support use of a particular topology parameter, it must not be 
specified. The sum
of the supported subset of parameters must be equal to the maximum CPU 
count.
"

I think this also make it easier to expand if we are going to add one 
more topology
parameter, e.g, cluster, in the future.
> +    Either the initial CPU count, or at least one of the topology parameters
> +    must be specified. Values for any omitted parameters will be computed
> +    from those which are given. Historically preference was given to the
> +    coarsest topology parameters when computing missing values (ie sockets
> +    preferred over cores, which were preferred over threads), however, this
> +    behaviour is considered liable to change.
>   ERST
>   
>   DEF("numa", HAS_ARG, QEMU_OPTION_numa,
Thanks,
Yanan
.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE8F3B5DF1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:26:19 +0200 (CEST)
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqLC-00041s-3J
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lxqGl-0007w9-Jm
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:21:43 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lxqGi-0008H9-Ou
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:21:43 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GD6840RZlz75Dd;
 Mon, 28 Jun 2021 20:18:12 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 20:21:31 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 20:21:31 +0800
Subject: Re: [PATCH 2/4] qemu-options: re-arrange CPU topology options
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20210628113047.462498-1-berrange@redhat.com>
 <20210628113047.462498-3-berrange@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <a6b9443f-59f7-9f7c-00ef-55b886b1e54c@huawei.com>
Date: Mon, 28 Jun 2021 20:21:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210628113047.462498-3-berrange@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
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


On 2021/6/28 19:30, Daniel P. Berrangé wrote:
> The list of CPU topology options are presented in a fairly arbitrary
> order currently. Re-arrange them so that they're ordered from largest to
> smallest unit
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   qemu-options.hx | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ba3ca9da1d..aa33dfdcfd 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -196,17 +196,17 @@ SRST
>   ERST
>   
>   DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
> +    "-smp [cpus=]n[,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
>       "                set the number of CPUs to 'n' [default=1]\n"
>       "                maxcpus= maximum number of total cpus, including\n"
nit: There are always "CPUs" elsewhere, it's better to also use "total 
CPUs" here.
>       "                offline CPUs for hotplug, etc\n"
> +    "                sockets= number of discrete sockets in the system\n",
> +    "                dies= number of CPU dies on one socket (for PC only)\n"
>       "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
>       "                threads= number of threads on one CPU core\n"
> -    "                dies= number of CPU dies on one socket (for PC only)\n"
> -    "                sockets= number of discrete sockets in the system\n",
>           QEMU_ARCH_ALL)
>   SRST
> -``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
> +``-smp [cpus=]n[,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
>       Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
>       are supported. On Sparc32 target, Linux limits the number of usable
>       CPUs to 4. For the PC target, the number of cores per die, the
This improves the readability a lot,

Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
.


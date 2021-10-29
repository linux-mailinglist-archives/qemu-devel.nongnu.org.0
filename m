Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5495543FC67
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 14:37:05 +0200 (CEST)
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgR83-0004Hy-TQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 08:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mgR2e-0002fU-8e
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:31:31 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mgR2a-00037c-LJ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:31:27 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HghbT3dkTz90WX;
 Fri, 29 Oct 2021 20:30:29 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 29 Oct 2021 20:30:34 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 29 Oct 2021 20:30:33 +0800
Subject: Re: [PATCH 1/4] hw/core: Restrict sysemu specific files
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211028150521.1973821-1-philmd@redhat.com>
 <20211028150521.1973821-2-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <5993f63d-ee78-daba-202a-df4f4ab6a604@huawei.com>
Date: Fri, 29 Oct 2021 20:30:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211028150521.1973821-2-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.512,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/10/28 23:05, Philippe Mathieu-Daudé wrote:
> All these files don't make sense for tools and user emulation,
> restrict them to system emulation.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/core/meson.build | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 18f44fb7c24..a829cc4245b 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -14,15 +14,15 @@
>   )
>   
>   common_ss.add(files('cpu-common.c'))
> -common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
> -common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
> -common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
> -common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
> -common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
> -common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
> -common_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
> -common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
> -common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
> +softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
> +softmmu_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
> +softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
> +softmmu_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
> +softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
> +softmmu_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
> +softmmu_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
> +softmmu_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
> +softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
>   
>   softmmu_ss.add(files(
>     'cpu-sysemu.c',
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan


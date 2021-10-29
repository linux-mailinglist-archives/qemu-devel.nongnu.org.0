Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D743FCB8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 14:54:12 +0200 (CEST)
Received: from localhost ([::1]:43036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgROd-00028S-Fy
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 08:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mgRM9-0000PN-H5
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:51:37 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mgRM3-0004AY-PH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:51:36 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hgj1J1lJJz1DHnX;
 Fri, 29 Oct 2021 20:49:24 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 29 Oct 2021 20:51:22 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 29 Oct 2021 20:51:22 +0800
Subject: Re: [PATCH 2/4] hw/core: Declare meson source set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211028150521.1973821-1-philmd@redhat.com>
 <20211028150521.1973821-3-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <95b61820-0094-8b96-2e82-72170742c1ca@huawei.com>
Date: Fri, 29 Oct 2021 20:51:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211028150521.1973821-3-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.512,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/10/28 23:05, Philippe Mathieu-Daudé wrote:
> As we want to be able to conditionally add files to the hw/core
> file list, use a source set.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   meson.build         | 4 +++-
>   hw/core/meson.build | 4 ++--
>   2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 2c5b53cbe2e..2eb76c187c3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2365,6 +2365,7 @@
>   chardev_ss = ss.source_set()
>   common_ss = ss.source_set()
>   crypto_ss = ss.source_set()
> +hwcore_ss = ss.source_set()
>   io_ss = ss.source_set()
>   linux_user_ss = ss.source_set()
>   qmp_ss = ss.source_set()
> @@ -2805,7 +2806,8 @@
>   
>   chardev = declare_dependency(link_whole: libchardev)
>   
> -libhwcore = static_library('hwcore', sources: hwcore_files + genh,
> +hwcore_ss = hwcore_ss.apply(config_host, strict: false)
> +libhwcore = static_library('hwcore', sources: hwcore_ss.sources() + genh,
>                              name_suffix: 'fa',
>                              build_by_default: false)
>   hwcore = declare_dependency(link_whole: libhwcore)
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index a829cc4245b..4d04069f85f 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -1,5 +1,5 @@
>   # core qdev-related obj files, also used by *-user and unit tests
> -hwcore_files = files(
> +hwcore_ss.add(files(
>     'bus.c',
>     'hotplug.c',
>     'qdev-properties.c',
> @@ -11,7 +11,7 @@
>     'irq.c',
>     'clock.c',
>     'qdev-clock.c',
> -)
> +))
>   
>   common_ss.add(files('cpu-common.c'))
>   softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan


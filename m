Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B793EED81
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:32:05 +0200 (CEST)
Received: from localhost ([::1]:59140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzCG-0002in-Ka
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mFzAL-0001pH-WC
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:30:06 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mFzAH-0007l8-R1
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:30:05 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GpsMD2n8Sz1CXqL;
 Tue, 17 Aug 2021 21:29:28 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 21:29:51 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 21:29:50 +0800
Subject: Re: [PULL 1/1] machine: Disallow specifying topology parameters as
 zero
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210816210603.42337-1-ehabkost@redhat.com>
 <20210816210603.42337-2-ehabkost@redhat.com>
 <CABgObfaWxNsq2i8j6P+oZGFjxyR3MFE9FopHsnvuNAPXa4upYQ@mail.gmail.com>
 <20210817120250.fdpujloefaqtawwo@gator.home>
 <CAFEAcA_fOa4uV3sA5kxJ1gKTGS3ASgvx2+FrG=5cr0wWaQ48-Q@mail.gmail.com>
 <20210817122238.hb2dk2a2zmhqrv7h@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <07d21640-847d-890c-d85d-8fff7cf4abd3@huawei.com>
Date: Tue, 17 Aug 2021 21:29:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210817122238.hb2dk2a2zmhqrv7h@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/8/17 20:22, Andrew Jones wrote:
> On Tue, Aug 17, 2021 at 01:06:19PM +0100, Peter Maydell wrote:
>> On Tue, 17 Aug 2021 at 13:02, Andrew Jones <drjones@redhat.com> wrote:
>>> On Mon, Aug 16, 2021 at 11:37:21PM +0200, Paolo Bonzini wrote:
>>>> How do we know that no one has ever used such configuration? The conversion
>>>> was meant to be bug-compatible.
>>> We don't. But we do know that a zero input value was never documented
>>> prior to 1e63fe68580, which has not yet been released. Can we claim
>>> that an undocumented input value has undefined behavior, giving us
>>> freedom to modify that behavior until it is documented?
>> Dunno; I definitely don't want a behaviour-change patch at this
>> point in the release-cycle, though...
>>
> Can we replace this patch with the following one for now? And then
> discuss this further before committing to supporting a zero input?
Yeah, I think at least the doc needs to be fixed in 6.1.

Then we may think about deprecating this behavior since 6.2,
I have implemented the deprecation locally and it can be post
with the smp parsing improvement series.

Thanks,
Yanan
.
> Thanks,
> drew
>
> Author: Andrew Jones <drjones@redhat.com>
> Date:   Tue Aug 17 14:17:29 2021 +0200
>
>      qapi/machine.json: Remove zero value reference from SMPConfiguration documentation
>      
>      Commit 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
>      introduced documentation stating that a zero input value for an SMP
>      parameter indicates that its value should be automatically configured.
>      This is indeed how things work today, but we'd like to change that.
>      Avoid documenting behaviors we want to leave undefined for the time
>      being, giving us freedom to change it later.
>      
>      Fixes: 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
>      Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb24..157712f00614 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1288,7 +1288,7 @@
>   ##
>   # @SMPConfiguration:
>   #
> -# Schema for CPU topology configuration.  "0" or a missing value lets
> +# Schema for CPU topology configuration.  A missing value lets
>   # QEMU figure out a suitable value based on the ones that are provided.
>   #
>   # @cpus: number of virtual CPUs in the virtual machine
>
> .



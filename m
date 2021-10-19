Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5A743304F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:00:06 +0200 (CEST)
Received: from localhost ([::1]:33414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mck2X-0006tK-RH
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mcjyB-0001bZ-9K; Tue, 19 Oct 2021 03:55:35 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mcjy8-0007qP-9n; Tue, 19 Oct 2021 03:55:34 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HYQsJ23KqzbnLq;
 Tue, 19 Oct 2021 15:50:44 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 19 Oct 2021 15:55:16 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Tue, 19 Oct 2021 15:55:16 +0800
Subject: Re: [PATCH] hw/core/machine: Add the missing delimiter in
 cpu_slot_to_string()
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
References: <20211008075040.18028-1-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <0a3431bc-d9c8-ebfb-da22-ee4c7db339be@huawei.com>
Date: Tue, 19 Oct 2021 15:55:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211008075040.18028-1-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@nongnu.org. What about this simple one ?

Before this patch, with "-smp 4, dies=2" for a PC machine, we will 
generate warn strings like:
qemu-system-x86_64: warning: CPU(s) not present in any NUMA nodes: CPU 0 
[socket-id: 0die-id: 0, core-id: 0, thread-id: 0]

After we will get,
qemu-system-x86_64: warning: CPU(s) not present in any NUMA nodes: CPU 0 
[socket-id: 0, die-id: 0, core-id: 0, thread-id: 0]

Thanks,
Yanan

On 2021/10/8 15:50, Yanan Wang wrote:
> The expected output string from cpu_slot_to_string() ought to be
> like "socket-id: *, die-id: *, core-id: *, thread-id: *", so add
> the missing ", " before "die-id". This affects the readability
> of the error message.
>
> Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   hw/core/machine.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b8d95eec32..0a23ae3106 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1157,6 +1157,9 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>           g_string_append_printf(s, "socket-id: %"PRId64, cpu->props.socket_id);
>       }
>       if (cpu->props.has_die_id) {
> +        if (s->len) {
> +            g_string_append_printf(s, ", ");
> +        }
>           g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>       }
>       if (cpu->props.has_core_id) {



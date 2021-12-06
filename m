Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FD469090
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 07:56:34 +0100 (CET)
Received: from localhost ([::1]:38464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu7vN-00031z-PQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 01:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mu7uS-0002MN-3V
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 01:55:36 -0500
Received: from mail.loongson.cn ([114.242.206.163]:34442 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mu7uP-0006c0-Eu
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 01:55:35 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX8vQs61hGHcDAA--.7872S3;
 Mon, 06 Dec 2021 14:55:12 +0800 (CST)
Subject: Re: [RFC PATCH v3 22/27] hw/loongarch: Add some devices support for
 3A5000.
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-23-git-send-email-yangxiaojuan@loongson.cn>
 <88460ee5-3fc3-b14a-8e37-0e8ba99c115e@amsat.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <b79a5ea6-8cd5-9df2-16d9-92b6b853ac3e@loongson.cn>
Date: Mon, 6 Dec 2021 14:55:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <88460ee5-3fc3-b14a-8e37-0e8ba99c115e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX8vQs61hGHcDAA--.7872S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1kZF13ZF17Ary7ZF1UJrb_yoWkKFb_J3
 W7Aa4kGr1DC3W7WF90qF1rJ34UGa1xJFWfZFZFqrWxX3W5t3yfJw47Gws5Zr15K3yUZrW3
 WrZYyr9akr18ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbq8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 F7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxV
 W8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI2
 0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4
 AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0BTY
 UUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.076,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk, laurent@vivier.eu,
 peterx@redhat.com, gaosong@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, alex.bennee@linaro.org,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/05/2021 01:54 AM, Philippe Mathieu-Daudé wrote:
> On 12/4/21 13:07, Xiaojuan Yang wrote:
>> 1.Add uart,virtio-net,vga and usb for 3A5000.
>> 2.Add irq set and map for the pci host. Non pci device
>> use irq 0-16, pci device use 16-64.
>> 3.Add some unimplented device to emulate guest unused
>> memory space.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  hw/loongarch/Kconfig            |  8 +++++
>>  hw/loongarch/loongson3.c        | 63 +++++++++++++++++++++++++++++++--
>>  hw/pci-host/ls7a.c              | 42 +++++++++++++++++++++-
>>  include/hw/intc/loongarch_ipi.h |  2 ++
>>  include/hw/pci-host/ls7a.h      |  4 +++
>>  softmmu/qdev-monitor.c          |  3 +-
>>  6 files changed, 117 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
>> index 468e3acc74..9ea3b92708 100644
>> --- a/hw/loongarch/Kconfig
>> +++ b/hw/loongarch/Kconfig
>> @@ -1,5 +1,13 @@
>>  config LOONGSON3_LS7A
>>      bool
>> +    imply VGA_PCI
>> +    imply VIRTIO_VGA
>> +    imply PARALLEL
> 
> Is there really a parallel port? If so, maybe you forgot to
> instantiate it.
> 
There is no parallel port, I will fix it, thanks.



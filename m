Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A801436FF0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 04:27:50 +0200 (CEST)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdkHd-0008TU-70
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 22:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mdkFU-0001ZC-16
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:25:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59398 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mdkFQ-0004dL-UG
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:25:35 -0400
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj2oJIXJhZXQeAA--.31643S3; 
 Fri, 22 Oct 2021 10:25:14 +0800 (CST)
Subject: Re: [PATCH 01/31] target/loongarch: Upate the README for the softmmu.
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-2-git-send-email-yangxiaojuan@loongson.cn>
 <bdc2249e-f6d0-bbcf-b53e-0a9c81d8e378@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <923fbb8b-cb3d-d556-5e52-aa028fbc97aa@loongson.cn>
Date: Fri, 22 Oct 2021 10:25:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <bdc2249e-f6d0-bbcf-b53e-0a9c81d8e378@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj2oJIXJhZXQeAA--.31643S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtryDuw1fuFW3AF48ur4fGrg_yoWkXwbEgF
 WrZayvkw4UW3WjqFWYyryrZ3sxGF48GF12va4Yqr4qqrZ8JFs8J3Wqqas5ZF1DAFs5Arnx
 tas7AryrKrWagjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbqkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI
 0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8v
 x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIec
 xEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUx
 3kAUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.867,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021年10月20日 02:56, Richard Henderson 写道:
> On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
>> ---
>>   target/loongarch/README  | 134 +++++++++++++++++++++++++++++++++++++++
>>   target/loongarch/ramdisk | Bin 0 -> 3077952 bytes
>>   target/loongarch/vmlinux | Bin 0 -> 24565536 bytes
>>   3 files changed, 134 insertions(+)
>>   create mode 100644 target/loongarch/ramdisk
>>   create mode 100755 target/loongarch/vmlinux
> 
> Wang Xuerui has already mentioned this, but let's make sure not to include such large test binaries in future.
Yes, I will put the test binaries on the github.
> 
> The proper place for this is in a stable url, which could then either be referenced in the documentation.  But even better than that would be an acceptance test entry -- see tests/acceptance/boot_linux_console.py.
> 
>> +  2.Modify the kernel code for the tcg. Modifications are listed later. I will try to
>> +    commit to the kernel host.
> 
> This sounds like a bug in the qemu emulation of the device or boot environment.
>
Yes, qemu needs some adjustments, in the next version we can use the kernel directly. Thanks
> 
> r~



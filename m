Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA13386EB6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:08:01 +0200 (CEST)
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lioDH-0006O9-Qe
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1lioC0-0005iP-Vo
 for qemu-devel@nongnu.org; Mon, 17 May 2021 21:06:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58204 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1lioBy-0005Zn-U1
 for qemu-devel@nongnu.org; Mon, 17 May 2021 21:06:40 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxncgXE6NgcZ4YAA--.32054S3; 
 Tue, 18 May 2021 09:06:31 +0800 (CST)
Subject: Re: [PATCH] hw/display/qxl: Set pci rom address aligned with page size
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1621065983-18305-1-git-send-email-maobibo@loongson.cn>
 <20210517071900.q3kff56ixqgxj5lo@sirius.home.kraxel.org>
From: maobibo <maobibo@loongson.cn>
Message-ID: <90aba8a2-acdc-73b7-a83d-7bca630e9176@loongson.cn>
Date: Tue, 18 May 2021 09:06:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210517071900.q3kff56ixqgxj5lo@sirius.home.kraxel.org>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxncgXE6NgcZ4YAA--.32054S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW5ZrW8ArWDuw45XF43Jrb_yoW8Jw43pr
 W7AayDurWDKF1jgrs2gwn8u34av34xGF4Ykry3AFZxuF97KFn7AF4kJ398Cry5Ga48GF17
 XFs8ta17ua4vvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y
 6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
 9x07bOoGdUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry I do not state the background clearly.

Page size is 16K on my MIPS machine, and it supports running
guest OS in kvm mode and qxl vga card can used for VM. Qxl pci
rom size is 8K, smaller than 16K page size on host system, it
fails to be added into  memslot in kvm mode since size of
the pci memory space is not page aligned. Here is code in linux,
it requires memory_size and guest_phys_addr is page size aligned.

int __kvm_set_memory_region(struct kvm *kvm,
                            const struct kvm_userspace_memory_region *mem)
{
        struct kvm_memory_slot old, new;
        struct kvm_memory_slot *tmp;
        enum kvm_mr_change change;
        int as_id, id;
        int r;

        r = check_memory_region_flags(mem);
        if (r)
                return r;

        as_id = mem->slot >> 16;
        id = (u16)mem->slot;

        /* General sanity checks */
        if (mem->memory_size & (PAGE_SIZE - 1))
                return -EINVAL;
        if (mem->guest_phys_addr & (PAGE_SIZE - 1))
                return -EINVAL;


regards
bibo, mao

在 2021年05月17日 15:19, Gerd Hoffmann 写道:
> On Sat, May 15, 2021 at 04:06:23PM +0800, Bibo Mao wrote:
>> From: maobibo <maobibo@loongson.cn>
>>
>> pci memory bar size should be aligned with page size, else it will
>> not be effective memslot when running in kvm mode.
>>
>> This patch set qxl pci rom size aligned with page size of host
>> machine.
> 
> What is the exact problem you are trying to fix here?
> 
> take care,
>   Gerd
> 



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA5D435ADA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 08:28:36 +0200 (CEST)
Received: from localhost ([::1]:52078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdRZ3-0000Zr-38
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 02:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mdRVE-00084A-ER
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 02:24:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40766 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mdRVB-0002DX-ES
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 02:24:35 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb2qYB3FhP+kdAA--.31821S3; 
 Thu, 21 Oct 2021 14:24:26 +0800 (CST)
Subject: Re: [PATCH v7 21/21] scripts: add loongarch64 binfmt config
To: WANG Xuerui <i.qemu@xen0n.name>
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-22-git-send-email-gaosong@loongson.cn>
 <c0b25e56-e730-017e-dbd9-3cb2769ba1aa@xen0n.name>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <462f4784-bcfe-0783-12c5-7afaca4a3b89@loongson.cn>
Date: Thu, 21 Oct 2021 14:24:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c0b25e56-e730-017e-dbd9-3cb2769ba1aa@xen0n.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb2qYB3FhP+kdAA--.31821S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZryUCr4ktr4rGF4xXr1xGrg_yoW5Jry3pr
 15Ja4rCF48W3WUA3WkX3WfGr1DJr1Ykas7Jr43tr1UAF1Yyw1rAr1fJr1UJw1DJF4rJr1j
 yFn8Jan8WF4SkF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY
 0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaV
 Av8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, f4bug@amsat.org,
 wuxiaotian@loongson.cn, alex.bennee@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, laurent@vivier.eu,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, philmd@redhat.com,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Xuerui

On 10/18/2021 11:49 PM, WANG Xuerui wrote:
> Hi Song,
> 
> On 10/18/21 20:47, Song Gao wrote:
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   scripts/qemu-binfmt-conf.sh | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
>> index 7de996d..5575bdd 100755
>> --- a/scripts/qemu-binfmt-conf.sh
>> +++ b/scripts/qemu-binfmt-conf.sh
>> @@ -4,7 +4,7 @@
>>   qemu_target_list="i386 i486 alpha arm armeb sparc sparc32plus sparc64 \
>>   ppc ppc64 ppc64le m68k mips mipsel mipsn32 mipsn32el mips64 mips64el \
>>   sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv64 xtensa xtensaeb \
>> -microblaze microblazeel or1k x86_64 hexagon"
>> +microblaze microblazeel or1k x86_64 hexagon loongarch64"
>>     i386_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00'
>>   i386_mask='\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>> @@ -140,6 +140,10 @@ hexagon_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x
>>   hexagon_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>>   hexagon_family=hexagon
>>   +loongarch64_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x02\x01'
>> +loongarch64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> 
> Here the EI_OSABI (7th, 0-based offset) byte is ignored which is okay (we want at least ELFOSABI_SYSV=0 and ELFOSABI_GNU=3 but not others, mask of this byte could be "\xfc" to exclude values > 3).
> 
The EI_OSABI can not be modified. If we support FreeBSD and OpenBSD in the future.
> However, the EI_ABIVERSION (8th) byte is fixed to be zero; according to the draft LoongArch ELF psABI spec [1] there might be future revision(s) to necessitate a bump of ABI version, but it's highly unlikely to in turn require modifications to QEMU code, with almost all logic happening in the dynamic loader. I suggest unmasking this whole byte (setting mask for this byte to "\x00").
>That's a good suggestion， thank you very much.


Thanks
Song Gao



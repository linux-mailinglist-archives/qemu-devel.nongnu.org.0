Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FFF5F9BD2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:25:46 +0200 (CEST)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohp2e-0000Gn-Vu
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ohonp-0001PT-P8
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:10:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47356 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ohonn-0000g7-4P
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:10:25 -0400
Received: from [192.168.124.2] (unknown [36.5.191.229])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxnmty4UNj8fgpAA--.6221S3; 
 Mon, 10 Oct 2022 17:10:11 +0800 (CST)
Message-ID: <3bd67910-88ec-a991-b1d8-75286544e119@loongson.cn>
Date: Mon, 10 Oct 2022 17:10:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH RESEND] linux-user: Fix struct statfs ABI on loongarch64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>
References: <20221006100710.427252-1-xen0n@gentoo.org>
 <a41ded5c-3b98-3a75-1dc0-6c5caaad9a9c@amsat.org>
From: gaosong <gaosong@loongson.cn>
In-Reply-To: <a41ded5c-3b98-3a75-1dc0-6c5caaad9a9c@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxnmty4UNj8fgpAA--.6221S3
X-Coremail-Antispam: 1UD129KBjvJXoW7urW7Cr1rJF4fCrWDWw1Utrb_yoW8Zr1UpF
 4kKF98KF4vqw4kAr429ry5uFnaqws7tF18XFZ8tFy09F98Ww48Gr4UCr95urW293WxJ3Wj
 vry5t3sIqF1fJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_
 GFWl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JUhNVgUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.934,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/10/6 19:11, Philippe Mathieu-Daudé 写道:
> On 6/10/22 12:07, WANG Xuerui wrote:
>> Previously the 32-bit version was incorrectly chosen, leading to funny
>> but incorrect output from e.g. df(1). Simply select the version
>> corresponding to the 64-bit asm-generic definition.
>>
>> For reference, this program should produce the same output no matter
>> natively compiled or not, for loongarch64 or not:
>>
>> ```c
>> #include <stdio.h>
>> #include <sys/statfs.h>
>>
>> int main(int argc, const char *argv[])
>> {
>>    struct statfs b;
>>    if (statfs(argv[0], &b))
>>      return 1;
>>
>>    printf("f_type = 0x%lx\n", b.f_type);
>>    printf("f_bsize = %ld\n", b.f_bsize);
>>    printf("f_blocks = %ld\n", b.f_blocks);
>>    printf("f_bfree = %ld\n", b.f_bfree);
>>    printf("f_bavail = %ld\n", b.f_bavail);
>>
>>    return 0;
>> }
>>
>> // Example output on my amd64 box, with the test binary residing on a
>> // btrfs partition.
>>
>> // Native and emulated output after the fix:
>> //
>> // f_type = 0x9123683e
>> // f_bsize = 4096
>> // f_blocks = 268435456
>> // f_bfree = 168406890
>> // f_bavail = 168355058
>>
>> // Output before the fix, note the messed layout:
>> //
>> // f_type = 0x10009123683e
>> // f_bsize = 723302085239504896
>> // f_blocks = 168355058
>> // f_bfree = 2250817541779750912
>> // f_bavail = 1099229433104
>> ```
>>
>> Fixes: 1f63019632 ("linux-user: Add LoongArch syscall support")
>> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
>> Cc: Song Gao <gaosong@loongson.cn>
>> Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
>> ---
>>
>> Resend with amended commit message to 100% clarify the example output
>> are generated on my box and will differ for everyone else. Sorry for
>> the noise.
>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Applied to loongarch-next.

Thanks.
Song Gao




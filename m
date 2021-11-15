Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90544FD85
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 04:38:56 +0100 (CET)
Received: from localhost ([::1]:46382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmSpb-00081i-76
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 22:38:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mmSoh-0007Mw-VN
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 22:38:00 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38574 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mmSlp-0007NO-8F
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 22:37:59 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_7M01ZFhIgcAAA--.197S3;
 Mon, 15 Nov 2021 11:34:12 +0800 (CST)
Subject: Re: [RFC PATCH v2 01/30] target/loongarch: Update README
To: chen huacai <zltjiangshi@gmail.com>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-2-git-send-email-yangxiaojuan@loongson.cn>
 <CABDp7VrcFX597_5OsV07hYCNondh1jhC49K10kXaGTmOUWTU6g@mail.gmail.com>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <be83e834-a78a-e353-a7bc-829a9e538733@loongson.cn>
Date: Mon, 15 Nov 2021 11:34:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CABDp7VrcFX597_5OsV07hYCNondh1jhC49K10kXaGTmOUWTU6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx_7M01ZFhIgcAAA--.197S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr13GF1kur4DZr17Xw4DXFb_yoW8KFWfpr
 4avF9xKF4DX39rArZagry5Xr4Y9rZ5GF13Xa1ftry09FWDKw1vqr10q3W5KFy7Zw1xtF40
 vry8Ww1UW3W5XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI
 0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8v
 x2IErcIFxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
 x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU0db1UUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.402,
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
Cc: qemu-level <qemu-devel@nongnu.org>, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/11/2021 07:50 PM, chen huacai wrote:
> Hi, Xiaojuan,
> 
> On Thu, Nov 11, 2021 at 9:41 AM Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:
>>
>> Mainly introduce how to run the softmmu
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  target/loongarch/README | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/target/loongarch/README b/target/loongarch/README
>> index 09f809cf80..6f64bde22f 100644
>> --- a/target/loongarch/README
>> +++ b/target/loongarch/README
>> @@ -71,6 +71,26 @@
>>        ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
>>        ...
>>
>> +- Softmmu emulation
>> +
>> +  Add support softmmu emulation support in the following series patches.
>> +  Mainly emulate a virt 3A5000 board that is not exactly the same as the host.
>> +  Kernel code is on the github and the uefi code will be opened in the near future.
>> +  All required binaries can get from github for test.
>> +
>> +  1.Download kernel and the cross-tools.(vmlinux)
>> +
>> +      wget https://github.com/loongson/linux
> This is a git repo URL, I think we cannot use wget to download.

oh, sorry, I will modify.

> 
>> +      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20210831-cross-tools.tar.xz
>> +
>> +  2.Download the clfs-system and made a ramdisk with busybox.(ramdisk)
>> +
>> +  3.Run with command,eg:
>> +
>> +   ./build/qemu-system-loongarch64 -m 4G -smp 16 --cpu Loongson-3A5000 --machine loongson7a -kernel ./vmlinux -initrd ./ramdisk  -append "root=/dev/ram console=ttyS0,115200 rdinit=/sbin/init loglevel=8" -monitor tcp::4000,server,nowait -nographic
> It isn't recommended to use "loongson7a" as the machine name. In my
> opinion, we will have two types of machines run in qemu (One is an
> emulated LS7A and the other is pure virtual). I think we can call them
> "loongson3-ls7a" and "loongson3-virt".
> 
> Huacai

Thank you for your advice,  I didn't think comprehensively. I will modify in the next versison.

Thanks,
Xiaojuan
 
>> +
>> +The vmlinux, ramdisk and uefi binary loongarch_bios.bin can get from :
>> +    git clone https://github.com/yangxiaojuan-loongson/qemu-binary
>>
>>  - Note.
>>    We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
>> --
>> 2.27.0
>>
>>
> 
> 



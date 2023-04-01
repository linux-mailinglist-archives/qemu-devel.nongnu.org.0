Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9676D2DAC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 04:18:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piQnM-0000H9-Gw; Fri, 31 Mar 2023 22:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1piQnJ-0000Gj-H0
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 22:16:41 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1piQnG-0006jd-Uy
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 22:16:41 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8Bxok77kydkKSEVAA--.21029S3;
 Sat, 01 Apr 2023 10:16:28 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxSL36kydkf4ISAA--.13598S3; 
 Sat, 01 Apr 2023 10:16:26 +0800 (CST)
Subject: Re: On integrating LoongArch EDK2 firmware into QEMU build process
To: Gerd Hoffmann <kraxel@redhat.com>, maobibo <maobibo@loongson.cn>
Cc: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?5p2o5bCP5aif?= <yangxiaojuan@loongson.cn>,
 Chao Li <lichao@loongson.cn>
References: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
 <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
 <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
From: gaosong <gaosong@loongson.cn>
Message-ID: <462861df-80bb-0956-9ec0-50efe9b7e2a6@loongson.cn>
Date: Sat, 1 Apr 2023 10:16:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxSL36kydkf4ISAA--.13598S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zr18Jry3XFy7CrWkZF4rGrg_yoW8Jw13pF
 17Z397Kr48JrykKw1vg345WrWDZFn3Gry5JFyYy3ykArWruryxZa4vgryqqF9rAw4j93yF
 9340qw1DC3Z8ZaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/3/31 下午8:12, Gerd Hoffmann 写道:
> On Fri, Mar 31, 2023 at 08:54:16AM +0800, maobibo wrote:
>> Xuerui,
>>
>> Thanks for your mail, it is a good suggestion. Now we are planing to
>> move LoongArch uefi bios from edk2-platform to edk2 repo, so that uefi
>> bios supporting LoongArch can be auto compiled and uploaded to qemu
>> repo. Only that process is somwhat slow since lacking of hands,
>> however we are doing this.
> Good, so I think it makes sense for qemu to just wait for that to
> happen.
>
> Related question:  What are the requirements to build the firmware?
> Fedora 38 ships cross compiler packages ...
>
>    binutils-loongarch64-linux-gnu-2.39-3.fc38.x86_64
>    gcc-loongarch64-linux-gnu-12.2.1-5.fc38.x86_64
>
> ... but when trying to use them to compile the loongarch firmware gcc
> throws errors:
>
> loongarch64-linux-gnu-gcc: error: unrecognized command-line option ‘-mno-explicit-relocs’
>
> I suspect gcc-12 is just too old?
Yes.

[gaosong@kvm-dev1 BIOS]$ loongarch64-unknown-linux-gnu-gcc --version
loongarch64-unknown-linux-gnu-gcc (GCC) 13.0.0 20220906 (experimental)

See:
https://github.com/tianocore/edk2-platforms/tree/master/Platform/Loongson/LoongArchQemuPkg#readme
or
docs/system/loongarch/virt.rst

Thanks.
Song Gao



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382A6D2E50
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:12:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTX5-00020k-OQ; Sat, 01 Apr 2023 01:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1piTX2-00020R-P7
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:12:04 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1piTWz-00078x-Ox
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:12:04 -0400
Received: from loongson.cn (unknown [223.72.62.225])
 by gateway (Coremail) with SMTP id _____8BxYU8WvSdkoCkVAA--.32763S3;
 Sat, 01 Apr 2023 13:11:51 +0800 (CST)
Received: from [192.168.1.6] (unknown [223.72.62.225])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxAeUVvSdkr5wSAA--.51680S3; 
 Sat, 01 Apr 2023 13:11:50 +0800 (CST)
Message-ID: <317e3008-e2bd-8af6-2cf5-dad49d98cb8d@loongson.cn>
Date: Sat, 1 Apr 2023 13:11:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: On integrating LoongArch EDK2 firmware into QEMU build process
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel <qemu-devel@nongnu.org>,
 Song Gao <gaosong@loongson.cn>, =?UTF-8?B?5p2o5bCP5aif?=
 <yangxiaojuan@loongson.cn>, Chao Li <lichao@loongson.cn>
References: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
 <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
 <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
Content-Language: en-US
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxAeUVvSdkr5wSAA--.51680S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zr18Jry3XFy7CrWkZF4rGrg_yoW8JFyfpF
 y3Z3srKFWvvF9Ygr1DKw1UWrZ8Zr93JrZ8JF98t348Ar13uFySvw1vgr4IgFyDAw47C3yY
 v3y8J34kG3W3ZaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1wL05UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
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



On 2023/3/31 20:12, Gerd Hoffmann wrote:
> On Fri, Mar 31, 2023 at 08:54:16AM +0800, maobibo wrote:
>> Xuerui,
>>
>> Thanks for your mail, it is a good suggestion. Now we are planing to
>> move LoongArch uefi bios from edk2-platform to edk2 repo, so that uefi
>> bios supporting LoongArch can be auto compiled and uploaded to qemu
>> repo. Only that process is somwhat slow since lacking of hands,
>> however we are doing this.
> 
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
There is a little different about relocation between gcc-12 and gcc-13 
on LoongArch, gcc-13 is required for edk2 compiler now.

However I think it is actually is one issue if gcc-12 can not be used 
and gcc-12 is popular latest compiler for all architectures. We will 
solve this problem.

Regards
Bibo, Mao


> 
> take care,
>    Gerd
> 



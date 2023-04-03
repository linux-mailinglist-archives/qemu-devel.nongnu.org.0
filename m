Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3444D6D3F76
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 10:52:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjFum-0006ji-Kb; Mon, 03 Apr 2023 04:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1pjFuj-0006jZ-Rt
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:51:45 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1pjFuh-0006y9-9K
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:51:45 -0400
Received: from loongson.cn (unknown [10.20.42.170])
 by gateway (Coremail) with SMTP id _____8BxfdqWkypkkPoVAA--.22572S3;
 Mon, 03 Apr 2023 16:51:34 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxsOSWkypkk1QUAA--.54706S3; 
 Mon, 03 Apr 2023 16:51:34 +0800 (CST)
Message-ID: <acbba848-d770-2d17-f3eb-60b87bfa9447@loongson.cn>
Date: Mon, 3 Apr 2023 16:51:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: On integrating LoongArch EDK2 firmware into QEMU build process
Content-Language: en-US
From: maobibo <maobibo@loongson.cn>
To: Chao Li <lichao@loongson.cn>
Cc: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel <qemu-devel@nongnu.org>,
 Song Gao <gaosong@loongson.cn>, =?UTF-8?B?5p2o5bCP5aif?=
 <yangxiaojuan@loongson.cn>, devel@edk2.groups.io,
 Gerd Hoffmann <kraxel@redhat.com>
References: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
 <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
 <x5vbhjcyc3jl5u3qdjg2dq2znwhdq7ordmbjm6s2hftwyusqp2@r6smasorrjor>
 <317e3008-e2bd-8af6-2cf5-dad49d98cb8d@loongson.cn>
In-Reply-To: <317e3008-e2bd-8af6-2cf5-dad49d98cb8d@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxsOSWkypkk1QUAA--.54706S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7urWUKw4xuw13Ar1rCw17Jrb_yoW8CF4UpF
 y7ZasrtrWvqr9Ygryvg3sxXrs0vr97Gry5GF90q34kAr43urySqr10gr4Y9FyDZw4fC3yj
 vr48Ja4kK3WfZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.37,
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

Cc to Chao Li who is maintainer of edk2 about LoongArch support.

Hi Chao, 

Fedora38 is used to build edk2 binary in qemu CI, cross gcc-12 is
integrated on Fedora38. There is one issue when gcc-12 is used to
build edk2 loongarch like this:
> ... but when trying to use them to compile the loongarch firmware gcc
> throws errors:
>
> loongarch64-linux-gnu-gcc: error: unrecognized command-line option ‘-mno-explicit-reloc

what is your option about this issue?

Regards
Bibo, Mao

在 2023/4/1 13:11, maobibo 写道:
> 
> 
> On 2023/3/31 20:12, Gerd Hoffmann wrote:
>> On Fri, Mar 31, 2023 at 08:54:16AM +0800, maobibo wrote:
>>> Xuerui,
>>>
>>> Thanks for your mail, it is a good suggestion. Now we are planing to
>>> move LoongArch uefi bios from edk2-platform to edk2 repo, so that uefi
>>> bios supporting LoongArch can be auto compiled and uploaded to qemu
>>> repo. Only that process is somwhat slow since lacking of hands,
>>> however we are doing this.
>>
>> Good, so I think it makes sense for qemu to just wait for that to
>> happen.
>>
>> Related question:  What are the requirements to build the firmware?
>> Fedora 38 ships cross compiler packages ...
>>
>>    binutils-loongarch64-linux-gnu-2.39-3.fc38.x86_64
>>    gcc-loongarch64-linux-gnu-12.2.1-5.fc38.x86_64
>>
>> ... but when trying to use them to compile the loongarch firmware gcc
>> throws errors:
>>
>> loongarch64-linux-gnu-gcc: error: unrecognized command-line option ‘-mno-explicit-relocs’
>>
>> I suspect gcc-12 is just too old?
> There is a little different about relocation between gcc-12 and gcc-13 on LoongArch, gcc-13 is required for edk2 compiler now.
> 
> However I think it is actually is one issue if gcc-12 can not be used and gcc-12 is popular latest compiler for all architectures. We will solve this problem.
> 
> Regards
> Bibo, Mao
> 
> 
>>
>> take care,
>>    Gerd
>>
> 



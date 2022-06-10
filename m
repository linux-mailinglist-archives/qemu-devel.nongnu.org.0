Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B90D54597E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 03:17:09 +0200 (CEST)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzTGt-0002Xa-QH
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 21:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1nzTF9-0001la-VP
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 21:15:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50452 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1nzTF7-00088i-3s
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 21:15:19 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT0wem6Jii3c1AA--.2070S3;
 Fri, 10 Jun 2022 09:15:11 +0800 (CST)
Subject: Re: [PATCH v15 4/9] linux-user: Add LoongArch syscall support
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-5-gaosong@loongson.cn>
 <3b6bb5a5-7da1-00d4-a3ee-8595fe6ea769@xen0n.name>
From: gaosong <gaosong@loongson.cn>
Message-ID: <8c085f61-c8df-7962-1672-a7a172463fc4@loongson.cn>
Date: Fri, 10 Jun 2022 09:15:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3b6bb5a5-7da1-00d4-a3ee-8595fe6ea769@xen0n.name>
Content-Type: multipart/alternative;
 boundary="------------2D680362F9C20234D185CA68"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxT0wem6Jii3c1AA--.2070S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr45Zw1DCFy7Cr1fKFyxAFb_yoW8WF48pr
 1Fkrn7ArWvyryfC3s7ZF4Du340yrs5Ca1UtFWUWF1qkF15Xr1jqr1j9rna93Wxtw4kKF1q
 vr1aqry5Z3WUAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
 1l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUtkuxUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------2D680362F9C20234D185CA68
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Xuerui.

Thanks for you comments.

On 2022/6/9 下午6:04, WANG Xuerui wrote:
> On 2022/6/9 10:42, Song Gao wrote:
>> We should disable '__BITS_PER_LONG' at [1] before run gensyscalls.sh
>>
>>   [1] arch/loongarch/include/uapi/asm/bitsperlong.h
>
> I'm not sure why this is necessary, is this for building on 32-bit 
> where __BITS_PER_LONG are (incorrectly) reflecting the host bitness?
See gensyscalls.sh  read_includes()

__BITS_PRE_LONG had been defined in  '-D__BITS_PER_LONG=${bits}' .

> If this is the case, arch/riscv uses the same trick (they are defining 
> __BITS_PER_LONG as (__SIZEOF_POINTER__ * 8), which is essentially the 
> same), so they should fail without the hack described here as well. I 
> don't know if something else could be tweaked to get rid of this hack 
> (currently unable to investigate deeper for you, taking a break 
> reviewing this in the middle of my day job). 

See gensyscall.sh  read_includes()

-D_UAPI_ASM_$(upper ${arch})_BITSPERLONG_H \

and kernel arch/riscv/include/uapi/asm/bitsperlong.h

#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
#define _UAPI_ASM_RISCV_BITSPERLONG_H

So riscv couldn't  get  " warning: "__BITS_PER_LONG" redefined"

For fix it ,

@@ -44,6 +46,7 @@ read_includes()

       cpp -P -nostdinc -fdirectives-only \
          -D_UAPI_ASM_$(upper ${arch})_BITSPERLONG_H \
+        -D__ASM_$(upper ${arch})_BITSPERLONG_H \
          -D__BITS_PER_LONG=${bits} \
          -I${linux}/arch/${arch}/include/uapi/ \
          -I${linux}/include/uapi \

How about this?

Thanks.
Song Gao

--------------2D680362F9C20234D185CA68
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Xuerui.</p>
    <p>Thanks for you comments.<br>
    </p>
    <div class="moz-cite-prefix">On 2022/6/9 下午6:04, WANG Xuerui wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3b6bb5a5-7da1-00d4-a3ee-8595fe6ea769@xen0n.name">On
      2022/6/9 10:42, Song Gao wrote:
      <br>
      <blockquote type="cite" style="color: #000000;">We should disable
        '__BITS_PER_LONG' at [1] before run gensyscalls.sh
        <br>
        <br>
          [1] arch/loongarch/include/uapi/asm/bitsperlong.h
        <br>
      </blockquote>
      <br>
      I'm not sure why this is necessary, is this for building on 32-bit
      where __BITS_PER_LONG are (incorrectly) reflecting the host
      bitness?
      <br>
    </blockquote>
    See gensyscalls.sh  read_includes()
    <p>__BITS_PRE_LONG had been defined in  '-D__BITS_PER_LONG=${bits}'
      . <br>
    </p>
    <blockquote type="cite"
      cite="mid:3b6bb5a5-7da1-00d4-a3ee-8595fe6ea769@xen0n.name">If this
      is the case, arch/riscv uses the same trick (they are defining
      __BITS_PER_LONG as (__SIZEOF_POINTER__ * 8), which is essentially
      the same), so they should fail without the hack described here as
      well. I don't know if something else could be tweaked to get rid
      of this hack (currently unable to investigate deeper for you,
      taking a break reviewing this in the middle of my day job).
    </blockquote>
    <p>See gensyscall.sh  read_includes()</p>
    <p>-D_UAPI_ASM_$(upper ${arch})_BITSPERLONG_H \</p>
    <p>and kernel arch/riscv/include/uapi/asm/bitsperlong.h</p>
    <p>#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H<br>
      #define _UAPI_ASM_RISCV_BITSPERLONG_H<br>
    </p>
    <p>So riscv couldn't  get  " warning: "__BITS_PER_LONG" redefined"<br>
    </p>
    <p>For fix it ,  <br>
    </p>
    <p>@@ -44,6 +46,7 @@ read_includes()<br>
       <br>
            cpp -P -nostdinc -fdirectives-only \<br>
               -D_UAPI_ASM_$(upper ${arch})_BITSPERLONG_H \<br>
      +        -D__ASM_$(upper ${arch})_BITSPERLONG_H \<br>
               -D__BITS_PER_LONG=${bits} \<br>
               -I${linux}/arch/${arch}/include/uapi/ \<br>
               -I${linux}/include/uapi \<br>
    </p>
    <p>How about this?<br>
    </p>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------2D680362F9C20234D185CA68--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E80D4873CF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 09:02:03 +0100 (CET)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5kCI-0008St-3H
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 03:02:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n5kA7-0007CY-GR
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:59:47 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41988 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n5kA2-00032u-R2
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:59:45 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxeMrg8tdh0WcAAA--.1465S3;
 Fri, 07 Jan 2022 15:59:28 +0800 (CST)
Subject: Re: [PATCH v14 00/26] Add LoongArch linux-user emulation support
To: Richard Henderson <richard.henderson@linaro.org>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <7d25de8d-f75b-d2b6-cc93-0b1276bbc7f5@loongson.cn>
Date: Fri, 7 Jan 2022 15:59:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------E5CEA8AB939C9C6CD62F9795"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxeMrg8tdh0WcAAA--.1465S3
X-Coremail-Antispam: 1UD129KBjvdXoWruFy5Jry5Cw17JFWrWw15Arb_yoWDCFc_u3
 ySvFZrAw45tr4UG3s5XF1F9rZ8AayvkFyFkr97Ww47Xa1UAw4Fgwn2krySqw1fGaykur98
 JrWrtrn5C343WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbskYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
 s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
 kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
 Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
 W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l7480Y4
 vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI
 7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
 IFyTuYvjxUqFksDUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.691, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------E5CEA8AB939C9C6CD62F9795
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard.

On 2022/1/7 下午1:01, Richard Henderson wrote:
> On 1/6/22 1:41 AM, Song Gao wrote:
>> Based-on:<20220106074740.1754661-1-gaosong@loongson.cn>
>>
>> Hi all,
>>
>> This series only support linux-user emulation.
>> More about LoongArch at:https://github.com/loongson/
>>
>> The latest kernel:
>>    *https://github.com/loongson/linux/tree/loongarch-next
>>
>> Patches need review:
>>    * 0018-linux-user-Add-LoongArch-specific-structures.patch
>>    * 0019-linux-user-Add-LoongArch-signal-support.patch
>
> You're still blocked on no upstream kernel support.
> As shown in patch 19, the kernel abi is still in flux.
>
We hope the kernel will support as soon as possible. but ...

> It would be best if you could work toward getting full system 
> emulation completed.  Then all of the basic cpu emulation can be 
> merged and all you'd need to keep updating is the linux-user portions.
>
We are going to submit V4 system emulation, maybe tommorrow or next-week, and We'll keep updating the linux-user portions.

Thanks
Song

> r~

--------------E5CEA8AB939C9C6CD62F9795
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Richard.
</pre>
    <div class="moz-cite-prefix">On 2022/1/7 下午1:01, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org">On
      1/6/22 1:41 AM, Song Gao wrote:
      <br>
      <blockquote type="cite">Based-on:<a class="moz-txt-link-rfc2396E" href="mailto:20220106074740.1754661-1-gaosong@loongson.cn">&lt;20220106074740.1754661-1-gaosong@loongson.cn&gt;</a>
        <br>
        <br>
        Hi all,
        <br>
        <br>
        This series only support linux-user emulation.
        <br>
        More about LoongArch at:<a class="moz-txt-link-freetext" href="https://github.com/loongson/">https://github.com/loongson/</a>
        <br>
        <br>
        The latest kernel:
        <br>
           *<a class="moz-txt-link-freetext" href="https://github.com/loongson/linux/tree/loongarch-next">https://github.com/loongson/linux/tree/loongarch-next</a>
        <br>
        <br>
        Patches need review:
        <br>
           * 0018-linux-user-Add-LoongArch-specific-structures.patch
        <br>
           * 0019-linux-user-Add-LoongArch-signal-support.patch
        <br>
      </blockquote>
      <br>
      You're still blocked on no upstream kernel support.
      <br>
      As shown in patch 19, the kernel abi is still in flux.
      <br>
      <br>
    </blockquote>
    <pre>We hope the kernel will support as soon as possible. but ...</pre>
    <blockquote type="cite"
      cite="mid:7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org">It
      would be best if you could work toward getting full system
      emulation completed.  Then all of the basic cpu emulation can be
      merged and all you'd need to keep updating is the linux-user
      portions.
      <br>
      <br>
    </blockquote>
    <pre>We are going to submit V4 system emulation, maybe tommorrow or next-week, and We'll keep updating the linux-user portions.

Thanks
Song
</pre>
    <blockquote type="cite"
      cite="mid:7bb887ff-efc1-c58c-ef80-b9d4a0166f5d@linaro.org">r~
      <br>
    </blockquote>
  </body>
</html>

--------------E5CEA8AB939C9C6CD62F9795--



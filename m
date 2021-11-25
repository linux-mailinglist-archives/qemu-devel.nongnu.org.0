Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4845D368
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 04:04:45 +0100 (CET)
Received: from localhost ([::1]:53894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq540-0006OW-8R
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 22:04:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mq536-0005jM-Ct
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 22:03:48 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40774 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mq533-00030H-T4
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 22:03:48 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxWNII_Z5hbDkBAA--.2895S3;
 Thu, 25 Nov 2021 11:03:36 +0800 (CST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: Richard Henderson <richard.henderson@linaro.org>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <510493a2-cc80-428c-4fae-43988a1e0fd1@loongson.cn>
Date: Thu, 25 Nov 2021 11:03:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------57F38286BEBC658FA075A9AC"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxWNII_Z5hbDkBAA--.2895S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JrykCw15ZF43tFW5urW5GFg_yoWxAFc_uF
 42vr1UWr1UGFZ5G3ykC3yrXFWUJr1xKr18JFWY9r4jyr1UtrZ8Zwn5ZrZ3XFn8K3y3Xr17
 J348KF4S9F12gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
 aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcV
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
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-4.1, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------57F38286BEBC658FA075A9AC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi  Richard,
On 2021/11/20 下午6:33, Richard Henderson wrote:
>> +/* this struct defines a stack used during syscall handling */
>> +typedef struct target_sigaltstack {
>> +        abi_long ss_sp;
>> +        abi_int ss_flags;
>> +        abi_ulong ss_size;
>> +} target_stack_t;
>> +
>> +/*
>> + * sigaltstack controls
>> + */
>> +#define TARGET_SS_ONSTACK     1
>> +#define TARGET_SS_DISABLE     2
>> +
>> +#define TARGET_MINSIGSTKSZ    2048
>> +#define TARGET_SIGSTKSZ       8192
>
> We should move these to generic/signal.h. 
Yes.
I also see that TARGET_SIGSTKSZ is not used.  I think  we should delete it.

Thanks
Song Gao

--------------57F38286BEBC658FA075A9AC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi  Richard,<br>
    <div class="moz-cite-prefix">On 2021/11/20 下午6:33, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org">
      <blockquote type="cite" style="color: #000000;">+/* this struct
        defines a stack used during syscall handling */
        <br>
        +typedef struct target_sigaltstack {
        <br>
        +        abi_long ss_sp;
        <br>
        +        abi_int ss_flags;
        <br>
        +        abi_ulong ss_size;
        <br>
        +} target_stack_t;
        <br>
        +
        <br>
        +/*
        <br>
        + * sigaltstack controls
        <br>
        + */
        <br>
        +#define TARGET_SS_ONSTACK     1
        <br>
        +#define TARGET_SS_DISABLE     2
        <br>
        +
        <br>
        +#define TARGET_MINSIGSTKSZ    2048
        <br>
        +#define TARGET_SIGSTKSZ       8192
        <br>
      </blockquote>
      <br>
      We should move these to generic/signal.h.
    </blockquote>
    Yes.<br>
    I also see that TARGET_SIGSTKSZ is not used.  I think  we should 
    delete it. <br>
    <br>
    Thanks<br>
    Song Gao<br>
  </body>
</html>

--------------57F38286BEBC658FA075A9AC--



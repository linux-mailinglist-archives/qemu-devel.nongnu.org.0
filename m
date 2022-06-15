Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3E54C51F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:52:33 +0200 (CEST)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1PhQ-0000y9-0n
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o1PZn-0006e9-Lf
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:44:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57216 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o1PZl-00047S-Ag
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:44:39 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf038qali4oFDAA--.6067S3;
 Wed, 15 Jun 2022 17:44:28 +0800 (CST)
Subject: Re: [PATCH v16 3/9] linux-user: Add LoongArch elf support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
 <20220614090536.1103616-4-gaosong@loongson.cn>
 <099e6d5c-a48d-29eb-4a6b-0d1bec37b707@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <d4ce72e1-6084-4c59-393c-62d2bbcbbb26@loongson.cn>
Date: Wed, 15 Jun 2022 17:44:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <099e6d5c-a48d-29eb-4a6b-0d1bec37b707@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------0785A2FFC6B4090E328DF170"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxf038qali4oFDAA--.6067S3
X-Coremail-Antispam: 1UD129KBjvdXoWrXrWDuFyfuF18Cw1xGw4UArb_yoWxXFg_CF
 yDuFWIyrWvyFW8Gw15Kr4fJFW7J3ZIgr1jv3WjgwsrG34aqry8tw12q3Z5ZFyqq3WIqrn2
 ya4a9rsIgwn0qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mx
 8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k2
 0xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjfUwYFCUUUUU
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
--------------0785A2FFC6B4090E328DF170
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard.

On 2022/6/15 上午12:21, Richard Henderson wrote:
> On 6/14/22 02:05, Song Gao wrote:
>> +#define ELF_HWCAP get_elf_hwcap()
>> +
>> +static uint32_t get_elf_hwcap(void)
>> +{
>> +    return 0;
>> +}
>
> This should not be zero.  See cpu_probe_common in the kernel.  At 
> minimum HWCAP_LOONGARCH_CRC32 and HWCAP_LOONGARCH_FPU are missing.  I 
> don't know how many of the other features are implemented in 
> target/loongarch/.
>
HWCAP_LOONGARCH_LAM  and  HWCAP_LOONGARCH_UAL  are need.
> Missing ELF_PLATFORM, per the kernel's set_elf_platform(cpu, 
> "loongarch").
OK,  I will correct on next version.

Thanks.
Song Gao

--------------0785A2FFC6B4090E328DF170
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Richard.<br>
    </p>
    <div class="moz-cite-prefix">On 2022/6/15 上午12:21, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:099e6d5c-a48d-29eb-4a6b-0d1bec37b707@linaro.org">On
      6/14/22 02:05, Song Gao wrote:
      <br>
      <blockquote type="cite" style="color: #000000;">+#define ELF_HWCAP
        get_elf_hwcap()
        <br>
        +
        <br>
        +static uint32_t get_elf_hwcap(void)
        <br>
        +{
        <br>
        +    return 0;
        <br>
        +}
        <br>
      </blockquote>
      <br>
      This should not be zero.  See cpu_probe_common in the kernel.  At
      minimum HWCAP_LOONGARCH_CRC32 and HWCAP_LOONGARCH_FPU are
      missing.  I don't know how many of the other features are
      implemented in target/loongarch/.
      <br>
      <br>
    </blockquote>
    HWCAP_LOONGARCH_LAM  and  HWCAP_LOONGARCH_UAL  are need. <br>
    <blockquote type="cite"
      cite="mid:099e6d5c-a48d-29eb-4a6b-0d1bec37b707@linaro.org">Missing
      ELF_PLATFORM, per the kernel's set_elf_platform(cpu, "loongarch").
      <br>
    </blockquote>
    OK,  I will correct on next version.<br>
    <br>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------0785A2FFC6B4090E328DF170--



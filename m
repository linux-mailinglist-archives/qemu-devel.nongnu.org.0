Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F645522E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 02:26:18 +0100 (CET)
Received: from localhost ([::1]:59666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnWBt-00059B-0t
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 20:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mnWAK-0004S2-Bj
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 20:24:40 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49030 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mnWAH-00071d-Mz
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 20:24:40 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv7NHq5Vh+QwBAA--.5545S3;
 Thu, 18 Nov 2021 09:24:24 +0800 (CST)
Subject: Re: [PATCH v10 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
 <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
 <5c3c3107-da7f-7e13-189e-866c7ff1acde@loongson.cn>
 <f1e1b0fd-b34e-1403-1851-35c783a12237@linaro.org>
 <6e225d21-c2e4-69d0-c4f9-d2018096ec70@loongson.cn>
 <e26b8243-2797-cde9-3833-a7c4cd3b6a65@linaro.org>
 <a46e8df8-ccb9-52d0-2e73-33a49e92bfd8@loongson.cn>
 <75e1049b-b09c-7b6d-990f-d2c341ca12c8@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <72c0dce7-532e-9a81-974e-164edf291228@loongson.cn>
Date: Thu, 18 Nov 2021 09:24:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <75e1049b-b09c-7b6d-990f-d2c341ca12c8@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------FB6404FA61F685C47067D03E"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxv7NHq5Vh+QwBAA--.5545S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYD7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JjjYL9UUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.009, SPF_HELO_PASS=-0.001,
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
--------------FB6404FA61F685C47067D03E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 2021/11/17 下午5:55, Richard Henderson wrote:
>>
>> @fmt_rr_i12 and @fmt_rr_ui12 are two 'Formats',  but they use the 
>> same 'Argument sets'(rr_i).
>
> What I meant is that there would be a single gen_rr_i function handing 
> the argument set rr_i; no need for two gen_rr_i* functions. 

Got it.

Thanks.
Song Gao


--------------FB6404FA61F685C47067D03E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Richard,
</pre>
    <div class="moz-cite-prefix">On 2021/11/17 下午5:55, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:75e1049b-b09c-7b6d-990f-d2c341ca12c8@linaro.org">
      <blockquote type="cite" style="color: #000000;"><br>
        @fmt_rr_i12 and @fmt_rr_ui12 are two 'Formats',  but they use
        the same 'Argument sets'(rr_i).
        <br>
      </blockquote>
      <br>
      What I meant is that there would be a single gen_rr_i function
      handing the argument set rr_i; no need for two gen_rr_i*
      functions.
    </blockquote>
    <pre>Got it.

Thanks.
Song Gao
</pre>
  </body>
</html>

--------------FB6404FA61F685C47067D03E--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843615EEC72
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 05:26:55 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odkCM-0003r1-8j
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 23:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1odkAM-0001yD-Nk
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 23:24:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46880 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1odkA7-0002Pr-NG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 23:24:50 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx5OHqDzVjwZwjAA--.1856S3; 
 Thu, 29 Sep 2022 11:24:26 +0800 (CST)
Subject: Re: [PATCH v2 1/4] target/loongarch: ftint_xxx insns set the result
 high 32bit 0xffffffff
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, huqi@loongson.cn, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220927064838.3570928-1-gaosong@loongson.cn>
 <20220927064838.3570928-2-gaosong@loongson.cn>
 <7cedbe66-7fc0-9e4a-c6e1-55aeb76c3e42@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <66479faf-3d15-5bac-24cc-64a0ce008efb@loongson.cn>
Date: Thu, 29 Sep 2022 11:24:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7cedbe66-7fc0-9e4a-c6e1-55aeb76c3e42@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------977BF123B508325951A4E2ED"
Content-Language: en-US
X-CM-TRANSID: AQAAf8Bx5OHqDzVjwZwjAA--.1856S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyfZry5Gr47trWkGry7Awb_yoWftrc_CF
 WIyryv9w1jgr4rCFWak3ZrAryxAr42gr1UXr1qqw42q345tws5CF1kXrs3Z3ZIgF4xXF9r
 Jryq9ry3Cw1avjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
 vE52x082IY62kv0487McIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8
 JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
 C7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VU889N3UUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.319, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------977BF123B508325951A4E2ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/9/28 下午11:14, Richard Henderson 写道:
> On 9/26/22 23:48, Song Gao wrote:
>> we just set high 32bit 0xffffffff as the other float instructions do.
>>
>> Signed-off-by: Song Gao<gaosong@loongson.cn>
>> ---
>>   target/loongarch/fpu_helper.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> But the result in these cases is an integer, not a (single-precision) 
> float.
> Is this really what hardware does?
>
The high 32bit value is not fixed  as the manual 3.1.3.1 said:
     ' When the floating-point register records a single-precision 
floating-point number or word integer, the data
     always appears in the [31:0] bits of the floating-point register, 
at this time the [63:32] bits of the
     floating-point register can be any value.'
I do this  just used for RISU test compare these instructions result value.
As the RISU patches not reviewed,  I can drop this patch.

Thanks.
Song Gao

--------------977BF123B508325951A4E2ED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/9/28 下午11:14, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7cedbe66-7fc0-9e4a-c6e1-55aeb76c3e42@linaro.org">On
      9/26/22 23:48, Song Gao wrote:
      <br>
      <blockquote type="cite">we just set high 32bit 0xffffffff as the
        other float instructions do.
        <br>
        <br>
        Signed-off-by: Song Gao<a class="moz-txt-link-rfc2396E" href="mailto:gaosong@loongson.cn">&lt;gaosong@loongson.cn&gt;</a>
        <br>
        ---
        <br>
          target/loongarch/fpu_helper.c | 18 +++++++++---------
        <br>
          1 file changed, 9 insertions(+), 9 deletions(-)
        <br>
      </blockquote>
      <br>
      But the result in these cases is an integer, not a
      (single-precision) float.
      <br>
      Is this really what hardware does?
      <br>
      <br>
    </blockquote>
    The high 32bit value is not fixed  as the manual 3.1.3.1 said<font
      size="-1">:</font><br>
    <font size="-1">    ' When the floating-point register records a
      single-precision floating-point number or word integer, the data
</font><br>
    <font size="-1">    always appears in the [31:0] bits of the
      floating-point register, at this time the [63:32] bits of the
</font><br>
    <font size="-1">    floating-point register can be any value.'</font><br>
    I do this  just used for RISU test compare these instructions result
    value.  <br>
    As the RISU patches not reviewed,  I can drop this patch.<br>
    <br>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------977BF123B508325951A4E2ED--



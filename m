Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FF458A8F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:29:29 +0100 (CET)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4hc-00009U-EZ
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mp4c7-0001nu-NS
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:47 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57554 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mp4c3-0003AO-9X
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:45 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axp+h_U5thDAwAAA--.319S3;
 Mon, 22 Nov 2021 16:23:27 +0800 (CST)
Subject: Re: [PATCH v11 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-5-git-send-email-gaosong@loongson.cn>
 <6ccd9c56-9db6-7a40-d59c-22bf3fc2f6b0@linaro.org>
 <b6259138-0f0d-c0dd-c4ed-632f76e507fb@loongson.cn>
 <e7b647bf-bb0d-66e0-ca9f-f96eb2a2550c@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <7f2407f6-c9d4-96bf-eff2-f0fc36932da3@loongson.cn>
Date: Mon, 22 Nov 2021 16:23:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e7b647bf-bb0d-66e0-ca9f-f96eb2a2550c@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------41B72EB4FE7392247F580E9F"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Axp+h_U5thDAwAAA--.319S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYh7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
 s7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 WUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUwYFCUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.097, SPF_HELO_PASS=-0.001,
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
--------------41B72EB4FE7392247F580E9F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,
Sorry for the late reply.

On 2021/11/20 下午4:56, Richard Henderson wrote:
> On 11/20/21 9:52 AM, gaosong wrote:
>> You're right, gen_set_gpr not need EXT_NONE at all, and we need not 
>> condition around gen_set_gpr.
>> I think that if we know the dst_ext is EXT_NONE, we do't need 
>> gen_set_gpr.
>
> But that assumes that gpr_dst did not return a temporary.
> I think it's cleaner to assume that gen_set_gpr is needed.
>
Does this mean that we gen_set_gpr where used gpr_dst, and gen_set_gpr need EXT_NONE?
Such as gpr_dst in trans_atomic.c.inc/trans_memory.c.inc, should we need gen_set_gpr?

Thanks
Song Gao

> r~

--------------41B72EB4FE7392247F580E9F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Richard,
Sorry for the late reply.
</pre>
    <div class="moz-cite-prefix">On 2021/11/20 下午4:56, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e7b647bf-bb0d-66e0-ca9f-f96eb2a2550c@linaro.org">On
      11/20/21 9:52 AM, gaosong wrote:
      <br>
      <blockquote type="cite">You're right, gen_set_gpr not need
        EXT_NONE at all, and we need not condition around gen_set_gpr.
        <br>
        I think that if we know the dst_ext is EXT_NONE, we do't need
        gen_set_gpr.
        <br>
      </blockquote>
      <br>
      But that assumes that gpr_dst did not return a temporary.
      <br>
      I think it's cleaner to assume that gen_set_gpr is needed.
      <br>
      <br>
    </blockquote>
    <pre>Does this mean that we gen_set_gpr where used gpr_dst, and gen_set_gpr need EXT_NONE?
Such as gpr_dst in trans_atomic.c.inc/trans_memory.c.inc, should we need gen_set_gpr? 

Thanks
Song Gao
</pre>
    <blockquote type="cite"
      cite="mid:e7b647bf-bb0d-66e0-ca9f-f96eb2a2550c@linaro.org">r~
      <br>
    </blockquote>
  </body>
</html>

--------------41B72EB4FE7392247F580E9F--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF154C558
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 12:03:16 +0200 (CEST)
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Prn-0005nw-A0
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 06:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o1PmX-00054j-JD
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:57:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34086 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o1PmU-0006fQ-Ca
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:57:48 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf94UraliZohDAA--.6342S3;
 Wed, 15 Jun 2022 17:57:41 +0800 (CST)
Subject: Re: [PATCH v16 2/9] linux-user: Add LoongArch signal support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
 <20220614090536.1103616-3-gaosong@loongson.cn>
 <a50a74b3-f26a-c3cf-7aaf-12735b712968@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <d537db33-26a6-5518-4292-32be5f8fc61f@loongson.cn>
Date: Wed, 15 Jun 2022 17:57:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a50a74b3-f26a-c3cf-7aaf-12735b712968@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------FF0D50EAC82FBAD0CEA8E694"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxf94UraliZohDAA--.6342S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYD7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
 s7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUMa0PUUUUU=
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
--------------FF0D50EAC82FBAD0CEA8E694
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/6/15 上午12:15, Richard Henderson wrote:
>> +static void *get_ctx(struct target_sctx_info *info)
>> +{
>> +    return (void *)((char *)info + sizeof(struct target_sctx_info));
>> +}
>
> Return type should be struct target_sctx_info *. 

I wonder that if we return target_fpu_context * and rename get_ctx to 
get_fpu_context() would be better.

So we need't  cast  like this:

     struct target_fpu_context *fpu_ctx = (struct target_fpu_context *)
                                          get_ctx(info);


Thanks.
Song Gao

--------------FF0D50EAC82FBAD0CEA8E694
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/6/15 上午12:15, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a50a74b3-f26a-c3cf-7aaf-12735b712968@linaro.org">
      <blockquote type="cite" style="color: #000000;">+static void
        *get_ctx(struct target_sctx_info *info)
        <br>
        +{
        <br>
        +    return (void *)((char *)info + sizeof(struct
        target_sctx_info));
        <br>
        +}
        <br>
      </blockquote>
      <br>
      Return type should be struct target_sctx_info *.
    </blockquote>
    <p>I wonder that if we return target_fpu_context * and rename
      get_ctx to get_fpu_context() would be better.</p>
    <p>So we need't  cast  like this:</p>
    <p>    struct target_fpu_context *fpu_ctx = (struct
      target_fpu_context *)<br>
                                               get_ctx(info);<br>
    </p>
    <br>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------FF0D50EAC82FBAD0CEA8E694--



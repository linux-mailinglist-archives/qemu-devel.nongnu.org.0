Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915FE5051B9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 14:40:50 +0200 (CEST)
Received: from localhost ([::1]:52462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngQgQ-0001rD-IM
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 08:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ngQeS-0000nZ-IE
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 08:38:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46034 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ngQeP-0003ww-RT
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 08:38:44 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxrxHFW11i880nAA--.22018S3; 
 Mon, 18 Apr 2022 20:38:29 +0800 (CST)
Subject: Re: [PATCH v1 25/43] target/loongarch: Add LoongArch CSR instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-26-yangxiaojuan@loongson.cn>
 <3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <e556f5bd-8fb5-7244-c812-e0dd019c52e0@loongson.cn>
Date: Mon, 18 Apr 2022 20:38:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------D678E81F8C486C976FD5D808"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxrxHFW11i880nAA--.22018S3
X-Coremail-Antispam: 1UD129KBjvdXoWrCF4ftFWkGF1xWF1rZw4fKrg_yoWxWFc_Xr
 48Kr1UXr1kArWUCryUJ348Xr1Utw1j9ry7tryj9w1Dur1DXasI9r15JrZ3Ar18Wr43JryU
 Ar90vrW3Aw15GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
 1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280
 aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4
 CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
 02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
 xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0J
 Up5l8UUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------D678E81F8C486C976FD5D808
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/4/16 上午9:04, Richard Henderson wrote:
>> +int cpu_csr_offset(unsigned csr_num);
> ...
>> +static const uint64_t csr_offsets[] = {
>
> There's no reason for this array to be uint64_t.
> It really should match the function. 
Yes,  we shoud do this.

If we use 'int', we may get a warning:
../target/loongarch/csr_helper.c:49:30: warning: overflow in implicit 
constant conversion [-Woverflow]
       [LOONGARCH_CSR_CPUID] = offsetof(CPUState, cpu_index)
                                                 ^~~~~~~~
How about use 'long'?  I had tested it no warning.

Thanks.
Xiaojuan

--------------D678E81F8C486C976FD5D808
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/4/16 上午9:04, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org">
      <blockquote type="cite" style="color: #000000;">+int
        cpu_csr_offset(unsigned csr_num);
        <br>
      </blockquote>
      ...
      <br>
      <blockquote type="cite" style="color: #000000;">+static const
        uint64_t csr_offsets[] = {
        <br>
      </blockquote>
      <br>
      There's no reason for this array to be uint64_t.
      <br>
      It really should match the function.
    </blockquote>
    Yes,  we shoud do this.<br>
    <br>
    If we use 'int', we may get a warning:<br>
    ../target/loongarch/csr_helper.c:49:30: warning: overflow in
    implicit constant conversion [-Woverflow]<br>
          [LOONGARCH_CSR_CPUID] = offsetof(CPUState, cpu_index)<br>
                                                    ^~~~~~~~<br>
    How about use 'long'?  I had tested it no warning.<br>
    <br>
    Thanks.<br>
    Xiaojuan<br>
  </body>
</html>

--------------D678E81F8C486C976FD5D808--



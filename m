Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D717347F4E4
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 02:44:35 +0100 (CET)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1IaQ-00043P-FS
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 20:44:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n1IYn-0003FR-Pu; Sat, 25 Dec 2021 20:42:53 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:50746 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n1IYl-0002Pj-5Y; Sat, 25 Dec 2021 20:42:53 -0500
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowADHzJyOyMdhlxY3BQ--.32632S2;
 Sun, 26 Dec 2021 09:42:39 +0800 (CST)
Subject: Re: [PATCH 2/6] target/riscv: add support for unique fpr read/write
 with support for zfinx
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-3-liweiwei@iscas.ac.cn>
 <ec5adcb4-3090-50e2-4981-38149e120249@linaro.org>
 <2acd9ead-d9e8-46be-b306-2aa26ced06b5@iscas.ac.cn>
 <be0bf212-5200-2f25-8b9e-5f7fe2941ccd@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <9ea3554f-367a-bd4e-fc4f-a98367b96260@iscas.ac.cn>
Date: Sun, 26 Dec 2021 09:42:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <be0bf212-5200-2f25-8b9e-5f7fe2941ccd@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------4E3E8406BCAFD631B4A13198"
Content-Language: en-US
X-CM-TRANSID: qwCowADHzJyOyMdhlxY3BQ--.32632S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1Dtr4fCw18WrWrWrykKrg_yoWxurg_Ca
 40qF4DZ3s7A3ZIv3yxtF4kCFZ3JFsrCrZYyrW5XF13ZF1qvrW5JrW3uwnIkF18JFs8GF15
 Wa4xXFWI9rsIvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbS8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0E
 x4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5V
 A0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l7480Y4vEI4kI2Ix0rVAq
 x4xJMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
 w20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUSsjbUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.196, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------4E3E8406BCAFD631B4A13198
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry. In the old spec(version 0.41), nanboxing is not totally disabled, 
but "NaN-boxing is limited to |XLEN| bits, not |FLEN| bits". Taking 
misa.mxl into acount, if misa.mxl is RV32, and maximum is RV64, this 
should be sign-extended. Is there any other new update for nanboxing  to 
the spec?

在 2021/12/26 上午6:00, Richard Henderson 写道:
> On 12/24/21 7:13 PM, liweiwei wrote:
>> In RV64 case, this should be nan-boxing value( upper bits are all 
>> ones).  However, zfinx will not check nan-boxing of source, the upper 
>> 32 bits have no effect on the final result. So I think both 
>> zero-extended or sign-extended are OK.
>
> There is no nanboxing in zfinx at all -- values are sign-extended.
>
>
> r~

--------------4E3E8406BCAFD631B4A13198
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Sorry. In the old spec(version 0.41), nanboxing is not totally
      disabled, but "NaN-boxing is limited to <code>XLEN</code> bits,
      not <code>FLEN</code> bits". Taking misa.mxl into acount, if
      misa.mxl is RV32, and maximum is RV64, this should be
      sign-extended. Is there any other new update for nanboxing  to the
      spec?<br>
    </p>
    <div class="moz-cite-prefix">在 2021/12/26 上午6:00, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:be0bf212-5200-2f25-8b9e-5f7fe2941ccd@linaro.org">On
      12/24/21 7:13 PM, liweiwei wrote:
      <br>
      <blockquote type="cite">In RV64 case, this should be nan-boxing
        value( upper bits are all ones).  However, zfinx will not check
        nan-boxing of source, the upper 32 bits have no effect on the
        final result. So I think both zero-extended or sign-extended are
        OK.
        <br>
      </blockquote>
      <br>
      There is no nanboxing in zfinx at all -- values are sign-extended.
      <br>
      <br>
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------4E3E8406BCAFD631B4A13198--



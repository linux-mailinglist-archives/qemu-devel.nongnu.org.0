Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3063E52C9FB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 05:05:59 +0200 (CEST)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrWU9-00038n-HL
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 23:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nrWSR-0002Pn-KE
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:04:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52038 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nrWSO-0003ns-VK
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:04:11 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxqtiYs4ViVrUbAA--.17795S3; 
 Thu, 19 May 2022 11:03:52 +0800 (CST)
Subject: Re: [PATCH v4 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
 <20220517113023.3051143-35-yangxiaojuan@loongson.cn>
 <79bbbf79-a019-17f4-9008-f57a8c375fcb@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <d6e43d35-9b63-70f2-ceb8-ec464131e202@loongson.cn>
Date: Thu, 19 May 2022 11:03:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <79bbbf79-a019-17f4-9008-f57a8c375fcb@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------0615451CA53C0311D143113B"
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxqtiYs4ViVrUbAA--.17795S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GF4kJF4Dtr1DCw17Ary7KFg_yoWxZwcEgF
 Z8KwsrG39IvrsrWrn7trs5A3y3Xw4xtryUtrWrW3y8K34rXFWkKwn8Crn5Xrs3Xa1kWr9x
 u3sIvasFvwn8ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbs8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r106r15McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
 ZEXa7VU889N3UUUUU==
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------0615451CA53C0311D143113B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard

On 2022/5/19 上午2:04, Richard Henderson wrote:
>
>>> +    uint64_t sw_isr[LOONGARCH_MAX_VCPUS][LS3A_INTC_IP][EXTIOI_IRQS 
>>> / 64];
>
> This has not been declared with DECLARE_BITMAP, therefore you will see 
> a compile-time error when building on an ILP32 (i686) or P64 (win64) 
> host.
>
> I pointed this out to you as recently as v2 of this series.
> I am really disappointed to see this regress in just one month.
>
> You can test this yourself with
>
>   IMAGES='fedora-i386-cross fedora-win32-cross fedora-win64-cross' \
>   make docker-test-build
>
> Please do so before your next submission. 
Thank you for your patient guidance, we will carefully correct them.

Thanks.
Xiaojuan


--------------0615451CA53C0311D143113B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Richard<br>
    </p>
    <div class="moz-cite-prefix">On 2022/5/19 上午2:04, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:79bbbf79-a019-17f4-9008-f57a8c375fcb@linaro.org"><br>
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">+    uint64_t
          sw_isr[LOONGARCH_MAX_VCPUS][LS3A_INTC_IP][EXTIOI_IRQS / 64];
          <br>
        </blockquote>
      </blockquote>
      <br>
      This has not been declared with DECLARE_BITMAP, therefore you will
      see a compile-time error when building on an ILP32 (i686) or P64
      (win64) host.
      <br>
      <br>
      I pointed this out to you as recently as v2 of this series.
      <br>
      I am really disappointed to see this regress in just one month.
      <br>
      <br>
      You can test this yourself with
      <br>
      <br>
        IMAGES='fedora-i386-cross fedora-win32-cross fedora-win64-cross'
      \
      <br>
        make docker-test-build
      <br>
      <br>
      Please do so before your next submission.
    </blockquote>
    Thank you for your patient guidance, we will carefully correct them.<br>
    <br>
    Thanks.<br>
    Xiaojuan<br>
    <br>
  </body>
</html>

--------------0615451CA53C0311D143113B--



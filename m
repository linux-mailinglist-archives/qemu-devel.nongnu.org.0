Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96778487448
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 09:50:55 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5kxa-0005Tx-8l
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 03:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n5kts-0002hU-7A
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:47:06 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54360 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n5ktn-0005ga-Hb
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:47:01 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv8v9_ddhamsAAA--.1900S3;
 Fri, 07 Jan 2022 16:46:53 +0800 (CST)
Subject: Re: [PATCH 0/6] linux-user: prctl improvements
To: Laurent Vivier <laurent@vivier.eu>
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <10eb36e7-0d95-602e-fc07-16394efc26f8@vivier.eu>
From: gaosong <gaosong@loongson.cn>
Message-ID: <f9533da4-f674-2c31-3c18-ce29698e4711@loongson.cn>
Date: Fri, 7 Jan 2022 16:46:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <10eb36e7-0d95-602e-fc07-16394efc26f8@vivier.eu>
Content-Type: multipart/alternative;
 boundary="------------3A47A4B475151D09815CAE03"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxv8v9_ddhamsAAA--.1900S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY-7k0a2IF6FyUM7kC6x804xWl1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY
 67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y4
 8IcVAKI48JMx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxE
 wVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4
 IE7xkEbVWUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1r
 MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
 WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWU
 JVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
 1UYxBIdaVFxhVjvjDU0xZFpf9x07jjnmiUUUUU=
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------3A47A4B475151D09815CAE03
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent,

On 2022/1/6 下午6:46, Laurent Vivier wrote:
> make the LTP testsuite (20200930) happy again (capset02, prctl01, 
> prctl02, prctl03)? 

Do we have LTP test documents?   or What test methods do we have for linux-user?

As for far, I konw 'make check ' ,'make check-tcg'.  and some testcases on tests/tcg/$Arch.

Thanks
Song


--------------3A47A4B475151D09815CAE03
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Laurent,
    </p>
    <div class="moz-cite-prefix">On 2022/1/6 下午6:46, Laurent Vivier
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:10eb36e7-0d95-602e-fc07-16394efc26f8@vivier.eu">make the
      LTP testsuite (20200930) happy again (capset02, prctl01, prctl02,
      prctl03)?
    </blockquote>
    <pre>Do we have LTP test documents?   or What test methods do we have for linux-user?</pre>
    <pre>As for far, I konw 'make check ' ,'make check-tcg'.  and some testcases on tests/tcg/$Arch.

Thanks
Song
</pre>
  </body>
</html>

--------------3A47A4B475151D09815CAE03--



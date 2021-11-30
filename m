Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FEC462EE9
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 09:52:08 +0100 (CET)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mryrv-0001jB-P2
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 03:52:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mryqn-00012i-NY
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:50:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:43488 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mryql-00042c-24
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:50:57 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX8vn5aVhg7cBAA--.4073S3;
 Tue, 30 Nov 2021 16:50:48 +0800 (CST)
Subject: Re: [PATCH v11 11/26] target/loongarch: Add floating point comparison
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-12-git-send-email-gaosong@loongson.cn>
 <c9c08d6d-e193-969c-f82a-fc36ecff196a@linaro.org>
 <58f22862-7fad-d9bb-e712-2d915d944a7f@loongson.cn>
 <97db0ee8-6f0e-1855-8182-e0fe37f2b022@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <f5c8f692-664f-287f-85bb-1694e658767f@loongson.cn>
Date: Tue, 30 Nov 2021 16:50:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <97db0ee8-6f0e-1855-8182-e0fe37f2b022@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------B14D835619B524B1B25B3DE9"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxX8vn5aVhg7cBAA--.4073S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYD7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUtkuxUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.211, SPF_HELO_PASS=-0.001,
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
--------------B14D835619B524B1B25B3DE9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard.

On 2021/11/30 下午4:37, Richard Henderson wrote:
>
> I think you should simply replace "0x" with "0b" so that the bits of 
> FCMP are more compact.  I assume that's what you were originally 
> thinking.
Ooh,  suddenly become clear-minded.

Thanks
Song Gao


--------------B14D835619B524B1B25B3DE9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Richard.<br>
    <br>
    <div class="moz-cite-prefix">On 2021/11/30 下午4:37, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:97db0ee8-6f0e-1855-8182-e0fe37f2b022@linaro.org"><br>
      I think you should simply replace "0x" with "0b" so that the bits
      of FCMP are more compact.  I assume that's what you were
      originally thinking.
      <br>
    </blockquote>
    Ooh,  suddenly become clear-minded.
    <p>Thanks<br>
      Song Gao<br>
    </p>
    <span style="color: rgb(51, 51, 51); font-family: Arial,
      &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti,
      &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(249, 249, 249);
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span>
    <p><span style="color: rgb(51, 51, 51); font-family: Arial,
        &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, STHeiti,
        &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;,
        sans-serif; font-size: 14px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(249, 249,
        249); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"></span></p>
  </body>
</html>

--------------B14D835619B524B1B25B3DE9--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748747DD93
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 03:03:23 +0100 (CET)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0DRx-0005Yi-KE
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 21:03:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n0DPh-00049e-59
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:01:01 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55556 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n0DPc-0000CT-W8
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:00:59 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxOZZN2MNh_VYDAA--.2265S3;
 Thu, 23 Dec 2021 10:00:45 +0800 (CST)
Subject: Re: [PATCH v11 00/31] LoongArch64 port of QEMU TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20211221054105.178795-1-git@xen0n.name>
 <e0e4f331-6c40-bce4-fa7d-898fbe74f962@amsat.org>
 <31af4f0f-5e2c-b1c1-70dc-8b207f57aad5@loongson.cn>
 <3a0b0b3c-7fa5-6324-3e74-d7cadd8e89f5@amsat.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <54b1aad1-e3af-ef9f-f059-709970558dc6@loongson.cn>
Date: Thu, 23 Dec 2021 10:00:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3a0b0b3c-7fa5-6324-3e74-d7cadd8e89f5@amsat.org>
Content-Type: multipart/alternative;
 boundary="------------00C7495B1548926FE3365907"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxOZZN2MNh_VYDAA--.2265S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYg7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
 x2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VU1g4S7UUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.694, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------00C7495B1548926FE3365907
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2021/12/21 下午8:00, Philippe Mathieu-Daudé wrote:
>> Which way is better?
> Access to 3a5000 hardware environment is certainly better for us,
> as this remove the maintenance burden.

We are preparing 3a5000 hardware enviroment. Naybe one or two days later, you can get the IP.

Thanks
Song Gao


--------------00C7495B1548926FE3365907
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi,
</pre>
    <div class="moz-cite-prefix">On 2021/12/21 下午8:00, Philippe
      Mathieu-Daudé wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3a0b0b3c-7fa5-6324-3e74-d7cadd8e89f5@amsat.org">
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">Which way is better?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Access to 3a5000 hardware environment is certainly better for us,
as this remove the maintenance burden.
</pre>
    </blockquote>
    <pre>We are preparing 3a5000 hardware enviroment. Naybe one or two days later, you can get the IP.</pre>
    <pre>Thanks
Song Gao
</pre>
  </body>
</html>

--------------00C7495B1548926FE3365907--



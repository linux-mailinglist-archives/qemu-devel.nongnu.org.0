Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB68348993C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:07:39 +0100 (CET)
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uOg-0003cS-BW
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:07:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n6uHc-0001se-Vo
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:00:23 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56656 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n6uHZ-00068j-3m
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:00:20 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxCMrWLdxh1zgBAA--.3036S3;
 Mon, 10 Jan 2022 21:00:06 +0800 (CST)
Subject: Re: [PATCH v14 02/26] target/loongarch: Add core definition
To: WANG Xuerui <i.qemu@xen0n.name>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-3-gaosong@loongson.cn>
 <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
From: gaosong <gaosong@loongson.cn>
Message-ID: <ed3902cd-261e-2ee3-6fe4-8171bbbc03f4@loongson.cn>
Date: Mon, 10 Jan 2022 21:00:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
Content-Type: multipart/alternative;
 boundary="------------B9AB218631E8E646D26ECD67"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxCMrWLdxh1zgBAA--.3036S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWxWFykWFWftrW8Jry7ZFb_yoW8Gry8p3
 Z5CwsIya18Xws3ZFWUtr1jyry3JrnYyr1UJryktwnxZ3Z8K3sFyFn8trZ0vayfKr18Ca12
 vwsrWr48uw4kCrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mx
 8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k2
 0xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUtkuxUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B9AB218631E8E646D26ECD67
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2022/1/9 下午5:25, WANG Xuerui wrote:
>> +
>> +const char * const fregnames[32] = {
>> +    "f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",
>> +    "f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",
>> +    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
>> +    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
>> +};
>> +
>> +static const char * const excp_names[EXCP_LAST + 1] = {
>> +    [EXCP_SYSCALL] = "Syscall",
>> +    [EXCP_BREAK] = "Break",
>> +    [EXCP_INE] = "Instruction Non-existent",
> Nit: "Instruction Non-Existent" (or is there any authoritative source 
> for this spelling? the English translation of the manual?) 

I must admit that your English is really good, But 'Instruction Non-existent' is what you pointed out in v7.  I have a history [1],

[1] https://patchew.org/QEMU/1634561247-25499-1-git-send-email-gaosong@loongson.cn/1634561247-25499-3-git-send-email-gaosong@loongson.cn/

> +static const char * const excp_names[EXCP_LAST + 1] = {
> +    [EXCP_ADE] = "Address error",
> +    [EXCP_SYSCALL] = "Syscall",
> +    [EXCP_BREAK] = "Break",
> +    [EXCP_INE] = "Inst. Not Exist",
Nit: "Instruction Non-existent", no need to shorten "instruction" like
this IMO; no other similar usages exist so this would not be consistent.

In any case thank you for your other suggestions.

Thanks
Song


--------------B9AB218631E8E646D26ECD67
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 2022/1/9 下午5:25, WANG Xuerui wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name">
      <blockquote type="cite" style="color: #000000;">+
        <br>
        +const char * const fregnames[32] = {
        <br>
        +    "f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",
        <br>
        +    "f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",
        <br>
        +    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
        <br>
        +    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
        <br>
        +};
        <br>
        +
        <br>
        +static const char * const excp_names[EXCP_LAST + 1] = {
        <br>
        +    [EXCP_SYSCALL] = "Syscall",
        <br>
        +    [EXCP_BREAK] = "Break",
        <br>
        +    [EXCP_INE] = "Instruction Non-existent",
        <br>
      </blockquote>
      Nit: "Instruction Non-Existent" (or is there any authoritative
      source for this spelling? the English translation of the manual?)
    </blockquote>
    <pre>I must admit that your English is really good, But 'Instruction Non-existent' is what you pointed out in v7.  I have a history [1], 
</pre>
    <pre>[1] <a class="moz-txt-link-freetext" href="https://patchew.org/QEMU/1634561247-25499-1-git-send-email-gaosong@loongson.cn/1634561247-25499-3-git-send-email-gaosong@loongson.cn/">https://patchew.org/QEMU/1634561247-25499-1-git-send-email-gaosong@loongson.cn/1634561247-25499-3-git-send-email-gaosong@loongson.cn/</a></pre>
    <pre class="body-full" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 5px; margin: 0px 0px 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(255, 255, 255); border: none; border-radius: 4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&gt; +static const char * const excp_names[EXCP_LAST + 1] = {
&gt; +    [EXCP_ADE] = "Address error",
&gt; +    [EXCP_SYSCALL] = "Syscall",
&gt; +    [EXCP_BREAK] = "Break",
&gt; +    [EXCP_INE] = "Inst. Not Exist",
Nit: "Instruction Non-existent", no need to shorten "instruction" like 
this IMO; no other similar usages exist so this would not be consistent.</pre>
    <pre>In any case thank you for your other suggestions.

Thanks
Song
</pre>
    <pre class="body-full" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 5px; margin: 0px 0px 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(255, 255, 255); border: none; border-radius: 4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
</pre>
  </body>
</html>

--------------B9AB218631E8E646D26ECD67--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE0558CEE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 03:43:48 +0200 (CEST)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4YMM-0001j0-Tg
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 21:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o4YKY-0000u7-No
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 21:41:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38590 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o4YKS-0000sm-Ot
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 21:41:52 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL01UFrVilPJXAA--.33239S3; 
 Fri, 24 Jun 2022 09:41:40 +0800 (CST)
Subject: Re: [PATCH v19 02/13] linux-user: Add LoongArch signal support
To: Richard Henderson <richard.henderson@linaro.org>,
 maobibo <maobibo@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220623085526.1678168-1-gaosong@loongson.cn>
 <20220623085526.1678168-3-gaosong@loongson.cn>
 <fe3d36d7-2ad1-94d1-dd06-e650916b37fd@linaro.org>
 <2fc368ce-7323-b49b-20f1-54a449a40ce4@loongson.cn>
 <7fbda1a0-938d-fe5d-a6e7-ddaef3577555@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <154da18c-5a57-e153-1ca3-0653e3c9eea0@loongson.cn>
Date: Fri, 24 Jun 2022 09:41:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7fbda1a0-938d-fe5d-a6e7-ddaef3577555@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------F5D270C94F6574790E6B5A24"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxL01UFrVilPJXAA--.33239S3
X-Coremail-Antispam: 1UD129KBjvJXoW7trykXFyfKr15tr4UKrW3Wrg_yoW8XrWUpF
 18tr4kCryUJw18CrnFyw4jqFy5Arn7J3y5Xw18XFyUCrn8Gr12gr1vgryj9ryjyw48Jr1j
 yF4jqry5ZF1DAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
 vE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8
 JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
 C7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfUwYFCUUUUU
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
--------------F5D270C94F6574790E6B5A24
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/6/24 上午9:20, Richard Henderson wrote:
> On 6/23/22 17:45, maobibo wrote:
>>
>>
>> 在 2022/6/24 07:34, Richard Henderson 写道:
>>> On 6/23/22 01:55, Song Gao wrote:
>>>> +static void setup_sigcontext(CPULoongArchState *env,
>>>> +                             struct target_sigcontext *sc,
>>>> +                             struct extctx_layout *extctx)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    if (extctx->flags & SC_USED_FP) {
>>>> +        __put_user(extctx->fpu.addr, &sc->sc_extcontext[0]);
>>>> +    } else {
>>>> +        __put_user(extctx->end.addr, &sc->sc_extcontext[0]);
>>>> +    }
>>>
>>> This is incorrect.  Where did this come from?  It certainly doesn't 
>>> appear in the kernel's version of setup_sigcontext. The only reason 
>>> the result works for you is that this is overwritten by 
>>> copy_fpu_to_sigframe within setup_sigframe.
>>
>> The val of flags is SC_USED_FP alway in function setup_extcontext in 
>> this version. We want to optimization in future if FP is not used for 
>> application where sigcontext for FP is not necessary. Also it can 
>> will be extended for 128bit/256bit vector FPU.
>
> No, that's not what I mean.  The store of the address is incorrect.
> This is no such address stored in the frame at this location.
>
> If you believe that I am incorrect, please point to the line within 
> the kernel source to which this corresponds.

You're right,   I'll corrrect on next version.

Thanks.
Song Gao

--------------F5D270C94F6574790E6B5A24
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/6/24 上午9:20, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7fbda1a0-938d-fe5d-a6e7-ddaef3577555@linaro.org">On
      6/23/22 17:45, maobibo wrote:
      <br>
      <blockquote type="cite" style="color: #000000;">
        <br>
        <br>
        在 2022/6/24 07:34, Richard Henderson 写道:
        <br>
        <blockquote type="cite" style="color: #000000;">On 6/23/22
          01:55, Song Gao wrote:
          <br>
          <blockquote type="cite" style="color: #000000;">+static void
            setup_sigcontext(CPULoongArchState *env,
            <br>
            +                             struct target_sigcontext *sc,
            <br>
            +                             struct extctx_layout *extctx)
            <br>
            +{
            <br>
            +    int i;
            <br>
            +
            <br>
            +    if (extctx-&gt;flags &amp; SC_USED_FP) {
            <br>
            +        __put_user(extctx-&gt;fpu.addr,
            &amp;sc-&gt;sc_extcontext[0]);
            <br>
            +    } else {
            <br>
            +        __put_user(extctx-&gt;end.addr,
            &amp;sc-&gt;sc_extcontext[0]);
            <br>
            +    }
            <br>
          </blockquote>
          <br>
          This is incorrect.  Where did this come from?  It certainly
          doesn't appear in the kernel's version of setup_sigcontext. 
          The only reason the result works for you is that this is
          overwritten by copy_fpu_to_sigframe within setup_sigframe.
          <br>
        </blockquote>
        <br>
        The val of flags is SC_USED_FP alway in function
        setup_extcontext in this version. We want to optimization in
        future if FP is not used for application where sigcontext for FP
        is not necessary. Also it can will be extended for 128bit/256bit
        vector FPU.
        <br>
      </blockquote>
      <br>
      No, that's not what I mean.  The store of the address is
      incorrect.
      <br>
      This is no such address stored in the frame at this location.
      <br>
      <br>
      If you believe that I am incorrect, please point to the line
      within the kernel source to which this corresponds.<br>
    </blockquote>
    <p>You're right,   I'll corrrect on next version.</p>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------F5D270C94F6574790E6B5A24--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C138345B886
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:42:08 +0100 (CET)
Received: from localhost ([::1]:50598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppj5-0006EK-Up
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:42:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mppQR-00059G-UJ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:22:52 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54590 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mppQN-0007Hl-S8
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:22:51 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxxtNxEp5hafcAAA--.4491S3;
 Wed, 24 Nov 2021 18:22:41 +0800 (CST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <b689fffe-8d92-c1f6-9a36-9cc95871e4fa@loongson.cn>
Date: Wed, 24 Nov 2021 18:22:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------C26A217F92656403521B575C"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxxtNxEp5hafcAAA--.4491S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JrykCw1rZrWxuw1rJFyrJFb_yoW3AFg_KF
 45GrnI9w18uw4Iqw48Jr1rZF45JrWjqF10qF40vryUZrWjq39Ivws0ywn5Aw1xKr48J3ZI
 yr90gry3uFyUAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb38Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
 1l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUwYFCUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-4.1, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------C26A217F92656403521B575C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,
On 2021/11/20 下午6:33, Richard Henderson wrote:
>> +{
>> +    int i;
>> +
>> +    __put_user(env->pc, &sc->sc_pc);
>> +
>> +    __put_user(0, &sc->sc_gpr[0]);
>> +    for (i = 1; i < 32; ++i) {
>> +        __put_user(env->gpr[i], &sc->sc_gpr[i]);
>> +    }
>> +
>> +    for (i = 0; i < 32; ++i) {
>> +        __put_user(env->fpr[i], &sc->sc_fpr[i]);
>> +    }
>> +}
>
> Missing fcsr and fcc. 
I see that  kernel  define  the fcc used type uint64_t,   and  used 
movgr2cf/movcf2gr  save and restore the fcc0-fcc7.
but  qemu define  fcc0-fcc7 as  bool cf[8] at target/loongarch/cpu.h,   
how qemu can  save/restore fcc,  Do you have any idea?
Does we can define the fcc   as   bool cf[8]  at  struct target_sigcontext?

Thanks
Song Gao

--------------C26A217F92656403521B575C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Richard,<br>
    <div class="moz-cite-prefix">On 2021/11/20 下午6:33, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org">
      <blockquote type="cite" style="color: #000000;">+{
        <br>
        +    int i;
        <br>
        +
        <br>
        +    __put_user(env-&gt;pc, &amp;sc-&gt;sc_pc);
        <br>
        +
        <br>
        +    __put_user(0, &amp;sc-&gt;sc_gpr[0]);
        <br>
        +    for (i = 1; i &lt; 32; ++i) {
        <br>
        +        __put_user(env-&gt;gpr[i], &amp;sc-&gt;sc_gpr[i]);
        <br>
        +    }
        <br>
        +
        <br>
        +    for (i = 0; i &lt; 32; ++i) {
        <br>
        +        __put_user(env-&gt;fpr[i], &amp;sc-&gt;sc_fpr[i]);
        <br>
        +    }
        <br>
        +}
        <br>
      </blockquote>
      <br>
      Missing fcsr and fcc.
    </blockquote>
    I see that  kernel  define  the fcc used type uint64_t,   and  used 
    movgr2cf/movcf2gr  save and restore the fcc0-fcc7.<br>
    but  qemu define  fcc0-fcc7 as  bool cf[8] at
    target/loongarch/cpu.h,   how qemu can  save/restore fcc,  Do you
    have any idea? <br>
    Does we can define the fcc   as   bool cf[8]  at  struct
    target_sigcontext?<br>
    <br>
    Thanks<br>
    Song Gao<br>
  </body>
</html>

--------------C26A217F92656403521B575C--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44DD51BF80
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:34:56 +0200 (CEST)
Received: from localhost ([::1]:59518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmah5-0001qF-V3
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkei@sfc.wide.ad.jp>)
 id 1nmacr-0000Vh-4D; Thu, 05 May 2022 08:30:33 -0400
Received: from mail1.sfc.wide.ad.jp ([2001:200:0:8803:203:178:142:133]:39266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkei@sfc.wide.ad.jp>)
 id 1nmacl-0003OB-2X; Thu, 05 May 2022 08:30:31 -0400
Received: from [10.0.1.12] (h219-110-166-078.catv02.itscom.jp [219.110.166.78])
 (Authenticated sender: mkei)
 by mail1.sfc.wide.ad.jp (Postfix) with ESMTPSA id B69FCAF90;
 Thu,  5 May 2022 21:30:19 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sfc.wide.ad.jp;
 s=mail1; t=1651753819;
 bh=TmP13wsmF4jLlpXsjw2mFIsFoYX4sK5E9LWJpKYtnGQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FRjdTA8hOwb9t9pQ94x+1qGoNCRK/linZ+rsjutUcc4HJU5lz7diWKOXU5xBS8jjj
 DWUJgbkMGe59XM2L2Z6jFITvmZXzM7Drbg0dcA2T3x24FOAKE6EhCc9HBQmZIrhVoH
 8wn7yflB0MsPlqI/5HUYX5IQl/AHUffuWNVdIi7SSVaRsGAOCLQNThOzf5IjOaC5on
 ST2clc6IJgY0CTk1hmT5x4F6lwkq5gdKYE7qU6SENGkO2VlgBQbWgaEQxNz8Kks5xY
 hs2k532Qaw8DUKVwMKzRJg1dnuyASDPEhYVOEQMeyIxMj02i8XN4+/tU+LxYrQ9+6X
 El/oo0gRHQHiQ==
Content-Type: multipart/alternative;
 boundary="------------u9VVMAGh4Y8lhyxda03qmM1c"
Message-ID: <43b4340d-5ddd-094b-408f-111082a73501@sfc.wide.ad.jp>
Date: Thu, 5 May 2022 21:30:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] target/arm: fix s2mmu input size check
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20220505004046.6711-1-mkei@sfc.wide.ad.jp>
 <CAFEAcA_XA_-Gfq+UQRV63Uxp7Pz4DksZGb8dR0NuZ1KkQ+iozA@mail.gmail.com>
From: Keisuke Iida <mkei@sfc.wide.ad.jp>
In-Reply-To: <CAFEAcA_XA_-Gfq+UQRV63Uxp7Pz4DksZGb8dR0NuZ1KkQ+iozA@mail.gmail.com>
Received-SPF: pass client-ip=2001:200:0:8803:203:178:142:133;
 envelope-from=mkei@sfc.wide.ad.jp; helo=mail1.sfc.wide.ad.jp
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
--------------u9VVMAGh4Y8lhyxda03qmM1c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Address Translation Fault is triggered when PA size set by VTCR_EL2.PS is less than IPA size set by VTCR_EL2.T0SZ on the guest. (e.g. vtcr_el2.PS = 1 && vtcr_el2.T0SZ = 25. PA size is 36bit, and IPA size is 39bit.)

         ps = FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
         ps = MIN(ps, param.ps);
         assert(ps < ARRAY_SIZE(pamax_map));
         outputsize = pamax_map[ps];

When 'param.ps' determined by VTCR_EL2.PS less than 'ps', 'outputsize' is set to PA address by VTCR_EL2.PS.

--

Keisuke Iida

On 2022/05/05 17:20, Peter Maydell wrote:

> On Thu, 5 May 2022 at 01:40,<mkei@sfc.wide.ad.jp>  wrote:
>> From: Keisuke Iida<mkei@sfc.wide.ad.jp>
>>
>> The maximum IPA size('inputsize') is constrained by the implemented PA size that is
>> specified by ID_AA64MMFR0_EL1.PARange. Please reference Arm Architecture Reference
>> Manual for A-profile architecture "Supported IPA size" on page D5-4788.
>>
>> Signed-off-by: Keisuke Iida<mkei@sfc.wide.ad.jp>
>> ---
>>   target/arm/helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 5a244c3ed9..868e7a2c0b 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -11116,7 +11116,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>>           }
>>
>>           /* Inputsize checks.  */
>> -        if (inputsize > outputsize &&
>> +        if (inputsize > arm_pamax(cpu) &&
>>               (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
>>               /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
>>               return false;
> Can you give an example, eg a test case, where you see wrong
> behaviour? The 'outputsize' variable in this function is
> passed in from the caller get_phys_addr_lpae(), where (for
> an AArch64 guest) it is indeed constrained to the value
> of ID_AA64MMFR0.PARange:
>
>          /*
>           * Bound PS by PARANGE to find the effective output address size.
>           * ID_AA64MMFR0 is a read-only register so values outside of the
>           * supported mappings can be considered an implementation error.
>           */
>          ps = FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
>          ps = MIN(ps, param.ps);
>          assert(ps < ARRAY_SIZE(pamax_map));
>          outputsize = pamax_map[ps];
>
>
> thanks
> -- PMM
--------------u9VVMAGh4Y8lhyxda03qmM1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Address Translation Fault is triggered when PA size set by VTCR_EL2.PS is less than IPA size set by VTCR_EL2.T0SZ on the guest. (e.g. vtcr_el2.PS = 1 &amp;&amp; vtcr_el2.T0SZ = 25. PA size is 36bit, and IPA size is 39bit.)

        ps = FIELD_EX64(cpu-&gt;isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
        ps = MIN(ps, param.ps);
        assert(ps &lt; ARRAY_SIZE(pamax_map));
        outputsize = pamax_map[ps];

When 'param.ps' determined by VTCR_EL2.PS less than 'ps', 'outputsize' is set to PA address by VTCR_EL2.PS.

--</pre>
    <pre>Keisuke Iida
</pre>
    <div class="moz-cite-prefix">
      <pre>On 2022/05/05 17:20, Peter Maydell wrote:</pre>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA_XA_-Gfq+UQRV63Uxp7Pz4DksZGb8dR0NuZ1KkQ+iozA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, 5 May 2022 at 01:40, <a class="moz-txt-link-rfc2396E" href="mailto:mkei@sfc.wide.ad.jp">&lt;mkei@sfc.wide.ad.jp&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
From: Keisuke Iida <a class="moz-txt-link-rfc2396E" href="mailto:mkei@sfc.wide.ad.jp">&lt;mkei@sfc.wide.ad.jp&gt;</a>

The maximum IPA size('inputsize') is constrained by the implemented PA size that is
specified by ID_AA64MMFR0_EL1.PARange. Please reference Arm Architecture Reference
Manual for A-profile architecture "Supported IPA size" on page D5-4788.

Signed-off-by: Keisuke Iida <a class="moz-txt-link-rfc2396E" href="mailto:mkei@sfc.wide.ad.jp">&lt;mkei@sfc.wide.ad.jp&gt;</a>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5a244c3ed9..868e7a2c0b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11116,7 +11116,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         }

         /* Inputsize checks.  */
-        if (inputsize &gt; outputsize &amp;&amp;
+        if (inputsize &gt; arm_pamax(cpu) &amp;&amp;
             (arm_el_is_aa64(&amp;cpu-&gt;env, 1) || inputsize &gt; 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can you give an example, eg a test case, where you see wrong
behaviour? The 'outputsize' variable in this function is
passed in from the caller get_phys_addr_lpae(), where (for
an AArch64 guest) it is indeed constrained to the value
of ID_AA64MMFR0.PARange:

        /*
         * Bound PS by PARANGE to find the effective output address size.
         * ID_AA64MMFR0 is a read-only register so values outside of the
         * supported mappings can be considered an implementation error.
         */
        ps = FIELD_EX64(cpu-&gt;isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
        ps = MIN(ps, param.ps);
        assert(ps &lt; ARRAY_SIZE(pamax_map));
        outputsize = pamax_map[ps];


thanks
-- PMM
</pre>
    </blockquote>
  </body>
</html>

--------------u9VVMAGh4Y8lhyxda03qmM1c--


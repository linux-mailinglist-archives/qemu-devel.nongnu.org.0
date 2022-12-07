Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B236460FC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 19:28:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2z8z-0000MT-IW; Wed, 07 Dec 2022 13:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2z8v-0000Lu-6B
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:27:41 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2z8t-0002cX-9c
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:27:40 -0500
Received: by mail-wr1-x436.google.com with SMTP id d1so29262918wrs.12
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 10:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZzFU05SfHFVy3EYB9E3BH/H+hL0+laMUA+If7N9qHek=;
 b=uZbVUa8+2NoJI7Bb7GZ0EdLU5y25OWhhHBmfgcdsA44Xjdh8bBIikaRPlbITsV5OKT
 k4DGj/KvNj1iDwSZMxow5iy5t3Xwl8E8WLbnofJIOCq4NYAaifvHu7kVK7a98fksnxIe
 ZvrMOCNKj7LC2Z8Io84kp9RoF+N0vgQjxpNVN3j+IF5QwkABxb43yc7jGFqv80kTNQjw
 ohKyCVJaIfhymbqrgp8H7FQ66rIzthkxxfP520Na1wz3qFNokv21OW3RSfbukHWQAJE8
 /sCzSXtuDmuT5bmEX1pcAnkk+alK+P1jCl+VR2+BJkYSEYUKtQBLfvvWUWzgTeuYalVp
 LCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzFU05SfHFVy3EYB9E3BH/H+hL0+laMUA+If7N9qHek=;
 b=42Khy5PTRCF81zkKety1jGpFRcSSo9bfh8jHxT3c/T88/Sa7kZC0XXV/wwxTXCECj5
 YD7txVB8Lg9lPeBOIzetvCLxpb60Bwbs+7DuBYgnlDn3OUrkDmWoQ1tL5EMUVKEiLzw9
 Rp12AvSe+eA9ASLf7WFtbt68f1C5fL5Lx3EvC8PRhga0jdbP2DSMfFJdHyN4iMM6xTg/
 HCJlsFIShZFWcmGgvsKqP5/rKDlSj00lC9212FgBwEMr5VHgi4mCpJZijnuFleMslQ9t
 CVb2PLTOBKZ86ISZvjIXH8NV86Tu2w4utJQonS/t70StEL/rAeDD0kWb7Z7byRQjjif4
 tYmA==
X-Gm-Message-State: ANoB5pnkUE0LQuXd7tEc/r+dWR8fLEhGRH5W8cLwBgZNrKDm0DGm1vFe
 pNRrIGE6HDdUJeLcMNrbT6rBSg==
X-Google-Smtp-Source: AA0mqf7QM1G/eL8JyEm4DeAz8Z0MEQsv9ZsTbAnUMnfI6g4C6d+ge8LM1wBKYHL1lqLTmlycnnVioQ==
X-Received: by 2002:a5d:4c86:0:b0:242:1b09:7cde with SMTP id
 z6-20020a5d4c86000000b002421b097cdemr27371643wrs.513.1670437657239; 
 Wed, 07 Dec 2022 10:27:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t2-20020a5d42c2000000b002365b759b65sm20093546wrr.86.2022.12.07.10.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 10:27:36 -0800 (PST)
Message-ID: <6acb79ca-d12a-7f94-2112-5f0f9480f473@linaro.org>
Date: Wed, 7 Dec 2022 19:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 2/4] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Stafford Horne <shorne@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20221207174129.77593-1-philmd@linaro.org>
 <20221207174129.77593-3-philmd@linaro.org>
 <CAFEAcA_DwMB7CZERo3EG2wRAQp6ugiikxhqtMxOaWS+dd8tn3g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_DwMB7CZERo3EG2wRAQp6ugiikxhqtMxOaWS+dd8tn3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/12/22 19:23, Peter Maydell wrote:
> On Wed, 7 Dec 2022 at 17:42, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Both insert/remove_breakpoint() handlers are used in system and
>> user emulation. We can not use the 'hwaddr' type on user emulation,
>> we have to use 'vaddr' which is defined as "wide enough to contain
>> any #target_ulong virtual address".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   gdbstub/internals.h        | 6 ++++--
>>   include/sysemu/accel-ops.h | 6 +++---
>>   2 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
>> index eabb0341d1..b23999f951 100644
>> --- a/gdbstub/internals.h
>> +++ b/gdbstub/internals.h
>> @@ -9,9 +9,11 @@
>>   #ifndef _INTERNALS_H_
>>   #define _INTERNALS_H_
>>
>> +#include "exec/cpu-common.h"
>> +
>>   bool gdb_supports_guest_debug(void);
>> -int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
>> -int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
>> +int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
>> +int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
>>   void gdb_breakpoint_remove_all(CPUState *cs);
>>
>>   #endif /* _INTERNALS_H_ */
>> diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
>> index 8cc7996def..30690c71bd 100644
>> --- a/include/sysemu/accel-ops.h
>> +++ b/include/sysemu/accel-ops.h
>> @@ -10,7 +10,7 @@
>>   #ifndef ACCEL_OPS_H
>>   #define ACCEL_OPS_H
>>
>> -#include "exec/hwaddr.h"
>> +#include "exec/cpu-common.h"
>>   #include "qom/object.h"
>>
>>   #define ACCEL_OPS_SUFFIX "-ops"
>> @@ -48,8 +48,8 @@ struct AccelOpsClass {
>>
>>       /* gdbstub hooks */
>>       bool (*supports_guest_debug)(void);
>> -    int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
>> -    int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
>> +    int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
>> +    int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
>>       void (*remove_all_breakpoints)(CPUState *cpu);
>>   };
> 
> If you're changing the prototype of these methods on AccelOpsClass
> don't you also want to change the implementations, eg tcg_breakpoint_insert()?
> Interestingly that function calls cpu_breakpoint_insert() which
> already takes a 'vaddr' rather than a 'hwaddr'.

Yes I neglected to include these changes here:

-- >8 --
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be88ca0d71..c3fbc31123 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -48,7 +48,6 @@
  #include "sysemu/runstate.h"
  #include "semihosting/semihost.h"
  #include "exec/exec-all.h"
-#include "exec/hwaddr.h"
  #include "sysemu/replay.h"

  #include "internals.h"
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index f208c6cf15..129575e510 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -11,7 +11,6 @@

  #include "qemu/osdep.h"
  #include "exec/gdbstub.h"
-#include "exec/hwaddr.h"
  #include "sysemu/cpus.h"
  #include "internals.h"

@@ -24,7 +23,7 @@ bool gdb_supports_guest_debug(void)
      return false;
  }

-int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len)
  {
      const AccelOpsClass *ops = cpus_get_accel();
      if (ops->insert_breakpoint) {
@@ -33,7 +32,7 @@ int gdb_breakpoint_insert(CPUState *cs, int type, 
hwaddr addr, hwaddr len)
      return -ENOSYS;
  }

-int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len)
  {
      const AccelOpsClass *ops = cpus_get_accel();
      if (ops->remove_breakpoint) {
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 033e5fdd71..484bd8f461 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -9,7 +9,6 @@
   */

  #include "qemu/osdep.h"
-#include "exec/hwaddr.h"
  #include "exec/gdbstub.h"
  #include "hw/core/cpu.h"
  #include "internals.h"
@@ -20,7 +19,7 @@ bool gdb_supports_guest_debug(void)
      return true;
  }

-int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len)
  {
      CPUState *cpu;
      int err = 0;
@@ -41,7 +40,7 @@ int gdb_breakpoint_insert(CPUState *cs, int type, 
hwaddr addr, hwaddr len)
      }
  }

-int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len)
  {
      CPUState *cpu;
      int err = 0;
---

> In looking at this I discovered some rather confusing gdbstub behaviour:
> if you use the qemu.PhyMemMode custom gdb flag to put the stub into
> "physical memory mode", data reads and writes are done on physical
> addresses, but breakpoints and watchpoints continue to take virtual
> addresses.
> 
> But at any rate given that currently breakpoints are always on virtual
> addresses, vaddr is definitely the right type here and probably all
> the way down through the callstack.
> 
> thanks
> -- PMM



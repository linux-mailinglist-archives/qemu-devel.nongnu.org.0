Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DA6FFF6A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 05:47:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxJjG-0004Gk-Kh; Thu, 11 May 2023 23:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJjF-0004Gc-97
 for qemu-devel@nongnu.org; Thu, 11 May 2023 23:46:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJjD-0000M0-Eq
 for qemu-devel@nongnu.org; Thu, 11 May 2023 23:46:01 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f427118644so52755435e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 20:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683863157; x=1686455157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JXDmYDQCh0/xYq357df1cxG0/3e1SS76bhaNoIXZD0A=;
 b=fWP6tTzS8ouQhnlvmV4aqv38ONW4cX1onk0zEdKCii513rxB1Bq3+RdZmegzl99oko
 SEdtAPnCWMdSRQuq2gibQLFYTtr9flWpRDgpdSYIn3M+MqeOxQvhgOPaCM/W0EfkHNSn
 D6eW/IlhtivduhaG2QQVaQ++PYitVj+zfCh9WAOq6T/L56CyOxhmsQThfNpg6o5WKN/7
 8FEM0vy8wybYNSSBUbZnRGMUrz7Vv9C3rAJjGcp/sF6Gk9GbFEHw5JmCVUL8YExXZxu4
 Kud8BUYFcBDW91ml3/g7rA/0aIEv/gbBl+T+957IcffSN4gcdOHzvm87Tne09oQGf9+b
 43Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683863157; x=1686455157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JXDmYDQCh0/xYq357df1cxG0/3e1SS76bhaNoIXZD0A=;
 b=GKkjV82WuhjukljQwKXxgldwl2Eb9EmmyTuVBkOfTiWRIEeearU+AqZc0dPd7y4Tc9
 Nfkc0hpyEk/vhFBDORBDgp6HOASuzkMA9vPOJCdQbKUjAc8YS1rB3FVwoPfyA0BbmmVN
 FfR0gjbhcwRV7YVbwIkWkZxVqMoaaakw0GCdH7wD2vXt+++pxn9vOS8xmSsamUonh+Cp
 p5boIXYlMTPjKDlHJc+C7vSjp3fBjPBdEUwArW5E/w0GgGxFp3Zeo/ZQ7dwDdS0x8okt
 b/PQN2eQPoQSNxMQOPFvpiF8JUy60TdLDYIZJ0TB8cdiNdmsL910uOFiH1aHiocGpm2b
 lW8g==
X-Gm-Message-State: AC+VfDxli4z2zOkdHCOZc1uLRm3oQr9vC5XyDfQG9f6v5K6W4J41mkxc
 srSE/DseCVhOsYmG7jGfNW5/Ew==
X-Google-Smtp-Source: ACHHUZ5r8k+uqHpjFgejjJXg+8JHEBOmTHl9Jwq9I7scBbXqJF6lH52B2S/XMi3vrNCSD3v941FXRw==
X-Received: by 2002:a7b:c84a:0:b0:3f4:241a:e648 with SMTP id
 c10-20020a7bc84a000000b003f4241ae648mr13644777wml.24.1683863157444; 
 Thu, 11 May 2023 20:45:57 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b003f31cb7a203sm27016809wmc.14.2023.05.11.20.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 20:45:57 -0700 (PDT)
Message-ID: <d7f544e1-abf2-1f77-00a8-b3c09852fd0c@linaro.org>
Date: Fri, 12 May 2023 05:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] hw/intc: Add NULL pointer check on LoongArch ipi
 device
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230406100052.3355632-1-gaosong@loongson.cn>
 <20230406100052.3355632-2-gaosong@loongson.cn>
 <0de07b1e-1371-9bad-11e0-e57d8fb379fe@linaro.org>
 <255a9693-3660-35b4-8213-a609018bbb2c@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <255a9693-3660-35b4-8213-a609018bbb2c@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/5/23 05:01, Song Gao wrote:
> Hi,  Philippe
> 
> 在 2023/5/12 上午3:03, Philippe Mathieu-Daudé 写道:
>> On 6/4/23 12:00, Song Gao wrote:
>>> When ipi mailbox is used, cpu index is decoded from iocsr register.
>>> cpu maybe does not exist. This patch adss NULL pointer check on
>>> ipi device.
>>
>> How can that happens from a guest vcpu context?
>>
> cpuid(cs->cpu_index)  is decoded from iocsr register.
> 
>      cpuid = (val >> 16) & 0x3ff;   // ipi_sned [25:16]
> 
> The value maybe invalid.  qemu only support 4 vcpu.

What about something like this?

-- >8 --
-static void ipi_send(uint64_t val)
+static void ipi_send(uint32_t val)
  {
-    int cpuid, data;
+    uint32_t cpuid;
+    uint8_t vector;
      CPULoongArchState *env;
      CPUState *cs;
      LoongArchCPU *cpu;

-    cpuid = (val >> 16) & 0x3ff;
+    cpuid = extract32(val, 16, 10);
+    if (cpuid >= MAX_IPI_CORE_NUM) {
+        trace_loongarch_ipi_unsupported_cpuid("IOCSR_IPI_SEND", cpuid);
+        return;
+    }
      /* IPI status vector */
-    data = 1 << (val & 0x1f);
+    vector = extract8(val, 0, 5);
+
      cs = qemu_get_cpu(cpuid);
      cpu = LOONGARCH_CPU(cs);
      env = &cpu->env;
      address_space_stl(&env->address_space_iocsr, 0x1008,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+                      BIT(vector), MEMTXATTRS_UNSPECIFIED, NULL);

  }
---

> you can find more about ipi_send registers at:
> https://github.com/loongson/LoongArch-Documentation/releases/download/2023.04.20/Loongson-3A5000-usermanual-v1.03-EN.pdf
> Table 63. Processor core inter-processor communication registers
> 
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>   hw/intc/loongarch_ipi.c | 31 +++++++++++++++++++------------
>>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
>>> index 0563d83a35..39e899df46 100644
>>> --- a/hw/intc/loongarch_ipi.c
>>> +++ b/hw/intc/loongarch_ipi.c
>>> @@ -86,11 +86,12 @@ static void ipi_send(uint64_t val)
>>>       /* IPI status vector */
>>>       data = 1 << (val & 0x1f);
>>>       cs = qemu_get_cpu(cpuid);
>>> -    cpu = LOONGARCH_CPU(cs);
>>> -    env = &cpu->env;
>>> -    address_space_stl(&env->address_space_iocsr, 0x1008,
>>> -                      data, MEMTXATTRS_UNSPECIFIED, NULL);
>>> -
>>> +    if (cs) {
>>> +        cpu = LOONGARCH_CPU(cs);
>>> +        env = &cpu->env;
>>> +        address_space_stl(&env->address_space_iocsr, 0x1008,
>>> +                          data, MEMTXATTRS_UNSPECIFIED, NULL);
>>> +    }
>>
>> Is that the hardware behavior?
>>
> Yes.
>> Could logging the invalid cpuid request be useful?
>>
> Sure.
> 
> Thanks.
> Song Gao
> 



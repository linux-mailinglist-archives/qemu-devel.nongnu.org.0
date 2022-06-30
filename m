Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D2560F6C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 05:04:53 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6kU8-0006Z9-4t
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 23:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6kSs-0005pN-Vn
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 23:03:34 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6kSr-0007zc-F1
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 23:03:34 -0400
Received: by mail-pf1-x429.google.com with SMTP id n12so16926247pfq.0
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 20:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eFrmibnOmK8XtuM6Tf2P09vssNYtvI09arlKksnBKmE=;
 b=gh082DJ/aYAWrrxFP3fklYYjtIoW+j/NN4MkEMRnj4P4EZJNZUvCVpg+Zc2sAZiNln
 HkviLYrDCvJA2USF4UphbxO4twsOAgYkmU4Uq0063yklzyZZen9dI5QYtjT+2vqiZUuR
 2kH0TwJGGzem1LZ8vtMUD5kT8RYrX6U6sEtBrgnv2jWWxm3nrPF2qoQ/YHgH5Rr69+A+
 OnBuOt78XCgmfOi8JSbbvmwaz67r5STd9pRHYkxzBQtzBOxlJineMGCRRUfY0V7fjeXp
 0GdMPB2QQRtSM14x8tiaq/JmtPC5F+hjcDaXDGAyxQR+mFladnfaQ2xKWQORA463rSl8
 5xUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eFrmibnOmK8XtuM6Tf2P09vssNYtvI09arlKksnBKmE=;
 b=6/0ZuCX1L8ojS08ByzWQl9ZiuHdwXCSqZ7uiyqp7BjQP52LzQ+1/vNzm8kmEeQFGz7
 WuycMeofYu/7VmHlZzUbt0ginAm1xMj0WAEM0elRmoMEFeQAq5sUW4BKJfcy/WZxV7Gn
 23Ozv8ig4y6yWxpmV71ytKAa8yTkg2fxhUtFhMdjeD/dD3h9JwSVgxtXOr5Mzts/Prgs
 Cb0RoCCAWWtgOjtuSoepH/lSYmLEtkAdN6tpShODVTy7XgZL33akMFI50uhlMWQRutCO
 1XnifGEkoxkoQ61UfBl+c32Ot9ePL8PU3IC1idnfrD38GLUs5hyoDmo6P6Vprbr2CPB5
 Km4g==
X-Gm-Message-State: AJIora+xs4951aomsF9oULqICyopSyeqEDBgwx85clX4rSztBf5R5P9X
 p8x5Y+WsxyPdpQq8UwAF8luX9Q==
X-Google-Smtp-Source: AGRyM1uZFnWsWDxmIxiqvexAY7Zh4+0DiY9yIDIzUAJE34QykecHZzGWoUwHktqumn/9aK+e4vJsUQ==
X-Received: by 2002:a05:6a00:168a:b0:4f7:e161:83cd with SMTP id
 k10-20020a056a00168a00b004f7e16183cdmr13470004pfc.56.1656558211129; 
 Wed, 29 Jun 2022 20:03:31 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 e13-20020aa7824d000000b0052527e3c5easm12224285pfn.87.2022.06.29.20.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 20:03:30 -0700 (PDT)
Message-ID: <fc510255-4813-6b96-f5e5-de4e591a9e7b@linaro.org>
Date: Thu, 30 Jun 2022 08:33:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: qemu-system-s390x hang in tcg
Content-Language: en-US
To: Sven Schnelle <svens@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: David Hildenbrand <david@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Liam Howlett
 <liam.howlett@oracle.com>, Heiko Carstens <hca@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>,
 "maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yu Zhao <yuzhao@google.com>, Juergen Gross <jgross@suse.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Andreas Krebbel <krebbel@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20220426150616.3937571-24-Liam.Howlett@oracle.com>
 <20220428201947.GA1912192@roeck-us.net>
 <20220429003841.cx7uenepca22qbdl@revolver>
 <20220428181621.636487e753422ad0faf09bd6@linux-foundation.org>
 <20220502001358.s2azy37zcc27vgdb@revolver>
 <20220501172412.50268e7b217d0963293e7314@linux-foundation.org>
 <Ym+v4lfU5IyxkGc4@osiris> <20220502133050.kuy2kjkzv6msokeb@revolver>
 <YnAn3FI9aVCi/xKd@osiris> <YnGHJ7oroqF+v1u+@osiris>
 <20220503215520.qpaukvjq55o7qwu3@revolver>
 <60a3bc3f-5cd6-79ac-a7a8-4ecc3d7fd3db@linux.ibm.com>
 <15f5f8d6-dc92-d491-d455-dd6b22b34bc3@redhat.com>
 <yt9d5ykkhrvv.fsf_-_@linux.ibm.com> <87pmirj3aq.fsf@linaro.org>
 <yt9dbkubhhna.fsf@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <yt9dbkubhhna.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/29/22 16:16, Sven Schnelle wrote:
> Thanks, that was very helpful. I added debugging and it turned out
> that the TB is left because of a pending irq. The code then calls
> s390_cpu_exec_interrupt:
> 
> bool s390_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> {
>      if (interrupt_request & CPU_INTERRUPT_HARD) {
>          S390CPU *cpu = S390_CPU(cs);
>          CPUS390XState *env = &cpu->env;
> 
>          if (env->ex_value) {
>              /* Execution of the target insn is indivisible from
>                 the parent EXECUTE insn.  */
>              return false;
>          }
>          if (s390_cpu_has_int(cpu)) {
>              s390_cpu_do_interrupt(cs);
>              return true;
>          }
>          if (env->psw.mask & PSW_MASK_WAIT) {
>              /* Woken up because of a floating interrupt but it has already
>               * been delivered. Go back to sleep. */
>              cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HALT);
>          }
>      }
>      return false;
> }
> 
> Note the 'if (env->ex_value) { }' check. It looks like this function
> just returns false in case tcg is executing an EX instruction. After
> that the information that the TB should be exited because of an
> interrupt is gone. So the TB's are never exited again, although the
> interrupt wasn't handled. At least that's my assumption now, if i'm
> wrong please tell me.

Ah, yes, I see.

We wanted to treat ex_value != 0 as if interrupts are disabled, because we have no way of 
stacking that value for re-execution after the interrupt (which itself could use EXECUTE).

One solution might be to zap ex_value and arrange to re-execute the EXECUTE instruction 
after the interrupt.

Another solution is to generate an exit from any TB translating ex_value, so that 
interrupts are re-examined.  This is probably cleanest.  I'll prepare a patch.


r~


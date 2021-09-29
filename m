Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1540941CAF9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 19:17:19 +0200 (CEST)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVdCo-0007jP-1P
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 13:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVd5a-0008PQ-JZ; Wed, 29 Sep 2021 13:09:50 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVd5Y-000389-Qm; Wed, 29 Sep 2021 13:09:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id d6so5427421wrc.11;
 Wed, 29 Sep 2021 10:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+H8AOyZXxw+5dCnqa2Q8A+xVYQisa33e+HzuNr9q3b0=;
 b=e15wcr+U8+SeX0f0+TJQbJ9yTVrmhcbTbLrgO2+1meYKkYDow0z6HAQPlS+z+uYZj0
 Zqr/IVjHLuF8k/Y/e79uSZTBUAnkZ5yng16Ru1V/sY9FABLONWBS60RO7+8EENcdlxWF
 ztX4yUPdiQkuXt08X2OKZaDP/j6aiY1qGGykfS3wjVtFfpoTZ+ldIETCZB08i+bZ8XvP
 uHLFDedERYfIAKHAQFMminXoYCAGKSNC0980Bvkit5ICUBNJzDmhGMyS2dHEfHLtPQkb
 2X6h0QtYl2AnHzbd5I0v5uG1JG14MrMhSLhxMQGf8/x71RSUARTLI4hOZyqSc7fwZIOr
 cCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+H8AOyZXxw+5dCnqa2Q8A+xVYQisa33e+HzuNr9q3b0=;
 b=sVO0uYjEMxSC0MXilMid6vhe6SxlIwBbfh32gl+Qsj10o9CuXej9WUBSMAD1VxQvre
 m0WhmwIvRKyYPP8T6SF/pcls0UPPNh1qUFLIr3SgkgcCsjqfcqsCxF34KXCaxFzbEqID
 D/dMr9Qz4wWql3CHjW9TvEnsOEl/m6QHzE87hFwKLsxrll00X2zDh3f75gglljoUKJ9Y
 MtpMSPgloBB4JhC8rsH/KhAUHvM+XhOYuCZx83y053UTPYBkJvA7wYRA46TP27tZMdWR
 oCLiYh1SkyUi8kTFsweeVsR5cJ3joqANKWGLgMUBiW/b3ZR6rZ/d73bDGDYJYVMabbDf
 AkRQ==
X-Gm-Message-State: AOAM532jfFor68Uph/GQdOnSwsmGTY83Btq/FMvctJLG0R4aSRjJMPnR
 FonsiLAphcIpZ06yu1eypKE=
X-Google-Smtp-Source: ABdhPJx91Earijit4bnHlQwY4VNfjWceJTN7Nua8OGpHlgNMgQcJyd3MLp/k3DH3+jrAr8VD/DyeCg==
X-Received: by 2002:a5d:5683:: with SMTP id f3mr1138553wrv.349.1632935387064; 
 Wed, 29 Sep 2021 10:09:47 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o17sm485218wrs.25.2021.09.29.10.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 10:09:46 -0700 (PDT)
Message-ID: <f022914b-052a-cb5e-e2aa-a01cb208b372@amsat.org>
Date: Wed, 29 Sep 2021 19:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] target/i386: Include 'hw/i386/apic.h' locally
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210929163124.2523413-1-f4bug@amsat.org>
 <bee85404-7092-5565-aa77-165b35db10ee@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <bee85404-7092-5565-aa77-165b35db10ee@vivier.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 Kamil Rytarowski <kamil@netbsd.org>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 18:51, Laurent Vivier wrote:
> Le 29/09/2021 à 18:31, Philippe Mathieu-Daudé a écrit :
>> Instead of including a sysemu-specific header in "cpu.h"
>> (which is shared with user-mode emulations), include it
>> locally when required.
>>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/i386/cpu.h                    | 4 ----
>>  hw/i386/kvmvapic.c                   | 1 +
>>  hw/i386/x86.c                        | 1 +
>>  target/i386/cpu-dump.c               | 1 +
>>  target/i386/cpu-sysemu.c             | 1 +
>>  target/i386/cpu.c                    | 1 +
>>  target/i386/gdbstub.c                | 4 ++++
>>  target/i386/hax/hax-all.c            | 1 +
>>  target/i386/helper.c                 | 1 +
>>  target/i386/hvf/hvf.c                | 1 +
>>  target/i386/hvf/x86_emu.c            | 1 +
>>  target/i386/nvmm/nvmm-all.c          | 1 +
>>  target/i386/tcg/sysemu/misc_helper.c | 1 +
>>  target/i386/tcg/sysemu/seg_helper.c  | 1 +
>>  target/i386/whpx/whpx-all.c          | 1 +
>>  15 files changed, 17 insertions(+), 4 deletions(-)
>>
> ...
>> diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
>> index 02b635a52cf..0158fd2bf28 100644
>> --- a/target/i386/cpu-dump.c
>> +++ b/target/i386/cpu-dump.c
>> @@ -22,6 +22,7 @@
>>  #include "qemu/qemu-print.h"
>>  #ifndef CONFIG_USER_ONLY
>>  #include "hw/i386/apic_internal.h"
>> +#include "hw/i386/apic.h"
>>  #endif
>>  
>>  /***********************************************************/
> 
> Why do you add this part compared to v1?

This is a mistake.

>> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
>> index 4ba6e82fab3..50058a24f2a 100644
>> --- a/target/i386/hvf/hvf.c
>> +++ b/target/i386/hvf/hvf.c
>> @@ -70,6 +70,7 @@
>>  #include <sys/sysctl.h>
>>  
>>  #include "hw/i386/apic_internal.h"
>> +#include "hw/i386/apic.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/accel.h"
>>  #include "target/i386/cpu.h"
> 
> Same question

Was missing for cpu_set_apic_tpr():

include/hw/i386/apic.h:16:void cpu_set_apic_tpr(DeviceState *s, uint8_t
val);
target/i386/hvf/hvf.c:98:    cpu_set_apic_tpr(x86_cpu->apic_state, tpr);
target/i386/hvf/hvf.c:618:
cpu_set_apic_tpr(x86_cpu->apic_state, tpr);

> 
> Thanks,
> Laurent
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29095BADA5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 14:56:35 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZAtW-0000EX-50
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 08:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oZAq9-0007Fc-W1
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 08:53:06 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oZAq6-0005pX-7X
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 08:53:04 -0400
Received: by mail-ed1-x532.google.com with SMTP id z97so31333467ede.8
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 05:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date;
 bh=QdttSviCf0ygv+YTCpEBOtBrrmIQlHeAXZkUUrgkZjo=;
 b=LHnsFfjdrHJB9wZbBjICQwkVGmQwcktscgRAUv/xBy7mWlnfq1NDGxndQZU+fiSUIr
 K7tbneUjOLwi35e+8uVYyLtcIgVsNhqHQ208dRxGaNHyIFsyU8906JiUoY2K3C1IIFbG
 6RF16He9CSxK11mIMlnUDYkBZqAALzRgjpPBAL26/aRqYzda6FNj/JLPUPw8k6cXyRRv
 Q98TkR1o0O3OpIZAFb5LWAI2jtXiFGohQaeXSL+K7PKbrUMvW9h3ixtqdwEAhxXgIql0
 weG90/nn5EFQN1BmRi2VXxnsN0+CQZgMBmCJVxBeWQkJixrogkZGS05NTxmTI17d2KJI
 nu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
 bh=QdttSviCf0ygv+YTCpEBOtBrrmIQlHeAXZkUUrgkZjo=;
 b=BS9iiorU82IrJTDVKDQT1Oz5HFWPB+2phZTI3QH8tgR7Aq5/VpTFRLdFCloDNltAg6
 yETFu5R7tGQ9r9U+mOvZf0bRbTeTTcaiqMVQ/e5HUMaHOOvrXh86BKR3o2/0d0AHE7Yq
 Pif3EaLlmUn7SxWoKxO2+xtTBM8+ikEE5nf2b5jpexmKQI6A4eHXo99xuYQNo97r4g6a
 pa6bBXPe+gVMHgnXGO0Pwuw/MOE5pb8fELeFM0VXfQI5aBeKk3p5ge/oUvoYeWh/jZrW
 QOu7GCE5r2qgXB4zCgYD1VYw5v8Um4c8+I6Zs9Nrnhl1d4paETnRKAu6KMN2xNi9aDmE
 H7vA==
X-Gm-Message-State: ACrzQf1rZqvIiUIKsuNnK/xaB6tQMIqrYbzZE831Z2qrim+UzSRruI3+
 Tc4uMQ9YSKSUSbjzz9G1JsCMwY483MtZYMIXbQE=
X-Google-Smtp-Source: AMsMyM6ssnP6/ShoBahpFMUA/vMZLbzKsQ05+BaouM0xYeYbnFP2mi6h+vZMrDMyE/sj7f2ag1mgHA==
X-Received: by 2002:a05:6402:138f:b0:43d:8ed5:c841 with SMTP id
 b15-20020a056402138f00b0043d8ed5c841mr3924055edv.27.1663332778877; 
 Fri, 16 Sep 2022 05:52:58 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170906645300b0073d9630cbafsm10184136ejn.126.2022.09.16.05.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 05:52:58 -0700 (PDT)
Date: Fri, 16 Sep 2022 05:52:58 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Sep 2022 05:52:56 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Add support for Ztso
In-Reply-To: <fc947302-23b4-7fd2-99d1-67793ee45070@linaro.org>
CC: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-5d39306a-7bd0-493f-8364-5ae9e921ec97@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=palmer@rivosinc.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 03 Sep 2022 17:47:54 PDT (-0700), richard.henderson@linaro.org wrote:
> On 9/2/22 04:44, Palmer Dabbelt wrote:
>> -#define TCG_GUEST_DEFAULT_MO 0
>> +/*
>> + * RISC-V has two memory models: TSO is a bit weaker than Intel (MMIO and
>> + * fetch), and WMO is approximately equivilant to Arm MCA.  Rather than
>> + * enforcing orderings on most accesses, just default to the target memory
>> + * order.
>> + */
>> +#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
>> +# define TCG_GUEST_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
>> +#else
>> +# define TCG_GUEST_DEFAULT_MO (0)
>> +#endif
>
> TCG_GUEST_DEFAULT_MO should be allowed to be variable.  Since I've not tried that, it may
> not work, but making sure that it does would be the first thing to do.
>
>> --- a/tcg/i386/tcg-target.h
>> +++ b/tcg/i386/tcg-target.h
>> @@ -236,6 +236,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>>  #include "tcg/tcg-mo.h"
>>
>>  #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
>> +#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1
>
> Um, no.  There's no need for this hackery...
>
>> +#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
>> +    /*
>> +     * We only support Ztso on targets that themselves are already TSO, which
>> +     * means there's no way to provide just RVWMO on those targets.  Instead
>> +     * just default to telling the guest that Ztso is enabled.:
>> +     */
>> +    DEFINE_PROP_BOOL("ztso", RISCVCPU, cfg.ext_ztso, true),
>> +#endif
>
> ... you can just as well define the property at runtime, with a runtime check on
> TCG_TARGET_DEFAULT_MO.
>
> Though, honestly, I've had patches to add the required barriers sitting around for the
> last few releases, to better support things like x86 on aarch64.  I should just finish
> that up.

I can just do that for the RISC-V TSO support?  Like the cover letter 
says that was my first thought, it's only when I found the comment 
saying not to do it that I went this way.

>
>
> r~


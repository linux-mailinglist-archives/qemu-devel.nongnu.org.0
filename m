Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41A926D4FF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 09:47:20 +0200 (CEST)
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIodT-0006GH-Pe
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 03:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kIocD-0005io-QA
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 03:46:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kIocB-0004cc-TX
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 03:46:01 -0400
Received: by mail-wm1-x333.google.com with SMTP id w2so980015wmi.1
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 00:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H+hTpqZmErOf8ZNO2YSrErbxTZtquE+GI8wzJNjaE3Y=;
 b=iOKozWIkxkhm6hZCCKubb91RIiMzG7WMYnDLhrpGQqo/dxlW6brz7YBaRBzSkddABX
 1G7jLHy+miFXVK6tXj5VUtgi/NlGGLHdHJn/Np+Cj9ueOFI68OuvF5Va+6HGtgPrnqAa
 w5imY104FiJwTOaePigVJyIomt9k5E1zPDYKIfrXSPoTSKtLSL01Ci1fovLWrVmj1mGH
 GwMY/Qf+fvRAXczOQnaGxbnRlG5zU6tZtuy4xRIQ+B6Tb54dTMXFO4fyhNvTdhNReiVA
 bo0RkM2p7azHBzBmCovjY4jMTSRi3B8tRowA2b/Qkteu5V/R74CSAuPlgV4vwUlRwR8/
 L0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H+hTpqZmErOf8ZNO2YSrErbxTZtquE+GI8wzJNjaE3Y=;
 b=cfQneyP1H6LXSHSWq346SEjQ5XKMdhuIvmTq0tscOfxvF0vTvdxhkpNf0hSaphx///
 PDOCgHvVfC9AvcQCzkjuwJtY0Y4ggfqVg4RzkDVlS2bevM41kk7/gZh8qwyZOfEisuvz
 oUsw6//IlxINae8pZgXzhEGuqJFZg/3MAggobqkiV4E6NkOEn1q1v5GcfUL6RyiivPki
 DJQKSBJjbeG5UKtaeMFUn940HbLfdxR24mYSmLwMNWY6HJT/4pVfMTO5vcR/83oQnebs
 xKPALtGQDTu+8siwi2czm6H8ZROE8ffU7DSDmr92c1h1XtYccSf1HwaDA+FOiY12OZRq
 bl1A==
X-Gm-Message-State: AOAM533AMafLSRNRp1xOqhG3UryX+AvIqIlf/X5GCs58G8JqVdelSU4F
 MOwa8GUc01zQsRsder6BWqA=
X-Google-Smtp-Source: ABdhPJyS7LiP6drntmO7KnDWPEuFHIeTj8d121Vpo8Sll25RTZ3bjo61c4pF6DfwP/Hpzm1x+zpyCg==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr8478899wmc.39.1600328757397; 
 Thu, 17 Sep 2020 00:45:57 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id a17sm40573552wra.24.2020.09.17.00.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 00:45:56 -0700 (PDT)
Subject: =?UTF-8?Q?Re=3a_Why_QEMU_translates_one_instruction_to_a_TB?=
 =?UTF-8?B?77yf?=
To: casmac <climber.cui@qq.com>, qemu-devel <qemu-devel@nongnu.org>
References: <tencent_EAC696641F035EB7E9885302EAAE37455907@qq.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7f78871a-01a8-f00f-4dcb-5ba95ed1fee4@amsat.org>
Date: Thu, 17 Sep 2020 09:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <tencent_EAC696641F035EB7E9885302EAAE37455907@qq.com>
Content-Type: text/plain; charset=gb18030
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.062, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/20 8:25 AM, casmac wrote:
> Hi all,
>      We try to add DSP architecure to QEMU 4.2. To load the COFF format
> object file, we have added loader code to load content from
>   the object file. 
[...]

>     The COFF loader works functionally, but we then found that sometimes
> QEMU is down-graded - it treats each instruction as one TB. In version
> 4.2,  debugging shows
> that get_page_addr_code_host() from accel/tcg/cputlb.c returns -1, as
> shown below.
> 
> accel/tcg/cputlb.c:
> tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong
> addr,
>                                         void **hostp)
> {
>     uintptr_t mmu_idx = cpu_mmu_index(env, true);
>     uintptr_t index = tlb_index(env, mmu_idx, addr);
>     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
>     void *p;
> 
>     //.....
>     if (unlikely(entry->addr_code & TLB_MMIO)) {
>         /* The region is not backed by RAM.  */
>         if (hostp) {
>             *hostp = NULL;
>         }
>         return -1;        /* debugging falls to this branch, after this
> point QEMU translate one instruction to a TB  */
>     }
>     //.......
> }   
> 
>     One intresting fact is that this somehow depends on the linker
> command file. The object file generated by the following linker command
> file(per_instr.lds)
> will "trigger" the problem. But QEMU work well with the object file
> linked by the other linker command file (ok.lds).
>     What cause get_page_addr_code_hostp() function to return -1? I have
> no clue at all. Any advise is appreciated!!

Maybe the "execute from small-MMU-region RAM" problem?

See:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg549660.html


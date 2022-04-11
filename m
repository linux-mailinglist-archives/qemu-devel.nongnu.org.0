Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FB04FC261
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:30:44 +0200 (CEST)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndww7-00039T-5o
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndwu9-0001OR-Qe
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:28:41 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndwu8-00086x-7m
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:28:41 -0400
Received: by mail-pf1-x435.google.com with SMTP id p8so15030589pfh.8
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XqM9oxu/BICMRdxmQdQx6E3Fn48BhOaZeXIL9gHebiQ=;
 b=smZ2xF0lYT6jOQSx4dmvo8eeoebi+knFxAN1ohkEm13jKeGeGXImbgVlRMP2KqNvO9
 u/k/LfqboblWd3EoSg2GS6laigmtzNFgkt3O9Rq8sA/EamokXiXp6nVh1obc97b/7lxS
 YtQ91bm1193CePK1ZiXFSZEctnDGLmNVgxMMEIq9AqGIBjrzn4t2lImEmsGtLbFKB6l5
 /nlNnjpEzlnz4PSr+8+BTeoitTDICaSZ4mjlkXEC9s2BO9IueXg9lhBrZ8BR5DY9PzW5
 fmMBjMjD1sVhI14VBgJzRcCnjdS95s64Cq761O9Z4O/fFakWHhVBkJRN92fApOCanwgy
 VoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XqM9oxu/BICMRdxmQdQx6E3Fn48BhOaZeXIL9gHebiQ=;
 b=GxdQV8hbqF1h2zTBswXIcO/KkVDoGFGY3NoLtGE3Elpv1BhJHeCxmIMAuEUxKSb1tC
 ZZcN/eLBPnookyQX+bnRM4mOlYv/Op55F9UDFOu5lkiGyu5hLhTLIsqXAAjKeRpoH4AF
 YaPum0XznLU9z3aGSmo+dJUc9nSUnhRqaDHt8/+Fns1wFUYz/kUbdG1d4ZYsgitytpgm
 CEgQXCZt9657QN7hTOqLLITrRtRQcV9PdNu4GMZS8AA4QaKKjG6QjliXdlCBBfrsvPr7
 /le76NfIhOXrtJlultg5VLQv72F7pat6yH/g3a9X8sSKmt7XxaHk7YocEq0+GZ6/PQRe
 q5Ig==
X-Gm-Message-State: AOAM530OyD37ct/BEL0CtLh34j0G4mbBGyKTDi285OBHDKtn3KfTPRkS
 +4+FLzV41WswOViRPksS7FoEpA==
X-Google-Smtp-Source: ABdhPJyQb1I1tZNNdaLH6VyExdVITpKjhSrmth60hm+IMTVLKWOYnspSgFqXg0lE18n0pfhILl3J+Q==
X-Received: by 2002:a05:6a00:999:b0:4fa:964f:9021 with SMTP id
 u25-20020a056a00099900b004fa964f9021mr33731763pfg.34.1649694518141; 
 Mon, 11 Apr 2022 09:28:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a63b510000000b00398d8b19bbfsm241445pge.23.2022.04.11.09.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 09:28:37 -0700 (PDT)
Message-ID: <6e9d502c-343f-7d20-27d8-ecf57e020d66@linaro.org>
Date: Mon, 11 Apr 2022 09:28:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/16] target/arm: Update qemu-system-arm -cpu max to
 cortex-a57
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-4-richard.henderson@linaro.org>
 <CAFEAcA_HUXLC1Rr05rVCsMyY_EgqdQxpx3mnrrJA2p-WL79c0A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_HUXLC1Rr05rVCsMyY_EgqdQxpx3mnrrJA2p-WL79c0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/22 08:37, Peter Maydell wrote:
>> +    /* aarch64_a57_initfn, advertising none of the aarch64 features */
>> +    cpu->dtb_compatible = "arm,cortex-a57";
>> +    set_feature(&cpu->env, ARM_FEATURE_V8);
>> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
>> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
>> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
>> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>> +    cpu->midr = 0x411fd070;
> 
> If we're going to claim in the MIDR that we're an A57 then we
> should provide the A57's impdef sysregs, at least those of
> them that are visible to AArch32. This may otherwise cause
> problems if the guest OS tries to write to one of them as
> part of some errata workaround.

Ah yes.  Thanks,

r~


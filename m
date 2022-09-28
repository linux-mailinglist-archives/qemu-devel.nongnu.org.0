Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523E5EE320
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:28:48 +0200 (CEST)
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odarT-0004vR-By
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaId-0008Fs-LG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:52:44 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaIa-0002Fo-17
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:52:42 -0400
Received: by mail-pg1-x531.google.com with SMTP id bh13so12739521pgb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zbzryDewVpE0zsNwPmWj4WQt6orDR/cL0kQ7Gc204R4=;
 b=nqxlqOtJYP0KtBJK1rREKMXheggD61HdDIQO8IoM9efC6r6RrPpwjFPfxn7BwYfVRS
 2PgBsvll4CyLGV+8JC1XHOnv3s0Ou1mA1eo98wsUQjHRuaAXCRYiizxdIAU0MbRSyqA9
 mffdpmK/Yj7aojh26yAuf3dWJibQcpghdcjcgxIotKGK58amrg1UH+azE+VirD+SuFa/
 XTxVnd3Iaq3Mgh9hm2Q5HvzS0wp+zVby30VdwlSAUP+u6BI/NQXsM1Y8G96TkH/rdLby
 nz91uQviB+1IwFumL8JSwiRgs7PS/hnp/mUFnljeOM6t6S4UCCKtw9UMBlW67jEpBwHC
 1rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zbzryDewVpE0zsNwPmWj4WQt6orDR/cL0kQ7Gc204R4=;
 b=LApi0WN29E1A9zvy4Gt16LSFxUH+fqPI/3qDLNs8zmn0464feHJQFpxLh61s2z16SX
 jb2FuCBIfoDcNW8ZlSZGgLrMKxGheTDyC+GVcGuXtNEpOZGDJlnTZbp0hMGjvic2n5+T
 fPb61VT9GRY8WPor70EDAc6fcU7c34aI6oSUHk002blEMe9cOk5pHsrbK7sB/97d4DCB
 1HjugtWzg6fdoTOoAtHMJf19f7xkf5eDw6el/PjX4gZBW/NbpNUp42bgrU6bPc0Tr5Cf
 SGEMWhtZ+TNseIT4EgKW9IKD6U4KSt2uLQvqLt/BHP5ZGUebqFiwKwfPpKn/fdurGEII
 BIvg==
X-Gm-Message-State: ACrzQf0ausjkmAjVm6GZVK+W9TkRtygpT15XtECpPHj205Uv+nmt6XJe
 9RX/kmSpNuhom0hxzZ+Y8GW5Vw==
X-Google-Smtp-Source: AMsMyM6lXk9JlO2TuDPv/ZHn2rvDFCvfBnxcNeOL6clNHVbfzrM7oW5tp8oe9EqAda1EC+4sCWexuA==
X-Received: by 2002:aa7:9107:0:b0:553:92a4:d930 with SMTP id
 7-20020aa79107000000b0055392a4d930mr35178043pfh.72.1664383958467; 
 Wed, 28 Sep 2022 09:52:38 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a170902bf4200b00178b6ccc8a0sm3961587pls.51.2022.09.28.09.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:52:37 -0700 (PDT)
Message-ID: <58228f3a-cd6f-32e0-bd82-0fbe6a1364b3@linaro.org>
Date: Wed, 28 Sep 2022 09:52:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 05/15] target/arm: ensure ptw accesses set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/27/22 07:14, Alex Bennée wrote:
> @@ -2289,8 +2289,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>       ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
>       bool is_secure = regime_is_secure(env, mmu_idx);
>   
> -    attrs->requester_type = MEMTXATTRS_CPU;
> -    attrs->requester_id = env_cpu(env)->cpu_index;
> +    result->attrs.requester_type = MTRT_CPU;
> +    result->attrs.requester_id = env_cpu(env)->cpu_index;

This hunk shouldn't compile, or the earlier patch shouldn't.
I think you have a rebase error in there somewhere.


> @@ -280,7 +280,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
>                              ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
>  {
>      CPUState *cs = env_cpu(env);
> -    MemTxAttrs attrs = {};
> +    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
>      MemTxResult result = MEMTX_OK;
>      AddressSpace *as;
>      uint64_t data;

Would be handled by a new patch introducing MEMTXATTRS_CPU, as described earlier.


r~


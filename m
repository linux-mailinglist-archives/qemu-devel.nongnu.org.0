Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8874E6870B9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:52:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNL0P-0005KX-Nb; Wed, 01 Feb 2023 16:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNL0M-0005KP-HL
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:50:58 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNL0K-00035G-Dk
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:50:57 -0500
Received: by mail-pl1-x634.google.com with SMTP id be8so19871391plb.7
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 13:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8e7/2Jp3shGEo1ssN5mbASgSUkBoL6jeehGaAhMEmw0=;
 b=F2WoRmgqZHCrhHuPv34P+ZKGtU3ploqO9TEBG0Ik05lBO4TcVRiVMkx6ICCfGX01nw
 vcmSSHD4uRayrulUIIX3QdsD2E1RT3LEWn91iLW1i08QMrBLeCbXffOAzjahU59ziiuw
 gzlc3GawZyhjPryRFl/CkSsSd5Ma2sqEyvhRQFfMOu7wB1GpMtkTutOozhPDaToJkBP1
 DyQi62XnQBpVSajhcjEcRcRol7vpDOBza7WHdgUrFZA4ZmKY374cJF/AR6HVNfZf43Tp
 R/P3QRMA0nYJZ+7Ljz5foojA4jZ9NtRTVyV2hs/WuL45a50vCqxx/Xgfg8EFQM4RIvwI
 2W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8e7/2Jp3shGEo1ssN5mbASgSUkBoL6jeehGaAhMEmw0=;
 b=v+MES7mG2eGb8jFXB/VbBE5Pdu3vThPCP2z1E4i3KjU9ekDwMZXQ4tjj6n1T9LCPnS
 yXWOYLFRDpq2qbOMPmd2M0JSdUBfxmNPCM+m+P2lnUR4Dv6nguEBy/Q2xzX4v0vtq7Hl
 pKAJ5IdMDGBTdjpg51Ia+KhoAylCkt9mz3WG7NHfSIBT+W5jDT3jCOrpDxzaE9zOLS9F
 63HuW4ultS2s9owVXVnuYKM+kF5E01/DOFjuhX+snxJTH6iOgvzarCcOr+4pDWBXn5x6
 QkJ9WO/QIOKy+5prgnEKdVpxTecNkXAVAwB+zvJ6LKtdjqXsJt54tZhP42tSyTNIFwj6
 qRYg==
X-Gm-Message-State: AO0yUKUPWottLFcNXS/4V4QL9kQAD7KTER33KpL7i84Ta0Fj1+CLUIkQ
 vxHYmKJZRNOFy6HYhY0TWWkNaA==
X-Google-Smtp-Source: AK7set9wFPM1hjc256AyaP0oxDRmi5svm2I1QxqUbSfPCMYMDHwX1xFC30CenUhmj/9FMlE53WIzmw==
X-Received: by 2002:a17:903:4053:b0:196:5035:98c0 with SMTP id
 n19-20020a170903405300b00196503598c0mr3520877pla.23.1675288254736; 
 Wed, 01 Feb 2023 13:50:54 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 o9-20020a1709026b0900b00180033438a0sm12137028plk.106.2023.02.01.13.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 13:50:53 -0800 (PST)
Message-ID: <ff3f25ee-1c98-242b-905e-0b01d9f0948d@linaro.org>
Date: Wed, 1 Feb 2023 11:50:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: An issue with x86 tcg and MMIO
Content-Language: en-US
To: =?UTF-8?Q?J=c3=b8rgen_Hansen?= <Jorgen.Hansen@wdc.com>
Cc: Ajay Joshi <Ajay.Joshi@wdc.com>, qemu-devel <qemu-devel@nongnu.org>,
 Sid Manning <sidneym@quicinc.com>
References: <78bc53e3-bad3-a5c3-9e53-7a89054aa37a@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <78bc53e3-bad3-a5c3-9e53-7a89054aa37a@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/1/23 05:24, Jørgen Hansen wrote:
> Hello Richard,
> 
> We are using x86 qemu to test some CXL stuff, and in that process we are
> running into an issue with tcg. In qemu, CXL memory is mapped as an MMIO
> region, so when using CXL memory as part of the system memory,
> application code and data can be spread out across a combination of DRAM
> and CXL memory (we are using the Linux tiered memory numa balancing,
> that will migrate individual pages between DRAM and CXL memory based on
> access patterns). When we are running memory intensive applications, we
> hit the following assert in translator_access:
> 
>                /* We cannot handle MMIO as second page. */
>                assert(tb->page_addr[1] != -1);
> 
> introduced in your commit 50627f1b. This is using existing applications
> and standard Linux. We discussed this with Alistair Francis and he
> mentioned that it looks like a load across a page boundary is happening,
> and it so happens that the first page is DRAM and second page MMIO. We
> tried - as a workaround - to return NULL instead of the assert to
> trigger the slow path processing, and that allows the system to make
> forward progress, but we aren't familiar with tcg, and as such aren't
> sure if that is a correct fix.
> 
> So we'd like to get your input on this - and understand whether the
> above usage isn't supported at all or if there are other possible
> workarounds.

Well, this may answer my question in

https://lore.kernel.org/qemu-devel/1d6b1894-9c45-2d70-abde-9c10c1b3b93f@linaro.org/

as to how this could occur.

Until relatively recently, TCG would refuse to execute out of MMIO *at all*.  This was 
relaxed to support Arm m-profile, which needs to execute a few instructions out of MMIO 
during the boot process, before jumping into flash.

This works by reading one instruction, translating it, executing it, and immediately 
discarding the translation.  It could be possible to adjust the translator to allow the 
second half of an instruction to be in MMIO, such that we execute and discard, however...

What is it about CXL that requires modeling with MMIO?  If it is intended to be used 
interchangeably with RAM by the guest, then you really won't like the performance you will 
see with TCG executing out of these regions.

Could memory across the CXL link be modeled as a ROM device, similar to flash?  This does 
not have the same restrictions as MMIO.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E115F7B0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 21:28:00 +0100 (CET)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2hZ9-0000vZ-3o
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 15:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54384)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hYP-0000Hr-O0
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:27:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hYO-0007pb-Fi
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:27:13 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2hYO-0007nj-9E
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:27:12 -0500
Received: by mail-pf1-x443.google.com with SMTP id x185so5406669pfc.5
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 12:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M7j4CG8nV+0KgYUGMZ6IOG13oj6Se74LLRKpGWdiWoc=;
 b=nsq8F6eT7Fi/2tYJJkvW7py8OfZPXn5znkyI4ewMJ1HEY0aun8j71wTrDV7qw3epHU
 /OLR9y+jvpvsPxJ1qty6VSVrpV9TPm804oITIZEEfDxH2qpLjiMDMA3h/IyU9aW8+n0j
 H+MRxILoOeSWhNY4m0Mm2mCokgaYFVX9o8x2TGc+wkIJsVK17hqjCN/9dbaF9fDe1tN0
 APjR/fRucLcqDEfbwKMbseu6uoPU+qOSJwYYxQpusZtENT7kHcvVA5nt5q6XYe9gjWS7
 uPpDF44QFG/5VeOyyd44bHjiuI2qHhbwuSo1I+tTw0S/hTeVl84s1OkZFZGKevxcBAzM
 R2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M7j4CG8nV+0KgYUGMZ6IOG13oj6Se74LLRKpGWdiWoc=;
 b=QJiKlJhoK3MxGVIOKENBk819KpO7vLHuGvCEYnsCdUvckeyA1JMEob7ZAOkqQRFtqE
 oa/MlzddFlGU5nDDTLkCSbUUqidR8teA5ymzY/Yy5bFqJh1bABYFIX5LMYc1BSmq7mKL
 8PpHzBgQcURRZTIjCOeFqYwNqKwPwlWA2TuzGlXN6qERi3Xrvr4XouWAuX6TSQH/+jOs
 BwvlvvXOsv9XvhI/krmmusZ2brPheJUADiYVA4bIWNLvXLXrGIwHjEX+Yprh56k5RWrA
 VxXw+1F4gNfMH42BtMAyUNR+o8Rz4LVpYN43GIJPMh//oC9YiMcF6lsFpU+63r3TO4CA
 lpAg==
X-Gm-Message-State: APjAAAVTKiw15dqNMxFLgcnVqqcRqrpPnE/gEuCnZ2+cZv0NxKrZKOqk
 3QHY8AqmTx8E2B/jVJuUn1DwJQ==
X-Google-Smtp-Source: APXvYqywCHHnEINmT+OqVghomynW1Ce8vaFZlyaUTVgFDpjwyw8BFRSKl+1eHTCtqSRrkup5FrvkKg==
X-Received: by 2002:a63:7c4d:: with SMTP id l13mr5353961pgn.275.1581712030128; 
 Fri, 14 Feb 2020 12:27:10 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c1sm8030081pfa.51.2020.02.14.12.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 12:27:09 -0800 (PST)
Subject: Re: [PATCH v2 12/21] target/arm: Read debug-related ID registers from
 KVM
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200214175116.9164-1-peter.maydell@linaro.org>
 <20200214175116.9164-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bb63598-4eef-18a8-9dbc-4f6652ba12e2@linaro.org>
Date: Fri, 14 Feb 2020 12:27:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214175116.9164-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/20 9:51 AM, Peter Maydell wrote:
> +        /*
> +         * DBGDIDR is a bit complicated because the kernel doesn't
> +         * provide an accessor for it in 64-bit mode, which is what this
> +         * scratch VM is in, and there's no architected "64-bit sysreg
> +         * which reads the same as the 32-bit register" the way there is
> +         * for other ID registers. Instead we synthesize a value from the
> +         * AArch64 ID_AA64DFR0, the same way the kernel code in
> +         * arch/arm64/kvm/sys_regs.c:trap_dbgidr() does.
> +         * We only do this if the CPU supports AArch32 at EL1.
> +         */
> +        if (FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL1) >= 2) {
> +            int wrps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
> +            int brps = FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
> +            int ctx_cmps =
> +                FIELD_EX64(ahcf->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
> +            int version = 6; /* ARMv8 debug architecture */
> +            bool has_el3 =
> +                !!FIELD_EX32(ahcf->isar.id_aa64pfr0, ID_AA64PFR0, EL3);
> +            uint32_t dbgdidr = 0;
> +
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, WRPS, wrps);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, BRPS, brps);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, CTX_CMPS, ctx_cmps);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, VERSION, version);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, NSUHD_IMP, has_el3);
> +            dbgdidr = FIELD_DP32(dbgdidr, DBGDIDR, SE_IMP, has_el3);
> +            dbgdidr |= (1 << 16); /* RES1 bit */

I see the RES1 bit as 15.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


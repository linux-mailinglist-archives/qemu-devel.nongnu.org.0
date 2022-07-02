Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130125640A2
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:09:37 +0200 (CEST)
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7doW-0000NH-5E
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dlx-0006Wg-OE
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:07:00 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dlu-00037B-K4
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:06:55 -0400
Received: by mail-pg1-x532.google.com with SMTP id r66so4921836pgr.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PXISK4N2YrRrtTnjOtxCLZcCteHVo1OwGJrOmDCcfdo=;
 b=KxX3V/h0569JOKkGwBntrTKCQ9DRplXIxS1jAeDU9pinqCfQpNsckL8j7dmN9YW2dE
 37j/ZpgvnvKR2pc/IH8N2SD71a5kY18ouPhXUUP4NcoeHnLZ2y4MpXH13WkCD5EcDhD2
 Ca+mEfR84JPc7TgJnCqG1ypDlur30tkHRD/OvNgYpSAnnKP49zUN+WoGo2mvMtygwRU1
 DgMnngufPEmBOv6y3fxVWLEsSgSZDqO4gx80YSWnguzCxkHFXcSr35XbEGqcckjpHOQT
 qHWro1A5abmH8x7QPOT406fBeWQkjyctWHav3q3Va+QDUHtoDq71ByGUOVIka+2OeB5g
 Rsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PXISK4N2YrRrtTnjOtxCLZcCteHVo1OwGJrOmDCcfdo=;
 b=7YdeYVx0QNcMHblc9v3GcfKrXzfC/B4QEyf/w5tuZrqss0bwFRF5V44BT3Tx2vc3nz
 1yqTk17tKTTIpD2T8288kPULJZ3OGrsJwxiGEIoq3IvZfCwFiQmx7BxlkCW2H/ugourK
 2B/Bj7SWnMIS0WGNFMWaVALJOkGe/56kySINrlalOv9I4VEJzWiKKy9qLd1K7y3VlOUz
 fMrFhsUMtN4hleC0J1fo+N/J8fdL0sPKC4ALYJGJT1d/PyvVUK0BwoenpFlBuHwu0zqO
 RWcHUu4Z68um5ZdC+ZvM25hbGc3NV/U5h9FqbkCNoZuCWl0JJAA4s7fDYAzi3v0rhC6F
 novQ==
X-Gm-Message-State: AJIora9yprwLRYDd4PJfzvZaSGzghG5CgT94NTC3fVrY9QHyuaGvMXMI
 uHjnHkmAVWJPPZ0LABj+ELbZuQ==
X-Google-Smtp-Source: AGRyM1uOAoL0u0SIY6Tpac0pSV6E3Coi4os+5TQxTHDmogyyTmtUdNk1M9fpYs5nEIEmYhHYtTRrmw==
X-Received: by 2002:a63:a4f:0:b0:401:a0e0:1668 with SMTP id
 z15-20020a630a4f000000b00401a0e01668mr16527462pgk.21.1656770812953; 
 Sat, 02 Jul 2022 07:06:52 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 nm13-20020a17090b19cd00b001cd4989febcsm6182202pjb.8.2022.07.02.07.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:06:51 -0700 (PDT)
Message-ID: <4212d57a-2465-4e2b-7998-97bc3ab8bbd1@linaro.org>
Date: Sat, 2 Jul 2022 19:36:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] target/arm: Implement AArch32 DBGDEVID, DBGDEVID1,
 DBGDEVID2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630194116.3438513-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/22 01:11, Peter Maydell wrote:
> Starting with v7 of the debug architecture, there are three extra
> ID registers that add information on top of that provided in
> DBGDIDR. These are DBGDEVID, DBGDEVID1 and DBGDEVID2. In the
> v7 debug architecture, DBGDEVID is optional, present only of

s/of/if/

> DBGDIDR.DEVID_imp is set. In v7.1 all three must be present.
> 
> Implement the missing registers.  Note that we only need to set the
> values in the ARMISARegisters struct for the CPUs Cortex-A7, A15,
> A53, A57 and A72 (plus the 32-bit 'max' which uses the Cortex-A53
> values): earlier CPUs didn't implement v7 of the architecture, and
> our other 64-bit CPUs (Cortex-A76, Neoverse-N1 and A64fx) don't have
> AArch32 support at EL1.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F765640B3
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:22:21 +0200 (CEST)
Received: from localhost ([::1]:45734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7e0r-0008Ks-0i
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dxx-00073N-F9
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:19:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dxv-00083f-SP
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:19:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so5383133pjz.1
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GT5IfMzGhhomlVr0z971ZqCoxbu+8r+y6wjvqyCj4mI=;
 b=WV3f2BgAgECAhgQmbNR0vbTnKMlH7yi9jM8RHdPJJ1HETYC+V6/gS5eaXGsCGy5Nom
 /FnkVkj9ZDXKOeb2xC1TAxy6uT1ShbG5Y2INUxgbEXXdETpKfSpwAvmVs+LuvpyzttoL
 4u4Beyz+QOAcb4nzLPDNXwDLE+BQwM9f2Rxnlg9RKrd6afQd/jOG2j3F5wDIq0jcQ3Sp
 z6yTF4qjT0iPv36Gi5NauBwv554XF3IK0w9ernkR1YAYZzfYDFSaWtLgx/OhUgo/2Yoq
 vLaXMvHqB24XifrQB4GklHZIh+lkOGcil6dloUms+AxOrjReycF0tRu5K5J8rHYJET2j
 L1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GT5IfMzGhhomlVr0z971ZqCoxbu+8r+y6wjvqyCj4mI=;
 b=o3O5JGW8Ipx4m7V9JPFVEez/OkZvxaOhN8ctgwSrB1HZRb3hV7oNzutl7ihzr/UYQV
 vZ78OSDvy14rC7BdNj1peESU0ZGD83xPCMuF9VtFsZoHBM0upkpp/AMWZHcF8gqHSYwU
 LFzT08DiNtR61KnAxFswxjW8fAySWxonEXsqU2CjgnPcsui8sAyMK3gxmA56QmfSwGW/
 ahGN6OLS78Z7ay/4ABfCcGtuZAOr+lptLGKfXuFYxqb50kfSTxUtRki5Z3cEcGHN2tNo
 t6M0n8mAoJTd7us4bhZ4yuHUlztun1irdwKp05p0/BfLTcd20LDb0eAx7RjygWqFpdVD
 4Gcg==
X-Gm-Message-State: AJIora/D8TgpjseeQ13I4ZaN3OpSwm1FZsupFqVPbOPgCdNZ9cxkwVcu
 11oy8wvF7sINlSpg7xWat7l8tw==
X-Google-Smtp-Source: AGRyM1sWCoHY4bsP/wQEmTLnbg15dBoQITWoAvmY6TlzY1lXnA7a1ZkgHCjzFsVtvK/nBXmbP9x+pA==
X-Received: by 2002:a17:902:cf03:b0:16b:a91d:aff4 with SMTP id
 i3-20020a170902cf0300b0016ba91daff4mr15979952plg.66.1656771558242; 
 Sat, 02 Jul 2022 07:19:18 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 g189-20020a6252c6000000b0052833322760sm3428523pfb.187.2022.07.02.07.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:19:17 -0700 (PDT)
Message-ID: <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
Date: Sat, 2 Jul 2022 19:49:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630194116.3438513-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 7/1/22 01:11, Peter Maydell wrote:
> +static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
> +{
> +    /*
> +     * We can't just OR together the aa32 and aa64 checks, because
> +     * if there is no AArch64 support the aa64 function will default
> +     * to returning true for a zero id_aa64dfr0.
> +     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
> +     * the AArch64 ID register values in id", because it's always the
> +     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
> +     */
> +    if (id->id_aa64pfr0) {
> +        return isar_feature_aa64_doublelock(id);
> +    }
> +    return isar_feature_aa32_doublelock(id);
> +}

If you're going to rely on this, you need to clear this register for -cpu aarch64=off. 
It's probably easier to drop this function...

> +static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                        uint64_t value)
> +{
> +    /*
> +     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
> +     * implemented this is RAZ/WI.
> +     */
> +    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {

... and use

     if (arm_feature(env, ARM_FEATURE_AARCH64)
         ? cpu_isar_feature(aa64_doublelock, cpu)
         : cpu_isar_feature(aa32_doublelock, cpu)) {

since it's just used once.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF29D31B293
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 21:58:48 +0100 (CET)
Received: from localhost ([::1]:39530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBOTf-0007fB-D6
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 15:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBOSO-000730-PM
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 15:57:29 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBOSM-00004w-Mh
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 15:57:28 -0500
Received: by mail-pj1-x102d.google.com with SMTP id cv23so2541936pjb.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 12:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DT0vJVKdojEgfL3RF7wvdqNsJ1WQuxbzKOLZxE1YSog=;
 b=K5DcTCVbb5Bx06IQj/ag74lbf8E//4b1iNOK0lLF1ubAwTt9+EwiT20VFsxCRVFect
 o1v6nHeoGXcXo07iC/pps++yu/6SCaKaT0qo4LJwsxt/ah3sWY4VUJc58G5HNnoBZbzb
 x/in+VHV73pwDTY2G9kOCMWWG24CrJstw8Ypz90DqHR53+kkMBcBYy31rdJSkf9NUWHs
 DuI+VpVHX22kHJzNZGeD1cH0RzJ+thFYPEOMnzFoFgjL0ZiI3Hcqwz9ALY9mQbI6a3iL
 o0u09B7BtGtu70rSgp7rS/q3W7VL2raI3LYmbKCBevPtXaVosHYue/L7aZDr5LgS3wTs
 lpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DT0vJVKdojEgfL3RF7wvdqNsJ1WQuxbzKOLZxE1YSog=;
 b=moRGe9FoheE1ZoFWV6DGg4FYH9S42tChLMT55NTWyrhVKzc/hFT6XY5Rh1Zojeikw/
 +2y4ZSJvEfqXRtCL+E1KpnVtDQCD/DmSA+jLjohVSr0CjfgBgr47qG0XCWIywGwK32IF
 uJDOK3fSdV/3hZiaQW4erB+r7vc/ygMsaJxVp+7PgJfvYrCjH/M1QvDCD+rZbqqeet2Y
 MeGqShyOAohKk0612uIqri5hdB4npofxc2lRIKEoGW/I1Qs1DBWLSeOqmS7WTcN4G0Qz
 r/0u0bpPbMOCSPBC/gYTUjVE179f8iobB+zWDaRfgOm6uMlCTTOID8IZWJqOoOddOvQc
 reZA==
X-Gm-Message-State: AOAM532a1u7ng7WZeXTLixazFwwfzkJSGtHeJPM+gMaY/9JkEXPBedlE
 fjgZqHND/xZsIsTexQyiXGKCjw==
X-Google-Smtp-Source: ABdhPJzPvQYuYRBwYy0QmK1TLfgeDQ5SqagpfXvxDkJhtMDh1nOo5fJ9mf+x0e12SOeZKUlhC9083w==
X-Received: by 2002:a17:90b:3781:: with SMTP id
 mz1mr12932173pjb.178.1613336244977; 
 Sun, 14 Feb 2021 12:57:24 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 s11sm15166686pfu.69.2021.02.14.12.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 12:57:24 -0800 (PST)
Subject: Re: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-17-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0ff8663-9ea2-e8be-9123-4afffc41bad2@linaro.org>
Date: Sun, 14 Feb 2021 12:57:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-17-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> +uint64_t conv_sf_to_8u(float32 in, float_status *fp_status);
> +uint32_t conv_sf_to_4u(float32 in, float_status *fp_status);
> +int64_t conv_sf_to_8s(float32 in, float_status *fp_status);
> +int32_t conv_sf_to_4s(float32 in, float_status *fp_status);
> +
> +uint64_t conv_df_to_8u(float64 in, float_status *fp_status);
> +uint32_t conv_df_to_4u(float64 in, float_status *fp_status);
> +int64_t conv_df_to_8s(float64 in, float_status *fp_status);
> +int32_t conv_df_to_4s(float64 in, float_status *fp_status);

You need to either use the normal float conversion routines, or document what
the differences are.

> +static uint64_t conv_f64_to_8u_n(float64 in, int will_negate,
> +                                 float_status *fp_status)
> +{
> +    uint8_t sign = float64_is_neg(in);
> +    if (float64_is_infinity(in)) {
> +        float_raise(float_flag_invalid, fp_status);
> +        if (float64_is_neg(in)) {
> +            return 0ULL;

This isn't right for will_negate.


r~


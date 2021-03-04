Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB0432DAC2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:03:18 +0100 (CET)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuBp-0003br-AZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu6p-0000GY-J6
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:58:12 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu6k-0005u5-58
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:58:07 -0500
Received: by mail-pg1-x532.google.com with SMTP id a23so9793485pga.8
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2PDidat/5n0adeJ8s41QFfi/VPyZDChH60snQE48x2U=;
 b=VdGim/cNVY6IMFv/HfLqGLfkpfw9TASI7thHnfGHb6QaNLfjJkX2JbSNxYLiiRLBpp
 +yyp/rcuuyJnadwZkspBEL88p5FCbD966JVPgfzV2NsSk3hzw0jMSSs4qKjqsoWh2hSn
 cN0eaVkub6m3KQnl/wEI+TeLgTGrsSpI7I16S2DSrrYpgFigD9I1vcVvjiZ8zXjcIaxv
 7YvcdimbPYh4uW3RwWT3nk1GPG5BRenhwYRtWOD7ZFx5Y+VI/VVCkxM1/htpkwsWl2SC
 ML9TcA5ZJZn+jUPvLy/SvF7KiLWlD4DwILq1w8imdfm+4l806WaARVvWvGAGeqCzB9uk
 YMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2PDidat/5n0adeJ8s41QFfi/VPyZDChH60snQE48x2U=;
 b=VUdWTb3MrbQxIDhtD5pVbqCXY3Z2Xmw6L3F4uCtMm7H65t0WNl8KvvDmV2FTdzgkrv
 fFOuk9nxb+wEM+MK9xuIQC05GCv1gbZoxawxW8CtiSP69q1R+mOCdYCQp+fSnpA+qvsz
 gjj2QPVbeT7sfvMCinqQ1BSaSgIlPF9Af3DAKd2qLsgAbQVx1Y86NgVP55VhRFGAR/WV
 XLYHJkP5JDDtNTTeSGVTDOf0aHTh5sbMUcvJEFpbcVA8bKndc1XHDYm3vmZii/MSTD7M
 PqX5jnY0NaV1cdU9t/qfoFyLymxSuENfCbwarUjuJJT5320ld+ZGKHjQxhpt+OzkEoFu
 bXeQ==
X-Gm-Message-State: AOAM533GuBV6w4oBqbhxxCbSEyPTlVteFPiEU2gY1DaTCqtNQSiwLOe6
 0jyY4Df5FYps+4wve2bOBqVF9UEjulMQEw==
X-Google-Smtp-Source: ABdhPJzdCZjvAr9GaBYw9z3U8of1HyK5AZ4USWuFwPvm7elhfbToEjO8woQbH9I1LyLGw6fM58lf8g==
X-Received: by 2002:a63:5d59:: with SMTP id o25mr4899865pgm.322.1614887880538; 
 Thu, 04 Mar 2021 11:58:00 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id s4sm104582pji.2.2021.03.04.11.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:57:59 -0800 (PST)
Subject: Re: [PATCH 19/44] hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU
 stanzas to hw/misc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91712699-8adb-e2ce-2429-5f1d12c15ed2@linaro.org>
Date: Thu, 4 Mar 2021 11:57:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The ARMSSE_CPUID and ARMSSE_MHU Kconfig stanzas are for the devices
> implmemented by hw/misc/cpuid.c and hw/misc/armsse-mhu.c.  Move them
> to hw/misc/Kconfig where they belong.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


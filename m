Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACBB31BE92
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:16:32 +0100 (CET)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgY3-0007i0-RO
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgVq-0006bp-Ik
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:14:14 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgVo-0007Zg-Uc
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:14:14 -0500
Received: by mail-pg1-x532.google.com with SMTP id t11so4462804pgu.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hO8VBLHFB38ajBvEFGwXUtLR1gIMJs6N6RVI+sHwHtU=;
 b=h4YJ5dCCa8TSQD3nZ/Ak+N36e1P3An+lC4mmdFZMihADQe2NpG99lxmj7Q8fhI8HAp
 2D9Mk0HiIRpXsdgwDLJRiddV43UgBe0PeWL4zg3S7WrIcdJVI6R4ArXMgqOvufg52mqL
 DVBRQWs/l01vJs7sZCA0eLVxHx1+zBn3OzDvBkSpHO4BAYR6duqhzOrgpJF3gNNJ6oAr
 XPBkvim5p1fKjJbCd553ZDvZbaImmX3RBlD3TnpUnCUC2cG13F9KF6RZ8dufIYfd1uev
 xPacd+gAk9XccBcERDWQgci+sPzfGC0Khd36F7+IFoHi6B6xsY1kJz4wAQ6Oz1xSYvrE
 viSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hO8VBLHFB38ajBvEFGwXUtLR1gIMJs6N6RVI+sHwHtU=;
 b=PlBqaVxb7IkzxaaXT0CgP4PoHba9zKBp/L1QFexi1MqwESdiA2dLxVbAk7BeBFUKMy
 qF7xX//X5PbPlqGxiFCytPvo9Mag2bWwpTv8RhYpuOwb/VETNbUHJtDHulPJ5A77mbWr
 VHsxfV3QF7TgH/djPquK6AXLhIAAybFxQjnLcETwjuYKXWWIuadt1MS5nacKfaWcoY2y
 SRtzWNrevFcCCsfGp+2nYz2kkJlXiqpYaZnM7X9V6x0tECrjsU85KccKP4oZLpO+em9c
 ofwUnbYX1WHNUsjmipYFmA6eh+5Vdg0lWJr+B1m3eFDW74UpXNUtM0eIlvahWzTIXUVA
 /+wA==
X-Gm-Message-State: AOAM531sq07AKMrF3nyp9TYXxPqavfVvQgcZfGxA5aX0B02iaNq4PSNF
 bRJ/3TZ4vJKUfqPe/8qMEaY05g==
X-Google-Smtp-Source: ABdhPJwyizA1zzEGFSm7/N93BAYg2duOEIvP7Q1ZV6JXFB1hcyVUtQeYWBXtPWXYeKpeEMpx+VJrcQ==
X-Received: by 2002:a05:6a00:1748:b029:1c8:8139:288f with SMTP id
 j8-20020a056a001748b02901c88139288fmr15660539pfc.13.1613405651436; 
 Mon, 15 Feb 2021 08:14:11 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 j185sm19036181pge.46.2021.02.15.08.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:14:11 -0800 (PST)
Subject: Re: [RFC PATCH 04/42] target/mips: Promote 128-bit multimedia
 registers as global ones
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6bc0981-9786-9266-5af0-617c8a260e95@linaro.org>
Date: Mon, 15 Feb 2021 08:14:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> +#if defined(TARGET_MIPS64)
> +extern TCGv_i64 cpu_gpr_hi[32];
> +#endif

Declaration needs to match...

> +/*
> + * For CPUs using 128-bit GPR registers, we put the lower halves in cpu_gpr[])
> + * and the upper halves in cpu_gpr_hi[].
> + */
> +TCGv_i64 cpu_gpr_hi[32];

definition wrt ifdef.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


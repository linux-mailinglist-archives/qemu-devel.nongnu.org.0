Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AD74AAD30
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 01:28:03 +0100 (CET)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGVPO-0002tu-Se
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 19:28:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVOJ-0002BJ-De
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:26:55 -0500
Received: from [2607:f8b0:4864:20::1031] (port=53895
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVOH-0002Jo-NX
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:26:55 -0500
Received: by mail-pj1-x1031.google.com with SMTP id h12so9236876pjq.3
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 16:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5dIRnZLA4HC7kSZZTOw15nvw+E3AGxS0WUWtErPiHeQ=;
 b=k+B7loDFTPyulk6IbKa7Z/gT/p2EAeYdOvPSdkBlDFdN37PMw6JtEGV3eSu6zJFrrF
 jHNUObf9D7SljMipBp9h4yQTOTEDRnKpv//xcKUFe8NwOc/jwuyrIS/gxg0C3coJqTTi
 LoGnKNDWh4opsvoaKBdGR7HMZ4Ohnn3YijS0jSagA4cMmUjquYC2nAkoFbC5/jQ2gdyX
 3OoXCiU3A7ZFUko23um+4rmkR0uu6vA0fsPqVqfJGZoWK+h8gtVshFkoSxB0EAySLK2Z
 FL2NhZ9QE/HTX848Qavj8MoR01w2ylaxXtFirsOyCCm3h2aKKOwEk4MjXWUehHJv1R9+
 HZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5dIRnZLA4HC7kSZZTOw15nvw+E3AGxS0WUWtErPiHeQ=;
 b=CHzmOsytzpsHvnivvxUmZQFHSmtXzORZk1jm+Gi23y5IA/DrvK11RDgLp6R0QQu9Hd
 nbs1acxX5/LWuOjhdNHwhN8h4teLPaEiAkpDAAMOSlHYEPblK+gZL2dnv6E3bjGTzEAA
 HQ2/aQ1epo4mGPSJ5VcLQGBdRZBIcNT7MvV+l1rYJTHtJ339xwvO+Ptj8rOnB6nZVo59
 M3ct8tUJodFFy/iwzS4iE7tjjbu0TXMSnIa3zDKScQY4ZXckbsBMd0aODyhqgDssQMCQ
 VshfUVrm4YDvr4AFk2fDAUnicHqzYOlhqXFZ9tmdTZw73+FgEOWimwSzXKTL9Q96bSBF
 vSyg==
X-Gm-Message-State: AOAM532QD+N88ufPtm0rOMRPt5/pGxZJrTlXIvm2Exo30Fuu6+LdZ7dw
 HxSlYImhRPpSE88fIxbiIvJ4rQ==
X-Google-Smtp-Source: ABdhPJw1NiinCkIRlyds/CqTQiygCHVs9nNF7WFbVU9vyRy3n3KpvOZOMr8OrRo33epS43hyNT6w8A==
X-Received: by 2002:a17:90b:1652:: with SMTP id
 il18mr6620696pjb.205.1644107211132; 
 Sat, 05 Feb 2022 16:26:51 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id nu15sm3859398pjb.5.2022.02.05.16.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:26:50 -0800 (PST)
Message-ID: <06bc9314-2f23-4a0d-4ae5-8695a93778a2@linaro.org>
Date: Sun, 6 Feb 2022 11:26:45 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/6] target/arm: Support PAuth extension for hvf
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204165506.2846058-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 03:55, Peter Maydell wrote:
> Currently we don't allow guests under hvf to use the PAuth extension,
> because we didn't have any special code to handle that, and therefore
> in arm_cpu_pauth_finalize() we will sanitize the ID_AA64ISAR1 value
> the guest sees to clear the PAuth related fields.
> 
> Add support for this in the same way that KVM does it, by defaulting
> to "PAuth enabled" if the host CPU has it and allowing the user to
> disable it via '-cpu pauth=no' on the command line.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu64.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)

Currently not a problem in practice because M1 doesn't support PAuth, so the ID fields are 
already clear.  However, it is a confusing difference to kvm, and presumably some future 
Apple chip will enable PAuth.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE88AE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 07:08:33 +0200 (CEST)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxP2u-0007YU-Rs
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 01:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43132)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hxP2P-00074x-DM
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 01:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hxP2O-0002NT-Gt
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 01:08:01 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33512)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hxP2O-0002Mg-9v
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 01:08:00 -0400
Received: by mail-wm1-x342.google.com with SMTP id p77so223348wme.0
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 22:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MY0jFkCW4QtK76+Yab9cbKYXYClX22vI/naRAXUS0pA=;
 b=uu7E14SgX6QOfpuMSUeXLBMqBddqd67Xi0eTYbXsuhX0gYJyuY8NQ3pDF6B0vTl0MI
 bJ7lq3MG8FFQt/qAdRXs24vLbilhAsIpNgkXaKFxpnocIq05sv4lJpTBzUojgs/bcXJ5
 2E4JnQxxpaVeXF/Q2GuE4j9mmk8PsiOvOjTDTkDabodQoU+NXQXFvxrZNNCRBH0K7ctm
 YyESFv9lIrbvo7J8VLma+CIbqKvzUrONz5Yu+KKKYLXqRDl9u++KnNuMu/hKIVHdA7LR
 I0/UXwIPzNzywHC4e0UL7Pg9i9SDk1utz4nFVtT+Up+iG7T1RRluCJACr4iKM4O682I3
 eVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MY0jFkCW4QtK76+Yab9cbKYXYClX22vI/naRAXUS0pA=;
 b=Ndr6xFiyrIuGoT0rcCs/zT6ZdEJodd9lBTS4i29hqiZFLiVSzs3bmEsEHwzzieA0dP
 DnjysANs32fjfbNDVTdgMNfcTtb+jkCYH5lqGPeSOvEZglQO75FgTjP0iJ0BsCQDmt0I
 0+NH+Z40cVelvkcCLwNXXQR84w0BlCPB2s/y4M19iMkiGlCVGEw3i8xxYQ35agzu56bP
 kqhqYSHhwPRmFvUehGpcQbREP9rzFBP/iF9vLz0nnLELUT93Aw8Tu+OsDeSkMEr9k+wb
 1TIeIbx4W384k6N+QWHxZjKT0jcn5SwiagaTVk+kwTP+Ps/BrKoRZClmRDr8W7QwZANF
 dscA==
X-Gm-Message-State: APjAAAVNA4A3bBgAFcvEYr7LHTEScAUKXuwUguJmuU0XcqG8Q4Kz3otH
 vWm63T/ow2hqCLEeO3r0L6cmyg==
X-Google-Smtp-Source: APXvYqyPM2f9t1ySDWZSxly082wkJ3Xz83jF4gQN2ZaXx5+p9N0VNkGh2QZXL+6zls+B0a9yLG2pQA==
X-Received: by 2002:a1c:a446:: with SMTP id n67mr735502wme.56.1565672879009;
 Mon, 12 Aug 2019 22:07:59 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:a69:1700:8897:9507:94c2:b98d?
 ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id p10sm440958wma.8.2019.08.12.22.07.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 22:07:58 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190810041255.6820-1-jan.bobek@gmail.com>
 <20190810041255.6820-16-jan.bobek@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2d2e027e-8689-45fc-b3cd-9618c552e0d5@linaro.org>
Date: Tue, 13 Aug 2019 06:07:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810041255.6820-16-jan.bobek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-devel] [RFC PATCH v2 15/39] target/i386: introduce
 function ck_cpuid
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/19 5:12 AM, Jan Bobek wrote:
> +enum {
> +    CK_CPUID_MMX = 1,
> +    CK_CPUID_3DNOW,
> +    CK_CPUID_SSE,
> +    CK_CPUID_SSE2,
> +    CK_CPUID_SSE3,
> +    CK_CPUID_SSSE3,
> +    CK_CPUID_SSE4_1,
> +    CK_CPUID_SSE4_2,
> +    CK_CPUID_SSE4A,
> +    CK_CPUID_AVX,
> +    CK_CPUID_AVX2,
> +};

Name the enumeration,

> +static int ck_cpuid(CPUX86State *env, DisasContext *s, int ck_cpuid_feat)

and use it in the parameter.  Return bool and true on success.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



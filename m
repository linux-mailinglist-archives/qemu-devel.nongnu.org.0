Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471073CA1BA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:55:39 +0200 (CEST)
Received: from localhost ([::1]:40398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m43i5-0000gR-86
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43gb-00074t-QG
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:54:05 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43gZ-0003nH-Bp
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:54:04 -0400
Received: by mail-pf1-x431.google.com with SMTP id m83so5869196pfd.0
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=d7bJK8rSxB70ZWYTkTsoWD0AbIrkwxlMBs9QBSFI4Vs=;
 b=rvjho7l6IyWoaw1/ags+niiswdhO3WmGNxXvI+yyEKHqs0Ytrape+RwXhledV+Fx5d
 PnM/weWXHvjVGpe3bGtIW8iVzd+geXjJtW4mRG6TAJqZx8whdNQKYVmeNWVuDrMTdqiO
 0OfxovYXRXqDB4e2zi089imIn3ebQxFpSG4HbF2bMqdk13nZM5ZIpAi5QrLyLz1wtj0w
 UA5UrAnlffwGSaOSsj0/vtLVZf//wz/FGERVIl8+/F2pEams5WZ37v6WT+0h6WfBDBTL
 CTdn9AcOIruPMK/zSQ6UX1TQXgCeR0ZJSDA3amxkUS/VJDoxVAefbyfl/Uis4+kK6gzG
 li4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d7bJK8rSxB70ZWYTkTsoWD0AbIrkwxlMBs9QBSFI4Vs=;
 b=VsYjh12c3F7rudXQ/MchNy1LwmhyvEyPGxc7VCP/7oK+uvhs+0mgUFjd5z+hg4A/OJ
 Nhyc+pfA4Qt2y0gKEN12xwu+taG821AoYiYa6a0bNdycSlQgMSHvKpyLl+qX4WyK0CVU
 oOFWJrm2eFwD0uVnkaAckzQqfPtjAKsQpJMHjAwnX6kT/0R/W2J2XsSPlFjfw7YGg/0d
 28OV5x3P5P7xYX/Z6DpJjd8pbIQ0+f/qJcjk/v3IIHo3tlvptLIGIrrexuJidyrkWXGA
 xruPlHyutN/E95o72H9ZtIrkbqfHwbOm2aV6c1YC8lsQxWJfRwAc/TtaufEkNRgyvLEF
 Sl9Q==
X-Gm-Message-State: AOAM533YNel44dBISsl3hDh0FCvuw4F2SnygoTIIHJdnPu4qS+s82A+S
 WIralbKO2AVCzNqCHnRZVfsnF5npyq3Qkw==
X-Google-Smtp-Source: ABdhPJxM2axHNJj/PdJ4xXYoGMMkLqe+otcBR1/FyhgnXQpxpUYQCKEM9GOrsmKQ/s4U5V8nT4Zgjg==
X-Received: by 2002:a63:1308:: with SMTP id i8mr5325058pgl.19.1626364441825;
 Thu, 15 Jul 2021 08:54:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id i1sm7060286pfo.37.2021.07.15.08.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:54:01 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Remove duplicate 'plus1' function from Neon
 and SVE decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210715095341.701-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33920262-e5d4-45c6-56b5-7526a1a61065@linaro.org>
Date: Thu, 15 Jul 2021 08:54:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715095341.701-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 7/15/21 2:53 AM, Peter Maydell wrote:
> The Neon and SVE decoders use private 'plus1' functions to implement
> "add one" for the !function decoder syntax.  We have a generic
> "plus_1" function in translate.h, so use that instead.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/neon-ls.decode     | 4 ++--
>   target/arm/neon-shared.decode | 2 +-
>   target/arm/sve.decode         | 2 +-
>   target/arm/translate-neon.c   | 5 -----
>   target/arm/translate-sve.c    | 5 -----
>   5 files changed, 4 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BEAD134F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 17:56:15 +0200 (CEST)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIEJy-00039x-5a
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 11:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tM-0001lf-OV
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:39:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1Ls-0002tf-2y
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:05:21 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:36394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1Lo-0002ln-Br
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:05:18 -0400
Received: by mail-yw1-xc41.google.com with SMTP id x64so245851ywg.3
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 19:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+9VVddGQ4dPGO/LAA32PMWiKzFnzgWH8VO9rSufe08k=;
 b=hSJa4jvtXbn7vkQCEVNuM2RPQcXwa5MDLI+8hZ7Zm2VwRO3zaKMKhJ7P+7htvNAixW
 h3baGNR2n90wU1TNh0XDEmU5OF/C2lpiA1m5XprktpSwNrU++KSLYIUcMOttoovUb2gb
 oncG9UXHWQo/CcostavkXxMsJiGagOfA/28fKmsYpH6GK3+R1BgI+TsITi79bq2c5qgQ
 uOq/ouukpE2tOP11TM80pFEAR7HWPmhoc8+cYAaIacCoEa1TMpDO8ifbXqNIY2EPfQWP
 zlNm9UlUdLHWim8IiOphCYLviDITq9DAT5AZX67k9NbcxgSQLZ1+3qcGa1OKMQoLvswJ
 gsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+9VVddGQ4dPGO/LAA32PMWiKzFnzgWH8VO9rSufe08k=;
 b=SYO+5w1vCGQ3SyG/5gO35PmaqqPWt9RySQ1qc2OZ2EHKJeC7kCqOkErXz9tMn1G/+O
 OgjK5hoW+jvMS4WSWzLClB0ugNIcGo8t7K59JE1DBqU9Nk/cwfZaVbYr4rKIUrN62LN/
 oLwIXzKW76etE6IWmDaQwlKdA1gWFMKoi/zW3ZkBtQaE6sd8C85hoN7a505nXffSLBCE
 hhtiI7vrUP04LNS7Bb0n5mrYFQ9SDGyAHrM2AtErTV/+1UWjYZ3hg/ozCe5pRMpC35t8
 45Rf32jbBbRR+3V3MMTuApDhfLwx3DmR7ZLDAAYL2CVqlPgeaktAHlPMY9eGOvhXjX1y
 gKXQ==
X-Gm-Message-State: APjAAAVYwVm6gC1E0NTKLdPBLMOtuTarL/xaVNQhu8+f/25xoK1ca8ho
 qM0GZYpDumAR3x/18s+NG5sVHg==
X-Google-Smtp-Source: APXvYqzBak9vIPUOTTKvRZtLlF/giI47MKKDdityYp84fhaZCu1UAPFIibMtEvNMHZOqykNpMO4L6Q==
X-Received: by 2002:a81:838a:: with SMTP id t132mr1038463ywf.8.1570586715480; 
 Tue, 08 Oct 2019 19:05:15 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id x16sm240078ywx.103.2019.10.08.19.05.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 19:05:14 -0700 (PDT)
Subject: Re: [PATCH v2 18/21] hw/timer/imx_gpt.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5d55be42-21e3-a817-07ad-e527f702c0fa@linaro.org>
Date: Tue, 8 Oct 2019 22:04:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the imx_epit.c code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/imx_gpt.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


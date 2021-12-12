Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC7471CF8
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:35:45 +0100 (CET)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwVZQ-00007f-3X
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:35:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVXp-0007Ci-Fq
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:34:05 -0500
Received: from [2607:f8b0:4864:20::42b] (port=43594
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVXn-0004hg-IX
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:34:05 -0500
Received: by mail-pf1-x42b.google.com with SMTP id k26so13195791pfp.10
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 12:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=150NyKGhlMZ5ytZ9RYpVYcI6s8Key6ISMPYLcpW5mA4=;
 b=GEaEL0y/F12UiM4iou5vWyPVIUbNLxWS3LFicdvR9nMtHE8HniXevVTIYv6tvEFDuJ
 KL4/k18T4pyXyI13Uhe/x87MJ0agoEwUHNWVToD0+AVZ1k7+vc/Xibz94FmzXSDuoGKE
 YFYp5tD8xpGG8M2dlDbYECiWcJbbQ9BhYP2x3cSfCrip0vpdEye+k8AnDJOU5qfob9dN
 BjYBT/D+pui2yMuHiwHlSmWV5IEEvTfebq1V1WO2mN8iA2xn4T2w2ss2DOPW7FJ9Ld9d
 40CLzLtYc4wjYvxp3wkYo3FwCM+WFgu+nUpIqwGvCdZGiRKVxfSA8Lh+6RHg3O3meuw4
 a87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=150NyKGhlMZ5ytZ9RYpVYcI6s8Key6ISMPYLcpW5mA4=;
 b=QzXOD79O2YnmJaknRhU1fmjezJRqIII1uVO+b6OTVpWjIvnKBYA/ioYH5ksBLcyGM9
 w7kf1B6sto7mwvfUQvhe5mnBzf9vAL8P0PRY4vKPj6jC9pB8Y+s2rq8wWflC/Vgyf9cQ
 ttSP92ILb8OGPSHVx+wV1pBoGQP3O3/RrmFzXEPD8ZCfb2nUm4lIRrDz4Vj2MhH8HwZw
 nKpcpw63aEoOHsx0ruTFqrT7u3pm1ix0xqSNJCXrPcQCjMIB17mJicMksw2VfmrVpjSo
 QcaKRvpYK29imi7gKGt3L5twPtA5T2EzDJMffV41O822J6eMfpQU5rDniigKyeE+DyjD
 HTlA==
X-Gm-Message-State: AOAM533Ryl0R2xACBGyBez4hX2+d6VrxdgYCtzzsM/P1RfaVqFsvXIe3
 MS67vMPUnjlOB6kQeLBH7faNhgbIcx6mwQ==
X-Google-Smtp-Source: ABdhPJwdPQXupZJvGIdzGNqLUHsJZtrxv66bHumWm+8uVK4aRg1dJJSDOxsJHpmchTWmDb/rLw2Ftg==
X-Received: by 2002:a63:8a4b:: with SMTP id y72mr6095623pgd.1.1639341242206;
 Sun, 12 Dec 2021 12:34:02 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i185sm9690536pfg.80.2021.12.12.12.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:34:01 -0800 (PST)
Subject: Re: [PATCH 12/26] hw/intc/arm_gicv3_its: Correct comment about CTE
 RDBase field size
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c187c5d9-7565-62a0-3599-c84575126df6@linaro.org>
Date: Sun, 12 Dec 2021 12:34:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The comment says that in our CTE format the RDBase field is 36 bits;
> in fact for us it is only 16 bits, because we use the RDBase format
> where it specifies a 16-bit CPU number. The code already uses
> RDBASE_PROCNUM_LENGTH (16) as the field width, so fix the comment
> to match it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


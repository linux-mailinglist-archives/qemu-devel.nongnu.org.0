Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0733AD377
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 22:17:29 +0200 (CEST)
Received: from localhost ([::1]:57558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKvf-0004QZ-Qx
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 16:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKuI-0003lk-Ug
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:16:03 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKuF-0005s5-Qp
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:16:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso6570717pjb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 13:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QgB8PY//ypgeYQ1XwBDf2qifHGI0kvXSbYIlDDPcR38=;
 b=SeqXb5heJFeJn5d/KU0j5GGBaAz+VUnbgKycolWV0g+6j/e9Tj40vnUw7dII26S2YJ
 vdUzxbqNll/JVurGI6BtbiGNtO3L5RiujAvWmwZnTuBuYvr8qJ29sXawNaPC2Nsz3eYg
 Juq9PMiWvWgquSCj5dX+wHwDDnBGsMWx4P9OdV0beSYA60MW6VnW5CU3xrpPLNmriXdH
 PRtWhxhSUrdODhQE3HIU5A6imB6mZP6xNHVO2dl7hn/AIFIHVNZiw6Kd32kH3eNPzjJq
 H3yy8HVbA9vnSyscgG7cXrcNLtpEFJoeDM7P+GogCpdgE+AOHK6g8hM/GpFTtCLX9BQ/
 pHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QgB8PY//ypgeYQ1XwBDf2qifHGI0kvXSbYIlDDPcR38=;
 b=Xv9tla9diGIO5mTaCRR7fWQM/pXIsZL8883fDkH6fqyxCmAuZ5DyuIgpKnx7g2W3sB
 f6lYO6lahg5tP7ubrJ73kNFwKZ55OAAiuc1gosqXngSNhHXKcma4E0rf9lIgn9uAc6lw
 MUa+lgX74IlfYTqiF60qfG56Xgobh2BCwfj5euRwqHRDkDDGNUnqwtmx+ffrqyVyIFwo
 P4JDgazOLwRrjpiQj+qs51lRo6CF3LJQHB0E0en8V9XZJykOaOMbFBvgrCBAAohBHNy5
 Mo9vzj6WdhW9QD1jKHJNkZ4n3WhNR2yzmItQ6UPYjJNgZCH3oiTYTEzTykOKj083V5cA
 vL3A==
X-Gm-Message-State: AOAM531DrX9EBYkFoZzhc2TrlRQOw8a+noNgJX5CBT4F4AVcmL7LgGl/
 xfno2mBGZ1qFleaqpuh3fQZzJw==
X-Google-Smtp-Source: ABdhPJxsJRYZFa7P1OmBMjywXClAfmALPaFkL56wiUV5d4TdG3+tadV3a1OL045gAthgIhcLWcXFQg==
X-Received: by 2002:a17:902:6847:b029:11e:b703:83f9 with SMTP id
 f7-20020a1709026847b029011eb70383f9mr6394506pln.47.1624047357519; 
 Fri, 18 Jun 2021 13:15:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g9sm7529358pgk.79.2021.06.18.13.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 13:15:57 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/mips: Add declarations for generic TCG helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174907.2904067-1-f4bug@amsat.org>
 <20210617174907.2904067-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a586a9e9-ea77-04da-f1f0-45d79d6eb626@linaro.org>
Date: Fri, 18 Jun 2021 13:15:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174907.2904067-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:49 AM, Philippe Mathieu-Daudé wrote:
> To be able to extract the microMIPS ISA and Code Compaction ASE
> translation routines to different source files, declare few TCG
> helpers which are also used by translate.c in "translate.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.h | 5 +++++
>   target/mips/tcg/translate.c | 9 ++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)

What patch set does this belong with?  It doesn't seem to match the next two patches, 
which don't create new compilation units.

As far as it goes, the patch is fine...
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


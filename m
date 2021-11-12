Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07E44E76A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 14:33:09 +0100 (CET)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlWfs-0001FB-EF
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 08:33:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlWdr-00082G-3v
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 08:30:55 -0500
Received: from [2a00:1450:4864:20::430] (port=46051
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlWdp-0001M7-FB
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 08:30:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id w29so15484714wra.12
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 05:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=maOtloYsjPfwyPevL6j/L4ahjAKq81+0olB2bsPdgh8=;
 b=ARSTYnV1twIBbUGQ/APl6B6oSUPKNfisbxkzN3OOOFAg7p2gf1ujN9qN9UMynmWp11
 eki74hUOFUEAEUb+8VClmoZWUU/pMN6pX2rzYAOqgm09jmjhpYG/Tem6eUnptYKBqMrS
 LuVc5Kta8A9CB8uoKQ91fezDH6B0+45s3hhLx7NzYgoIWBmSQkdqzSl1kebqenaNJYa6
 iv+473dyJkJBay2sDKq8IGydH/xzOG5XkVqaF+pqbDmengEBz/Tnc7i89dPH2EgCtJjg
 Ifk4T5EgT6IWwbM42tUK/TKUD+SCoY6KgzLEKR+uLsnbLE/s9wFuiL5GcvQ9RmYeGG6l
 FcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=maOtloYsjPfwyPevL6j/L4ahjAKq81+0olB2bsPdgh8=;
 b=fZmx/SQFb4vrRwNJcIfgJOEYNImGVVkk85t2mA8c3bgH2wY1fz6aTav190u9WrePlg
 7VuLpLaMjjla6V/7Hvutjz8P0/NRqaPl032cjqMnLhILk8zyEUQuU1FKN5yGgjH08Eqq
 VdHHRV7ClolOt1zZ2O81Cj2C2C/xjecpU2w0jf/t7JI0f0cjAS5ab2DKG+SQiRVO4OSO
 7SNdoagFcQc8AS91KbMs4aPTpM2dBGH8+kwhQ8ZUpQG/PW8nPrhCQXQALb0c87myhvQB
 +F2F9bA1D0silvonbbUkpjKevj9d4ZkyKL7YqHPhYT0LnX0G43jc9Y4Qwmw6Rpk2506g
 7+MQ==
X-Gm-Message-State: AOAM533OUyJsytvBhwl4KORtFT7gZKLyvyJyQdaS3i9Gar7QqisgXGbP
 e0TpJqRgTBGwrk2Q0LenfRjLXg==
X-Google-Smtp-Source: ABdhPJx8F2Zajaec1O4Ez5zV2w4V6FGGvFZhKa3h/7ZnWC0iETjm753ZUfSTz4r2c9SxMnP4hI2bOg==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr18252200wrf.197.1636723851952; 
 Fri, 12 Nov 2021 05:30:51 -0800 (PST)
Received: from [192.168.8.106] (18.red-2-142-115.dynamicip.rima-tde.net.
 [2.142.115.18])
 by smtp.gmail.com with ESMTPSA id a141sm1564323wme.37.2021.11.12.05.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 05:30:51 -0800 (PST)
Subject: Re: [PULL 0/3] ppc 6.2 queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
References: <20211112111543.2556837-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93cc3866-55dd-8bb6-82f9-cfd2b211617c@linaro.org>
Date: Fri, 12 Nov 2021 14:30:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112111543.2556837-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.449,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 12:15 PM, Cédric Le Goater wrote:
> The following changes since commit 0a70bcf18caf7a61d480f8448723c15209d128ef:
> 
>    Update version for v6.2.0-rc0 release (2021-11-09 18:22:57 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-ppc-20211112
> 
> for you to fetch changes up to d139786e1b3d67991e6cb49a8a59bb2182350285:
> 
>    ppc/mmu_helper.c: do not truncate 'ea' in booke206_invalidate_ea_tlb() (2021-11-11 11:35:13 +0100)
> 
> ----------------------------------------------------------------
> ppc 6.2 queue :
> 
> * Fix of a regression in floating point load instructions (Matheus)
> * Associativity fix for pseries machine (Daniel)
> * tlbivax fix for BookE machines (Danel)
> 
> ----------------------------------------------------------------
> Daniel Henrique Barboza (2):
>        spapr_numa.c: fix FORM1 distance-less nodes
>        ppc/mmu_helper.c: do not truncate 'ea' in booke206_invalidate_ea_tlb()
> 
> Matheus Ferst (1):
>        target/ppc: Fix register update on lf[sd]u[x]/stf[sd]u[x]
> 
>   hw/ppc/spapr_numa.c                | 62 +++++++++++++++++++-------------------
>   target/ppc/mmu_helper.c            |  2 +-
>   target/ppc/translate/fp-impl.c.inc |  2 +-
>   3 files changed, 33 insertions(+), 33 deletions(-)

Applied, thanks.

r~



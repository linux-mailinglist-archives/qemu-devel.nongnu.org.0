Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961BF417AAB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:12:23 +0200 (CEST)
Received: from localhost ([::1]:49762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpgM-0006EB-My
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTpQH-0002Qt-Ov
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:55:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTpQG-0003PL-98
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:55:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id w17so29764442wrv.10
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 10:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rz3mpz5s7HEB+VLCdAx1xq2dpuzeX32Eu9DlmRwOLho=;
 b=g1gGgnm/uLxWONMcIuNaKT8NSoTynU8M0Uti0KRWPJoivnCA7L7j44YIkGFRm/7WWg
 JgXZnAx1CncNI/BVHD5xzDZeIp7EFAxQSR/kg8lzO3nf0E0YsaQTY1K54qXQSXFAL0+t
 5HmiV92mqbdUrh4HMR+w6qdaLBB9AdAzEKgTa/T+2lX8NFn4SbZoRZ/IgAutE2FUHdRz
 +QxlaLTfOfZqvX1w2Gylg3dM1X7Uj2MMMVm6Txaj3KkUnF9QjlkLDSUBiyKfhnUZUoJU
 wolDXMWA78JVfg1vJjxL8lmxMuc20w3YOeULpBqCy2/rEhJkLFb1LnFybOXnHzbJk2Vr
 rr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rz3mpz5s7HEB+VLCdAx1xq2dpuzeX32Eu9DlmRwOLho=;
 b=X6DKIiH99hVreTNL23fehDMPvJwSe66CWFDF/mcfbXzIx4wKtlII1Lsctjuff8/rZl
 8IB0XahiebyZeF4TuU3pn2o/VpKgztBeLYhgE/CE9NVfFmBwoWDwomkY46xoBVCsJzMe
 XIkQc5pMGA4/jeY6L9g5EldPPdm+QNiK2gHgcdI1BV1B3tY34gshvYNLgQc0mR4kNFUO
 pmEvZCjd9dgjSkBhb9y9AvMiFtPht4/ATO0z5zPspbBDziZLzAvD2u2bsDV17IWJeBv5
 2/Q9FRLNyk2qaua4zJ+aZRLvxuo0GZJ7kaM6VCYO/2DHiGCxmbWGXH2tm+pak5z1mz1e
 tkDA==
X-Gm-Message-State: AOAM533hyjYW22/t7eKnHJ2BMYjfYMv4rSlyKx5doIbU9NJCAFdnTUSO
 usc8mqd/tolafnlcFnhm9yzKmHNsEOg=
X-Google-Smtp-Source: ABdhPJzxR2t4kPeQp+noZavHoSW45evq+nXSvdK2JjcetwngKEYQP5M0Yirl5m/EGkUR9nMizmGKig==
X-Received: by 2002:adf:e684:: with SMTP id r4mr13189982wrm.229.1632506142073; 
 Fri, 24 Sep 2021 10:55:42 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 25sm14783595wmo.9.2021.09.24.10.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 10:55:41 -0700 (PDT)
Message-ID: <8606cedf-879a-a593-3ef0-287c9b2a14d2@amsat.org>
Date: Fri, 24 Sep 2021 19:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 20/27] linux-user/ppc: Simplify encode_trampoline
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924165926.752809-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 18:59, Richard Henderson wrote:
> The sigret parameter is never 0, and even if it was the encoding
> of the LI instruction would still work.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/ppc/signal.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


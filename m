Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F202A3CBF2E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 00:18:26 +0200 (CEST)
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4WA6-0002MU-19
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 18:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W8O-00010z-84
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:16:40 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W8L-0006NI-GL
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:16:40 -0400
Received: by mail-pf1-x42a.google.com with SMTP id q10so10034199pfj.12
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 15:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bJiQ45SiiK0OqstmNia0IqGgvf1Ecv+BqHwehxKkVLY=;
 b=JkePkqBdmGMWqMII19fYnjI+AQsRLqlgx8V0mbOB6UohpyCp97nd/m9A/hgPLIKryc
 Imp6vyI9Hkb6i0/LcVk35eTBpHSsRuKj5Ni/WQRbi2e+OkdHnlmxRmgq+qMY6NL5H0Yc
 2Xl/+kU5WGraPAGJ23pMfhDiDvx0dgH1dcJ5z3f0vuCry03QbwMq7vH5STN7lbrY8xPY
 rL5qI3LnTg9+kT2YSMu8DeHjdTei/z2qtdKEXza5xRhbLJUBs9DlMjRAS0YxIdOismXa
 uVD4FPQ2SmKvbJjfqtkHIGRHXaiX92s3SIOlWpCPFeY7+mImecdov2wrgyYsYANesrN1
 mj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bJiQ45SiiK0OqstmNia0IqGgvf1Ecv+BqHwehxKkVLY=;
 b=LEHv9+TIQQN7IrjYWpJK6E4+33ju9Z5YgIcPOmbGxWyu6jjYZYMmqmJRE4DEXGhtML
 n9MKBPcV5BGvkiY/Y0xtVuWA56EsKAUFDLLa34f3rpt3bQjbpyaDdSs+kdtLDhNjWFDk
 fEJyF0DFfrAI4A+jwNNMCYoybWuhGTxzAjnaKtH7sZrInlgJbjqhg9m0HnfDH9jDL5+v
 dHeKqPjprdC/RSkxSCZmCRpmEDQ0FiAwph3y/L2cUB96OymQhkirDRuOrRz2M+dVNuDc
 vadAO9Y9ndoW6BtWraUka8onoDEPyvqLcl3UhpTL6Y5tg04z/i6QA0ltIaDWOifKHCud
 O1Jg==
X-Gm-Message-State: AOAM533clXqkiBfp4p9I9JxoD+f8U4s1f1L9mAOYhOS5IGt9USichuda
 EEJI00PXPXW+MkqOZa/p1RYdgWDPkkRANA==
X-Google-Smtp-Source: ABdhPJxDKOSnn4kToktrS6QMuVqISL04SWsNqUUjpRmzdLTcjif9yxIVrWZ2ND7YW1GUFQmIyzeg/Q==
X-Received: by 2002:a62:bd05:0:b029:30a:dc6:88b7 with SMTP id
 a5-20020a62bd050000b029030a0dc688b7mr12728240pff.51.1626473796073; 
 Fri, 16 Jul 2021 15:16:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm12148161pgh.34.2021.07.16.15.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 15:16:35 -0700 (PDT)
Subject: Re: [PATCH for-6.2 19/34] target/arm: Move 'x' and 'a' bit
 definitions into vmlaldav formats
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <251a93a1-0bfa-66f8-3115-c0f59ed90a62@linaro.org>
Date: Fri, 16 Jul 2021 15:16:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/13/21 6:37 AM, Peter Maydell wrote:
> All the users of the vmlaldav formats have an 'x bit in bit 12 and an
> 'a' bit in bit 5; move these to the format rather than specifying them
> in each insn pattern.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Not sure why I didn't write it this way in the first place;
> when I came to implement VMLADAV I noticed the oddity and
> preferred to fix it rather than either copying it for VMLADAV
> or having VMLADAV different.
> ---
>   target/arm/mve.decode | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


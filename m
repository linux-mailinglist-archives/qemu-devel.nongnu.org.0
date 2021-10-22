Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E5437967
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:54:28 +0200 (CEST)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvwB-0003PW-Kg
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvvK-0002kZ-OL
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:53:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvvF-0002sL-6O
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:53:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 125-20020a1c0083000000b0032ca4d18aebso898269wma.2
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RkTl9zI0WQhU2EOcE4PhbBdErFgyhyU1QyEXk3KCHUQ=;
 b=BHZv6YCZ+evPQJFYDK3nHxGmMiuU/WfgS2qAZm0H+1CeC6oOS0AzET1DY+hqHuX7jl
 vbzC6znCDJpDWe7hp0PANsXMJBdjt5WWr5CSQyzxXbgjnpZ5VfDJSdtabiTs48faP09o
 TMxFIuDBch9s1OK3qj1bgdO7THTEL1psM5pYl3XGV+s4etjRcYPUYrA13KSGqTV2PMNk
 wSAtDriYWLd8b7o9x4ExOFM2F85uS7edYUceAzNuFjb0cq2EIj4YBZfrJAjFjqYXoIju
 7PIvSoKbMlgTQgMHyh/UCEc1LoZseNuccWj6SYTVnYi/X68wB1uUnZ8PaeESdEwScXcz
 NaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RkTl9zI0WQhU2EOcE4PhbBdErFgyhyU1QyEXk3KCHUQ=;
 b=tWR2D3D6DxpB/t0rm7wNTnm8HM4uB3JAYmmTMj/4WUnLERVgk9CsR8VoWpje5GP+DD
 LrrWNWC8irVKTWn1EUI1G6aQaanItlb5jN824GxioCHsb/ckBBugIBabmJBX/VU3sYwa
 R6N71Uw/IiFRr4OtUXlE6bEYaimE8qU113JYGdjiOTkLrRxMyLusfVAQa+qikwvswXNh
 kHZLhq/EvORbwQcXz9N4pAhbKRuFczvHCNlxcbb7Iy72aN1k1MBoELEEUASzXkmkyEu7
 z8sgVvJzKxm2QkX3m794znRIerr+mO+jONiPUzdenLpxjh52/bxPT2EmK0Z2cctsM3ck
 ++RQ==
X-Gm-Message-State: AOAM5318ra9ATizFsR7jmyfKVPzhi4Jy1vLCqEMcxhn2p02qAFhpLCdg
 S9hWCi9kGOyVbzxJvfL65/s=
X-Google-Smtp-Source: ABdhPJzP3/SI9H7IoTM+fd61Pol+o5UytMGzEdI6baCNdpU7r40mwCVLDFcI5birFnKbSq9j8Rk2EA==
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr207944wmq.59.1634914407820; 
 Fri, 22 Oct 2021 07:53:27 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id i188sm11630330wmi.5.2021.10.22.07.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:53:27 -0700 (PDT)
Message-ID: <4fb78723-755e-6303-2c7c-4cbbb87ae401@amsat.org>
Date: Fri, 22 Oct 2021 16:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 02/48] tcg/optimize: Split out OptContext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:04, Richard Henderson wrote:
> Provide what will become a larger context for splitting
> the very large tcg_optimize function.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 77 ++++++++++++++++++++++++++------------------------
>  1 file changed, 40 insertions(+), 37 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


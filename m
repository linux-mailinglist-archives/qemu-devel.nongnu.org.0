Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1A41FC89
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:32:07 +0200 (CEST)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWg3a-000552-Kh
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWg0z-00038K-9S
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:29:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWg0w-000636-Io
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:29:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id t8so20449252wri.1
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YyVMEw7UCMt5M5wh0Vcy6aMwucaALDTdDKTPjrc0MYY=;
 b=QEZ5HL9rvbQl80sllJqQREMNYycMu2/HRj211WAw4HuCihaGC2ajPZ3TXMTwQxy9pF
 EBDFxqQjSXOyifuX/zB9XwOKeNiVg5vzxuEP2WY/6m9B2AYzlERXisHT3WIqzBF+iGuu
 k6TYX3Lh3vehEuYnV6CYSsoq7UdJQIx8t5gfPOFyetwHPiREvNPP5Mnd5e0JCTe0eRQt
 WBbCMmAvm/LQIxu2IT2wBBHcjSOAlsJX7ZSB8K0Mn9aIkoxgB1vrcfH0AUwxKvJmOPPR
 hADp6Z5uvxIhvdCM95URkYMx3Gi3JoQmNyZc9/rW4vl3auPuPNLklujh0zFBpF82SsrA
 d/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YyVMEw7UCMt5M5wh0Vcy6aMwucaALDTdDKTPjrc0MYY=;
 b=SQCwHWO++RQJWMRFe4uRupo61nAKjT25AgusOuLAw5CEI6r68EcGJ+Ctf9LfvMzNxa
 Cn/6KDQlI+cmZzDvdSriaEQIx/AiySzKNyidbnz7PyCFiJMcPoJRJyqOoayuruIKxtLR
 DEgvEyv6tX4RF3d/eM6swopDaRmXBhzBV1b0SlECzGwI3FGtQnh8UD4Yos3ywIuHeKpP
 01M7DsSv8mW5JSYy32xMuvJKSVzHI3jJzOzXaoE9PAIhVQdXcN0V/yXZiiGHw6U6EZMZ
 PkGQ06E13WLrzgWjrQ2N930p3ptmG/1sXsEfO3Cm/JNWqkp1KzSYZgRbr2DuRGauTLig
 lgqA==
X-Gm-Message-State: AOAM530C68pGxEcMAhZb9e2xP5LrgwWo6/o2Oyy6Q2gZBVy3X9CkDkrG
 YU9C6afbMT+ypjailktg5jY=
X-Google-Smtp-Source: ABdhPJzcwDflGExUZ42lg55Aq7NBoxIW6RYnMeVtzkT7Sh2cH67uQSJKObS5A+HZlVynTvb36QH69A==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr3643091wrw.219.1633184961192; 
 Sat, 02 Oct 2021 07:29:21 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y13sm8805243wrm.48.2021.10.02.07.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:29:20 -0700 (PDT)
Message-ID: <0d74e5c6-adf5-2097-08a8-ee7233115bae@amsat.org>
Date: Sat, 2 Oct 2021 16:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 40/41] target/xtensa: Make xtensa_cpu_tlb_fill sysemu
 only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-41-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-41-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> The fallback code in raise_sigsegv is sufficient for xtensa.
> Remove the code from cpu_loop that raised SIGSEGV.
> 
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/cpu.h          |  2 +-
>  linux-user/xtensa/cpu_loop.c |  9 ---------
>  target/xtensa/cpu.c          |  2 +-
>  target/xtensa/helper.c       | 22 +---------------------
>  4 files changed, 3 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


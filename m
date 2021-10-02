Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9DD41FC74
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:17:20 +0200 (CEST)
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfpI-0006xg-2K
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfnU-00058G-1x
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:15:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfnS-0003L1-OU
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:15:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so2438859wmg.3
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WdPVmMEa8uAYanI0m4DusbIdtN0CByVRQMmjCpGoA50=;
 b=K1xaTFCTmFd8fcEwm9OHa3HW5Eq94Ir2UJpG2Y+7whlb0fLvJGjWdd5J0ZacGNKUfb
 9GZk1+Q6Hmq68Ma5m0cZwH9DqlxdooAr3nBk9PWqYrSkj1K41tjWJCP605gJ82pa3pvn
 sMDulGozV53Tw0iaCBqRpATUvhbFhW9lyZP1jhGYOvQqlvUkNFmkC/zQPwZ2Cf/uBF/l
 CBKpMTxzdeONg95zHlhKb3cLZz0qPj8QntZIl3oTHCMXnC1zZhS65uBT6lAWm8Vz2Drh
 smOde0SlwmvX108aTtzvmwnnLa4yhhJ7v9JumMS5SKegxiIr0Fbi/ZGI+HT+ocXHEVKJ
 YSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WdPVmMEa8uAYanI0m4DusbIdtN0CByVRQMmjCpGoA50=;
 b=LeXvwvJsmurGpToEOZ+zQDzIgzw7qgCTFyiRm6MP5TWF0ApmHck7vHbwt7Mi8HBOnp
 j7KXYnFg6N5NbpM1RvtaPSO5mT/3qGy9kzTGLYnBTv9jYGPkYI17CXj682DShyxb5wGN
 H0biidhOybPCZ9dmSaYpvMDWnMeWPVlwSW+NzlAk4fxQT0FjCBlL4aQ1nWK9gCZuJQUx
 Xd1B4XAwHjG1naW36TuQjTx+2/jpfu5iHGW9Xe+Pb4DvSl57JK1lfE/7Nudp+dFPwSgR
 phGjLoVU8DATVQ7Md+cm+cp5GLLnaMSBa5XPuCc4JxzmVEwmRChTcMB1gYtG1au3qUc3
 iPug==
X-Gm-Message-State: AOAM5337gODaKi0jOQrXnRAPYhdIwuy6AgO3EJZK1EctMtH+5BqN0n3c
 Gyv2irfn76PWNN4ukrhdFzTo6zo0gZQ=
X-Google-Smtp-Source: ABdhPJyLLhFn9STLmgL/w8wGB9D6HaXxqMIVkd2HuhFJZ5vCqaVH/22vC8lBcL1mN4B47QOiwKnx3w==
X-Received: by 2002:a1c:a9d3:: with SMTP id s202mr849885wme.128.1633184125351; 
 Sat, 02 Oct 2021 07:15:25 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id t11sm8618142wrz.65.2021.10.02.07.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:15:24 -0700 (PDT)
Message-ID: <b9bf6dc9-77bb-5019-09e8-d65b833e388f@amsat.org>
Date: Sat, 2 Oct 2021 16:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 11/41] linux-user/host/arm: Populate host_signal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> Split host_signal_pc and host_signal_write out of user-exec.c.
> Drop the *BSD code, to be re-created under bsd-user/ later.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/arm/host-signal.h | 30 ++++++++++++++++++++-
>  accel/tcg/user-exec.c             | 45 +------------------------------
>  2 files changed, 30 insertions(+), 45 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


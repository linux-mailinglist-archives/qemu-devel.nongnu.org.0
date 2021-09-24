Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F3417A86
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:06:50 +0200 (CEST)
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpaz-0000Mh-Vl
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTpO4-00065R-OJ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:53:28 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTpO3-0001Sc-8i
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:53:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d6so29709810wrc.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gBC8w0ma1Lox+I01Y5+ZWV875v3h5B0r1w+PBPjHih4=;
 b=mVw/vZWalZB1KQVg9MSZ7GPHe/OyzqfYgv0m7jTfxpuudjhz0tDC+NZ6xxz/ys5k4t
 Y6CUgvlTwL5dV1TFM55OE5Mdd8I31SQjxwk6tR6KGPQCXN5jT01zb8bOrhtrrsilC+qF
 GifsRlIJT5PLzkHnC73OUqkJH8fQYB18x9SDOQPLh15qEnRZHWM4ov/zB4pDaucedOgR
 guSbcvbnRHRphg13cI3HVhWZ9gOfrEneS63huN+e3v14l8XIhMWIVLKeXAliJOM6rDny
 hvvuf1wb2WQpv7lSaNah1MVjW0a+ks7ZOnq53Bqi2nMirBMpUdEy9RyNUl1pfgPX3mHO
 Vz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gBC8w0ma1Lox+I01Y5+ZWV875v3h5B0r1w+PBPjHih4=;
 b=KO9qWJ4eCfZ15nXoKnHtT4jegRTR0TGfWwKMF8ewsBhY4NZsa3hbBfwE3u6+sWMcMh
 7HqiA+R8fUUXksABEsGZismwo6R3zjXx+0iZ5Hz0F6k0gwDao8JqslvUJD79X2vrvPvS
 lGQ4a1VQ0Z3ypNn0XUhLmkoAS0qe8mqNDLbddRkx2CxPLsR16LgSjWDN6HCks3YVt941
 zQvg1xSBEuZr52N8DUQz/xecBar4q4Ljq+gazeCN8ZVGFEihsCrpNnLn3jgWWeW0r4lE
 QRMYkezKXiF3sPMgPN1mWhFqRnA3einiA63QKXNI/4nFYVSmzfF9foIlvDFoNDcFe3iU
 nlVg==
X-Gm-Message-State: AOAM532d61/8jW39xCErAcTDKPneB2gaBnrjlavRUBgtp8LBfJekcXL3
 UrssxQ41Cog9JDDDoyxAN+o=
X-Google-Smtp-Source: ABdhPJyKIjiDzsQ+XDM6Tcn1D7EWQcfLVK6lHYfE+SQO+ykkdCtYUNx/JUhTy1kTSOq+0/el/Ip6hQ==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr3507687wml.93.1632506004893;
 Fri, 24 Sep 2021 10:53:24 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id r9sm8526543wru.2.2021.09.24.10.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 10:53:24 -0700 (PDT)
Message-ID: <42685b6e-12c8-78c4-a6a6-29698bea712d@amsat.org>
Date: Fri, 24 Sep 2021 19:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 26/27] linux-user/xtensa: Implement setup_sigtramp
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924165926.752809-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 18:59, Richard Henderson wrote:
> Create and record the rt signal trampoline.
> Use it when the guest does not use SA_RESTORER.
> 
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/xtensa/target_signal.h |  2 ++
>   linux-user/xtensa/signal.c        | 56 ++++++++++++++++++++-----------
>   2 files changed, 38 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


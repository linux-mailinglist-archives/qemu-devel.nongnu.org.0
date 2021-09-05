Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE088400EB5
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 10:31:54 +0200 (CEST)
Received: from localhost ([::1]:51420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMnZB-0006Ap-Q8
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 04:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMnXK-0004eP-7F
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:29:58 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMnXI-0001D1-LJ
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:29:57 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so2633976wme.1
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=riKoV1Wn9kik75h4mmk0xDFWLDhViCMgiRNE7tivpU4=;
 b=r+h0Ngqn7rG/fcQzN2LtOw+VMvOWqivdSr0sHsyULrofSudSfU6TOBbp5Npv0nlrln
 miiOY3TqyDKNCZJ6USsKoUXavwXxE+acbb136Lh1iGJz7+1cxKrOqYQ8FVQfNl9MSh47
 bj6fh7xtXfozeHr1LSKoO81Q6zzRgUjrwS7CC+P0o69Gy8Csydu1B+aZOyHlNwSAZIvl
 bfHglqHrGvm3cLUlq4/dAnKBMPHpPoxdAxhL9dik5AadkJjGLnt3iM8GN8IXI9YGC4E0
 dKVPJQsftSH0WYSB5HB+/BXkle+YEAtmweblUJCOZs0uMHsZfua52Vy+6PUzh1tnT5Uu
 lqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=riKoV1Wn9kik75h4mmk0xDFWLDhViCMgiRNE7tivpU4=;
 b=Ibm463aTi3Y7ELyLihko1F3um0rlm3b4uthlhkoXmrQIWEtBiI6A74EMoPPV3vC2yr
 am2/Pax0mpc8LwvUopoYcMvXRKIeCu9MLVamNFOg3l/DsudLE3sjiKT6XhuVCFSuH4mO
 YJj0cn38zNpiQLQ7hFhQQY6BZrE2kcZlcOvdkZf5TV3vp8NBkKHAxofqvhDBmpTiF+Vb
 jkKu8i1mqRPxI1GW4Ojha/buajGghGj1XikbUT1I3rLKXiTXgYzKeucBfKX3OU21zj3s
 ePcbALnTldiw6IiO5pMphlT+Fg7vhosr1WwVzOH2YnaAx1se9fXn1KEWPVKBvp4JiWzR
 c+1w==
X-Gm-Message-State: AOAM531YzJPMKZUDC9q2J/Qroc4+kDw21m3rNBHIpNvCi98xt+xH+EvH
 RnwCWISdYV8OFqdDBtgVTBqCtQ==
X-Google-Smtp-Source: ABdhPJxa5EuYyt9cHVpvq/E1ArdDt0YLQhyP7oslvVhXKUDhleH5Dk7+7SBCvLj1bw9bFSIh8HoqSA==
X-Received: by 2002:a05:600c:4999:: with SMTP id
 h25mr6150282wmp.175.1630830594214; 
 Sun, 05 Sep 2021 01:29:54 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id o18sm3482437wra.78.2021.09.05.01.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 01:29:53 -0700 (PDT)
Subject: Re: [PATCH v2 01/24] target/avr: Remove pointless use of
 CONFIG_USER_ONLY definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210904235542.1092641-1-f4bug@amsat.org>
 <20210904235542.1092641-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acd0e688-7e95-92c8-d1be-9d8bbc2b616c@linaro.org>
Date: Sun, 5 Sep 2021 10:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210904235542.1092641-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/21 1:55 AM, Philippe Mathieu-Daudé wrote:
> Commit f1c671f96cb ("target/avr: Introduce basic CPU class object")
> added to target/avr/cpu.h:
> 
>    #ifdef CONFIG_USER_ONLY
>    #error "AVR 8-bit does not support user mode"
>    #endif
> 
> Remove the CONFIG_USER_ONLY definition introduced by mistake in
> commit 78271684719 ("cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
> pointer in CPUClass").
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/avr/cpu.c | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


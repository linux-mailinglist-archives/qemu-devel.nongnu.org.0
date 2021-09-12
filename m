Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B12407E6F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:11:32 +0200 (CEST)
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPS4p-00060t-Cv
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPS0m-0001Dh-Ob
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:07:20 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPS0l-0001WC-62
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:07:20 -0400
Received: by mail-pg1-x536.google.com with SMTP id n18so7017078pgm.12
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J/x7axC9VSKWObpRux7ier/2oaHP6L4+/azjRBqF6C8=;
 b=EJ8UHb6AwNuAAZXmPC6gfnIonNkdJIruDKgPdE8MS6FA6+wSeNqI1m3XJiFxu85K9B
 HWj3MddB1k8J5S+iqhuzw4d7vyUnpHlkw+c9piNBnBJIH4REMzAEOpm8U/jrUu92KBw8
 Qt7O1vuAESxfV4DpkD9MsDMbN27d5mOnJ2nnxys6iS5cBc0nUH42NiWW3v/kgnp5ytYt
 EE9EJylKog9tyGw3J0VINsFZvWdpKuX3Z/R0hZMEmlHG2YRiICCkpS5DZRmbKp5Sk47U
 MQCrZ874k/KZ/Wf5YrAUm7lHg+fHUMp0VrsqXZuAHfiLo7oKzVRmuPQnKksUo3hMmaLd
 FdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J/x7axC9VSKWObpRux7ier/2oaHP6L4+/azjRBqF6C8=;
 b=mb/jpywic1lIFptoy1Wk9Cj7xQq6iuIOvj6LeHgYRuDMK6/yTgDx9w95+QE4fLAtej
 uhxaPDkDxYy3768wqcSfHnJmrEiE///DjM/TaRWzcpiEHCTqC0t/Qsr+qSt0oIJ42gaY
 8YSKxdfaH1bVe4S+CTUW4hEG6Xdd3U/UVJT1Tn8SF2a2IDelNlBLw89K835STJMnoGaK
 T4vefp/lY7SyFCxkvcNKsLSpKQnSmf6U8q7oaEzgzTiH4WzVYQhKPY322whicbdevNjX
 HVxYiJEU9WfP+exRbWht+6C05/FBOzvIxyNxznOmXsHhIfqAF6J8h8qunlE1kxF9WJHK
 BtWA==
X-Gm-Message-State: AOAM530I34w4hb3XcFmErjfhUaH+BVVCXdSqDdCkjlxKXQUWhEMog3P1
 bboejEvy2K62DXkVvgbjIsjBhg==
X-Google-Smtp-Source: ABdhPJy30pCG5Z2UYK4n2vWA62rpZHlSgI2sL2oWaOOKlWPic5F3+qqvwK/U9+MZfBGWRBkrZCX79g==
X-Received: by 2002:a63:385:: with SMTP id 127mr7221986pgd.343.1631462837658; 
 Sun, 12 Sep 2021 09:07:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e16sm4385042pfc.214.2021.09.12.09.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:07:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] linux-user: Fix coding style nits in qemu.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49c9cb18-6b7e-244c-36f2-865ff790e486@linaro.org>
Date: Sun, 12 Sep 2021 09:07:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:43 AM, Peter Maydell wrote:
> We're about to move a lot of the code in qemu.h out into different
> header files; fix the coding style nits first so that checkpatch
> is happy with the pure code-movement patches. This is mostly
> block-comment style but also a few whitespace issues.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/qemu.h | 47 ++++++++++++++++++++++++++++++-----------------
>   1 file changed, 30 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


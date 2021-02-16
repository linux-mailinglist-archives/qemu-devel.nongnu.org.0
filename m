Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD1531C48E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 01:21:26 +0100 (CET)
Received: from localhost ([::1]:58450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBo7J-0000RY-UU
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 19:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo6I-0007is-9Y
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:20:22 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo6F-0000IQ-R1
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:20:22 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o63so5160975pgo.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 16:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=au4KXkWmTNcUG4smJDDKwoa2mn0SPZKPdMt9CXVy9Y8=;
 b=G95hNFIwfN7I9bkIH0F34P6q/7Roq14d6wx8swvYuc35HWyEgj7awj6xqzuHpQckjW
 fWcbna12MYt5WCFMnpXX3//qUwaogF2cjlP6QPK1bz10UX+D3tw7cJMTdlYDGY5JOzVZ
 mURLO5zq3cpKVua3ZKQQZJ+7ZhJO2GUhXkDky9gJ6D06k4Kx/lnpRkmtBlSMHNwcszi3
 bvSMMV1U0EiJgH494HcDWjhUwSYUAwb5dJLjqn43pMtvF66XHj2QHB1iz4dA1obkPJbi
 Ga1xwhaepHDoSr1iRb6aOWG6fhFNznqQvMFZLeV9cOejNDmKTR7WTLG89iXTfqhEH+OE
 A0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=au4KXkWmTNcUG4smJDDKwoa2mn0SPZKPdMt9CXVy9Y8=;
 b=oaivAmkifshY9fyv6ReTpBV3o+wuEeecZFUtUrOLOieemsXAGSZAjmjYQhHUv2nFYv
 LAi9S3XKDGuYj0CybdlMR4F/WteOYRovpTlBbaUdxI4KiLsdoXL9ZAOUZGGo9UMdBfZM
 3onNbdNpUt5mXfcpONYEEV3VgWiE7YFOAWla7N7rQoLUE/WWX0v/eMvGVqPqaqkiiTJb
 VG3GTyHdRotTuOPxKvdYNi8bWBcnmb+FBB2Jb4T2Pf6n6trwFyrciR6JKHMt3EZSEaSX
 LL9ionhbXlbOKR8jmp87kDp2worpyJl7896ok1LOtt5k0c3zI2VrRimuz8J+VG2CAR4g
 AsGw==
X-Gm-Message-State: AOAM530ypl/u2lgm1HQ2IOlotwS9BwGvH8SbCj3nvndNURHu1mivOqg1
 6FiHMl8QyrQ7cnqbKFD8nTEVP1ejU5BSFw==
X-Google-Smtp-Source: ABdhPJyLnbpNbwNh7Q8lY2Wvxjv9BpeQie0eSMFnhyseVfpdCOLDCO2EhvJRKaOGXogt077FonK5cA==
X-Received: by 2002:a63:606:: with SMTP id 6mr16566230pgg.331.1613434818565;
 Mon, 15 Feb 2021 16:20:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id u17sm20784234pgh.72.2021.02.15.16.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 16:20:18 -0800 (PST)
Subject: Re: [PATCH 2/3] target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
 <20210215215819.1142-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7aa2e3f-f2b0-eaf7-d1c7-48c211462c45@linaro.org>
Date: Mon, 15 Feb 2021 16:20:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215215819.1142-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 1:58 PM, Rebecca Cran wrote:
> Set ID_AA64PFR1_EL1.SSBS to 2 and ID_PFR2.SSBS to 1.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu64.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


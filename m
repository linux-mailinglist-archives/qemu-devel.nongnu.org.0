Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B75D5538B0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:16:41 +0200 (CEST)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hUW-0000E8-Dn
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hRu-0007HS-5k
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:13:58 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:46623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hRs-0007dQ-JT
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:13:57 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3178ea840easo99691847b3.13
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0eAJQTro8w6Na4Y4vMWG8V2LDgTJZRQku50w+o3thI0=;
 b=Y3FJiHlRH2ZflAXU0IL27YgAy0joFWhjBZ6NjabBI7vnjGyy+mylKTFj6PgsY8GVVd
 YWqxzl9/K//+4xgikQlklSD0RkWdHjl/U0PlbNGD9X6X89rhxXO37yA7QliAD2IThUK6
 pSxiQ7c0L0l/NtpUd/84in1gnnTJy/Q8cTlmX9kKaZAn9SJQ8lv0lMQXTdKkbRjkedIN
 Yl286DcZV27BTX5vaItBxEbBRcWe4Z2+ziAENV6OxNS2o11MJxJbm1KH3/yG+KMd93NY
 lTvMI09SOSAYUwj4Iq+Bzu+sKDF/yPfQx5Q2v9U5hO/ijpW71Q/kvUVXmQOcN8zXr+nq
 S42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0eAJQTro8w6Na4Y4vMWG8V2LDgTJZRQku50w+o3thI0=;
 b=o9JK6cUkVN9V72uoSPnTvJ1mTikT8zCBjHOyJnCpdMgxmPTmfjVk+v9/f+EK0R/cOq
 oiTof9miWKCNfF7h/G/OkXl262PgHYs3aRGYmQxudTFPEzS4TA6WK2TNJ72kvtAFV0oa
 W4YCclWZFN+ccxt7MHPMvueCLvsd6n3A8Ur2aIMbsFVx31+BOSXU2Kmb5RhA14R7uzjD
 jQsLLh1Jr0uvkMSci6kWOYxvKVNWlB+ha92nbvBoLfMHiXH1T5BAP4HJ6RXAQbO00ryh
 KQxweJb/0k9EAGtSgCSut2Nz+fi9Qq+Izqg9+eVaKgeQmVAnD5BQi73UTn7nkG8vdIpo
 nH4w==
X-Gm-Message-State: AJIora9VJyW8nUMddZ5ejx+JTfWJYhDper0J+7VnjpSfmJXAQ8O+dQ7h
 Iq4yviynY4WUKvSFnobPv85YeV+y1cNvRf7c+3tXxg==
X-Google-Smtp-Source: AGRyM1ujtwni/QVyFYnQ2X5a8oDWnUrCI9sj8nQUQWLWpLOVAecXdeyxEwrkgrfaPF5jUYyg24iOBpgGSxpRr/x7eyE=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr19440723ywb.10.1655831635393; Tue, 21
 Jun 2022 10:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-18-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 18:13:18 +0100
Message-ID: <CAFEAcA9_hxHaWBReL+0ySFUgBJaWb-00078qyuG6wHDP75KmpQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/51] target/arm: Add cpu properties for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jun 2022 at 19:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the properties for SVE.  The main difference is
> that any arbitrary set of powers of 2 may be supported,
> and not the stricter constraints that apply to SVE.
>
> Include a property to control FEAT_SME_FA64, as failing
> to restrict the runtime to the proper subset of insns
> could be a major point for bugs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


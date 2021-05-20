Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9BA38B4E1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:06:42 +0200 (CEST)
Received: from localhost ([::1]:50860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljm89-0001z6-Ki
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljm6W-0000ht-N9
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljm6U-0005En-Sv
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:00 -0400
Received: by mail-ej1-x636.google.com with SMTP id n2so26433698ejy.7
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iMTcXLB0GKtlNPNxgstSUVxhX+4w+hrg1jdSgv+gRc8=;
 b=fsmHA7MIedYEUJedsEar00ZvqmCQ+ZDpeEu3wZKGfAlENq5FZV8cw6JUFxfewxNvta
 bqwuxIXdFGPpN56ObY1GisPpLxSk53paCyMQhmhDxlnCkfH9iFeXH9no3pvSXnB9rnYD
 geNCkCBNjsHRzNpBZV3LBh8dwWKY+/QKIJ+/QeZLg0vCH4ruivW/isFNq0uBRste6iIu
 rR/0RB3ozTCTr49YstSWoqdxOlTrPYY9AqnRFUSOwuj92RVsyv1wsLmrQ6xUJHdETtDG
 AWc+h1to0/6A7GbYloR3FIxDBIwlYo/8STKxhhqp9Mgksx9HlU9T2CrMxBf/A5F7UIPL
 VJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMTcXLB0GKtlNPNxgstSUVxhX+4w+hrg1jdSgv+gRc8=;
 b=avwRAuT/dY7HUXJkX/hLyTD8wXcsgu8C1USoSkLUbFI05kOq7+/mekUB5rH/2JHrhM
 OVfLCv8VpCyr52NiraKYMcGxoroWA3gY7N6JhOVJfQT7Np9wvO3NeBH8uChsdvvuUuT2
 /2OJLm7cnvU1ayx6REJwc0Y6n1GvWlbj7tReSnSEQJxrPBC9ntqqa9dNQqg7JCY0PgCp
 6ooyjzksfECq1AyDmfwSPuvJ5ftLrmRS9oR63TXEK1+menzmVELTSRpSylmWcY0k688M
 /g9IioYf5u6FPM7S2c61yITLFwYA/MGCyKgIAdyKqanl/Mdi58HbbrmHSLktuAlujS2N
 swLg==
X-Gm-Message-State: AOAM531TQXUXW83JjfJo9W4Mvw3+emWQCGMGUHpRRnp9TozupZYJE1/j
 I9ZYJzGtMJldwqovGJ5kADH/m0rA+nIY6I3UeDPm1w==
X-Google-Smtp-Source: ABdhPJxrKEwbwCFlGE6Itq/5BHiJwd3Heh8fwS16q4fPc8HRNF8bBs4vv9BSW8lrwhAStOPrf49ryQiplrtqyFs/FAQ=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr5763159ejb.56.1621530297068; 
 Thu, 20 May 2021 10:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210516123431.718318-1-richard.henderson@linaro.org>
 <20210516123431.718318-43-richard.henderson@linaro.org>
 <CAFEAcA_qmHQr8C_xGqixqNEiU_c6P37=ZEEo07k0X7_=EJWY-g@mail.gmail.com>
 <218865da-9748-6820-7749-1fc6f905e3a9@linaro.org>
In-Reply-To: <218865da-9748-6820-7749-1fc6f905e3a9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 18:04:38 +0100
Message-ID: <CAFEAcA93tnrd0H7qazn3Mdqy35FsbbjNXfk84nuLHR5brZoL5g@mail.gmail.com>
Subject: Re: [PULL 42/46] softfloat: Move div_floats to softfloat-parts.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021 at 17:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/20/21 8:40 AM, Peter Maydell wrote:
> > On Sun, 16 May 2021 at 13:38, Richard Henderson
> > Hi -- Coverity is suspicious about this line (CID 1453209),
> > because udiv_qrrnd()'s prototype is
> > static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
> >                                    uint64_t n0, uint64_t d)
> >
> > but here we pass n0, n1 rather than n1, n0...
> >
> > Bug, or false positive ?
>
> I think it's a false positive.
>
> Different naming schemes between gcc (from whence qrrnd came, 0 as least
> significant element) and the Berkeley softfloat code (0 as most significant
> element).

OK; I've marked it as an fp in the coverity UI.

thanks
-- PMM


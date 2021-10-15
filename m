Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F442FC8D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:51:57 +0200 (CEST)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbTFD-0007jf-M7
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbTDH-0006ka-Jd
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:49:55 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbTDF-0002PC-Uc
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:49:55 -0400
Received: by mail-pg1-x52f.google.com with SMTP id j190so2770822pgd.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 12:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VTcr0OytDbwKhfDjIWuhgDe3vPYNlNyT/YzyEWkShR0=;
 b=v4WqM9R8nc7slcorDJsmnlIzCw7aPEAxW78wjMYNlyx2ddZpi2jG8MOUoQr7+iPrYU
 1tDuJdapChbuP0DTYznHFd2193AC1EmK11HiW+oY4vfoPF+Xn6flPn+U8/nuOcrm9QRA
 EhcAjMj5bs5cRNa0iMSnmDaMalELi3pCU+rGunmdIjd52nEfW4wKbfjSWqLIF1plrTF3
 jbI03SX6aKxdsE4YN6AhDgc4+z+4Y7+M/kSKItz8afuyo+CGEbJMiIQpc8hKraRcmP2V
 HAdVh0ynkcWPyZ9RkhfqE6FDVImOu1OEO0wJ3p/0NZeqPyV+YP1fBhfxFxvFQdnw1x+g
 7Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VTcr0OytDbwKhfDjIWuhgDe3vPYNlNyT/YzyEWkShR0=;
 b=beqdkVNrMLdpv6ZH5kGhaevrAQ34dWHyO3zBG6pGzTESv5+zZjnkW7kFIXeIusqMys
 Ak4qw42+mhaIh4PXj2L4VsZbEE6pWxPmZ7jDdEkaTx5eugGLY2bmjYkUjIejLIHaeWcv
 sMmQ4+vIJxkahFhR3Vimi7AV+xuN9lNmcCPySw4xPupRNcRLdFl7x+PKXIEjUwNmtMNj
 gCxWzvFYp6YPZKRn+buhASA+IfMuNyJc/GedghCeETFFyBsf6EKYKEnUHJFEwS4cKqu/
 KjHBTX7ds1DfomHOe8c0blaJQXG+cVbL8IgCTRergKr/xzdStrKc6PlSHEoXzH7qTU9S
 XENg==
X-Gm-Message-State: AOAM532IiBu0lQLIsSYhrMlwQe+ok4bwiTcNhzXvY+RYEdwpdFBL48dg
 xhDDYwNOCyyoFEd2rx+OlDtF2g==
X-Google-Smtp-Source: ABdhPJxb5S7oebXa6UmEmUMo0QlfIyP2+eymJA5Bf7d/4aBcY87YfBfT0LwLJP2OcC/DmYo6u2ko0g==
X-Received: by 2002:a63:6f0e:: with SMTP id k14mr1657361pgc.351.1634327391646; 
 Fri, 15 Oct 2021 12:49:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w15sm5643568pfc.220.2021.10.15.12.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 12:49:51 -0700 (PDT)
Subject: Re: [PATCH v5 12/67] linux-user/host/aarch64: Populate host_signal.h
To: Warner Losh <imp@bsdimp.com>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-13-richard.henderson@linaro.org>
 <CANCZdfroR3PQUxDZ9wC5VgdYD9D1ay-cZ7ke3Ts2f2Xg803LSQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9974cb1f-ce49-b858-fbc8-6d4928a4e7d1@linaro.org>
Date: Fri, 15 Oct 2021 12:49:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfroR3PQUxDZ9wC5VgdYD9D1ay-cZ7ke3Ts2f2Xg803LSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 11:30 AM, Warner Losh wrote:
>     +    /*
>     +     * Fall back to parsing instructions; will only be needed
>     +     * for really ancient (pre-3.16) kernels.
>     +     */
>     +    insn = *(uint32_t *)host_signal_pc(uc);
>     +
>     +    return (insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
>     +        || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
>     +        || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
>     +        || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
>     +        || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
>     +        || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
>     +        || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit */
>     +        /* Ignore bits 10, 11 & 21, controlling indexing.  */
>     +        || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
>     +        || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit */
>     +        /* Ignore bits 23 & 24, controlling indexing.  */
>     +        || (insn & 0x3a400000) == 0x28000000; /* C3.3.7,14-16 */
>     +}

Oh, Warner, I was thinking about your query about sharing the instruction parsing code 
between *-user.

I was thinking that we should have, under e.g. user-only/, a library of stuff that could 
be referenced by *-user.  One of these would be a simpler interface like

bool host_is_write_insn_at(void *pc);

We can hammer out details on that as you discover what you need in bsd-user.


r~


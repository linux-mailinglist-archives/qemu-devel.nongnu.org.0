Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F51509165
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:28:33 +0200 (CEST)
Received: from localhost ([::1]:47124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGwC-0003cD-Cz
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhGNO-0001p6-RB
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:52:35 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhGNM-0000se-Ty
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:52:34 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j17so2921711pfi.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=db/J39YHhART9c7wUeeW91nBgFmvUkqKYD44zt4mMjM=;
 b=ru76txpo8VlgrYE8/AmZpc3Asx40q2C4IMjozjHatUrIZRGzbmGItmvIF4DPZR5X/9
 j/EsP3mwCEYDKrb7cHQPfSEUdMaIRYorHJ0Itgdoy2lQDJWf8D/pWLReSgoXWj2/I9KY
 MvJzcJE2VcaaogNTU34ZQGcGroE/CRS1QLwdwQ/Nwg3eYqfpmgoYrGMfC3U84jYC9Aa+
 Y7oC0mvpBlobgMH6w/g0h0a8gfU9oHFKzJdkBWrdUoAZX3bWMhnOZCslP2I094YEcRNH
 IhO7nN2aO/8d8FQ14uLqMMCqM2bYKR+SNBgPa0JC56Lj2lsJL+gVEro3ofpnKpS/LROC
 kh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=db/J39YHhART9c7wUeeW91nBgFmvUkqKYD44zt4mMjM=;
 b=VwONicpboDG9of5GvC+WtXW2cUTA7BSi/34GJ7fFaU0S1GTGF8sP/PspI5Z8+dMwc/
 23dZC6px9ZGyHLMs9kVKgWYVdwzE9i29kPHp09ydRGVKi6KjYOGP9OOeNT0defz7gxcs
 g76sF+/YJuAvFChcX1Hs7xYVzoJmtujZG99XZyoB0TzIb8n+9V3Lmd0kD4t1phqGlePC
 5IPDNlhvlXAWX5jHbv5Wotkh36Yd2nnpa8zev7/fWr7Ykahx/RjDxomxdnxUR4GyEMpn
 oju1fsy0OfItoPkgC3OwMAnUSMPWqKDcyKwUO14xhZ4nmHJ+PyNP7vsvdeTfKmkzKbZu
 6fuQ==
X-Gm-Message-State: AOAM533Y9hkCSRS89fUtto5UXpBM6o4rb+zMy3fH9rTfR/uxgY17Neuu
 oyHRSIBUhSS63yn2J4b5CVX0XQ==
X-Google-Smtp-Source: ABdhPJymOezGZzq5Qfeu0WufCC7O/PezuWGaf0jjiL05eYtRZVSldI0qLf9/uKsTZT1FGJ3YnAdIlQ==
X-Received: by 2002:aa7:9afb:0:b0:50a:c915:56b6 with SMTP id
 y27-20020aa79afb000000b0050ac91556b6mr5936144pfp.78.1650484351465; 
 Wed, 20 Apr 2022 12:52:31 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a63f305000000b0039daaa10a1fsm20480787pgh.65.2022.04.20.12.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:52:30 -0700 (PDT)
Message-ID: <962f7ef4-7dcc-fb5d-5e55-90eb3ba65e47@linaro.org>
Date: Wed, 20 Apr 2022 12:52:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v3 2/5] ppc64: Fix semihosting on ppc64le
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
 <CAFEAcA854-k-c5ZAbb=m2LE_ogi2Gf-3idOxOc37zN844mKyAA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA854-k-c5ZAbb=m2LE_ogi2Gf-3idOxOc37zN844mKyAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 12:42, Peter Maydell wrote:
> On Mon, 18 Apr 2022 at 20:19, Leandro Lupori
> <leandro.lupori@eldorado.org.br> wrote:
>>
>> PPC64 CPUs can change its endian dynamically, so semihosting code
>> must check its MSR at run time to determine if byte swapping is
>> needed.
> 
> Arm CPUs also change endianness dynamically, so why is this
> change PPC-specific ?

I'm reasonably certain that we simply don't test armbe or aarch64_be semihosting.  Leandro 
found this because qemu-system-ppc64 defaults to BE and qemu-system-aarch64 defaults to LE.


r~


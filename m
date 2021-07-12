Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D683C6028
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:11:53 +0200 (CEST)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yXA-0004Bp-Hp
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yVj-0002Ry-0i
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:10:23 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yVh-00066v-7C
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:10:22 -0400
Received: by mail-pf1-x434.google.com with SMTP id q10so16798597pfj.12
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 09:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pvTJ6S4elx15E5VgSHh+n4aFy4DOdJaX331FJ7o3jZs=;
 b=Kp3Py5CErzs8UvNI1nrih7Maz5TDSvDwVq+8fK2h8xm1EOp39kfyTEzOjkNwwIk0Ph
 O99tKSKz3apRY7paMrmLqEURfvEfPsdpS4RCR/v/K0rxYiEYUR/ckM4q2dfjU94zdDZf
 fHDakin87tqEKZN1pGVAgO6MloIHQivj6M7KwpyJ7LIGwaO7IO2XLZlbiMHSM/XX8TzV
 InEKsAithNGkSVtvkbvktqGeeR2Q5F6f+rfTJM9UgGBf7gOFOtv/Vad25uYLD/PZX2QT
 KK+mTZP7ofq5EVDHUi5uGiyvi8p2oWIKjMNCa1kBum0VklUM+khRgkDBrg9pam6QOjTZ
 2XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pvTJ6S4elx15E5VgSHh+n4aFy4DOdJaX331FJ7o3jZs=;
 b=JPPHDCeosEnDlPu2W33YrkOBkRybzGTZiTH8tlaezPP/T7eKqswxTwmqUIFF2wydfe
 NJF3zw5gENlxpvH46hcfSzhxLr/yEDkWcrEb7CvvYJwOajG09n4IP+8eysXY7wSPv5az
 tBUY4L3Gv2KBCVKk39HSZxeJis+LB2EMifWi/4MGTpOsq7vJenKRQ/SIlFLR9rLTvoQ6
 1bSgBT4gGQ/B6ZIJT/tO661j67VoRgLN9kY+ySXjLpZ/Yd6LRocKvixNx8Nemuh8GSwF
 wJzemWk0jaQcby+w5Rz0k7Z78h3+SJ2X/MhJrOLToAasHLUv8KtNllTbjThVmmaRvO0e
 DuVQ==
X-Gm-Message-State: AOAM530S+Q/A+6Xj5z6tZzOrSuKUn0cYyVmEbLJEoVkq3yQfvePssUce
 6PNYkoO65Dkbs//j5th765/wgQ==
X-Google-Smtp-Source: ABdhPJyGIjjmaHhl5jRGDHZIWkMfnAxj4Aw49C3er01xk8QinNHMhWqBug7QlLlxdQKFSdPYtSz6eg==
X-Received: by 2002:a63:3186:: with SMTP id
 x128mr20091365pgx.379.1626106219345; 
 Mon, 12 Jul 2021 09:10:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v21sm21142001pju.47.2021.07.12.09.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 09:10:19 -0700 (PDT)
Subject: Re: clang build error on i686
To: Peter Maydell <peter.maydell@linaro.org>
References: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
 <CAFEAcA_jRNB=b2FS+9yrYX6r5YcnT0n9ooDH5Bnskzn9PwSKhw@mail.gmail.com>
 <aa6e3eba-1cbd-1951-2811-36856b3a1816@linaro.org>
 <CAFEAcA8NN3RKScgCgZ_E0fHich1vc-QJibsMzA3wbdVkMKLYMQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec055ee4-bb12-a40b-3110-603c6d15ca67@linaro.org>
Date: Mon, 12 Jul 2021 09:10:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8NN3RKScgCgZ_E0fHich1vc-QJibsMzA3wbdVkMKLYMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.479,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/21 10:50 AM, Peter Maydell wrote:
>>>> Lots of errors like:
>>>>
>>>> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
>>>> function `helper_atomic_cmpxchgq_le_mmu':
>>>> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:86:
>>>> undefined reference to `__atomic_compare_exchange_8'
>>>> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
>>>> function `helper_atomic_xchgq_le_mmu':
>>>> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:134:
>>>> undefined reference to `__atomic_exchange_8'
...
> The first part of the problem isn't just a warning, though -- it's clang
> actually emitting calls to libatomic.

I wasn't able to reproduce this part, only the compile-time warning.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC64D7705
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 18:06:07 +0100 (CET)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTRfR-0001SL-Sd
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 13:06:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTRcw-0000m4-A3
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 13:03:30 -0400
Received: from [2607:f8b0:4864:20::102c] (port=52074
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTRcu-0008KP-Lb
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 13:03:29 -0400
Received: by mail-pj1-x102c.google.com with SMTP id cx5so12462581pjb.1
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9Ge9+ggV8LrcVGUy00XZHJOajn1KeDScfPoE5PMY3GQ=;
 b=enZdU2AodwwA/NOXDwik0wskOm9OaBc5MgxVdO0H/iVn8dIR/YSNVzymEPILsJz8pW
 PVRHl0123dX/lMWDdVIrNcl1h6ui/19/M9idbzFcTHgf1GJSk4HB9BKgWmUUOq+DlBKG
 h734O6lW9rDrAP+Rf0cgNtSqkIhGwrpnMOf90amLQRvUn/J8BrWIOcNFuRW53s+0Zb/P
 25TA5aBFaSueHMqc5S8jPQySlpwMQ6aozMtF4kKlH0OfYdmEiLLzODvkjQ0FxzdLXF3v
 W9MstMJWGXEDVqlTgiLv2WDttqx85v8rud/N/kZ2u2RNtUvZjIhTXDg+QJa3Db17cO3u
 B3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Ge9+ggV8LrcVGUy00XZHJOajn1KeDScfPoE5PMY3GQ=;
 b=1fUDxx9e70E19OgAVds0E/GxRY4jJS5SfFeO5g7GA9ijHHps/uC9SFD/MC6taBmuHl
 o4VnKLO7suNUBYnfTXTwvDaafHc1PvepXAqGPCBqbe2eAWAG8i352EzWu/TvvUp4HlFI
 cUp6d6s8B8jQiRO9YxyDQ7ZROt2Z8sjjhx0/hs8o/rM1eCOjxHIh2R/MIdF73wzbt08m
 F3B4GPmo+lzDGjCVDuwK2iiOw2lOOYY7q9ugSQlNVlb2z6FATD4ZkXBov3naxTQdGiFE
 GIX5OfkWtTUk9sfPZ9THs8wbtjkaZpom6Pj3ajQz1Zfui7LxvTtQh1n87QmLVp279Yfr
 H4JA==
X-Gm-Message-State: AOAM532kzxL7AEhqUhF3yG0CLk7DINLzqa25tPVMpT1Au7ydqp6/M2kx
 fzCuUmfOInliwKuRVlhDHnH4QQ==
X-Google-Smtp-Source: ABdhPJwuB6JPaHF0Ul/OZEMoTb/SMVJ8h1mOwR4TCwnJOrxV0ax5vWdsWfKKRbClv10861KEgrXIlg==
X-Received: by 2002:a17:903:40c7:b0:153:b0d:f8a0 with SMTP id
 t7-20020a17090340c700b001530b0df8a0mr19963679pld.156.1647191007166; 
 Sun, 13 Mar 2022 10:03:27 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k22-20020aa788d6000000b004f73278d1aasm17159480pff.138.2022.03.13.10.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 10:03:26 -0700 (PDT)
Message-ID: <45371f77-cae6-bf96-802d-6a3e70d5e334@linaro.org>
Date: Sun, 13 Mar 2022 10:03:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Question about atomics
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
 <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
 <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/22 09:57, Warner Losh wrote:
> 
> 
> On Sun, Mar 13, 2022, 10:47 AM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 3/12/22 20:59, Warner Losh wrote:
>      > FreeBSD's pthread_mutex is shared between the kernel and user land.
>      > So it does a compare and set to take the lock. Uncontested and unheld
>      > locks will mean we've taken the lock and return. Contested locks
>      > are kicked to the kernel to wait. When userland releases the lock
>      > it signals the kernel to wakeup via a system call. The kernel then
>      > does a cas to try to acquire the lock. It either returns with the lock
>      > held, or goes back to sleep. This we have atomics operating both in
>      > the kernel (via standard host atomics) and userland atomics done
>      > via start/end_exclusive.
> 
>     You need to use standard host atomics for this case.
> 
> 
> Or use the start/end_exclusive for both by emulating the kernel call, I presume? It's the 
> mixing that's the problem, right?

Well, preferably no.  Use start/end_exclusive only when you have no alternative, which for 
a simple CAS should not be the case on any FreeBSD host.

Using start/end_exclusive is entirely local to the current process, and means you don't 
have atomicity across processes.  Which can cause problems when emulating an entire chroot.


r~


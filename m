Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C635711C9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 07:17:53 +0200 (CEST)
Received: from localhost ([::1]:52700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB8HQ-0006uC-Mj
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 01:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB8Co-0003xz-Kt
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 01:13:06 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB8Cn-00062c-06
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 01:13:06 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso6873668pjh.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 22:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x09xNewhLBMDfEtM/iZf4yxDLOg/P09G8+wGQ3cjHfs=;
 b=vmZDX140o/posZMb5HdjdHCoqQOfwwFAPNPOsK2ftoeQdZ5o8WASBWXW5Iyt1tVVah
 2/6QrMg5cWHdJnKs1X91lwZcQafatqbb7J9i3pGujHNNFmRIKsziQ48nLU/FovdMHDFH
 XvB4CmWe9Th0S7m3r2PoAkkYw3PeC4mbAP5zWdfrRjqhFxzMjzAWkStvZblsJnOvDeDq
 wNtAZB1cxIn3Ekdc3sa0bClzarp1rL6t3uP0OWuydO2LqjK9KTHn68Nd3VUK/uDIwPcv
 wHvb2dTDnt8iSY9P3rWZtdV7vawtPl8y+Fy9/zBBExu5u1Iv/FZbE42JxBA5FDpIdodB
 odEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x09xNewhLBMDfEtM/iZf4yxDLOg/P09G8+wGQ3cjHfs=;
 b=tnSxSRL7DQ/GfcnNBqSKip++JlCJZypJ+uGze2SBL87yTqs/faSFulA/MFax5+e2xm
 G5euIYfIFs1/C8TL5xPmMVWkHB6atAoU6ecdwoAOvl6rHYxSma8AfoxrsbYwt+CTfVfj
 I70jl3bCuL9wIgS/hOYKtCNyXBADgwSKqgyr4XwgfRaZ7vKlNRfI638Odci+py132M8Y
 uiy7TG9J27Z4qD9xoL+RRUTvkWCSdBxpX6P8EIwOXOE5P6aXW88kJBTqwhzbRdEHQoer
 aN6RUgOK/LyR1fgkHGGVpI3Chvz0G4UqmPsIDf9Glm78QLi79tCI0LcncGl+UpPr5WNe
 4LrA==
X-Gm-Message-State: AJIora+PnacR0W791PEmidLhXZYNsSt2gtgqdpDEdQMXu+pOS8ye6B6m
 GxcyBxPnzhGZug4KZBqbBi2dqw==
X-Google-Smtp-Source: AGRyM1uLO2CoieDuQkl0N402ELF997pmpKZgpBxCtj73cR5iudUJVd2Erve5ihsaIysaHiHnladcKg==
X-Received: by 2002:a17:902:ecca:b0:16c:569:47d8 with SMTP id
 a10-20020a170902ecca00b0016c056947d8mr22278060plh.97.1657602783682; 
 Mon, 11 Jul 2022 22:13:03 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a17090a7ac600b001ef7e7548b8sm7858360pjl.44.2022.07.11.22.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 22:13:03 -0700 (PDT)
Message-ID: <158ff2f0-ed49-1551-265c-cf7b068ddb8a@linaro.org>
Date: Tue, 12 Jul 2022 10:42:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] accel/tcg: Fix unaligned stores to s390x
 low-address-protected lowcore
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20220711185640.3558813-1-iii@linux.ibm.com>
 <20220711185640.3558813-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220711185640.3558813-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/22 00:26, Ilya Leoshkevich wrote:
> If low-address-protection is active, unaligned stores to non-protected
> parts of lowcore lead to protection exceptions. The reason is that in
> such cases tlb_fill() call in store_helper_unaligned() covers
> [0, addr + size) range, which contains the protected portion of
> lowcore. This range is too large.
> 
> The most straightforward fix would be to make sure we stay within the
> original [addr, addr + size) range. However, if an unaligned access
> affects a single page, we don't need to call tlb_fill() in
> store_helper_unaligned() at all, since it would be identical to
> the previous tlb_fill() call in store_helper(), and therefore a no-op.
> If an unaligned access covers multiple pages, this situation does not
> occur.
> 
> Therefore simply skip TLB handling in store_helper_unaligned() if we
> are dealing with a single page.
> 
> Fixes: 2bcf018340cb ("s390x/tcg: low-address protection support")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Queueing to tcg-next.  I'll let the test case go through s390x.


r~


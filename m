Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8D581A8C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:52:17 +0200 (CEST)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQbI-0003z9-DP
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGQLD-0003IX-Vz
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:35:40 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGQLC-0004JU-Bg
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:35:39 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z3so14259968plb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KozUYsbKRIhh2VNIgblb73kOES0Vu5VipPYKlFfNnOk=;
 b=A35vwUbrLKFy5eqv85SrBn/0PS06rsLgUjDDUI508ibuEbCZcQYvG1S5AOsd/IFuPH
 UqyujDZv5slu++Ye+rX5rnw207c4mhRFiXY4glgFH1kOs7SmuFr52sRXXz5WPneaIvgL
 ZUkDstHG/O2h56XTbFeWufLCN6boIjWIdRhpmXKc8C/+l1fGBK45rcMESELu+vH8HQND
 pLELTPQOlzzGVxeDyNHYHlu6tFPna2M/VbPY9xSIYxsJbMyjuKn6MyO/hZ9Xbp+Vjojo
 VHLm+wTuH36NqIsvIqlgrRDOGSSF9gHs44IlZ/RWyIaCZqRreqwZzxWIXAVa0O0tSPzC
 inqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KozUYsbKRIhh2VNIgblb73kOES0Vu5VipPYKlFfNnOk=;
 b=VgNxDgO1Yfc/l5DQe+iJYglqK2dIBXZFL0cHMRc4SloSCYrr3kAxBZWP00qBRELxYS
 vI5KWAik5oVrQjnQbAZ6mNEKijp8LNTy5z/6ocXRmOdibuLtFj9cc8YLQObKMk/+s0rA
 kXfE8E8oRgYD4QJALQA/JqUA3YzbvyWv73FZgt70C4At5gWcymZgeCK3NBRBAwRhcWSJ
 BvKsgqW79qyvKkq6x98nqhrZR8lNQOU4cD8z2bU+x4e+NIhZHbR9MTLmE9LaN2UtBD9y
 5NtnBzM5QRirdom8TRli8dWLl3R4Te7FRBQ0PBKUJocuGrIna8LjqPce0K6vb1ViuQ82
 85HA==
X-Gm-Message-State: AJIora9Q4dC0wEFLsvQl99/Kj+ReIzAGoNvQIIoePKN4Uz+4cO5RHRIV
 mgwdE1L2KDRLp+nMb10daWrKiw==
X-Google-Smtp-Source: AGRyM1t08s2EGQWiZ1mH4xd/RGbeLoaTZroWPY4PDJ96aX15j5/Om0OkCmRXkLu9PE+3hSO3y7Tt2A==
X-Received: by 2002:a17:903:41d0:b0:16d:4b28:769a with SMTP id
 u16-20020a17090341d000b0016d4b28769amr18410264ple.112.1658864136139; 
 Tue, 26 Jul 2022 12:35:36 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:33b:7a10:8a4c:53bc?
 ([2602:ae:1549:801:33b:7a10:8a4c:53bc])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902ce8f00b0016b68cf6ae5sm12056488plg.226.2022.07.26.12.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 12:35:35 -0700 (PDT)
Message-ID: <633e5fc5-a5ca-f49f-2e6f-5ea63309016f@linaro.org>
Date: Tue, 26 Jul 2022 12:35:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 1/2] hw/ppc/ppc440_uc: Initialize length passed to
 cpu_physical_memory_map()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
 <20220726182341.1888115-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220726182341.1888115-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/26/22 11:23, Peter Maydell wrote:
> In dcr_write_dma(), there is code that uses cpu_physical_memory_map()
> to implement a DMA transfer.  That function takes a 'plen' argument,
> which points to a hwaddr which is used for both input and output: the
> caller must set it to the size of the range it wants to map, and on
> return it is updated to the actual length mapped. The dcr_write_dma()
> code fails to initialize rlen and wlen, so will end up mapping an
> unpredictable amount of memory.
> 
> Initialize the length values correctly, and check that we managed to
> map the entire range before using the fast-path memmove().
> 
> This was spotted by Coverity, which points out that we never
> initialized the variables before using them.
> 
> Fixes: Coverity CID 1487137
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This seems totally broken, so I presume we just don't have any
> guest code that actually exercises this...
> ---
>   hw/ppc/ppc440_uc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


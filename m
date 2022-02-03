Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916514A7E8D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 05:02:57 +0100 (CET)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFTKi-0003CZ-2k
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 23:02:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTHH-0001e9-Ao
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 22:59:23 -0500
Received: from [2607:f8b0:4864:20::430] (port=44889
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTHF-0002GF-SO
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 22:59:23 -0500
Received: by mail-pf1-x430.google.com with SMTP id n32so1108008pfv.11
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 19:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zt6WytAulzRER2fkBm+Sow/hJOZpD8/PhHpwcscIyhc=;
 b=Rajs1triwrR+L2t1ZBTkZo46hCqgFQknVyMnsDcisUSHqxOkoQGtOZw6p5mNvx7Vrh
 dlQdFJniaHbnIZfD9zUvtD9jIVdD13pEecq9TV6CX5UkdPySIHx1cWDN2Vut8NlijG4d
 b9KXW8TuV/pG1XAMPuGSEhtURV1/l+Li9l5sGPGw2JWwpVxxmMVL7Eb7itlVj485E3Nr
 CEvwh8a7HgZqHOe5nSWBKjC7enu85ZTdLRoPbptXOy7vPiZuOSPhAaVQ3ILpuyJL/POs
 Jekl0lUq+VDzYPIoAq2vV1e1oL/1FojJUAUed9SByaS31jfNXwPBzM0buip36Q5GoxKz
 wtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zt6WytAulzRER2fkBm+Sow/hJOZpD8/PhHpwcscIyhc=;
 b=LTUGnwUW5JC8wVUJ9KLCR9mdEm9ZjZR08tIJbFtRk9bGIsyehZnE9kauAjnpGPdgM6
 yH3VTF3ouJL4AcstJhCpbfYbEy4pNF9lpiyPSt/AMyxqJM1D7lVn1pKx7zfhds03wMaL
 JXIkAoxFWBzLAuAKqDez/EPhMK19fMd5E8id3Q5uX7FYI8n3I+T4xdVs/MTsmcuHRTFN
 yjX5KvkwBZ5VAq2ImKrZJhVVvtLyMv02uOYtv477sYHFVuYnxDaYw20/ebw3GaSsdGSW
 b+iUcjRDjjUGHV4dJSVl3YmLQaZV05ybDQxs3k2OQuy7wI8x3F0+2LcN5KIEEdgBZW7/
 x7iw==
X-Gm-Message-State: AOAM533Aox1sU+aTL6PgY5LmBbXkbsDeQSrkvMwn+vsDqimdY/NpHoMg
 UQvW50vTuCpRBc6BoPuEH5iBNg==
X-Google-Smtp-Source: ABdhPJxgbr1fUpXrG+mQtJ9xNg5DVGz2Z+KuD7K2f8mNhLddnjZxyQLQgP7tuyrMCV7xQJ8NaWLi1w==
X-Received: by 2002:a05:6a00:2402:: with SMTP id
 z2mr30666869pfh.42.1643860760168; 
 Wed, 02 Feb 2022 19:59:20 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id v12sm5561422pgr.68.2022.02.02.19.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 19:59:19 -0800 (PST)
Message-ID: <afbbee74-b6fc-7b55-f7e4-c5ae926f7519@linaro.org>
Date: Thu, 3 Feb 2022 14:59:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/13] hw/intc/arm_gicv3_its: Fix address calculation in
 get_ite() and update_ite()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:32, Peter Maydell wrote:
> In get_ite() and update_ite() we work with a 12-byte in-guest-memory
> table entry, which we intend to handle as an 8-byte value followed by
> a 4-byte value.  Unfortunately the calculation of the address of the
> 4-byte value is wrong, because we write it as:
> 
>   table_base_address + (index * entrysize) + 4
> (obfuscated by the way the expression has been written)
> 
> when it should be + 8.  This bug meant that we overwrote the top
> bytes of the 8-byte value with the 4-byte value.  There are no
> guest-visible effects because the top half of the 8-byte value
> contains only the doorbell interrupt field, which is used only in
> GICv4, and the two bugs in the "write ITE" and "read ITE" codepaths
> cancel each other out.
> 
> We can't simply change the calculation, because this would break
> migration of a (TCG) guest from the old version of QEMU which had
> in-guest-memory interrupt tables written using the buggy version of
> update_ite().  We must also at the same time change the layout of the
> fields within the ITE_L and ITE_H values so that the in-memory
> locations of the fields we care about (VALID, INTTYPE, INTID and
> ICID) stay the same.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 19 ++++++++++---------
>   hw/intc/arm_gicv3_its.c  | 28 +++++++++++-----------------
>   2 files changed, 21 insertions(+), 26 deletions(-)

This is confusing: 5-3 is titled "example of the number of bits that might be stored in an 
ITE"?  Surely there must be a true architected format for this table, the one real 
hardware uses.  Surely tcg will simply have to suck it up and break migration to fix this 
properly.


r~


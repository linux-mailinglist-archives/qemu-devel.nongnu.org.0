Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3DD37AA33
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:06:03 +0200 (CEST)
Received: from localhost ([::1]:44484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTxS-000178-Ue
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgTvr-0008Ac-9o
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:04:23 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgTvo-000104-JO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:04:22 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso17769689otm.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TJEKbVbKD1k8UdgHklL02qbgqN6+BBdukVtcBeU0C8w=;
 b=CRTgoxCxVWG/PsSlgr5NAvHJi1iH4N6y5lz7O3aBpeFgH7d2zzJT1MfcIo3IW+pGrH
 P18/O+3bHSEcfTvC8CeIzjTmbZ7TeL+9SjZCW9/R3urkJTWOd3P8BCuRrIDbNAMFtO1t
 FePrvmPyDVtLcfYxOcHikSNFdl5/HjcszD/nnxjf8BKcDrQMJ0lgmrd7ZM6iGQeTXASq
 VEafvjDMUC25+tMj2VuYrKeOOQnPtgkgGutKrzXufNPuE1SS4j8zNRjqSCsLiTC56dBy
 0R7TOs8F+9yGDA8fQ+wH3REiqkzJEOXeEmU1LgWcD51MPhfUhr5Hg38eKJ0EAZyWqJlG
 C/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TJEKbVbKD1k8UdgHklL02qbgqN6+BBdukVtcBeU0C8w=;
 b=HtVH+5GiNF+gx9Gz70DsOs8c3g1GpMN+TNg3K/eolNm0kpKcQMm+5KDuqakUZGxfLH
 5XBmF0lc1kwlmK7VDbyzNAhr9pgw/SPtvJuytc1MhV1VaSSejg+TnMt25512/+rEv91l
 H5cU2AQNYTdSUDJSKwsXF1qKFwvXzWgPDVueDeVOGaNDb/NusfJ0l5AWAMvj/BlD0gGf
 JMVY9yRmfziKaLFk3pdfcdxOqkn/FLXTckNfDxn6hDvV29TybAOz0+In9Iypy9rhdPK/
 4IWVFitkscAGV+MgHWhwGJy3oHOVBU2eg/CjDeATxDFpA8q7Yc38qnZvWnNHrd3kna7H
 FovA==
X-Gm-Message-State: AOAM530GPUQwnfhvGUdUb2zzwjn9HRdjpgKUdxsilQxlyQzVEH9pCRQl
 j/ichOcyT07jAl1haN2vDKKddQ==
X-Google-Smtp-Source: ABdhPJweTM+xZQHczFUOKPqtFx0xy2AJuMWeUDx9Sjb5ygg5uYYMopMe4iAAO7wEGHjWiezpmzl8Dg==
X-Received: by 2002:a9d:6244:: with SMTP id i4mr25518876otk.182.1620745457723; 
 Tue, 11 May 2021 08:04:17 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id g9sm3326005oop.30.2021.05.11.08.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 08:04:17 -0700 (PDT)
Subject: Re: [PATCH 25/72] softfloat: Rearrange FloatParts64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-26-richard.henderson@linaro.org>
 <87a6p1gyn7.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9b8721f-c077-37f1-345c-ce3b3ee35d77@linaro.org>
Date: Tue, 11 May 2021 10:04:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87a6p1gyn7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:57 AM, Alex Bennée wrote:
>> +    union {
>> +        /* Routines that know the structure may reference the singular name. */
>> +        uint64_t frac;
>> +        /*
>> +         * Routines expanded with multiple structures reference "hi" and "lo".
>> +         * In this structure, the one word is both highest and lowest.
>> +         */
>> +        uint64_t frac_hi;
>> +        uint64_t frac_lo;
> 
> This confuses me. Is this because it could be frac_hi or frac_lo at the
> "top" of the structure because of endian issues?

Nothing about endianness.  There is exactly one element, so it is both the 
"first" and "last", both "high" and "low".

Generic code will examine the "high" word when looking at overflow and things 
related, and the "low" word when doing rounding.

This anonymous union gives the same element 3 different names.

r~


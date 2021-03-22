Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AE8344D48
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:29:54 +0100 (CET)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOONF-0003tE-ID
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOOLM-0002Qe-3c
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:27:57 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOOLJ-0006AT-Ig
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:27:55 -0400
Received: by mail-oi1-x236.google.com with SMTP id l79so13866760oib.1
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k6l0ldrTj60B8dIzBi6ALKVNDfLa2g2zMslosUj7gsc=;
 b=f4NNyfng1Gl6KJzrWXdV9hf4v+tD6CTCOP88tMUD3fWsGRFXvLWJQ8KBJjlAnC5q5B
 vh5NZn3t0LHD3Oe4/cA8cG2eozzMAip2nYLHc+0j3Lm6bKARmnhmAKDh9tgjffPYiOj7
 4ErcfHOMPe8CQUCVp7eJKF2OdIRQhPP6X2dxKgABy2XOfv4XI1ofpMV36Hd5qjARarZQ
 Vvfo7oub0IS1hAv/TLNnKi4wzOKahJuaJW/sHYoQPunGLk9NkRIvWdyYoGFz10AnBb0l
 qSjqJdDYpjBtGmRMq8AqwC+0gB/P+4wChrn00gCdU6yYs/L1u2GOGdfm+7JPXGLk+fjq
 g7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k6l0ldrTj60B8dIzBi6ALKVNDfLa2g2zMslosUj7gsc=;
 b=TlGl64aMtGCt7irchK/H4ox50L/BDXrH7axvwBQaGjLvLzudJM5N5yMecPXTXPPXRu
 HDwiaLFlyIQppaM2kQMjAeh27txxPsEd6GLQZTGVS7itZyrKyAJn+nNFBceIxEliQ8Cs
 XhVe0xB3b2OspJwhz4tM7nVXpnpSjjfTGVqI2iFcC+rqxi+nyHba/j+y3lWZklulpCUM
 kAgWJoa+cEnVY9VA690eYKQk8Ef/1S/y63hTz7z/t4DrWYL+IQVZPAaEWHyzFdhYXdCg
 EAHiZ9pBJOfJ3FwuMosF4UwcM8bLucEf5CPhb+2qb+BvwH9SUndcN9/DJYADBqpyfTk8
 ffsw==
X-Gm-Message-State: AOAM532qJBueGIdcDIBz3LwlTkuhBUIYl4txyraThTay6rO9HAKR6X+n
 atzhHT8+QgNAZftN1oSRrRNH9A==
X-Google-Smtp-Source: ABdhPJxMS+myQhnmdgTHa3/8jShMNLV2TySRYFzLBG3DErFHz0amQqdNle9YHIpwBMMf3thktX30Iw==
X-Received: by 2002:a54:4696:: with SMTP id k22mr109531oic.168.1616434071993; 
 Mon, 22 Mar 2021 10:27:51 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id p22sm3610766otf.25.2021.03.22.10.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 10:27:51 -0700 (PDT)
Subject: Re: [PATCH v4 13/17] target/ppc: Remove env->immu_idx and
 env->dmmu_idx
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-14-richard.henderson@linaro.org>
 <YFgcbsRHrTxRqKI8@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e0425b8-6239-5b34-7fc4-7a8b59532d6f@linaro.org>
Date: Mon, 22 Mar 2021 11:27:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFgcbsRHrTxRqKI8@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/21 10:26 PM, David Gibson wrote:
> On Mon, Mar 15, 2021 at 12:46:11PM -0600, Richard Henderson wrote:
>> We weren't recording MSR_GS in hflags, which means that BookE
>> memory accesses were essentially random vs Guest State.
>>
>> Instead of adding this bit directly, record the completed mmu
>> indexes instead.  This makes it obvious that we are recording
>> exactly the information that we need.
>>
>> This also means that we can stop directly recording MSR_IR.
> 
> What still uses MSR_DR, that you can't also drop it?

#define CHK_HVRM                                            \
     do {                                                    \
         if (unlikely(ctx->pr || !ctx->hv || ctx->dr)) {     \

I have this notion that this (and CHK_HV and CHK_SV) could be a test against 
mmu_idx instead, but was reluctant to make that change.


r~


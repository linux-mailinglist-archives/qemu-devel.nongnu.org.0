Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BD5108C4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:15:09 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQeS-000161-Kw
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njQL1-0003GC-4w
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:55:05 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njQKy-0002A9-EF
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:55:01 -0400
Received: by mail-pl1-x636.google.com with SMTP id k4so19502775plk.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ZKUEwdyeOMl/2CBrJws3tj7AEyHZvUwXY8zK7ec9zTw=;
 b=DTEbC8y6eTDgzs7p/WhwTRfQzy8nl4Qp7uAf9kebtrOoGC0GCu8gRIaF7DFKNIANg1
 +7xu5ntHls0eqnsA4Giy7+kLVsx1opBeWniXZIxwhDSB1hyBhvSrCcv3B+QW81j8/5Fq
 bZ+rAs9uZCJQiW8YxJ0xoOD1S00H3T5i52xLz+v1nQ+VHTwjPeksWDtED+ZDpIvps7jN
 u4F6SNykj4Bdvr0AnUUkRzcRlWYGQRDMFR1mC09XKPkkGqLBwzOP0G9DewRpGyXwHX9r
 1mLDvjusgMuUeblrp1ChCoY9vHtHq2621EMwmJOMhTOsekV8C4DgcRS1Dya9cg8ZDZsP
 PgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZKUEwdyeOMl/2CBrJws3tj7AEyHZvUwXY8zK7ec9zTw=;
 b=UluNOG3KPydSxpLZyz3bnZ/0gbDseoCVRgAmb/Xj/rxuaG83575hg0hu3moovROLRr
 BWFskax8r5M24I9nt9k8i6JpRjvxhrypp35E00e/HvZVQ/PyFx0+5Ysqwclu7o30gjT7
 neNsCEAbkGZ0NCICBhC0JCT4AajYxt82zkV8zYmHo/zOLqK3X5f9glJjk17t2jRPgbci
 i5isgdWf/PXIx4UkxrsAA1JK5nb8FHmW1O47L/ISA4S+q3vk2n0vDpm4AnruutaqfTGO
 99iQyD266O11ntui7YJHlMCtJdcrWu302hlY4+CyDt0o1+Bl5fhAWFfuqPkmNITVmFYf
 LBVw==
X-Gm-Message-State: AOAM530PDbv+cX1+nzSEcV+9QGy12WbG1Euq1oEhR4AYI2zQTCQWj/WC
 yx0/IskPTs9hnWpuaUqCQ77ZwQ==
X-Google-Smtp-Source: ABdhPJxK0NuuM5zBaD83XsCrkMArSprGOmqJ0ZymbrBvwTHjp3nZAA1Zuk7wsS8HAkE4Zm8951N0IQ==
X-Received: by 2002:a17:90a:a58c:b0:1c9:bc35:6ed9 with SMTP id
 b12-20020a17090aa58c00b001c9bc356ed9mr27962834pjq.146.1650999298908; 
 Tue, 26 Apr 2022 11:54:58 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a63140a000000b003ab0a9a6926sm9488835pgl.25.2022.04.26.11.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 11:54:58 -0700 (PDT)
Message-ID: <f5443f62-bdc7-dfd0-ea3a-e13cdcc3da52@linaro.org>
Date: Tue, 26 Apr 2022 11:54:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/9] replay: rewrite async event handling
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
 <165062840564.526882.15249141058569885051.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165062840564.526882.15249141058569885051.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 4/22/22 04:53, Pavel Dovgalyuk wrote:
> This patch decouples checkpoints and async events.
> It was a tricky part of replay implementation. Now it becomes
> much simpler and easier to maintain.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

Looks ok, as far as I can follow.  With a couple of nits,

Acked-by: Richard Henderson <richard.henderson@linaro.org>

> --- a/replay/replay-snapshot.c
> +++ b/replay/replay-snapshot.c
> @@ -61,7 +61,6 @@ static const VMStateDescription vmstate_replay = {
>           VMSTATE_UINT64(block_request_id, ReplayState),
>           VMSTATE_INT32(read_event_kind, ReplayState),
>           VMSTATE_UINT64(read_event_id, ReplayState),
> -        VMSTATE_INT32(read_event_checkpoint, ReplayState),
>           VMSTATE_END_OF_LIST()
>       },
>   };

Bump version_id and minimum_version_id.

> +void replay_async_events(void)
> +{
> +    static bool processing = false;
> +    /* If we are already processing the events, recursion may occur
> +        in case of incorrect implementation when HW event modifies timers.
> +        Timer modification may invoke the icount warp, event processing,
> +        and cause the recursion. */

Format multi-line comments per coding style:

   /*
    * block
    */


r~


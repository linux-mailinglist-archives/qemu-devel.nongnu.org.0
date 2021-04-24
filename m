Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6854B36A257
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:22:25 +0200 (CEST)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLz6-0000xM-87
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLwE-0008Fw-6d
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:19:26 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLwC-0008SG-Jq
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:19:25 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso475863pje.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7BLLFYMLjb2r3v6ZFZes+huARF5vqTTqG2A/bFv1guQ=;
 b=lhrne2t4gSALlXngfosOCmMkK/VOT9gNAcLDJY+51yPL8T4p0hEzVhSnkHXsbkeKWq
 EWnCIxH5CleGLtrnPQTXxeSSFbQVs4Nig2VmI4sEbez9ZbF3Gnt2ohQSPnm6zAAlAVS2
 5p+NeSxhGwNXOy12uXILRS0TBo2nH3/UJymUn3J7FYz2RtAobjYkdU1K5jglDBLnL7QH
 szFT6nyB6nXlYQs0QPI3AFUvL11pdwvSIDKGp8GC5loHLj64yL4MA4A6BXKbajA1lHjf
 Kaz6Nbwyi0ivuxD7LXHCPEOWM4/RE60xHdYu5UWz8Ot/u8oA0UE5Y57ajQYe3elpVmDb
 pheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7BLLFYMLjb2r3v6ZFZes+huARF5vqTTqG2A/bFv1guQ=;
 b=oZvSd4prU69t0wm8Gaoy70l74SmIAIZiacGUhF3i1NW+ofINbruUuGwy3WSJrgFpZk
 MLLTsTchnRjfLa8Ot70ZRR7+6iZbkdPCYnQVb2ndLRbNN2TZghRpVunD37vTB6zDK3bq
 CbHUWqJIn4YgaWoH0nTyUwgU0EZSmZDVM4f2txqgvbo9hkkMb/BVlxbEXuaGYUG1HCJS
 GN0dk4c5TL1/h23E2fWfvipf34P8jIfrd8XHA9XsJEBxOXJllVfDbNoz5dYitCfB9TBq
 DCsIYnRzfPx79vlAzGzpUGF3oXLkf0KuvtbhS1ngPpKal0iT+gjpAyO49lkgIeM4N5My
 cKPQ==
X-Gm-Message-State: AOAM532ZAOz3F9q4waKEciRfndkWk2jXykF2H1NHo3zUQdRzvSBwb0tX
 BOCbyWl83g/lzSRZj83BTT/IQQ==
X-Google-Smtp-Source: ABdhPJweeIDO845qWa0nxmYPLJF6l40y0ep5JKYGX9ZBKpNd7AMGyidNOb16l7WrBzRL6m9LpTmh6Q==
X-Received: by 2002:a17:90a:cd06:: with SMTP id
 d6mr11035597pju.91.1619284763130; 
 Sat, 24 Apr 2021 10:19:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id f3sm7668052pgg.70.2021.04.24.10.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:19:22 -0700 (PDT)
Subject: Re: [PATCH v2 10/48] bsd-user: Remove commented out code
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <469c0a18-9953-50dc-d5d3-a45af089aedf@linaro.org>
Date: Sat, 24 Apr 2021 10:19:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Remove dead code that's been commented out forever.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31381647E69
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 08:20:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Xea-0000RR-3Q; Fri, 09 Dec 2022 02:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3XeA-0000Ou-TD
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:18:16 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Xe8-0007Rx-6s
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:18:14 -0500
Received: by mail-wr1-x434.google.com with SMTP id w15so4273610wrl.9
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 23:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N1woKxCDg7QpuRQ8O3T622rOvXPnCx6CGix4MBLFF9U=;
 b=CTC/nxquOMtz8eUC10f4yF9NhXpcBvekEareyg+sIuiBpreMNufTD0yGOvdc97RKx9
 dBsOZxYURCxbISYgWrW71fPylB8S8Am0g9TLkQjsFEM1oCNu/lnDISIzMEJQ97KLlBra
 JVtROesKPMMNxZVRxRk+VZwrY53r9INcXLX3F8ji4HwlOkLn1qCaYTDJDjom1tX+p1i6
 COkgHgQn2mxXd5fKDPLF8266TTAYTa1XeYk/AAriNCIIUt1VyRGAIkZ6ZxIsv9jxtd3m
 bFazZwmk5VNNbQ5SZ9nw3WZJiTzV5yU+Clag9byYuGHHmvAuiecPriHUft5GjUCgOkCG
 0bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N1woKxCDg7QpuRQ8O3T622rOvXPnCx6CGix4MBLFF9U=;
 b=sm3smxsYyzWWERo7ku1gztWMle40AlqkrjZERTNOrFVyTI9Ggiz5sCCHDw7WyjU+Od
 d98sRB4YY9upHu5kTibVG+Hdv3o5eulNSJYrv5YjCqyyQGGT+bxYkMJ+k+2CLtLkXxlD
 7kZ2zmWxWQmDglfXaQjG5GYF9yQ36HlObjR/GZbAVFUsyFnS3q9rie76S1KWxH8mqf6k
 TDiodxD6JU7L0Jh2oxgKw2lHg/TnoZPA9GkPFxp1Wm/T1cjbjBVvw3Qny27fcjnWCstw
 yfhZt2zimcQuzMi+PKZj4pDVZxwna7oDWhWDVq06wJMCzh+gHSwjtB2GcGTMjVc54Pll
 1MTw==
X-Gm-Message-State: ANoB5pn7hb7Nxk1WQxJ5LgRE0dVHFwaPaR/xya/UZQNE6jmQaEcRA503
 5kU9nYOknzEPxswD+k0SttnBtw==
X-Google-Smtp-Source: AA0mqf4g0hIJuNWHqln8hAtKWwhAZFOCHWiGLIznfxpbrMd7Dw6R5tfRG6KPIlblWDaskF3jPbIpAw==
X-Received: by 2002:a5d:514e:0:b0:242:2314:ccb7 with SMTP id
 u14-20020a5d514e000000b002422314ccb7mr2919353wrt.50.1670570290409; 
 Thu, 08 Dec 2022 23:18:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay2-20020a5d6f02000000b002366e3f1497sm667960wrb.6.2022.12.08.23.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 23:18:09 -0800 (PST)
Message-ID: <5bf64a38-0750-dbdc-f51e-f24289395f80@linaro.org>
Date: Fri, 9 Dec 2022 08:18:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 6/8] accel/tcg: Use interval tree for user-only page
 tracking
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209051914.398215-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/12/22 06:19, Richard Henderson wrote:
> Finish weaning user-only away from PageDesc.
> 
> Using an interval tree to track page permissions means that
> we can represent very large regions efficiently.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/290
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/967
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1214
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/internal.h           |   4 +-
>   accel/tcg/tb-maint.c           |  20 +-
>   accel/tcg/user-exec.c          | 615 ++++++++++++++++++++++-----------
>   tests/tcg/multiarch/test-vma.c |  22 ++
>   4 files changed, 451 insertions(+), 210 deletions(-)
>   create mode 100644 tests/tcg/multiarch/test-vma.c


>   int page_check_range(target_ulong start, target_ulong len, int flags)
>   {
> -    PageDesc *p;
> -    target_ulong end;
> -    target_ulong addr;
> -
> -    /*
> -     * This function should never be called with addresses outside the
> -     * guest address space.  If this assert fires, it probably indicates
> -     * a missing call to h2g_valid.
> -     */
> -    if (TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS) {
> -        assert(start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
> -    }

This removes the use of L1_MAP_ADDR_SPACE_BITS in user-only, maybe
remove the definition from "accel/tcg/internal.h"?


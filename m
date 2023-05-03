Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9EA6F5010
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 08:27:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu5wv-0002SS-WA; Wed, 03 May 2023 02:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu5wn-0002Rk-KT
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:26:43 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu5wl-0006u9-Vz
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:26:41 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso46002055e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683095198; x=1685687198;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K1W/lq+J77JYXUYXdSRvY2wh4TyDv+OXh8A3+xCd5Cs=;
 b=kZ9ppPUQV3q7t0O7984Otvy03z6BVntE229001M3d0rh/tu1yD4txfYoI/Pcapkh96
 H132ND4upVI3CmkiHtJ+rHvg4ULDB2tkrJ0HVU3lEUbXlP7rYKU8H1W4+EC+jpHvSvpS
 9UQ+tnIYpdh3J+PaTUwNE5dKLmqJGLAHzOv/VIhcqL5SgzGhtQ0rKitaDEry7/grz/5K
 JHhqjhOL9LhlwTZn0pQka/qesUbXIv1CRNh92pbRsl1rOtvQjmZ8+1dznIMJeNmLDjzK
 60vMCgv1pv1lzPsYhnbj9Tmb4AfoEZHTKGvRAC2rAl27puN2kWU+jvmOeAM4Ml7RtH7a
 Roag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683095198; x=1685687198;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K1W/lq+J77JYXUYXdSRvY2wh4TyDv+OXh8A3+xCd5Cs=;
 b=ce1+wx6o3kjnZI24e2oYKS8+CSt9q/wFYDtomh0SC3owhqBUu/8MczvntW602HsaZR
 wFDuZRrWXrqTQWd8BrnTE4mK9X6aoFd8kiCPJPG6P6IjY+OrexE4Vnj5R9PWtD9OnN5N
 fQOZ2BxBMnlWJDwyM50lmvtbyPE15RTChFWFX/tfkOa3LKnX+McGSvcfyNriMSjynXTy
 y3NwwQA5F0N79ptj4PYuRHzANldGRv3DzckebHNyZ1rAD7rIbjpys+z+boYFU8PgXhQg
 Hx3R0dSddCcRgBasITuw6c3FrwHgdBIvcsIEdqXSdl7tsDzFLXV+LLbBgzXPtxizpgUM
 cq6A==
X-Gm-Message-State: AC+VfDwFPrwXX/ePQ9fMzJP8sSbzKDjaPRopxvAZwDR9s/LN1f3yMoqI
 t1IYoxI/eYBXdOc3rvEFGU1wB8wi+hF25co3m84uJA==
X-Google-Smtp-Source: ACHHUZ4Rr75NvI1Hh6dIjxvmgKBAuCgFkHv+4kvzC7J/+sCiBBdbJvF+agXkfPeByg6lUmGpDX4iAQ==
X-Received: by 2002:a05:600c:21d9:b0:3f1:9526:22d4 with SMTP id
 x25-20020a05600c21d900b003f1952622d4mr13941950wmj.21.1683095198179; 
 Tue, 02 May 2023 23:26:38 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a1cf014000000b003f173c566b5sm853362wmb.5.2023.05.02.23.26.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 23:26:37 -0700 (PDT)
Message-ID: <69e31ddf-b485-dfd3-705f-6eea7b390aca@linaro.org>
Date: Wed, 3 May 2023 07:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/12] tcg patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20230502201818.1726224-1-richard.henderson@linaro.org>
In-Reply-To: <20230502201818.1726224-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/2/23 21:18, Richard Henderson wrote:
> The following changes since commit c586691e676214eb7edf6a468e84e7ce3b314d43:
> 
>    Merge tag 'pull-target-arm-20230502-2' ofhttps://git.linaro.org/people/pmaydell/qemu-arm  into staging (2023-05-02 16:38:29 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git  tags/pull-tcg-20230502-2
> 
> for you to fetch changes up to 129f1f9ee7df77d367d961b3c25353612d33cd83:
> 
>    tcg: Introduce tcg_out_movext2 (2023-05-02 13:05:45 -0700)
> 
> ----------------------------------------------------------------
> Misc tcg-related patch queue.
> 
> v2: Update bitops.h rotate patch.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~



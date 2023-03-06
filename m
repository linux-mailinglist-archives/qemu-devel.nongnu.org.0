Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CCD6AB6CD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:11:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4zU-0000Yp-IZ; Mon, 06 Mar 2023 02:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ4zO-0000Yb-9x
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:10:30 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ4zM-0005dK-AC
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:10:29 -0500
Received: by mail-wr1-x433.google.com with SMTP id e13so7685695wro.10
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678086626;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pSYLxdWZesqfClWwp31wlW+QVMk0EmZd5d0x3Go+MS0=;
 b=TpUfib+hy4tf7zH5xaLqzIktBaMOXxN0b14bDpyvykylhU9u1z5iydzHUf4VRTYsqu
 3IAK0gL8Nuu8GVvYjwa4H6PboTuoo9BgDkyAesmcbZKfGQ0P42LZNGLVOw3WJUl7iYyM
 4t2GaJ13oubrbbPIcWQL10g9PpJacMP/3TIr2nXAzBDF4LD6TE5As0yiypHnFHM/b8RR
 PVSWZN3I1+OAjn9Pa6OLhxfVOprvWKW/bZOgpW85+gbb9NdYMaj0njtO/hnl1lDkMjzQ
 dM1tWBC08tWBtlPwI024ceyTP3WHlQW4Mj/Zk/K93ZvwQrJ3IBFe7RRp4dmatkvj4q9s
 vA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678086626;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pSYLxdWZesqfClWwp31wlW+QVMk0EmZd5d0x3Go+MS0=;
 b=X6C6b1tSfR73fTVx3O28QAd3nRp2XJB3YLW8PSGZ2TzPcYXHh1Gr4kWcqleCuh738F
 We8vim1FWfwQ0g0AZzHPLZSilbuv8c0a9FPil4k0Y2WBuKqdzM7nBeMd9qcGOzQnXICU
 ywW0Yjs9xJj7vjKTo0IoO8cIVubf3fpW//AuWDDL8Juszj2mhWxp9lxdyGyl703PVYYr
 L7HYwygT7zM+Uqg9gr8zT1b6haJCuUfei5bt6SpaZpxHvuuLMWZ1IaExI7Uab/l/eI5c
 GLauYnbJRUx2Digex9Gk90yVQd5jlfrhnlVUjLq4DsKgBoKACMwkn5OQwt3uFAsoadNk
 sSVQ==
X-Gm-Message-State: AO0yUKWF79T9sRbxKHl3CZpFhA8q2+cdyJ3Pl+hmMf54mZ5LE9TU1vCu
 6SzlBJl/XdxHIvXdYLMN7QzGIA==
X-Google-Smtp-Source: AK7set8WMHEh+m+y7cvpwirjCsrzSw3z03KHwivgCOGzH45pkyZUbZlTCowHtBCo/0bO06sbYP7OFg==
X-Received: by 2002:a05:6000:1087:b0:2c5:5349:22c1 with SMTP id
 y7-20020a056000108700b002c5534922c1mr9297073wrw.5.1678086626158; 
 Sun, 05 Mar 2023 23:10:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05600018c900b002c5a1bd5280sm8935891wrq.95.2023.03.05.23.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:10:25 -0800 (PST)
Message-ID: <283cc237-2510-ca86-e773-e49942ec924b@linaro.org>
Date: Mon, 6 Mar 2023 08:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/5] tcg: Elide memory barriers implied by the host
 memory model
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230306015710.1868853-1-richard.henderson@linaro.org>
 <20230306015710.1868853-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306015710.1868853-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/3/23 02:57, Richard Henderson wrote:
> Reduce the set of required barriers to those needed by
> the host right from the beginning.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-op.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



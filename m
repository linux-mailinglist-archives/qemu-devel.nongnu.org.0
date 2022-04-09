Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4904FAA25
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:25:44 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFmI-0006EI-VE
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFk6-0004PW-Ij
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:23:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFk5-0000xZ-5Y
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:23:26 -0400
Received: by mail-pl1-x629.google.com with SMTP id m16so10661730plx.3
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x6v3sg1pLlMaqz708Us4VjAbMk8mldITPBsiqa640Mo=;
 b=YB1+zcAgeLZvlSrZj4VaPKb+E1B71f8zToVdfuVFkyp/6y34WiV1+oz+fHPyMOKXUF
 lkdajtjMb6/eF8GwENHeTyXfW0GEcg+X0OoawxW1WnRWVvZDmpygCrtf26Cj29guSyXc
 9axTG7xKsS7iz3U3B2hjJeunp4SeE0kQQf1WC6c/fAawKkhkVntUPefsdFoWvlDkCVki
 89HOYePgM2V9MhB2G+5bjW3Dc8RbQpAjwHxaOA7LcSUyLAee6iw+HN+6gFsbtjMFB71f
 Ng5WmDl43jYThKmg/n5SOIiveUF88GVlxi6+ZAC4tGJfisn/HQg0DOdjOE10oge7ut2f
 1IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x6v3sg1pLlMaqz708Us4VjAbMk8mldITPBsiqa640Mo=;
 b=muscQXxt6B/L/EXPN24A2ws1bxKCY4CEkstWlAVBOlMFsFvv22udZne5YnuwFxDnZZ
 OshG2ZngcrkSiSPvBL6m+N5a5YFSN5A5dNSHRpWGrwBEz/JRAfANBrukmakIFxryaFd7
 mTPO3UQBMC+5eZXbD7ECgk7Lcs+xGT78HlvYNPE4cP7qQbIoYWdq4925VtfnHiDAyBZz
 bcd61c4MT7wXzmVhT9GW8H8zdNJRbZsT9qhXLDbQKa3aH0WeIN6aSLjx3aOLmWcPixJH
 inNFWZHmoU9ags6SzqxmF4TGlqjb/tkOjiYFHJxLhaXhck5q9OKW4C9QYFPOVA83Er9Y
 txiw==
X-Gm-Message-State: AOAM531JIvLHgcKRP6wofd/Vi6hE4H/Gz1E04oxuZRVihP8b6g65Kqlw
 wzSFnnmrv3k+cT03HwfjqTb8xg==
X-Google-Smtp-Source: ABdhPJzlcGhB4Go7q4OBZeHENGs3B7RgQctRqRe05SkLHPPG6rDynEBqfcbesOHoXDCcWdzq3GZ6pw==
X-Received: by 2002:a17:902:c945:b0:154:5215:1da4 with SMTP id
 i5-20020a170902c94500b0015452151da4mr24921020pla.169.1649528603750; 
 Sat, 09 Apr 2022 11:23:23 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a637c18000000b0039cc6a3f73fsm8223214pgc.41.2022.04.09.11.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:23:23 -0700 (PDT)
Message-ID: <b27dbae6-a48d-33c5-2382-c4cdfd8e363e@linaro.org>
Date: Sat, 9 Apr 2022 11:23:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 19/41] hw/intc/arm_gicv3_its: Implement INV for virtual
 interrupts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the ITS side of the handling of the INV command for
> virtual interrupts; as usual this calls into a redistributor
> function which we leave as a stub to fill in later.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   |  9 +++++++++
>   hw/intc/arm_gicv3_its.c    | 16 ++++++++++++++--
>   hw/intc/arm_gicv3_redist.c |  8 ++++++++
>   3 files changed, 31 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


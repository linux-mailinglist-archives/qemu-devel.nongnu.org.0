Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8E49DADF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 07:37:36 +0100 (CET)
Received: from localhost ([::1]:52490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCyPX-0003w2-P3
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 01:37:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyHj-00083j-9m
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:29:32 -0500
Received: from [2607:f8b0:4864:20::629] (port=41505
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyHg-0004uS-R2
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:29:30 -0500
Received: by mail-pl1-x629.google.com with SMTP id z5so1646316plg.8
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=w9crX01QjcBCjgjqwe3zjugqNhOCjGotaoFpbGp8+j8=;
 b=SJrs8kIJ2D+oKLmz58CGL4HuMB8RVNFbd3tiwQAl5L8yJTHSdU8XRS9/NomkK7PP6H
 0VtWcgEO1SD+308At+1gHj3ta4gcZ+W80vAIKTYPvVBr4+bAgS9SRDSKYgEULGWgm8vt
 mwYGJl2H3NrDOipvPVbI0c9U24DcOb8uWuvR9EScsB82+yYID9fmQLNX+HBCDRii8zQV
 Hu502T9+aSvl2tB2+ZGR8hYlXAG8hwjLyVdA2kDHMyDw6tGyx1W9JU6SCeU+n+ktMrLd
 HEPA7CLhB+YiBX8ouipfCv9q+lVJJFIqrpyyW329JnLOuW4Bb+GEsGqAUFOnYaVXHw+4
 NjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w9crX01QjcBCjgjqwe3zjugqNhOCjGotaoFpbGp8+j8=;
 b=A0KnXuqij2nyeqHOasuXp4gyscchChRF44nJEBM0oiVxQOSj/n/ehXj6i+iZz/wxpC
 /cxkzQHr4BgwdiFxphlEYq7KNT6UYMe6KnpR6iN0kzb6wGE1YvLyRP8ectAZTOmYz1tV
 61Mt5pNEtcfLN/yZENuWQaxrmDwpMRIFI9957XbQcrRkH3JQ7QBC2a3uTwG5r4c9j/70
 Am4rE0ftTmGWrpA5mA5lb+hIYNBQLY4e8eIT4qyqv3Z5UuqV4IF19SWEOMZVOexNYKRU
 hic6GgTUbuziBiZoG5vS1L9AjUyE1swCybIUmoqUwY3KNIZqLCuvo5TaT4v4PWK2UzHc
 ebLQ==
X-Gm-Message-State: AOAM533RzZ18WeQFjinmgomZfRmpWgZPAdTrO6czQxhu/s+i3OoY6Uw0
 eap7DNqgGXEa5rs2/LkgmYtvuA==
X-Google-Smtp-Source: ABdhPJzWY4II16dTQY1sxkJPtp1PlORYv/nglaD4NmQcGEviq7LCat6HSpsn0e6+rC3ya8g3D3rXVw==
X-Received: by 2002:a17:902:b493:: with SMTP id
 y19mr1861161plr.97.1643264966730; 
 Wed, 26 Jan 2022 22:29:26 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id c5sm4096232pfc.12.2022.01.26.22.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 22:29:26 -0800 (PST)
Message-ID: <04286679-687b-2d40-2ae6-d3a9fc98fcf0@linaro.org>
Date: Thu, 27 Jan 2022 17:29:20 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 16/40] bsd-user/signal.c: implement abstract target /
 host signal translation
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-17-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-17-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Implement host_to_target_signal and target_to_host_signal.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   bsd-user/signal-common.h |  2 ++
>   bsd-user/signal.c        | 16 ++++++++++++++++
>   2 files changed, 18 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


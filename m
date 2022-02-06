Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7661E4AAD24
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 01:14:41 +0100 (CET)
Received: from localhost ([::1]:37504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGVCS-00017U-2p
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 19:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGV96-0007Fv-GN
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:11:13 -0500
Received: from [2607:f8b0:4864:20::52d] (port=46772
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGV94-0000P9-SZ
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:11:12 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s16so8316179pgs.13
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 16:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ufVuWVwrrtW5tk/ACBiP10D/ynDt2wY6N1ienR9ysAA=;
 b=GguCIyZgTe/wgseIxlx5KbEH1Sbvaku+nZziQrejxkYo/RPRfXmcKw1DHBOHv9d18k
 ndj8pjDmPmxsAVn5fFu1NH4FhoFQk9B5+LhKOywNeFi4KkwbghhNf94JHbANm4a8FHVW
 Jc47M36v47yZXdDQUGUD9o+yNcYJtbzxF1hrnfPxlFVquVGzd5beMDSyQs77JCd2j0VT
 EbtDBK5pSWBC2vLjIwVIL6ofGPenTIHyOy7/C7MCycmN0An/a/KKHyShbLWyOMBYf8u5
 bo5kR/9groiu7rcbuYVXEtturoaBNqsrFir3zX0I+D3/W+NqKceMR88ryNNQ3jXMPUqH
 K3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ufVuWVwrrtW5tk/ACBiP10D/ynDt2wY6N1ienR9ysAA=;
 b=nvLTHWHX4DDwf/KjP5NBU8pcAz/lU/4J6u55D2hce7Agg9IhEdwzIdW146RZYAQuQ2
 5KhB4jPwYs10sEBky3ciDVGZS2WSNO6t/+/4cAHmBPyybax6pOIj+lRXQuTLcRr9eSEy
 d9YFla7+H9oSeJH4O1DjNOVtl0rLr9YdXc9+s25Ac5iK4tvKX7aNHKn9DisfW2Ho+b3N
 8iw26paWn1Ylp4Kx3p1zkb1OKjFEdbxhlIBW94M9kPnhEZfmgz75V9KPgsDLm9dmzT6T
 IfJn3taIHmHGuuazSvgYdNSyP6QjsQvfe0jzepQpb2kEr9Xm/JaWa/P2SebIpoIc1+Kc
 DpaA==
X-Gm-Message-State: AOAM533B8cWE+fiJK0KYecNryPFiOCwaR54qAw/AWni1xHMMyWlurWMu
 Rol1UyGz4N9NFQ13e+wMki3+MA==
X-Google-Smtp-Source: ABdhPJzwUSpPBFYiUMmfjCeGRnfZp5aOqtKZ31Nj11iT83oWSMy9hLzB83pmX2wzk2/yQRx3Pbk3ZA==
X-Received: by 2002:a63:1655:: with SMTP id 21mr4400161pgw.498.1644106269385; 
 Sat, 05 Feb 2022 16:11:09 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id a3sm6854530pfk.73.2022.02.05.16.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:11:09 -0800 (PST)
Message-ID: <0e62474b-c597-9bb1-4837-2602f4ac9f09@linaro.org>
Date: Sun, 6 Feb 2022 11:11:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] target/arm: Move '-cpu host' code to cpu64.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204165506.2846058-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 03:55, Peter Maydell wrote:
> Now that KVM has dropped AArch32 host support, the 'host' CPU type is
> always AArch64, and we can move it to cpu64.c.  This move will allow
> us to share code between it and '-cpu max', which should behave
> the same as '-cpu host' when using KVM or HVF.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c   | 30 ------------------------------
>   target/arm/cpu64.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


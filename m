Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94F4B1AFC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:10:17 +0100 (CET)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKS0-0004by-Er
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:10:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKPN-0002RD-5N
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:07:33 -0500
Received: from [2607:f8b0:4864:20::432] (port=43817
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKP4-0001Lr-Jb
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:07:16 -0500
Received: by mail-pf1-x432.google.com with SMTP id d187so13367161pfa.10
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sMTNRMBCHtGi7EC6xKMZJNviLhSVBVE+TpIhEtI8ZNk=;
 b=qRpjlLlQsOD450iWKScWJ0nPLG9fW6sa5eahPJHw4fRaJsIl5tsnSHJ0JuW99SCFUL
 5RyCJ3GFaQjRNVoFL+1OLO8psvEEQ+Dmy8MbRxczYDUblQ7i8Kc05P3Eo0MUlMKs5if0
 /pgluO/7BLuko1ou29TLoN9bKUgGUdmf/6cq5g5RKwJ2iFCB5qs11Mcyjz0wxuCWpmX/
 uQWrImfzAEk2Un041/qoILDfqQeU/XFaezvH9vOXCI/L+y6IrvCN+dp3Go76uWuVDiz3
 vqWVOHLiK6nfk5BVmhxLZ01dA72SAvDZQEjezZuTL2GxC4lzduw5JMovv7cUcjzWTDyW
 3xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sMTNRMBCHtGi7EC6xKMZJNviLhSVBVE+TpIhEtI8ZNk=;
 b=beyMj0CzfvBZ+tIBK+MS3k6h4w7uZ8t0JodSmN8QE8uVgZuI/6e+TDPlgVfSkDwz2r
 60zQzmR5D+4EREQoMD0YyPSflg6ay0fJpi2+bVUY4HdAos9kQmNW1qxhJu3xLFWTu7Au
 q6gWYO+2IAYCIXA2wGewFAVyVo66xYXIQxn0HhV/wAt2/Hw55LY5RhHEufXwDMqe5Pwa
 vN9dt4xFcMwj6fCLqC4L/ZN5/lpCt2t9gl+60Qm/gi1LfRz/2JND3ZJYFpTn+9SSt+L6
 GBJ7dUukYk95y8FAwObacqBF2MwKLiFQqLGbRryKh4xYWHo9K0S5jYYFuXHzimroGndh
 uAQQ==
X-Gm-Message-State: AOAM533GZ7Ct83TY6DGol9Wtu8znrIKvV0yjpzfwpOoJ9u5OmLPuuPoc
 A5Jo27Xf/NpYshC66l8fNcsiDA==
X-Google-Smtp-Source: ABdhPJyMumt9kryjCFTpkN/1j8CGWGiDda4A536qjHwknU+UXDek1rxMEplEpBEunX68AEM7izIZWA==
X-Received: by 2002:a05:6a00:b41:: with SMTP id
 p1mr10159664pfo.59.1644541620956; 
 Thu, 10 Feb 2022 17:07:00 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id b85sm3957437pfb.136.2022.02.10.17.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:07:00 -0800 (PST)
Message-ID: <d7bbe85e-5439-3bcf-ded6-7c488a5c148b@linaro.org>
Date: Fri, 11 Feb 2022 12:06:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/12] Hexagon (target/hexagon) fix bug in
 conv_df2uw_chop
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-11-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-11-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 13:15, Taylor Simpson wrote:
> Fix typo that checked for 32 bit nan instead of 64 bit
> 
> Test case added in tests/tcg/hexagon/usr.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/op_helper.c | 2 +-
>   tests/tcg/hexagon/usr.c    | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


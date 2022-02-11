Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D754B1AF2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:09:15 +0100 (CET)
Received: from localhost ([::1]:35718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKQz-0003wI-8Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:09:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKOE-000297-6R
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:06:22 -0500
Received: from [2607:f8b0:4864:20::1033] (port=41718
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKOC-0001Ei-Fh
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:06:21 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso7359220pjg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rJ5IYCT0QxUkd+PKTVTUhcPGYTgg4XsPNgoCYpUL9xs=;
 b=gwRf4szquIr6PLKoedHqIOhrOxghxfqfCdOFFfRtnKdnGRRehZnw6beGWCqzNuit11
 tS/wYjwwVh4SLDeIb/ICYk2YSk4uIUHMwB7BszoFP57inwXHeMuUMZ/5C04DgSDFbM63
 hpjr6dliREzYO2MxcuanBjAB2e32hDRw4Yfo7L7j0dWDJCIlmNKlGr3bAqYNqjQ8ZSdO
 sEiM4goEDysY2c3D7s+DMLkAh15cuEmAlf78kKZ2rs6pQ95eJXX7iEgTGX3vOi+DQlEx
 d1lH0A/YVHcQQpoR0YopGHAWugeb1jNNRwc2CaH0Z9/mKmgu3tigFYs/KnCaAEvCHf79
 9bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rJ5IYCT0QxUkd+PKTVTUhcPGYTgg4XsPNgoCYpUL9xs=;
 b=i2YV9e9/UTsnzSA0J/rfW/M1N7HtVaQrqAkgmk+add767XaBf6dfHVL/8mC+BB0rRh
 4D4Z3LwNjYBS/ZYrmozHXQ0gEnICfYVCKlCjtIGGiXiNB+J1Dl3f6hRTuvOXntTex4Yc
 kM07T9ZtHPtAd4Jm+ZxGrpCA6oESE1vU1kbsGeB8PnhHzDlAaL7RUuRBioR8sKbvg7ku
 MlLAzawImiBoUBSd/uZM2yzC/7IxqQ7uAqj3gR/ae6GpTC8PEfE05puMkZEBoRFyTFp7
 0j74NnEVMEkbKvmEOfxhhwagncjs5ED7MWWvzyjGY2CZ2FKarNLsl71BdNtQGUWnc6Zw
 6Qbw==
X-Gm-Message-State: AOAM532iqbN5JFfFMSEj+0eayTkWb1/bE6FcXpP0TeJx+F7nzihkbbVh
 w4r7e5YAiKCmUCKOkctifKoLc8BsQZ9EJmHG
X-Google-Smtp-Source: ABdhPJyauDgiZ40SMU7GJIDtUU02vtHT3EqCc7eyBo1M97Rg5e5LqL9w/HKR9u68eYZygUZZr5jpKg==
X-Received: by 2002:a17:902:e949:: with SMTP id
 b9mr9943324pll.92.1644541579066; 
 Thu, 10 Feb 2022 17:06:19 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id d12sm17432924pgk.29.2022.02.10.17.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:06:18 -0800 (PST)
Message-ID: <5421d68d-386a-fc1e-6bc2-fcd7484c605e@linaro.org>
Date: Fri, 11 Feb 2022 12:06:12 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 08/12] Hexagon (tests/tcg/hexagon) update overflow test
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-9-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-9-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
> Add a test that sets USR multiple times in a packet
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/overflow.c | 61 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 60 insertions(+), 1 deletion(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~


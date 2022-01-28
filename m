Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6308449F1AD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:12:51 +0100 (CET)
Received: from localhost ([::1]:44388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHgv-0006h1-T1
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:12:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHe8-0004ty-81
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:09:56 -0500
Received: from [2607:f8b0:4864:20::633] (port=41583
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHe6-0006Hs-Cv
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:09:55 -0500
Received: by mail-pl1-x633.google.com with SMTP id z5so4616107plg.8
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tdI7ViT51aX3rcnvbe1NlwhwZbYwlbpAsIbT2Jmsu+g=;
 b=bul8Ma0zwKyn9xN9ZDwMvm3TnjgMAc9wkqSChf2WPqhasck4QC0f+QESU3Ag2bYJlb
 52dP37wXuCeTGKeDuZBBAFkT5xepufg989qEICFEMKFqC+iu9IXO66kFbAgcAGWidD0Q
 rFeOvj8q6RK137RtjW0s4NjYjrqMCQrs5bmYbERv+FDLKMzGuTs+vj/cMFLrv/HFOfj2
 C6pci9V1cBxNzBUod16UvasqJPz2Nk+B+aQkZGeuhZIPElMMnoi40R9PRkPaUJPjLRaR
 qMQouiYGzJWtoqIrvaAUOeGQyq66CQ/S20eznhMALQ1UsUrPLsDy83nbYdnuFsJuvlXT
 iT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tdI7ViT51aX3rcnvbe1NlwhwZbYwlbpAsIbT2Jmsu+g=;
 b=2H8+9EezBJpS/smYlAMaOeg2Y/lFe6Tqi9lSUIsEfg1lZiJGSk7IxPEa3wkLNfThuJ
 Y0SihTNxBwmhCxEXq8gdS+qmDPE2Xb1eYrs+eTArKi3+Itcz8UnQF94ZJZtM1JvoEX5A
 wnW6HYuNqJCRyxdcc0HcDQgQwfcPsdJpVts26MDCxfChe+6w33l1yRHW8BdCuIBboBWY
 O5PpYbpdZhXeqR4adJX08SDj04gxjcDppgPgua8SC7dP6OXfxanWwtD4NDfBbp6yHlhZ
 feRS0jABReLEzAknhGvNDNCzmoCHD0hdJGLG5CrnXOA7s2zu1ntxC1xYp67oGrOxm3ya
 CGVw==
X-Gm-Message-State: AOAM532XgpSdh+P0I5vO7KOMmF/7wkIlVH4hVOoR9gsmDus9xyy+8dAH
 IEyb3TzMO1iBLxMN39k1dNPTsw==
X-Google-Smtp-Source: ABdhPJzImvaAr8Pm/BEZJBHnpKrBevcMobTrBkx+CvLcQYGnfiHBdeaQguDZp+e89rZVM1kDfwDvgg==
X-Received: by 2002:a17:90a:d24e:: with SMTP id
 o14mr7439755pjw.99.1643339392854; 
 Thu, 27 Jan 2022 19:09:52 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id p22sm6685410pfw.139.2022.01.27.19.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:09:52 -0800 (PST)
Message-ID: <d49c445e-1a3b-64b5-0b74-d4e394cff68c@linaro.org>
Date: Fri, 28 Jan 2022 14:09:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/14] target/arm: Log CPU index in 'Taking exception' log
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> In an SMP system it can be unclear which CPU is taking an exception;
> add the CPU index (which is the same value used in the TCG 'Trace
> %d:' logging) to the "Taking exception" log line to clarify it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   target/arm/helper.c    | 9 ++++++---
>   target/arm/m_helper.c  | 2 +-
>   3 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DEA412925
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:59:50 +0200 (CEST)
Received: from localhost ([::1]:39562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSGL-0002t5-Qb
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSF7-0001YG-5M
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:58:33 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSF5-00028W-JN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:58:32 -0400
Received: by mail-pl1-x632.google.com with SMTP id bb10so12082674plb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 15:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YnGd/zYzqiRBLEI0HVRRCHawLcLPl/m1AN6dskdkMeE=;
 b=xH2LNiZIyLvVhk8r3CtAKqB3y7qvOdfiZ/lt87qsMrtSKQRO4pvj0xr/JD6/Vsk53V
 95Di+Vrq1mB0d9FuApXCimX/pCXgKd58yFpnty6ke+oUpW2DRZm0nQvGMbq78KeznCWk
 rTKFmJTeIfhimL5+8wdMLwgEjWHrXJk53wZBlk/P8qnzLdDnfLP2vCvSFwr3w688dAMr
 rMG5cPTNVrfUurEty1XS9xvmLiAisbMvOEhd1X8h958yKcPvgf67OLOa01xrFO6DFGod
 Ze+ghHwlEnFePRnGw/8Tf9rFG5O/1a7d+tLndArVH8BWnR0ugmaEIj2AWdkjUzl5Q+fw
 wpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YnGd/zYzqiRBLEI0HVRRCHawLcLPl/m1AN6dskdkMeE=;
 b=ZxfqzO8gpfBvekCmt37/3H8b6d/8ijQVROF/ZV2g4FIX7AZkliHNjDmHMSr3l0SzDc
 WjxeuItVJVJSl59UIJyUl8Jvj096g+reL5UUq2q3cVnjOI/xH4Y0UPJ3kRmpp9Caub0E
 DsO6RntBlhIfO2UliJQur/P9LEkv4DLTC16Z6B7gT5EoWS1wKCE7uyrWJdCVEJElB5gB
 qJU8ZQUbPIwEzXzowiYX9ELpjTDKdfqW6hbq6asur80Nj2NMxm0U4QYNxQDzx3ry0dCE
 x08j2oVE9W8DCM49YfugyJ/v459IyRgIWbumyZmDEWBfFgccOYyEQf1wLBwEYtwPKCgB
 JSoQ==
X-Gm-Message-State: AOAM533Ghx/u01LMG9axFz94+ijYYbCUKb8pBNAOiY3coteaI9k9UxlA
 5G+jLrOkdlSm7wc8yFx0jGMjzg==
X-Google-Smtp-Source: ABdhPJyDArQ+jAkfrmET7TFQLw7MZETJI4Fh9LBY2Nt94o1qOLGTpejZ96zOu2PA1WBJwsDOxzwFEw==
X-Received: by 2002:a17:902:780f:b0:13a:3919:e365 with SMTP id
 p15-20020a170902780f00b0013a3919e365mr24780808pll.63.1632178710069; 
 Mon, 20 Sep 2021 15:58:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j6sm14741608pfn.107.2021.09.20.15.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 15:58:29 -0700 (PDT)
Subject: Re: [PATCH v3 06/30] Hexagon HVX (target/hexagon) import macro
 definitions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-7-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26a57eec-bd45-9b32-9038-b803dc069ce3@linaro.org>
Date: Mon, 20 Sep 2021 15:58:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-7-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Imported from the Hexagon architecture library
>      imported/allext_macros.def       Top level macro include for all extensions
>      imported/macros.def              Scalar core macros (some HVX here)
>      imported/mmvec/macros.def        HVX macro definitions
> The macro definition files specify instruction attributes that are applied
> to each instruction that reverences the macro.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/imported/allext_macros.def |  25 +
>   target/hexagon/imported/macros.def        |  88 ++++
>   target/hexagon/imported/mmvec/macros.def  | 842 ++++++++++++++++++++++++++++++
>   3 files changed, 955 insertions(+)
>   create mode 100644 target/hexagon/imported/allext_macros.def
>   create mode 100755 target/hexagon/imported/mmvec/macros.def

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~


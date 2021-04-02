Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C964352E39
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:26:24 +0200 (CEST)
Received: from localhost ([::1]:53064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNYt-0007LV-EG
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNXl-0006vL-PB
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:25:13 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNXj-0001Nb-UW
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:25:13 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so2842007pjg.5
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Cniz1bbSR2+9EDRYn0JV6PjrVq8tsQzR0waJDLVYOs=;
 b=wFBj3AF1DfQbz/ErC1qYZ9dFtcH3k1Tj02vqaD1Sn7riWR0o/Scn2mu/3FHoqHturq
 /smDplGKA7Yl5CW6TWyzLh6lt3JTEBLQ01Tm+Bhz67lhkxf1XKHJZJUGeoVXapWY7BF7
 CTWdAB+JfmjtZxdRXoExevSZPEDyP9MRmeq01HhSAv/Twdm68UQquj9fgP2ZamhKGHGo
 W/a91f65SFSJng4LA3R++ATm7QufIFWB0hCSL/EaGmaMZ4diMZaEPHJeK8gdR3X0Ae40
 iV8i8gUqBJTSBHAUx5U5kwVEV3bsGSGOjPOHq2wSc1vnx9IIczxYFyLftC0w8qYGk4Kx
 4Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Cniz1bbSR2+9EDRYn0JV6PjrVq8tsQzR0waJDLVYOs=;
 b=Wpm/qjlR7gpb0aGK/RypQWViy8Kes0T11G6ntfoVcCjLQq6MRpg+GGaz5CU1IgmDew
 XdredTrDPasBLro6El5YhYqsaCpVETf6Oa4e3IVL4iRY7SsWjGSV73DzZmljr6Olv7vM
 dDrtgAyBAJen9AHaKi+aCCK02noi43HG9oe5CdHGNZpxosCqmgHN429Tj14bBVwc5C4W
 ytVXnSHDh3OSdVr+qMNkxVL95FMCStMmKxF0CvnGDy+iCXpe2GIu052UeOr01Wpabfsp
 LjmgrANU1XEmi5o7kqxn/cQLarF5fS8F1LKldjUpKieNieEyOWA/jxDAIu+Oe+QL4Bk0
 HPPw==
X-Gm-Message-State: AOAM531zC9l8sZRYUJviTFGl4JgEreZ2GoEQh9WZdt/io11txrFDwIv5
 6rZF4/Eeuv1ZeXcYm22ZBGd19Q==
X-Google-Smtp-Source: ABdhPJzN1Pee8+gZmcJlEOUEvCzrSKTDoY21wuuu/XcKyR3w6RPpzLpyr3KjKZy4T0eunw4HZXGO4w==
X-Received: by 2002:a17:902:9a98:b029:e6:faf5:7bc2 with SMTP id
 w24-20020a1709029a98b02900e6faf57bc2mr14007674plp.61.1617384310120; 
 Fri, 02 Apr 2021 10:25:10 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id z25sm8481868pfn.37.2021.04.02.10.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:25:09 -0700 (PDT)
Subject: Re: [PATCH v2 01/21] Hexagon (target/hexagon) TCG generation cleanup
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-2-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e6b8a124-96a6-4d1c-5da0-03c90a41efa1@linaro.org>
Date: Fri, 2 Apr 2021 10:25:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> Simplify TCG generation of hex_reg_written
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


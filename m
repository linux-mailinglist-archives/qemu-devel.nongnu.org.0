Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985E41FC39
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:21:18 +0200 (CEST)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWex3-0006Ph-9o
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWeli-0000qZ-SD
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:09:34 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:37575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWelh-0002WR-1V
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:09:34 -0400
Received: by mail-qk1-x72f.google.com with SMTP id 73so11925792qki.4
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 06:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2mayXJMc3LECbnn77ZOuqn/UnCP2jS0miogKPBNewhU=;
 b=FXPjFlFetXdlOB9SRzYQB9Z0wqhgshnwi1wfUfmhK3VYtcLWRAq6Nl7Oov9FrtS4yd
 F7TKJd6YpsMK6to0MVKkmn4Zg0cy4dxPhiVQoMYeTZdlcZCqGE8lz705Ncp9OYThdNVg
 aPnjRU6lZ6rf9p0xtQdUmAc589b3onH9qC3emdec/1cis9zieaqo+sbU8j5lU1IeYbG3
 8qWdCc1lbKRxXPpMSMQerDiVrgIayaRAkAnl9MO0+mz6T0UYK/z1VrkkMj9/L7mRxxXv
 hd4tk+GALmxbcg3PdhVYQFM6/nEiUfQK2yQm5BaUk4Y1sC4Q+5NMoNYV4E1o57cEUtiE
 j+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2mayXJMc3LECbnn77ZOuqn/UnCP2jS0miogKPBNewhU=;
 b=prQwT9XmkH1GCtPrE3jzxQ0r0+dTGG4NzpdWWnFjf4Xk+0pXm8dVy8JWelZLFAPWMI
 hQXKlhjqsPJipzw85aznB4/Ph1yJvl4KNB3F21ea/gw8C+HBqqK7zF9sTWNxpDbouV77
 1NCzDds+LQ0CXGIpRtzvkzVapmRtldh4s8EU9sj/oOAjiwLWV0FTdyoeX+MWgF3MwZ/e
 63hMkvdDpGBEllBlodXLJjUxSy137EFPPO+jLu4jBCuozuGMXlMGhT/IyjCKktWcUzsg
 GkSvxM4K3R5CybXZGQpdtIvLWpHdeJAI9DX6YATEHwgkjgvi8mqPXFsgMld8zjRZZg8n
 Jm9Q==
X-Gm-Message-State: AOAM530Ehi5rJSCu/Rq4JbcxLHPHd5TdkFquNd7iFsHKWvF2xnWy5P3K
 awFf6ZFCHRtq1J5uyj6C8YSC2A==
X-Google-Smtp-Source: ABdhPJw1F+jGyTSH+0r4HITmGQU0zSAuvopE2vpYpV59LwOOf3Fg+mksvmcjdTvb5+qEZhydH5+LjQ==
X-Received: by 2002:ae9:e810:: with SMTP id a16mr2240173qkg.347.1633180171782; 
 Sat, 02 Oct 2021 06:09:31 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id w1sm5161501qtv.71.2021.10.02.06.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 06:09:31 -0700 (PDT)
Subject: Re: hexagon container update
To: Brian Cain <bcain@quicinc.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <107df921-3339-7b73-15f3-daba2d61882e@linaro.org>
 <SN6PR02MB420572E9084C240BE8E698CAB8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b12a928e-eb0b-630f-5952-3012a731520d@linaro.org>
Date: Sat, 2 Oct 2021 09:09:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB420572E9084C240BE8E698CAB8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.413,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 1:59 PM, Brian Cain wrote:
> If there's any trust concerns we can verify the download in the dockerfile using the hash file for the tarball and/or the gpg signature.

That's true, I should have thought of that.


r~


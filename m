Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5E4B1AEF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:08:01 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKPo-0001bU-A6
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKNA-0000Pp-Ez
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:05:16 -0500
Received: from [2607:f8b0:4864:20::42f] (port=45747
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKN8-000136-Ia
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:05:16 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 9so10505054pfx.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/BNR2zBnBKpHPdXzD/Ca+IEOG3i7fFmbqOohl4uM1WY=;
 b=nJnCqbhYH6JY1WNkwbA9vrbpZJIBfYu+sSA2atI6P75MQq64GwSt8L8OYJJaEu9flR
 9IbFRJzatWCa7F1wkl+y7BSLg0Dzi8A+O6FffZJfDRAVTtllGjqGF3oZJrjj2z8CReF5
 BriH+qQ5Wli0tX3JgVIYuiI1FNM3QlL4/9OqgSWkzlIWdPn7NaKRzc3so6nYpt4w67hU
 6y5TVmjiBfrKnMH/gzhM4K9iIFHMAMkseFWcwc6+zAjaLH5yT4tx1jBVAdfh1b1AJUQc
 Ch2njupQ+Oqp/O1FZdrWJa6rfCh4tkdaggXaroGW+XHQAfyNIGgXARmj3VSnXWW2SdkK
 yEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/BNR2zBnBKpHPdXzD/Ca+IEOG3i7fFmbqOohl4uM1WY=;
 b=ZBpH/UBORpn23JUrf7lq9WZbpqi9vGb33o4TCkhRcQ+M/qa6zxL8GUhsX3lx9wefMt
 fTzXLyZOI2lV1tbnfVm3CoIqEXWqN5kZjqhlR/Do0EGw8M/lQm30m7/ZeAr0+MF2e1Qo
 lvu+yaJghtyCObhXZFTLLoefvjvw95C4sTY06eMTAbUms3iX/MD9HTBwhMLA83EJf+ZZ
 5tHx17aUfLeS2D+P+A0HbZwFyg8JjZ1dmfSHhBkb8shSxEeSpuD1337/FZ1DStGcOoUW
 iAiyAQ311CPwLf5QjMKpRI5wdCmgBIpS4cH4mLfkzm7EfIP2ubvKW/MRhGhQBnNzp5dh
 wAzQ==
X-Gm-Message-State: AOAM5328kt5Zue2ry97ZCgNzP7PhB2I6lqLF0g7HXZykekA/4R6nJwDp
 V9WBj7jgVYEUU9kK03kAhX8Abvv4C0Tq6i6j
X-Google-Smtp-Source: ABdhPJxDwQEk519ouJRjZabIiBrR7v59ZjpY8Lt8Z/XUhH+mhUiHvuyvrIFCr6VWo/9LZk/NRuYnrw==
X-Received: by 2002:a63:2c92:: with SMTP id s140mr8354301pgs.448.1644541513207; 
 Thu, 10 Feb 2022 17:05:13 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id e30sm17573335pge.34.2022.02.10.17.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:05:12 -0800 (PST)
Message-ID: <67f6a81f-5fb4-ec49-4b92-e26abd41f312@linaro.org>
Date: Fri, 11 Feb 2022 12:05:07 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 07/12] Hexagon (tests/tcg/hexagon) add floating point
 instructions to usr.c
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-8-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-8-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
> Tests to confirm floating point instructions are properly
> setting exception bits in USR
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/usr.c | 339 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 339 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~


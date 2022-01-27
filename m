Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DCB49DA54
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 06:46:48 +0100 (CET)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCxcN-0003Hs-Gd
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 00:46:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCxZn-0002U7-8w
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 00:44:08 -0500
Received: from [2607:f8b0:4864:20::1030] (port=38788
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCxZl-0006nt-3Z
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 00:44:06 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so6477016pjj.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 21:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZJqQyGW7VaL0RPlFKR9d36xQmwBFlpjyplLFrQ1kvR4=;
 b=ub0tAe4CftMDLcBGahZw9zEMgKGvoyebcAyAPLH99m5/+ffGzssqgJ1KxOyF+2BrTS
 pyCWh0uWDYzyz4zwI2hxSoznEyMRPjAm511vJ9WG5Kv3ntKVvym+Kg5h/dS27RrKWm+b
 o5taO33SoZNXgA1o40kpDJoYO8X7atH1UBOGj1GJXjAR5c+fwCi9LbxmNjqHtJkIDAzp
 8ntNoZXmmW03cD4R6OjGv4PQzT4M2Eutl11Tz4m5P4yw7SPLXyzksFfg/8yZkjTKSWr4
 9jhanNguxm0/xf2IkmEdqMY/9RUH+BnoQLUWx1oAgXoRY2exG8hOnOqGGwyNUGd+F9vF
 eSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZJqQyGW7VaL0RPlFKR9d36xQmwBFlpjyplLFrQ1kvR4=;
 b=zMBlcAOuSclYcDbgqXnIcgKs+Xl4wMkNHA9vORnC+0uiPh8GVSOz12VtUS7KJq9hW/
 fFaPUNe/S8cafK8oyAZ9I/8DwGyMaFq0cjHkXAunkMjLhmVxrGMapAVBRFF1WpO4qGJk
 FHfb4P3v3Q3KrvAJXQaq/NxVgUiMviARkmnbDv55h8QpOpzpbXLPmDl5OaVUgEYAC22r
 yZB4F4xejjki5PmCKg2MmliihzwkEXVsww+jR2nMlx0oh/dzj84/4oGMJia21WCjo+Li
 8O8MbZkhcANH7+DYaXVE1YdYd0lI8uCSFvrqJSZKS6cnZecTetwgLvHFGO1jXqmP8GjF
 CO0Q==
X-Gm-Message-State: AOAM532az6WpLI0Dan6lJXBKUE4irViyzlLZabTuaveA2Jl15Fe20kEH
 2vq7icDd4hJ5G4ku6KIZam5UuA==
X-Google-Smtp-Source: ABdhPJyx8qO03YWRvi0SFFoIQdL7J4fvI4WxiCNC0f3jv4q8mJStQxJQ0U/THp6l+rMCD0VW8UK4OQ==
X-Received: by 2002:a17:90b:1b52:: with SMTP id
 nv18mr2634086pjb.20.1643262243505; 
 Wed, 26 Jan 2022 21:44:03 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id a186sm18181865pgc.70.2022.01.26.21.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 21:44:02 -0800 (PST)
Message-ID: <9b252093-bc8a-34cb-b4c0-c490555031c9@linaro.org>
Date: Thu, 27 Jan 2022 16:43:56 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/40] bsd-user: Complete FreeBSD siginfo
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Fill in the missing FreeBSD siginfo fields, and add some comments.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_siginfo.h | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~




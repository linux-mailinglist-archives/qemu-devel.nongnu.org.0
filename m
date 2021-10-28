Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728243E760
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:32:46 +0200 (CEST)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg9Ga-00009c-He
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9Bv-00053Z-8u
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:27:51 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg9Bq-0001f2-FI
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:27:49 -0400
Received: by mail-pl1-x62e.google.com with SMTP id i5so4932734pla.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zaxOI3+H40eAC7dnjgsV7KO/Wb8rgkRdkeL+42IcGRY=;
 b=EMyIqWzNABwEMl/R2MXJD6lDPiMfZZh9oLVTDO7WHDBfkhWSQiRZksLx4NtEUQ3eQQ
 l8OPErjeqJ2pfO1iohzJfBlUXlareyd10Xy6NrLI+bq111qn07u6JJHvzTXhgGV5zinW
 C8/Gvx21Hr+iKQe6a0z6pF0K+zqt9KV/vBw4cdWkYmB+U7va5gLL4gktEDuiM+vS5m0V
 HoP9kR09eJcuiL6SpGXp3qg79aRzBXi7vAjpAoCWKHopWGFC+ehLSxjn8Jn6aDtn7gNf
 uHi55d99ys8Ub895tzCBUQODNSLuDW+JPQkl3onS9iOMFkDoG/336wh9RUtK0GLwOW93
 vj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zaxOI3+H40eAC7dnjgsV7KO/Wb8rgkRdkeL+42IcGRY=;
 b=JXCzBrlHP4PeOeMqo9SzSsFeHVpCf+Gm1rC0igQcLYt77wXjXDYd2PDTDQ958MDuXc
 1Z3vSfVT0liMClUsSO6qozSy6oQderH5XkGnmNNCluKAx8eKcLENAbcFKHsqJ3r9/WRp
 XjdN1eKe3GQYVPDziDoITkKWSgerQw8sTWyzJS5XoFJ5bkC027xAdWJMucWDU8gSw13Y
 UHNa6eobP7fe/BHHQj6aSm1kCh+Tk8E2ue1sqxsZ0zEfGoEzmA5W0iSSzHiAXxQZpz+J
 5TUiPBGUQZEF4xXzkeWuZO5Ld2OFejz7NaarYYPjQv0jWi4c/aZ6x1Du/d0um22BfnLx
 pNeA==
X-Gm-Message-State: AOAM5329BQVgqnIxU8VbuKEBHOia89mSB9A8n2NkgN3xq0xwn21oyX5B
 zP25I6+ftQdHy4LDQKZ9iBXsDQ==
X-Google-Smtp-Source: ABdhPJxUXBn4lHGCVE4ctD3+Q2xW6+H/dd31UohenQaAO+F83USUlaWiAHbw7hcpr5J6/JbOyFOEnQ==
X-Received: by 2002:a17:90a:4801:: with SMTP id
 a1mr14177768pjh.156.1635442057876; 
 Thu, 28 Oct 2021 10:27:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t7sm3887161pfj.217.2021.10.28.10.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:27:37 -0700 (PDT)
Subject: Re: [PATCH 21/24] bsd-user/arm/target_arch_signal.h: arm get_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-22-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <264dc9d1-70ad-34eb-e51e-8473d12f9cfd@linaro.org>
Date: Thu, 28 Oct 2021 10:27:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-22-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Klye Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> Get the machine context from the CPU state.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Klye Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84F44034F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:36:01 +0200 (CEST)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXfU-0006xO-PT
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXK5-0002Qu-57
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:13:53 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXK2-0003v0-2u
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:13:52 -0400
Received: by mail-pg1-x52e.google.com with SMTP id a9so244838pgg.7
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rmb1Kc9RG9ocyioQr7ceC2Gy6+yebGHRJjJcqDx15nQ=;
 b=hnJQEhQx5jluAEwa+iLzfm6buMtdYDHf+SO1RY86RHcB74tpF+wltunJakPVlfe/3R
 jNTgHLUV8vGJxNf/zS0VL3h+LptOXKVmwMKbtw8Fy9cr9os3uyNqnmPqNBC/UZucC3D1
 3JPJASvuOPUXZBObAdquiT57JUD8LgWYamJ3EKYyVhepMeKq9nvgnDjNMNZ40uWYQeFx
 zzgjb3UrqbU7vwNASH5xftoRVnrifzwQSahS/iAEWGnlUnODGB1vc5tXjuh9+BL/h1Nr
 6KzwgZHuzWVqkdG0G4mQZVuHFUl9hMbW3sSP56zrKXaiIy7IPKKqV3lB/1+pgJ/Txtb4
 Svbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rmb1Kc9RG9ocyioQr7ceC2Gy6+yebGHRJjJcqDx15nQ=;
 b=LFXxb7/Tv8+Sd+Y7b9N28DLo1ewnEpCjNnp5vtYPrGD6z+EpQpOUep1XIB9IBCPaFt
 6HQZLK9WLo2ETxU/yHrbpztHZeMhBXL0pXfBo59hQ4typNnkfOUCmHnr/Ns8MJlp8e+e
 q94gQxZkPY9KR9dYBvwnRJ79yb04oTvuq5wj6I4GMfaJZflmaEpeswXVAJg7xI0gVPIg
 tqdtC974lhi//7z5/pyBod7v4/zIs3Hbcmc3UFs4sDGI0OZJpng6fLNNI3vhFB0+1yta
 JdYCZWnU/fOBjH4KvaCRU0QU3TMNd93kqRmhE28Yn8yy0ytjZiUXgMB/EMI8cCbU+XOc
 ANjA==
X-Gm-Message-State: AOAM533af2GtZgWtjNT5/NYO8zo0+UQhWCuYbSBQAZm8F5HikC/HMFAx
 k8RAjy8h2J4/QSGZHoIiSbJmtSR99xLsjA==
X-Google-Smtp-Source: ABdhPJzKGeSqXBaw4kBCzSr7qaZT6VvMnJq6bS6+eBhiG7jTYNN1hnRD61ws8IBtMGNKrSFAjc9Wbg==
X-Received: by 2002:a63:934b:: with SMTP id w11mr9695647pgm.481.1635534828165; 
 Fri, 29 Oct 2021 12:13:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f22sm6207274pgk.21.2021.10.29.12.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:13:47 -0700 (PDT)
Subject: Re: [PATCH v4 29/30] Hexagon HVX (tests/tcg/hexagon) scatter_gather
 test
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-30-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e99e658-4c7d-27b6-7a2b-6655e658ef9f@linaro.org>
Date: Fri, 29 Oct 2021 12:13:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-30-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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

On 10/12/21 3:11 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/scatter_gather.c | 1011 ++++++++++++++++++++++++++++++++++++
>   tests/tcg/hexagon/Makefile.target  |    2 +
>   2 files changed, 1013 insertions(+)
>   create mode 100644 tests/tcg/hexagon/scatter_gather.c

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8482352E41
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:28:42 +0200 (CEST)
Received: from localhost ([::1]:57050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNb7-0000h0-11
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNZm-0008HB-2d
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:27:18 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNZk-00033E-Jj
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:27:17 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so4892293pjc.2
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AGm23JN/bSbBrbQCyA+hXNV70FkM7XzpEE2eXC/seec=;
 b=SebkM12y23u0d9PXiJAz17xJEjny9/PNCA4YBEXAM/F8QA5wp7p8mfDrWoejApwPD3
 /Kx0N82ZH40aVEHW9jtuCf+MM+WW/M4NEl9ifiphWjN3We2ygMed0TA5oDQtz2KKTLWr
 O0XitYbSBWxIalQNsaBIGEi/97BMWwTK1pY0ilCJmA0izGxE9599DOlzFjXG29BZtWqz
 /pjb5IBO/67Y78B9Ftw86BEfT9fU+2vYflWwPdIaBMi9Xgnk2RNGzRUKp1YBK75hL6mf
 pu13BdNYxcKotkfI9ObeOmWgeYk7IyU/+BDmNk0zbY+FfWwfRzl9wZR5e4iIJRrYsWrW
 6wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGm23JN/bSbBrbQCyA+hXNV70FkM7XzpEE2eXC/seec=;
 b=NWBYtTsLPW4MZVzH8bKglWrcLwTfj8ryYy2GafQkXl4HwqvGYt/0lcM0jOtTQN6Cuq
 3Kj3OTdBFhfSiQnhQcuBOxBq07n1kyaGzoIEYeFFRd6URfnvLWOtVWXxRQyL8chyo3G3
 2H/obiSq8EGZcDU0OzvNA05FBtZtft27AyVOG96VqappbFwQRGBLxyZh6H5nYzBWgpxQ
 8pJvrGRmGavtYv9UOsLcAWipHDaSg0l2Y+f/zwVkGGKl0yI2BnAl2P8V4P0wif6uqwPZ
 1hQA2jIK0Z4YkXmINJcPWP95SbT8tbUQmSoNz/2hprdwuL+6qxvT3fkRh3e38baCm3+3
 SSwQ==
X-Gm-Message-State: AOAM532ilx0BmXP44V9xozyNxqLwbXPazzwOwXrYdjRNagnzmthNuBUA
 5XcuCzQcuD1gI9hZGlPJGf3I1Ym2cO3ZHQ==
X-Google-Smtp-Source: ABdhPJzgjuuB+wSVKHvdRpR4k/n++sVflyhZ2lnJcm5GaYEsT2pKMT69B6ebIXZp27veNlOn95bO+Q==
X-Received: by 2002:a17:902:6b84:b029:e5:d94f:d317 with SMTP id
 p4-20020a1709026b84b02900e5d94fd317mr13458749plk.22.1617384435260; 
 Fri, 02 Apr 2021 10:27:15 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id 77sm4814772pgf.55.2021.04.02.10.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:27:14 -0700 (PDT)
Subject: Re: [PATCH v2 03/21] Hexagon (target/hexagon) use env_archcpu and
 env_cpu
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-4-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ea9ce6c-4157-826b-8747-7e514fa6e3e7@linaro.org>
Date: Fri, 2 Apr 2021 10:27:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-4-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
> Remove hexagon_env_get_cpu and replace with env_archcpu
> Replace CPU(hexagon_env_get_cpu(env)) with env_cpu(env)
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   linux-user/hexagon/cpu_loop.c | 2 +-
>   target/hexagon/cpu.c          | 4 ++--
>   target/hexagon/cpu.h          | 5 -----
>   target/hexagon/op_helper.c    | 2 +-
>   target/hexagon/translate.c    | 2 +-
>   5 files changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


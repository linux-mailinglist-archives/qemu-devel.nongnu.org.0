Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82B46D9DD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:37:47 +0100 (CET)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0t0-0007xr-Fv
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:37:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv0qT-0005zw-HS
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:35:09 -0500
Received: from [2607:f8b0:4864:20::42d] (port=40905
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv0qR-0001Ol-OG
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:35:09 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z6so3048330pfe.7
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 09:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SjYgR91nxc9fEMtNmywZFdu9Ty91/+0YvnJ9TvYhKcA=;
 b=StDwzc1E/jgdmfK8s2tGd9omQTjtf1Vt7h5gCrfkj8OZrmgApOgZSsfWoagwHr3Vah
 EGfihU0fJDpytiWwyWjIAkonnzI6HnpbX2POxUVFJOqAId+mmQcX1KWRvijI2yqEiHEs
 UyNi5QenKm14tptoAANkAOQIjK/e9fQVRhOdauBsreos9ezVRfmSkD/E/dOXcyBoUTjw
 30CyovPIsJ3KIyKg3st0mhdEYII/LRrAPcp9fW8qmtfUpytW3CGn6wjhzVkw13B9t0uw
 wREYByxT8ruTMK8KTo2qcsbN7ZtDWIoZ9CGbQJ6xMoU2JiWdrbBKHvIwTuuZiynhukZC
 x0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SjYgR91nxc9fEMtNmywZFdu9Ty91/+0YvnJ9TvYhKcA=;
 b=QItO1rgg1zmtALU0pVEqR+J0LphMG0/KbHFOmHuCMzjFGJXX+6mKhOKRRl3dRfum0h
 dhjQua4nuUIYZ3nRGlF7xd1+Hy+BI3epbA2ANF6l/2RdivDQBIkQLrhptdEWy/KcjpDk
 tqx0cS5dCwurOR3DlqakCmgu8ggqBW7T/7Kas9qFSMzuzoGD3555gFRFqhS7yLkeJoFP
 7qXBuPcjYSiIkUTZvAoIuI24yX/DgvIFaphiOJgiWQKm/nUxDSyYsNLLXT1XKwaxYnk2
 EOS4TSRApefiykGmzDKOYcsgZABXn6uRIbfXH4dUNHe9FyoLE4b186Kb/Q1EfLz/8G6d
 Xofg==
X-Gm-Message-State: AOAM5308HPSl+Lx+lP6vW1jzImIDI9MAYf7oS/5vPFGfI6VfkxMc+zfT
 dr1qx71fmHOJPgDKAUBagKXGIg==
X-Google-Smtp-Source: ABdhPJyT1prSe7uui9gtpQXodTs90b51qBzknlTRP/6hAAaEpQGdYbFYLv3kp1KSyjVlbPmWSVG8Qg==
X-Received: by 2002:a63:6945:: with SMTP id e66mr30029195pgc.9.1638984906406; 
 Wed, 08 Dec 2021 09:35:06 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id bt2sm6573475pjb.33.2021.12.08.09.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 09:35:06 -0800 (PST)
Subject: Re: [PATCH 0/3] target/ppc: Minor fixes to exception code
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211208123029.2052625-1-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01eddf9d-aa66-0220-5874-7ecb83ee5bfe@linaro.org>
Date: Wed, 8 Dec 2021 09:35:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208123029.2052625-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/21 4:30 AM, Fabiano Rosas wrote:
> These are just some minor fixes to the exception code that I collected
> over the past few months.
> 
> Fabiano Rosas (3):
>    target/ppc: Fix MPCxxx FPU interrupt address
>    target/ppc: Remove 603e exception model
>    target/ppc: Set 601v exception model id
> 
>   target/ppc/cpu-qom.h     |  2 --
>   target/ppc/cpu_init.c    | 37 +++++--------------------------------
>   target/ppc/excp_helper.c |  1 -
>   3 files changed, 5 insertions(+), 35 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



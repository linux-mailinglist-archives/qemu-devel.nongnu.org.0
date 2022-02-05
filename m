Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242AF4AACFC
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:14:21 +0100 (CET)
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUG4-0008DP-1n
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:14:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUEO-0007Rs-7v
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:12:36 -0500
Received: from [2607:f8b0:4864:20::42d] (port=39738
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUEM-0000ta-BH
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:12:35 -0500
Received: by mail-pf1-x42d.google.com with SMTP id a8so8353234pfa.6
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VovvaNqQ4+C7VB6yOiUHK33WNCPilwbR799t2gNQVwA=;
 b=g0E+v2HI1qItBHRdZrs9e2LY1PX+XesqRDJGiwxTX/yXG8xOUD0VyCrSx7abYw4Ji9
 uTKc0aMNKbWXyyLXkPoAmAF1ruRgNqmkE3jhf32OXnKM9JzJ9fxL2OaWvBvJjPyY+OUd
 KpEr0DdyNA/lsxp6nPXRPIdXl6WqMXpltVUgq2vsco7WAFyqpshe9fTN5GdmfZAVs/Gv
 4C/d+9xRFX8VuA2pWrw6s9imMfFl16iF+X4xez7jJXZwIFJcyTv0u89hsk29JsLQNpQj
 +MDmLKP0JPr9eHdBbxHf4OKcWriDI5rX+j8fhy+j5LHHunDNoCA778eGMYMSjcCpzAyy
 yYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VovvaNqQ4+C7VB6yOiUHK33WNCPilwbR799t2gNQVwA=;
 b=KILDnZ4d3qhF6rreAJ3KZfTZynJLWFCJMrXi5NoGmwfayrw7vxOLfTTg7n1FYpLSX8
 y2KNCfD4SQ4OHlwcgmH0oaMRFSTW7LjUU66D8Da67oJM0sMugWxBwl7WwdM6zoezw+w7
 23UkFratZ2v406IrjYnMII2YfU/7Ql5mHm5gCLWdUqGFlrM2oJmfhEJBZPEZAiu50+UA
 aQi9H3ksXjOqenH9UymngF6wFB/BiuUbfUp8SB0GFPwhDAkoVKNDgzHvvsL6C4ZtMFMd
 yMH3zNDXuuS60sDddaP6cV5tyNWqJ0r4BW4xt9JnTZ95cSm9AfaUQUbTDJDileMGmvIi
 mPoQ==
X-Gm-Message-State: AOAM533KM2AtJOiSnvKvB9TFqDOYviQTHjAGeLl9MYDzuvMq+u4AJAok
 Cqw94F2ld80mW6rd9aFYEHqKQg==
X-Google-Smtp-Source: ABdhPJwr78yipGkGnW6SUmiuN5IvuqFfzuLFXjTmdr0qnkbmedMiMVPuehvwopeZDPsJTbVencJusQ==
X-Received: by 2002:a63:82c2:: with SMTP id w185mr4327772pgd.554.1644102752840; 
 Sat, 05 Feb 2022 15:12:32 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id pc4sm6337652pjb.3.2022.02.05.15.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:12:32 -0800 (PST)
Message-ID: <54a07a78-57ef-18d8-b240-d3faa798fb1c@linaro.org>
Date: Sun, 6 Feb 2022 10:12:27 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 03/21] exec: Declare vaddr as a generic target-agnostic
 type
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:17, Philippe Mathieu-Daudé wrote:
> Move vaddr type declaration to the generic "exec/cpu-common.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/exec/cpu-common.h | 12 ++++++++++++
>   include/hw/core/cpu.h     | 13 +------------
>   2 files changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


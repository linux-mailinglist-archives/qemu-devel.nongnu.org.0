Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BF63637C6
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 23:13:05 +0200 (CEST)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEj2-0006sd-J8
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 17:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEhG-0005xG-5Q
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:11:15 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:35521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEhD-0005HZ-VQ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:11:13 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id x27so16026116qvd.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aDWvxr/xm8fUCthWIjA3Tt6b2CtAS09voy/+6THt73A=;
 b=Bc4IIToTHn+3pvpR4i4ZhEe2jvOps2JGkAuhGXZmN1ZWCqYNTyIOFiKeOn3TarmUDV
 rR/Aa0jue6yXRJqbkcixP+wbjKgW4KALn9Ay1Et7dJkwc6HEQz8TgXEGFrZeDy8eYE5Y
 eTmbwETQUS1NWKmrz1brqWXk/0FJUI/ZSLvaLgEt+nQM8vEMwHjLNETlEbMJHF1hSK4g
 xRNC+gwW9KRbCmrOJ0TJR4roUqTjb3j0URlWqilCwsyQ8Jm4DhuAtClGDkWWRUZrosGT
 sVUvkxRmu+j1NeuXrRMFaR6J0GDRzse6L0Xjx9JeXW0a6t7BjWSdqhSL53exVpyBl9bi
 tdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aDWvxr/xm8fUCthWIjA3Tt6b2CtAS09voy/+6THt73A=;
 b=KT03QEYZCmDgAUnY/8jE65zm9dtiTUHpQJmlx9lEPoVFWZgf1czVD91ngul+iiHkYv
 cpvvBeSG8r+O8oxnfFxt7PhsOLmztNNcd5TLiovE4Byh63/eBSOy/f5Zf9ONsOuWfdCG
 S6P3tSP/J8JDLjvI6WxHH8mH+LatsYxUIoo+XM1BGPtvHCA8a58IIMT3DcwXYN3nVE5G
 YfBXiEzb6g01p+fIJNWs55tz2FoVfjbXfnPajVyJf3qc8vFFv5UAVgbfkSUit4n2BsJv
 zVjWsaIwz5HY4k2+u8hY8n3XnMge1MLBzlx8W9yhjwCYYuuHlF0XXO9oBj6VDFNEKm2D
 ehpg==
X-Gm-Message-State: AOAM5301k5k612gT6q/IoI+Z0/8aE64wZywsS8zNPPcvk5XQTx5q8SQT
 +jHE6igL09KxpH1+O1LeXwCA6w==
X-Google-Smtp-Source: ABdhPJwBMb3VjtEA+8T2R8U7mo6TOL7UNoQWLmLO4NSFUkt7cnh9ILcPJXzsq49wSiXAOD4eD3lYSw==
X-Received: by 2002:a0c:dc11:: with SMTP id s17mr18469054qvk.18.1618780271083; 
 Sun, 18 Apr 2021 14:11:11 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id w13sm4400478qts.17.2021.04.18.14.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 14:11:10 -0700 (PDT)
Subject: Re: [PATCH v4 05/12] target/hexagon: make helper functions non-static
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-6-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fbcdb896-2662-7087-00cb-b56e12b4fd3f@linaro.org>
Date: Sun, 18 Apr 2021 14:11:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415163455.3839169-6-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 9:34 AM, Alessandro Di Federico wrote:
> From: Paolo Montesel<babush@rev.ng>
> 
> Make certain helper functions non-static, making them available outside
> genptr.c. These functions are required by code generated by the
> idef-parser.
> 
> Signed-off-by: Alessandro Di Federico<ale@rev.ng>
> Signed-off-by: Paolo Montesel<babush@rev.ng>
> ---
>   target/hexagon/genptr.c | 7 ++++---
>   target/hexagon/genptr.h | 6 ++++++
>   2 files changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


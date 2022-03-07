Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D264E4D060B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:12:33 +0100 (CET)
Received: from localhost ([::1]:35794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHqS-0006dQ-DW
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:12:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRHol-0005oG-24
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:10:47 -0500
Received: from [2607:f8b0:4864:20::632] (port=46699
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRHoj-0004Yp-C3
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:10:46 -0500
Received: by mail-pl1-x632.google.com with SMTP id w4so4239901ply.13
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=U2qoltuXDDFCNaL6GgOnWktMGEDHkEaP5MTzBQ0sR7w=;
 b=n6XLCoh04rEGO5FumDQ7k2I8uHxEPeaZmFIer+l0UOrEse0nXsg2Ws8D+MkezQKLjS
 GAxm1UPlEgvIh5YjnPIOW5xXljNKgLBrBblSq9as5qdehc+fbU61qa1Ipsyve0v01E35
 orwS7Q7aXDTCOAKI9teji27q5n1oYGrWmaT2THrxqHiRUFt8oVZXVIX2cjTFOOT2k6Ia
 RZdiwELqqa047LVY0pNuOvpwBGvl0gsZVp9+tqyNslJtJhb+P1WLOXqewRFkuTqlCD5v
 Wd+zbcvchX4qsPslJVcsH/u4k25izWFKX9KUPUMyTcwip1aJdPD4RcvFzDAksb24YR1R
 KQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U2qoltuXDDFCNaL6GgOnWktMGEDHkEaP5MTzBQ0sR7w=;
 b=no87uLHCk/pvN9VBS0N4PnuuhqWRZszs8AKBoIyqGYnvNokyKNSjTVdRKxtIBwTvkN
 bbzJo7mrA0BvsD9prkJVLwf9Mo8ex799GzS+uhmWAeCZkSf4VhQaAbOKsbQ3Iln2/FRV
 8eeEWEeSWmxdvoFQSVXwLe5S8UGb4PhYgsVEVGB1UNana4d3h6ZOcId6EfBRBCK3ynZI
 YEzwvhWHk39oFuE2ZfyUIRIDVhIbb6QgnXQgpWQv7GDX7FZzdMEVMPTK2AlGbcUNPQ3g
 Rg1T9qhJI+CJWZZUYhFybGWRFzzVi5rDe5cT+cwlkzl7qFLl085I7K7wJq6k7oIqxlOt
 pisw==
X-Gm-Message-State: AOAM533APNHxnpjzZFVT3wvIqBq7QJOrMnfS8oIveAXalz8/P6v9L4xG
 u0QPNf1PRjqkM+BSVin1l2r6MA==
X-Google-Smtp-Source: ABdhPJzqJ8sQBEvjP4dABif5B059wabR1Za2Vc0kz/5Um52ARVb6mCxA39TuRW/Ivz0arILcYKAoVQ==
X-Received: by 2002:a17:903:110d:b0:14f:72a1:7b18 with SMTP id
 n13-20020a170903110d00b0014f72a17b18mr13444457plh.111.1646676643694; 
 Mon, 07 Mar 2022 10:10:43 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056a000cca00b004f6f6dd8287sm5900854pfv.18.2022.03.07.10.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 10:10:43 -0800 (PST)
Message-ID: <4f3eec7b-632c-d2fe-6781-bf00b804449b@linaro.org>
Date: Mon, 7 Mar 2022 08:10:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/7] target/s390x: vxeh2: vector convert short/32b
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307020327.3003-1-dmiller423@gmail.com>
 <20220307020327.3003-2-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307020327.3003-2-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/6/22 16:03, David Miller wrote:
> Signed-off-by: David Miller<dmiller423@gmail.com>
> ---
>   target/s390x/helper.h               |  4 +++
>   target/s390x/tcg/translate_vx.c.inc | 44 ++++++++++++++++++++++++++---
>   target/s390x/tcg/vec_fpu_helper.c   | 31 ++++++++++++++++++++
>   3 files changed, 75 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


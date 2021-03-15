Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9CA33C708
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:46:35 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtAg-0002GJ-8I
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLt90-0001CI-Fk
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:44:50 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:43591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLt8z-0001zC-3H
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:44:50 -0400
Received: by mail-qv1-xf35.google.com with SMTP id cx5so8378920qvb.10
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0JcNiILjYKCcAFCbshQtNiBVGL/Jji+72hgx7R3J8l0=;
 b=HpJyqHFiDgkpXDxzOK80OILvGqbVKG0D5akqOagTdakb7rb9cu0an4tXnWczE2KVa3
 cM2UB5sKPJ0TPNjS2XLm7daJgepwb8xnHiuFftmqEruJpIL2s/NuHlYKdbGl5WqU/MzB
 RLOQgzzjSBZT35Ri1SYitmdfWbGJFhHWcu9TeMqalCNCSgh8C47IE9INoGsj7WSUOWAP
 q4poHUkOFMngJrAtj4CiYYdszsUEb6eMGkt9ufQqqXT7IbRASLovj0Hvm8+DeehAQisc
 pH2/3NYfpdHOsGL3tmaPB7HJdB28CV5qhFPQOTcwI4mulYobpXTu5XtBHriLEA6IVxhe
 Aw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0JcNiILjYKCcAFCbshQtNiBVGL/Jji+72hgx7R3J8l0=;
 b=ZXwptzQfn4ZxFzAq8sABD/mJOfUVyYniG+j83uUOfO/gaPH0XkIt/DI6VLLGD4DGHL
 I4AvB0tkO+LE/Xyjk/ZW9U+nQNUPNJMm3IKXj0aheaeda0tHMDOoACpws6Oc499KXGuS
 xHrA8umB0yeQ1n9fX7AHOZJFmVQJrAkfCe2Ml29AhL6r4PsG3mpnF2J13IoV978H1eTp
 J+/tpJ0CfruHoB7mfxdKy5CJyVc1bPLFUv+xsaSQoGB1nJdh3nmzhY4Y02jYu4T63HQa
 BzbmVmJSCD4e9HXtXoXzQ3m7vfDTbmE/C7aU6sn55/MmQfdrYskGppq3NjNzTYD8eEkM
 HgmA==
X-Gm-Message-State: AOAM530ze4xf5ZyaCILHbfzpnNhRShFUNmYBDliW7aeV7EBc06yyjP9A
 CRtC8Ox1fudV92s5UTrGrHr2RiY7cUfeaq+8
X-Google-Smtp-Source: ABdhPJzhFAecfEGl7D7JcyHMLHp7iSVj9ka+q8zQNhrs+Rc8bbS+Edokh/RAbGBcg0XO5UEeYbir/w==
X-Received: by 2002:a0c:fec8:: with SMTP id z8mr26163322qvs.59.1615837488212; 
 Mon, 15 Mar 2021 12:44:48 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e3sm11710511qtj.28.2021.03.15.12.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 12:44:47 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) change DECODE_MAPPED_REG operand
 name to OPNUM
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1615784049-26215-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a535a80a-96ca-47cb-28ca-1c2349e5e552@linaro.org>
Date: Mon, 15 Mar 2021 13:44:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615784049-26215-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 10:54 PM, Taylor Simpson wrote:
> Address feedback from Richard Henderson <<richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/decode.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Queued.


r~


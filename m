Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47974D0984
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 22:35:00 +0100 (CET)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRL0N-0002XQ-Jp
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 16:34:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRKyw-0001Y4-Dw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 16:33:30 -0500
Received: from [2607:f8b0:4864:20::102c] (port=50965
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRKyu-0002sy-SD
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 16:33:30 -0500
Received: by mail-pj1-x102c.google.com with SMTP id m22so15313522pja.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 13:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Al6Gr/wlxd1TRBcxcdJYt8JSFXfdj+R9+QMqk/b/phc=;
 b=wTL14mqkCeNxItfYCqJmulHZ0h6vqCkIgzaVk4EC04Pe+9fYkUye7QU/l9pNzpqAZE
 s4OBtzcq3wcXTmXXDD76Zu6K9AIreHPz3QqO1kIq2TsumZB5GwvppmWwEvYXIGfrs2pO
 +0EeieLZpa6iXYus2wWVPjyP6qSPlPWFPesuKg7P2hHstG3u7Q1qhOiXrJYVBWADjpx5
 Hi09wP1230QPgaTQCE9zmTt7rAyKnlNvd/Ut5boUiluSjwK7L+ThJy/hB0+uXwP+mGuC
 D9DuvOYfm9fMxJZsxvBEWTWCl+RRi85n25Cd5T5wZuIdlGEdGtsWPVidEQ6UhNQP2bqG
 DTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Al6Gr/wlxd1TRBcxcdJYt8JSFXfdj+R9+QMqk/b/phc=;
 b=B3F2ereP6IHGf3AolXNPYIyt+++nQIJ7hhFQfHjLOxtchbAqzkovCjeqrN8EMwOVIE
 LkiEm88easo8Oujgko7M/3pNvIQZOIxYtTpRgHwu1VAa2QUfTRkafPXZ6ELjji4kAXbU
 rc0oUk/+jDYCWbxJf6IYn1uDN3ddRDcVP4B2Qyzbqd+ZN6KGXKTgfsB+eRZ9DB49IGt5
 J5aJM7z936gvOOAxMYYiF2ZmTG1mtT9EGatViHJpuNDqbftNZmkXlAfjVaAbn+Ym9sYd
 e0yiqirLrRw811uXQBcWKS3QS5BrJAVF6lx83XXz63vQJ2HBFfSPKrgzoZ0Xi+kNvmsZ
 YRfw==
X-Gm-Message-State: AOAM532DIp6IhamFLDB16FUzhARZ3/GKIkOUECM2MWGR1xA7i1gqYUHx
 Ha9k/NXW7yauysusPfpAJy/rIg==
X-Google-Smtp-Source: ABdhPJzbkpQZMYzaroMvXVFLH4i5MCig8pb5yFX8OA1KKbaUYyfb9tpBikbVDnfHroaXaNpuuUtIig==
X-Received: by 2002:a17:903:4a:b0:151:be09:3de9 with SMTP id
 l10-20020a170903004a00b00151be093de9mr14196129pla.138.1646688807439; 
 Mon, 07 Mar 2022 13:33:27 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 2-20020a620502000000b004f6d2975cbesm9740049pff.116.2022.03.07.13.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:33:27 -0800 (PST)
Message-ID: <18ad7e7a-2444-1ff2-cce9-caeaadd40cfa@linaro.org>
Date: Mon, 7 Mar 2022 11:33:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] target/i386: for maximum rounding precision for fildll
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220307184446.3149199-1-alex.bennee@linaro.org>
 <4a6212f0-9491-7260-01e0-e0c0659a1aab@linaro.org> <87h789fprz.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87h789fprz.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org,
 incoming+7b48dc26643084f29a2bbb8c07f757b1@incoming.gitlab.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 10:48, Alex Bennée wrote:
>> Need a similar fix for fildl_ST0, for the case floatx80_precision_s is
>> currently set (int32_t has more than the 23 bits of single-precision).
> 
> It can't hurt to convert with:
> 
>    set_floatx80_rounding_precision(floatx80_precision_x, &env->fp_status);
> 
> in that case as well right?

s/can't hurt/is required/ was my point.

Followup patch looks good:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


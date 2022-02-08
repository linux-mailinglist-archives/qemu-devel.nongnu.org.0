Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081D54AE52D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 00:04:06 +0100 (CET)
Received: from localhost ([::1]:56336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZWn-0001Iq-Tc
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 18:04:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZUk-00082D-9J
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:01:58 -0500
Received: from [2607:f8b0:4864:20::42f] (port=41643
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZUi-0001FD-8x
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:01:57 -0500
Received: by mail-pf1-x42f.google.com with SMTP id i30so1017990pfk.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 15:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=mSZryL6pYTSKdxvPj7zHSwxGVTKnv8q8eGSaTCUlzL0=;
 b=uPZ7ugtL14iLKfxMvBi3wOPqO1m8rHxfYvOY/jC55foQR7JDRCT+AIV3go6JJFgqKz
 O8WJH9lId3oJ2RP9KkTgfGEpRHRiGrHwsjpa5rHUKkYJhUFjY+mo6adUToE8da/IUKlR
 CJrIlFmmyuXl+/etaw3UpAHvBxedBgxQ9qbQlyLYLub4Tm85+nSv6oyenUwIwXKBfoet
 SZAG0sBTDUY92EEMoaVXJkmatUJGLacZZ4OBHLoXV09trIs0wZOX5gS5iziEgj7cq76J
 xQA4DE100Wkgt30g02uIDqHjm5BalE4ajJv4bci5PSHYCjdTLr1l3YpNjTUB2J8yBp25
 BTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mSZryL6pYTSKdxvPj7zHSwxGVTKnv8q8eGSaTCUlzL0=;
 b=SCA0bXJ16bkUoWZeqg6qAB1Y61C3HH4MAKugXRrYiwNbOsh1aTVsgTE2HCZmPSxJ8y
 3QvV/dBrIGeeCrVUyLCEXB0g0Ycq++RgvWBOij3mcChCPhR7ozden9XiCww+N2iwqNXY
 4wPWpDnImzJjPjaJTibAfFOr/A2bMuRZdPbDLlkX0P4vHAeiXbllo6vLqC84Nl4NNA2j
 2WpHRTrMK8IJ74yv0f28mVDv21JY99/oJ0Rc8F3qiUJ7lIs5SBXPpNsWAtiLlVgqg/bB
 kKh3OBh7xQZUB+wLkddG0/iF+4vJBSYnXwzeKuz4fXaezTyIuSMnyn18HGU3RoSfondN
 6KLA==
X-Gm-Message-State: AOAM533OTf+Un6Nh6dQ95mNB85NodBwzzHwr13DH8gmjkvpqLsbq2YEd
 CDwvB7TzSMu+Na0heSNAYGGDvw==
X-Google-Smtp-Source: ABdhPJx1ptb0udV2zyW337k3MJ0pvkqEHe6sK7im+iKjG+yvzsTKDF/1usHIvjxp8FZ8Us/6f7Qt9A==
X-Received: by 2002:a05:6a00:1486:: with SMTP id
 v6mr6554734pfu.73.1644361314799; 
 Tue, 08 Feb 2022 15:01:54 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id a38sm5050479pfx.121.2022.02.08.15.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 15:01:54 -0800 (PST)
Message-ID: <cb9c27ce-ec8e-a568-d373-23f4ba6a491d@linaro.org>
Date: Wed, 9 Feb 2022 10:01:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] include: Move qemu_madvise() and related #defines to
 new qemu/madvise.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
 <20220208200856.3558249-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208200856.3558249-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 07:08, Peter Maydell wrote:
> The function qemu_madvise() and the QEMU_MADV_* constants associated
> with it are used in only 10 files.  Move them out of osdep.h to a new
> qemu/madvise.h header that is included where it is needed.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/madvise.h     | 95 ++++++++++++++++++++++++++++++++++++++
>   include/qemu/osdep.h       | 82 --------------------------------
>   backends/hostmem-file.c    |  1 +
>   backends/hostmem.c         |  1 +
>   hw/virtio/virtio-balloon.c |  1 +
>   migration/postcopy-ram.c   |  1 +
>   migration/qemu-file.c      |  1 +
>   migration/ram.c            |  1 +
>   softmmu/physmem.c          |  1 +
>   tcg/region.c               |  1 +
>   util/osdep.c               |  1 +
>   util/oslib-posix.c         |  1 +
>   12 files changed, 105 insertions(+), 82 deletions(-)
>   create mode 100644 include/qemu/madvise.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


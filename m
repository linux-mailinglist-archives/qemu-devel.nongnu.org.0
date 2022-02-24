Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6204C3606
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:42:26 +0100 (CET)
Received: from localhost ([::1]:33622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNK0P-0007ft-UE
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:42:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJw2-0004kv-PY
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:37:55 -0500
Received: from [2607:f8b0:4864:20::635] (port=33498
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJw0-0004UY-8E
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:37:54 -0500
Received: by mail-pl1-x635.google.com with SMTP id c9so2758971pll.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IhuSkatiC/z4hNSIlEaOlUU5RqAe8lSz/9c5SSCsd7M=;
 b=fLZ7ObrwZpAd5bj5pSL9GhehvZ7f6xlaEHyNBtWlN59mwBrpbRP0C2tqAARMvs/IeG
 DDYHeyCPDBiOI8VnXzdtOZmfZscaNgXac/K1PMqtz7aaxkwLZAZyDiIXVHjxnQiUeaon
 LgGbkozWwTg39dQuFT7NWPD4bPrvj1p5CTHPgT0IxQq2n9xtHl8aUgIlVLP1r+HtAf4W
 cg4r5YGnIdq9KT/mgb+rvqNziPu8jZLVEuEUDq0kpxHw+2sRmoVzsD2OWx0kD8R1Bb1F
 yKdwQ3iZeO7shqdaQXe5kOWpk3j9GfNPgcR7ZdYhdKNrYTRKuRJYRH+N3ei0cxEUjtZH
 H6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IhuSkatiC/z4hNSIlEaOlUU5RqAe8lSz/9c5SSCsd7M=;
 b=PnXbeRNWg7dnzPkbzU+e5PLQVy+7P0QGhsj/IV08PedPt49Y8hfgAfhe8FZH/0fkcg
 keGL63MF7gv8q3pQsFtfBDtbrV5ElrpafdTRAuhBPCUDhvD3kOMGYc9W3ta+H9mOCorv
 L1ggH93LWVvW2jnBawc7fvM4uQrP+yTYz9bHgDklNjMJpMPWm1yGGwXf5q9gvn6yFlj/
 Ks2HJ+7AIGOFA0nfRvpSozlNh0XLNsCBc5eXtywaOQs+SijHpqXqvemiE0mA2mtPzA0V
 ASG/PTxinckfxoHdTTvYSFS5mrurv2xljG8FLY4AiQUYUMNXsg3dfhzYsjRycNN5mO4Q
 MMIA==
X-Gm-Message-State: AOAM533GsX8yZUWIzw1cnP9TFH42RdP/KZsmE6wLlSdQ1dgSrSwBZiSc
 wKAB3gxdA2bivxowIRzqtPrJgQ==
X-Google-Smtp-Source: ABdhPJxTTBso9Xz5LOHLQIu8j48fqPlbgdmhi3jUOGvaM2YH1ssFVCJJKNY0zj5ap7eO/JCaXzfnyw==
X-Received: by 2002:a17:903:2341:b0:150:2371:ee59 with SMTP id
 c1-20020a170903234100b001502371ee59mr1221760plh.57.1645731468782; 
 Thu, 24 Feb 2022 11:37:48 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 n34-20020a056a000d6200b004e1ba1016absm311779pfv.31.2022.02.24.11.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 11:37:48 -0800 (PST)
Message-ID: <98773975-c448-879a-eea6-58a7fe6a1707@linaro.org>
Date: Thu, 24 Feb 2022 09:37:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/12] Replace config-time define HOST_WORDS_BIGENDIAN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-7-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-7-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Replace a config-time define with a compile time condition
> define (compatible with clang and gcc) that must be declared prior to
> its usage. This avoids having a global configure time define, but also
> prevents from bad usage, if the config header wasn't included before.
> 
> This can help to make some code independent from qemu too.
> 
> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>

Looks ok.  I'd like HOST_WORDS_BIGENDIAN to be poisoned, so that we're assured that we've 
caught all uses and new ones don't creep back in.


r~


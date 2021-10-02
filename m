Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6158C41F8C7
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 02:40:54 +0200 (CEST)
Received: from localhost ([::1]:34542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWT5B-0006xY-26
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 20:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWT3B-0006H9-GE
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 20:38:49 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:46831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWT39-0008N4-Rd
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 20:38:49 -0400
Received: by mail-qt1-x82c.google.com with SMTP id e16so451890qte.13
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 17:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xw5L14vhhhK2pDnZUI/7gFpVKOrxS7g+WMG+7mKqJFs=;
 b=l0CB8HO0x15ioBzCeZ1CiZwlRxEGC11cmodyOq13ul0VUEnV+KsYIj5EGfgjQ44SC8
 hsf2ZyTT2nH9JxJdOnAY71vuPHGPmUgsip2hh37kD4bNHQNNy7eacqKShB8JIRWzhXFu
 1p6CTZ0hVy79Frd9aIy2sKwAO6Y0XYqiaTWuHYuwGMbKgJhdAkSGDgAL1wk1rc0U2amp
 tmOp208oJ1zfnWPjNiOmRXO8Bh2zPuBcuEJ+QXCac7AahboyBNWV04D8av2wltJmkzq+
 mHjt5efrhBoZNW90tIjH3Y7Z4OlcHXRDCD7LHZZW9g3wozcsweTnvreI6ls8o8J8cFXS
 SdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xw5L14vhhhK2pDnZUI/7gFpVKOrxS7g+WMG+7mKqJFs=;
 b=K/JcJPQYb8nHr7zaLR92fq4mk9wPBfcaRaW7YSwVk+Kg4B3NqgfjzMiZtM1+ByleYF
 Pg7LMZ7EWRfPFaATCRq6LMJrQNBOmqxHJgOam8DAIzT96YGy4FmsV1MkBF8NyL60SsJX
 /QvtD9QTbUzabVrqn+aiwQ0EeJEegQlljz0xELAcg3tf5J7c/x2j5LrQUXGPPngaJOIp
 7/TZGcJ9egZ6KBqOmRnoTmkxqGF8e6KPkRGO4aLHNwBzrO4LyffkqslPR/ON6jG6L4v4
 P2LO4TOLiEERUztuEUFK/yroMH/CqEl1qvD0fOJD510+WlVt3fOiZkv2PazfaDxueJGQ
 vR4w==
X-Gm-Message-State: AOAM533zqAv7bzwloBrgX6l1ERCEaiL/fXg0YaJQvkD/cyO1EvdwMT7H
 Vs9BEXS+cz8m816gKCuUldCcgvZP1auYDQ==
X-Google-Smtp-Source: ABdhPJxYKJr1b8uyGJsRmLNcWZl+sa4Sa3L4+77v16JGICPTSg0WRMSpz72iTBqoqIwqiSK+JcasWA==
X-Received: by 2002:ac8:11:: with SMTP id a17mr1001665qtg.276.1633135126354;
 Fri, 01 Oct 2021 17:38:46 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id p22sm4646303qtw.68.2021.10.01.17.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 17:38:45 -0700 (PDT)
Subject: Re: [PULL v2 00/33] x86 and misc changes for 2021-09-28
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210930145722.184577-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f10773b7-6c69-413b-2865-da802d9c0953@linaro.org>
Date: Fri, 1 Oct 2021 20:38:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930145722.184577-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/21 10:57 AM, Paolo Bonzini wrote:
> The following changes since commit ba0fa56bc06e563de68d2a2bf3ddb0cfea1be4f9:
> 
>    Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.2-pull-request' into staging (2021-09-29 21:20:49 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git  tags/for-upstream
> 
> for you to fetch changes up to c1de5858bd39b299d3d8baec38b0376bed7f19e8:
> 
>    meson_options.txt: Switch the default value for the vnc option to 'auto' (2021-09-30 15:30:25 +0200)

Applied, thanks


r~


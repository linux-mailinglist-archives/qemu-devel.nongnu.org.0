Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5CF586E25
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:57:18 +0200 (CEST)
Received: from localhost ([::1]:43846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIXn9-0004OT-CX
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIXg6-0006xK-5W
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:50:00 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIXg1-0000CL-Si
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:49:55 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so12057163pjz.1
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9o3mLYuqmHG+fUp8okXO2UQ9LNcfBDUtCBolL4+x0sk=;
 b=xuz1yTAT2zr+W10hPd5pGqG6+OB0wj/1plrTdOFGwbNbDARkFx00/Nz2i1WOF6AKVI
 Y6K89rmyrJxWSPtcwTsjj4EaKE8oLEAlDcfR4YxtXqabD250KQRxGT7bcjQgEkKdtc7t
 PmoKSo/Z/AFzg/20tavONSoiSEPx4QUENJ1JGQqfRqVBBk7Pz0dd2fxn08/k5KRMdpbh
 y1dFO2+X4n3CFpFGKjutfQfeu93Vvx927w9R6cvm5De4x7PEUqhq0t/lFGT8zVDio/9N
 5XUkKqQBNpgNx3euvRfTY2O5tkLQPk0Gg0f1+mSPpzM1fC1PBRkueI81ozKZJjLtfyPY
 /pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9o3mLYuqmHG+fUp8okXO2UQ9LNcfBDUtCBolL4+x0sk=;
 b=kq+JJId6ovk4M4YET7XZRwhGI35jdLAd089M5pf2TfYgTokMQIJkQseeOYZKofGwMp
 55wuWCJxQ4z4I4UkQz/QxU6d3kkhb1PU35bA53uva4yZRGsy9XspRx+OCduvZwFE5Lj5
 JAcEzyXTjnng6axzz4tu2pIT3jWu2jTMNEefP9fd2fINL0a/KbCYia9qR2HKigtQpjUG
 H4OSn4vqzCDzlrkqAUBzKZ18udhwiBfTNPv/bMAn9c8x87fSVythJGAZZvZro9nCr5yS
 gsvOf1v6+6bXnZkCsiELOjx/46xujP384yv/4+UpLDEBSgqizVezmsFUBdQTtAiapYvr
 LKlw==
X-Gm-Message-State: ACgBeo3nskE6r2sw+gZzVcnr4qAzPtiB+vB3e1VdYz1izQWHhyUEZ8sy
 u+Z9syVCPCo1/rS60WyyYpfmLA==
X-Google-Smtp-Source: AA6agR6N+OT4+vs/+9xHgQRqZDxhMh782eUjdEQBhFkAl7FWOkxoFUVW1UGEOf/lvvYbjRLUNP6ueQ==
X-Received: by 2002:a17:903:2ca:b0:16c:d18d:bb51 with SMTP id
 s10-20020a17090302ca00b0016cd18dbb51mr16727702plk.33.1659368992206; 
 Mon, 01 Aug 2022 08:49:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:e82c:8cfb:9ffa:3c7c?
 ([2602:ae:1549:801:e82c:8cfb:9ffa:3c7c])
 by smtp.gmail.com with ESMTPSA id
 l185-20020a6391c2000000b0041bf7924fc4sm2886784pge.13.2022.08.01.08.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 08:49:51 -0700 (PDT)
Message-ID: <5aea7b90-72f6-a53a-639a-1383fa5dd736@linaro.org>
Date: Mon, 1 Aug 2022 08:49:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL for-7.1 0/3] hw/nvme fixes
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
References: <20220801100556.2217492-1-its@irrelevant.dk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220801100556.2217492-1-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/1/22 03:05, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hi,
> 
> The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:
> 
>    Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
> 
> for you to fetch changes up to e2e137f64282a2ee2f359b6df4cd93c83a308e7b:
> 
>    hw/nvme: do not enable ioeventfd by default (2022-08-01 12:01:21 +0200)
> 
> ----------------------------------------------------------------
> hw/nvme fixes
> 
> Some fixes for hw/nvme ioeventfd support.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Klaus Jensen (3):
>    hw/nvme: skip queue processing if notifier is cleared
>    hw/nvme: unregister the event notifier handler on the main loop
>    hw/nvme: do not enable ioeventfd by default
> 
>   hw/nvme/ctrl.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 



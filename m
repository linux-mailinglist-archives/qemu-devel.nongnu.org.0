Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916254A6503
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:27:54 +0100 (CET)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEyoj-0006KA-NA
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:27:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEwvK-0007di-87
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:26:35 -0500
Received: from [2607:f8b0:4864:20::d30] (port=37691
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEwvH-0008TH-PC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:26:33 -0500
Received: by mail-io1-xd30.google.com with SMTP id n17so22126075iod.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=n8FpLMqrQIitedh+MxjKjHD7uxyqCG8TnMZhUL/xEko=;
 b=OJf4lZGmobxCcgOmJ9SVXwn/k1pVGXq5BWSgDqP6voBJxdMwMscFEhsPVWisUxWDgB
 peNWfiCV+sMeGTyadzIGPb2zXEfjXS6c9HT6IFvLd+ppaxhWp5CqZbnF/HYGpnigoP1L
 OFx/Q5vn801aCrchUdOVxtk6O9pM/WEhhhKx4aj0HVuf44bvrnk4GbCEuEkyZBsy9M3a
 eAMKFVaiMS1UXRVTHVcfw0n7lqCGU1xkUXXqemPdXUtyrsDYkh8fEfJU5JjkYvZUoSAh
 UZupc7um2wWCAWsbd+ZEheFjAJIImiqdbFvYNHpuk0YSsL1KyrMPHBo2OEB/KEelJT++
 Mlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n8FpLMqrQIitedh+MxjKjHD7uxyqCG8TnMZhUL/xEko=;
 b=FfmgmmeNj4hu01gTAJ07dxRXYzgkkIfEtdx9lh7JNm1UEyNVCX7dQe1m82Kr40YshA
 4P88Y3Nl2IHTyBJu+xx/i2s/P+z0hLe8idSM7FUd6cMzIp257DWersxZbpy3ffCAjqNx
 yqpSdCzpJxoOjFSxUDsAHHgJt/TmwRFuZQdVgC8n8cMSoBCnjr+Src3mvsrvWAFdOyN8
 iBy5ZSPtL+eFrUPvex/Rt5a0BG7GTZmOfY3SAhSuockj2pbkyYJ/HF1r1T3R3+rQcqMG
 Il4UPR2gG+aNkNnbTH6zotupG0x1QPg5FDl5ZgacuN9JRbAvBENSCgXyeDeYUbd/PPg1
 IHNA==
X-Gm-Message-State: AOAM530qP93vH5tDqsNJ7yJ/VJoAIOse/IpsXuR/sc1uI8qxM4RmFQXA
 vRp/clptC39QFgDp0Kt9Q2UnTg==
X-Google-Smtp-Source: ABdhPJwhygcD1fTWcy0TLkmyvRg0w3xO6QeMyPojvsXYLMP25rnDXD8D4WL1qslbLvPcdoxds0DTgQ==
X-Received: by 2002:a05:6638:268b:: with SMTP id
 o11mr827186jat.117.1643736384536; 
 Tue, 01 Feb 2022 09:26:24 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id f4sm7557782iow.53.2022.02.01.09.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:26:24 -0800 (PST)
Message-ID: <4e43c976-f58f-660e-8b6b-7afa600bc57e@linaro.org>
Date: Wed, 2 Feb 2022 02:57:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/22] bsd-user/x86_64/target_arch_cpu.h: int $80 never
 was a BSD system call on amd64
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-3-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> Although initial versions of NetBSD did use int $80, it was replaced by
> syscall before any releases. OpenBSD and FreeBSD always did syscall.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/x86_64/target_arch_cpu.h | 58 -------------------------------
>   1 file changed, 58 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


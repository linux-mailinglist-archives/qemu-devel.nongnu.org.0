Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4F34A6517
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:39:19 +0100 (CET)
Received: from localhost ([::1]:37078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEyzm-0005RH-4b
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:39:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx7O-0000sz-Ff
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:39:04 -0500
Received: from [2607:f8b0:4864:20::12d] (port=41967
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx7M-0002AN-N3
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:39:01 -0500
Received: by mail-il1-x12d.google.com with SMTP id 15so14904527ilg.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=daxoDmeSq25cKM0RA4IS6GygDW1iQWE4fg6+Rich5/g=;
 b=WupkYzHEI+1ctT6sHbN+zk0SQ1orX7725XJaJUB6RbLhHuULCo+gblCKYHtP1HS1KZ
 AB4nOzcp8njvY810bSjEzc1hsmXKaO33vqNbq5ghyrkp5BzsHqI/5Uy7FqmLS7X1GjUW
 qD7pTEvyM7VyLpt0g6FYWCt3wBIoEbhYml1mjlRd34E/tPKjhB6Qatl3IUGPnYVp8yfQ
 oGL/FLOgPiuh1BomUPsT6b8wJ4A5Mi41i3Q4Ck2Ivois8oe4gX5gNqIkVxReQeMmGo3A
 YoCxRT8h/AxNZ3CVpyhv+XRrVI/hUgWWFGBiLnvnm1uQVickGb5JLTS8wohQv6e3Mp/c
 oocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=daxoDmeSq25cKM0RA4IS6GygDW1iQWE4fg6+Rich5/g=;
 b=Yr3za5PgyBsaBVoVpeu5VD3qYCmSRQYC72iu31u5BkABit/uSs+VEylfacJoQWCeV6
 yjqDiNQ2GCKE2K/vE1uwhAX9aI1AwKZH78ljWddLw/xJIodwy4w4POZ2tNemh2/10Y6n
 k7jCoViMUd67dEcalrrhDz2uh5n8yVF3XQD8D6gNuKQIzmV/YrqUC/QvICrEYcKxkhEQ
 TAyF2Kt4NXvQX69JKGo98wkBQdvK4s0lGaU3+m7HtztRcgXPMu+Ps2F/Q6I301NCRCD+
 87+HINF+qtZukeLdtKZHcj2/LKIL3Kjr9on86ZezBiyswDLokVo/qI6Kc7YGFfbfZaeA
 alWw==
X-Gm-Message-State: AOAM5327pzxEOqOi3x/NkxTwIzzA0HYiE3H0G9lr/MQ1b6Nmq/BjqiPw
 s/evOHQ1WvWLxtUvkoMSnzHYNQ==
X-Google-Smtp-Source: ABdhPJz1sYYDBDxePM4hhbQg2ho3MkRuSdagDN/ve2Act20V0ZkLNnr3ejpoWJIpAjCfFMcWqMOGEw==
X-Received: by 2002:a05:6e02:19c5:: with SMTP id
 r5mr13331729ill.164.1643737128950; 
 Tue, 01 Feb 2022 09:38:48 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id t6sm21030343iov.39.2022.02.01.09.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:38:48 -0800 (PST)
Message-ID: <56406247-40fb-e111-7d5e-bc2e1d0d7c71@linaro.org>
Date: Wed, 2 Feb 2022 04:38:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/22] bsd-user/sycall.c: Now obsolete, remove
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-12-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12d.google.com
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
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall.c | 516 ---------------------------------------------
>   1 file changed, 516 deletions(-)
>   delete mode 100644 bsd-user/syscall.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B924749DA6A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 07:03:48 +0100 (CET)
Received: from localhost ([::1]:54104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCxsp-0000oW-At
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 01:03:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCxmA-0006vx-HW
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 00:56:54 -0500
Received: from [2607:f8b0:4864:20::435] (port=42862
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCxm8-0000I1-SK
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 00:56:54 -0500
Received: by mail-pf1-x435.google.com with SMTP id i65so1701979pfc.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 21:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=p+Ce1239O+PRTB0cFIahIILWNcf7V0XBexpbQuFfdu0=;
 b=OzttorFpCY9nNjbqyRO8mDhZ8HCGWImR8II68XB7PyDD5zJWeXJvSV+u6fuLqqIZL0
 bzY+GNgg4iNdXhm35dvxa6ERu6vUHkwtZnnhzzjvXYfayTl/IgYunYoMHiq4jkloSnRM
 91rNfyctDY6gFYO+2lcQvkirva4o6by5Ck6H/pdq/aBwUD/QDIGWKFjH6GuOPLL0zglr
 9ItmMkhY5e38Dvifa+qXlkEwWD7lXF/CFou+1zo+M5ApbXs+XaLEHj9Kyx2WZP/srk8v
 EWAiAoR9K4xmqDN5cxgcgG2Y2dcD68Nct4yHcGMq+5XiqOIlmAWbbcQW6hFi0fFPl8Fc
 yf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p+Ce1239O+PRTB0cFIahIILWNcf7V0XBexpbQuFfdu0=;
 b=hKOmCvKyAG9OvRly/NeRfG8D93fyVMJ6deL89eIEEO/UHuC9wVMnWC4x/oz2+AwWNy
 JBLpIiX9ftvPpYLQJYBuDDF+lfH8iP9ye8sOIqNgxy3uemND1MN5vDrsKe9aGHndpiAx
 KkOe1bDwEj4BQwlKyeg83CZAYuzRSLjpijFOIDOZx/LAUHE3lmDklucj5O+GOFNrMpAY
 vyEuJoZ2ejZBygGpX3IXl7RybzcIg22FEkiUNz6ltOUpJfVMZEVfBpP0s6SXg7nW9n5P
 lrvl+rh1HrUdumzFZvwcHCguY2i/yHC9DWW/+ViQ464giIy5+Eq6NaYA7PLM12vxgnsM
 uzJg==
X-Gm-Message-State: AOAM530qB9Zegwk4qrKVoEhji4HJRuZtw7QEMUTma6c3RvHsL2xebKY3
 Z92J+V1pWlhS4ZSwWZY1PU7qjQ==
X-Google-Smtp-Source: ABdhPJz++KDX0lF1tpXz0hyzuPw9ryCehsjEIibzA5BQuwg3o9fSBb/TgdOdNATRq76RX78+Z6kqxg==
X-Received: by 2002:a05:6a00:b82:: with SMTP id
 g2mr2055572pfj.33.1643263011438; 
 Wed, 26 Jan 2022 21:56:51 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id f18sm4034504pfc.203.2022.01.26.21.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 21:56:50 -0800 (PST)
Message-ID: <03e3ca07-2aa3-c738-551d-2ac7e2c47483@linaro.org>
Date: Thu, 27 Jan 2022 16:56:45 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 03/40] bsd-user/arm/signal.c: Implement
 setup_sigframe_arch for arm
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-4-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Fix the broken context setting for arm. FreeBSD's get_mcontext does not
> fill in the vfp info. It's filled in in sigframe(). This corresponds to
> the new setup_sigframe_arch which fills in mcontext, then adjusts it to
> point to the vfp context in the sigframe and fills in that context as
> well. Add pointer to where this code is done.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/arm/signal.c               | 50 +++++++++++++++++++----------
>   bsd-user/freebsd/target_os_signal.h |  2 +-
>   2 files changed, 34 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
> index 7491629477a..43700d08f71 100644
> --- a/bsd-user/freebsd/target_os_signal.h
> +++ b/bsd-user/freebsd/target_os_signal.h
> @@ -4,7 +4,7 @@
>   #include "target_os_siginfo.h"
>   #include "target_arch_signal.h"
>   
> -abi_long setup_sigframe_arch(CPUArchState *regs, abi_ulong frame_addr,
> +abi_long setup_sigframe_arch(CPUArchState *env, abi_ulong frame_addr,
>                                struct target_sigframe *frame, int flags);
>   
>   /* Compare to sys/signal.h */

Should be in patch 2.


r~


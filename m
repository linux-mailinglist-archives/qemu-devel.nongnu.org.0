Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7A3411E30
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:28:38 +0200 (CEST)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSN5p-0000AJ-L4
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSN4E-0007Aw-6n
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:26:58 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSN4C-0005eu-N4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:26:57 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g14so16958502pfm.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=barbuVsdPQtsWdIa5ZXKTTx0pjS0eR3ttdFDvcUoy6E=;
 b=YwVV3KN90O771Py6hYVgjK3G9WmAKgq0zwCeOhlAim0E8kukMKaG1ZZdyhY/KWA++6
 krY5VZiSeUUP7ABCNn6g08KxarvKC8WUb5GQsla+rAffHX0/mCn6BVAZJd8dOE1aOYtI
 lxIjFCV1Ssc8mZWk9hrJKRl7SsuVJ6ihStOXUMaNBvt/hEv1y8c0oHurWT9KXjaHDtpi
 bwFWynFQ8ih6v2SP+/CxBevCEcKpfL/SMcj1gDSvekMd9sSs1xOVuVnXYl/iY2NPyy5H
 Lu5ObWy0Qt3WsA8FKgZTK4UfA1X/lC0F89/XtsvpWkLKltLo4Nlie02LdTdLW50kQbnd
 irrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=barbuVsdPQtsWdIa5ZXKTTx0pjS0eR3ttdFDvcUoy6E=;
 b=JeDOY583k4yVHIrqUFqSdepCMW3hLljHKyhXC6BJx5WUOnT+r+Zv5v1dEtf+vR9tZH
 VApmIx5nIjLZ2YmR0WdY20dMR/ZY861n2fpxneHKjHBFVysKbPHMutsLGklPNMw0i/Ih
 WHIiG0sCu8px/aqg2eq4+T5LB9qluJPc9BAcQVQfMzsAW8BV8VV7A3qINjXdmmvX6G25
 cIqSImhGf6UHJaM035nPbftU1JOXXufD4zlzyayvrs5hk0PM55EzG0ABuvL3AY/oUjG4
 BJ2xqB03Vd44LUEFLoDHJimUzZHzHsJb+hRKFqgxbf7/SlDMgu3kJWJ5V6xja/hWIQrY
 9OKw==
X-Gm-Message-State: AOAM533CxLGIjcvLsb3wbuCeigQba005/a7URnytK8iv6Yc/AYP/JHvP
 Zx/p18CFkehAoHvMXe/pQWFLfvAt7lpirA==
X-Google-Smtp-Source: ABdhPJwR6JBDPbIP1HR5C4oSnMT3dym4b53xvoK6Q8CqxOGCYhZSXcK0DF164DPb/CtPpmqYPV0SbQ==
X-Received: by 2002:a63:ce57:: with SMTP id r23mr24555118pgi.271.1632158814982; 
 Mon, 20 Sep 2021 10:26:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 141sm16657173pgf.46.2021.09.20.10.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:26:54 -0700 (PDT)
Subject: Re: [PATCH 29/30] linux-user: Add host dependency for 64-bit LoongArch
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-30-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3321b2c2-9a28-29c8-975a-8e737ea5d34f@linaro.org>
Date: Mon, 20 Sep 2021 10:26:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-30-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Currently nothing special is needed for LoongArch hosts to work, so only
> leave a placeholder there.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   linux-user/host/loongarch64/hostdep.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 linux-user/host/loongarch64/hostdep.h
> 
> diff --git a/linux-user/host/loongarch64/hostdep.h b/linux-user/host/loongarch64/hostdep.h
> new file mode 100644
> index 0000000000..4e55695155
> --- /dev/null
> +++ b/linux-user/host/loongarch64/hostdep.h
> @@ -0,0 +1,11 @@
> +/*
> + * hostdep.h : things which are dependent on the host architecture
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef LOONGARCH64_HOSTDEP_H
> +#define LOONGARCH64_HOSTDEP_H
> +
> +#endif
> 

This is not true.  You'll need to write safe-syscall.inc.S for loongarch.  Currently we 
have a fallback, in linux-user/safe-syscall.h, but this is clearly marked as a bug.  I 
plan to drop this fallback very shortly, as all supported hosts have now filled this in.


r~


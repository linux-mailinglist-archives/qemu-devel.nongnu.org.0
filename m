Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A897632FB4A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:03:24 +0100 (CET)
Received: from localhost ([::1]:48030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIYSh-0006ab-4i
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYRJ-00066T-Rg
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:01:57 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYRI-0001MW-FS
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:01:57 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so1065187wmj.1
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1p57cuaWwhZHPK6NpsHPnVRS+F+VajskriiBP55jFQc=;
 b=NSzavJme8Y1Q0yYuUxFEbxmmqYGFcN9KAgEAXs9FL63fwYTP0fdSc9gk2n/6JGIZTF
 5bS7Pv4e8TzItK+fLA/F1v9uF2ubLSa9kWTnsfKFPvSMiiuHEMLTEAS3OgwAznQ+Ok5C
 BxzgV6Zol239048w2Nc3bEz5yE+lTQ3HLxNvSJM89Xdr8Tui/mQC59wZhzxj50tUTDI0
 n+5QMcGsnMhoMFEmuDHkcNxcmA3QDTqVIzyWuAlJcDqWCbGLkHrFUjYjJlV5IsejTafE
 vStonMpb5yL3Jss/S5spUV94oDKljZm0PFPvPh3tbu5roKIKVn0p93Im3PiQmI05rh69
 kLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1p57cuaWwhZHPK6NpsHPnVRS+F+VajskriiBP55jFQc=;
 b=GRe7IPUKPtxDsM1EC3NFqNdWeehztDt4xTG62XnaTR6RTOfyBwwTLY0xUk9p5MHjva
 QMf9nNi6W7pWwOk7S5GI2bQFIFG5o+VNWD/2UjXcJKm1/74nloYpfHG+M054EGhUsmva
 rhK24Aj9+k99AHwGUDsyGPgug1kyrIUiHYLk4lFrh7M9rQQMtH9zCUVlYqFQCH/ncUdB
 yfJqK9NfLE8WV+X6o5Qi+0Fc4nRcsUYoB4pL6nD5DPl6AcTLzYktpxBpwP8CspsCjqy9
 wiVvykT2+BD10h8kHf171eo+nKWKfRCCQoROs7tzfUvlEj45UWYjSS5lPKJlTbZlkhYO
 czsA==
X-Gm-Message-State: AOAM530KaXocM9faO4Z7dt0ReWIhdWwmb24TAiiYjUAYqxmAcxkkiVgY
 yW4ES+MpJXEl0oZ1dE7VXBM=
X-Google-Smtp-Source: ABdhPJx4xqKIUUylwqxj4ZwFsObXt10hu7ac2yQzbhRVkRnffzvkKFAKevblyyP5+YNt0vsQb6unfg==
X-Received: by 2002:a1c:2017:: with SMTP id g23mr13747348wmg.126.1615042914926; 
 Sat, 06 Mar 2021 07:01:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i3sm9396470wra.66.2021.03.06.07.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Mar 2021 07:01:54 -0800 (PST)
Subject: Re: [PATCH] hw/sh4/sh7750_regs: Replace link to license by its full
 content
To: qemu-devel@nongnu.org
References: <20210222185605.2714192-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1518dca7-d5f4-4c17-4a30-3cc1fae93b1e@amsat.org>
Date: Sat, 6 Mar 2021 16:01:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222185605.2714192-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 7:56 PM, Philippe Mathieu-Daudé wrote:
> This file is borrowed from the RTEMS source code, which comes
> with a GPL-2.0-or-later license with a header exception.
> 
> Expand the GPL-2.0-or-later license in place to not be dependent
> on a 3rd party website. This also fix the misleading comment "The
> license and distribution terms for this file may be found in the
> file LICENSE in this distribution" referring to the RTEMS distribution
> and not to the QEMU one.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sh4/sh7750_regs.h | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)

Thanks, applied to renesas-next.


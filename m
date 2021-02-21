Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03659320A95
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 14:34:54 +0100 (CET)
Received: from localhost ([::1]:42208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDosv-0002Hd-AO
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 08:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDope-0000vk-KE; Sun, 21 Feb 2021 08:31:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDopa-0000Nf-5Y; Sun, 21 Feb 2021 08:31:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id l13so2418368wmg.5;
 Sun, 21 Feb 2021 05:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wclj/zji4w48rTO6WNBPw0DfPt1Rg8n6t44ZMHbxqlE=;
 b=P3jrZlj7Tfc2mmbSt1hHo9NZaqUr9oMxL9sfDgUBgNs3ePH/Zf0oc5pAZRhJeYrnyz
 s8DMWDlZFyxr1MFc4sFhdx4yX3mwH0AeRNHWrGrYJmVv9NRY+N45kkCkLB3NkXsj4x41
 kflcXXj05UFXVVMK1TSyJXCjNO0JTZO6Mz8yWPCbOCrM1Rxv6exly58lIRnVlI04aCY7
 yTli2c/2enfUJd3QxpUGIPJvvjyW9h5FD4221ppLvUbg5sZGfuhYtN4HBGXIoWyYXGpt
 zIISolE1g2xYzmWfoyscn51E7m17DoZhkzPMa3UuhCoAfW+4ZpTwlUEO6ny8Sl4IswQx
 r1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wclj/zji4w48rTO6WNBPw0DfPt1Rg8n6t44ZMHbxqlE=;
 b=R6R1yAtOVrR/DyhA0okf1tJqj6l4jlnoXw8fQk2UnVOzqR8Xt6Kfoj+Nntq/gbb3Po
 Kw+0RtUsNKaAr/CPUkXRWdPzxQHeaB7TPn35GXPJS+aQkXMsJEvOUsJeqe5pO0JYL6hq
 Bt4IWo1gzQptWs9y7FTnIy//ZelxKr6WjFnFtP5GtXbqYHk2UdpNiRtrvUqVTjMS9i8c
 L8ZSnV1zUHHyQ7heIy/4oaO8R7Z1XewZovNI48adBOj1BiBUZDMhF5V+4PZjZozQuj/p
 njcVd0MA9QoQo8/+y3//3AEg2/TUmUS6MzT4SjsHfSDokkbRzzNune7qMfYqWWlNp18H
 8mlw==
X-Gm-Message-State: AOAM531DJGLUwIHJ1fMJ3hY8mcskwvIyim/T3UqV1IwON9gPHKcj9Qif
 DhAArrUAvNCDBDGIXnSJRa7QtzYrcec=
X-Google-Smtp-Source: ABdhPJxf9cAt6yNYa00Vq3YP24I++vPuoGyEoH7M9yLCRQOlhSQ9Hdrtzx8bWoXFmP24Peid8Zmzxw==
X-Received: by 2002:a1c:e142:: with SMTP id y63mr16267605wmg.163.1613914284235; 
 Sun, 21 Feb 2021 05:31:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f22sm9388461wmb.31.2021.02.21.05.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:31:23 -0800 (PST)
Subject: Re: [PATCH 19/44] hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU
 stanzas to hw/misc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-20-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ca3d4369-79ac-3679-9dbd-421700bc19ae@amsat.org>
Date: Sun, 21 Feb 2021 14:31:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 3:45 PM, Peter Maydell wrote:
> The ARMSSE_CPUID and ARMSSE_MHU Kconfig stanzas are for the devices
> implmemented by hw/misc/cpuid.c and hw/misc/armsse-mhu.c.  Move them
> to hw/misc/Kconfig where they belong.

Typo "implemented", otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/Kconfig  | 6 ------
>  hw/misc/Kconfig | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)


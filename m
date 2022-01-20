Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B824956D3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 00:21:10 +0100 (CET)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAgjs-0003Vv-SD
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 18:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAczi-0001Zi-U8
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 14:21:20 -0500
Received: from [2a00:1450:4864:20::32c] (port=56137
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAczf-0004I5-VM
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 14:21:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c66so14133052wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 11:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H0yMniFJcT9vWRyDPjYbYD7mEznntkTMe+X2Q8atFy0=;
 b=Pq9Mdjop9elf4uxoz5awUe9mZNbH/ceFH8/qZQAzr1l8Ax7uwu96pcS4zjWKnYz8gX
 I3adAK0STa0MvDApMMzD7O7+MG2+kRSLzI9cXxajOKKyRW0zpb4ev5d+zzDvTdC74Pr0
 1GL+LlqdpBbSzMpsN1buczPnbCMFSNqFWfDbcYPQK7juVRIBvxQc2P3sIN2N6HVJGe63
 gcOh0qRU/Pa0CmuAcFaw+d6vyRyaLQwQIv75HxP7hxC5kL2Peq0+T27IyYtbtAdM7nfZ
 f/wCIZR3hVDfPwS9T500mIsam0rYP8DT1RrykoNqhKF0dkxqEZKohjXV9AqrsyFzQAmi
 6JjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H0yMniFJcT9vWRyDPjYbYD7mEznntkTMe+X2Q8atFy0=;
 b=33bqN+EvICthsSniFrt3kpDXKXQN34Jkkxp/RuSUJ+LVH87cyX3/hVWA0qpUkztYOH
 8XeQp5Ryif2k9Cb7MdviM3U9SCJVsP8O2ErpuYP7impUNptRA/74mW5GvBH162/yJydB
 qsHPdNYuXbZHocIBoK23049V+z6a02akgMPEryfSrGIB2F8kgMwKie/x+OG8n66htwTP
 6n4MxP4vGLmK+vxa1PALS4Qz5CTX/GMwb1dtkP6sKfZvuUUq2mfDCsrDA+6yMrArIOCK
 ormpHflEaa086bxoXstW4wIAPZbnvj5Bvgrg30vebzYDZAuRoL3NBlDhzZ1tDMLyViXa
 2Xbg==
X-Gm-Message-State: AOAM531iY9FaoX2YKRhRYtII0snQjAGLKpvcKrWBO9slysiqSa57zfSS
 rSFLQ4BpugT+xIqZEEkPuLRo5UMtJOQ=
X-Google-Smtp-Source: ABdhPJyXD40xmnZVMMXVOskz5BJiH3NXaWTB/Lhji9jqdjM/Mijsd5eJi08zifPTYBze4kKjyjOx2Q==
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr466495wri.385.1642706470282; 
 Thu, 20 Jan 2022 11:21:10 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n10sm2746148wrf.96.2022.01.20.11.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 11:21:09 -0800 (PST)
Message-ID: <086c90c2-13b4-54a1-da39-32be265699d4@amsat.org>
Date: Thu, 20 Jan 2022 20:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] Update copyright dates to 2022
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220120124713.288303-1-peter.maydell@linaro.org>
In-Reply-To: <20220120124713.288303-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/20/22 13:47, Peter Maydell wrote:
> It's a new year; update the copyright strings for our
> help/version/about information and for our documentation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> For once I remembered to do this in January :-)
> 
> I suppose at some point we should try to arrange that Sphinx
> can pick up the copyright year from a common location so
> we don't need to change two places.
> 
>  docs/conf.py          | 2 +-
>  include/qemu-common.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



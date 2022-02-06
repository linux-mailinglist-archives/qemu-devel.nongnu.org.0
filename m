Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1E4AB253
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 22:24:16 +0100 (CET)
Received: from localhost ([::1]:56102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGp16-0001un-0d
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 16:24:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGozW-0000Zx-Gw
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:22:39 -0500
Received: from [2a00:1450:4864:20::32c] (port=38598
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGozT-0003XT-JN
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:22:37 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so926627wme.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 13:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uY+8iSAuMZRI8Tkw8LpBLD8Rrvzvb5EyUEYXfqo5wVI=;
 b=LfM2SXvgarmpoRnCPTXt4uDmYibzc0LHqY4yPmygOXb/B4rL25unLI6wA70ZxdQV2X
 3TIa95ANAcfJcTDcKAuQsfvTSRRmlW8PIfiQqChdNDWxwh7P9x9Du9VhTFDXyHhdevGA
 Ni+4et7CfkvDzca3J0Bd5mtHJ9xbG/fI/7t6GUhNOiTyuUHW2AGYvr4RVIfOXiyt0nhV
 GB9ABKai/XiaWPJAdeXFmubE6wBvlzy3c8sUhsutScRUFwTtLej6+E9TNuyRkIXIMeRx
 dgYx8Ld1yrLmEl4+Em40BJiyYHfnIlb8CD6HKBgGOPDjC4VXT6JoClXlP7LCxAYiRTbL
 sNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uY+8iSAuMZRI8Tkw8LpBLD8Rrvzvb5EyUEYXfqo5wVI=;
 b=7Abw4CZoD1snzOk8xSTWLCej9edLq8lr3/g5pQwcCantAtRMo8LPsrF5B4tWV4zBw6
 A3peDIJuYW/znH6qiO01QV6+X5FkJ5fH0sJ4lPDhtWqvCcl+wH68ZUz1mY/nffUh+37X
 fmwc26WBuMlfX6GHN02ukvXIL+ktDJ0PgoO2/cXs3bW7sk2GSPGWuLd6M7rUo3LuS/Za
 6Nf0Sl5XlMgKC+xTNMfDO23ndpL/o8TM+IdAsmXeQ8Dt/YvbgZZTNOvsFjjLDl64/4So
 mHjsHu704zQ25kmWur6hJutI9OV9a6iycmBgU9H2aJtA5zgepOxP/XywP2JryTygfNud
 txlA==
X-Gm-Message-State: AOAM533zcRs7ruoi1Lsl8t/rEQ3VgxC1wsHaPHb7n5snqN66Nzi44N9z
 mfTuxmeI9ukuc6wb8b/O+4c=
X-Google-Smtp-Source: ABdhPJxZvVZtkEBgaXegqMreAzahVHWdteb5XI9Q5YRMke/hWV44K64N3AK6kgf7Qs8bTMLzGdzKuQ==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr1792186wmc.65.1644182554058;
 Sun, 06 Feb 2022 13:22:34 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l10sm9409425wry.79.2022.02.06.13.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 13:22:33 -0800 (PST)
Message-ID: <9265b724-d9c3-7c06-20ac-177feb63fee9@amsat.org>
Date: Sun, 6 Feb 2022 22:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
Content-Language: en-US
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-11-wwcohen@gmail.com>
In-Reply-To: <20220206200719.74464-11-wwcohen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/2/22 21:07, Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Rebase to master]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> [Will Cohen: - Add check for pthread_fchdir_np to virtfs]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>   fsdev/meson.build |  1 +
>   meson.build       | 14 ++++++++++----
>   2 files changed, 11 insertions(+), 4 deletions(-)

> -have_virtfs_proxy_helper = have_virtfs and have_tools
> +have_virtfs_proxy_helper = targetos == 'linux' and have_virtfs and have_tools

Why do you restrict the proxy-helper to Linux?


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E531A4A0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:37:09 +0100 (CET)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdJU-0005fE-AP
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdGj-00048o-Ob; Fri, 12 Feb 2021 13:34:17 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdGX-0001KG-9m; Fri, 12 Feb 2021 13:34:16 -0500
Received: by mail-wm1-x336.google.com with SMTP id w4so494313wmi.4;
 Fri, 12 Feb 2021 10:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mw83hOW4O3dkkP6ATAT7o3W4pShFsUFs3d3FConeNiQ=;
 b=KNv7kKuK7U21qvF2H8nKoATlhBeYoq7rXGRrDC9Whjv/1zqMnaEBbZAtm+OQlasO5s
 X87gS3O+r5Vv7o2ijNnQJANc6SIEfBida7FEjazwKdsk76W7o3UH/oZqvuO/mrIes4qn
 H6K8cgFOMakcscjtofjXM5UWmVFM5qkREl4WQirmIu/1H6UkXlo9DHzXcWy3o9JBhMog
 MCWQrVKS+nzTbsIXDNRPsTGVqDeIF0NSIVXL+rdQ2r73tIgYpvPmqR1Zm3pMTepkHsQ+
 wOyPmaf5oXZT9wq/LExMYvviLWpdom4zERKyJcQE02J0TJIf9SHhleLPkOzRB8ObqcVE
 m/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mw83hOW4O3dkkP6ATAT7o3W4pShFsUFs3d3FConeNiQ=;
 b=dAGdljC4okmC4XFX4zvqfza/gdd7uHfdka0OneijiFgQvnNSDnsSE09KD9JcmaO1N5
 UvOQv/SC+3PVAr49v5NvzbXeJcd127zIZuvR/HZIOb1XFdbS5xHxJj2uRtuB8SOddzD7
 kLhgI0ZG6YyZMJM0XZVp5wHNpdYKHAnWltp46/T3lcH79MOFTb5Ydi/2TCf72KBsDmMF
 gT4pFaSPOXWJFE4ZqUXHKfzZipAh9eD5fKKEK7vS2nCYjmi99bb88aXHZQCe81KEJe6e
 +n46CLHq47mozp4xvmnWc5PvDKubp8hrtdMjf2UL5YCeUdwzGanI+lDEsAVyXFeKucuc
 OvHg==
X-Gm-Message-State: AOAM533W0nIlXsNjOrYeVE0XMhLdWwBEr9zrK2dzExi+GZDuOHOsXz11
 cDXyTbrKZnVN2TWfMk6r4pBGDLRZB8E=
X-Google-Smtp-Source: ABdhPJyNwJBUAnN/TcERxOz7vKlGO5qVjTtezrx0h25soKQtN7Hk1G4FRWXtVN9yssBbGRoxAGX5uA==
X-Received: by 2002:a1c:6802:: with SMTP id d2mr3853911wmc.32.1613154843125;
 Fri, 12 Feb 2021 10:34:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v15sm12896877wra.61.2021.02.12.10.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:34:02 -0800 (PST)
Subject: Re: [PATCH 21/24] hw/arm/mps2-tz: Stub out USB controller for
 mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-22-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <059502aa-8f63-d563-e80f-73954be344a1@amsat.org>
Date: Fri, 12 Feb 2021 19:34:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/5/21 6:00 PM, Peter Maydell wrote:
> The AN524 has a USB controller (an ISP1763); we don't have a model of
> it but we should provide a stub "unimplemented-device" for it.  This
> is slightly complicated because the USB controller shares a PPC port
> with the ethernet controller.
> 
> Implement a make_* function which provides creates a container
> MemoryRegion with both the ethernet controller and an
> unimplemented-device stub for the USB controller.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


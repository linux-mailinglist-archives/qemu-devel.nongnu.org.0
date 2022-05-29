Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4D25370A4
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 12:53:41 +0200 (CEST)
Received: from localhost ([::1]:57038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvGYG-0006LV-Lk
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 06:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvGQ3-0004f8-RR
 for qemu-devel@nongnu.org; Sun, 29 May 2022 06:45:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvGQ1-0000vL-Qk
 for qemu-devel@nongnu.org; Sun, 29 May 2022 06:45:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id bg25so4913465wmb.4
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 03:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r04bIpD/9Gg/sq+ppIj83kxqkwCdePaFEjVNl4VRlZs=;
 b=S2aL16CRuXSfIawJaJLAETua7uklveCr4a3lkphz9LOupvHYwbXf1d+ojtzS1QqYFf
 MnsUAvpBwAdQCVhF3TJPk5hMNpdWXZj9EYJiY6jwCi4Zkr3oV6gEGUjjY4WkGX1oSIZT
 3KVWvyESVJvcDRNqYishY/GC1q8DP34GYfjyeObKhqnazquU7RNmghTx7vfJ0rpkkxdu
 A0GuBQT/+AaYBOp1mFGm64J9Og5p7yxi+HF1Vp0NZ1VRqdZf+NiYuG00uL1I3r129m+I
 29PHW9NR9rmrgx4b6MVVrEHPONVQaGG/6IS8LGP9xYw0I1umNcaJEEiXA9Wc3pIGo1x3
 cW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r04bIpD/9Gg/sq+ppIj83kxqkwCdePaFEjVNl4VRlZs=;
 b=Xj/nBBX+fD72VMYutN8pGctnNkPCDIaABYxed60ukUXPkdzLe7ebQkeVmVWhbJYHfX
 qPRS7YoEruMkODnamqB6091llEP4xCb7fDyH69lZK8L9mLTCDUKvsGIHd3K6P3cwcLTP
 SnxCKv2IPgzXAs6XasNZ23wvh3H4F83nuGIHC+90L6ZVGQzpwonNdPlt64Jynkyg/PQT
 F9pP5nntEs5a1T0/Rgz7edvbfPf3eKRzAsSAOFN1yRTG1UoZrf877hwSDRqNc04gS3cn
 nznFxns27JgGqNQ8oeF8g23nkZIeweljaIFNmgdsMTZPpJ4EyDAgl6e//eAzlMh1b1lw
 P+rQ==
X-Gm-Message-State: AOAM532Uh4TcvroNBn9DtVVg0xqWvQG4pb2BwruPlVLtLFGtV0WR7Ywr
 JEhY2PWaMfauMwwd0B7kLVs=
X-Google-Smtp-Source: ABdhPJzbSwpzOPmqJKW0pDysC7m4n/zUqElyk+hm66j5Xj1Td4pucbpUEaTBj1oG/vr3MzYEY7OHFQ==
X-Received: by 2002:a05:600c:1e85:b0:397:6bcb:c52c with SMTP id
 be5-20020a05600c1e8500b003976bcbc52cmr14744217wmb.41.1653821108428; 
 Sun, 29 May 2022 03:45:08 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b003942a244f50sm7993888wmq.41.2022.05.29.03.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 03:45:08 -0700 (PDT)
Message-ID: <30afbc95-4e8e-ade0-da24-e85ec1f98397@amsat.org>
Date: Sun, 29 May 2022 12:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] ui/cocoa: Fix poweroff request code
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220529082508.89097-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220529082508.89097-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 29/5/22 10:25, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   ui/cocoa.m | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 09a62817f2a..84c84e98fc5 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -35,6 +35,7 @@
>   #include "ui/kbd-state.h"
>   #include "sysemu/sysemu.h"
>   #include "sysemu/runstate.h"
> +#include "sysemu/runstate-action.h"
>   #include "sysemu/cpu-throttle.h"
>   #include "qapi/error.h"
>   #include "qapi/qapi-commands-block.h"
> @@ -1290,7 +1291,10 @@ - (void)applicationWillTerminate:(NSNotification *)aNotification
>   {
>       COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
>   
> -    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> +    with_iothread_lock(^{
> +        shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> +    });
>   
>       /*
>        * Sleep here, because returning will cause OSX to kill us

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


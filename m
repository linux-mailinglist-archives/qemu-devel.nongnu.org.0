Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B05E674E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:39:27 +0200 (CEST)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOIQ-0004Xu-SJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obN3r-0003GU-Np
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:20:19 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obN3m-0003rC-GQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:20:19 -0400
Received: by mail-pl1-x635.google.com with SMTP id v1so8913424plo.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=FpdTGrzbx3s7ml9afJv7TE7Ez33clCIe/5rG+Bmep+Y=;
 b=nY2S5TjJiXU1Jo/HWj/3kgVwahJSN+Eo4687f08xtWwj1485ZNB6bYprhNYXqdTDWM
 sXHRCeLGhJ4x4kv7jG5gkBUJDGsdoiMZuyWTgTcRaWxs2N/eTF7EJDAeD5yfD5p+Ria6
 Re2e9hGHROVOJOiGg1kJ+ES+E8P5jWIi60+zWr3lfapRJKawLGHkTnPEyOzjtLOmW+pq
 Fe7juG0onCgUsK8j3e8dHeLkMU0MgMtxmgovbKHc8ef5w+qqhytbW4AdI1Z1ZL9zYSrM
 gu6QQ9W8+acGQPL0bOBb3apoVMhkAaE+gGpnhpzwVkE2jpDLPdiT2M0e1PrOZ9vUlIuL
 Q4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=FpdTGrzbx3s7ml9afJv7TE7Ez33clCIe/5rG+Bmep+Y=;
 b=DFfXVPve4hBxY1x8NEFhyu7o50EJYVixmdh1WLhTZhMy7jf11QjZBeOWMSu2S5HcDa
 DI5GPxRt52yEUBpaimu7SaFxlBasZM3hMgdPQhc6jc/53QD5EZmbMpZHLUixZ8V6ka19
 FqYEfs0gk0oNqTGm13G5YowfhDXZ+IT8acb8mky9uebwMU6qh93iI12mxnDOqadGlE+K
 vB3bEqx1j5CTJn8kfm6EE6fqRai5mqdHrGUBmh7EINUSlWhvXBrXvXq26Qi8uSC0U4vm
 OAqVZnQBftyb/ZeUm9RU89vEVhCUfpLuCpbCgLcrcDz0d3H8WcW6ggcU9IwBK32D0bOa
 oXNA==
X-Gm-Message-State: ACrzQf3nK8jMETikW5fNbUmOyugoz0wYNPe7tBbUabwfMm2KcG2T/w3m
 H5xXAJIWgkqh1tZTr8gswrk=
X-Google-Smtp-Source: AMsMyM79K9s4np+9Xb3lPLV++H4uMd1fPMMfK0H1ZE9oyuxkLODMNBNl2p7/PuY7jolZOxyIxDg0eQ==
X-Received: by 2002:a17:90a:e7d2:b0:200:a220:6495 with SMTP id
 kb18-20020a17090ae7d200b00200a2206495mr4045050pjb.5.1663856412410; 
 Thu, 22 Sep 2022 07:20:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170902c41100b0017550eaa3eesm4267556plk.71.2022.09.22.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 07:20:11 -0700 (PDT)
Message-ID: <f2e8332f-47da-b713-3f07-8575324715ee@amsat.org>
Date: Thu, 22 Sep 2022 16:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] watchdog: remove -watchdog option
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
References: <20220922092955.220029-1-pbonzini@redhat.com>
In-Reply-To: <20220922092955.220029-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/9/22 11:29, Paolo Bonzini wrote:
> This was deprecated in 6.2 and is ready to go.  It removes quite a bit
> of code that handled the registration of watchdog models.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/deprecated.rst       |  5 ----
>   docs/about/removed-features.rst |  5 ++++
>   hw/watchdog/sbsa_gwdt.c         |  6 -----
>   hw/watchdog/watchdog.c          | 45 ---------------------------------
>   hw/watchdog/wdt_aspeed.c        |  6 -----
>   hw/watchdog/wdt_diag288.c       |  6 -----
>   hw/watchdog/wdt_i6300esb.c      |  6 -----
>   hw/watchdog/wdt_ib700.c         |  6 -----
>   hw/watchdog/wdt_imx2.c          |  6 -----
>   include/sysemu/watchdog.h       | 12 ---------
>   qemu-options.hx                 | 33 ++----------------------
>   softmmu/vl.c                    | 16 ------------
>   12 files changed, 7 insertions(+), 145 deletions(-)
> 

Great.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


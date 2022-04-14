Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5365018B1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 18:35:13 +0200 (CEST)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf2R6-00015d-2S
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 12:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nf2Pb-00081F-SR; Thu, 14 Apr 2022 12:33:39 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nf2PZ-0006p3-2J; Thu, 14 Apr 2022 12:33:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id q3so7042009wrj.7;
 Thu, 14 Apr 2022 09:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NuiYVnCduyAdQX3S5j9YCbOkNWgEJzF0Zsidg3XeV14=;
 b=ZxryQDDJE4+Y0XPpPegVrtg0HNYrpq4qYgiplq8sh5+NCSRSn2Z/WydzrqXuPZnBec
 jTmTGHIi2+cUOuZG+iQ6UJf1EzWmlhVAYUTPCimZCi9PRDo6k120wgI0P7O6Qu3mGVQc
 Bo63iE+46EtfSw1FAgZz7DIp9+eK/DLP8xGGoSm9mFFCCce0wWGBhBFsQLLc1vfpIeSq
 CPyIdDQfeet10IWg+JWlRmBMSjlVMvfoepD5gr4xDRZMUzGj48quMwIR0RCS2h/cTQIo
 SRrkCbArl5/iNMJa7tH+UdL5mP/7L7sFxnUWbbtddb5CFa0cXAZWhtMVpXgSC/KeVOQJ
 jJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NuiYVnCduyAdQX3S5j9YCbOkNWgEJzF0Zsidg3XeV14=;
 b=r6ORqGfPttyntIgLBnFm7ew9hldaJQYqi8xDbeG38eZ0Qy61jOS3zRkLxJfVC64zPH
 Pp7UQUFzeKOGGMkplHcXKh3p5tBbL7+R1IwySr/mgtb+ZB7PQf2NtBRRcjlrHsMpGnkB
 5zDJJTkGvK8VP5XwRER2bIPneTnHrUmZ60L/ItdIFpPApixBGt3gT7xZGnEY17ZRfZrg
 1ySPezGiJe/rLmP/eljnsrlYln2LT/g5RZaO8RuaJFz1JwM9LN0D8jldm/Ht+fxjyST3
 yZ2RFZnHfrfeSHf5c45K+GudlIHPqkgdZQ+Yk2lDCQN3H3RjGqpNm43DmRgs3DIZBYOB
 s7gA==
X-Gm-Message-State: AOAM532+7/l3yd7fO1PanC04YsZUbviiI5tYwTFTKWlshdEeReKp2hO7
 BEZLYVsWI6GMdARz9TC2EqE=
X-Google-Smtp-Source: ABdhPJz02NqbqTOprZJC1nKFi1QAzQEzOPYj715N43u68X49PZ6xD266Qmk7ciiuOGSn8lsfiqjfKA==
X-Received: by 2002:a5d:6f10:0:b0:207:aa60:f59f with SMTP id
 ay16-20020a5d6f10000000b00207aa60f59fmr2613941wrb.175.1649954014701; 
 Thu, 14 Apr 2022 09:33:34 -0700 (PDT)
Received: from [192.168.236.175] (70.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.70]) by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm2141439wrn.114.2022.04.14.09.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:33:34 -0700 (PDT)
Message-ID: <d802fb40-29df-43af-d21f-4a8619865098@gmail.com>
Date: Thu, 14 Apr 2022 18:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH for-7.1] hw/block/fdc-sysbus: Always mark sysbus floppy
 controllers as not having DMA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220412164921.1685453-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220412164921.1685453-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/22 18:49, Peter Maydell wrote:
> The sysbus floppy controllers (devices sysbus-fdc and sun-fdtwo)
> don't support DMA.  The core floppy controller code expects this to
> be indicated by setting FDCtrl::dma_chann to -1.  This used to be
> done in the device instance_init functions sysbus_fdc_initfn() and
> sun4m_fdc_initfn(), but in commit 1430759ec3e we refactored this code
> and accidentally lost the setting of dma_chann.

My bad :( Thanks for cleaning up.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> For sysbus-fdc this has no ill effects because we were redundantly
> also setting dma_chann in fdctrl_init_sysbus(), but for sun-fdtwo
> this means that guests which try to enable DMA on the floppy
> controller will cause QEMU to crash because FDCtrl::dma is NULL.
> 
> Set dma_chann to -1 in the common instance init, and remove the
> redundant code in fdctrl_init_sysbus() that is also setting it.
> 
> There is a six-year-old FIXME comment in the jazz board code to the
> effect that in theory it should support doing DMA via a custom DMA
> controller.  If anybody ever chooses to fix that they can do it by
> adding support for setting both FDCtrl::dma_chann and FDCtrl::dma.
> (A QOM link property 'dma-controller' on the sysbus device which can
> be set to an instance of IsaDmaClass is probably the way to go.)
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/958
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/block/fdc.h |  3 +--
>   hw/block/fdc-sysbus.c  | 14 +++++++++++---
>   hw/mips/jazz.c         |  2 +-
>   3 files changed, 13 insertions(+), 6 deletions(-)


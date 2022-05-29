Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA12A537216
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 20:07:17 +0200 (CEST)
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvNJs-0007so-Hr
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 14:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvNIV-0006gD-Ne
 for qemu-devel@nongnu.org; Sun, 29 May 2022 14:05:51 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvNIT-0005dk-Sc
 for qemu-devel@nongnu.org; Sun, 29 May 2022 14:05:51 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t13so11967263wrg.9
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 11:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GbENHN2jDjCqQ7EyjYi5N45YSceMPZCE/mkShg3+qvs=;
 b=jyv4tEPU1sFoHy0AkdNknJ6h1kVzXqY6j2MqlQyPRpY2R6yAh8zriTEgnKzVlB+by9
 BUN960zs9c4j7TC75L3ljMxHQ6ZaQzLbnn8Qm6+VSByNvMMegRPvq35lJ7TezGdfXw2D
 RwfX5LIjZHz6xkbeFHzj/LzmwEhVSbtlnZq674AQ6csLJ4KcfBgvSvzsCHXspWL/oYP8
 qQZlx6Qlh/W+T4i3peQ9QO/i7IbuUJeE/Z8DhvFF0DyM+EQ4xaONidhfRJmwHXQdh6Cr
 qLBIRMArn+Ba22thyJOuEppZ+Q9B8P/zhK+xiY7SLyinSUV2TOf9obZd/CAsHJoNwhXr
 2wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GbENHN2jDjCqQ7EyjYi5N45YSceMPZCE/mkShg3+qvs=;
 b=Jdd9d45DzMSPi84LhvpOECDg3zm8iN3sVis0zkyXLQhaccQvM3gw3jqSm1/klogVb8
 IjarEK6ER4AmNJWIQ5v+hWwIkOZ9PafuOpBFrpriZUdPCqVUN2AR41AKchpg31goScad
 3PErUOMoh+DRiFTxNsumvCyPbWJUGChPpMuESxPHlkXGeFuw/IDJn8LyTOdCmZyfbVJy
 KYlgNJsnYxRdeOfMxmCsM5YHCcmTuB6RIYu4C2CbJanoBjricZMBbU/8X/OR4SXU6Dgy
 lMDxyMVRe1+n8e2b5zOUgr/VsJ/JggafFb5nQjF9Dcwq6G6nhp7jcQzjLsvu8pEnxivS
 OnSg==
X-Gm-Message-State: AOAM531XjFPLkEze8SCjkPDuvFHxQXyV4RizK7ft5KNQus9Abkil8teM
 SOlFx+1ruG5K2z+kC6tUIqY=
X-Google-Smtp-Source: ABdhPJyzK0LLdsK4omdqKSBNuolqfx14ShL1AKoX+XsXEEVKYpimYQhYSVHcmQsyDOQ1m7MgqE4QiA==
X-Received: by 2002:a5d:4492:0:b0:20d:740:beb9 with SMTP id
 j18-20020a5d4492000000b0020d0740beb9mr42633942wrq.179.1653847547956; 
 Sun, 29 May 2022 11:05:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k32-20020a05600c1ca000b003975c7058bfsm8105668wms.12.2022.05.29.11.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 11:05:47 -0700 (PDT)
Message-ID: <d56db423-6d8f-d2ca-c91b-d098ed9f4549@amsat.org>
Date: Sun, 29 May 2022 20:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 00/12] hw/acpi/piix4: remove legacy piix4_pm_init()
 function
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, shentey@gmail.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, imammedo@redhat.com,
 ani@anisinha.ca, aurelien@aurel32.net, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, hpoussin@reactos.org,
 qemu-devel@nongnu.org
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

On 28/5/22 11:19, Mark Cave-Ayland wrote:
> Whilst reviewing Bernhard's PIIX Southbridge QOMifcation patches at
> https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg04329.html, I
> noticed that we should first eliminate the legacy device init function
> piix4_pm_init().
> 
> This series moves the outstanding logic from piix4_pm_init() into the
> relevant instance init() and realize() functions, changes the IRQs to
> use qdev gpios, and then finally removes the now-unused piix4_pm_initfn()
> function.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Mark Cave-Ayland (12):
>    hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
>      piix4_pm_realize()
>    hw/acpi/piix4: change smm_enabled from int to bool
>    hw/acpi/piix4: convert smm_enabled bool to qdev property
>    hw/acpi/piix4: move PIIX4PMState into separate piix4.h header
>    hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
>    hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
>    hw/acpi/piix4: introduce piix4_pm_init() instance init function
>    hw/acpi/piix4: use qdev gpio to wire up sci_irq
>    hw/acpi/piix4: use qdev gpio to wire up smi_irq
>    hw/i386/pc_piix: create PIIX4_PM device directly instead of using
>      piix4_pm_initfn()
>    hw/isa/piix4.c: create PIIX4_PM device directly instead of using
>      piix4_pm_initfn()
>    hw/acpi/piix4: remove unused piix4_pm_initfn() function

Nitpicking, SCI could also be a named GPIO :)

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


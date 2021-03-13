Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910D339D9F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 11:43:45 +0100 (CET)
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL1kF-0002Td-P8
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 05:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL1jH-00023s-R7
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 05:42:43 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL1jG-0006Av-4W
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 05:42:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 d139-20020a1c1d910000b029010b895cb6f2so16592295wmd.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 02:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LVSpaRzJOHsEUALzIOCroPvshe2PzkEDxN2WLMg3ftY=;
 b=GvjcNEgSqCRooLhZJyiA8G8CgWWFuUfxXMWQdej5il4LFF+Rh0GECFvvtyZ7JHcE6O
 CFQlC7Gbu0yNqwueeicYSMLqfeU6/wWiMHPBabPaIvpG2qwg3sTV4eVhTmflmZljTRJ8
 s9zCmCwlG5oB+Vr4QiG3gpi1wjW+7gRbGWPNY/ryDJ2WOtVYZGgA3aT3i0T9k2GM1721
 4xIKvNWd6Sm1L1VHlidB9Z8b9/dzQZmCJitYYorfV/X19fzMU/7ac4fbT4RAu2dCzgQN
 LF+3DLEhs4XE4XlgR4kpAPfkDHvA/0aVkrKR77I9c08cBc9Qnqevwr4ISCIay5EWGJwv
 Gtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LVSpaRzJOHsEUALzIOCroPvshe2PzkEDxN2WLMg3ftY=;
 b=ooeCzxuQyPrykyxlIVqIKXO4pXiA18gfLq1gWybpPyQ4XkCQAI2gptWH3Rx+DJPUvA
 UO2ObZUIeG+mu43533ym32iUfv5zFTRFokcyRjCbbi0bg/SkK65So19F1llkbkjYOjBD
 5heYhmlw1WcMtM5lrhyzD+Ca25OUWH0yi4Y2IVle/ZUGPBI259Zx+PtFVaIsGaZ6MTgS
 kzQ9uy0uUcV6gsopt1gafMI6OyfIm4Q4i+yjaakWRlbvw5c4N8MG4qzilsVYEjyj502W
 PPVc1iw60Ortax8Yaep2VF5RRMcEx59jK/gGB9Ycosw8Ul1aTitnBENlEUbt6yTFmSra
 nHoA==
X-Gm-Message-State: AOAM5328DO8VadRJPItXKsqLIMqQl9OdTBNRditzo6J9sx+c3Tm8wuim
 F54PzTgkugi54rZk8b7W020=
X-Google-Smtp-Source: ABdhPJyqf2DCikfkqsJz9hxvqvnhG/Fq9An4AVSTCM2ol6xH4O9STSc7+z9kMAkvzAK8S2b6LFyaug==
X-Received: by 2002:a1c:5455:: with SMTP id p21mr17261189wmi.138.1615632160012; 
 Sat, 13 Mar 2021 02:42:40 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z7sm11979122wrt.70.2021.03.13.02.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 02:42:39 -0800 (PST)
Subject: Re: [PATCH v8 0/5] m68k: add Virtual M68k Machine
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210312214145.2936082-1-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2fe8c90d-8b98-67a1-7f48-5b604bc3dafb@amsat.org>
Date: Sat, 13 Mar 2021 11:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312214145.2936082-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 10:41 PM, Laurent Vivier wrote:
> The Quadra 800 machine is very limited to run linux, it manages
> only 1 GiB of memory and only some specific interfaces.
> 
> The Virtual M68k Machine is based on Goldfish interfaces defined by Google
> for Android simulator. It uses Goldfish-rtc (timer and RTC),
> Goldfish-pic (PIC) and Goldfish-tty (for early tty).

> v8:
>   goldfish-tty:
>     set version to 1 because, as pointed out by Peter, the version 0
>     provides virtual address and not physical address to QEMU.
>     It was working with m68k-virt kernel because virtual memory
>     of the kernel is mapped at the same address as the physical memory.
>     The m68k-virt kernel at this point is not ready to use the
>     goldfish tty driver with the physical address but we can
>     use the virtio-serial interface. We keep the goldfish-tty device
>     for the early printks that work fine because they use the PUT_CHAR
>     register.

v8 LGTM.


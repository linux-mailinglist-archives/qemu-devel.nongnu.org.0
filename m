Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D241FC6B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:07:39 +0200 (CEST)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWffq-0000db-Kz
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfec-0008IG-21
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:06:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfea-0005pE-Kb
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:06:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 q127-20020a1ca785000000b0030cb71ea4d1so8827927wme.1
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YMQilj5zy6bh+xC2UyNTqWSBEhpRfgHaMQ+xTQAELmE=;
 b=LeM/6DpkQmBPpBPVz8lm+3e4wnmZGhyYNnUxn8S1eHV0TNJ9gbCttxqNRIbiQxHV/M
 PjFpwwA+2Btlp6H5KttNrikhH7N+p48jo6pW3Q3sGFxQUH0Tbj3ujW2AI+2tiIy7f8Qs
 bnyztudoDdRD9Z8eYYkwMDHU8rkYGxehVkZhppTQ9J36twSgWnflU7wEtJZ4waObbiGR
 945R6UUqpuUxpa7FF2TWYGQjnYjVpnehX1mwu6SvSA4AITJsePoSI5ILZD2xb/N6TJYm
 IKTThfG5ZYJRKDsvtguVkdysRK8bRVFNGiag9ocJFfnDz9bqAppRURd3n1+28ci4+nY6
 N2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YMQilj5zy6bh+xC2UyNTqWSBEhpRfgHaMQ+xTQAELmE=;
 b=Flw99TwJWnIToVsQXKYEME/sy89nOlZ7oA6PRvrqpDNCbnEyVESLuuoDsnBGdNv+BL
 luR6oh2+JmN8QB4AJhKfAoh8qV43LabVFUvjR0ijU2PmMr7bSrgn4QifV86smjaGRwZm
 VIfGbR2Q0M39k0F2MtMboqUPLsMaLcGalu4iXJsUsD/TRRphMHfefvl1XLw55MkW1Gka
 rnlPDEoJmWeoMZEgVk0dk5rIIaR2NWCAcn5OunMRxrxGk5x3V9LSQCOaQ7Hcd2doFAc1
 9/91mYfp11uAqT89bZ5QtvwmYxbEWhwaDUBhxy+jgiRPspGeiocdDewD11aYp1ws4A7d
 XEfQ==
X-Gm-Message-State: AOAM5337vkqylrivBJmxW+Qa1Ss+O/lZr676mzvXFbtjuazXSHVko6e2
 fOEO0yfahriihpHXwvhsVlA=
X-Google-Smtp-Source: ABdhPJwU0GPghWlly2aHuyHNI4RMYNdmO4IjXsI5V/CQkM1eUiyn8Qh9wuWtcupV2ND9KmYUtR6b0w==
X-Received: by 2002:a1c:a558:: with SMTP id o85mr3337756wme.110.1633183574977; 
 Sat, 02 Oct 2021 07:06:14 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v6sm807924wrd.71.2021.10.02.07.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:06:14 -0700 (PDT)
Message-ID: <00e6e382-43d3-5a38-8f26-f6d1ee933456@amsat.org>
Date: Sat, 2 Oct 2021 16:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 12/12] q800: wire macfb IRQ to separate video interrupt on
 VIA2
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-13-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002110007.30825-13-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/2/21 13:00, Mark Cave-Ayland wrote:
> Whilst the in-built Quadra 800 framebuffer exists within the Nubus address
> space for slot 9, it has its own dedicated interrupt on VIA2. Force the
> macfb device to occupy slot 9 in the q800 machine and wire its IRQ to the
> separate video interrupt since this is what is expected by the MacOS
> interrupt handler.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


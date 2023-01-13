Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D3C6691EA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:55:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFpR-0006Pp-Fg; Fri, 13 Jan 2023 03:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFpC-0006NP-Q3
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:54:12 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFpA-00076O-Go
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:54:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m3so14795720wmq.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t/ETexmyd299LZBQrIE9DqWW/VoD0TXTVoKntmsT0OI=;
 b=ZfJEpKfGQwxHZrWZnFksB9aafXLWLttBY1E1/V1cGlcDhNUYzhyLLl9ZNyFtaS/GTI
 MIKrXcGyBZKgIe5Z/pycpNKg+OovKdkBOpEtKqa5yHz29YKaF3Djb4UJpkHTslS6CjZY
 AR75SZfO5hIfhRc1/n1jYk/TjtdvIrFhBR3imcFJrHC4D3FGDvs9KJ9q8JUb/uefLLQi
 ScrS5Cv8rLuD32P3slvxRkY+5IoQQC3M3NifvPDpgWDRenrk2GUXl848dEUeuLz+toLR
 pd6rzRYPokjH1sZe2E2PJHbd2338hrxSPSSLNGmDRfs862r56fQUHg6z/3riiIYnw2zm
 4jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t/ETexmyd299LZBQrIE9DqWW/VoD0TXTVoKntmsT0OI=;
 b=30R8Wx7HHvqCB75fYsG+splZFMTKeqh/Q/eabqq1XLokyDI5zjskiI7ObuJlvZLmMQ
 qGElSm04bLQJgYgAzAs8oLtbEIDurHo2YSJj+d2jKx6dBRSRPBpzQXvcyZXlBlYsfh4J
 AK0hqPd7vpEp6Vo/qLqqApYbZ3BtbLCxEuTYLra9NG0P8864B9aWifNiU06wJZoynjv8
 o1MvzVjHewRhewuqSYHeP6hndGWM/nFRpOrPzDNjvUS7FgXu8HXAetE6jR+gmDbygoxr
 w2mDeDYHx4JubWmINrEQ6GRsVESY2/gN1UjYCaEET0BRpVT7MniT8Gq3Jc7V54TwHuyd
 YNcg==
X-Gm-Message-State: AFqh2kr6wQvwavHKqwJ8WUwt9RZPJhc4wvl7C3/LxxscQhG8TMUc1k4w
 XLdZXz34YSoyfV2t6COI3zIkJw==
X-Google-Smtp-Source: AMrXdXtDtGFHcn6Im0f0Jyc8BPLSFo3fg0t9VgmO+PD2pt15ztuTXQvEIp53YQUC8AnaGaO6eawpHw==
X-Received: by 2002:a05:600c:34d0:b0:3d6:b691:b80d with SMTP id
 d16-20020a05600c34d000b003d6b691b80dmr56784469wmq.21.1673600046907; 
 Fri, 13 Jan 2023 00:54:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b003d9fa355387sm11987280wmo.27.2023.01.13.00.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:54:06 -0800 (PST)
Message-ID: <3b7f8662-50de-f505-3e4f-57d8fa4a0ca7@linaro.org>
Date: Fri, 13 Jan 2023 09:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 0/4] Make the mc146818 RTC device target independent
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230110095351.611724-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230110095351.611724-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Michael,

On 10/1/23 10:53, Thomas Huth wrote:
> The basic idea of this patch set is to change hw/rtc/mc146818rtc.c into
> target independent code so that the file only has to be compiled once
> instead of multiple times (and that it can be used in a qemu-system-all
> binary once we get there).

> Thomas Huth (4):
>    hw/intc: Extract the IRQ counting functions into a separate file
>    hw/core/qdev-properties-system: Allow the 'slew' policy only on x86
>    hw/rtc/mc146818rtc: Make the mc146818 RTC device target independent
>    softmmu/rtc: Emit warning when using driftfix=slew on systems without
>      mc146818

I am queuing this series via mips-next tree if you don't object
(all patches reviewed multiple times, in case there is an issue,
we are early enough in the release cycle to fix it).

Regards,

Phil.


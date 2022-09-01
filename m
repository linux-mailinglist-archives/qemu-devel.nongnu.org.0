Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFA05AA0E6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 22:29:05 +0200 (CEST)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTqoC-0006L9-HT
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 16:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTqlw-0003fI-VE
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:26:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTqlp-0000IO-IQ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:26:44 -0400
Received: by mail-pl1-x633.google.com with SMTP id m2so18128250pls.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 13:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=5Urj81quWnjLFIC3eGj7NKBmtk/+AE29bve09LoYDTE=;
 b=aGALNGuD/D7wsWmUbfWRud3vdWcJRwuA/IpPAlChgCmHnv+jNy3RvVggCWmgLR94RO
 h0JHYYiZg/qEVGxZ/UE9iTYL8M+V1WUIZJSDDmuv375vyYrZnppEwTFrzQ/+iLkL3Ktu
 rA/ISEe0mHK1y1pMJnx0AuhrMa1A/MaAghVxkFuq4+DeUN3rLw7M8kAEYZCRAfFjP10d
 Gya4E7RoCRII3eL5EQPUmGwGetsOZF0W6SfmcSEaTHaB59xBzoEFAPU50bRoHn66ghMD
 9yN+QWEuZypOainStF12GgsVeIRRNCXuVmCw55KltmH7OLR5/oWr4b6jxu9ixIN4Torn
 N+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=5Urj81quWnjLFIC3eGj7NKBmtk/+AE29bve09LoYDTE=;
 b=2/BA91FhVbhasiwPUlUcpeBXn1HeBgU9YvG9KOOPM3rWcVAl50Gzm32Pop2gI8XOHE
 teJKNPfUNVML9BrN1+WktAmkyrSO/bb5NHr1Kgam98otX20K2/O61Wd7N8REmeI/338K
 AMjYcLjSmGkeK4M6fedNOUPWC+Yr0mHYklKND4ZXw9JHKM+0FiVR/XQkRX2tyg0LkuJX
 E9Z+2rQjqsgvCJDpaUWxn/v7lVFvdd0OiNpS8moFZ/+Bfq9PmjfcLr1gjTbtuS5k0drv
 fjsIo6G0bnmcsrOSJNcFIz05YQJ9A/68cWV4AO6S+Oo/TpwINenQGOGJDL4qns4pY9l3
 lJzQ==
X-Gm-Message-State: ACgBeo2+X17sdJVrgpNmrx05GtDrQcKoJ/MzF4jOt82HPRBBH1SD6VQg
 qhiPtdiE+Zwvz/eApwBgB1U=
X-Google-Smtp-Source: AA6agR548jS1ZLBz9FsHS21iaFKgrtE3hFAtaV4qBzDq2AlkANFD5wKAypnq5Xvf/jD3A0786+tmBg==
X-Received: by 2002:a17:90a:948b:b0:1fd:c277:fcc9 with SMTP id
 s11-20020a17090a948b00b001fdc277fcc9mr896738pjo.185.1662063995971; 
 Thu, 01 Sep 2022 13:26:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d48500b001744018def7sm14159580plg.90.2022.09.01.13.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 13:26:35 -0700 (PDT)
Message-ID: <92a9d571-a76e-007c-56ec-e9a30151835d@amsat.org>
Date: Thu, 1 Sep 2022 22:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 11/42] hw/isa/piix3: Remove extra '; ' outside of functions
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-12-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-12-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 1/9/22 18:25, Bernhard Beschow wrote:
> Fixes the "extra-semi" clang-tidy check.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/isa/piix3.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


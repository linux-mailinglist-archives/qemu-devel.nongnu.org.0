Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FBA3BADA8
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 17:25:45 +0200 (CEST)
Received: from localhost ([::1]:32810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0407-0006C2-IR
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 11:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m03z8-0005Xl-M7
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 11:24:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m03z7-0008II-1X
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 11:24:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id l5so2113274wrv.7
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0BOEMzpNZtwK6Zk/IvLXJwHDA3ALkwIKrd9bYBCibGs=;
 b=QGM34LJjYnVQDAz3XrWSSgFAZbWI0PCSPX02QDwwZtiAK2McdFRFMMIYLmogYhsSHB
 DBNUAFh288pcrhud+wWckgmYAhxL9ZFgPuHJC5UQYzxB6X2plbN1f5Sqy7w3b+h5Fte3
 039vT3yMDCNfJOHcygvJp+XQVs2Ei6LFaED8Pk+/8iOZ1rQ+T6i5IJ+h/sXw36QwUBVn
 qXY6U87p2OWdqM4gi75puVjtDazLd/SXtK8H3Ge3GSDBit8Bzlkcp27oVX/Esel50o6b
 tS1qgkdK5tjMQMSQqBZgwQCeRgQb68fjbw+UvLO8h35TmbVSHYI3lolPWRE1Uf9yMtxR
 37nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0BOEMzpNZtwK6Zk/IvLXJwHDA3ALkwIKrd9bYBCibGs=;
 b=bEAFapWCSV7uu7M00cZ4JCrBnK0M1OuIean5oP2Uqhf+hLBsum8iLpcuAl1NtnayUo
 U3DoYCMzakE7eP//FsN46MUBu3l/rCw0MI6cVh/pJHHjcFvMP/g5+eOwDQsUqwOktUvZ
 j6zR2etAwgs0FUc2+oVArKBzx0B2/RfRNv+2v5AM2BahtP62kjhWSdq3gQ30CkZ99HLO
 llCr29gz9GO85MznpAoJrC5gwB0b4d6VV/byd8drS2Vp8VK9nspcWY0mjUUYfztmzlYG
 t7MAwDPmG4M5VKeYNAZ0VZwAbXy/clLPrXFZ+JnW/a4DLy14eaYBmlxQd72CJyTx9tWk
 fKdQ==
X-Gm-Message-State: AOAM533HqbUO/AOEZweus1NX3HA/GUaOogML7qsXfNqXzV0vwMbtWiKN
 8zx4TBpCZTybfMN4xIfBl570FFqM9yE=
X-Google-Smtp-Source: ABdhPJzNWFb97DLmBwuySsMUDs1F93GwHShMaT5O07uGRGroSaIwsAP91Koo7AKTg1BO3sYVz42IzA==
X-Received: by 2002:a5d:400a:: with SMTP id n10mr10778348wrp.268.1625412279439; 
 Sun, 04 Jul 2021 08:24:39 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r18sm11172878wmh.23.2021.07.04.08.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 08:24:39 -0700 (PDT)
Subject: Re: [PULL 00/18] MIPS patches for 2021-07-02
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
 <CAFEAcA-dw5VHb+6t+VCg7bF8-AgUtNv9cO3upHqmk-nfMHDYsg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9aef3151-122d-2e25-b308-7a2b43bf3e57@amsat.org>
Date: Sun, 4 Jul 2021 17:24:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-dw5VHb+6t+VCg7bF8-AgUtNv9cO3upHqmk-nfMHDYsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 5:02 PM, Peter Maydell wrote:
> On Fri, 2 Jul 2021 at 14:38, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> ----------------------------------------------------------------
>> MIPS patches queue
>>
>> - Extract nanoMIPS, microMIPS, Code Compaction from translate.c
>> - Allow PCI config accesses smaller than 32-bit on Bonito64 device
>> - Fix migration of g364fb device on Jazz Magnum
>> - Fix dp8393x PROM checksum on Jazz Magnum and Quadra 800
>> - Map the UART devices unconditionally on Jazz Magnum
>> - Add functional test booting Linux on the Fuloong 2E
>>
> 
> Applied, thanks.

Thanks. BTW I expect the following to trigger new Coverity warnings:

>  target/mips/tcg/translate.c                | 9277 +-------------------
>  target/mips/tcg/micromips_translate.c.inc  | 3231 +++++++
>  target/mips/tcg/mips16e_translate.c.inc    | 1123 +++
>  target/mips/tcg/nanomips_translate.c.inc   | 4922 +++++++++++


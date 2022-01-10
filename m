Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2C448A01C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:30:21 +0100 (CET)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70N0-0001K5-Lz
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:30:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n70Dy-0002cz-7K; Mon, 10 Jan 2022 14:20:58 -0500
Received: from [2a00:1450:4864:20::42c] (port=37884
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n70Dv-0005eL-Db; Mon, 10 Jan 2022 14:20:57 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t28so21940011wrb.4;
 Mon, 10 Jan 2022 11:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wihw+ssEmhuBxnGGRsnaELmFkidSKD4m7aQwFuBeiBA=;
 b=bZUzEb8fxHWDp/pbdWC9EvZZyc4bFeXlSCXdBcrVm0WNHa8h9dqVQUK/UspO75h3fw
 CxP4lJd+4mWBee8rkvl63ihnkrqeBiRiDH1LTScz8vcZgkishz+xMq2VWr+eJzDF5O2P
 BgoFTa4K1sqF3iO7NIjor3hvC41NZxEaiCrIApcyQH6/4BEVSgXCh6ZjLIMf6foiUo18
 AOscrZPod4HKTPTq9CT25cHGBHLGgvYtDCqX8jMekg7N/fN/6+/Ysm87WBEhCouhcz/P
 aTd8Xp+9n+v6uqA2Uuzpn4YlnLirFe2qILiLw7ytoGIp04//N+R+EWUNNqIbVPp5qjye
 kLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wihw+ssEmhuBxnGGRsnaELmFkidSKD4m7aQwFuBeiBA=;
 b=28x5fb8scUZSiGqrV0SCIWMYp+iqXIkw2IxtUecRp+Z8LMKDGCxcNhahFQm5wlaB67
 8HwD6akHYlAbZL5fFR3SDxfqWZsigRVlLKBv+BZn0doIYLMrb4w5e+AyL0G2HiV0MVgH
 EOo1zoJmOlzODaytjvB45i4b//qkTcuQnttvhYw/K9btUWw0AzFbuT+8eBNorTOdhnIw
 +Oqmfbziqy3IZxmZ7IIEI1vEi3CClGVavNkXGrDIeTd6KT5X5m530kGbilbZPi1zPS5S
 2j6iczJkbwgysNn3DYQScsYWXIW8IBkcRymfSCugT9thXMmfidsMpiZ33ECrhgNTIg3j
 BYsw==
X-Gm-Message-State: AOAM5301nFT6g8pd5pJk+wIoUmoGdqeL/wcZ1Xpsk0ZTUUL3rmL2MZrc
 zikIo2jMRbOa+aHr3nIIjVd5Ugtg4Ley5g==
X-Google-Smtp-Source: ABdhPJyCfT0PNdOg9j76GiVKaQ4VVxIQeJVrNIoF7nvzM5I9sL7+N6ckzoUBpw55bghzsMo210QFWg==
X-Received: by 2002:a5d:4d91:: with SMTP id b17mr926094wru.214.1641842453709; 
 Mon, 10 Jan 2022 11:20:53 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id i4sm7452574wmd.34.2022.01.10.11.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 11:20:53 -0800 (PST)
Message-ID: <e945824e-ee1a-821a-6f00-dd03f68e917a@amsat.org>
Date: Mon, 10 Jan 2022 20:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL 0/2] SD/MMC patches for 2022-01-08
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220108215815.551241-1-f4bug@amsat.org>
 <CAFEAcA_K4eRewn7cpCrcM6FbvLMz8O1w1BqF0XN=XDQVTZM39A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA_K4eRewn7cpCrcM6FbvLMz8O1w1BqF0XN=XDQVTZM39A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 17:02, Peter Maydell wrote:
> On Sat, 8 Jan 2022 at 21:59, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Richard,
>>
>> This is the SD/MMC PR that ought to be sent previously.
>>
>> The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf99737:
>>
>>   Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into staging (2022-01-03 09:34:41 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/philmd/qemu.git tags/sdmmc-20220108
>>
>> for you to fetch changes up to b66f73a0cb312c81470433dfd5275d2824bb89de:
>>
>>   hw/sd: Add SDHC support for SD card SPI-mode (2022-01-04 08:50:28 +0100)
>>
>> ----------------------------------------------------------------
>> SD/MMC patches queue
>>
>> - Add SDHC support for SD card SPI-mode (Frank Chang)
>>
>> ----------------------------------------------------------------
> 
> Hi; gpg says (my copy of) your key has expired:
> 
> gpg: Signature made Sat 08 Jan 2022 21:56:02 GMT
> gpg:                using RSA key FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE
> gpg: Good signature from "Philippe Mathieu-Daudé (F4BUG)
> <f4bug@amsat.org>" [expired]
> gpg: Note: This key has expired!
> Primary key fingerprint: FAAB E75E 1291 7221 DCFD  6BB2 E3E3 2C2C DEAD C0DE
> 
> Can you point me at a keyserver I can get an updated version, please?

Sorry. It is on pgp.mit.edu and keyserver.ubuntu.com; which keyserver
are you using? (so I can upload it there too).

Thanks,

Phil.


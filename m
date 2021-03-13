Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CC3339EF6
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 16:43:16 +0100 (CET)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL6Q6-0003YH-NF
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 10:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL6Oo-00037E-IO
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 10:41:54 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL6Om-00048k-AR
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 10:41:53 -0500
Received: by mail-wr1-x42a.google.com with SMTP id f12so6384741wrx.8
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kvglY5DVstiDNqXe1weYII7GJ/CQ545MxlkTtFXqfB0=;
 b=p0vpNdfXq2QaduWddUd6TaQ1wgoBjDFoRJZ5BGZ459IwVkkgtZCXVkgz/6PMDLTydz
 BTDDokjGRKo6Ca+iqaSOh6xRx82rtzObDRswBTgPr60RVH1FWL/PNHCWcubhXvpqC38m
 soacYaBAwKwb6Mhrqea+nAbsIPcmsXzgWRgMKe1em0Wmw53F+55k9bz98VeVcNFo8ydL
 iHt5GAy5wM+7zpMaemDs1n/7g7OzQRvPcUo62K7E1V7DJLgS5nf8IqgR3Ljugwjinr4t
 ep1jLgdJIBYhZU006fsOWTR5exZGR77HzSoGS553yfviM51mKEST0kWi/BuB45FBzmqQ
 LgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kvglY5DVstiDNqXe1weYII7GJ/CQ545MxlkTtFXqfB0=;
 b=eQOZHWGQdVZblISpk4OpUJ+fKp9VEy4Mp9IBFtmKpbBFNDwtZfA1gFh9jlp4HKd+nf
 WPHpyqPrL1Xce6WOLRVhZcwaQP+OKtZ95X7rc2vLkmDAaUiY948g6/z5HzQ1Ps9f7tMz
 e4hYLoC2h9PJO4IBEVByJVzS/4Z1vwhF24tajI2j8pYswQbNrmgMiKzJHtlVQfVTXsbl
 NMFVal7eadaiLLrhQ8811nOoCfFBWdy/ZLzrBuva1acYQfmmy86MbRnesnoNbiPJ61gR
 oHB8XPK3CgBkDCHhgwiTjLdark6EZg8jMk6jSylwRU6NKrq7QTcBRPWwmdiDxOKvcAz2
 uO6Q==
X-Gm-Message-State: AOAM530BJZWPhhvKkRBq9cHiN5byxtXWD/i5ROIpZkli0IqseWa2iVjE
 BEmSAhQHYp/FIggj8uXvF/Q=
X-Google-Smtp-Source: ABdhPJweI7IfAgLslD4Frf7HDCFYzvL0uQdX/vG1LYIY5W0VxncHj0qUQM1xmu2O51jsKQSEPWjNsA==
X-Received: by 2002:adf:bc46:: with SMTP id a6mr19405967wrh.418.1615650110398; 
 Sat, 13 Mar 2021 07:41:50 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p17sm6400522wmq.47.2021.03.13.07.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 07:41:49 -0800 (PST)
Subject: Re: [PATCH 2/3] hw/gpio/avr_gpio.c: add tracing for read and writes
To: G S Niteesh Babu <niteesh.gs@gmail.com>, qemu-devel@nongnu.org
References: <20210311135539.10206-1-niteesh.gs@gmail.com>
 <20210311135539.10206-3-niteesh.gs@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <af1ba16c-e071-4fe2-f709-279cf586bc6a@amsat.org>
Date: Sat, 13 Mar 2021 16:41:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311135539.10206-3-niteesh.gs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: S.E.Harris@kent.ac.uk, mrolnik@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 2:55 PM, G S Niteesh Babu wrote:
> Added tracing for gpio read, write, and update output irq.
> 
> 1) trace_avr_gpio_update_ouput_irq
> 2) trace_avr_gpio_read
> 3) trace_avr_gpio_write
> 
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> ---
>  hw/gpio/avr_gpio.c   | 16 ++++++++++++----
>  hw/gpio/trace-events |  6 ++++++
>  2 files changed, 18 insertions(+), 4 deletions(-)

> +
> +# avr_gpio.c
> +avr_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
> +avr_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
> +avr_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64

^ unused?

> +avr_gpio_update_output_irq(int64_t line, int64_t value) "pin %" PRIi64 " value %" PRIi64
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E774164DFDC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 18:41:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5sDE-00089D-82; Thu, 15 Dec 2022 12:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5sDC-00088B-03
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:40:02 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5sD9-0008JW-98
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:40:01 -0500
Received: by mail-ej1-x634.google.com with SMTP id kw15so247676ejc.10
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 09:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xe+krIBFIc4XPIy5XjjwdSCtycXm9bxKSYGtNvwXeRw=;
 b=bIp0Cr2dQ1M6U9hfYv00ZMTt26bxQui1/dQmcTETTtwpuQ8GblGw7BokcO+nlnqx/9
 I3J++zYvJPJPN9WzlqX4CV8a3QpHLFucOdAU1jb3C3ejVNAFwcTw2i/jNvy2r/tJC3Cu
 lIehFytwM3EiMXke33qvL20Ekda5c/SiRg2TVAQxkhAHjUPdcMyBXnwfo7L62koyE4HZ
 VCR82R5/ZvAMpv+TEE2rejXBkJh2G1aNAs190s3FGIMBdcTtaB51urbykDlgiWsb+9Ih
 p0dzLApmgpO9Yvn+0siIV1z4rtHzqrpt7u2btPt33DtP9M5uo/5ErhKm1egOyRrrL+/R
 t56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xe+krIBFIc4XPIy5XjjwdSCtycXm9bxKSYGtNvwXeRw=;
 b=IKk55ixiOc5+DPcc667xNQU8pHzx5spazf7p7xcBfbb07YdnD3wozExBOLgOP7UkiD
 ZI7GwdqSHEZxD8mywVUqbZimj6wUi7jVKj3qBQFqOgGmGVGNJ1oPQets9R4TgYSzdPs4
 gz8ck0i+5vh9m2j9cY1FTbSeYTMa2UtcP4hquTNZGlAIHO+c2eA2aAcCTJ/REJVVtIl9
 RHc2aBLx4nK+7kfBa7B4JjJi08bzsPnbOReMuuogzdAVt9EuYXMQw2j/YzMrJZgHQXVu
 28BkFjAQ3BtySBCwO41Yxbh1qrCi1EMLI9fNqK+nXU9h3qIj+coDmu4xTtd3xMtWC+Hr
 YtJg==
X-Gm-Message-State: ANoB5pnlbUfvlqz2SZHmF/UYNzMslAiPq0mgQ9Sq91d8keTXxj4Dfyl4
 F/gQfauA5qNyjUFsMktvNzv9Vw==
X-Google-Smtp-Source: AA0mqf5rS1wY+i5idFi/F5bbi+dEkZeIQmP99zsq7GGs1G+cbMJuBrV1pK8rIa9Q/l5flFDvyU4lyg==
X-Received: by 2002:a17:907:765a:b0:7c0:e305:a282 with SMTP id
 kj26-20020a170907765a00b007c0e305a282mr24769383ejc.59.1671125996854; 
 Thu, 15 Dec 2022 09:39:56 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b007be886f0db5sm7180515ejn.209.2022.12.15.09.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 09:39:56 -0800 (PST)
Message-ID: <9789ca49-772e-1229-6777-916399bdac81@linaro.org>
Date: Thu, 15 Dec 2022 18:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH] includes: move tb_flush into its own header
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20221215140933.2337853-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221215140933.2337853-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/12/22 15:09, Alex Bennée wrote:
> This aids subsystems (like gdbstub) that want to trigger a flush
> without pulling target specific headers.
> 
> [AJB: RFC because this is part of a larger gdbstub series but I wanted
> to post for feedback in case anyone wants to suggest better naming].
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/exec-all.h     | 1 -
>   linux-user/user-internals.h | 1 +
>   accel/tcg/tb-maint.c        | 1 +
>   accel/tcg/translate-all.c   | 1 +
>   cpu.c                       | 1 +
>   gdbstub/gdbstub.c           | 1 +
>   hw/ppc/spapr_hcall.c        | 1 +
>   plugins/core.c              | 1 +
>   plugins/loader.c            | 2 +-
>   target/alpha/sys_helper.c   | 1 +
>   target/riscv/csr.c          | 1 +
>   11 files changed, 10 insertions(+), 2 deletions(-)

While playing there you might want to review a companion series:
https://lore.kernel.org/qemu-devel/20221209093649.43738-1-philmd@linaro.org/
"Restrict page_collection structure to system TB maintainance"


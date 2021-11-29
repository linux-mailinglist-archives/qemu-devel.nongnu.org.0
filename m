Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9764614D8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 13:15:06 +0100 (CET)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrfYn-000394-5f
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 07:15:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrfXD-0002KO-LZ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:13:29 -0500
Received: from [2a00:1450:4864:20::42b] (port=35329
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrfXC-0002e9-4Q
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:13:27 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i5so36324179wrb.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 04:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q2iLRW6/V9IC7Gx1sMGhj5oAqklwg0plEmvLNv8FcAM=;
 b=EnFXv3q9TgPIY2vT28EUhSa4gTOyY1BK+W6yHmxcilZELTY92L1MyEL1I6pRX6ZaAT
 RAqhkZ7SITXk1zrBY6+snFb2TFGkrqUu75GbCIad4sa2zm6DL6NkKLf75wsDcyUCH967
 huJQvP1Dmr+K12T9FgjZWoR7V9rq4vkwLvo7GcLffGAhkyLydJILViw6cQ0gDeJOTFHU
 53x3HdV2GA4XGdYDHurHr/nmkexef1Mw9zl3DHpBQP2QRoJcxlGYiIfULqtMx99mi6Z8
 N55OWKPr1HDknZ8TFRXI4pSqLmG1qagFk26a7TCrJdzhcTC9WD00A74p6o3PhrII0+0N
 PrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q2iLRW6/V9IC7Gx1sMGhj5oAqklwg0plEmvLNv8FcAM=;
 b=mwNTEgYK6JMExVT+ZeDpZ86g0fhZTkHSVSYCQm7DmsYgZt0MHhvrFpI5mgnF7DA21K
 g5O3YFVfS5j2PWQUrkPXpCoUIbMu0n/8gBy06fx2c2nih9YqDt2rsRzEQdgwSGayMREY
 lKZpHJXTXnUq31LiVSfkGCWh3/nB7imS0LCDRWaffzcolG4SvY6ihAL0FEQakZNY2IZv
 tDX+eB8pKaGoU0PveCsbQQJGjGPKXiaKACZ/tDclhL2ASYpgz5CfdfdFF1wUOPlXrxQ8
 lUec9pcHijcv11D+Zxvr2z8BM817GDva5tQC+Znm5FrwPsrn2VMRchJ0iZNihxsM0l4y
 rUtw==
X-Gm-Message-State: AOAM531eElBtEw7swvMUqPTLOh20CCq3lgKC2YsiJmex/XAzwWhx2Vba
 zSQGcX7Ga0tL8zLbsH9ksWvibg==
X-Google-Smtp-Source: ABdhPJyPVHB06K2aHBrwaVsXtq6Ww3f+cNh4qWMa+XtGSS060hfw7vUHcE6jD7/5BU0UiynTfltnMw==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr34612379wrp.226.1638188004502; 
 Mon, 29 Nov 2021 04:13:24 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id l22sm13840256wmp.34.2021.11.29.04.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 04:13:23 -0800 (PST)
Subject: Re: [PATCH v6 00/18] Adding partial support for 128-bit riscv target
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fceecbf-7424-3a0d-d350-fb677f6b1104@linaro.org>
Date: Mon, 29 Nov 2021 13:13:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/28/21 2:57 PM, Frédéric Pétrot wrote:
> This series of patches provides partial 128-bit support for the riscv
> target architecture, namely RVI and RVM, with minimal csr support.
> 
> Thanks again for the reviews and suggestions.
> 
> v6:
> - support for '-cpu rv128' in qemu-system-riscv64 to handle 128-bit
>    executables (no more qemu-system-riscv128)
> - remove useless (and buggy) big-endian support in lq/sq

This also fails make check.  With

   ../qemu/configure --enable-debug 
--target-list=riscv64-linux-user,riscv64-softmmu,riscv32-softmmu,riscv32-linux-user

watch qemu-iotest 040 fail.


r~


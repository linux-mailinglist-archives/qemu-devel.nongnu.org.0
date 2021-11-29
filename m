Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE44612E0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 11:48:48 +0100 (CET)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mreDH-00050Z-22
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 05:48:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mreBv-0003cX-Va
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:47:23 -0500
Received: from [2a00:1450:4864:20::32d] (port=40558
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mreBu-0006EA-60
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:47:23 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so16411666wmj.5
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 02:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o2wHHfe0vGINK7x8GzGCiuiv2CBDTcXn6oevB8Zcspw=;
 b=jqWOqOL+xzOlP34eio9WukXgsxmHbyXPdCj7g2tqgBepfWVfEkD+w0RXDNV3665hlo
 ijRWtm7Uxz1fpsdHKYRzp2cdtx5N5dQn8H/7flwUfsFw31gIsoa94ikdBd8zyz7ShRdr
 QPMUtKdqRMpF3o+93LgWktn03fx+fSpEydKUU3DojRdeoyspxuzMhF9LaO4c/vzl/HOT
 yBjtyl2lCbl5zkH26Txyh1QCRcZH9lPFQPdT57ZmQ9XIHYi+mue/QF9Bf5q6+RvujSu2
 BK00lMSKwGg6kmN4aJvZNAIZCcrV+pSR5ol8R2BiMGrkvlnmZ4INW/FPuCFV2nidLuyT
 T+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o2wHHfe0vGINK7x8GzGCiuiv2CBDTcXn6oevB8Zcspw=;
 b=mesZkf+OuCdhi90mNJppCU5De441IXZbsAQiKgkSuefUy7xGnvimlWFHHPFxUHgE+Y
 DCeM3vM4Mi+D3B3DB/Bj0si6UODyZwfJ3d+JOMJ3e108Uy88n4msl74prLOfLxClxod9
 s40x4PihG7o4BKzTtBM6X2U2QFt1iKUaQsL6DHQuMzKvtlhfteaSPQXVohUam1P3+lDI
 RTgyu+99iATgPN15QWZuoFdH8MMIum7vPX0TXUupsKA+RNZwjJ0QgEK1j6sXe6TKEqqY
 K92pbB3ld9ng0UwOXIEAi2Nahhv2/A0Miphf4BkCGSf7jV18jVAedEBGkpyvnIInBYIx
 FMaQ==
X-Gm-Message-State: AOAM530vZ5GACSskUkTuYzaxLEVjnxnsZZldz/ZP6fr2etVRiwLu/kEO
 wyifIyt8mzD0xdig33JX7wS0oA==
X-Google-Smtp-Source: ABdhPJx11muBPrqqSGxD/YWpctvnkMx75uWVjbParE+Xy3unb3B1w0nA9m6OrQP6EsQl8HS0niNLZA==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr35002939wml.148.1638182840771; 
 Mon, 29 Nov 2021 02:47:20 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id k37sm16236627wms.21.2021.11.29.02.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 02:47:20 -0800 (PST)
Subject: Re: [PATCH v6 00/18] Adding partial support for 128-bit riscv target
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd23bbf0-fef2-4665-4e70-820b1b787f46@linaro.org>
Date: Mon, 29 Nov 2021 11:47:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

It seems like you haven't tested this with linux-user?
There are build problems:

In file included from /home/rth/qemu/qemu/include/semihosting/console.h:12,
                  from ../qemu/linux-user/semihost.c:14:
../qemu/target/riscv/cpu.h:485:33: error: unknown type name ‘Int128’
   485 |                                 Int128 *ret_value,
       |                                 ^~~~~~
../qemu/target/riscv/cpu.h:486:33: error: unknown type name ‘Int128’
   486 |                                 Int128 new_value, Int128 write_mask);
       |                                 ^~~~~~
../qemu/target/riscv/cpu.h:486:51: error: unknown type name ‘Int128’
   486 |                                 Int128 new_value, Int128 write_mask);
       |                                                   ^~~~~~
../qemu/target/riscv/cpu.h:489:48: error: unknown type name ‘Int128’
   489 |                                                Int128 *ret_value);
       |                                                ^~~~~~
../qemu/target/riscv/cpu.h:491:46: error: unknown type name ‘Int128’
   491 |                                              Int128 new_value);
       |                                              ^~~~~~
../qemu/target/riscv/cpu.h:499:5: error: unknown type name ‘riscv_csr_read128_fn’
   499 |     riscv_csr_read128_fn read128;
       |     ^~~~~~~~~~~~~~~~~~~~
../qemu/target/riscv/cpu.h:500:5: error: unknown type name ‘riscv_csr_write128_fn’
   500 |     riscv_csr_write128_fn write128;
       |     ^~~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.


r~


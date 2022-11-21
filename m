Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AE1633070
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 00:00:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFkz-0002k9-Iv; Mon, 21 Nov 2022 17:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFkw-0002jy-Si
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:59:14 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFkv-0006hY-Ch
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:59:14 -0500
Received: by mail-wr1-x429.google.com with SMTP id x5so18087818wrt.7
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 14:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kC7VnBud9bJiC2Wsyk+RXwFzYFJ4EX1BakMMdA/fwzE=;
 b=CT/+izGZZWKQvWBzM635pFNIlYe0IenxzKY9FfJY/4+DMPxEQ4o3G2zqYuuykAFgVF
 EmysWFri0F1Gp8o/KGTHQyJ8s5MSl+SQ31nv4oP3bqB8nW0niSnrY/L6nE/QLlBj07Bg
 DrhexJliIBEmS7/SToPBGGhyw14RiyXdbx8PDVzM664uhl8S00tsc7v8sK77OgoNgGu1
 TdGKT1JQLWROSeIEEbeH8cuNN8V4rz+bycyGOrIWTBJgYOkdNpxq2Y0vjEIoQacPVhPf
 maEWZyoBKibjEO2SrApTvPw91rZ+6pkQcnM0GiM5dASj7GZ/CjeWoNLzYnZfYQ74v5cn
 fs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kC7VnBud9bJiC2Wsyk+RXwFzYFJ4EX1BakMMdA/fwzE=;
 b=hnBIKN2zy+24gTDJRVZEr6GAFSJrl5DIvkswMN9rLIQeijkmWCRbv1dTSFPgopYNAG
 O8b0eiPskPoXkX54K/5V2XYsrKFANgL9pwsVCnL+tO6ip/YcnQUFLuLc83bl+O8LnJft
 yVIqVGSKxh8FTCbBT/sRLapiGj5X9P5xjeJYaPPqH3e5IY2FdIHHqIgilQFA9AtLgBhc
 qZIvhxrQNRqf2S9zqF5awYzPRh7SeslNR4YPn4Q/n62m2fxT2FLIShvIRp4monzEBVGY
 oJ+7zm4xmqahDI9uGx6ESXkMVt3FqX6OpGfGHQruuTqBa8rqlxXPG9W9mppLuDzo5dvW
 w5qA==
X-Gm-Message-State: ANoB5pma9+zisTbLQzrh97I+ex7FOr7nldI9+tzce0eEHslqYOmt8DFo
 g52lw5Glo5Ho8Wq+A0e3Xsz9Yg==
X-Google-Smtp-Source: AA0mqf7c6RnooPyb0JCm5IgOHeh5UgjZfbOwDHgMbQTebzIPLdknbGL8K/l5hH2JnHq6oqsoedcHlw==
X-Received: by 2002:adf:ebce:0:b0:22e:4acd:cc89 with SMTP id
 v14-20020adfebce000000b0022e4acdcc89mr13399944wrn.76.1669071551861; 
 Mon, 21 Nov 2022 14:59:11 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k7-20020adff287000000b00241de5be3f0sm1676080wro.37.2022.11.21.14.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 14:59:11 -0800 (PST)
Message-ID: <67897e39-2dc9-9b80-91c3-78fc27313187@linaro.org>
Date: Mon, 21 Nov 2022 23:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 20/29] tcg: Add INDEX_op_qemu_{ld,st}_i128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-21-richard.henderson@linaro.org>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> Add opcodes for backend support for 128-bit memory operations.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-opc.h        |  8 +++++
>   tcg/aarch64/tcg-target.h     |  2 ++
>   tcg/arm/tcg-target.h         |  2 ++
>   tcg/i386/tcg-target.h        |  2 ++
>   tcg/loongarch64/tcg-target.h |  2 ++
>   tcg/mips/tcg-target.h        |  2 ++
>   tcg/ppc/tcg-target.h         |  2 ++
>   tcg/riscv/tcg-target.h       |  2 ++
>   tcg/s390x/tcg-target.h       |  2 ++
>   tcg/sparc64/tcg-target.h     |  2 ++
>   tcg/tci/tcg-target.h         |  2 ++
>   tcg/tcg-op.c                 | 67 ++++++++++++++++++++++++++++++++----
>   tcg/tcg.c                    |  4 +++
>   tcg/README                   | 10 ++++--
>   14 files changed, 100 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



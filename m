Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9C42BC1DD
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:00:19 +0100 (CET)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZ3S-00032v-MC
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYzg-0007rK-56
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:56:24 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYzd-0000Ly-Rw
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:56:23 -0500
Received: by mail-pg1-x543.google.com with SMTP id q34so10440945pgb.11
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 11:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jDfENbgj/mH8NqbFF/2YjYWSw9fsP7N4wANXpYrSffk=;
 b=allRbpQ1FDxMq62S2wVe0A9giy4vg5wfOVFtjDsKGXhNBjKjZf0Pcn4J2nzUWUwWtf
 B7GABGmWJmc1Unmv81ZUH8jLHpd1iywNbTtfu/c41TGMEDLO04GsBaT6CVLBwkDnQOkA
 kwUZ9oXUGW2NPcrwVgbQ3CLBfKCTQFw0SMx/r5UCRKuUNUJBh+zj7QquRgWt2MZANexa
 BZ1xk+ECS5o6ARYA5GSI3vkPRr6kGqHdQgiBRjRsgPxvFEPvyM4RTcF84cZTwyGPQfps
 tCqCN3u2FWeNb78Ln4q9YnM4WKVjT0SmWUkts2bAc59mr+F85iHjUrsa1VeJCNS5cBd8
 VSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jDfENbgj/mH8NqbFF/2YjYWSw9fsP7N4wANXpYrSffk=;
 b=rxYIdNboyhreIrXQ5LuvvaOC6Ge0Tlpd1l9ssHjF39J4DOYuidjWboZRyD5Qmq5RLu
 3nwG+XOqDaxAWJDfJMwryruBlZ+Y7W3UarzPNy6zypN1i/JeLyDbNu5xzTZ/L4Ce4Wvl
 xd67iZQOkoP0RBu+tu2Iw6gRkp1k6pW3zFLdpqdBqDmn+tp9vN973rMG0RgT6m+J65HI
 y8q3t5ky1xQge8hgJMhYsv64c7b4WjraOtcLHyPE09uJf2LkISrvS+426toiu2Q8r3YE
 HrQE8Ez1kLi8rskd9S0dZsmE6pO3BHH6uuvpuy3t0xP7onvaebDmZGekIiLIU70pVaZv
 zD8A==
X-Gm-Message-State: AOAM531/x5+wnSIQR3ZgV85Cracyi6mRBsFjwIDxBQ6FgCM/x5eTOJRZ
 grroH6E9JATxLOdTxAEEI+OENg==
X-Google-Smtp-Source: ABdhPJxHXN7gTzypH9EAyWSSA0Q8VVdtossxMcwj1e16Q7ssx0sgxUBwoPDXbCksEJCjZiX1Hwyhgw==
X-Received: by 2002:a63:1c4e:: with SMTP id c14mr22490829pgm.334.1605988580499; 
 Sat, 21 Nov 2020 11:56:20 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u24sm7683860pfm.51.2020.11.21.11.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 11:56:19 -0800 (PST)
Subject: Re: [PATCH 09/26] target/mips: Extract Code Compaction ASE
 translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <829b6af9-57ee-025d-c6bd-37d24f971da0@linaro.org>
Date: Sat, 21 Nov 2020 11:56:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract 1200 lines from the huge translate.c to a new file,
> 'ase-mips16e_translate.c.inc'. As there are too many inter-
> dependencies we don't compile it as another object, but
> keep including it in the big translate.o. We gain in code
> maintainability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                 | 1161 +---------------------
>  target/mips/ase-mips16e_translate.c.inc | 1170 +++++++++++++++++++++++
>  2 files changed, 1171 insertions(+), 1160 deletions(-)
>  create mode 100644 target/mips/ase-mips16e_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



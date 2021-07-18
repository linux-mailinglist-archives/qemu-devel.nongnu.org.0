Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CE43CC81D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:52:05 +0200 (CEST)
Received: from localhost ([::1]:57454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51am-0002Hx-M5
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51ZX-0001KT-Lp
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:50:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51ZW-0004a5-9r
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:50:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id l6so8393341wmq.0
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/LapZx15Zm69MlGIjLn1+8i9KGSKWnmNEl842OZFMS8=;
 b=XswNkCU0W/rkAd561jUhcAAaDA2LXvKwyhbKplvetTQlJnJq2prq6oS35kPSWKhw5G
 VmtgkFJwZf9bSN+NtX8TciQfrCmkQb1AUOEMR0sperLe9aVDGaAdSHGlOQlUIiqBaWZZ
 Y6fuUr0ZvHVfwXpPTeytjtjhNRfV1/ujq5af28g1fjiwZr3ov3WjCb86ZX/FdQW10j24
 6rZ/QTFB9aD7oOQcfUW13cvaGW0yw7RefGIKvaak/nKTNB0SvSBf9xLjITYMfQheiekB
 R10Q9UCaEr7eL6Us/O0Rr0DMqApbzUwPUcY1OuDm+11j/MEAD2eODS4FjDr8KBmp+0Oa
 aT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/LapZx15Zm69MlGIjLn1+8i9KGSKWnmNEl842OZFMS8=;
 b=PoA9LVGPmVgsPDT08EdOUoU/sevrc+uUHyppn095BXtarXn953VF420Uku3aCDCirr
 xuaRmVxm5JlF0oAED6sz0Wb2mHGpJB/597vsMDmoHpPSgdxwaCgUtQTUAwqtqDPYJlSl
 JH+Nb0mk57R2Q2KYZRc/55oof0XR3nNUFWIXRs72lSFfwjgPFuXvtDcbkfENB1dF9O4W
 yx7ExLWMBLTlUgEhJ6/MHv7zitZv2FaizCO5Etre1fnAUfyTgo3OP/5h+04f0Cp2XfvI
 AFT8tDA0vJxkGEHnY5M0ZaQ0T9ZAhrQ4bB57NS1tdOWjO0Mhj63mwUk8QtAgBObqYbu/
 +9gA==
X-Gm-Message-State: AOAM530wuku6MkdNJIEOrcx3cf2rnAOMaM/WrSSobv2vcJh/wfMYnH7V
 bprAb/LsL1+IsuGeVpunuU0=
X-Google-Smtp-Source: ABdhPJyzMyKuDBEZ8iOMDZZYWhxfJNx2QgBDXdt8L6dOJwjxo0XruH16ijhdquZH8QipE5gfXphxqA==
X-Received: by 2002:a05:600c:3799:: with SMTP id
 o25mr26137305wmr.63.1626594644771; 
 Sun, 18 Jul 2021 00:50:44 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id f13sm17201454wrt.86.2021.07.18.00.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 00:50:44 -0700 (PDT)
Subject: Re: [PATCH for-6.2 08/10] linux-user: Don't include gdbstub.h in
 qemu.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210717232103.18047-1-peter.maydell@linaro.org>
 <20210717232103.18047-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4aa02565-5495-6581-fac9-9e1cde08ee28@amsat.org>
Date: Sun, 18 Jul 2021 09:50:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717232103.18047-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 1:21 AM, Peter Maydell wrote:
> Currently the linux-user qemu.h pulls in gdbstub.h. There's no real reason
> why it should do this; include it directly from the C files which require
> it, and drop the include line in qemu.h.
> 
> (Note that several of the C files previously relying on this indirect
> include were going out of their way to only include gdbstub.h conditionally
> on not CONFIG_USER_ONLY!)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/qemu.h             | 1 -
>  gdbstub.c                     | 2 +-
>  linux-user/exit.c             | 1 +
>  linux-user/main.c             | 1 +
>  linux-user/signal.c           | 2 ++
>  semihosting/arm-compat-semi.c | 2 +-
>  target/m68k/m68k-semi.c       | 2 +-
>  target/nios2/nios2-semi.c     | 2 +-
>  8 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


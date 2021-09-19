Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53704410CC1
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 19:58:05 +0200 (CEST)
Received: from localhost ([::1]:41044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS14m-00077Q-DK
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 13:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS13Y-0005iN-GE
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 13:56:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS13L-0002rL-9l
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 13:56:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id t8so17525866wri.1
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 10:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qOCTwxHXRxyyjRzkN9VdMCKOlI3nOcYtt3rUBAXney4=;
 b=T6GvVdkME0TTKrfVHnHtB4+ULhaojy2iRDph+RoHE88IPsOiXUwyEJoPcmfRI+4HIQ
 TAhNoBQ1xGE/odN5FlS8lgJXGRHdx/VKGDRHubbdvREd2tpr/4KWb01V8C3dfgH51N4P
 /0FXlp16+CZUhTMkY6XJ4AS/4ytuzWMtCBOzvwVoDxqfBdqhzsni55iqR6Fa/BzjO0RA
 Km98jVDkOQ5/V5aR3/Pj4HF/a3w1KQCeVW3REiQuhQiw3zYsBvFkHKfKnjdDQJU4nHdw
 cjIRdWjGC58JpMK5Nlpn7wQ/YpyUBQFvbTV1imnRgJbYioI5uXH6yfO9r+Zdbg8eqrqQ
 ZtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qOCTwxHXRxyyjRzkN9VdMCKOlI3nOcYtt3rUBAXney4=;
 b=s2AG+t48af446m0uxLTTaHTMSN4d102uS5h4ncZaD9kb8xkU6AGAL3IpjfwFunZCiR
 4W4oRqRAT7ftyqf0qaLVMg1/Z8mq7FUrKIOUmLsOyzM/9tH6eJaSImvVwi9zu+HMxnPj
 OBlTVURFmOnvBV7rg7bTJ9oC2D2lPdfFgMEjS02IhwPAJP2UWAmUZiqpqg5iYSSTGC16
 z1+InEfCtCvP/LuhP/ck9vKK+XeBvcM7P+r5Vo7JZtMKn+498zRq+XsYHBOcZZu2ehBV
 7BYwXoxZN5nQhFZ/8FOkSqiqo8w0TMamigEC2Da2ImSzQyqaca8bbsP6bKJCp858FWUL
 MB+w==
X-Gm-Message-State: AOAM530/2H00iCi0+qkCQWxft4MAhO9UfOJBPgrz4eM9G0lRRmwJWuW/
 +5oARYBZebGw1+sL80Q5U1o=
X-Google-Smtp-Source: ABdhPJxcsrSY+Y4ps3PjhivB6ryVZ6lqJ6At5BHXMXcmAswQK9OY4YH7ZQNDE9ErM9Klzj+NO9OlXg==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr17806628wri.205.1632074193691; 
 Sun, 19 Sep 2021 10:56:33 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id y8sm13100133wrh.44.2021.09.19.10.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 10:56:33 -0700 (PDT)
Message-ID: <bd42bfcc-c3d8-9020-cc66-1877f8e2d6f4@amsat.org>
Date: Sun, 19 Sep 2021 19:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 05/41] configure: Merge riscv32 and riscv64 host
 architectures
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 20:44, Richard Henderson wrote:
> The existing code for safe-syscall.inc.S will compile
> without change for riscv32 and riscv64.  We may also
> drop the meson.build stanza that merges them for tcg/.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure                                             |  8 ++------
>  meson.build                                           |  4 +---
>  linux-user/host/{riscv64 => riscv}/hostdep.h          |  4 ++--
>  linux-user/host/riscv32/hostdep.h                     | 11 -----------
>  linux-user/host/{riscv64 => riscv}/safe-syscall.inc.S |  0
>  5 files changed, 5 insertions(+), 22 deletions(-)
>  rename linux-user/host/{riscv64 => riscv}/hostdep.h (94%)
>  delete mode 100644 linux-user/host/riscv32/hostdep.h
>  rename linux-user/host/{riscv64 => riscv}/safe-syscall.inc.S (100%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


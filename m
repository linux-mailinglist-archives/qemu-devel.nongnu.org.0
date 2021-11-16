Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D167452CEA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 09:35:05 +0100 (CET)
Received: from localhost ([::1]:34834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmtvj-0007zR-N1
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 03:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmtuH-0007HH-E3
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:33:33 -0500
Received: from [2a00:1450:4864:20::42b] (port=35750
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmtuF-0006zh-An
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 03:33:32 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i5so35972294wrb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 00:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QqkhP7/evjy/Fupn+XEll4GV/E/8qu2w6epmppAsX3Q=;
 b=F39vVH1DdNTM4gDxVHP/tQv3H6VxPv6wn0Y2mOQCNEWNxuHLZYBQ0JRAD6tTpObsmL
 gwH4XYY5zgQPbX0J4ySRbHdMi+cJ4Rs1imo4cHYdPou57moavUASZpeofLk6kaz483In
 FId+E3n9jX7oLiUDX1SACpbhY+70R3hnTBdbc6g5M33gogjHPbztwcJRDAfHIad+0tto
 rhxhpIWIfyDIqK7WDkFZkpM4eVlu5aoa4wnUFkVc6bGm4/f1RIrPpOvnTPjDX1MV4/wX
 d1QrCPL0oTE1q5eY8+MWROYHZ1r9UCuivCEjKDwCI2Q0vlkwCZPl59bZhZzrYPiF3I9u
 eeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QqkhP7/evjy/Fupn+XEll4GV/E/8qu2w6epmppAsX3Q=;
 b=YIsIJovTmJGdNh2zN0hy96dWdOsHSbdTW+UhS8CaKZ6/nkxx0gqoShQvfz+Ok9N3z/
 RM2CtpZeAPYjBKK2js5ZdhznSYBa3b0DEMO+gq5H5LQFC1TF8hxgn7jN71SvKl79RUWy
 acOdrWaUDuiJeejdlfPDtBe+gjGcl0rOKQ7TSXoFZrhRUOfPLSWrX32F1TGGqpzwKn08
 f1iYAHmRNyYu/qYQwSp6EbLrLjRsgSuRjNjhaPgCorQd/renGktmZ6OjP6byoDIGBRfB
 6C9iOgOsxbbcAbeF36TvDxpISql1WtXngdQp2XUNZnu9FtIeXyqAhMGf6BGz+J2bV0TJ
 xJQQ==
X-Gm-Message-State: AOAM530HJr+EGf35VNmsTrBj+YvKXT4Iux2jAu2mFFqizvTPK86BQhUR
 0Q0qofSoWgNhB5LI00GYQSA=
X-Google-Smtp-Source: ABdhPJzQ5nP29lg2jaiMy6tVmtTsVxSe/4DSQjTuxKJhvs2w2g70QEwE9KtrYpNQaHhGV9dhgTcBxA==
X-Received: by 2002:a5d:4e0f:: with SMTP id p15mr7298060wrt.48.1637051609598; 
 Tue, 16 Nov 2021 00:33:29 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h2sm16574074wrz.23.2021.11.16.00.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 00:33:29 -0800 (PST)
Message-ID: <a9eaf4a6-4b2e-51c5-67d6-46210fef03c3@amsat.org>
Date: Tue, 16 Nov 2021 09:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 17/26] linux-user: Add LoongArch generic header files
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-18-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1636700049-24381-18-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 11/12/21 07:54, Song Gao wrote:
> This includes:
> - sockbits.h
> - target_errno_defs.h
> - target_fcntl.h
> - termbits.h
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>  linux-user/loongarch64/sockbits.h          | 1 +
>  linux-user/loongarch64/target_errno_defs.h | 7 +++++++
>  linux-user/loongarch64/target_fcntl.h      | 6 ++++++
>  linux-user/loongarch64/termbits.h          | 1 +
>  4 files changed, 15 insertions(+)
>  create mode 100644 linux-user/loongarch64/sockbits.h
>  create mode 100644 linux-user/loongarch64/target_errno_defs.h
>  create mode 100644 linux-user/loongarch64/target_fcntl.h
>  create mode 100644 linux-user/loongarch64/termbits.h
> 
> diff --git a/linux-user/loongarch64/sockbits.h b/linux-user/loongarch64/sockbits.h
> new file mode 100644
> index 0000000..0e4c8f0
> --- /dev/null
> +++ b/linux-user/loongarch64/sockbits.h
> @@ -0,0 +1 @@

Why not guarding the header here, ...

> +#include "../generic/sockbits.h"
> diff --git a/linux-user/loongarch64/target_errno_defs.h b/linux-user/loongarch64/target_errno_defs.h
> new file mode 100644
> index 0000000..17165c1
> --- /dev/null
> +++ b/linux-user/loongarch64/target_errno_defs.h
> @@ -0,0 +1,7 @@
> +#ifndef LOONGARCH_TARGET_ERRNO_DEFS_H
> +#define LOONGARCH_TARGET_ERRNO_DEFS_H

... but guard this one?

> +
> +/* Target uses generic errno */
> +#include "../generic/target_errno_defs.h"
> +
> +#endif

New files require a license. I'd recommend adding a SPDX
tag in the first line. For example with GPLv2+:

/* SPDX-License-Identifier: GPL-2.0-or-later */


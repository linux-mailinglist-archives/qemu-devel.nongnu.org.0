Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96046320131
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:10:04 +0100 (CET)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDyN-0007G9-KX
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDDup-0004Ig-0e
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:06:23 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDDum-0007sp-9Q
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:06:22 -0500
Received: by mail-ed1-x52f.google.com with SMTP id n1so12353245edv.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 14:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OcbhwhPBpERF6ZKdYyuJ1XSsBu/RsexZ84p8zsfYwQ8=;
 b=sXVwIj+Dcbub+PAj2pe/olrBMVTsTvRiBwgIiq5ITsmyOEzIahHDPQEE2zcv4i1uzg
 2MbEyusxZYDzzA1nYGhIXiEvsUeJOFJaGpnk/9AFpy00gr+9EWTsI7OfKfwVpuVE1GsM
 Qt1g4adbn2VwTQlwmHGkOE7YtC0csTei1T6yzxj9VkAeUok5mGszPDT7v5685Yo6k1gI
 BFbBagF3Rj++SUAJFF0bjJiugJHpqjcaQhQ8N10sNhUnXQEye9OzNHxwBwmRFqKLDEoO
 Mbp17CITnxyuFLuxOsGGBrVRjRJxQggFwQeaTto+QcM5Rw3eM1bAJfa4ldpqANEW5Vww
 TvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OcbhwhPBpERF6ZKdYyuJ1XSsBu/RsexZ84p8zsfYwQ8=;
 b=DdgfT5q2HcSbr29/Ap1lzK1Pr8vkgs8er7zWNvMNucIlNnqZAlBr+eHWXa6fHmCx9n
 RrZDcwdKuKwaZwKfbEfVjPA+Mo4DM30nSgU49nReenJbSs1MvkDMw34T4/z/8zhqg1zr
 LIQsk1amttYBlf6Af3VRu8bXi0aHPINGWv+iYXAH/qvZn+sVAVF6IrX9KMPc4XOqJWJn
 TEM6z/D/O4sN/HLV4dzsEtfwulQ/8IZ7bfoOZPj3OyRKTrwgabz9gseuFHKIznxCLajn
 VxDZmLMQON3i9DnWmCqeMx/UQPPaQlvACjhrVc5qx2ZPC5aZVV88XwRCfl0CcdftOEhy
 5kHA==
X-Gm-Message-State: AOAM531/9oX6LCXxA7O9PPs+FochuJAytaPNZtvRjUM9tOKF5c2R0rrZ
 FXnUG3hiTtxnuTUyNyX0/Vo=
X-Google-Smtp-Source: ABdhPJzfzocCb4uo6ZFPWCDSLcLd1+1oC7G1CigjaC00S4yc/SsKoa808FKrDlC5lJwPw63JhDgJug==
X-Received: by 2002:a50:d90a:: with SMTP id t10mr11597630edj.162.1613772378724; 
 Fri, 19 Feb 2021 14:06:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id qx17sm5180779ejb.85.2021.02.19.14.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 14:06:18 -0800 (PST)
Subject: Re: [RFC PATCH 3/5] tests: add a sdhci reproducer
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210218211224.2513413-1-alxndr@bu.edu>
 <20210218211224.2513413-4-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <79517851-a131-14bc-3947-629fa3e098fa@amsat.org>
Date: Fri, 19 Feb 2021 23:06:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218211224.2513413-4-alxndr@bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 10:12 PM, Alexander Bulekov wrote:
> This patch serves as an example of a file generated with the
> ./scripts/oss-fuzz/output_reproducer.py script:
> The source file in this patch was generated like this:
> 
> $ wget https://paste.debian.net/plain/118513 -O /tmp/trace
> $ export QEMU_ARGS="-nographic -machine accel=qtest -m 512M \
> -nodefaults -device sdhci-pci,sd-spec-version=3 -drive \
> if=sd,index=0,file=null-co://,format=raw,id=mydrive \
> -device sd-card,drive=mydrive -qtest stdio"
> $ export QEMU_PATH=./qemu-system-i386
> $ ./scripts/oss-fuzz/output_reproducer.py \
> -owner "Alexander Bulekov <alxndr@bu.edu>" /tmp/trace | \
> clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4, \
> ColumnLimit: 90, BreakBeforeBraces: Linux}" > ../tests/qtest/fuzz-sdhci.c
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz-sdhci.c | 90 ++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build  |  2 +
>  2 files changed, 92 insertions(+)
>  create mode 100644 tests/qtest/fuzz-sdhci.c
...

> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c83bc211b6..97caf84443 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -56,6 +56,8 @@ qtests_i386 = \
>     'rtc-test',
>     'i440fx-test',
>     'fuzz-test',
> +   'fuzz-sdhci',
> +   'sdhci-test',

This line ^ belongs to the next patch.

>     'fw_cfg-test',
>     'device-plug-test',
>     'drive_del-test',
> 


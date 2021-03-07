Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D1330440
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 20:26:18 +0100 (CET)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIz2f-0003UW-BO
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 14:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIz0c-0002su-8W
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 14:24:10 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIz0a-0006gC-Gn
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 14:24:10 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h98so9124053wrh.11
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 11:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/0LELbHdRk9R+YdgeVx27Hw+aget/zqKYPCE4fXBiC8=;
 b=sFkFo9veClzfhBfLIu6fsCGgDZw4dlDkHIS0p35r2p61MN7Adl9/Z3MpgNt3rxxoUM
 LcbsbdU7cEEc0XpfvNK5ZhAHpNB+tBBLgZfqOCiZ+rsoD0ch+ANA8y5K6ohxPSSDBfeK
 uvsVD9fSXqEL8xnE/+68h5pUSCSb/RApD7PtJtZhYVdoiU7g3/hM9OhCcDG0KwfmSmRK
 cyIwmI/5CJcf2TD3kpW1ZkpuUUSmGjSN09KSYYsAMnAcbHzTwYzs5NTbBID6w7EdjcU/
 WxgcDH1/QI/TWPaK5Xide4XKujHD0SJEYz9uqoQy3V2ycnraY08wiEZ0BarBAns19iJK
 Xr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/0LELbHdRk9R+YdgeVx27Hw+aget/zqKYPCE4fXBiC8=;
 b=SVOY/68nEWm3bXyW8ZLDaoe9uXQ0g219+PmFNOaDRXPqrcNX6fdS5zthOCzrDL9FrO
 TrYoj1jd8x/C5cz8lMtFjtifsd8bii2t6ySPk5x5Jhu5SrF8vsM/rv6DaQpDtfXk+mN1
 El5SWvf9Dt08xSG2sQMY+7wJ9Xbqar5xEnMGV1IXNGmk8GdHpI+Sqe0QxYpN5EJbSoK5
 p02TT2BAw8aXHVnkKcvWhmESKwxrPANoqUmsQUyzABiv+x/E5HV3v/0y3WXwrXOhAI6Z
 UhFie9nH1PXyP2ITcyboHryrv0ltpe8/FPtrDI6LMI4rdw6oBtkMul2bdjtGihRIFZCa
 HxCw==
X-Gm-Message-State: AOAM530v4jTfh0oQ4Z3CWYTfVF0n7JWyRHHvOC64sRfkSCKw+d5TAtcG
 eVEEX4SlMK1NVQSA8czt+iU=
X-Google-Smtp-Source: ABdhPJxhictYulbB0Zm3QTSpCwimywkAoUtpuCu0cI4jbNj9lsIpqL2jbR5b1X3Ko/R7rvpdzTkfxA==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr19846865wrp.112.1615145046745; 
 Sun, 07 Mar 2021 11:24:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 36sm15510794wrh.94.2021.03.07.11.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 11:24:05 -0800 (PST)
Subject: Re: [PATCH v4 1/5] char: add goldfish-tty
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210307164828.87348-1-laurent@vivier.eu>
 <20210307164828.87348-2-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6909cb99-6058-472e-bfa2-62172c448b1d@amsat.org>
Date: Sun, 7 Mar 2021 20:24:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307164828.87348-2-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/21 5:48 PM, Laurent Vivier wrote:
> Implement the goldfish tty device as defined in
> 
> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
> 
> and based on the kernel driver code:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/hw/char/goldfish_tty.h |  35 +++++
>  hw/char/goldfish_tty.c         | 272 +++++++++++++++++++++++++++++++++
>  hw/char/Kconfig                |   3 +
>  hw/char/meson.build            |   2 +
>  hw/char/trace-events           |  10 ++
>  5 files changed, 322 insertions(+)
>  create mode 100644 include/hw/char/goldfish_tty.h
>  create mode 100644 hw/char/goldfish_tty.c

> +static void goldfish_tty_write(void *opaque, hwaddr addr,
> +                               uint64_t value, unsigned size)
> +{
> +    GoldfishTTYState *s = opaque;
> +    unsigned char c;
> +
> +    trace_goldfish_tty_write(s, addr, size, value);
> +
> +    switch (addr) {
> +    case REG_PUT_CHAR:
> +        c = value;
> +        qemu_chr_fe_write_all(&s->chr, &c, sizeof(c));

No IRQ here described in the spec... So this is correct.

> +        break;
> +    case REG_CMD:
> +        goldfish_tty_cmd(s, value);
> +        break;
> +    case REG_DATA_PTR:
> +        s->data_ptr = value;
> +        break;
> +    case REG_DATA_PTR_HIGH:
> +        s->data_ptr = (value << 32) | (uint32_t)s->data_ptr;

Matter of taste, I find it easier to review as:

           s->data_ptr = deposit64(s->data_ptr, value, 32, 32);

The spec says this register is only available on 64-bit targets.

Should we restrict this "#if TARGET_LONG_SIZE == 8"?
else log_mask(GUEST_ERROR)...

This seems overkill to me but that would respect the spec.

> +        break;
> +    case REG_DATA_LEN:
> +        s->data_len = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
> +                      __func__, addr);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps goldfish_tty_ops = {
> +    .read = goldfish_tty_read,
> +    .write = goldfish_tty_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.max_access_size = 4,

Again, I think you also want:

       .impl.min_access_size = 4,

> +    .impl.max_access_size = 4,
> +};

With min_access_size:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


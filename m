Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085B9301907
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 01:15:49 +0100 (CET)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3T4G-0003Fi-31
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 19:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3T2S-0002oS-3A
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:13:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3T2Q-0000Ys-Ej
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:13:55 -0500
Received: by mail-wr1-x434.google.com with SMTP id 6so8682542wri.3
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 16:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jH+7H+LOhejsuizCt23crmvlEGtVVQlD3T/cEEYU1aM=;
 b=EHqtPFU/lMYC+3n2juaaDk764TDjWA5gFLwduAk7Fm6hqKT4trVFIcQ07sNN8kQ3zc
 57/PWE/65uZ0sisEXmYPo9THqGgZNKvauGC+oH+PToU8KCsrJdlHXc3ORpmw1e3enAAa
 OKNUvVBIyfkmYEZ1T9cmbECX566CzM4ShuY1qp1ZRKYhYSg583BBjRitFxXSu7yjbMQW
 Ie7hndrk940b/i9FuTakLzQcTuSIWEH4blmXQ5qO46/c2W4c4nw8nT5vccJ/ONKOxsk2
 F4qxc1XKax+bqj8/ImN2luI/XFnJ9/gBHXrT+AVcHJOEBO9burgBEWicsNQuNwvKCVDz
 YAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jH+7H+LOhejsuizCt23crmvlEGtVVQlD3T/cEEYU1aM=;
 b=Wbb9EDIvjtrU0FFltHOUlaXy58LYEE96r+9CFE5vFf6fhF8oSPmGLaS/KJ4XrhAHTm
 EjlcaPa6onr8LtCvZwEn71eXAvf6/Z++WYw08W+4Sa93bb6gxvrheosxT0MzunnzDKEw
 hauJdNevFN/CSjbhq57PTMNIJ5lh21V1H0mKA6s+qpV1YDgv4xXqeUJcxJZoGXwu5+rc
 hCD6TW8hZUMOvVCry3xZxd4wlY5ZUPEWknzLqyEnh4S3Opz4x4fFTbaLXvXLHN4YfKII
 Li6y9JRkiU6ekdY+SnywsKP91H88dOURmLhwBLre6GKHIs/AReCEojs+Tf9roFTSDwFq
 X5hQ==
X-Gm-Message-State: AOAM532PP0AfkIlrSmiz/JrLWxSYyEAS+A2zOHZjh3EvSXdR0sMg02zt
 pkLbDAZVpQ4EeQq/+wK48YIy5Nck4U8=
X-Google-Smtp-Source: ABdhPJzbUCsJ1KYQtw9DBUcpdbi82AjHFYdAXDK6zQwldBh7n3awPvHNBZElW3GeUQ4mgrtyHm3nOQ==
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr294001wru.315.1611447232638; 
 Sat, 23 Jan 2021 16:13:52 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id 17sm15416282wmk.48.2021.01.23.16.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 16:13:51 -0800 (PST)
Subject: Re: [PATCH v2 2/7] char: add goldfish-tty
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-3-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ff85836c-6168-c6fb-174b-3bc083811c30@amsat.org>
Date: Sun, 24 Jan 2021 01:13:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201220112615.933036-3-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/20 12:26 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/hw/char/goldfish_tty.h |  36 +++++
>  hw/char/goldfish_tty.c         | 266 +++++++++++++++++++++++++++++++++
>  hw/char/Kconfig                |   3 +
>  hw/char/meson.build            |   2 +
>  hw/char/trace-events           |   9 ++
>  5 files changed, 316 insertions(+)
>  create mode 100644 include/hw/char/goldfish_tty.h
>  create mode 100644 hw/char/goldfish_tty.c
...

> +static void goldfish_tty_cmd(GoldfishTTYState *s, uint32_t cmd)
> +{
> +    int to_copy;
> +
> +    switch (cmd) {
> +    case CMD_INT_DISABLE:
> +        if (s->int_enabled) {
> +            if (s->data_in_count) {
> +                qemu_set_irq(s->irq, 0);
> +            }
> +            s->int_enabled = false;
> +        }
> +        break;
> +    case CMD_INT_ENABLE:
> +        if (!s->int_enabled) {
> +            if (s->data_in_count) {
> +                qemu_set_irq(s->irq, 1);
> +            }
> +            s->int_enabled = true;
> +        }
> +        break;
> +    case CMD_WRITE_BUFFER:
> +        to_copy = s->data_len;
> +        while (to_copy) {
> +            int len;
> +
> +            len = MIN(GOLFISH_TTY_BUFFER_SIZE, to_copy);
> +
> +            address_space_rw(&address_space_memory, s->data_ptr,
> +                             MEMTXATTRS_UNSPECIFIED, s->data_out, len, 0);

Could this fail, no need to check return value?

> +            to_copy -= len;
> +            qemu_chr_fe_write_all(&s->chr, s->data_out, len);
> +        }
> +        break;
> +    case CMD_READ_BUFFER:
> +        to_copy = MIN(s->data_len, s->data_in_count);
> +        address_space_rw(&address_space_memory, s->data_ptr,
> +                         MEMTXATTRS_UNSPECIFIED, s->data_in, to_copy, 1);

Ditto.

> +        s->data_in_count -= to_copy;
> +        memmove(s->data_in, s->data_in + to_copy, s->data_in_count);
> +        if (s->int_enabled && !s->data_in_count) {
> +            qemu_set_irq(s->irq, 0);
> +        }
> +        break;
> +    }
> +}
> +
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
> +        break;
> +    case REG_CMD:
> +        goldfish_tty_cmd(s, value);
> +        break;
> +    case REG_DATA_PTR:
> +        s->data_ptr = value;
> +        break;
> +    case REG_DATA_PTR_HIGH:
> +        s->data_ptr = (value << 32) | (uint32_t)s->data_ptr;
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
> +    .impl.max_access_size = 4,

Missing:

  .impl.min = 4,

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +};
> +


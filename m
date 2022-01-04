Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D53F484479
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:24:55 +0100 (CET)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lgE-0002B2-5E
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:24:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4leH-0000ie-5F
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:22:53 -0500
Received: from [2a00:1450:4864:20::42d] (port=36502
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4leF-0003M4-Kq
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:22:52 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r17so76864009wrc.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 07:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eQlBfsRW1/6O8Q2Gy4A7PLstpAL/49eCPR6d0ZZoPB4=;
 b=fKZAquBT9RKHE2y3GNy7Jwu68MnCF9s0CvU3ImVHu0eWI50nFi/LhcRNRjZNi6YN2/
 x/mmPCYO1MTAV2cLtX8K+Ry7aYutuwOiHkDPQlfRRlR7DXjkA7K1afIIIZCukOLm0IVW
 bsiYF8EjhnCJNALOHBeZYEhSX88YKzOTzBZ6FSXKPgldQ42Hk00+bBXSRfgEGGLSD2xy
 TlYKFTpkVn78wR+cYuepBkbVrDk9ka9bXulnYFChbLA8gBvTK7cenOCzijxWNRm8wlAE
 9gi+k96DWQj99NrGTTROnAC6Yo30DxJ3cCItWqAtFY/KETZQfjRg0XX2DQvJr9VzUBIL
 4TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eQlBfsRW1/6O8Q2Gy4A7PLstpAL/49eCPR6d0ZZoPB4=;
 b=shWr1mKr+0fijS1E8Nmf7ZgjtPUxlHAyOTBIB3PkVC2+0xKwln6x7J40Idi+sxFS6a
 2H9cqd7eTmJGrM1VHQZJTHHN7K5EcsnJ/cdh5O4nYCyo1W2UflEEOPnMJY4HJ4he452E
 LQl9l/uzbz2YN3bzRde25aTDnCYkS9+gycsMvXS/qwx+5EYfWrEU4dBJ78tKwnKFdeHU
 1lyPxuUEHFobX7HabntjobtxMKkEPw1clkefkU2na5uupg/9OYDr4tkfMDoPWa4HMiR6
 e23ZZ7jhMEF3o604m4FZmIEKy5+DjsbmZekh+nRHZtKbqDKJSWCR2bC8SqLvI0CVJKgc
 YiCg==
X-Gm-Message-State: AOAM532OAFKfmnFXT5mbZWAzZNfr2iGneaLnCpnbcJTg1t+QfX6HuTMe
 TircGBnn9oAD/KonuxXhSMs=
X-Google-Smtp-Source: ABdhPJyO5jdqqeGYkFcSCfFsFx6BxPbi9mw5Jr/ucALJkQuakBNsVqk4X1c53YbmOZMxPeInEGa41A==
X-Received: by 2002:adf:d225:: with SMTP id k5mr43279268wrh.360.1641309769799; 
 Tue, 04 Jan 2022 07:22:49 -0800 (PST)
Received: from [192.168.51.187] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id m17sm43038720wms.25.2022.01.04.07.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 07:22:49 -0800 (PST)
Message-ID: <222c5015-399d-0ff0-e061-7dd3a947d4d4@amsat.org>
Date: Tue, 4 Jan 2022 16:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 4/5] usb: allow max 8192 bytes for desc
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, peter.maydell@linaro.org,
 richard.henderson@linaro.org, kraxel@redhat.com, eblake@redhat.com,
 pbonzini@redhat.com
References: <20211227142734.691900-1-pizhenwei@bytedance.com>
 <20211227142734.691900-5-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211227142734.691900-5-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/12/21 15:27, zhenwei pi wrote:
> A device of USB video class usually uses larger desc structure, so
> use larger buffer to avoid failure.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>   hw/usb/desc.c | 15 ++++++++-------
>   hw/usb/desc.h |  1 +
>   2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/usb/desc.c b/hw/usb/desc.c
> index 8b6eaea407..7f6cc2f99b 100644
> --- a/hw/usb/desc.c
> +++ b/hw/usb/desc.c
> @@ -632,7 +632,8 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
>       bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
>       const USBDesc *desc = usb_device_get_usb_desc(dev);
>       const USBDescDevice *other_dev;
> -    uint8_t buf[256];
> +    size_t buflen = USB_DESC_MAX_LEN;
> +    g_autofree uint8_t *buf = g_malloc(buflen);

Do we want to have a per-device desc_size (in USBDevice, default to
256, video devices set it to 8K)?

How "hot" is this path? Could we keep 8K on the stack?

> diff --git a/hw/usb/desc.h b/hw/usb/desc.h
> index 3ac604ecfa..35babdeff6 100644
> --- a/hw/usb/desc.h
> +++ b/hw/usb/desc.h
> @@ -199,6 +199,7 @@ struct USBDesc {
>       const USBDescMSOS         *msos;
>   };
>   
> +#define USB_DESC_MAX_LEN    8192
>   #define USB_DESC_FLAG_SUPER (1 << 1)
>   
>   /* little helpers */



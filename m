Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED8148AD7D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:19:12 +0100 (CET)
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7G7L-0004uv-8C
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:19:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7Fvo-0001P2-RM
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:07:19 -0500
Received: from [2a00:1450:4864:20::32a] (port=43683
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7Fvn-0003Ti-E3
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:07:16 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so1674611wme.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g5o8iKM6ubRbcq5KurVwN7iZ4ij+fHqXqYbPax5M2F0=;
 b=pSkB9npljc7ee7/UVu9owq024+TAi2sGTU2yJmTzYiNCfDPwat2uQNRM7zrI5GTlZc
 S46WktzIu/w4T4/5GS+VevVJjFCF0cpUIA+uN4s40ZjKC+nA6D1HGxtq9RAfLw6lmykx
 76d6PVd9YIVGO0ANUf5slVhGoiZGnawPUy2cxF61TUINLJcJEO1SZboj15t2CBOhMYUK
 N8U/M9d++AcXCXpbHsi7sl16zJbHdQ3QOILXQxIJpCh8bgJ73d+ig0Jo5L5e7/r/ahH6
 p80Z4HhKLSW5YZidCOHZegE49rF4WiUJal/kA8VOkGWaUVMVCp+VCQ9UnFdq+wCPwhP3
 31gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g5o8iKM6ubRbcq5KurVwN7iZ4ij+fHqXqYbPax5M2F0=;
 b=Dm0Vua2/Qac8NXvxTTo0j5sjhUoDwLI46F4FCxKLHXo0J7LQvdR+DB5nX4UvQLCzuc
 bwIS13MSHoKASu3DdA66Z6O6QTnb+Ku0NBGbDYLozvkPMxL2e3B2phBEbi9QDhAdQ8aw
 oGwNBO6A4C90TeAm+lHFDMEOfiAPJM7BVeuxw4tF1BVIX1PHwaDYFUZoLsbpbiQ26BP6
 Kg8RaGEJ5gI8CiqE/F16ZocYLaTNjn2ge2Fn9KnLbBSi8PXg8BD7i36MNU8uyXwYdeDA
 YkyhSJ+vmXy/QPsl29YVNQp8s4494/OWEMWatFBMy2hUGVfqf6ZD5aZCsj5Wf5OCxFW/
 owcw==
X-Gm-Message-State: AOAM5310h8iPSr+LcibFSZ+NkMOJZUHH80E6/3tfeIARmkoJIgE42fZW
 94oMNTIMvNU3TsMqQbt4zFs=
X-Google-Smtp-Source: ABdhPJxKaeQzUSasbgHis9i5JA1dbT9/1DSwfkD34bRcmUPA4sG2kbHXHkGD35c5rS05XrGIVHFu2w==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr2203766wmq.152.1641902834006; 
 Tue, 11 Jan 2022 04:07:14 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id az6sm377591wmb.48.2022.01.11.04.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 04:07:13 -0800 (PST)
Message-ID: <12950342-e405-e796-c393-3130329da10b@amsat.org>
Date: Tue, 11 Jan 2022 13:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] usb: allow max 8192 bytes for desc
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, kraxel@redhat.com
References: <20220111104918.896841-1-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220111104918.896841-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/11/22 11:49, zhenwei pi wrote:
> A device of USB video class usually uses larger desc structure, so
> use larger buffer to avoid failure. (dev-video.c is ready)
> 
> Allocating memory dynamically by g_malloc of the orignal version of
> this change, Philippe suggested just using the stack. Test the two
> versions of qemu binary, the size of stack gets no change.
> 
> CC: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hw/usb/desc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/desc.c b/hw/usb/desc.c
> index 8b6eaea407..57d2aedba1 100644
> --- a/hw/usb/desc.c
> +++ b/hw/usb/desc.c
> @@ -632,7 +632,7 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
>      bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
>      const USBDesc *desc = usb_device_get_usb_desc(dev);
>      const USBDescDevice *other_dev;
> -    uint8_t buf[256];
> +    uint8_t buf[8192];
>      uint8_t type = value >> 8;
>      uint8_t index = value & 0xff;
>      int flags, ret = -1;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


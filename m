Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5435C46943F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:50:07 +0100 (CET)
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBZO-0005q2-Bx
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:50:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBSh-0002km-Bn
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:43:11 -0500
Received: from [2a00:1450:4864:20::42f] (port=38591
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBSf-00038G-Jn
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:43:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id q3so21430400wru.5
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 02:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yZ+tfCWVmX99G4QrRKR4eZGpW6Nw0II9va36OMTBLb8=;
 b=pz+9+BI4D8+L0gCh0lXuqCvFh4lw+3bqTJKZrUa8R/48YBQ8qJVei5uGGwxPUSwG1O
 W/QHvrkYUdDDVD43ge8J66PTDyQYk67aKai111ww0r6dUvBNlfjl69Jn1Unsn1akOxFY
 EI0M158DrPXLQVrhV2e1mufLFlB1vVG2BJ99qqavlHZipPjgMChW+eTFUdlL16DguIco
 OwCAOI+KWNHrBSwNSC6CeuxB24v4gLeZkqyBf8dJ8VkFzzFojhZo7qpWBis+VIRv4TrM
 FvPAGbLFqRSLFetYr33Xm/eMljmJr3QgSYEsOovQXEyBClCNPwHV9JIKL/Yqw3pIPEpo
 43gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yZ+tfCWVmX99G4QrRKR4eZGpW6Nw0II9va36OMTBLb8=;
 b=7n4ZiM2d2f5krDH+CEibJ8dNasZ9J1eqM3H50IG2HdiCFbE8sUcDhUgfsqt0oVdzUY
 9V2BeakrPONs539DbswFJFFXmrGU+ipweH2/pYqH29SuEst4cOmeBDYJfZjPnIKCPxAD
 HjTmv5VN/GQauK6ExF58csGkYkRqmwAIS9mbmOWWeK8dstu8H77ppLLa1qjwbLB6+W61
 T6ULabdjIoN+U4MKQ2bnnSzI4Q/BnWNONyyceiO3PR15trySEsf1+R+jx21mQzFDaZig
 ZSr+ZdZGzouDE2+E4Fl4nWLrxmjodF0RwsHLWoGWjVfBZUqR+dOnpTmf1GoEFVlB1l4+
 /fKg==
X-Gm-Message-State: AOAM533z4q3w4I6KvxRDZcwNEyAkfa2GbuB92a6jm7ZcxEoLVyFJ74cD
 8l71SNiHui+XLS6PsHx4Wuc=
X-Google-Smtp-Source: ABdhPJzzL215h/6ZnBKuHBC7rCKzvW2g/GSJqcodyCfuXoxGa8fwC0v7suP0cze3nRDp1JeJ8MEdlg==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr42362255wrq.194.1638787387097; 
 Mon, 06 Dec 2021 02:43:07 -0800 (PST)
Received: from [192.168.1.36] (82.red-83-50-95.dynamicip.rima-tde.net.
 [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id j40sm10936826wms.16.2021.12.06.02.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 02:43:06 -0800 (PST)
Message-ID: <5523cd8d-ef7c-e9a1-d04d-67e6db01f688@amsat.org>
Date: Mon, 6 Dec 2021 11:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for 6.2? v2] Revert "vga: don't abort when adding a
 duplicate isa-vga device"
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211206095209.2332376-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211206095209.2332376-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 10:52, Alex Bennée wrote:
> This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.
> 
> The check is bogus as it ends up finding itself and falling over.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/733
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20211202164929.1119036-1-alex.bennee@linaro.org>
> 
> ---
> v2
>   - fixed bug link

IIUC Cornelia & Mark said the correct fix is simply:

-- >8 --
-    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
+    if (!object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
---

> ---
>  hw/display/vga-isa.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 8cea84f2be..90851e730b 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -33,7 +33,6 @@
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
>  #include "qom/object.h"
> -#include "qapi/error.h"
>  
>  #define TYPE_ISA_VGA "isa-vga"
>  OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
> @@ -62,15 +61,6 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>      MemoryRegion *vga_io_memory;
>      const MemoryRegionPortio *vga_ports, *vbe_ports;
>  
> -    /*
> -     * make sure this device is not being added twice, if so
> -     * exit without crashing qemu
> -     */
> -    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
> -        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_VGA);
> -        return;
> -    }
> -
>      s->global_vmstate = true;
>      vga_common_init(s, OBJECT(dev));
>      s->legacy_address_space = isa_address_space(isadev);
> 



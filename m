Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611E3ED480
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 15:02:27 +0200 (CEST)
Received: from localhost ([::1]:58156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFcG1-0001dO-He
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 09:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFcEt-0000iZ-Nr
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFcEn-0004f1-0E
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629118867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVATBuUJQVY1Q4LuL2NXkisonxIsOHh52Y6D7TfSvgM=;
 b=BvrWhwwexReXYEXIe6ZX8fRDAtok69J8hRPMLL9zeT5E05zlARW45QUVod0O2nmA3kI9S2
 2uWHIIIR0TF8b+VU3DmKqnV5+RJJvjNQPtPRB/8DTkqlYBG09PSgOHy+jGGvTDW//jD9QL
 HpxjTy4zQ3Yyvvic2UHtmEawmc3o630=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-wK1SeF_fP8anGSFx2lolSQ-1; Mon, 16 Aug 2021 09:01:06 -0400
X-MC-Unique: wK1SeF_fP8anGSFx2lolSQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so7791645wml.5
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FVATBuUJQVY1Q4LuL2NXkisonxIsOHh52Y6D7TfSvgM=;
 b=Wq420SjBEmA/N+mw4f2iCoHRbkAlOAg185lJiyddBF9OMVys3BGRkZE8CXuIsLsB72
 6BY3cZbgzLZvMoGbU6jdLJH3gs3efCS7VApyRKd2Xern5esqEqvwyujGgiFQYpGOcVG4
 fQeA9YmZXzVbcF4Ynp/HXSNs1svwGHZm8XCQArr0YtON5PdHJcN0BbD/Uss5iLd2HARX
 CymD9Sw4DwSuTHcghn9LKI3gThyeqR1C9eQKtRJTplxm4/MRl5sMAQGGJW2Snu0i7V4l
 fl7AYv8zUhbsm9RbP22Onbzs6o1YmD2agZ/8PpeiD6g1jK5gOLKjcBZq5aGHZQouo70B
 Vzfw==
X-Gm-Message-State: AOAM531g8ZUswxaeIC4TDQ1j0AOmku2F0NOSlh5ImJCFt45tq2Y/gZCP
 hvfTqE/8g2sWWC0DTb2kGM9s3lSfCZ66DfokAlTFXPTTv0Zs+IqkYNmHyYDUONfHm2XZzuguujB
 aGovrqNaipWLJWK8=
X-Received: by 2002:adf:8102:: with SMTP id 2mr17862457wrm.89.1629118864910;
 Mon, 16 Aug 2021 06:01:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8fBK+eJIKX3wFKsS1sHmfo7yBziksGg1ETg3t4XmLjY9j68WsRZAYvkonbo1eGSBYI4UFSA==
X-Received: by 2002:adf:8102:: with SMTP id 2mr17862443wrm.89.1629118864779;
 Mon, 16 Aug 2021 06:01:04 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t1sm10791773wma.25.2021.08.16.06.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 06:01:04 -0700 (PDT)
Subject: Re: [PATCH v2] vga: don't abort when adding a duplicate isa-vga device
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
References: <20210816123611.28183-1-jziviani@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ef1d3843-2917-e35a-be23-6953aa270f25@redhat.com>
Date: Mon, 16 Aug 2021 15:01:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816123611.28183-1-jziviani@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 2:36 PM, Jose R. Ziviani wrote:
> If users try to add an isa-vga device that was already registered,
> still in command line, qemu will crash:
> 
> $ qemu-system-mips64el -M pica61 -device isa-vga
> RAMBlock "vga.vram" already registered, abort!
> Aborted (core dumped)
> 
> That particular board registers the device automaticaly, so it's
> not obvious that a VGA device already exists. This patch changes
> this behavior by displaying a message and exiting without crashing.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
>  hw/display/vga-isa.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 90851e730b..1fba33b22b 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -33,6 +33,7 @@
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
>  #include "qom/object.h"
> +#include "qapi/error.h"
>  
>  #define TYPE_ISA_VGA "isa-vga"
>  OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>      MemoryRegion *vga_io_memory;
>      const MemoryRegionPortio *vga_ports, *vbe_ports;
>  
> +    /*
> +     * make sure this device is not being added twice, if so
> +     * exit without crashing qemu
> +     */
> +    if (qemu_ram_block_by_name("vga.vram")) {
> +        error_setg(errp, "vga.vram is already registered");

Maybe "'isa-vga' device already registered" is easier to understand?
(vga.vram is about the device model internal).

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +        return;
> +    }
> +
>      s->global_vmstate = true;
>      vga_common_init(s, OBJECT(dev));
>      s->legacy_address_space = isa_address_space(isadev);
> 



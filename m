Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6A3EE72B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 09:26:49 +0200 (CEST)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFtUm-0004Bw-Fg
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 03:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mFtTx-0003QT-MM
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mFtTw-0002v0-1O
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629185155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQiWS+17fddQjqxqxwyUxh75iVOLOV3BUQ1Tr6ikgu4=;
 b=PDC2sCoBoJNJ+MPYT6nwUmYBWjcKnpVt/Ui4bXzqwihT8ilscqXAAljL0GUBTWW0hLhcXR
 DZ+OJHjqVoBPNG2WK9vlo5NZeojsB98ic9SSBW4xQJXmgHvGLxKih1Xmxkq3dNu/nFE3BV
 OedDG2c8lktK0osKCWZmEc86GeaN9Us=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-Bsa84qT2OHK3QUYHYpYKmA-1; Tue, 17 Aug 2021 03:25:53 -0400
X-MC-Unique: Bsa84qT2OHK3QUYHYpYKmA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z4-20020a05640240c4b02903be90a10a52so10132105edb.19
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 00:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dQiWS+17fddQjqxqxwyUxh75iVOLOV3BUQ1Tr6ikgu4=;
 b=pyzJXHZ80/NCyLL0378/p9zQfc/hmjMsdKJHZOaKlOP1PS2anV9pjNpB1tKhwufI5W
 tzE9z2bBDl/v+4gy6wTJCIvVcgKLItA0Z7c+6Kts/dGbZDnKhQOk9ZzN0dnHaO+Cdlcq
 Av9lSBuCHOuN5wcHEHrcvpqLYKwA1vhoDtctJgAyKyMgU601upwSHx5uNspALE9khZ+k
 e6Bqzpv/TZP/MkaFsrXk3+8VYJVwDyXtIeduf53AyhG6mrm3hXl9oxrwHea6VL2qwcC3
 k2b/ABwM1NLursG8k8rok2s9YxIxMwP/EWa0sB38CGkTY5cHD4M/30eJOdC/iCsnkvdx
 ttzQ==
X-Gm-Message-State: AOAM5311TT3No8AQ6tf+4ztKld7gBHlfMooFUdfYPX1mJt+fZgw3LhYY
 C09jWL0iPUWn7CjwY5v72sAJb+ZBbEh4F7CFZctxp2iuAdo7SpAqTpxCxIYkNdFcZHzZOj5My24
 f23jBGFgWhsn0DRc=
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr2586940edb.281.1629185152715; 
 Tue, 17 Aug 2021 00:25:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwACNlBN0nqKjjvgtcwKGJzCtzG533o3HEaEVIeTMDeB4NzSka40jkDOkkcT7fPr0KeLoCb+w==
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr2586907edb.281.1629185152435; 
 Tue, 17 Aug 2021 00:25:52 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83fdd.dip0.t-ipconnect.de.
 [217.232.63.221])
 by smtp.gmail.com with ESMTPSA id m15sm579084eds.92.2021.08.17.00.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 00:25:52 -0700 (PDT)
Subject: Re: [PATCH v3] vga: don't abort when adding a duplicate isa-vga device
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
References: <20210816135504.9089-1-jziviani@suse.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f047a8d8-93f5-3f62-0834-c036931090d2@redhat.com>
Date: Tue, 17 Aug 2021 09:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210816135504.9089-1-jziviani@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, philmd@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/08/2021 15.55, Jose R. Ziviani wrote:
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
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
> v2 to v3: Improved error message
> v1 to v2: Use error_setg instead of error_report
> 
>   hw/display/vga-isa.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 90851e730b..30d55b41c3 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -33,6 +33,7 @@
>   #include "hw/loader.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> +#include "qapi/error.h"
>   
>   #define TYPE_ISA_VGA "isa-vga"
>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>       MemoryRegion *vga_io_memory;
>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>   
> +    /*
> +     * make sure this device is not being added twice, if so
> +     * exit without crashing qemu
> +     */
> +    if (qemu_ram_block_by_name("vga.vram")) {
> +        error_setg(errp, "'isa-vga' device already registered");
> +        return;
> +    }
> +
>       s->global_vmstate = true;
>       vga_common_init(s, OBJECT(dev));
>       s->legacy_address_space = isa_address_space(isadev);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>



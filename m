Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4A524E984
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Aug 2020 21:59:42 +0200 (CEST)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9Zfx-0001nJ-Ky
	for lists+qemu-devel@lfdr.de; Sat, 22 Aug 2020 15:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Zei-0000iq-10; Sat, 22 Aug 2020 15:58:24 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Zeg-00024q-Dv; Sat, 22 Aug 2020 15:58:23 -0400
Received: by mail-wr1-x443.google.com with SMTP id f7so4995645wrw.1;
 Sat, 22 Aug 2020 12:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tIBDWNK6TWdcG1u2mCgK/iXYWceh6T573WlPVffrgaA=;
 b=tiTATWJpxNFNahIUBBrjuWg9d6o3/DEyKq4BThSQmUGnhKcXfTCawfr5PqskaTWviQ
 4goalTEqFtKVcic6UBdJAoiag+wFgZ+wYp0fkeVJfUWYnTFxa+LfsOntCBo0vMZGjIE4
 aCIo0VyIRkU0vNPFhBfke3cY+9XIFIXUzCpixNmpYml11jOPsihJ894yZ91mkyNINCa2
 d2rnNlZQiktQ6Lr6hhbf6QnjrSd5dbN2xIED93KYVu/EvEXCLNvq4RFPXKeudMHGnxYk
 alJfk1+PtwYyeBFO0vzkXQvDVnTAypuWUPZemlzRKSlddfXMfz6W/gqZrcRM7s6wXJwH
 V9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tIBDWNK6TWdcG1u2mCgK/iXYWceh6T573WlPVffrgaA=;
 b=VVY7jTnDjZBdmiuWZjx07vP46IsmpKfjngRwk5HX4muFbxFDdW+XqxHmNs0PePPwnl
 7vWasXjL8EimUh2n4/ThTf1VgwdSN+1COSo1FKmcfdpZhxl1r3LJU58VSDmNOB0olass
 3CO9HJ13PKS80PqSRbPTqRUMXZAAcZBvckiQBkgk6XzGDn301FmKr4WaOSyDCkmjq9o9
 ORIJCEsqbn/bkBqJFyknhJD/6+LGxRo6rSi+LD9ZqxgDAFg9Wh7cypHfdFbWi/9uvIjj
 pXHLhQBZztbYuT5bz4RWUUenddWJDMADzxpGNvwOuT97AUwD1zMo1/QUtjRoXML0H0OJ
 qrJg==
X-Gm-Message-State: AOAM533nirSnEUyc3TBE9gcoRs3lFX92kM6fTc0d7Zl4qDNS2HuIHQrc
 THICmbQCiBhs/KaXX+s1gJ5hJeQsvro=
X-Google-Smtp-Source: ABdhPJxp+2vz+zwNk35mxraZgcj7pNIeU/kX2ERts110gQAL538wL/2IUx8rcL1j4ac9HBihF15HkA==
X-Received: by 2002:a5d:6a4e:: with SMTP id t14mr8336003wrw.135.1598126299743; 
 Sat, 22 Aug 2020 12:58:19 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id m14sm13358261wrx.76.2020.08.22.12.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2020 12:58:18 -0700 (PDT)
Subject: Re: [PATCH-for-5.2] stubs/cmos: Use correct include
To: qemu-devel@nongnu.org
References: <20200724084315.1606-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <22d468f8-20d7-7b39-5b55-3ac6a7b315e9@amsat.org>
Date: Sat, 22 Aug 2020 21:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200724084315.1606-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 7/24/20 10:43 AM, Philippe Mathieu-Daudé wrote:
> cmos_get_fd_drive_type() is declared in "hw/block/fdc.h".
> This currently works because "hw/i386/pc.h" happens to
> include it. Simplify including the correct header.
> 
> Fixes: 2055dbc1c9 ("acpi: move aml builder code for floppy device")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  stubs/cmos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubs/cmos.c b/stubs/cmos.c
> index 416cbe4055..3fdbae2c69 100644
> --- a/stubs/cmos.c
> +++ b/stubs/cmos.c
> @@ -1,5 +1,5 @@
>  #include "qemu/osdep.h"
> -#include "hw/i386/pc.h"
> +#include "hw/block/fdc.h"
>  
>  int cmos_get_fd_drive_type(FloppyDriveType fd0)
>  {
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149FC341EFA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:07:42 +0100 (CET)
Received: from localhost ([::1]:52530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFmv-0004KY-4F
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFlq-0003QS-Nu
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFlo-0001PD-L6
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616162791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFMFgXs1lWsqMX+gvorXrDTspRj3Y2xlwiiLR3c8tts=;
 b=dURLLtnzyfHlGxXrNHNx9B1geeSC4+sLEn+L71kdaQ+pMS7sNZ2ms9gZwNQDbv3+JxSwC6
 w5l7xwJrzpMZKkV+WGVki7hD1I3u8+bB+4S6bwMSGeAmKkSy0Tg55n2Exw4bl7P96cWAZK
 wlcVtKFdW9kmIVXCG+zaIwz84+q1Dcw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-DHBRAJcuPh6Hz_IxKHHEqw-1; Fri, 19 Mar 2021 10:06:28 -0400
X-MC-Unique: DHBRAJcuPh6Hz_IxKHHEqw-1
Received: by mail-wr1-f69.google.com with SMTP id m23so16846735wrh.7
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 07:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OFMFgXs1lWsqMX+gvorXrDTspRj3Y2xlwiiLR3c8tts=;
 b=CfV0ml5pIbnub9jyJ1FyaBgbqtho4yAbGh5pqDdaH1BiAxThVsaLYqeonJ9nqfqgg2
 CqaJpdXM1tuLCGk3hBEHU6btKJo1x69e2cAcytL/+mY0U2qyTbezcHOuLZSjEp/x1HkK
 uhnE8Ire4QyvY7YfjUfzVjwuj8Q/x4yVQCrXX7wVkXnduFLJ7BFZH7j4tvSUEkaMBs6P
 AT99ttVgKyfOtEgU28dY4mU8a9hOLBVrDjaDsBuvK1luBXfmNCTFBjs+fUssyaIH/r2t
 U+UT9vpbWpI+w8QyIaeIbEVUTM0FfbGczfCBSV4d3lJ72ql1UALnlNry5dVi7YK3G1o/
 f9AQ==
X-Gm-Message-State: AOAM530DmTmGi4IdK4E3bVF7BGDgQfvo632BBoazQwkcxWwh+RnT4lhA
 FVvBIk32KF/O+yTQe7oEPeoP3iSlO0vl17Ddejpm2UuXn4ZsU0ViAszD63Dzy54qlvgkDf2qeRW
 V87sqy2NEPVYmPib64WprIDvTSyLQN2O2y0wYun/kAfU8Z9a5FAGwECiYMr5B7gZx
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr4031638wmk.24.1616162787412; 
 Fri, 19 Mar 2021 07:06:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEdXJFhVT8qcGTD9rgnNcJ+HlN4zht2ru+rATPihaCtKBDX3wOppXhyD0T3GYI2hlDIsb00Q==
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr4031603wmk.24.1616162787039; 
 Fri, 19 Mar 2021 07:06:27 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x11sm6333689wmi.3.2021.03.19.07.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 07:06:26 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
To: Stefano Garzarella <sgarzare@redhat.com>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
Date: Fri, 19 Mar 2021 15:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefano,

On 2/5/19 7:14 PM, Paolo Bonzini wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> The new pvh.bin option rom can be used with SeaBIOS to boot
> uncompressed kernel using the x86/HVM direct boot ABI.
> 
> pvh.S contains the entry point of the option rom. It runs
> in real mode, loads the e820 table querying the BIOS, and
> then it switches to 32bit protected mode and jumps to the
> pvh_load_kernel() written in pvh_main.c.
> pvh_load_kernel() loads the cmdline and kernel entry_point
> using fw_cfg, then it looks for RSDP, fills the
> hvm_start_info required by x86/HVM ABI, and finally jumps
> to the kernel entry_point.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
> ---
>  .gitignore                   |   4 +
>  Makefile                     |   2 +-
>  pc-bios/optionrom/Makefile   |   5 +-
>  pc-bios/optionrom/pvh.S      | 200 +++++++++++++++++++++++++++++++++++++++++++
>  pc-bios/optionrom/pvh_main.c | 116 +++++++++++++++++++++++++
>  pc-bios/pvh.bin              | Bin 0 -> 1536 bytes
>  6 files changed, 325 insertions(+), 2 deletions(-)
>  create mode 100644 pc-bios/optionrom/pvh.S
>  create mode 100644 pc-bios/optionrom/pvh_main.c
>  create mode 100644 pc-bios/pvh.bin

> +++ b/pc-bios/optionrom/Makefile
> @@ -37,7 +37,7 @@ Wa = -Wa,
>  ASFLAGS += -32
>  QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS), $(Wa)-32)
>  
> -build-all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin
> +build-all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
>  
> +++ b/pc-bios/optionrom/pvh_main.c
> @@ -0,0 +1,116 @@
> +/*
> + * PVH Option ROM for fw_cfg DMA
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + * Copyright (c) 2019 Red Hat Inc.
> + *   Authors:
> + *     Stefano Garzarella <sgarzare@redhat.com>
> + */
> +
> +asm (".code32"); /* this code will be executed in protected mode */
> +
> +#include <stddef.h>
> +#include <stdint.h>
> +#include "optrom.h"
> +#include "optrom_fw_cfg.h"
> +#include "../../include/hw/xen/start_info.h"
> +
> +#define RSDP_SIGNATURE          0x2052545020445352LL /* "RSD PTR " */
> +#define RSDP_AREA_ADDR          0x000E0000
> +#define RSDP_AREA_SIZE          2048
> +#define EBDA_BASE_ADDR          0x0000040E
> +#define EBDA_SIZE               1024
> +
> +#define E820_MAXENTRIES         128
> +#define CMDLINE_BUFSIZE         4096
> +
> +/* e820 table filled in pvh.S using int 0x15 */
> +struct pvh_e820_table {
> +    uint32_t entries;
> +    uint32_t reserved;
> +    struct hvm_memmap_table_entry table[E820_MAXENTRIES];
> +};
> +
> +struct pvh_e820_table pvh_e820 asm("pvh_e820") __attribute__ ((aligned));
> +
> +static struct hvm_start_info start_info;
> +static uint8_t cmdline_buffer[CMDLINE_BUFSIZE];
> +
> +
> +/* Search RSDP signature. */
> +static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
> +{
> +    uint64_t *rsdp_p;
> +
> +    /* RSDP signature is always on a 16 byte boundary */
> +    for (rsdp_p = (uint64_t *)start_addr; rsdp_p < (uint64_t *)end_addr;
> +         rsdp_p += 2) {
> +        if (*rsdp_p == RSDP_SIGNATURE) {
> +            return (uintptr_t)rsdp_p;
> +        }
> +    }
> +
> +    return 0;
> +}

gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:

pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
due to limited range of data type [-Wtype-limits]
   61 |         if (*rsdp_p == RSDP_SIGNATURE) {
      |                     ^~

Can you have a look?

Thanks,

Phil.



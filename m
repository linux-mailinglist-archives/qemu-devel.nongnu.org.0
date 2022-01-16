Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1774D48FEFB
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 22:10:47 +0100 (CET)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9CnS-0005II-U3
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 16:10:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Cj8-0004b5-1o
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:06:14 -0500
Received: from [2a00:1450:4864:20::52b] (port=45651
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Cj6-0008J0-9B
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:06:13 -0500
Received: by mail-ed1-x52b.google.com with SMTP id z22so57263238edd.12
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 13:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MHG62zmxCaH+1a3woeR3/Lrxw53+ERETskctod1v0fU=;
 b=D0K/nz0+hOKM7nuh+M4qqn0IbqKmP4ar4Gh3QtDOS9Rzvptspi1ShdMlmn/s59Hq/O
 GKRcyLhS2BhIkq5bF3b6z9ecXPEiRhwZDm1c7rIu5GG4RBYsye96tJTPBeMakKUzUrIZ
 Rdu+GK1DRVdjWkgSoeSl/9Y7mHk/70882XYFXih/AO52l9YwUr28ScYVBWgRY1jfIyMo
 3DdCyo+UwWb448dPcxnyRwTPiucYmxEIjrzeXMPk2jgw5S9q/WEumzbPQAPyf9JXPX5G
 rTNUmesJixRl6a4EOtlvRnWeEA6kXmDM3JY6Lf5x5yvdq0sS1FFOT7UOr5B48G33NhhY
 mFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MHG62zmxCaH+1a3woeR3/Lrxw53+ERETskctod1v0fU=;
 b=xbU3Fj3w4LFuMX0H2ymTLDigHA+gYqpuKjfaQYka3Zrh8KlDnyjWA6sY8Pp/zSiBeF
 x1hv+o5N9FRCsSvWE8G3yz740jVP9gWCRUu+YWmaI0uKd2AXnEu00mS9B1TewvP+Gs3W
 u272lOZMrfZAeOK1eTQEwoPEIXiecZV0RjHoM1O8He1CvestneAkDp8cRAbz5aZil+oR
 xIjqqxyRUnFFU27o7S5OdxHEd6Xznye/0lCn4dzO4yrLzOOnbuCwE4U62WhnBvFym0xA
 BiZqlPs1Ij35mivLw4m3JsmTX2+pLRGVxeVUAErowmxo7Y/6R8Bp12W/aa2E7nIHPdX5
 l1CA==
X-Gm-Message-State: AOAM530h5+n5zqNDRaBc6UWIc1GySlvAGSxHHlxUpfXrf6GAdsKm59JV
 Dw158pziRzou0tXKPnEhJ8M=
X-Google-Smtp-Source: ABdhPJy/VXt0NAGBsNlkeowxHmlcNCSSIpnJRKCv2ASv6o9sEaXXCqLROMLi7DihkPJnfFSnKSp/EQ==
X-Received: by 2002:aa7:c79a:: with SMTP id n26mr11259679eds.350.1642367170380; 
 Sun, 16 Jan 2022 13:06:10 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id a6sm91819edx.94.2022.01.16.13.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 13:06:09 -0800 (PST)
Message-ID: <66f3f633-3a61-163a-a0f4-622ef988611f@amsat.org>
Date: Sun, 16 Jan 2022 22:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] hw/i386: support loading OVMF using -bios too
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220113165511.46098-1-berrange@redhat.com>
 <20220113165511.46098-3-berrange@redhat.com>
 <20220114125946-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220114125946-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: 26
X-Spam_score: 2.6
X-Spam_bar: ++
X-Spam_report: (2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/1/22 19:07, Michael S. Tsirkin wrote:
> On Thu, Jan 13, 2022 at 04:55:11PM +0000, Daniel P. Berrangé wrote:
>> Traditionally the OVMF firmware has been loaded using the pflash
>> mechanism. This is because it is usually provided as a pair of
>> files, one read-only containing the code and one writable to
>> provided persistence of non-volatile firmware variables.
>>
>> The AMD SEV build of EDK2, however, is provided as a single
>> file that contains only the code. This is intended to be used
>> read-only and explicitly does not provide any ability for
>> persistance of non-volatile firmware variables. While it is
>> possible to configure this with the pflash mechanism, by only
>> providing one of the 2 pflash blobs, conceptually it is a
>> little strange to use pflash if there won't be any persistent
>> data.

It certainly would be simpler to have a ROM for the CODE part.
IIUC using CFI pflash allows the firmware to poll the underlying
device size.

>> A stateless OVMF build can be loaded with -bios, however, QEMU
>> does not currently initialize SEV in that scenario. This patch
>> introduces the call needed for SEV initialization of the
>> firmware.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   hw/i386/x86.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index b84840a1bb..c79d84936f 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -45,6 +45,7 @@
>>   #include "target/i386/cpu.h"
>>   #include "hw/i386/topology.h"
>>   #include "hw/i386/fw_cfg.h"
>> +#include "hw/i386/pc.h"
>>   #include "hw/intc/i8259.h"
>>   #include "hw/rtc/mc146818rtc.h"
>>   #include "target/i386/sev.h"
> 
> This builds fine because there's a stub in pc_sysfw_ovmf-stubs.c
> 
> The unfortunate thing about this however is that it's too easy to pull
> in a PC dependency, and people building with CONFIG_PC will not notice
> until it breaks for others.
> 
> Is it time we split pc.h further and had pc_sysfw_ovmf.h ?

While "pc*" is specific to the PC machines, "x86*" is shared between
PC and microvm. "pc.h" must not be included in "x86.c". The shared
method introduced in the previous patch becomes
x86_system_ovmf_initialize_sev(). The dual pflash mechanism is proper
to OVMF, so having this method in "x86.h" seems correct.

Phil.


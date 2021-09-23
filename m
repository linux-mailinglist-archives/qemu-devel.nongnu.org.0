Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7B4159AA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 09:56:38 +0200 (CEST)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTJav-0003cR-3T
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 03:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTJZF-0001rS-UH; Thu, 23 Sep 2021 03:54:54 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTJZC-0006gL-LQ; Thu, 23 Sep 2021 03:54:53 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNKuI-1mEWVd299O-00Oo1Z; Thu, 23 Sep 2021 09:54:43 +0200
Subject: Re: [PATCH] hw/loader: Restrict PC_ROM_* definitions to hw/i386/pc
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210917185949.2244956-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <06575b5a-2b3b-99f9-4810-6fd3ae3d568a@vivier.eu>
Date: Thu, 23 Sep 2021 09:54:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917185949.2244956-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kYS5MSsvu62nBEiV0icCqO5CwvIQBPKToD2BY8VH6nT7RLVawMQ
 dEhWWQs664eYHFTL1EP+BNbcmuLb/6IxXBlXKbPun4D1pijtPzM3L7ehUGdbIUZrUT8BZZK
 5Hl16cFzlksOeGBh7O5vdk2wfNKag++imsF05RaCr7augUeF9R5z7mGC+6slwGME9RwZ3v6
 Xp70vTbgnesDBqRCs6Jwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jLcYNE3QssE=:cWmKHK5oNRuePSnnMaQS6s
 ak0QrpER/Yh67gjXmyNLKfhX7bkjL7hc6t7Bw7c8SpVyR2F8ljI+MASSfv1VTj1Kmv0n8l42a
 YZL9YTqb8/DjPVuYfDhIkounKRfqsjDnW4neaKXaZLQ+3C970OdIlWYG305NpuX2Y7n3Aj/qv
 PHbOK+wVZNXr8I2LaJ9WXohIZcpqC6kw3EBRn1ZMHh9qtFvuK6+rHFvn61/MoaE7NExpplgtJ
 QEVoqu3ZLIwzJAHnLe/lmTkt/78o4MWoz3KLHNL/A0l1jsYc1zUfiTIZf89o4Y1xggV3PQ+g3
 ubKfYLYN9aGoPocV7u9GW2vwgQAj7BLbSWSBkW9C7/4MFqfkAJ+Ku34z653+fjQJJRZj7X1q0
 NdJMhs1zSubxybZ++Uf1tLfrgM/zaItM+DBAToJOZhfxHuj7BkH8nnDK9i8RX1G0qjQXzRsIk
 nfdImR8pd9O318HKHIWv2YokMgVtI4GAZLUbXBUYvTgO31SsjmMWUsKdY7IYVutDbSyB0Z+vb
 XJhhVvuBNdbA1saCfCbCv8SLAK7JKCf9EvQS+5jLFpqemcwRjCqqEtmpkbxlBZKuEcQJ73/1U
 NnLZf02Qv9dfQOgN1Bbuhi506SjfTLzuPybu3m479rdopqsZgtCSZOI6cbElZV2Y9PkI0fju7
 xhs4BTgZf2VB3j3ltOmpZ5FLdiKvhISsib8Pd9N7duG3bXmnu1EfWzD+v+co7ReAYhu79kNTN
 f1vsCJsK4BDBWH3JzXsIFgX+nreViifcMKWU6A==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/09/2021 à 20:59, Philippe Mathieu-Daudé a écrit :
> The PC_ROM_* definitions are only used by the PC machine,
> and are irrelevant to the other architectures / machines.
> Reduce their scope by moving them to hw/i386/pc.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/loader.h | 6 ------
>  hw/i386/pc.c        | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index cbfc1848737..81104cb02fe 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -336,12 +336,6 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
>  #define rom_add_blob_fixed_as(_f, _b, _l, _a, _as)      \
>      rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, _as, true)
>  
> -#define PC_ROM_MIN_VGA     0xc0000
> -#define PC_ROM_MIN_OPTION  0xc8000
> -#define PC_ROM_MAX         0xe0000
> -#define PC_ROM_ALIGN       0x800
> -#define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
> -
>  int rom_add_vga(const char *file);
>  int rom_add_option(const char *file, int32_t bootindex);
>  
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 7e523b913ca..557d49c9f8f 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -843,6 +843,12 @@ void xen_load_linux(PCMachineState *pcms)
>      x86ms->fw_cfg = fw_cfg;
>  }
>  
> +#define PC_ROM_MIN_VGA     0xc0000
> +#define PC_ROM_MIN_OPTION  0xc8000
> +#define PC_ROM_MAX         0xe0000
> +#define PC_ROM_ALIGN       0x800
> +#define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


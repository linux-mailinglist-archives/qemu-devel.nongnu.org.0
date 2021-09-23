Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A274C4161AA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:03:54 +0200 (CEST)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQGP-0003Ro-Oi
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQDQ-00015k-4G; Thu, 23 Sep 2021 11:00:48 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:48405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQDM-0001rz-Dy; Thu, 23 Sep 2021 11:00:47 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTzve-1mLH1z3qyY-00R19F; Thu, 23 Sep 2021 17:00:38 +0200
Subject: Re: [PATCH] hw/loader: Restrict PC_ROM_* definitions to hw/i386/pc
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210917185949.2244956-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d9193d22-a4c7-65bc-fefa-f8abb02deb07@vivier.eu>
Date: Thu, 23 Sep 2021 17:00:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917185949.2244956-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:00Kop89YZIQy/FpBBM4YhA9//IYYcQRGFSEatfkrYf44hBkyzut
 1tAgAUY3zOFp0GB3WH90nprR1mRBvnSwolkxZn3K1nqorJLPqvtl3s7Q0ZdtKjAwkS0EOcv
 z13yRNnrValqjAEE2u7WBM81vi0sHCjVGCysTfQImL3K+z5by7fAT9ObMAuoc0L670JUSup
 8pcy48nTqAa/oSmJR6PHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9w+j3rXzHd4=:haIblm71p5Uu9JNv5ZGLh3
 KKuEPZ2AryDmhbbmwfVxqYBOKCl48FFp0zGxEP1MjS9HmXwuDEYQzlVQrstmk2pjEDzxOF7eq
 QbIzRMJ6wv4JEd30eGokxoPKEtDbSTNBQV/1O5FN4OGY/iipVXpPjqcZTqL7gigDlNXBwOlJH
 GVPc7KMM8e6hxefi2VIyf1XRHY116rjpNbYl8VmU+V/n7r94cEPgYOfTuqNR/f3mFFkyTtEnE
 aX9FDIfOm1Vzn+R1ZEshWfgud/ki8DKkArGvkYKXdc0yL8nO44hLHVymwXcs3SmQGMQ1HqjTs
 mnczVTNL/sLZQzrqdzNJ7tilWuS+DVMXUDbnQmpIN/wOauPjkz6+1BZ5R6wEytuhFCxrq46Nd
 ckraD3Ag8ArRE4hakRhB5CE+rF0kjMXzpX+bd/kz3UfhT2K0whSRfIzErRi2mnu5EonvOsnzl
 bXfbnP6RdjF78+0L85w5zcEIgUC1t91w5K4Ms9B1iYK0pZ2MbKGHx9WMpBgUbkf0W/E/8j0N1
 a/DCnAsp/ujdXkAynfN0kffugtiqir5lA7n9SlRrfBqkzKlVt6pn5eNFLD3zvjcUAJuFhVfdF
 MDt2mhPzS4nqmntEfSrBXG9liM6HfuY0ToUK+1FeXsARQVvRmO3RgT/oFihqW9IiTnwliVQaf
 KNIYVbcJXhZV1CcHtLa+zYhTuIVLQpJAeYqxmZshYomUu4uX7mqfF/LGohhR9zaStoQy7nwJ5
 CZhwNpX1Wv6koy1tGezkqFA2aMoy/L4lqz7ORw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Applied to my trivial-patches branch.

Thanks,
Laurent



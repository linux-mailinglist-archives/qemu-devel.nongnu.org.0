Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021AD41270F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 21:58:14 +0200 (CEST)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSPQb-0005id-0b
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 15:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPN1-0001DH-0Y
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:54:31 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPMz-0004W5-7k
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:54:30 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MbSTX-1mzYKZ3QLZ-00bujS; Mon, 20 Sep 2021 21:54:26 +0200
Subject: Re: [PATCH v4 02/20] nubus-device: expose separate super slot memory
 region
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cd78cdb4-1726-8544-4d94-42c11583c9c2@vivier.eu>
Date: Mon, 20 Sep 2021 21:54:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HzpOJjkhUbU/5VClRHDlom+NAzsq398USvXTb06SiUY2m+0KmBi
 D8cXKsr8wu3ao1BfKXrSvpB6dW7gidyTMTGBXIb+cDKXCqjs95hsmqRQaTZ4g50aeDPg8+A
 4nTF/tjmcAjffp94qJE5KEAF2QKz4lzZw7BlpmnS7lyKisiLFrVgg4w4GCDHGQGBkVbjmat
 pMMO1Jm3yifC+2117ec7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6I6E4AVQooM=:/+J7MvVM1DIyyWy5YhhDkZ
 SRtRI9CoVahAOJS32GYgeNe1WmIVwQbWbjziLX7wpqvtXmcRBkYtGLxW/HlALSohidVo65WFn
 AiLgn8ixJA5K2eUgmVGJYNsXCZyHHKIIBCsUNUll9SRQmVF4HCw5YPWfsKkgvl14x6KnGy6wm
 Pd//mbgiOgnPfuLfI6P9ek+gWcZKM9XudMRMq5PLAX9/gufFhCe9gd1SnJMUXgZTA29pWHhbr
 wZkijSiczfsdmN5vxmD1oLSQAD7PUsIg6kgUTo5RJiBe6mYfKQK+f5FDdFar7mYLWNmDwlKtN
 LHt5z7qYFJVpGkiNLjpoGoKrjAQlax5sa5LxtFuFNULGj4149W0CyYemyWEuiS8stTkYGzfQ6
 U4WK8jfdoZIpaQGynkvtaKY4UVX+GxeQ7vwkr6Zl/bsokgaUdzWvSvZEssqAJRan5/yRqe115
 lm843VuQCIAJ3YoXsrnFDsIjTQz+9CI9R0wxKVmzv4Pr4wpXj/Y8i0BCfiGp7jngSjhoar6AE
 Bqm2hFhwxEo9IOxQkxV3tm0wJHDabEKwweFZaitAIZdJv5i+CPXvBCEDnQm7VCRR4vKPRBcw3
 9CQAbqOPQhVWHAeUEhtrEnd7FTpcCewS0+wB9IVewyeuq+XPUosS+Bn0C2caLxz4toUvH9sOA
 Mw4AbRW33LpEvxQzOJ0UjWGhuCUeO3SV3P7bPlJ2wlMq10VqmS8KdZY296/DQFSRC6rNup5ht
 yCsG6WuMvAksQhtusa0MUsc3OXqah8Lxa3QUKA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> According to "Designing Cards and Drivers for the Macintosh Family" each physical
> nubus slot can access 2 separate address ranges: a super slot memory region which
> is 256MB and a standard slot memory region which is 16MB.
> 
> Currently a Nubus device uses the physical slot number to determine whether it is
> using a standard slot memory region or a super slot memory region rather than
> exposing both memory regions for use as required.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nubus/nubus-device.c  | 36 ++++++++++++++++++------------------
>  include/hw/nubus/nubus.h |  1 +
>  2 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index be01269563..36203848e5 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -168,26 +168,26 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      }
>  
>      nd->slot = nubus->current_slot++;
> -    name = g_strdup_printf("nubus-slot-%d", nd->slot);
> -
> -    if (nd->slot < NUBUS_FIRST_SLOT) {
> -        /* Super */
> -        slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
> -
> -        memory_region_init(&nd->slot_mem, OBJECT(dev), name,
> -                           NUBUS_SUPER_SLOT_SIZE);
> -        memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
> -                                    &nd->slot_mem);
> -    } else {
> -        /* Normal */
> -        slot_offset = nd->slot * NUBUS_SLOT_SIZE;
> -
> -        memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
> -        memory_region_add_subregion(&nubus->slot_io, slot_offset,
> -                                    &nd->slot_mem);
> -    }
>  
> +    /* Super */
> +    slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
> +

Is it possible to remove this patch?

The "(nd->slot - 6)" looks weird and it is removed in patch 20.

If not:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Thanks,
Laurent




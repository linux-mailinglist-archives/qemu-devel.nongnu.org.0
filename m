Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA6A48533E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:09:18 +0100 (CET)
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n562X-0006Wj-E0
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:09:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n55lR-0003r3-EV; Wed, 05 Jan 2022 07:51:37 -0500
Received: from [2607:f8b0:4864:20::82c] (port=41912
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n55lP-0003Ic-PH; Wed, 05 Jan 2022 07:51:37 -0500
Received: by mail-qt1-x82c.google.com with SMTP id v22so37299060qtx.8;
 Wed, 05 Jan 2022 04:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=46SYlHwRcLzuTwDpamb/CQp+wIgdUjzqRuPIZ9qNVIg=;
 b=ZoWfxe5VQGBTPsncCzQhnk32Xl3TN0YIx2qAbPiusv/QgPnFhVEv8imcyeB+Gt75Ub
 3WtFOF5Q2drhvisjfIx57dS36hhtmL2RfMZmxjVFRDZxFdlYD4jJ9WDdm8H+7oRn6+9N
 fmOyg8B0c8aG71MEuO3YfjWB5bwmSVNusqUBR+ZtFEcxq5BwhZ3uX+yYecsDIOi/s+10
 qUgIHvHYKp/1LO8TF7NGItk8+/JSvzjkK+stRlb/T6ueqQ6NqFguklq+ENQ2WJIaQzmD
 9d/J8RnxLjvd0GFfjVNmYyFDgLg+vEh3qIgMU8jFsCSVa1daHQL8iS5oTBg5hWfn5FPP
 GcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=46SYlHwRcLzuTwDpamb/CQp+wIgdUjzqRuPIZ9qNVIg=;
 b=2YugCuB4FJfGXWP4dXJ/tQOw6x8ZYayCDNeIIkydJbRYJK1skE3fez/zYo1pIE3XqG
 k51Zmmg9G3iCMYl1KQqCcEbbO9nnCWZ/3cdSohzigAwKQH+op5uBklPRQbemXi3FMWOE
 d84eBJVYjBDKufaaJm/QMjSJMnr0yKfFRr2gOm0ImGHwxmtwRjy33XgqEup6gR03pIDp
 u16rk1S+e+CWMCQVfGLy/z23qv7drIWdkXfyUkwoicxFuK9NgnNByxZNtBC60H18vTOp
 0DAGt/tcvipPpjyOZ4YhqFX+jKtF8U28TlR0Lkey7A4/hWKVMUVkDjgfhbtWiybdj2uc
 botg==
X-Gm-Message-State: AOAM532zN0Hg4C2eDtJBmOMR9p03MgQ+LMQbJ+RVp8na4ADWdZP/16vc
 IoIRWeDrciVFIFombB2cdhe1i5sXysE=
X-Google-Smtp-Source: ABdhPJwlpvY+y3KH/zNSScDhBKBE+2H4/lAcFPNr1uBXXJoWhYG/E5PuVqsbLobjGGnZ4Zx3W/w78A==
X-Received: by 2002:ac8:5f8e:: with SMTP id j14mr48642474qta.39.1641387094366; 
 Wed, 05 Jan 2022 04:51:34 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id j20sm35784826qko.117.2022.01.05.04.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 04:51:34 -0800 (PST)
Message-ID: <ce60bb33-f62e-133d-6305-8cb3b5201313@gmail.com>
Date: Wed, 5 Jan 2022 09:51:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] MAINTAINERS: Improve the PowerPC machines section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220105104800.407570-1-thuth@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220105104800.407570-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.057,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/5/22 07:48, Thomas Huth wrote:
> Add some documentation files to the corresponding machine sections
> and mention the machine names in the section titles where it is
> not so obvious (e.g. that "taihu" is a 405 machine).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   MAINTAINERS | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f871d759fd..53cf0fdc00 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1245,7 +1245,7 @@ F: hw/openrisc/openrisc_sim.c
>   
>   PowerPC Machines
>   ----------------
> -405
> +405 (ref405ep and taihu)
>   L: qemu-ppc@nongnu.org
>   S: Orphan
>   F: hw/ppc/ppc405_boards.c
> @@ -1281,6 +1281,7 @@ New World (mac99)
>   M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>   L: qemu-ppc@nongnu.org
>   S: Odd Fixes
> +F: docs/system/ppc/powermac.rst
>   F: hw/ppc/mac_newworld.c
>   F: hw/pci-host/uninorth.c
>   F: hw/pci-bridge/dec.[hc]
> @@ -1299,6 +1300,7 @@ Old World (g3beige)
>   M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>   L: qemu-ppc@nongnu.org
>   S: Odd Fixes
> +F: docs/system/ppc/powermac.rst
>   F: hw/ppc/mac_oldworld.c
>   F: hw/pci-host/grackle.c
>   F: hw/misc/macio/
> @@ -1312,6 +1314,7 @@ PReP
>   M: Hervé Poussineau <hpoussin@reactos.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
> +F: docs/system/ppc/prep.rst
>   F: hw/ppc/prep.c
>   F: hw/ppc/prep_systemio.c
>   F: hw/ppc/rs6000_mc.c
> @@ -1324,7 +1327,7 @@ F: include/hw/isa/pc87312.h
>   F: include/hw/rtc/m48t59.h
>   F: tests/avocado/ppc_prep_40p.py
>   
> -sPAPR
> +sPAPR (pseries)
>   M: Cédric Le Goater <clg@kaod.org>
>   M: Daniel Henrique Barboza <danielhb413@gmail.com>
>   R: David Gibson <david@gibson.dropbear.id.au>
> @@ -1336,8 +1339,8 @@ F: include/hw/*/spapr*
>   F: hw/*/xics*
>   F: include/hw/*/xics*
>   F: pc-bios/slof.bin
> -F: docs/specs/ppc-spapr-hcalls.txt
> -F: docs/specs/ppc-spapr-hotplug.txt
> +F: docs/system/ppc/pseries.rst
> +F: docs/specs/ppc-spapr-*
>   F: tests/qtest/spapr*
>   F: tests/qtest/libqos/*spapr*
>   F: tests/qtest/rtas*
> @@ -1348,6 +1351,7 @@ PowerNV (Non-Virtualized)
>   M: Cédric Le Goater <clg@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
> +F: docs/system/ppc/powernv.rst
>   F: hw/ppc/pnv*
>   F: hw/intc/pnv*
>   F: hw/intc/xics_pnv.c


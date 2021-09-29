Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4058F41BFB0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 09:13:00 +0200 (CEST)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVTly-0008NP-UT
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 03:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mVTi1-0005AC-QJ; Wed, 29 Sep 2021 03:08:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57068
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mVTi0-0005Tp-EB; Wed, 29 Sep 2021 03:08:53 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mVThf-0003nP-HM; Wed, 29 Sep 2021 08:08:36 +0100
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-7-david@gibson.dropbear.id.au>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <3aee9d39-5da8-3fd3-b343-d05d87d30bb0@ilande.co.uk>
Date: Wed, 29 Sep 2021 08:08:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210927044808.73391-7-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 6/7] MAINTAINERS: Add information for OpenPIC
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.562,
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 groug@kaod.org, wainersm@redhat.com, hpoussin@reactos.org, clg@kaod.org,
 crosa@redhat.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2021 05:48, David Gibson wrote:

> The OpenPIC interrupt controller was once the de facto standard on ppc
> machines.  In qemu it's now only used on some Macintosh and the
> Freescale e500 machine.  It has no listed maintainer, and as far as I
> know, no-one who's really familiar with it any more.
> 
> Since I'm moving away from the area, I no longer have capacity to do even
> minimal maintenance of it under the auspices of the ppc targets in general.
> 
> Therefore, this patch lists the main part of openpic, and marks it as
> "Odd Fixes" to be looked after by Mark Cave-Ayland who handles the
> Macintosh targets.  The openpic_kvm variant is only used on e500, so
> add it to the files for that machine type (itself already Orphaned).
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7439ef1bd9..c0fcba7f8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1256,6 +1256,8 @@ F: hw/pci-host/ppce500.c
>   F: include/hw/ppc/ppc_e500.h
>   F: include/hw/pci-host/ppce500.h
>   F: pc-bios/u-boot.e500
> +F: hw/intc/openpic_kvm.h
> +F: include/hw/ppc/openpic_kvm.h
>   
>   mpc8544ds
>   L: qemu-ppc@nongnu.org
> @@ -2258,6 +2260,12 @@ F: net/can/*
>   F: hw/net/can/*
>   F: include/net/can_*.h
>   
> +OpenPIC interrupt controller
> +M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> +S: Odd Fixes
> +F: hw/intc/openpic.c
> +F: include/hw/ppc/openpic.h
> +
>   Subsystems
>   ----------
>   Overall Audio backends

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.


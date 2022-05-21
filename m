Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B152FA75
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 11:57:30 +0200 (CEST)
Received: from localhost ([::1]:46008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsLrV-0006oq-HV
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 05:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLpQ-0005h0-Ri; Sat, 21 May 2022 05:55:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLpP-0006qy-AN; Sat, 21 May 2022 05:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W02tl1KtgNM28VgY1AVx7beIZUFgI7X0edt/YgWQKa8=; b=hgEss0wANUWiaTqOBQs/9Wdobd
 okbVpboDG3gzMidNUdrAkTKCvx9S5bWsImEQojmmdkUbAxHaIF6rE9qjY6q+F3dlPhpjAU2JPTNXx
 3iOyfoGAhKLX8blAL3ICxLaFYXAGPtXEgkw1mqAZ5yEASc4afWupBNJhHk8NudkhK7rKmqER8VHRF
 OUvUq5O0Nkt253z/OFG3gGTKb4AHtADdOvRO+H6WPS5Zwerh20fAV+KWubwlTo3H14j0jo8l9e2Cp
 KCSue0IdMwrjET9BOLBwK4rwoGsFV8fPh2WH6mk52aKxL5MYFB2m0KGM0g94xc2UZxzNOgEYQIDmb
 z7JuHHcKzSzyU3N4tlSijMRSg7LHeP6jrdq8sYZ/ZXlGrxUVnPY/XXhLkwmRWnaFaOKeQkfHsUMRt
 5O34qRhVkhkgROLrDWPSyWGSs45WqgSbGWuT5u4jNOHGrbDBZSk9vCUUXeR9UwchZQUuvbRmwrIAh
 fSOP1I7ZGSBdpnOrOCfKdT9pE35zWTqT7BYuIdA4ezya2dhc1OMzPy4SSGtO9Aw/eQp1Y8oaMbQm7
 RsNe/LbGFra3d/d9pesebfKe+yhsZRItng3sZt6QTp4dCIzM0/2db25ydj70EDfN57dPKeTQOS61M
 dQ7FnHxHekBWbHVONVp+UmcPQ8OP/tPf9/baiNDto=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLoK-000AlS-GF; Sat, 21 May 2022 10:54:16 +0100
Message-ID: <48f571d0-e783-4b31-7c90-3d330629c18c@ilande.co.uk>
Date: Sat, 21 May 2022 10:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220520180109.8224-1-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/10] Random cleanup patches
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/05/2022 19:00, Bernhard Beschow wrote:

> v2:
> * Omit removal of isa_connect_gpio_out() (Mark)
> 
> v1:
> This patch series contains random cleanups that I made while studying the code.
> 
> Bernhard Beschow (10):
>    hw: Reuse TYPE_I8042 define
>    hw/audio/cs4231a: Const'ify global tables
>    hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
>    hw/i386/pc: Unexport functions used only internally
>    hw/i386/pc: Remove orphan declarations
>    hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
>    hw/net/fsl_etsec/etsec: Remove obsolete and unused etsec_create()
>    accel/tcg/cpu-exec: Unexport dump_drift_info()
>    accel/tcg: Inline dump_opcount_info() and remove it
>    docs/devel: Fix link to developer mailing lists
> 
>   accel/tcg/cpu-exec.c              |  4 ++--
>   accel/tcg/translate-all.c         |  5 -----
>   docs/devel/submitting-a-patch.rst |  6 +++---
>   hw/audio/cs4231a.c                |  8 ++++----
>   hw/i386/pc.c                      | 17 +++++++++++++----
>   hw/net/fsl_etsec/etsec.c          | 23 -----------------------
>   hw/net/fsl_etsec/etsec.h          |  7 -------
>   hw/ppc/e500.c                     |  1 -
>   hw/sparc64/sun4u.c                |  2 +-
>   include/exec/cpu-all.h            |  3 ---
>   include/hw/i386/pc.h              | 14 --------------
>   11 files changed, 23 insertions(+), 67 deletions(-)

In general these changes look okay, so I'd be fine to give an:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

for those I haven't already given a Reviewed-by tag for.

Laurent, are you happy to take these patches with their current tags via 
qemu-trivial? Or would you prefer an extra set of eyes on the two accel/tcg ones first?


ATB,

Mark.


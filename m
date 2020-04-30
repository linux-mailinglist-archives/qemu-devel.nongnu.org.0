Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620C91C00CD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 17:51:28 +0200 (CEST)
Received: from localhost ([::1]:33558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUBTC-0004sl-CX
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 11:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBQU-0002wJ-Me
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:49:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBPJ-0002QH-BV
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:48:38 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:40428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUBPI-0002Q1-Sk
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:47:25 -0400
Received: by mail-oi1-x234.google.com with SMTP id t199so5623942oif.7
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 08:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=G0QugkU3lC3gVWUePkexmaPi54Cy4B/C7WACB3rJbr8=;
 b=e5cKETANLC+UreFuWU1DNSp7M6w/Z+ImQNDoPhITpCEaUZuwDivna7jDF3q8+dgREO
 gkeXR+J+ApPPMNEbzZOsjJ2oXNDKYjq5ckqoetG/Oau+rClYx+ZUtPY8xEKsdnFSgjlv
 kbJ/kvGHT43JHJXr2Ulu6vqv0Vs4tQ1KXK6kX3p7Ajr8pm/Pp8pTz30wzm63TC6G3A51
 fQjGLsm/UbhXKXStfhVMOeCXjKcfpz6oj5Mw3GTu7+o2qWFHbSqpuHo6PmRUCc6Oo9Mj
 ux1jZMOFr8wOfjNG6SMESTYdxDoCA+xLxFapDQRhRu5UQWDNk16lIMqX/2cv9yCSR9/a
 H/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=G0QugkU3lC3gVWUePkexmaPi54Cy4B/C7WACB3rJbr8=;
 b=G1mtmQXjchCm2C2N8g2CZ5+CMd8HaURJsrruuP3Z/A5K434w0l7qZaovg7Py3R4tfA
 ClWkZluj5xi06Or8Ke8HZ8WReU357yYP4S8H/Jz3hp7cTMJAOq5+G1L4VyuLTwS5V63k
 Pb9cdLxLkF6708f8LaLWGk1COmBqIErIw3IuP4pi2im9xnWxegNXQT6TC52w1kplBR2v
 WlIr77dbSVPG40qhun+sbC/Y22HGBPWUodUvrkAQV/sX3eWQwPFRjW6GVjuO/eOtsgdg
 A3RLs+EQajas97pW6H0UtKeP24ctSCsusmv9yemBk21u86/sMwv+4ucHnUNeMnHV8wl3
 Vp8w==
X-Gm-Message-State: AGi0PuZYQCQ8f4MWEoxh6Gxs2/e6KzgB3pdb+T70hxtB5yu/oZ0kwqW2
 xfVmvjetRqOqk4UW3LojhCrouxNUJdaDE/dguWzjp5DE
X-Google-Smtp-Source: APiQypJP1262BsAQTCLC1UtuHeJ3EEv+CMFPyvTzNIEDl2iZs7Lx9di6hsQdTGZwVE0DTpo/Qg4RYXKNIEAgFdpF9Hg=
X-Received: by 2002:aca:4a45:: with SMTP id x66mr2112336oia.48.1588261642698; 
 Thu, 30 Apr 2020 08:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200430144458.17324-1-peter.maydell@linaro.org>
In-Reply-To: <20200430144458.17324-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2020 16:47:10 +0100
Message-ID: <CAFEAcA9RD+PNqbAuOzBvu8=pFh2dnbtD==U2p+WVRofnT+zRMw@mail.gmail.com>
Subject: Re: [PULL v2 00/30] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x234.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::234
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

On Thu, 30 Apr 2020 at 15:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2:
>  * dropped target/arm/cpu: Use ARRAY_SIZE() to iterate over ARMCPUInfo[]
>  * renamed CLOCK_SECOND to CLOCK_PERIOD_1SEC
>
>
> The following changes since commit 648db19685b7030aa558a4ddbd3a8e53d8c9a062:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-04-29' into staging (2020-04-29 15:07:33 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200430-1
>
> for you to fetch changes up to 6f7b6947a6639fff15c6a0956adf0f5ec004b789:
>
>   hw/arm: xlnx-zcu102: Disable unsupported FDT firmware nodes (2020-04-30 15:35:41 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * xlnx-zdma: Fix endianness handling of descriptor loading
>  * nrf51: Fix last GPIO CNF address
>  * gicv3: Use gicr_typer in arm_gicv3_icc_reset
>  * msf2: Add EMAC block to SmartFusion2 SoC
>  * New clock modelling framework
>  * hw/arm: versal: Setup the ADMA with 128bit bus-width
>  * Cadence: gem: fix wraparound in 64bit descriptors
>  * cadence_gem: clear RX control descriptor
>  * target/arm: Vectorize integer comparison vs zero
>  * hw/arm/virt: dt: add kaslr-seed property
>  * hw/arm: xlnx-zcu102: Disable unsupported FDT firmware nodes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM


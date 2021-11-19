Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB96645763D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:18:07 +0100 (CET)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8Sc-0001Lb-RU
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:18:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8QS-0008E7-Pn
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:15:53 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:37325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8QQ-0000qu-C6
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:15:52 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CFD85755F74;
 Fri, 19 Nov 2021 19:15:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B6224748F54; Fri, 19 Nov 2021 19:15:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B44BF746353;
 Fri, 19 Nov 2021 19:15:46 +0100 (CET)
Date: Fri, 19 Nov 2021 19:15:46 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-7.0 1/5] hw/display: Rename VGA_ISA_MM -> VGA_MMIO
In-Reply-To: <20211119171202.458919-2-f4bug@amsat.org>
Message-ID: <bba367ed-e3a-d6e5-2d88-93ca51ebccd4@eik.bme.hu>
References: <20211119171202.458919-1-f4bug@amsat.org>
 <20211119171202.458919-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1645420269-1637345746=:35384"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1645420269-1637345746=:35384
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 19 Nov 2021, Philippe Mathieu-Daudé wrote:
> There is no ISA bus part in the MMIO VGA device, so rename:
>
> *  hw/display/vga-isa-mm.c -> hw/display/vga-mmio.c
> *  CONFIG_VGA_ISA_MM -> CONFIG_VGA_MMIO
> *  ISAVGAMMState -> VGAMmioState
> *  isa_vga_mm_init() -> vga_mmio_init()
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> configs/devices/mips-softmmu/common.mak |  2 +-
> include/hw/display/vga.h                |  2 +-
> hw/display/{vga-isa-mm.c => vga-mmio.c} | 16 ++++++++--------
> hw/mips/jazz.c                          |  2 +-
> hw/display/Kconfig                      |  2 +-
> hw/display/meson.build                  |  2 +-
> hw/mips/Kconfig                         |  2 +-
> 7 files changed, 14 insertions(+), 14 deletions(-)
> rename hw/display/{vga-isa-mm.c => vga-mmio.c} (93%)
--3866299591-1645420269-1637345746=:35384--


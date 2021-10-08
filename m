Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C10426A10
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:47:01 +0200 (CEST)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoL5-0005r1-U8
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoHI-0004pi-2r
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:43:04 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoHA-0000T5-GZ
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:43:02 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7hrw-1mmkHP1z8M-014nNm; Fri, 08 Oct 2021 13:42:53 +0200
Subject: Re: [PATCH v4 00/13] macfb: fixes for booting MacOS
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211007221253.29024-1-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6b8e24cf-b89c-0026-d0b9-d8ec1e7f8aba@vivier.eu>
Date: Fri, 8 Oct 2021 13:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007221253.29024-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BUqdYIo6QJ7SzX1KA5FKf69WkLYWhze9E7Sq9yN/xT4rZDrmBsx
 lMEOgq8iAyG657QgWN+EXuUbd9m8PhVUzzyUAIsR+Fb2jAGN5re3FxGfSFyHSlr2+3gUFo7
 UP4tjXm68dQ7B58towwWhR6XRoFlYuLQyDN0QbkbE2GWhzj7XXi+E+v2x8xUxTeCnYWDvTB
 2mP/AmUuWhagyx+uFKyYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EQpBdjEnfbY=:Kr1hqJVuKjLnMgmenlrIvD
 BpsJyq59BxrbjnEy08pIGwa0GbDTCYOsmR6xYeIStrguFVlRwnTgkg4TeDSqaFciuKaJnOTiV
 cJmpeTYq6RVPW2SSSA0gtFLnlsAycPm7hUzrkEacRJHEETOVePJb5UMUL1ylJ0DzHnrJ+xniv
 QU7RvG400Ez/rCsrXXrTLrUcm8zfo3A2arfXR6bAFn5c67bLvepthcmGilofq4wXiuaU4Ydm5
 UbIH+5IPPAoR4pkc2+UPnywXTHnbCctLpmEC5LytL1YFGfQzrTCAUb1/hSw36NDjC8nUZqYhk
 rRe86cfJMi8BmzD7kDfK3eMWpUCRFsuvHjVlqPU4qMG4YMFl5Hyz9egnltmx9VtH9t6Qh9lMO
 xbqOpr+bHo6BchiqOnaF6/Tgv8tu3KRNSUEc5SPAViN76ljVbJwZIrzeX/qAYlKl88Piz8f2m
 MPGspzuQxes6AOwwsTT3YlFfiSDg1dZKEcsiFnwzOwRbNpRxnmKnhPS3dtPc08xhtAzI32QP+
 Tci8hMcGVIz79yyjr2BsuIFPQX+ra/pPNlzOkPUor++/zmYiVcNK8aOrYnqudjcUzsoZz5rWD
 DIinmqzsmvAHPECOC34J/kEDYUSnDwjc6GkbCP8fiAf/d+SV3tS98qHsY6xcT9gHDpOtBIbnh
 I3SS5rLesN0rDYXe+tb9VCcGEySx1YniVrWBUU9hzwoqSG9mQNHOLVV7jjQ5gto4ISrMCDSc8
 9FHfiTKRj0+PzszsQi+3baBsK1tlVbujiXE88w==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/10/2021 à 00:12, Mark Cave-Ayland a écrit :
> This is the next set of patches to allow users to boot MacOS in QEMU's
> q800 machine.
> 
> Patches 1 to 4 are fixes for existing bugs that I discovered whilst
> developing the remainder of the patchset whilst patch 5 simplifies the
> registration of the framebuffer RAM.
> 
> Patch 6 adds trace events to the framebuffer register accesses. The
> framebuffer registers are not officially documented, so the macfb
> device changes here are based upon reading of Linux/NetBSD source code,
> using gdbstub during the MacOS toolbox ROM initialisation, and changing
> the framebuffer size/depth within MacOS itself with these trace events
> enabled.
> 
> Patches 7 and 8 implement the mode sense logic documented in Apple
> Technical Note HW26 "Macintosh Quadra Built-In Video" and configure the
> default display type to be VGA.
> 
> Patch 9 implements the common monitor modes used for VGA at 640x480 and
> 800x600 for 1, 2, 4, 8 and 24-bit depths and also the Apple 21" color
> monitor at 1152x870 with 8-bit depth.
> 
> Patches 10 and 11 fix up errors in the 1-bit and 24-bit pixel encodings
> discovered when testing these color depths in MacOS.
> 
> Patch 12 adds a timer to implement the 60.15Hz VBL interrupt which is
> required for MacOS to process mouse movements, whilst patch 13 wires the
> same interrupt to a dedicated pin on VIA2 reserved for the video
> interrupt on the Quadra 800.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> v4:
> - Rebase onto master
> - Add R-B tags from Laurent
> - Change %d to %u for the macfb_ctrl_* trace-events size parameter in patch 6
> 
> v3:
> - Rebase onto master
> - Add Laurent's code for displaying supported display modes as an error hint in patch 9
>   and update the patch description
> - Fix typo in patch 8 description: 32-bit -> 24-bit
> - Split Error API changes from patch 1 into a new patch 2
> 
> v2:
> - Rebase onto master
> - Add R-B tags from Zoltan, Philippe and Laurent
> - Rework macfb_common_realize() to return a bool in patch 1
> - Add Fixes tag to patch 2
> - Use Laurent's suggested change for s->current_palette (slightly modified) in patch 3
> - Change size trace-events parameter to unsigned int in patch 5
> - Add assert() as suggested by Philippe in patch 7
> - Move calculation of next VBL time into a separate macfb_next_vbl() function in patch 11
> 
> Mark Cave-Ayland (13):
>   macfb: handle errors that occur during realize
>   macfb: update macfb.c to use the Error API best practices
>   macfb: fix invalid object reference in macfb_common_realize()
>   macfb: fix overflow of color_palette array
>   macfb: use memory_region_init_ram() in macfb_common_realize() for the
>     framebuffer
>   macfb: add trace events for reading and writing the control registers
>   macfb: implement mode sense to allow display type to be detected
>   macfb: add qdev property to specify display type
>   macfb: add common monitor modes supported by the MacOS toolbox ROM
>   macfb: fix up 1-bit pixel encoding
>   macfb: fix 24-bit RGB pixel encoding
>   macfb: add vertical blank interrupt
>   q800: wire macfb IRQ to separate video interrupt on VIA2
> 
>  hw/display/macfb.c         | 386 ++++++++++++++++++++++++++++++++++---
>  hw/display/trace-events    |   7 +
>  hw/m68k/q800.c             |  23 ++-
>  include/hw/display/macfb.h |  43 +++++
>  4 files changed, 429 insertions(+), 30 deletions(-)
> 

Applied to my q800 branch,

Thanks,
Laurent


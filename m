Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C79F4DB34
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 22:26:07 +0200 (CEST)
Received: from localhost ([::1]:52732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he3dG-0004RL-CI
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 16:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46566)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1he381-0007xL-Mw
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 15:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1he37z-0005uE-Ma
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 15:53:49 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:42411)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1he37z-0005qh-E3
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 15:53:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4BD367462AA;
 Thu, 20 Jun 2019 21:53:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2FDD07461AE; Thu, 20 Jun 2019 21:53:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2F0377461AA;
 Thu, 20 Jun 2019 21:53:44 +0200 (CEST)
Date: Thu, 20 Jun 2019 21:53:44 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
In-Reply-To: <20190620151104.2678-1-kraxel@redhat.com>
Message-ID: <alpine.BSF.2.21.9999.1906202153170.19717@zero.eik.bme.hu>
References: <20190620151104.2678-1-kraxel@redhat.com>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-devel] [PATCH 0/3] add ati vgabios
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jun 2019, Gerd Hoffmann wrote:
> Gerd Hoffmann (3):
>  seabios: add config for ati vgabios
>  seabios: add ati vgabios binary
>  ati-vga: switch to vgabios-ati.bin
>
> hw/display/ati.c        |   2 +-
> pc-bios/vgabios-ati.bin | Bin 0 -> 38912 bytes
> roms/config.vga-ati     |   4 ++++
> 3 files changed, 5 insertions(+), 1 deletion(-)
> create mode 100644 pc-bios/vgabios-ati.bin
> create mode 100644 roms/config.vga-ati

Tested-by: BALATON Zoltan <balaton@eik.bme.hu>


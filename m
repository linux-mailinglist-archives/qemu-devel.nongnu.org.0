Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3C3FCE9C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 22:35:40 +0200 (CEST)
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLATm-0008PE-RJ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 16:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLARc-0005oD-K4; Tue, 31 Aug 2021 16:33:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55140
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLARb-0002sK-4t; Tue, 31 Aug 2021 16:33:20 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLAR8-00017u-Hk; Tue, 31 Aug 2021 21:32:53 +0100
To: John Arbuckle <programmingkidx@gmail.com>, peter.maydell@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, hsp.cat7@gmail.com, balaton@eik.bme.hu
References: <20210831165020.84855-1-programmingkidx@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <694bebbe-9920-c110-4331-47cefbdfde51@ilande.co.uk>
Date: Tue, 31 Aug 2021 21:33:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831165020.84855-1-programmingkidx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] Add qemu_vga.ndrv to build/pc-bios folder
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/08/2021 17:50, John Arbuckle wrote:

> Currently the file qemu_vga.ndrv is not copied into the /build/pc-bios folder. This makes all video resolution choices disappear from a PowerPC Mac OS guest. This patch has the qemu_vga.ndrv file copied into the build/pc-bios folder giving users back their video resolution choices.
> 
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
>   configure | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 9a79a004d7..281577e46f 100755
> --- a/configure
> +++ b/configure
> @@ -5056,7 +5056,9 @@ for bios_file in \
>       $source_path/pc-bios/openbios-* \
>       $source_path/pc-bios/u-boot.* \
>       $source_path/pc-bios/edk2-*.fd.bz2 \
> -    $source_path/pc-bios/palcode-*
> +    $source_path/pc-bios/palcode-* \
> +    $source_path/pc-bios/qemu_vga.ndrv
> +
>   do
>       LINKS="$LINKS pc-bios/$(basename $bios_file)"
>   done

I think the patch looks correct, however the commit message and subject aren't quite 
right. How about something like:

[PATCH] configure: add missing pc-bios/qemu_vga.ndrv symlink in build tree

Ensure that a link to pc-bios/qemu_vga.ndrv is added to the build tree, otherwise the 
optional MacOS client driver will not be loaded by OpenBIOS when launching QEMU 
directly from the build directory.


ATB,

Mark.


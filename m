Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6BBF71C9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 11:23:49 +0100 (CET)
Received: from localhost ([::1]:50540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU6rM-0001cf-IG
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 05:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aurelien@aurel32.net>) id 1iU6hb-0004PC-Sc
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 05:13:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aurelien@aurel32.net>) id 1iU6hZ-0008EI-P4
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 05:13:43 -0500
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:46980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aurelien@aurel32.net>)
 id 1iU6hX-0008DX-SC
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 05:13:40 -0500
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1iU6hV-0002K9-Pa; Mon, 11 Nov 2019 11:13:37 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.92.3)
 (envelope-from <aurelien@aurel32.net>)
 id 1iU6hV-0007Wu-Ay; Mon, 11 Nov 2019 11:13:37 +0100
Date: Mon, 11 Nov 2019 11:13:37 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Subject: Re: [PATCH 4/5] MAINTAINERS: Adjust maintainership for Malta board
Message-ID: <20191111101337.GC28851@aurel32.net>
References: <1573240249-6966-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1573240249-6966-5-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573240249-6966-5-git-send-email-aleksandar.markovic@rt-rk.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:bc8:30d7:100::1
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, qemu-devel@nongnu.org,
 hpoussin@reactos.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 aleksandar.rikalo@rt-rk.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2019-11-08 20:10, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>=20
> Change the maintainership for Malta board to improve its quality.
>=20
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a478f8..1a49381 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -941,8 +941,9 @@ F: hw/display/jazz_led.c
>  F: hw/dma/rc4030.c
> =20
>  Malta
> -M: Aurelien Jarno <aurelien@aurel32.net>
> -R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
> +M: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> +R: Herv=E9 Poussineau <hpoussin@reactos.org>
> +R: Aurelien Jarno <aurelien@aurel32.net>
>  S: Maintained
>  F: hw/mips/mips_malta.c
>  F: hw/mips/gt64xxx_pci.c

Acked-by: Aurelien Jarno <aurelien@aurel32.net>

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19F6C0EB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 20:23:44 +0200 (CEST)
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnoad-0002CK-FQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 14:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54183)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sw@weilnetz.de>) id 1hnoaQ-0001lG-1s
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 14:23:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sw@weilnetz.de>) id 1hnoaO-0000Jn-FX
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 14:23:29 -0400
Received: from smtp.mail.uni-mannheim.de ([2001:7c0:600:60::869b:6050]:39616)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sw@weilnetz.de>) id 1hnoaO-0000FJ-3J
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 14:23:28 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 19FC91039D2;
 Wed, 17 Jul 2019 20:23:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
 by localhost (mail-r83.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id k2Rud2oOePeo; Wed, 17 Jul 2019 20:23:19 +0200 (CEST)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
 by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id E3205102508;
 Wed, 17 Jul 2019 20:23:18 +0200 (CEST)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190717134335.15351-1-alex.bennee@linaro.org>
 <20190717134335.15351-17-alex.bennee@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Openpgp: preference=signencrypt
Autocrypt: addr=sw@weilnetz.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <808ea700-759e-b914-f4d8-1ad5df3fcac7@weilnetz.de>
Date: Wed, 17 Jul 2019 20:23:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717134335.15351-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE-1901
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:7c0:600:60::869b:6050
Subject: Re: [Qemu-devel] [PATCH v2 16/23] NSIS: Add missing firmware blobs
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.07.2019 um 15:43 schrieb Alex Benn=C3=A9e:
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Various firmwares has been added in the pc-bios/ directory:
>
> - CCW     (since commit 0c1fecdd523)
> - Skiboot (since commit bcad45de6a0)
> - EDK2    (since commit f7fa38b74c3)
>
> Since we install qemu-system able to run the architectures
> targetted by these firmware, include them in the NSIS exe.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20190715174817.18981-10-philmd@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  qemu.nsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/qemu.nsi b/qemu.nsi
> index 75f1608b9e0..89c7c04f957 100644
> --- a/qemu.nsi
> +++ b/qemu.nsi
> @@ -122,6 +122,9 @@ Section "${PRODUCT} (required)"
>      File "${BINDIR}\*.bmp"
>      File "${BINDIR}\*.bin"
>      File "${BINDIR}\*.dtb"
> +    File "${BINDIR}\*.fd"
> +    File "${BINDIR}\*.img"
> +    File "${BINDIR}\*.lid"
>      File "${BINDIR}\*.rom"
>      File "${BINDIR}\openbios-*"
> =20


Hi,

what about qemu_vga.ndrv? And all new file pattern should also be added
to the uninstall section.

Regards,
Stefan



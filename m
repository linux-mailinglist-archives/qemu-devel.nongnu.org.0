Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEF5D5C3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 19:56:46 +0200 (CEST)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiN1K-0006W5-4u
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 13:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hiLI0-0003YL-8e
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:05:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hiLHz-0001Mf-7x
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:05:52 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:45105)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hiLHy-0001Jm-RX; Tue, 02 Jul 2019 12:05:51 -0400
Received: by mail-lf1-x143.google.com with SMTP id u10so11756804lfm.12;
 Tue, 02 Jul 2019 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MelK9/24wgEDxir8AlFJoXVIGm/gACqxwd68SwN6Unw=;
 b=UXLmdoFdeFQOuGae+Klm8S09pNd/PGd3Fx4USmE8o8R1amXntyB7AFTo9h/9LZmMHJ
 IZ5GfynwjKI98kATLzMeYPoQLUvZKRYNAH0bmjvAfgCbVW/wZSWtZ1CMCh5ams5xaE3L
 yJuqa8Pzis8y8Kg5BdQaZvvQ8ILo7z30MFngQJWgJzMOKyhuLFOpa6j08K55SjO+TiuP
 jGH7m31cKOXkM/h2gRjgyfx40P0LpPRkJnCkGR8gdueeL7/lA6Kz0VGQ9cSyD3kiW42T
 J9Ux3BuILDg4FkmjujPsVwa+cAZneGx5ErfnvMB655x5ldctsIBI/4/KwYETDXqtWxEP
 Ybjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MelK9/24wgEDxir8AlFJoXVIGm/gACqxwd68SwN6Unw=;
 b=iH9/opyYHAXkgRAirk/3Zpx4n/PF6D+EOm1K3L+ck7nP+LzFTDFWw0fyjmIalSYwus
 VvSceeX/g6ZDcga7ZWXlL48hJywMS2mrfXpZWsltXeuhmZyoLFIzRhginjwX0FwCMxd0
 ljg1JF4+uYc/uOxeFZwJCOSP2eCthNPAyWX7HpG7nYfKctXp4kMFyRrzduor5hmGKRyA
 tCukZdW+Y+nGImm/fHCqIYffnXnKvnVB+emrACUzzZPlIDpPMBP2Rmz+vqxWX/7rdgG4
 zbWKxhKakniteSPWSSi7ubRcKS9ahZQ/27a5boGexa4e4/5GqDrCgEAph6nk6ZBZKn9C
 sB5A==
X-Gm-Message-State: APjAAAWHIwGsTvHMOQGN7B6iGsNxWocP98waLpYumci5uAzMrxNGrXUd
 WhMmlP8LOL2cWIpSevjdQBnq7qD4nSMjO7W915M=
X-Google-Smtp-Source: APXvYqxcD7/ledexO5fqoAvjpv9rCd/E8M+qmxQM0/puQbPP2Z2AS4fjg8Qw5NjaP33oBiWzu/p5trcJflQg9sINne8=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr211477lfu.141.1562083546622;
 Tue, 02 Jul 2019 09:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com>
 <20190702001301.4768-5-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-5-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:02:43 -0700
Message-ID: <CAKmqyKO-yYE5-bWnWLAvKA2ZAAiCkH9_WUNsS2GF0GhCMGzf9Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-devel] [PATCH v2 4/9] hw/block/pflash_cfi01: Start state
 machine as READY to accept commands
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 1, 2019 at 5:14 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> When the state machine is ready to accept command, the bit 7 of
> the status register (SR) is set to 1.
> The guest polls the status register and check this bit before
> writting command to the internal 'Write State Machine' (WSM).
>
> Set SR.7 bit to 1 when the device is created.
>
> Reference: Read Array Flowchart
>   "Common Flash Interface (CFI) and Command Sets"
>    (Intel Application Note 646)
>    Appendix B "Basic Command Set"
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 33c77f6569..dd1dfd266b 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -764,7 +764,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>      }
>
>      pflash_mode_read_array(pfl);
> -    pfl->status =3D 0;
> +    pfl->status =3D 0x80; /* WSM ready */
>      /* Hardcoded CFI table */
>      /* Standard "QRY" string */
>      pfl->cfi_table[0x10] =3D 'Q';
> --
> 2.20.1
>


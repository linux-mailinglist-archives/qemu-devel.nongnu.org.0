Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3963D155BDB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 17:34:21 +0100 (CET)
Received: from localhost ([::1]:60408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j06aC-0007eU-9d
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 11:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1j06YA-0005Km-Si
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 11:32:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1j06Y8-0002Ui-Vg
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 11:32:14 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40731)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1j06Y8-0002T3-OT; Fri, 07 Feb 2020 11:32:12 -0500
Received: by mail-wr1-x444.google.com with SMTP id t3so3405026wru.7;
 Fri, 07 Feb 2020 08:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s8WHZwwsqqzS7ulVZKw3O52kQ41FpfMk1ogLky/AC6c=;
 b=ajvN/jFpi1dyRMBmxDaZ8MHZBF8OQr9lSq0wznyhRLTZdbySclPB9vAUgfiB/T+UU/
 mLD7e0s+dO5bqWj0EIcvIRRlEjwkQuhFq6fjjQyooArBlf9ot3MejY+EfurCURR8FRFN
 x6I/ehM1u9ycdgAGIT8pCygNtFh4OXVCaHeNTTLkGhqD5c5Gp87hMOqtCTKC2Q415ZGc
 OcKtbOe/Sa7+Ruw+vNsxLCA7YzIY+5CFw/0OlVcJ8/nf1DwgLqknUeRkY67kC3u7lS0r
 WGIwzmLLPnijo4s/EeJpeu97ktfKDQOwAgsYvBMNGC2UBtlB6TqCNWeWYP+7ivwfGVsO
 7X7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s8WHZwwsqqzS7ulVZKw3O52kQ41FpfMk1ogLky/AC6c=;
 b=PkThbBsWZEz+Cb6z8YXXeF5duU3KrTE1eWi1zVLEKPDwknkTFaEihale+6ya71tT3a
 7ZkbXUkhBdWAGPqwOcGzahbUT86gnu2/6Pi5gz+dmBk+aqDbEG+g7PfwgG+TMU6IKyQv
 H1yOuwU2qOWZxe3GVzdICpWPdck6XsDhzQxWDjXgW/ccYqTH+tL+dVdx5ocVRAKUnADh
 uSOG3pNoeWDojfLTyGbgNOMcahMgVAs16wti/UfwYjaGXuQQkujzGjRCH2WJgaBrBZ/U
 U/OI/Of9/9FV9XSKno+4In8Mwa//QLBpCpdoI+0lrrLufn58Gh22djDEUz5kW8WIilNx
 L/aw==
X-Gm-Message-State: APjAAAUHReUxQrCPf6avaNuZIiZq2SaUInIEWkOumrNmVXM/Mv9sQipa
 FjzuABFjf5gAZ/NlD86k4hZ+Qg1istRxF47I4Tk=
X-Google-Smtp-Source: APXvYqzv046zaGv11f9JP7gkZBskeRRcVF52SNVFTwX6H5KywAmipUHjtHDeeZxucHLm7f0hFKjUIHgpvFB/F31Eibs=
X-Received: by 2002:a05:6000:1289:: with SMTP id
 f9mr5269404wrx.381.1581093131486; 
 Fri, 07 Feb 2020 08:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20200207161948.15972-1-philmd@redhat.com>
 <20200207161948.15972-4-philmd@redhat.com>
In-Reply-To: <20200207161948.15972-4-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 7 Feb 2020 17:31:59 +0100
Message-ID: <CAJ+F1CJmFrH7H503cExpR3SVAJ99uGDM_AdkieSwNSh4D859yg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] vl: Abort if multiple machines are registered as
 default
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, qemu trival <qemu-trivial@nongnu.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu-s390x list <qemu-s390x@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 7, 2020 at 5:21 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> It would be confusing to have multiple default machines.
> Abort if this ever occurs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Use assert() instead of human friendly message (Marc-Andr=C3=A9)
> v3: Move the check to find_machine() (Michael)
>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  vl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 7dcb0879c4..ebc203af0d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1184,16 +1184,18 @@ static MachineClass *find_machine(const char *nam=
e, GSList *machines)
>  static MachineClass *find_default_machine(GSList *machines)
>  {
>      GSList *el;
> +    MachineClass *default_machineclass =3D NULL;
>
>      for (el =3D machines; el; el =3D el->next) {
>          MachineClass *mc =3D el->data;
>
>          if (mc->is_default) {
> -            return mc;
> +            assert(default_machineclass =3D=3D NULL && "Multiple default=
 machines");
> +            default_machineclass =3D mc;
>          }
>      }
>
> -    return NULL;
> +    return default_machineclass;
>  }
>
>  static int machine_help_func(QemuOpts *opts, MachineState *machine)
> --
> 2.21.1
>


--=20
Marc-Andr=C3=A9 Lureau


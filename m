Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6477B532A20
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:14:16 +0200 (CEST)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTQV-0001Jc-GU
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntT2q-0006LN-1a
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:49:49 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ntT2m-0003lO-VD
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:49:46 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F86921A02;
 Tue, 24 May 2022 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653392983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yoHwGliRSGKTY2b9iTzE0DGHoM408AwkxdCdwwQukos=;
 b=njsAKFVDMSoUWPqnjdiNvFMy80V6tZyq7itkZZt8UiY2HTk1q4h3eF/UVJnBwA5OhLGhBa
 OqW4Ttz/9SWmy4BpI9E8x4Pf3fy4fFkM3bz1exfEPAG9pyou1z+EZnod4W5m2AolHY74iw
 UQ0sHsGVTWpYw+sILthhMlOfvkQ1YDw=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2661213ADF;
 Tue, 24 May 2022 11:49:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /T80BlfGjGIaSAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Tue, 24 May 2022 11:49:43 +0000
Message-ID: <077c28cfd3a7d10df6a08d26bcb721aa2d46bec1.camel@suse.com>
Subject: Re: [PATCH v3 0/2] modules: Improve modinfo.c support
From: Dario Faggioli <dfaggioli@suse.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Date: Tue, 24 May 2022 13:49:41 +0200
In-Reply-To: <20210929050908.3fqf3wwbk6vrtziu@sirius.home.kraxel.org>
References: <20210928204628.20001-1-jziviani@suse.de>
 <20210929050908.3fqf3wwbk6vrtziu@sirius.home.kraxel.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-bf/93m+bu5InezDO49Xp"
User-Agent: Evolution 3.44.1 (by Flathub.org)) 
MIME-Version: 1.0
Received-SPF: pass client-ip=195.135.220.28; envelope-from=dfaggioli@suse.com;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--=-bf/93m+bu5InezDO49Xp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello! Sorry for bringing up an old thread, but I'd have a question
about this series.

As far as I can see, the patches were fine, and they were Acked, but
then the series was never committed... Is this correct?

If yes, can it be committed (I'm up for rebasing and resending, if it's
necessary)? If not, would it be possible to know what's missing, so
that we can continue working on it?

The reason I'm asking is that in our (openSUSE) build system, we're
still seeing the failures shown below; so far, we've had some rather
ugly downstream patches to deal with those, but we've recently
discovered they're not only ugly... they're also broken! :-/

I'm not sure if (and if yes why) this seems to be a problem only for
us, but it'd be great to get rid of both the failures and the patches
(assuming that what is implemented in this series is also of general
use, and good for the project... which, AFAIUI, it should be).

Any kind of feedback would be greatly appreciated.

Thanks and Regards

[PS. I've removed Jose, as his SUSE email address is no longer valid]

On Wed, 2021-09-29 at 07:09 +0200, Gerd Hoffmann wrote:
> On Tue, Sep 28, 2021 at 05:46:26PM -0300, Jose R. Ziviani wrote:
> > This patchset introduces the modinfo_kconfig aiming for a fine-tune
> > control of module loading by simply checking Kconfig options during
> > the
> > compile time, then generates one modinfo-<target>-softmmu.c per
> > target.
> >=20
> > The main reason of this change is to fix problems like:
> > $ ./qemu-system-s390x -nodefaults -display none -accel tcg -M none
> > -device help | head
> > Failed to open module: /.../hw-display-qxl.so: undefined symbol:
> > vga_ioport_read
> > Failed to open module: /.../hw-display-virtio-vga.so: undefined
> > symbol: vmstate_vga_common
> > Failed to open module: /.../hw-display-virtio-vga.so: undefined
> > symbol: vmstate_vga_common
> > Failed to open module: /.../hw-display-virtio-vga-gl.so: undefined
> > symbol: have_vga
> > Failed to open module: /.../hw-usb-smartcard.so: undefined symbol:
> > ccid_card_ccid_attach
> > Failed to open module: /.../hw-usb-redirect.so: undefined symbol:
> > vmstate_usb_device
> > Failed to open module: /.../hw-usb-host.so: undefined symbol:
> > vmstate_usb_device
> >=20
> > With this patch, I run this small script successfuly:
> > =C2=A0=C2=A0=C2=A0 #!/bin/bash
> > =C2=A0=C2=A0=C2=A0 pushd ~/suse/virtualization/qemu/build
> > =C2=A0=C2=A0=C2=A0 for qemu in qemu-system-*
> > =C2=A0=C2=A0=C2=A0 do
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [[ -f "$qemu" ]] || continue
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res=3D$(./$qemu -nodefaults =
-display none -accel tcg -M none
> > -device help 2>&1 | grep "Failed to" > /dev/null; echo $?)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [[ $res -eq 0 ]] && echo "Er=
ror: $qemu"
> > =C2=A0=C2=A0=C2=A0 done
> > =C2=A0=C2=A0=C2=A0 popd
> >=20
> > Also run 'make check' and 'check-acceptance' without any failures.
>=20
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>=20
> take care,
> =C2=A0 Gerd
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-bf/93m+bu5InezDO49Xp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmKMxlUACgkQFkJ4iaW4
c+7hnhAAkj8x5jATmgTH5ypaC3f5f5fWTQx+3Df7Me4x+BRnvZyVz01nJLeB+VOy
8ACZ7RH52DB0TKP978odyX/Z3yobi77LN0mMMbmcqJKSa/bw6jUlNWXha/OgDvDr
aj8s4GZXKaujcmJ1bsXBsXGqsLkun4y7PPoUbQSxkwx0lqSjdTcXGyl0SZfzIybU
AbcTZF/lFnJh/Kt2bh1BXYlg9r+9/3OdNSZ5LPcaSTbIAkQVh1lt39jrZUo1udYr
qzG7AvGAP6xe/aew4Y/MuTRrmQARLDBPJBMiCJuZSPIIUbSSMNv+R8GeT5h9d50H
BZjnZ3DB98oXY+P3+qUh2MLbkp4iWmSPYUugFKyYKlUtcDuA/lhIzHvDewwPRGOs
Jz6VUS/1mEMLXoJ8dFuk0doPqjAaMHngxFCZB0uKozORWTnoUveOKzStJSo/3TpN
LMBbCyw0ft/ivDGP3XkyeHeSpElMa+WCx4WT7q4PUTnvF3nvNe37DmWJsgSqcxNP
0iJ6W4YH2QihUi56W1oeUOk3FL23RkSVAlh00kpG/zmT0alp0He1wUkyOLtYLlaJ
oMClzvrkDw4qQ7ADNvFEUG3Z0uxdKqCdd/JObLaM8/IlvACJ+BcBta5sbuSXNopz
XOLJ8i7rl8fujcS/HwOY0Py6b362gGJAHeibC/iiGEzIzr+sXjY=
=5DqY
-----END PGP SIGNATURE-----

--=-bf/93m+bu5InezDO49Xp--


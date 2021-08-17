Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CDD3EF244
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 20:53:35 +0200 (CEST)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG4DO-0004qv-KS
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 14:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1mG4B5-00048P-Jq; Tue, 17 Aug 2021 14:51:11 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:55926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1mG4B3-00009B-UG; Tue, 17 Aug 2021 14:51:11 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6F3E21FE6;
 Tue, 17 Aug 2021 18:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629226266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3R5gh2C51rvp0kjdBygGSfzXFoP4g9eLjc6eURbPkAc=;
 b=qu68zCI/Ar5X0+Wlk41PBr0iiZfWlUr+bBUATb1UbqJkCbMBzQuEQi2dMQSQ9mUJ42lqS8
 C51ZW1D7F5FeMIkkv3TT/VJczQ7vStkV77xI1ca7RurOBZxSb06QtoTVFVg+KZxJUVS/wi
 wkUHlftQJg33VzpmBOO8f8mRL5InTzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629226266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3R5gh2C51rvp0kjdBygGSfzXFoP4g9eLjc6eURbPkAc=;
 b=QXNEO5O7urVtX8bL2jmvQQBFj/8f9zAprHWXja8sxU816+Opk1NAAmkgGg8ra3RpUr30Wo
 Ic1bf7IcowlVlwDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E01C6136BF;
 Tue, 17 Aug 2021 18:51:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id GGrLKBgFHGHPBQAAGKfGzw
 (envelope-from <jziviani@suse.de>); Tue, 17 Aug 2021 18:51:04 +0000
Date: Tue, 17 Aug 2021 15:51:02 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3] vga: don't abort when adding a duplicate isa-vga device
Message-ID: <YRwFFunps1sgKkHC@pizza>
References: <20210816135504.9089-1-jziviani@suse.de>
 <f047a8d8-93f5-3f62-0834-c036931090d2@redhat.com>
 <cd2d673b-c9aa-1b9a-7025-9afb787f99b6@ilande.co.uk>
 <bc835acf-7a75-3270-019b-d24b7fab3413@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AlsGQrilVXb1u51Z"
Content-Disposition: inline
In-Reply-To: <bc835acf-7a75-3270-019b-d24b7fab3413@redhat.com>
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AlsGQrilVXb1u51Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 10:07:55AM +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> On 8/17/21 9:36 AM, Mark Cave-Ayland wrote:
> > On 17/08/2021 08:25, Thomas Huth wrote:
> >=20
> >> On 16/08/2021 15.55, Jose R. Ziviani wrote:
> >>> If users try to add an isa-vga device that was already registered,
> >>> still in command line, qemu will crash:
> >>>
> >>> $ qemu-system-mips64el -M pica61 -device isa-vga
> >>> RAMBlock "vga.vram" already registered, abort!
> >>> Aborted (core dumped)
> >>>
> >>> That particular board registers the device automaticaly, so it's
> >>> not obvious that a VGA device already exists. This patch changes
> >>> this behavior by displaying a message and exiting without crashing.
> >>>
> >>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
> >>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> >>> ---
> >>> v2 to v3: Improved error message
> >>> v1 to v2: Use error_setg instead of error_report
> >>>
> >>> =C2=A0 hw/display/vga-isa.c | 10 ++++++++++
> >>> =C2=A0 1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> >>> index 90851e730b..30d55b41c3 100644
> >>> --- a/hw/display/vga-isa.c
> >>> +++ b/hw/display/vga-isa.c
> >>> @@ -33,6 +33,7 @@
> >>> =C2=A0 #include "hw/loader.h"
> >>> =C2=A0 #include "hw/qdev-properties.h"
> >>> =C2=A0 #include "qom/object.h"
> >>> +#include "qapi/error.h"
> >>> =C2=A0 #define TYPE_ISA_VGA "isa-vga"
> >>> =C2=A0 OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
> >>> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev,
> >>> Error **errp)
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemoryRegion *vga_io_memory;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const MemoryRegionPortio *vga_ports, *=
vbe_ports;
> >>> +=C2=A0=C2=A0=C2=A0 /*
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 * make sure this device is not being added =
twice, if so
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 * exit without crashing qemu
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>> +=C2=A0=C2=A0=C2=A0 if (qemu_ram_block_by_name("vga.vram")) {
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "'isa-vg=
a' device already registered");
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >>> +=C2=A0=C2=A0=C2=A0 }
> >>> +
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->global_vmstate =3D true;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vga_common_init(s, OBJECT(dev));
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->legacy_address_space =3D isa_addres=
s_space(isadev);
> >>>
> >>
> >> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >=20
> > Instead of checking for the presence of the vga.vram block, would it be
> > better to use the standard object_resolve_path_type() method to check
> > for the presence of the existing isa-vga device instead? See
> > https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00717.html for
> > how this was done for virgl.
>=20
> I remembered there was a nicer way but couldn't find it.
> If this patch were for 6.1, it was good enough. Now it
> will be merged in 6.2, I prefer Mark's suggestion.
> Jose, do you mind a v4?
>=20

Hello people! Thanks for reviewing it.

Sure, I'll send a v4. It's not for 6.1 anyway.

Thank you very much

--AlsGQrilVXb1u51Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmEcBRIACgkQaJ4wdCKK
F5b6FBAAkiYRyCd0gdEZeYJTnR0fniDdBCpfrw8salyXg5GBtpIIbCvfXtKSRoHP
qZ3EWBlA4ipw/Vq+LsFGh/nyHA+/QF1nGoM3oTR7wghPRxp6OgC9P8XMzLe2Jlup
9lSKCXKKA+Up/jGp9i6UYaWJ9JRAfT/4lxWx4tgwaIxPKx0dxeixzVNlRZMMirX5
utB82MAttbOYlw9r471CcEkAps4YlmCAfX8uLEbGycUNQ/9Vs82sUc5R64CmOgC8
ynGayCzL2xMpju2IB2VZiAIaGlRXrB7BgaiyuVeJU1FUOk1MJWdL/UHYaNaa2tcV
piZylflemQfGdqPCuZFycBc1nk5rxbaLZx8sIz1w5OSMjjYJ6sKrR/uc3aKe+lPw
WU9TdMrAp78u0fJ4LpOhX+HMCOd5TFaxT6kyGnvIn0UAgGQlKXZ1VESFBYOuKtNM
Yyw/GUlWVTs3FxmsjgH1PNi5adexGSb7F8CL/n3Cwt7q6eAvAifQ5OudFIk6P17A
lG21OOXRVQYisUN8SCxF5c5JE+4MjuGdDZhxPB9ZIPAE2K1ogyxrlzrj7c18nQUV
qg5nK0MxV8VUyRC9szIhAFKoXcUAX9MtZDHtHd9ki+y2iIMhJb+LAdyk6cYVSEWc
oSY4VREQOjAFa2FuxKCVm9jcVT6Pm7U9A0CJ6JyYscQRQ3vShW4=
=ANeb
-----END PGP SIGNATURE-----

--AlsGQrilVXb1u51Z--


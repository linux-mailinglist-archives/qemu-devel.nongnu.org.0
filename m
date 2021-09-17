Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19D240F8D5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:09:20 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRDcF-0003dm-Ly
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mRDZY-0002GI-EC
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:06:34 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:55516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mRDZW-00089z-8o
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:06:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 491082211A;
 Fri, 17 Sep 2021 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631883988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2A3o+4Malt1Qj4fquPtlGgsRxCv6dk3hdAXIgObYKF4=;
 b=b0jPnWeujp8zCIbD35+KyZIecQXRemXy6M1OL1vcs6Td1hjjVwK+QikpJdznDhJIAqdjpF
 a454F7LwOiYsKgMpcx4WGlbFP0Lsd0GGWSo8Tdk68iQVFbrTEM9hRQDKRSJ9A7zYygZ48d
 r+E42pb98esGXoCQJH21oMkJBUrE604=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631883988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2A3o+4Malt1Qj4fquPtlGgsRxCv6dk3hdAXIgObYKF4=;
 b=CKPc/vK9PAHCwbucuxt02Nj/Xiolc0Q/KtPcJwZfQDJVWnndUSVDQalKr5qCOjmM7NcAKD
 WtUyMWKosqtEq9DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2568E14063;
 Fri, 17 Sep 2021 13:06:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YSiIN9KSRGHyYAAAMHmgww
 (envelope-from <jziviani@suse.de>); Fri, 17 Sep 2021 13:06:26 +0000
Date: Fri, 17 Sep 2021 10:06:24 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
Message-ID: <YUSS0Jp+GBwNwYg3@pizza>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
 <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GFCglMltll0/R+Xw"
Content-Disposition: inline
In-Reply-To: <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GFCglMltll0/R+Xw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

On Fri, Sep 17, 2021 at 09:14:04AM +0200, Gerd Hoffmann wrote:
>   Hi,
>=20
> > This variable keeps track of all modules enabled for a target
> > architecture. This will be used in modinfo to refine the
> > architectures that can really load the .so to avoid errors.
>=20
> I think this is the wrong approach.  The reason why modules are
> not loading is typically *not* the architecture, but a feature
> or subsystem the device needs not being compiled in.  Often the
> subsystem is a bus (pci, usb, ccw), but there are also other
> cases (virtio, vga).
>=20
> We can stick that into modinfo, simliar to module_dep() but for bits
> provided by core qemu instead of other modules.  i.e. add something
> along the lines of ...

Yes, I really like your approach, makes more sense indeed. But, how do I
get the core modules that other modules depend on?

I see that Kconfig already has something in this line:

config VGA  (from hw/display)
    bool

config PCI  (from hw/pci)
    bool

config QXL  (from hw/display)
    bool
    depends on SPICE && PCI
    select VGA

I assume that independent entries (like VGA and PCI) are core and that I
can rely on it to add
  module_need(PCI)
  module_need(VGA)
for hw-display-qxl. Am I right?

Thanks for reviewing it!!

>=20
> 	module_need(BUS_PCI);
>=20
> ... to the modules, store that in modinfo and check it before trying
> to load.
>=20
> That would also allow to remove hacks like commit 2dd9d8cfb4f3 ("s390x:
> add have_virtio_ccw")
>=20
> take care,
>   Gerd
>=20

--GFCglMltll0/R+Xw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmFEkssACgkQaJ4wdCKK
F5YPTRAApZ6EMAlG6kXfK+fc4npmZkowkd4p+x/jqMSfZXC2meuSW9JXDdMXy4ox
2i4eHt0qsJs+kIscSBRHv11mgAgC1XCIAxjg/gqYaXwAz3FBXn48gfFadWVIFgq0
bW5RIvA2uQy/84aWW+wgTBbHHH5ay/qyVsca3euqgqcCBcLRC8wX5Hzi1FmdjoiF
cJV1fVAkv7hjtSAwpHvU2aZCTkw3+4Mw5d8lbkP9/0mpyOjfRV13WKSYjeR3R4Bf
ifwjLRBRMFECGdtf4LKDj2AvJyf8guVFP0ObT27uKEgils1D6GtZ8ZoO6LrDbDYI
/OREPROg8tpOL7Bts5s5A+fticHCuboLu/7ElfSGc0v4ibgZuYd+xMfqKObdv/2f
z70xCaN0lDsGmUAueiu9qjCK9Go8czmUjw0ltY571p5sElT9pDq4rn6Xw+XqSQQF
b6xQzsSZzYkxHJuI4EIAUPvLliGKUtLrs7X0T86xAbLnU8NeyU+3AlQCrycozNPP
fo09u1ycZ65YGq01OaQGqSt+2i0oVTz4crpsBU6QJCfGgQKF6Qt8jtWeUXzXCKKa
PYuHDfsKEVtHzysC7QzCx7SaLIDdEbIkNGPX79/MsTa2f/10gW+se/0MLvmLHQp2
qncT/ve99HVb8yjn/fLrqqs8FiT2TZuLdO29b2bohF0luQ+3X8Q=
=z73P
-----END PGP SIGNATURE-----

--GFCglMltll0/R+Xw--


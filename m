Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763D441153E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:05:10 +0200 (CEST)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSIyr-0002Gw-G1
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mSIwe-0000MJ-UZ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:02:53 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:42678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mSIwc-0000ol-E5
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:02:52 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC7001FD4D;
 Mon, 20 Sep 2021 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632142967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UI+owCIodFnhkzKeE3bTJVy68ELAo/lwcXGh5Zis9PQ=;
 b=ub60/4ysflxAVkEUV/m3pfmpvMNFT88VP516FligvOldZTtNGNb3XXC4hatIqKGMaEUQDp
 25tKvOsghUPN7DFWgQgc+3sSddjX3uDLVU56a5b37hJXLrJbmlV5TMx9+brAMxFGxPBggc
 bVBbKL+a7YjXcC3LELmmdVXwj6bBxLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632142967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UI+owCIodFnhkzKeE3bTJVy68ELAo/lwcXGh5Zis9PQ=;
 b=dkvGMq5Wfjh4ODHg4vOt9kwIcstuJWUODLSJImRagYwKI8oZqBDeTukutKEkv9tQ2DQE58
 8wKMAb2yncZpZOBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3419A139F0;
 Mon, 20 Sep 2021 13:02:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HD6bNXWGSGFVRAAAMHmgww
 (envelope-from <jziviani@suse.de>); Mon, 20 Sep 2021 13:02:45 +0000
Date: Mon, 20 Sep 2021 10:02:42 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
Message-ID: <YUiGcjBviIqPIyJB@pizza>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
 <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
 <YUSS0Jp+GBwNwYg3@pizza>
 <20210920051532.tzanl2asdqzuxlzn@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MuWvQwivmL0JSeUj"
Content-Disposition: inline
In-Reply-To: <20210920051532.tzanl2asdqzuxlzn@sirius.home.kraxel.org>
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
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


--MuWvQwivmL0JSeUj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 07:15:32AM +0200, Gerd Hoffmann wrote:
>   Hi,
>=20
> > Yes, I really like your approach, makes more sense indeed. But, how do I
> > get the core modules that other modules depend on?
> >=20
> > I see that Kconfig already has something in this line:
> >=20
> > config VGA  (from hw/display)
> >     bool
> >=20
> > config PCI  (from hw/pci)
> >     bool
> >=20
> > config QXL  (from hw/display)
> >     bool
> >     depends on SPICE && PCI
> >     select VGA
> >=20
> > I assume that independent entries (like VGA and PCI) are core and that I
> > can rely on it to add
> >   module_need(PCI)
> >   module_need(VGA)
> > for hw-display-qxl. Am I right?
>=20
> Yes, looking at kconfig for core dependencies makes sense.

But, in anyway, I'll still need to store the target architecture that
can use such core module, like I did here in this patch. Otherwise,
if I compile different targets at the same time, I'll end up with the
same problem of targets trying to load wrong modules.

I thought of using qom, but I think it will pollute module.c.

What do you think if I simply create one modinfo.c per target, like
modinfo-s390x.c, modinfo-avr.c, etc? Each will only have the data
structure filled with the right modules and linked only to its own
qemu-system-arch.

Best regards,

Jose R Ziviani

>=20
> take care,
>   Gerd
>=20

--MuWvQwivmL0JSeUj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmFIhm4ACgkQaJ4wdCKK
F5bcjQ/+PAMZ4kWQK5KEFulRnb6HX5Hz6uOfqu0pJstvUyKQ5ZxSu+XpsdjCEGpz
sOvgkDokMr5GOq5h6weGMwylsfqkAbzK18lVBwNmqWdZBbfIvyxtjm9B9qchFIPN
9gDXy5GceSjWfprO3d2Y+d/Im8zp99B3b1rlOem8L4xOOiPYtTXVPrxPI4cPJ2G+
5rhKXKjQrmwprpEU33eIyLGW/8kKssB6SuVFYcCCf7sm3pUMuDTPpuo9wjzmX/CR
VTp524Rrkl8NffyDOQ9eO9e0wfuBqV2GndE+hZriyGD47DWr835f3hdFoewf2N9j
Lhhdnh8pd74s44c951J+v5Pxd1fifme76/qPBFvZva0yCS88Q9eVknzKHYjTYvwq
fxdann7/R3ViFfMZqogadqWd5/ZSrinL0iDrtWHw3HrjUBM/I0wfvL/KhoYrenQ6
QTvrHiuIQB/DAyM96HAWhm35oq+ntaLDcoML7aWmlgU4/26zV0/NFDag5yqEPyjU
FMqRc3JaHZLrhsmM44dK2U4ZtXC2DGNmOw/Umq1jTRMZSmQwAL8lbAPEUHY+5XMA
qIvyfeXwcihsYFmamgjSybLCq0/KjO2f3shAvuv1fgHu+DZKBEc6NjaSKxo38sXR
ZIwIu2Sl+hB/AHv7Edkx0G5GcsJL984g0WBNehqu4PWsxFTZ0kI=
=1wOd
-----END PGP SIGNATURE-----

--MuWvQwivmL0JSeUj--


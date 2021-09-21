Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD35D4134D2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 15:49:22 +0200 (CEST)
Received: from localhost ([::1]:46706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSg9B-0006Tw-C9
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 09:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mSg6x-0004Bu-VH
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:47:03 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:34006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mSg6u-0001DY-PC
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:47:03 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E82EE22132;
 Tue, 21 Sep 2021 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632232017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PcdQ+2Cy/wTfCRE75tDyZAwqd9hPq06NoHnaVlLURgo=;
 b=18KQ9h9eoJ7zGkOp6TqpssnPhTaTFHPO1p7sNJ6J94gjC/mJpQJaxpdZdzmRYQHnAIjn2c
 uGTsiKtjbA3eAMuINLf/YbzcLRWOJ89JPBm+JNVmuhu+NlsXp4VhaI/wTSwR1ANJnnyQba
 BBlumdQZZI8MdzKqC42yTxz5ygbswDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632232017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PcdQ+2Cy/wTfCRE75tDyZAwqd9hPq06NoHnaVlLURgo=;
 b=xJ2bhIr5bRr5946Q1REcYBt3i+OourgGYUlZr7GnF1y1Hnu0ZXpggTRIEm+eMCy/3xTRnT
 m7Jwv0Ln5WBfzwAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F68513BCD;
 Tue, 21 Sep 2021 13:46:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FfAWLk7iSWHgSAAAMHmgww
 (envelope-from <jziviani@suse.de>); Tue, 21 Sep 2021 13:46:54 +0000
Date: Tue, 21 Sep 2021 10:46:52 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
Message-ID: <YUniTK6jLpKtuWX7@pizza>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
 <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
 <YUSS0Jp+GBwNwYg3@pizza>
 <20210920051532.tzanl2asdqzuxlzn@sirius.home.kraxel.org>
 <YUiGcjBviIqPIyJB@pizza>
 <05b09438-43ef-bd40-2b0a-2fdebf0425bd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pAZlfkFCQbRfFhRY"
Content-Disposition: inline
In-Reply-To: <05b09438-43ef-bd40-2b0a-2fdebf0425bd@redhat.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pAZlfkFCQbRfFhRY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!!

On Mon, Sep 20, 2021 at 09:03:28PM +0200, Paolo Bonzini wrote:
> On 20/09/21 15:02, Jose R. Ziviani wrote:
> > But, in anyway, I'll still need to store the target architecture that
> > can use such core module, like I did here in this patch. Otherwise,
> > if I compile different targets at the same time, I'll end up with the
> > same problem of targets trying to load wrong modules.
> >=20
> > I thought of using qom, but I think it will pollute module.c.
>=20
> Alternatively, you could C-ify the contents of config-devices.mak, and em=
bed
> them in the per-arch modinfo-*.c; and record CONFIG_* symbols for each
> module (e.g. '{ "CONFIG_QXL", "hw-display-qxl" }' from a
> 'module_config("CONFIG_QXL")' line in the global modinfo.c file.  Then
> before loading a module you do a binary search on the per-arch
> config-devices array.

With a per-arch modinfo-*.c we don't even need a modinfo.c global, do
we?

Each target could be linked to its own modinfo-target.c only.

>=20
> I hope the above is readable. :)

Absolutely, thank you for your suggestion!!

>=20
> Paolo

--pAZlfkFCQbRfFhRY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmFJ4kgACgkQaJ4wdCKK
F5bw0hAAiVyh8F3F/dhm8mLycwPAo++0dAiOIqBG5k759VqRI/ZpZrZE1UW4VmXO
xTuqtoAxysVE8ZaBQerPrkGuyFyqkGoveMAtGbBScURxF2bAAOxB0gXDxSIabWXo
2DBzL1x7iu6JVigUW2xv0KhPLvqKhLsaFwlRgm6MJC0Nm6uATiHHgsWgIB3T2CSK
X1jOD2Jkvmet8QF4b/LaROc65ZNSQYFQVtRmDaG6sq67qyjAu2X5v5owdEv0YT9E
HSFnjuBWe2gFWyKGojVYqJYws0QcI58QRSZvdimxkxdqIcC3mYIxP7A2M+CryCjr
2YL6L09REbCDPfpZ3KLYWOBoHKKxcz1CWfRnOq5TqvoPX7Yb4GV6zG+on+uVXWHN
6hNUAoq1OCz91gyjVvCW7x+B37g74QivmULi46MksLW9GO8vWlEOIAwB1qmoZoWf
otKt2UwSh71ndeV0fPEoJwCsQNV8pFdpyz4lqZYIVavgDBqnarroWghgetSs1/Qu
DY6m3LyxExx+8ivtrPDs/+bSVrdtVxqwhcjcZx9UN726DqRd9epf7tpnjWgJdeqZ
QTGhe3xNV/1ywAr9GZe4hk/eATyzDOC+46A+TUqtNcRAdxfdaBRz/8SHXJE6d+En
MfZohNwft8TSSVXodN1eiejjFwMu+uiygVMu6o/PIoBoWg6MFgU=
=cgeS
-----END PGP SIGNATURE-----

--pAZlfkFCQbRfFhRY--


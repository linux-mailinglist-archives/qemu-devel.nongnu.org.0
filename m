Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4873D0F97
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:35:56 +0200 (CEST)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6COB-00054J-9z
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6CMj-00045j-4j
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:34:25 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:57466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m6CMh-0002bJ-9H
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:34:24 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70B0E2033C;
 Wed, 21 Jul 2021 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626874459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8jKgXFELYq6oiyYW/DWgW423ns8RSHtQgrjfwBPfLk=;
 b=Q2rhkwpxGNJsmXPrrtatgjqdw34dv3gVe29PRtoq37aS+pjTlvDwzjXE4r1e21V6wINlYx
 ebu1AeHUAFGZjOSWuXvqy8axoL8IJXblW/2F0UTbqsTtuOEWVwLKEdSAWAWyohyG3Q9YII
 MxOsCU49y+ZlcnmDxTgrR4kKkNvZx6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626874459;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8jKgXFELYq6oiyYW/DWgW423ns8RSHtQgrjfwBPfLk=;
 b=nxnHrYMDhMcLXlBWXv6kti1WQz1Vu1q6rqI6P3/vvsVgFrDaUTnKXtsUjAWFoLxo++ygsf
 OcJYypiJQMucDOAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7318613BEE;
 Wed, 21 Jul 2021 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2soBDVki+GAFEQAAGKfGzw
 (envelope-from <jziviani@suse.de>); Wed, 21 Jul 2021 13:34:17 +0000
Date: Wed, 21 Jul 2021 10:34:11 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/1]
Message-ID: <YPgiU5JbzupGG6B7@pizza>
References: <20210720221351.13354-1-jziviani@suse.de>
 <ce1bda4a-e9e8-ec43-31ef-9ef3a58a16c1@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DaV4A1gPQ0NVFHSb"
Content-Disposition: inline
In-Reply-To: <ce1bda4a-e9e8-ec43-31ef-9ef3a58a16c1@redhat.com>
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUBJ_ALL_CAPS=0.5 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, cfontana@suse.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DaV4A1gPQ0NVFHSb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 07:24:02AM +0200, Thomas Huth wrote:
> On 21/07/2021 00.13, Jose R. Ziviani wrote:
> > Hello!
> >=20
> > This patch gives the ability to build TCG builtin even if
> > --enable-modules is selected. This is useful to have a base
> > QEMU with TCG native product but still using the benefits of
> > modules.
>=20
> Could you please elaborate why this is required? Did you see a performance
> improvement? Or is there another problem?

Hello Thomas,

Please, disconsider this patch. There's a more general discussion about
modules happening here:

https://lists.nongnu.org/archive/html/qemu-devel/2021-07/msg00632.html

A more general solution may be required to actually give us a
fine-grained control on modules.

The case is to allow us to generate customized QEMU packages attending
different user needs.

Thank you very much!!

Jose

>=20
>  Thomas
>=20

--DaV4A1gPQ0NVFHSb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmD4Ik8ACgkQaJ4wdCKK
F5YqbBAAqaaI7m4EHdAMeQGqweToNQTE8upzJadrPCHLsNqmNcsNwcs28vdjaM+h
Mn4JN0MQ9FMZ4MWYV7JuG1xVeAy0vWXWiTuW9flzfIanasK+j5ThCVYhuoLoRMPE
gIwTOO5hfy8vKOl8YkZu8vFO+PVf0QT4rfjSXCEefzVNcTCnIKWbcsPKpVf3Qu/P
X6SECUFxUJ9i0cT6w2gV0Z3ja50R9KI9JCNiKPX7Wyi2s+cV4GjLpp/pkHmT0R/h
QtPO2ujFowUH28jZowwdOw1oOWx56SH4/w7suujmtucJdCBUXjaLeNLGtyjQuMp8
a59IaZeXUd2FCY0p8ptX0HEjv+8A9FjT4n8Fri3Nq2IaEvga1ndBtKQ4MJRJPqvc
/BV9hf08KDohnBoYKTLsYhurIbEQxRJLjEGS5W8uFdAB7tS25BB6UeaVfisVBODN
Yz++HIfy+7DHkiCzy/maETrnaOaw/ihpCkxi2o9t7eTapB6MMxzjgLZkaxcBsnLk
5IDd6Nr4eNyGD6MOgRLq5rPHf0ofETu5FCqL95SOnlBF4S8hGy7OtItogFXxxc/a
E4bzAK7UurA7j38mk6nDOAGplIfPO1BJkAACqs0Ws+uDKyjusgyxAA1SOjrBCzgN
mH+Tlq/rebEK1zfDvvCYiJXNRFP5HK4XzU0hxvjyNgjajFVHeLo=
=gJsn
-----END PGP SIGNATURE-----

--DaV4A1gPQ0NVFHSb--


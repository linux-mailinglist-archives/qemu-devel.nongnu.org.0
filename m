Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9421B43C9D1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:38:16 +0200 (CEST)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfiC7-0000G6-ND
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfi8F-0005X7-1O
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfi8B-0006sK-CH
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635338050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wlnpTbbUsq/nlW+CsfTN9NhEen6y/Xy4XsxWONtCqkU=;
 b=Hscb3YJaUv8BPR8naccrqcexoWtmkd0E/3UQ0DAKwHUn9cY8F+4zloSpjYBnJLP/ghcrF+
 84MAe93mOVwoAkq5Do6u1QUcVDenvxC0go8hFdiPwYEzaUzVzk0wzeVpXPllbL/2SjlTg2
 K+CfvWONQF//2KIWy7Gmmh0wC2uOJws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-rnJhXP1-PUuq8thw_oZAGA-1; Wed, 27 Oct 2021 08:34:07 -0400
X-MC-Unique: rnJhXP1-PUuq8thw_oZAGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C079100D680;
 Wed, 27 Oct 2021 12:34:06 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E78B55C232;
 Wed, 27 Oct 2021 12:34:05 +0000 (UTC)
Date: Wed, 27 Oct 2021 13:34:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXlHPITntxlYsT6B@stefanha-x1.localdomain>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
 <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
 <YXgBArG7wRi+hpMx@stefanha-x1.localdomain>
 <85df7de0-cebb-efe9-d26b-f459a37a6621@linaro.org>
 <YXguEo8UQUX/cRo9@stefanha-x1.localdomain>
 <4b8a5b71-0ec2-7c2c-6929-de303ec29a53@linaro.org>
MIME-Version: 1.0
In-Reply-To: <4b8a5b71-0ec2-7c2c-6929-de303ec29a53@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PmnOwB5hLL5t498f"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PmnOwB5hLL5t498f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 10:10:44AM -0700, Richard Henderson wrote:
> On 10/26/21 9:34 AM, Stefan Hajnoczi wrote:
> > On Tue, Oct 26, 2021 at 08:10:16AM -0700, Richard Henderson wrote:
> > > On 10/26/21 6:22 AM, Stefan Hajnoczi wrote:
> > > > If "safe" TLS variables are opt-in then we'll likely have obscure b=
ugs
> > > > when code changes to access a TLS variable that was previously neve=
r
> > > > accessed from a coroutine. There is no compiler error and no way to
> > > > detect this. When it happens debugging it is painful.
> > >=20
> > > Co-routines are never used in user-only builds.
> >=20
> > If developers have the choice of using __thread then bugs can slip
> > through.
>=20
> Huh?  How.  No, really.

If there is no checkpatch.pl error then more instances of __thread will
slip in. Not everyone in the QEMU community will be aware of this issue,
so it's likely that code with __thread will get merged.

Subsystems that use coroutines today include block, 9p, mpqemu, io
channels, migration, colo, and monitor commands.

I understand that qemu-user is particularly unlikely to use coroutines.
Thomas' suggestion sounds good to me. Let's allow __thread only in
subsystems where it's safe.

Stefan

--PmnOwB5hLL5t498f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5RzwACgkQnKSrs4Gr
c8jALggAu0IzEbUIWOzMzmuJrUXrbbz60MjOyDIW0ybJA/F39okYiZlvM88PeoOj
CWqX9o8F94WyORSTh/xI8ePRWYb9C5DLqMquHLgX9R+PIWWAvdvVuz1You7TpGsj
TGrERM7eH7E99Or1htfVN4clBCTqT2w0ovBCdUsF6I2jM+7cOLyxK8cpHd2tcuvA
vREpjvi0VKcxCNYopVXhgIzglNfd0n3UTWNONjVv3twYYeBrzWyU5OHpm5AH5ZQo
50cPTALeYymjD0XoG5hQMxJNseLMpwHWbzHu9caHg1erhz65oAcf5G9JDkzDNbZY
WpKgvOrFRh514G21nUYxyLl5yI7eiA==
=ERvG
-----END PGP SIGNATURE-----

--PmnOwB5hLL5t498f--



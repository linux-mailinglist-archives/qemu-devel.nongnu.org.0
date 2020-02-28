Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10461173C96
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 17:11:13 +0100 (CET)
Received: from localhost ([::1]:49482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7iEJ-0006g1-Ri
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 11:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j7iDY-00063C-2S
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:10:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j7iDW-00045h-MY
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:10:23 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52892)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j7iDW-00045C-E3
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:10:22 -0500
Received: by mail-wm1-x343.google.com with SMTP id p9so3763072wmc.2
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=t6dtFNT3X5pNLHQ7lV/W9T1GPncYoLn1Y5hsIj6kdPg=;
 b=xCpm4ZLqnwJQ+jS4/W5l4Fgy+y2uMoeHaTHn8RiAaz7ud7A2yT1MzKCZLE3PJ+zUd4
 6M+TD9v5G6hhVbXcznEL+RaJBeyf41IRAd2cSKTr4arsDqfXivlxROg1mTlkXrVV6pI5
 onqxDB5VuUHFnaIXeFICB+5gx59PjWTiNBXRCvAN1jqPBPBPtxdsBsljTiZskndIItDz
 T2AFWfNECX03/zw/rLPY4n1EqpGeZQpzbvmEEFGlUd2p8IECTmRLTwZisEaEKjelMikQ
 btvvbxYa6UrPRtxJ0nJL6oOpSY774E0xXp2wZyRMJ0mmy2tUJp34mxRifeciOFKAz5DL
 jX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=t6dtFNT3X5pNLHQ7lV/W9T1GPncYoLn1Y5hsIj6kdPg=;
 b=DkCK5REamcelNvA5O5HZb29l73HPB6vhGUIQQPmRZrJ6uJM7P68zX8HaHJonG4dvjh
 hGsgEKyHMABkTKCc5nTmPtYY/dit9TEK2+W+yWN/JjtNpGGi6IzVlW6O50uzHettlXy5
 jJ2Xk4/UrgUvGqJZUWXuWwMCrJumTL6+5fhweeN2XOBInSrivheHeza7Y/4BvP8sueIw
 aC6lE5fpylY90XajGXOuPkv7vUhTqtKqkJgBa8ynYey4S5/KgnSYfmNz1v+2X5yHQwzu
 4CxWeeGJE3ZTAKr0/PFDDqgZajCe3YobZkcIHEMH3jlXl0j7mX1H4on1ACgS2zeq3L9d
 o84Q==
X-Gm-Message-State: APjAAAWviGA7RRfqUX/MtnPAlQKHHxbRsf/J6LSCxj50jmCKO/eSV6Y3
 ZGqKgZci5NhHYU6KmAix9K96uw==
X-Google-Smtp-Source: APXvYqwZqziGoTllTMMF2RFib1l8eJ8ru+7IAs8vKgufkDyMpBpQ1VDx3MsyZ3YFYapPrZtWEj0C5w==
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr5531837wmj.150.1582906220925; 
 Fri, 28 Feb 2020 08:10:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t3sm12934152wrx.38.2020.02.28.08.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:10:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 175DC1FF87;
 Fri, 28 Feb 2020 16:10:19 +0000 (GMT)
References: <20200211134504.9156-1-philmd@redhat.com>
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] tests/acceptance/ppc_prep_40p: Use cdn.netbsd.org hostname
In-reply-to: <20200211134504.9156-1-philmd@redhat.com>
Date: Fri, 28 Feb 2020 16:10:19 +0000
Message-ID: <87eeuewv4k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Use NetBSD content delivery network to get faster downloads.

Even with this patch I get failures on my big dev box:

 (48/67) tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_a=
nd_netbsd: INTERRUPTED: Failed to fetch NetBSD-7.1.2-prep.iso.\nRunner erro=
r occurred: Timeout reached\nOriginal status: ERROR\n{'name': '48-tests/acc=
eptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_and_netbsd', 'logdi=
r': '/home/alex/lsrc/qemu.git/builds/all/tests/results/jo... (60.31 s)

I think ultimately a whole ISO download is just too much for an
acceptance test.

>
> Suggested-by: Kamil Rytarowski <kamil@netbsd.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/acceptance/ppc_prep_40p.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep=
_40p.py
> index efe06037ba..6729d96f5e 100644
> --- a/tests/acceptance/ppc_prep_40p.py
> +++ b/tests/acceptance/ppc_prep_40p.py
> @@ -34,7 +34,7 @@ def test_factory_firmware_and_netbsd(self):
>                      '7020-40p/P12H0456.IMG')
>          bios_hash =3D '1775face4e6dc27f3a6ed955ef6eb331bf817f03'
>          bios_path =3D self.fetch_asset(bios_url, asset_hash=3Dbios_hash)
> -        drive_url =3D ('https://ftp.netbsd.org/pub/NetBSD/NetBSD-archive=
/'
> +        drive_url =3D ('https://cdn.netbsd.org/pub/NetBSD/NetBSD-archive=
/'
>                       'NetBSD-4.0/prep/installation/floppy/generic_com0.f=
s')
>          drive_hash =3D 'dbcfc09912e71bd5f0d82c7c1ee43082fb596ceb'
>          drive_path =3D self.fetch_asset(drive_url, asset_hash=3Ddrive_ha=
sh)
> @@ -67,7 +67,7 @@ def test_openbios_and_netbsd(self):
>          :avocado: tags=3Darch:ppc
>          :avocado: tags=3Dmachine:40p
>          """
> -        drive_url =3D ('https://ftp.netbsd.org/pub/NetBSD/iso/7.1.2/'
> +        drive_url =3D ('https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/'
>                       'NetBSD-7.1.2-prep.iso')
>          drive_hash =3D 'ac6fa2707d888b36d6fa64de6e7fe48e'
>          drive_path =3D self.fetch_asset(drive_url, asset_hash=3Ddrive_ha=
sh,


--=20
Alex Benn=C3=A9e


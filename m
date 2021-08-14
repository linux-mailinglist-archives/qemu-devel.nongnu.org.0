Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D143EC17D
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 11:04:54 +0200 (CEST)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEpb3-0007sj-CC
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 05:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpZy-0005xE-34; Sat, 14 Aug 2021 05:03:46 -0400
Received: from redisdead.crans.org ([185.230.79.39]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpZv-0005fL-KC; Sat, 14 Aug 2021 05:03:45 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 0713946F;
 Sat, 14 Aug 2021 11:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628931822; bh=JE9RW2xI0iiuLnwuTv4YUBIAeTGhelihoJ/3Q3TH+1c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KKCXmqI01wkN4m/kxepnyWDN+NYvnomeZSLfl7uJ/SG7VwfQJGLq+6Y9pqMxI5bj4
 Q0xx3hYJVARYJ0nd75qDB7d1giKj6WxxLrm3g1cmtuD0C6UVMGufNYkClzhVD6I0IZ
 6kMeLOe1ZcCqB/jwinnTiYZlaOcFECJmhIr8eTc6LXM5SsPc80F8d488Z0wHWW8zpY
 evxFIqCAVWWi5C7nJH1D/JJ/DKp5y8g54Dfj+Yx7kDuqdajiUleOGklYHKq4QcSjVZ
 LLa5jSaAhwSulju9Iqm0Egah98qiGsdq5txogbhwP8AtHueA15OxgYn8+3FsfAOlwP
 TJ24OGZDT9fy85qe8DVAD0bV6bPmMj/x7MY2l2aQSHDXvgpr1HV//eYDrSTr0jDhHf
 9R5e23K227MMYZn/cgVTpgWo6ecfcEe4eXW2TP3ZE8OtDTKLjeK+2Y8TZbXqa20Bis
 S680cEGGbfZ7PdoSJ8GKJv6a5LOS/I8n01Y6JardvMu8hjzqM891enr9IPWj0+Mcgm
 4xUyGMqJ0V+zROpiVTZG09jUePUTNdvLB3/GVwfmzlx5Ioh4JGLW5JoY+uwZFAQf+I
 zV8vIpN8fVj8t5p6y45NMn3KA4mvkmwODr7sZx/Bo4cr1aN1AuIJcuNE4fM8snEuqJ
 7f3va5GbEjvmKoRZScrsZlxo=
Subject: Re: [PATCH for-6.2 13/25] hw/arm/stm32f405: Wire up sysclk and refclk
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-14-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <a8b89640-dfe0-32d3-f1af-f637a6daf225@crans.org>
Date: Sat, 14 Aug 2021 11:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-14-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="whGbjnDBJkycBj91B7QkAP1QaPorZJtcc"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--whGbjnDBJkycBj91B7QkAP1QaPorZJtcc
Content-Type: multipart/mixed; boundary="vvbsBA9nbbhO2zxeuEood0mScZ1lHqqV9";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <a8b89640-dfe0-32d3-f1af-f637a6daf225@crans.org>
Subject: Re: [PATCH for-6.2 13/25] hw/arm/stm32f405: Wire up sysclk and refclk
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-14-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-14-peter.maydell@linaro.org>

--vvbsBA9nbbhO2zxeuEood0mScZ1lHqqV9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> Wire up the sysclk and refclk for the stm32f405 SoC.  This SoC always
> runs the systick refclk at 1/8 the frequency of the main CPU clock,
> so the board code only needs to provide a single sysclk clock.
>=20
> Because there is only one board using this SoC, we convert the SoC
> and the board together, rather than splitting it into "add clock to
> SoC; connect clock in board; add error check in SoC code that clock
> is wired up".
>=20
> When the systick device starts honouring its clock inputs, this will
> fix an emulation inaccuracy in the netduinoplus2 board where the
> systick reference clock was running at 1MHz rather than 21MHz.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

-- Alexandre


--vvbsBA9nbbhO2zxeuEood0mScZ1lHqqV9--

--whGbjnDBJkycBj91B7QkAP1QaPorZJtcc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXhu0FAwAAAAAACgkQbHknjz/NzAL2
8Q//aD1mia+I7mpGuJRcL1NcpXWXZj/Ma6mMsgOIiE2uZsCS+TPJ058wBg9nXkr65fwWsmlQszrG
ATFUfhgm4E0mhxTIedR62YGn1TsuW+JntPSzbCbAbbM7wI1H8Cequ0hYRG0LX95dg0HvRpkoI0YA
RshL2NRIT0nGGHaa0pPGvwnjQ243BZ44PnLDOwTzxdfFfK9Bhd8YbqgyDG0SsozxdQUIE+36QYY8
X+xh87+FWqEr7+DcG/u5alINfOWyHO5zckQ9XCuHwYHeBFv4fO9eAqhpWbcZky9gFLUUEiq1jKct
/3wHiNx2z1Tx6haDl7VZVakFzLmCbj+X2GlyJltpdpSWCb8M3VLNp2mCBvjqj1t+b0RTnKP+9FEn
begnjpsbvsSzHphGg94ROv+j6IHLen2ON/YQ234fY5HjtqcOXDj+lvxhBcHalh1QSy1ABPG7maMQ
GvYKVxqQD+Nve+J6sSp2tnn7J1B5+epfh1itBaHHzBamsKLle2+ujpxASb5cKw6FPQPYpCGI6OwH
J3fTJZpZu28oakDuCjB98kua+BUM2zxBBlG26lPJnv34Qdnmx14NbAKNOdbP5t1XkuZ7/uJ2izKx
OWKM5cPVD55GrViwnVtjij79HHHU664nHNOMxJMghW3WU7J4yk+jXBjbItwu4+zL2WHKjn1myt2T
mbQ=
=cqmA
-----END PGP SIGNATURE-----

--whGbjnDBJkycBj91B7QkAP1QaPorZJtcc--


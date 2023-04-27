Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8F6F03EB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:06:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pryUu-0000zP-3A; Thu, 27 Apr 2023 06:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1pryUs-0000zG-2Y
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:05:06 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1pryUo-00025w-Ro
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1682589903; x=1714125903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zvsr7dzIXQaZ6TEI0NzmzOZ2i/GHbhDk7E0T3G6yOr0=;
 b=Eto7Qv8E0t6gpyKdwhDbarnGdr0SC9ITs0txdK3ZPt/g1DLAVLC3S52c
 uANsHc8etYnJLZoyMgnndI7wXtZytCy7TFzIsZR8Uwy5/ZfMwXMhejvXr
 cAiv3R4k4L6c4Oi19+BamwTMZJUY9gwivsgR34O4ThZH+jICQNIRhGAuu
 4WtB9CyIuCHRJxmh48wlh6IriJGEJMDqbdCVUar6VsJ/Mn/44AXtd7j43
 k4zJ+xOnPX/g2sa4P3tHi8+0bbJLZGMTBHBe6mSjI6h/Pg5g3I7wn42iN
 fa6weRT6GPo0nPXpcUDCyTb0Oqr7Lazw8QApY1mNd8bCJ1gn6ZVNWBHoA w==;
X-IronPort-AV: E=Sophos;i="5.99,230,1677567600"; 
 d="asc'?scan'208";a="208554754"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Apr 2023 03:04:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 27 Apr 2023 03:04:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 27 Apr 2023 03:04:55 -0700
Date: Thu, 27 Apr 2023 11:04:38 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
CC: Conor Dooley <conor@kernel.org>, <qemu-devel@nongnu.org>,
 <ycliang@andestech.com>, <dylan@andestech.com>
Subject: Re: [PATCH] target/riscv: Fix PMU node property for virt machine
Message-ID: <20230427-reverse-boozy-27c706ede00b@wendy>
References: <20230421131437.19036-1-peterlin@andestech.com>
 <20230421-profanity-debug-2ef7d4740c33@spud>
 <ZEoH8j6nbbQ5xlyS@APC323>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tJGEiZEJ/Cr00E9f"
Content-Disposition: inline
In-Reply-To: <ZEoH8j6nbbQ5xlyS@APC323>
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--tJGEiZEJ/Cr00E9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 01:28:18PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> Thank you for your prompt response.
>=20
> On Fri, Apr 21, 2023 at 06:59:40PM +0100, Conor Dooley wrote:
> > On Fri, Apr 21, 2023 at 09:14:37PM +0800, Yu Chien Peter Lin wrote:
> > > The length of fdt_event_ctr_map[20] will add 5 dummy cells in
> > > "riscv,event-to-mhpmcounters" property, so directly initialize
> > > the array without an explicit size.
> > >=20
> > > This patch also fixes the typo of PMU cache operation result ID
> > > of MISS (0x1) in the comments, and renames event idx 0x10021 to
> > > RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS.
> > >=20
> > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > ---
> > >=20
> > >   $ ./build/qemu-system-riscv64 -M virt,dumpdtb=3D/tmp/virt.dtb -cpu =
rv64,sscofpmf=3Don && dtc /tmp/virt.dtb | grep mhpmcounters
> > >   [...]
> > >     riscv,event-to-mhpmcounters =3D <0x01 0x01 0x7fff9=20
> > >                                    0x02 0x02 0x7fffc
> > >                                    0x10019 0x10019 0x7fff8
> > >                                    0x1001b 0x1001b 0x7fff8
> > >                                    0x10021 0x10021 0x7fff8
> > >                dummy cells --->    0x00 0x00 0x00 0x00 0x00>;
> > >=20
> > > This won't break the OpenSBI, but will cause it to incorrectly increm=
ent
> > > num_hw_events [1] to 6, and DT validation failure in kernel [2].
> > >=20
> > >   $ dt-validate -p Documentation/devicetree/bindings/processed-schema=
=2Ejson virt.dtb
> > >   [...]
> > >   virt.dtb: soc: pmu: {'riscv,event-to-mhpmcounters': [[1, 1, 524281]=
, [2, 2, 524284], [65561, 65561, 524280], [65563, 65563, 524280], [65569, 6=
5569, 524280], [0, 0, 0], [0, 0]], 'compatible': ['riscv,pmu']} should not =
be valid under {'type': 'object'}
> >=20
> > I would note that this warning here does not go away with this patch ^^
> > It's still on my todo list, unless you want to fix it!
>=20
> I don't fully understand the warning raised by simple-bus.yaml
> is it reasonable to move pmu out of soc node?

If it has no reg properties, it should not be on the soc bus.
I previously made similar changes to other nodes, see commit
ae29379998 ("hw/riscv: virt: fix syscon subnode paths"), as I think it
is indeed the same change here.

Cheers,
Conor.

--tJGEiZEJ/Cr00E9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEpItgAKCRB4tDGHoIJi
0swXAP9vIBZMgy7jYHdBWJ/R8WXFiHs/VK/VQen3190WflUBYAEA0MSh7uUgRzR6
B0ZkqIEscrxCkAUpN5CfVowHY3AUgQU=
=uV2R
-----END PGP SIGNATURE-----

--tJGEiZEJ/Cr00E9f--


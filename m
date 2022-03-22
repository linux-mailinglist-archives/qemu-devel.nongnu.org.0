Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425954E4528
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:28:15 +0100 (CET)
Received: from localhost ([::1]:37330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWiIn-0001Ck-Co
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:28:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nWiD5-0006C6-Ok; Tue, 22 Mar 2022 13:22:20 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:43033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nWiD0-0002ne-Gi; Tue, 22 Mar 2022 13:22:17 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C20565801B2;
 Tue, 22 Mar 2022 13:22:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 22 Mar 2022 13:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=DKA1S+zaOnp0EXg0D/eCjdJnTBqB3w
 lH33M2skJaIIM=; b=kUjswknOc/LNgIBFH7zcVbzZV9YF/Q7z7pKdb1AQC2FC6e
 tzxhuA3aNM7wNZzPtyEtnsPihfCxdYq4JV1l2ve6fTch6rDfr61f7+4xLQBY8GAG
 Z4H/2nh9Mdfc8j4wrXjcwJs9303SEHhbq1+XKBLkJqBVzhpIGLv75bBitbKEjYzn
 7HRrsZ9Cz7abydk5FnBX9cKXa31Cn6tK/pXZvAVhNEEueJV6HI6QUhPH5FtC2M1x
 yPxITWXQs7HQQRtyekZloFU2ESBiMFUewLOq0lEbsPb4d4+jGa2v/CQZHCfLtJQp
 ug3mXazcnjhZTW9Mz0SZN/HmL4N89/cRdYNqYAwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DKA1S+zaOnp0EXg0D
 /eCjdJnTBqB3wlH33M2skJaIIM=; b=dbnSSTgUklpqQhwWFknQDnahg1Ryed2g7
 wZ0PE3zLkLNJpLCKyefyvIzDT1zdqKS0G43qgA4EidVFIWdForoozWc7RWaJ0BW4
 3r3L3gR7+QeaibY37sjTIFuJVwZ3E+FC8iej7yL5lRnra7n8fkxbge4yWFaaaPNr
 gasE8fIyPuP0EtOKfvrde3Va2Zc1Ge9Fhhc2aeU3W+Rg9uX2+9pLEPYBlawvbirN
 vESQFI4Y/HCFWVPYAuOyfE69fJ/jrRMYIBSMKi5u9sppOJQrIJ0irBz5VrR99jGk
 niEfkdZ4sh/2I7LfxNxuTUVKZXmv5ej/Da4vUOHhwCVJ3d3eWhRWw==
X-ME-Sender: <xms:wAU6YuiDVSiO5DXDfSL8EIMJPMlDj54UyI_sfzAOFASsHtGMDphZBg>
 <xme:wAU6YvC1wRJ4Pxg8ngkDfAEPQ0xqzNpje2B93LCNzR3fLKD5slrs57CvkQ6hzA-MA
 MO7QN7gFJpfj1rOVFo>
X-ME-Received: <xmr:wAU6YmFvkNY5p9PlD_Cw_LT0A6zz4RfLSj-c-dcgQdAukt_SOaChW2UNw_k-lh11iO-gqeOtvp9zgH0V7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeghedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:wAU6YnT-3y9ba53YTbdzDilaJdXcBx0lP9NRYpcahWvudI3S6ZAyQQ>
 <xmx:wAU6YrxTLwhzw0WFqIxp-d74Cf2UQRYGNgd8JFhrgumPo2LmigxrBQ>
 <xmx:wAU6Yl4rmLv7PAa_H7QhvkfyzDaoXDiwKlGZYaq58M_gYE7Kj1ksNw>
 <xmx:wgU6Ylh8R0wqYvzc50CjDVm3cmAN4T0qVUWveuXkCGEB5-jlmI349w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 13:22:00 -0400 (EDT)
Date: Tue, 22 Mar 2022 18:21:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 3/3] Use g_new() & friends where that makes obvious
 sense
Message-ID: <YjoFtvvV/LtGt2X9@apples>
References: <20220315144156.1595462-1-armbru@redhat.com>
 <20220315144156.1595462-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W/A79Jf9YM97F5Ll"
Content-Disposition: inline
In-Reply-To: <20220315144156.1595462-4-armbru@redhat.com>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, haxm-team@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Reinoud Zandijk <reinoud@netbsd.org>, Eric Blake <eblake@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--W/A79Jf9YM97F5Ll
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 15 15:41, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>=20
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>=20
> Patch created mechanically with:
>=20
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/nvme/ns.c                             |  2 +-

For hw/nvme,

Acked-by: Klaus Jensen <k.jensen@samsung.com>

--W/A79Jf9YM97F5Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmI6BbQACgkQTeGvMW1P
DemVHQf/UvBrob2AKXn7QLs1LPvjspegusuMZAUULXyiS7FJ456DBSy0wWUweIj0
+PKX+HOXbZu7s0mUXhZ0GpiD5V39c/M7/18p620LaokIDnuwuI1Mshnytrk5gao6
EyfSap+WxrF/ys8BQ7X22h6juLgDsY4J/QwuHEk+rcjSO4YQpeJBpp+3AsOFbWbl
7wx6aFzLcoAWIWr5zc9BwboE5w9Ot7/fSBdn1GnbWUfVr0VxCJGv5oU833IsOcbL
3Kufe+QE2ZxyD7v+mHI1/THkr9rFYaWJ8f4HAfQ5XfoOo/ULXo6qkw4fM04tD3ex
oGvzJovacGYnvSvYmde1KMydB+oNXQ==
=KxTS
-----END PGP SIGNATURE-----

--W/A79Jf9YM97F5Ll--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B53B3274B0
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 22:54:29 +0100 (CET)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGU1D-0006K9-Ur
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 16:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vit9696@protonmail.com>)
 id 1lGTzJ-0005mu-Nm
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:52:29 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:38893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vit9696@protonmail.com>)
 id 1lGTzG-0000Qn-Vn
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:52:29 -0500
Date: Sun, 28 Feb 2021 21:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1614549143;
 bh=YxN60ZaaE52JSkNm8hr5laLyebFez8xlOt8Rwnc/O+o=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=DuSEuc6VAqK6IkdLFLWy9q7wz4yohbhZW0mLjWBb4ep5NCji3T5eeWnhef6Q9o1M8
 cACc1CHPv1L7KXIYeYDP23wmlObRXosevjV0EN+mVllDFGpMYq6hveLtS1h4wowuuZ
 k/H15O5SFeLjrlCfoN6if4u7ampYmLdrSIQB3oB0=
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Lamprecht <t.lamprecht@proxmox.com>,
 qemu devel list <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <fDv13anMEoIlxfBPEKAiRFNdx7vpUMGnPP4THTYg3pu0zCPCaAHtdecb0Cty-Ejk4LKYfEoZA32V5Me9wAXj9rifLW4I4DpUinB3AU5X55Y=@protonmail.com>
In-Reply-To: <20210228163726-mutt-send-email-mst@kernel.org>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <1D984D1D-0DFB-49FC-BD7F-1AAF9B862A5D@protonmail.com>
 <e36b3025-d709-1a6c-6b5a-a08bc6de819f@proxmox.com>
 <x3i3TiibtrC1qTDQUKxuOA_9qvmInzVwv6RrvzzSCSj-S21gLypbbZgEbYvJSGMxC1r8RaDrnHGgRbDI7vfpA_XuDINdZej9yKCW3_Sc4YM=@protonmail.com>
 <20210228163726-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="---------------------d24a9d326e2a9c2df1c127084fbe597a";
 charset=utf-8
Received-SPF: pass client-ip=185.70.40.133;
 envelope-from=vit9696@protonmail.com; helo=mail-40133.protonmail.ch
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  vit9696 <vit9696@protonmail.com>
X-ACL-Warn: ,  vit9696 <vit9696@protonmail.com>
From:  vit9696 via <qemu-devel@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------d24a9d326e2a9c2df1c127084fbe597a
Content-Type: multipart/related; boundary="3ff084643778e29a39738d3958978a2ca1b98d7e"

--3ff084643778e29a39738d3958978a2ca1b98d7e
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

<html><head></head><body>    <div>I am afraid I may not be available for th=
is till the next weekend, but if the time permits then, I can have a look. =
Actually have another patch to upstream.<caret></caret></div><div><br></div=
>On Mon, Mar 1, 2021 at 00:37, Michael S. Tsirkin &lt;<a href=3D"mailto:mst=
@redhat.com" class=3D"">mst@redhat.com</a>&gt; wrote:<blockquote class=3D"p=
rotonmail_quote" type=3D"cite">  On Sun, Feb 28, 2021 at 09:28:26PM +0000, =
vit9696 wrote:<br>&gt; Thomas, macOS is not really "special" here, it is ra=
ther that you will not<br>&gt; frequently use boot options in a VM. One of =
the most popular uses for boot<br>&gt; options is to switch between the ope=
rating systems, but for virtual machines<br>&gt; it is rarely the case. How=
ever, macOS does indeed use boot options for itself.<br>&gt; One example is=
 to install updates. As long as the created boot option is not<br>&gt; vali=
d an automated reboot during the update installation may result in the<br>&=
gt; wrong bootloader being chosen or in a stall within the firmware UI awai=
ting<br>&gt; manual boot option selection.<br>&gt;<br>&gt; Michael, does yo=
ur suggestion mean that the default approach will be to keep<br>&gt; the ne=
w behaviour, but if you manually specify an older q35 machine version it<br=
>&gt; will provide the original behaviour. If so, it seems fair to me.<br>&=
gt;<br>&gt; Best regards,<br>&gt; Vitaly<br><br>Exactly. Vitaly, could you =
cook up a patch like this?<br><br>--<br>MST<br><br></blockquote><div><br></=
div><div><br></div></body></html>



--3ff084643778e29a39738d3958978a2ca1b98d7e--

-----------------------d24a9d326e2a9c2df1c127084fbe597a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsCUBAEBCAAnBQJgPBCTCRBPsoxt7Hy0xRYhBERSlkTqW1Te3v1Bj0+yjG3s
fLTFACEJEE+yjG3sfLTFFiEERFKWROpbVN7e/UGPT7KMbex8tMWzyAf/d0cV
IWySbFmoYlPCTEMuupa/65/rcZyZJmDxZb22rBL6SoifLTwb5JoY5/06/p8R
lOhRiUws3Nirjed7cCFYEFYcaqTUehNGev4F6rkJdZpwq0ydHmKlnTT1lZkb
5XT92k2t4wasnWMgXwFsdmr0in0S7ZzxWgtt/GNqWbHddS0SdMoCwauvLfQp
kaZBgdwuV0AeEyVOuQD26KdsUdkpGtOBQ+x8bhpCvHAcquvy1WcdtpFdiuvf
YXn8Ls7AlZNcvyBDGOeg+E0VZ0JUGSzlx8/gP0TCbFF3OyNvuaVDFpqQCwon
XmuVdlmQztsgsCKdVv8PT+zy9gy8P1yBtJW96A==
=1HY7
-----END PGP SIGNATURE-----


-----------------------d24a9d326e2a9c2df1c127084fbe597a--



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DE1BE936
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 22:54:56 +0200 (CEST)
Received: from localhost ([::1]:58338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTtjL-0007Ec-Eu
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 16:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mhohmann@physnet.uni-hamburg.de>) id 1jTs5k-00071r-D7
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 15:09:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mhohmann@physnet.uni-hamburg.de>) id 1jTs55-00045Q-FX
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 15:09:56 -0400
Received: from mail.physnet.uni-hamburg.de ([134.100.106.230]:46056)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mhohmann@physnet.uni-hamburg.de>)
 id 1jTs54-00044m-Q5
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 15:09:15 -0400
Received: from 227-98-191-90.dyn.estpak.ee ([90.191.98.227]
 helo=[192.168.1.129]) by mail.physnet.uni-hamburg.de with esmtpsa
 (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.72)
 (envelope-from <mhohmann@physnet.uni-hamburg.de>)
 id 1jTs4t-0002rh-Ib; Wed, 29 Apr 2020 21:09:04 +0200
To: qemu-devel@nongnu.org
From: Manuel Hohmann <mhohmann@physnet.uni-hamburg.de>
Subject: Error "cannot bind memory to host NUMA nodes: Operation not
 permitted" running inside docker
Autocrypt: addr=mhohmann@physnet.uni-hamburg.de; prefer-encrypt=mutual;
 keydata=
 mQENBEzzkJ0BCACoFEyKwRypWgc6Bbl/t5CRmCq+wnrLqGTji2iB9gHhP/dFisO3bdPjX2bT
 bZSG48rR7Q999M5NjCX7juQbAKQm5vv3NDBNqq35Q7nSALsEEazy1awbx56EBXPn/5VbH4JT
 c3sZiQR/MZY81WcWANPxZr3XWOl71netiVNzO5OBZSTxRV7dnB2meYBlhgD7dDzZTfJ8tpqu
 XlzlaZ+H2QDDt2TH0LYm6rhK2OXDqTCs09BiZi48Ev6YI/DC/RpLNGlVtACV1RB1i+GAKIZJ
 /E+E1A5wQTG+/wHblFq9PcFJKTJOQvMh3kV/4S4GuQbXoAMVn+6FGIF7mat4Oo+mNjchABEB
 AAG0ME1hbnVlbCBIb2htYW5uIDxtaG9obWFubkBwaHlzbmV0LnVuaS1oYW1idXJnLmRlPokB
 OAQTAQIAIgUCTPOQnQIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ+9/1Gux6RLIN
 fgf+MHuA2VcJxo/xAvTjfrvmDFgTsepHFlWPKkEdEQY2FSG1dqhAHtEIlEJ0M/6Y0r5cSn+L
 E8yqW8OWP0aCsd0BTcp+h1t8lIZhx33ZGmOFDxLVcnIq/zyEloRbVZPG05yvKgmc3N3opaw4
 8WrdnQ7Q6+iQhY9v+S+BcRyJNDL6cWXZF2uLOvXDAq2Y1lihZSwBXvcQOgQ7nfgJYAveA140
 fqRmg5e7usL2xq1kaWDvRrxBk/D6kWqLBkvYQrxxflTfsbM4IJP4lmCIfyr0BxY0VOzjZ8Wu
 SYl9ETJcHSc4zR+s94PnDAlFsZbZHGoXK6YxD6SlyaisT00bqvZXmY8gHbkBDQRM85CdAQgA
 l90YtA7ak5BUEHw4WPY9AIpfP0IWSI3lQbudSdTcJ2GPx5fE01dd/W1V+7K7VBiDw7m1CjT7
 qnv5ZPFWIhGCBzxGhi/81NXhnEsHoElJEzea0XY64/7hf+CeM4rrx7CaXjByHDbVfFPQqUEZ
 yhZhxYChmpCi/5CAvs5sJKFNqTqF6AXFCNdam0iWu1pT2MVhl2RqYQq0rUNVDhlh/v/fPKsM
 tUqyfXbiXVaG9zcozC7AS6U+0jly9oMsGrz9eCE6uDc3YceTnhUqRvuBzj3wB6hFNXj82T/+
 4r60s9zAc2VMi3F0jKBr0+7b+5JOjeraPlvNB0ftCfnFNDGeC0pZAQARAQABiQEfBBgBAgAJ
 BQJM85CdAhsMAAoJEPvf9RrsekSyMAMH/2gVwokA0EEeF00AO6K9uTukidAflrXYFS+KLKC2
 oa8uAb2Or6y2OOZeaLmYhbOdRapFCElqjGSMYlBHPFmu10KDUYzNuaVmSULw84e0KzNPCeJG
 zOF4bGvLY9bv4cp2tMeUNDIvQHsmZ0PE+O9i9cVtuITEjsXxa/62SE1TSnLg3QUUZEvTIIKN
 ZEoxKIHrxiLVsa5Rd21YDVyShLjK4sa4Tc0PUPpe5yWkET6hVBIw2g15hAO8+qkShbRYg9CH
 pZQlUIv2wMJqzXV4UaHYzRJcgZZ0YEvNHE/Vstl7GLHk/QtaCxqva6novYYXWK/rMGrK19gw
 3dYtCkCgf6rLwTE=
Organization: University of Tartu
Message-ID: <187fffac-d7b9-5a1c-11c2-72dba9c21347@physnet.uni-hamburg.de>
Date: Wed, 29 Apr 2020 22:09:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="upfXptObL2Kf69Mj6B3uUxQWG7a2yp2uz"
Received-SPF: none client-ip=134.100.106.230;
 envelope-from=mhohmann@physnet.uni-hamburg.de;
 helo=mail.physnet.uni-hamburg.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 15:09:05
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Received-From: 134.100.106.230
X-Mailman-Approved-At: Wed, 29 Apr 2020 16:49:14 -0400
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--upfXptObL2Kf69Mj6B3uUxQWG7a2yp2uz
Content-Type: multipart/mixed; boundary="b7KHyhShTlMP1BgB9gZa2kyrKusnhv8uK"

--b7KHyhShTlMP1BgB9gZa2kyrKusnhv8uK
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I encountered the following error on the QEMU 5.0.0 release, compiled and=
 run inside a docker image:

"cannot bind memory to host NUMA nodes: Operation not permitted"

The QEMU command line to reproduce this behavior:

qemu-system-i386 -m 64 -M pc -smp 1 -display none -monitor stdio -drive f=
ile=3Dmp-acpi/NOS.iso,media=3Dcdrom,id=3Dd -boot order=3Dd -d cpu_reset

The docker image which shows the error is available here:

https://hub.docker.com/repository/docker/xenos1984/test-qemu

Built on Ubuntu 20.04, and including NUMA support with libnuma-dev packag=
e installed, from the following sources:

https://github.com/xenos1984/cross-toolchain/tree/master/tools-qemu
https://github.com/xenos1984/cross-toolchain/tree/master/test-qemu

The iso image used can be obtained here, but should not be relevant:

https://github.com/xenos1984/NOS/releases/download/latest/nos-i686.iso.bz=
2

The command fails when the image is used in a CI environment:

https://circleci.com/gh/xenos1984/NOS/953

On recommendation by @imammedo I tried the following:

--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -384,3 +384,3 @@
          if (mbind(ptr, sz, backend->policy,
-                  maxnode ? backend->host_nodes : NULL, maxnode + 1, fla=
gs)) {
+                  maxnode ? backend->host_nodes : NULL, 0, flags)) {
              if (backend->policy !=3D MPOL_DEFAULT || errno !=3D ENOSYS)=
 {

But no success, the same error occurs.

Best regards,
xenos1984 / Manuel Hohmann


--b7KHyhShTlMP1BgB9gZa2kyrKusnhv8uK--

--upfXptObL2Kf69Mj6B3uUxQWG7a2yp2uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEGQ1wnDd/ca3CjRdj+9/1Gux6RLIFAl6p0M0ACgkQ+9/1Gux6
RLIkzwgAoixoo70Q2P611ID0BqvmfFjwGFcMuL5HDvxmPCpZlKQ5niwPoMVfz3P/
EhKqs/TPzWD7tPZ1R0oipKNQcpuFwqGDuoxkLB66SMPCMMVC6eeoccK4oY2qAyNQ
SkQUhu0NmD+QQlo/4Hw32Jj1Xk/JHEf4UJ+bj9FZuNuORKmvj92aVjvsLpS49pwf
p+V0qITTTQgm8dXHAyrmk8y46qSORVjVjnqfJqqVIzE8H97HR8a9TOs+PTGcz85B
WzUS9Fis7uYCTkdSgjkLg+jZdRFyNB8abQ0kCLe/IDQr9lu5rUCeuas0AxUUh8pw
yPy/xE2cpchPXpLoklnMdoXjdgjSVQ==
=lpVD
-----END PGP SIGNATURE-----

--upfXptObL2Kf69Mj6B3uUxQWG7a2yp2uz--


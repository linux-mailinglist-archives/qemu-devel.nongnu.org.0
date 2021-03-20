Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7363F342D72
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 15:49:43 +0100 (CET)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNcv7-0005ub-Nu
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 10:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lNbqN-0006ie-J8
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:40:43 -0400
Received: from 13thmonkey.org ([80.100.255.32]:65156
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lNbqL-0005sJ-PM
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:40:43 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 577B3C13ADD; Sat, 20 Mar 2021 14:40:37 +0100 (CET)
Date: Sat, 20 Mar 2021 14:40:37 +0100
From: Reinoud Zandijk <reinoud@13thmonkey.org>
To: qemu-devel@nongnu.org
Subject: Is accel/stubs/ still needed?
Message-ID: <YFX7Va6WqaMFVvYT@diablo.13thmonkey.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Rh8brTtgnkVk3OQs"
Content-Disposition: inline
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 20 Mar 2021 10:47:31 -0400
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


--Rh8brTtgnkVk3OQs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

a quick question. I forgot to add my accel/stubs/nvmm-stub.h to
accel/stubs/meson.build but even when I disable NVMM explicitly or build it on
a NetBSD platform that does not support NVMM, it just compiled. So, is it
actually still used?

With regards,
Reinoud


--Rh8brTtgnkVk3OQs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBV+1IACgkQgpw3AEPI
qmiAqggAn+TlrmKoatOmzzSdnhqAnlNeEIuyhkbbG0xyyJUPlNsrT+S2FQI70f9f
PEiohQX1+5pMj6svmJxKb4R9xA895d9AcHMgQQXOf41QPeK0fbl+ocZTUFzLXxlL
0pnbpZPZeiHXwmuos8SL+nSG5ldL/+cGh3C4tL1QsxkvO0ffaxwjZ3Z3xlxEEZyn
SezoUEQ0y2NVZZeqFfRwVMqWdfyvvQ5pWMwNmO44p4V7dwMIUcIPlcE2/KNoROM1
R3pcBEeXm3mZTTy5/vY+/CsUZ6SACWItP+7/qScyIlHm1yVHh8Z9Dektr7hHKswV
I+wIHtRxTbOrXnrXtsjiCNex4elohw==
=BBxY
-----END PGP SIGNATURE-----

--Rh8brTtgnkVk3OQs--


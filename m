Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA035E27D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 13:04:57 +0200 (CEST)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hid4K-0003ui-In
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 07:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59932)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hid1D-0000jI-JG
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hid1C-0005Cw-LZ
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:01:43 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:44207)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hid1C-00054U-Eu
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:01:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2575B7462BD;
 Wed,  3 Jul 2019 13:01:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0A34B7456B7; Wed,  3 Jul 2019 13:01:38 +0200 (CEST)
Message-Id: <cover.1562151410.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Wed, 03 Jul 2019 12:56:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-devel] [PATCH 0/3] Misc ati-vga fixes
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These fix color and rendering problems with MorphOS although some more
glitches are still remaining.

BALATON Zoltan (3):
  ati-vga: Improve readability of ati_2d_blt function
  ati-vga: Fix frame buffer endianness for big endian target
  ati-vga: Fix reverse bit blts

 hw/display/ati.c    |   1 +
 hw/display/ati_2d.c | 131 ++++++++++++++++++++++++++++------------------=
------
 2 files changed, 71 insertions(+), 61 deletions(-)

--=20
2.13.7



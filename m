Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC0139DC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 14:42:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMu0E-0000Ud-Nk
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 08:42:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hMtyj-0008GM-RT
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hMtyi-0005Pf-R9
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:41:21 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:38174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hMtyg-0005M1-Qc
	for qemu-devel@nongnu.org; Sat, 04 May 2019 08:41:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id E20966C62;
	Sat,  4 May 2019 14:41:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sy7r3sQYA8-R; Sat,  4 May 2019 14:41:14 +0200 (CEST)
Received: from function (105.251.129.77.rev.sfr.net [77.129.251.105])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 894336C5F;
	Sat,  4 May 2019 14:41:14 +0200 (CEST)
Received: from samy by function with local (Exim 4.92)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hMtyb-0003Qb-KX; Sat, 04 May 2019 14:41:13 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sat,  4 May 2019 14:41:12 +0200
Message-Id: <20190504124113.13137-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.233.100.1
Subject: [Qemu-devel] [PULL 0/1] Update slirp submodule
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, stefanha@redhat.com,
	jan.kiszka@siemens.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 52ec9dcc1ed5609674e7b52198c18207bb1935=
48:

  Update slirp submodule (2019-05-04 14:38:05 +0200)

are available in the Git repository at:

  https://people.debian.org/~sthibault/qemu.git tags/samuel-thibault

for you to fetch changes up to 52ec9dcc1ed5609674e7b52198c18207bb193548:

  Update slirp submodule (2019-05-04 14:38:05 +0200)

----------------------------------------------------------------
Update slirp submodule

To fix Windows on ARM.

----------------------------------------------------------------


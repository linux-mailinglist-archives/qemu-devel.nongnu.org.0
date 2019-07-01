Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA981867C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 10:03:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOe1G-0003nV-R9
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 04:03:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hOdzQ-0002V5-6s
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:01:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hOdzL-00056W-Fn
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:01:16 -0400
Received: from hera.aquilenet.fr ([2a0c:e300::1]:44742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hOdzL-000545-9K
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:01:11 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id F02EB5411;
	Thu,  9 May 2019 10:01:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AN2XbjM5NFCO; Thu,  9 May 2019 10:01:05 +0200 (CEST)
Received: from function (dhcp-13-82.lip.ens-lyon.fr [140.77.13.82])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id C8332596;
	Thu,  9 May 2019 10:01:05 +0200 (CEST)
Received: from samy by function with local (Exim 4.92)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hOdzF-0005nE-4T; Thu, 09 May 2019 10:01:05 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Thu,  9 May 2019 10:01:04 +0200
Message-Id: <20190509080105.22228-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a0c:e300::1
Subject: [Qemu-devel] [PULL 0/1] Update upstream slirp
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

The following changes since commit 30302acee710881cb248ec3391adcd54dcf523=
96:

  Update upstream slirp (2019-05-09 09:58:57 +0200)

are available in the Git repository at:

  https://people.debian.org/~sthibault/qemu.git tags/samuel-thibault

for you to fetch changes up to 30302acee710881cb248ec3391adcd54dcf52396:

  Update upstream slirp (2019-05-09 09:58:57 +0200)

----------------------------------------------------------------
Update slirp submodule

Samuel Thibault (1):
  Update upstream slirp
  Adds gitignore, README file, and fixes ident protocol parsing.

----------------------------------------------------------------


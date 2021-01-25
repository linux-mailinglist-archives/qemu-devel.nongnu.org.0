Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7430246F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:48:03 +0100 (CET)
Received: from localhost ([::1]:52992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40Li-0000kF-5y
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l40Ii-0007lL-Hz
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:44:56 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:45012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l40If-0007KD-DA
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:44:55 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-jyeZvMl1OcOfA1sU6Nc6tA-1; Mon, 25 Jan 2021 06:44:46 -0500
X-MC-Unique: jyeZvMl1OcOfA1sU6Nc6tA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF00B107ACE4;
 Mon, 25 Jan 2021 11:44:45 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86FA45D9D7;
 Mon, 25 Jan 2021 11:44:44 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] 9p next patches
Date: Mon, 25 Jan 2021 12:44:38 +0100
Message-Id: <20210125114443.933857-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit fef80ea073c4862bc9eaddb6ddb0ed970b8ad7c4=
:=0D
=0D
  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-01-20' int=
o staging (2021-01-21 10:44:28 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/gkurz/qemu.git tags/9p-next-pull-request=0D
=0D
for you to fetch changes up to 81f9766b7a16ccfcfd19e0b4525a5eeba862c851:=0D
=0D
  9pfs: Convert reclaim list to QSLIST (2021-01-22 18:26:40 +0100)=0D
=0D
----------------------------------------------------------------=0D
This fixes a Coverity report and improves the fid reclaim logic.=0D
=0D
----------------------------------------------------------------=0D
=0D
Greg Kurz (5):=0D
  9pfs/proxy: Check return value of proxy_marshal()=0D
  9pfs: Convert V9fsFidState::clunked to bool=0D
  9pfs: Convert V9fsFidState::fid_list to QSIMPLEQ=0D
  9pfs: Improve unreclaim loop=0D
  9pfs: Convert reclaim list to QSLIST=0D
=0D
 hw/9pfs/9p-proxy.c |   3 +-=0D
 hw/9pfs/9p.c       | 102 +++++++++++++++++++++++++--------------------=0D
 hw/9pfs/9p.h       |   8 ++--=0D
 3 files changed, 63 insertions(+), 50 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D



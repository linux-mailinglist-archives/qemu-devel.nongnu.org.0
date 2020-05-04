Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CDA1C48E4
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 23:21:48 +0200 (CEST)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jViX5-0000nE-1k
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 17:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jViQS-0003u2-SP
 for qemu-devel@nongnu.org; Mon, 04 May 2020 17:14:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46514
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jViQR-0000o1-Qf
 for qemu-devel@nongnu.org; Mon, 04 May 2020 17:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588626894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u9HSRTfOWmaKlYvcU8VGTxgSF1DJ51xrpMnMczLkVTs=;
 b=Zzk0p2qu985DpeJtaX2kfsEzTNZIUR5rmv2yFqmyQD8P79KXvsRJqwoM1u+cksJaC6lpi/
 isuJ2aBdWmvrQ56ElBFN41jWSHHG5jRJEvYyc6PwRAnzRia2UWEPq8RSb5+GXHv91SzfNb
 cVpz2jkSeG3IjYSaiW8bMeh9Lr4/1lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-6VBsm1ZDPY6ol80K0awX0w-1; Mon, 04 May 2020 17:14:47 -0400
X-MC-Unique: 6VBsm1ZDPY6ol80K0awX0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC744462
 for <qemu-devel@nongnu.org>; Mon,  4 May 2020 21:14:46 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89FAD6FF1B
 for <qemu-devel@nongnu.org>; Mon,  4 May 2020 21:14:46 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] NBD patches through 2020-05-04
Date: Mon,  4 May 2020 16:14:34 -0500
Message-Id: <20200504211438.195926-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 16:32:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Happy Star Wars Day! May the Fourth be with you as you apply this...

The following changes since commit 5375af3cd7b8adcc10c18d8083b7be63976c9645=
:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging=
 (2020-05-04 15:51:09 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2020-05-04

for you to fetch changes up to 714eb0dbc5480c8a9d9f39eb931cb5d2acc1b6c6:

  block/nbd-client: drop max_block restriction from discard (2020-05-04 15:=
16:46 -0500)

----------------------------------------------------------------
nbd patches for 2020-05-04

- reduce client-side fragmentation of NBD trim and status requests
- fix iotest 41 when run in deep tree
- fix socket activation in qemu-nbd

----------------------------------------------------------------
Eric Blake (1):
      tools: Fix use of fcntl(F_SETFD) during socket activation

Max Reitz (1):
      iotests/041: Fix NBD socket path

Vladimir Sementsov-Ogievskiy (2):
      block/nbd-client: drop max_block restriction from block_status
      block/nbd-client: drop max_block restriction from discard

 block/nbd.c            | 6 ++----
 util/systemd.c         | 4 +++-
 tests/qemu-iotests/041 | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

--=20
2.26.2



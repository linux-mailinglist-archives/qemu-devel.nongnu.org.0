Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7A31321D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 18:23:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMaxu-0004yl-If
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 12:23:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu_oss@crudebyte.com>) id 1hMavV-0003Pq-UB
	for qemu-devel@nongnu.org; Fri, 03 May 2019 12:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <qemu_oss@crudebyte.com>) id 1hMavU-000544-Lw
	for qemu-devel@nongnu.org; Fri, 03 May 2019 12:20:45 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:53547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
	id 1hMavU-0004zB-2V
	for qemu-devel@nongnu.org; Fri, 03 May 2019 12:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IjVkMgLXbokAhulZTvyt9DaCxjiGi1PgnfviFxDpTvk=;
	b=YQtdHeynogTv/YFLJ7xQYI9A2K
	6oiIAFD/Rdk+CalACQfR8yET1u9D/k6HeO0bTZdofhKV8xIlZ5QLIBYpvzMRZYaT8RQPmg0+2KYwD
	6FYyaFhlmaWjNTA2fw4TPVSo6LW2sJIWZ+OkusgY1lKwZ4IK3R7Jt+wgqH8WD5k+AUfx03fjFoTT/
	1ZzwLeuInTbPwmJbzmhKviXO92mhopdyxMW+TaHUdVRys7C85ZDadGZ4RRGrUJAZOrG3qoJArZVuG
	y23u1w152BwtcMf0Fvad8ClHpXemVTnKhjez1tBjBTqsHnfbUVm5kwpJTmelEct5PK3456QMPrXh5
	NW0ij/ibOvXZPqNhrXV5GeDC42LId7PfQ5PJ22FrIv8CaSrAUiVhi4Zk+B58C8yGboNnkfU4jL5ww
	VRtv9FtXAoNYJ44X6xakpLfzd5IgQ7o/2OT9CamnN3kNDGdTCGbaMRQjJouWeTbN2d7PBv4h7YZkp
	4pCsBr4V1KlQeY7xAVwt7SnsysVLlPGrGjQb4AeiJ2pp0rQ1sap4rK1/XLlSrnOiaOvs56w7YkKME
	TWRWHW+Eni1IZH6B/iLVNyn1AGVxYf/4dDZddRl9SUywZs1RQMKYx24Wd0ue1KYCclpCi3DULrQLj
	xVEj63qA/LUIWVIxfBcW1ElhDN4d3ghyYWYEpZsVU=;
To: qemu-devel@nongnu.org
Date: Fri, 03 May 2019 18:20:39 +0200
Message-ID: <1926077.q6xKvCkoZ9@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam_score: -0.0
X-Spam_score_int: 0
X-Spam_bar: /
X-Spam_report: Spam detection software,
	running on the system "kylie.crudebyte.com", 
	has NOT identified this incoming email as spam.  The original
	message has been attached to this so you can view it or label
	similar future email.  If you have any questions, see
	the administrator of that system for details.
	Content preview: Hi! This is v2 of a proposed patch set for fixing file
	ID
	collisions with 9pfs. Patch 1 to 3 are identical to the previous
	version.
	New in this v2 is patch 4 which introduces variable length suffixes for
	inode mapping instead of fixed length prefixes. 
	Content analysis details:   (-0.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-0.0 NO_RELAYS Informational: message was not relayed via SMTP
	-0.0 NO_RECEIVED Informational: message has no Received headers
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
Subject: [Qemu-devel] [PATCH v2 0/4] 9p: Fix file ID collisions
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
From: Christian Schoenebeck via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Greg Kurz <groug@kaod.org>, Antonios Motakis <antonios.motakis@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

This is v2 of a proposed patch set for fixing file ID collisions with 9pfs.

Patch 1 to 3 are identical to the previous version. New in this v2 is patch 4
which introduces variable length suffixes for inode mapping instead of fixed
length prefixes.

Also: patch 4 disables file ID persistency at compile time by default for now,
since I am yet unresolved about details of that persistency.

Christian Schoenebeck (4):
  9p: mitigates most QID path collisions
  9P: trivial cleanup of QID path collision mitigation
  9p: persistency of QID path beyond reboots / suspensions
  9p: use variable length suffixes for inode mapping

 fsdev/9p-marshal.h   |    6 +-
 hw/9pfs/9p.c         | 1145 ++++++++++++++++++++++++++++++++++++++++++++++++--
 hw/9pfs/9p.h         |  167 ++++++++
 hw/9pfs/trace-events |   14 +-
 4 files changed, 1296 insertions(+), 36 deletions(-)

-- 
2.11.0




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983C378C7B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:56:02 +0200 (CEST)
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5S4-0007LU-LZ
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lg5Q0-00052u-B2
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:53:52 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:29307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lg5Py-0002LF-Bd
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1620651230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=90h2EWbpPdONjsbw9R/onChid2tDuogV3ZltmSsZ+ts=;
 b=JSQ9r/OjrPu/OqutHQxt9gcyB6A74Uxj7QhrCyJSX2/qZslJAYRXOZYU
 CcckNOUjG5jZbQi9XVE9KSKC+TDQfzY7cFAdXmrb+vuM79DbC0KdKy3JW
 OeJYkvPs3d2mlGnjtBUWivGjNWXs7mxaqY3g3VviSn4AdMTNCK34dYvBq A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gGpEUdE4AajfC4MoDIQXculaCRNiY0qSu9wG6SLT1PefgC+u/nveKTjvIeb/QdwyV3nBPP4gK9
 ZVXCBMyGN99uTLDjVcaJtnizVhWD8Jx005dAq4Kg0Dt8xFdJuhldxSLrMV5cfQs7WuMZ7hudiv
 07S8AKh+QXOySNo/IPs7E5+nawDXgO8DadyQmhktg9NE31rVQLvPKUrKv6T8SApyRe1blo/muv
 EWzgVW68SC6ULnx5/5HSLVvmanNDPAHdkQ677BfQ5BanxgPHrSDEWYtX0Pz70WVHkvzE1q74LW
 Fr0=
X-SBRS: 5.1
X-MesageID: 43429921
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:J7Q0qavQzT9uBGJ59VlxEkpZ7skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHvJYVcqKRcdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyYygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.82,287,1613451600"; d="scan'208";a="43429921"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 0/3] xen queue 2021-05-10
Date: Mon, 10 May 2021 13:53:37 +0100
Message-ID: <20210510125340.903323-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=anthony.perard@citrix.com; helo=esa2.hc3370-68.iphmx.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

The following changes since commit 4cc10cae64c51e17844dc4358481c393d7bf1ed4:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-05-06 18:56:17 +0100)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20210510

for you to fetch changes up to 1898293990702c5601e225dac9afd2402fc46e2d:

  xen-block: Use specific blockdev driver (2021-05-10 13:43:58 +0100)

----------------------------------------------------------------
Xen patches

- Avoid mmap race involving Xen's mapcache
- Fix xenforeignmemory_resource leak at exit
- Fix xen-block to choose a driver for the disk image when created via
  xenstore.

----------------------------------------------------------------
Anthony PERARD (2):
      xen: Free xenforeignmemory_resource at exit
      xen-block: Use specific blockdev driver

Igor Druzhinin (1):
      xen-mapcache: avoid a race on memory map while using MAP_FIXED

 hw/block/xen-block.c        | 14 +++++++++++++-
 hw/i386/xen/xen-hvm.c       |  9 ++++++---
 hw/i386/xen/xen-mapcache.c  | 15 ++++++++++++++-
 include/hw/xen/xen_common.h |  6 ++++++
 4 files changed, 39 insertions(+), 5 deletions(-)


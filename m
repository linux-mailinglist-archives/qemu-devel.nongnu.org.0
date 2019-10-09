Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C5ED1974
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 22:13:53 +0200 (CEST)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIILI-0004Ls-Bu
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 16:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iIFQd-00026Y-CD
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 13:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iIFQb-00040q-Uk
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 13:07:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55372)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iIFQb-0003zn-PN
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 13:07:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CEE5E11A27;
 Wed,  9 Oct 2019 17:07:08 +0000 (UTC)
Received: from thuth.com (ovpn-116-38.ams2.redhat.com [10.36.116.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA3C060167;
 Wed,  9 Oct 2019 17:07:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/5] travis.yml improvements: Update libraries,
 build with arm64
Date: Wed,  9 Oct 2019 19:06:56 +0200
Message-Id: <20191009170701.14756-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 09 Oct 2019 17:07:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update / add some libraries that we use in the Travis builds, and
enable compiling on the aarch64 host, too.

Thomas Huth (5):
  travis.yml: Add libvdeplug-dev to compile-test net/vde.c
  travis.yml: Use libsdl2 instead of libsdl1.2, and install
    libsdl2-image
  travis.yml: Use newer version of libgnutls and libpng
  travis.yml: Fix the ccache lines
  travis.yml: Compile on arm64, too

 .travis.yml | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

-- 
2.18.1



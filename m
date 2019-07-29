Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A279066
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 18:10:57 +0200 (CEST)
Received: from localhost ([::1]:54890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs8Ei-0002VE-Rf
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 12:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55993)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hs8Dt-0001iW-JR
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:10:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hs8Ds-0006n7-Ni
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:10:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37256)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hs8Ds-0006mA-J8
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:10:04 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B7AB830C1342;
 Mon, 29 Jul 2019 16:10:03 +0000 (UTC)
Received: from localhost (ovpn-116-93.gru2.redhat.com [10.97.116.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1889810016E9;
 Mon, 29 Jul 2019 16:10:01 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 13:09:58 -0300
Message-Id: <20190729160959.24364-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 29 Jul 2019 16:10:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] x86 queue for 4.1
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 893dc8300c80e3dc32f31e968cf7aa0904da50c3:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2019-07-29 12:04:53 +0100)

are available in the Git repository at:

  git://github.com/ehabkost/qemu.git tags/x86-next-pull-request

for you to fetch changes up to ff656fcd338a70c4d9783a800733c4ab3806e5b0:

  i386: Fix Snowridge CPU model name and features (2019-07-29 13:08:02 -0300)

----------------------------------------------------------------
x86 queue for 4.1

* Rename and fix SnowRidge CPU model (Paul Lai)

----------------------------------------------------------------

Paul Lai (1):
  i386: Fix Snowridge CPU model name and features

 target/i386/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.18.0.rc1.1.g3f1ff2140



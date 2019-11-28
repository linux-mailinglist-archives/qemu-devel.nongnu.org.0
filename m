Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B531E10CCCD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 17:25:44 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaMbv-0003kr-9c
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 11:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iaLpY-0002kU-5I
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 10:35:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iaLpU-0005gD-Ru
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 10:35:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26205
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iaLpU-0005OH-MX
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 10:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574955337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MhvFNij/cGwxv14ogCZrZHKF5oi2NOeUu9hqfBSmqLQ=;
 b=aKmUYf/KgbviL6lLloRMj4X9UpyuR2V8f8Vbr2mcYB2QQo2q4XkkEYR+S02IjQEUP4dH1F
 M+BLs14v9myBWBFa5oKIQjPfp62BoLseCg8BH3Kcr6RSSR9L5gF/jXffiicTFACvrSwKz+
 8xz6yhboMvmvRadImTxGuZEDwqSEpm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-4y5NH55nOwy4FZ_S5nbGjw-1; Thu, 28 Nov 2019 10:35:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15A78107B7DB;
 Thu, 28 Nov 2019 15:35:31 +0000 (UTC)
Received: from thuth.com (ovpn-116-114.ams2.redhat.com [10.36.116.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC2FD131FE74;
 Thu, 28 Nov 2019 15:35:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Run tcg tests with tci on Travis
Date: Thu, 28 Nov 2019 16:35:23 +0100
Message-Id: <20191128153525.2646-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 4y5NH55nOwy4FZ_S5nbGjw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's now possible to run some TCG-based tests with our Tiny Code
Generator Interpreter (TCI), too. These two patches enable the
testing on Travis.

Alex Benn=C3=A9e (1):
  configure: allow disable of cross compilation containers

Thomas Huth (1):
  travis.yml: Run tcg tests with tci

 .travis.yml            | 7 ++++---
 configure              | 8 +++++++-
 tests/tcg/configure.sh | 6 ++++--
 3 files changed, 15 insertions(+), 6 deletions(-)

--=20
2.18.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F2B1B77
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 12:19:49 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8ig8-0003Jh-1H
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 06:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1i8idl-0001uc-IJ
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1i8idk-00017R-HC
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:17:21 -0400
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170]:35407)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1i8idk-00016L-4q
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=Nh5XG2oEzOEGrJppuQO1p8zvGNGXE4jwCnWawi+ubf8=; b=kvz/KeSCUgWBCqC0BqULtK0DQP
 I8qbu7WH+fjKXnT9FLae4c44D5K2pKFUbFuWfSDoHsKkxgtSrxJ/d70KkugCBNd6CtSyQroRVcS+a
 FEaAaC5wy9Lv4510nNRI0mXxN8yBICBxADFMY/UTqggOUFtVDqVNmvPgLzB+DWk1Sg/M=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de
 ([46.5.233.221] helo=x280.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1i8idh-00076C-Pd; Fri, 13 Sep 2019 12:17:17 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Richard Henderson <richard.henderson@linaro.org>
Date: Fri, 13 Sep 2019 12:17:12 +0200
Message-Id: <20190913101714.29019-1-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:470:70c5:1111::170
Subject: [Qemu-devel] [PATCH 0/2] HPPA tcg fixes
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
Cc: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

here are two patches for HPPA tcg. QEMU was crashing with a tcg assert
because dead temporaries where used. This could be observed at the end·
of a HP-UX 11.11 installation, or by running the STARBASE X11 demos in
HP-UX 10.20.

Thanks,
Sven

Sven Schnelle (2):
  target/hppa: prevent trashing of temporary in trans_mtctl()
  target/hppa: prevent trashing of temporary in do_depw_sar()

 target/hppa/translate.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.23.0.rc1



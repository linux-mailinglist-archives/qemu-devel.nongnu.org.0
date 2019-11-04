Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081EFEE5FF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 18:32:01 +0100 (CET)
Received: from localhost ([::1]:35734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRgCt-0003Jl-Pp
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 12:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1iRgBR-0002WV-Db
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 12:30:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <flukshun@gmail.com>) id 1iRgBQ-0006Ip-G4
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 12:30:29 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39384)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <flukshun@gmail.com>) id 1iRgBQ-0006IO-BW
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 12:30:28 -0500
Received: by mail-oi1-x241.google.com with SMTP id v138so14823968oif.6
 for <qemu-devel@nongnu.org>; Mon, 04 Nov 2019 09:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=IBXDAzDv4jMVN4HVkExpkj4YJ/RZ0eeoVpdxAwobc54=;
 b=ntr+oDjkL/n5VSgdQhJi5ZMVZe6vd+JZxYP7ZLmUKerFTk/e7EL9HpDFWFKK0J2ZZc
 bt7K2vOmYr79Lejrf9zKTUgPUd03Q1ziOg5QxEGZgaGnN9Iqx9eXyTid38pwe+2RTVIY
 GV/RVvl0zWB0atoIjCeI29s9Y0HR+rE+SRoxJW4kltUZZkQR4+Vru0eqoFB5gxTqTgAh
 r7cOUslGaEGOI0cbJWGx2XYNc3GTZGtsHgJVBkiLzGSE/T0iH2Dp8b4u3NZgqbtEVIbz
 HF+QrMu3bfakOisfBT7lBoxWFIVrKDyq+FwsKZ+gLvXCTUvslFDCvbmejKpolZFXcFBz
 TkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=IBXDAzDv4jMVN4HVkExpkj4YJ/RZ0eeoVpdxAwobc54=;
 b=rux/2MNQfnLuIDN1nfhLCSJYpJODYpog8Z8h1mNI6e0HhNneJkXQXj46c5STtjlCKF
 H0Rfxkbq8VRmQnxY+RtCfE6kThoBU/RwLkpty1wDfGiVoiFA+NMYVTaYujAxV6ZvNki7
 5aY6/zjqKpPzBtcvB4Fb3ovwlThyVQ0VWC1QH5YjYqHJno1piwNYrscDi1TvSH6DC5b5
 Q4fArfNjSWHK8VQkaQtV0Lsz4rlDI9qfF84bX9krhpmeGJ+XUZrRSygjaSadCA0qgbdp
 H1PE4kDHyFGPx1sE/LhDbEuHvF8F/AD6SiF2k22pIo1WgCVCrOXwjNNDgfrglC5QZUKU
 VlpQ==
X-Gm-Message-State: APjAAAXQlJHC51Zf5srPUjD9SZRWdJrd1t9WInVRDoMlW9PPqQp/RzCp
 K9I3z34h8hpNULJqoHbd0nvWliHM2T4=
X-Google-Smtp-Source: APXvYqxqvbRgFkTipStp5azc6/OPOyXXNQW90nSWNwRec1i8V0/VNcQom+JSBsyqnFGcnO78TtljrA==
X-Received: by 2002:aca:de84:: with SMTP id v126mr192521oig.46.1572888625991; 
 Mon, 04 Nov 2019 09:30:25 -0800 (PST)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id 202sm4912669oii.39.2019.11.04.09.30.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Nov 2019 09:30:24 -0800 (PST)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] qemu-ga patch queue for 4.2-rc0
Date: Mon,  4 Nov 2019 11:30:15 -0600
Message-Id: <20191104173017.14324-1-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 36609b4fa36f0ac934874371874416f7533a5408:

  Merge remote-tracking branch 'remotes/palmer/tags/palmer-for-master-4.2-sf1' into staging (2019-11-02 17:59:03 +0000)

are available in the Git repository at:

  git://github.com/mdroth/qemu.git tags/qga-pull-2019-11-04-tag

for you to fetch changes up to 28d8dd355be98da6239bd5569721980c833df6a1:

  qga: Add "guest-get-memory-block-info" to blacklist (2019-11-04 08:50:54 -0600)

----------------------------------------------------------------
qemu-ga patch queue for hard-freeze

* fix handling of Chinese network device names in
  guest-network-get-interfaces
* add missing blacklist entries for guest-get-memory-block-info for
  w32/non-linux builds

----------------------------------------------------------------
Basil Salman (1):
      qga: Add "guest-get-memory-block-info" to blacklist

Bishara AbuHattoum (1):
      qga-win: network-get-interfaces command name field bug fix

 qga/commands-posix.c |  3 ++-
 qga/commands-win32.c | 12 ++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)




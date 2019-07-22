Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20B36F8C8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 07:20:07 +0200 (CEST)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpQk2-0000Dj-SF
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 01:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41805)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <npiggin@gmail.com>) id 1hpQjq-0008GM-Bg
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 01:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1hpQjp-0004Wi-Ew
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 01:19:54 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39234)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1hpQjp-0004Vq-82; Mon, 22 Jul 2019 01:19:53 -0400
Received: by mail-pl1-x643.google.com with SMTP id b7so18655760pls.6;
 Sun, 21 Jul 2019 22:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7FSRcmoYJHaIWDpjU4QKCYnCqNouuFeSRCT2wJ/XcU=;
 b=UCKLAxZpAAQKone/dYSay7mqrvX/+avPEPkBKeK0yfi1wgr9Up+R0qluIQF9fR62f2
 JaJ4ULkzpMuKrc9uafBOwifWpwffDha3o0OK6kj7gsknjnxXk0ej/izmxMrjs1CI2lx2
 0U2TwdxPYDwJjNAxloYo/zy80GTQ5/rUV9nGHHBXmC4lNN9/KqPursdz1AEWJDEJn0NY
 z8ft4Oe8nTaf+3EZr5cNO7WwUJT7B9/NuxrccAVEdDSmWIwF+rUdpWwcfR5f7kNHsxTm
 bel45yKQiZY/xNoWdqH2rzY/DF/hvB0zdXYhQrlf/a+F6Ziy477aAFrbB4wkqn5/g8ej
 SQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7FSRcmoYJHaIWDpjU4QKCYnCqNouuFeSRCT2wJ/XcU=;
 b=GHwkVzoHFOo/NNZBplRyAu3+m3bPRhHqyRlHUAccW7P+UHZOPybm/GeGYPHEVV48Te
 fkYTMnXY1TAZJo0Ye2Dm5tSLVAM36do9VLn5LMo7k/hhbDUurRPnTdfKCyjgyCwAvtLr
 9xK+oLqxWhKoWRSmBKPKCNAN8Ha6tl8UfxehBiKZYxv8vEYdFxSWEijvtFldiocOEPZW
 sOyEDCNUfpjKp17TYg36wnhkPjJzWkKWP/LvuoM5IrEijvwVM/BIPKw2oU29rMDAG7sn
 5iVHSLfKn46fg4no3VkhQSer6Wo6If+TjLls3u7+fxlKrdvpITxcENqazWYvXVJdF4bx
 9eAw==
X-Gm-Message-State: APjAAAUnCnDfWQtr3/O7BMRfU6oP3Ga/Zv32H0jePZA14XK7MMxpeJOO
 SXD8S9xd+nTkFBAWzbH7OBMI2nOmksw=
X-Google-Smtp-Source: APXvYqwLev4w1b9czHNW/Kl9MCCkagsMf4M+6NdVQM6qCl23Hm+7q+vCcBeKod2zX0s0fSvVSiEQsw==
X-Received: by 2002:a17:902:d917:: with SMTP id
 c23mr73428396plz.248.1563772791128; 
 Sun, 21 Jul 2019 22:19:51 -0700 (PDT)
Received: from bobo.local0.net (193-116-123-212.tpgi.com.au. [193.116.123.212])
 by smtp.gmail.com with ESMTPSA id d129sm42741889pfc.168.2019.07.21.22.19.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 22:19:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 15:19:34 +1000
Message-Id: <20190722051937.20454-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v2 0/3] Series to implement suspend for
 ppc/spapr
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
Cc: "Liu, Jinsong" <jinsong.liu@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Luiz Capitulino <lcapitulino@redhat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this series is rebased on top of the qmp event fix, and takes
Paolo's suggestion to implement ->wakeup for i386 before adding
ppc, which makes it much nicer.

If the first two patches can be agreed on initially and merged, I
can take the third patch through the ppc list after that.

Thanks,
Nick

Nicholas Piggin (3):
  machine: Add wakeup method to MachineClass
  i386: use machine class ->wakeup method
  spapr: Implement ibm,suspend-me

 hw/i386/pc.c           |  8 ++++++++
 hw/ppc/spapr.c         |  7 +++++++
 hw/ppc/spapr_rtas.c    | 32 ++++++++++++++++++++++++++++++++
 include/hw/boards.h    |  1 +
 include/hw/ppc/spapr.h |  3 ++-
 vl.c                   | 16 +++++++++++++++-
 6 files changed, 65 insertions(+), 2 deletions(-)

-- 
2.20.1



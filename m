Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF4DD8C1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 14:57:58 +0200 (CEST)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLoIv-0001nB-2f
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 08:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lists@kambanaria.org>) id 1iLoGc-0000fd-6f
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 08:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lists@kambanaria.org>) id 1iLoGb-0007t9-68
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 08:55:34 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34915)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lists@kambanaria.org>)
 id 1iLoGa-0007ox-Dg
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 08:55:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id l10so8550409wrb.2
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kambanaria-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vE7eWsEykPVQh6chfVqQn0jiunHw9+9ifXXWx/ZFiZI=;
 b=eovFhNApAecPbiFZNS+DWJZc6W5vw1uQScVAX65bOAHjap2ZmGqnmDa9xlKnlKbg+S
 cAhTruWX4C+fPBdfm7jg+H780Ss/InWg5BMIDolL2jBZV2PDoKy78aSiMBqO/NhdY3Iq
 jlOFoQo7YmRlnHs6kQY+LYehV6qnrV2HsdVRSddfRNQwAOWtIxpIHk3F1ewapnr8+5Gq
 ZQwXlj7UuZaFOfpzlhxElBIHjoMSs8u1cXmZOPyYiPWjgbQnDsX0/5Fk99pFhRsYrnpL
 hGA2qjWs9ekP/dG5SHfY6XRrZFH8A2CSYoj+5KwnY231fqVx1ZcolyJKe1MVAghvay0U
 UViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vE7eWsEykPVQh6chfVqQn0jiunHw9+9ifXXWx/ZFiZI=;
 b=rbikj8MHrSPtC+jajEkw0PAumE7UmAPaRm3KCv7AEzseKiCvG7erKJuBaIjzkNMp1Z
 wqgG/VTJO/LzykLkaL6I3Eq19qyfDfPpHCItkAQgy/4v8rvGt4//F97Eya9AgwdTexWg
 DcL9fW5aHFr665pmhOraqSgt8TiE2LbV87/jluql2xAkiD0KHjl6y5Lh2cJqkt5cFHZU
 M0s7dFMrA5INmx1bqkw603iIGebXz+08mAGEH+30iPQQFvvk3/Od+1YmplqASwJ06mcv
 fRhbZCwkFYIDpgh9TV+kuhbdHlJKlhtghhBgEQAi0TDq7rx23krc+TubVeF3uoAvYq+b
 rCvw==
X-Gm-Message-State: APjAAAWNYs0M9Wf2XQL3NI53R3k/Nt4OXKeUnoXSWpC7+5dxoumZMi7d
 8qv4viksEy3kZODAub1lFt57YfjKXq0J6A==
X-Google-Smtp-Source: APXvYqyd3z5GBM5r968eMoSTAeerxRNfyNjF5Tk97imdqW6T4Uk6r+6SyVOM6W6GHFBx4bOI+9pExQ==
X-Received: by 2002:adf:e886:: with SMTP id d6mr12290082wrm.188.1571489730397; 
 Sat, 19 Oct 2019 05:55:30 -0700 (PDT)
Received: from ashopov-C02X544YJHD3.home (ip4da0f75a.direct-adsl.nl.
 [77.160.247.90])
 by smtp.gmail.com with ESMTPSA id b22sm9285402wmj.36.2019.10.19.05.55.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Oct 2019 05:55:29 -0700 (PDT)
From: Alexander Shopov <lists@kambanaria.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Update Bulgarian translation
Date: Sat, 19 Oct 2019 14:55:19 +0200
Message-Id: <20191019125520.29056-1-lists@kambanaria.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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
Cc: qemu-trivial@nongnu.org, Alexander Shopov <ash@kambanaria.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Shopov <ash@kambanaria.org>

This is the updated Bulgarian translation of Qemu

It has 1 new message translated and corresponds to v 4.1.0 and up
I am sending to the devel list, the trivial patch list and
all people listes as CC, Tested-By, Approved-By in the po dir
Please ping if that is too wide an audience and point me to
the right targets


Alexander Shopov (1):
  Updated Bulgarian translation (19) - 4.1.0

 po/bg.po | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.23.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B61DD8DA
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 15:52:06 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLp9J-0003K3-UE
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 09:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ash@kambanaria.org>) id 1iLnUT-0006TQ-9m
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 08:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ash@kambanaria.org>) id 1iLnUS-0002sA-CU
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 08:05:49 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39483)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <ash@kambanaria.org>) id 1iLnUR-0002r5-Va
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 08:05:48 -0400
Received: by mail-wr1-x444.google.com with SMTP id r3so8895250wrj.6
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kambanaria-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D6rBFCWd7TXy/HRgb/86qSVMzCfvtlb6XwpaugqYJio=;
 b=gPgVTb81Pw3us9IJhAlVxhPES+J2Sl85nnxVQXqggsBUMQNdtCNqhCRcbzDHy7edGe
 aACLUSzrgxJwvqQ30nhdtFlfFVch1Q0+sZpGr07SLr34esmVF6j6M85IzjSj6g20HvP1
 R6mlJpk+07cLJhNOLM/jx8zhmpd8mVO7RHisXLXlXiS26ANxw51eFHI14xcPIuQDP+EI
 O8ROEQtEagGdXlZ2aAHIsKTWdmsfyTxns+1xBQBw6sb8Hx18lcCJOqp/S8chMiIfqm+Q
 2YNX4Qp9hox/Km6uxIuvGSwBtouWV/aAPC3ySE96gSHkiHLwchVo3L+eHqzaI5IVX7mj
 T0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D6rBFCWd7TXy/HRgb/86qSVMzCfvtlb6XwpaugqYJio=;
 b=MFZ3gONlpCEP8m0duRi6PDgLvUDlnbE+ua9mvYVYWXmcF5sDVYtkcUvN/8b/nKsQQM
 Lo/VmIR20ajAVvTyMzh+m4mszDJnGi7VquGsyPAMOJZdEJVqw7S1bIu3HeAiw5AdGvZC
 j2KN7N1ynArLfeTy0HgdHKeZqRGcIT075pfqrnRte5evmwS6z61oGBTLsrvm46RhZ1OU
 ouT4PEOfqEJzULkkEYQbksIrGCR5npgNQ757JE4oN3PGqfTyfKu/g/klnkqrangkXpSb
 T7j70uP+d4XRod7PQhrBleQ9BgytZurtwrg0N89zocptF6pDljaHwZposUeHu1HWqjcN
 sc3g==
X-Gm-Message-State: APjAAAUkf/9b9VBQMb7nVTAKWa04rZARfVJSJmSsMJtEk+zOGk7gA2qG
 fieKAwUrOuIZ7NNBBr1lE0rkIa0brKYwaw==
X-Google-Smtp-Source: APXvYqyQel5+wKejBxzlwC+ekLa/M6cOwuskAAo3G3tGR8HRJmTCYAPd0v/I0aNjSAXxs6U2T77JQA==
X-Received: by 2002:a5d:66c1:: with SMTP id k1mr6674234wrw.73.1571486746077;
 Sat, 19 Oct 2019 05:05:46 -0700 (PDT)
Received: from ashopov-C02X544YJHD3.home (ip4da0f75a.direct-adsl.nl.
 [77.160.247.90])
 by smtp.gmail.com with ESMTPSA id z22sm9249550wmf.2.2019.10.19.05.05.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Oct 2019 05:05:45 -0700 (PDT)
From: Alexander Shopov <ash@kambanaria.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Update Bulgarian translation
Date: Sat, 19 Oct 2019 14:05:33 +0200
Message-Id: <20191019120534.27479-1-ash@kambanaria.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-Mailman-Approved-At: Sat, 19 Oct 2019 09:51:04 -0400
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
 Fam Zheng <famz@redhat.com>, Wei Huang <wehuang@redhat.com>,
 Pino Toscano <ptoscano@redhat.com>, qemu-trivial@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, Alexander Shopov <ash@kambanaria.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Amos Kong <akong@redhat.com>, Dongsheng Song <songdongsheng@live.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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



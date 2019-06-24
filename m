Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE2501B3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 07:57:00 +0200 (CEST)
Received: from localhost ([::1]:48104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfHyN-0001cn-I6
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 01:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35100)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vandersonmr2@gmail.com>) id 1hfHxC-0000ei-MZ
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 01:55:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vandersonmr2@gmail.com>) id 1hfHxB-0003tr-QJ
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 01:55:46 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:45723)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <vandersonmr2@gmail.com>)
 id 1hfHxB-0003sS-MJ
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 01:55:45 -0400
Received: by mail-qt1-x82a.google.com with SMTP id j19so13236292qtr.12
 for <qemu-devel@nongnu.org>; Sun, 23 Jun 2019 22:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zA8ZWKYF7wiR6/oE1xobBuTt6PuxRqboUQZr8hwOW6s=;
 b=FVXD56khhyl3bKzlNoHbZpJmTMMA0rEr/a8uHPTzMeM+3bdUHSII80bwatj6iZZ5Ah
 wAzfW2ZnEdFQs6RITg5RnnoaNiwWslwuPOip9z8pUgf5S2Z0ztEsoyU3ZTFmpgcM2HND
 Vck8AlmevX7/mc3O000RhthxJ7DNKtbrQf8TRtnaFp9yCy8qZT7RuJyZsml/lRs2vg7V
 WxjqdQdcYPbUTiEaToGAXJe0H8Qp7pLSIK8BsVcb6y49ipknIILaPDpfVZfIaUXCCBzP
 rmVdjNIoNh8RMzEX0fxTrzp5XQGR/3BOsXI534CN6v3zKMmGGWlUsVIAZrksTMwxs61E
 sbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zA8ZWKYF7wiR6/oE1xobBuTt6PuxRqboUQZr8hwOW6s=;
 b=CgEclFlyfokSFLiQ//E/Ws9z3VhI1MzwVPgR4IZKA5Gvs5CLiwy7ppJRPKp6HWBRaK
 qVH++lxKS2dA2qdDYJQh9oWBGEwj4//EYrJyMFpzsHEOLKpqcvz7zxA3OEXbNTMGTDXx
 AwbPcJLmkrt56AUEoq05trWx9Cd39r4k/jhNCVx2/9sIucxQeFCaEVtERNUaRN2Lx6vI
 it+f0B90C6oiwUML9QSba6McdBgYMSUsdGvNfH4ExbpArZ4dAf8hFIXFQUEgi1dvGEZY
 xysUUzuJ9tl4rSvxpbwZ2AiOEuOyhOKqmxQ016uHgymC4+MCsue7ACBJsN4r4qInvWsJ
 VlVQ==
X-Gm-Message-State: APjAAAUFSwHZoT5Vl+iw+Ss9QM6Ad5ddqinMccZdmy6X2UmOTQTBJzA2
 /ZYvd4AyUSxZjkDXIddKAbBQH2/S
X-Google-Smtp-Source: APXvYqzN6DWvMavBUcYERcJNtfw8pdleiXCJSHmoDPbX1x8IJNTmDdNFKeoBCdVHO1Sip/dpPoiyDQ==
X-Received: by 2002:a0c:ae5a:: with SMTP id z26mr56066454qvc.65.1561355742093; 
 Sun, 23 Jun 2019 22:55:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:548d:5237:c368:80a0:cb96:64bf])
 by smtp.googlemail.com with ESMTPSA id t80sm5154440qka.87.2019.06.23.22.55.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 22:55:41 -0700 (PDT)
From: vandersonmr <vandersonmr2@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2019 02:54:38 -0300
Message-Id: <20190624055442.2973-1-vandersonmr2@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::82a
Subject: [Qemu-devel] [PATCH v2 0/4] dumping hot TBs
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

It adds a new structure which is linked with each TBs and stores its statistics.
We collect the execution count of the TBs and store in this new structure.
The information stored in this new struct is then used to support a new
command line -d hot_tbs:N which dumps information of the N most hot TBs.

Different from v1 now the execution count is being updated directly
from the TBStatistics so we do not need to copy the data when flushing.

[PATCH v2 1/4] add and link a statistic struct to TBs
[PATCH v2 2/4] Adding an optional tb execution counter.
[PATCH v2 3/4] Introduce dump of hot TBs
[PATCH v2 4/4] adding -d hot_tbs:limit command line option



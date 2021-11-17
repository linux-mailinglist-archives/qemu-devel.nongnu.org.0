Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003F45511B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 00:25:55 +0100 (CET)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnUJO-0005LC-Id
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 18:25:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnUI3-0003rW-L9
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 18:24:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnUI0-0002PM-Ev
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 18:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637191467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GZRCrztROWcQSBi9zjxStl2XLOYBCXueBAT8cP8iNoY=;
 b=Jk5XlkQLzH+0WEflXFoWccjhzb73HS+G3U6zhXhuZByOnKi35znc7l4Xcq8ao8p+Qjf5fP
 wmY+nRWkXSZ05y8UHLiTQsnXdJgC0gGbcjpQIVeQYv7RRY+YRpR4pzC9N2Bj0u4xOmDxv+
 z7d0WxLg6W4Lt6zECOQJ32GpByaXbA8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-liGPK_--Preie9TN6W0IVA-1; Wed, 17 Nov 2021 18:24:26 -0500
X-MC-Unique: liGPK_--Preie9TN6W0IVA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so3466945wma.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 15:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NmSIhd2Vl3D6Kd0JcoOEI8HAL+QfOjVjK9eTin9VvEg=;
 b=ebLmm5Kl/fVK/fu8g7FvhGxnXkiC01Pm3VytcqzKnZ0PAX4rP8nMCG4Nbc2t2xoZGG
 oXel/tKkaIY+MbZNk+VuzDot4bhvMwxiCtPTYpB6W6xNWQ09Yx95OBXVU+weF/3jBxe5
 Tm4XDhegUL805xdOizgyOhpgEW4+HmCaDKbz2E1sF62ac+6Qh4yrkjwgIdGiDLFoAdc1
 ABFecR0/Vn+q2JqDeBaTXzYWSdShi/woEsZ0oImrU2DyInNEPHpcuM+7NXUZubTov0QH
 nqarOC2+GXEKipv5VgTmE2KPoebtFPzFgdMiBXDdf6UrGa0ZAPI6YYrJauKUAXaMyC8m
 lxlQ==
X-Gm-Message-State: AOAM530Z4eIQAuBhHTmXipTLz1pbsrmhlWnYLh167iG21VWdKzL2B8Ri
 CSkt1v0JHPD9yTgrvb0NYJECtieja3U5senEygtFfMeHAqKTGIlgy1EJvLIEVo2LkTRd671cKk6
 0kLX0wBGBIC+pcs9k7yZKgpNutdlx2HmmMwgYPQxUi9Q6V0I5PDSChLCL5rd9ZYSH
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr24588767wry.347.1637191464774; 
 Wed, 17 Nov 2021 15:24:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFVcrsPyAej2ITGpjiexQM7mCi+UJIF8sfXxlVHbSkCyS7zN6kSqYB0+h7C6G8rsCIKa2Www==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr24588714wry.347.1637191464412; 
 Wed, 17 Nov 2021 15:24:24 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o12sm2020800wrc.85.2021.11.17.15.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 15:24:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 0/2] hw/block/fdc: Fix CVE-2021-20196
Date: Thu, 18 Nov 2021 00:24:20 +0100
Message-Id: <20211117232422.1026411-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not sure what happened to v1 from Prasad, so since we are=0D
at rc2 I took a simpler approach to fix this CVE: create an=0D
empty drive to satisfy the BlockBackend API calls.=0D
=0D
Added Alexander's reproducer along.=0D
=0D
v1: https://lore.kernel.org/qemu-devel/20210123100345.642933-1-ppandit@redh=
at.com/=0D
=0D
Alexander Bulekov (1):=0D
  tests/qtest/fdc-test: Add a regression test for CVE-2021-20196=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196=0D
=0D
 hw/block/fdc.c         | 14 +++++++++++++-=0D
 tests/qtest/fdc-test.c | 21 +++++++++++++++++++++=0D
 2 files changed, 34 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



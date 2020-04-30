Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A61BF0A7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 08:59:07 +0200 (CEST)
Received: from localhost ([::1]:50552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU39x-0005MG-7E
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 02:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jU38f-0004AR-Bh
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 02:57:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jU38Q-0001io-9F
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 02:57:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jU38P-0001hz-T5; Thu, 30 Apr 2020 02:57:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j1so5473727wrt.1;
 Wed, 29 Apr 2020 23:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LaSdrAkBG0kVYcsb3RA4ZEguAQ8Z2HOK4kH0N45UkDM=;
 b=J7XjjlrQPWS5XWEDmc3z0mg6QiYpttaR8qARm+LzSxSswQLhlOqzSoXEyzf2P7BvGj
 AKUn6lbARJ/WaPCohw52gIadELia0NsGTH/2SEy5n83OvX2NDZLjHgxHwV5C6Gg34430
 aIlTwBqTsGtYTH4YN4ZqOfVPPQdVzXgkgZj4Eo1L1Ox8wuTINpLwOtJr2+Hcvab+BYZH
 tq5aIpQ/Yd5xpKVW6C1AFHQv+yeFvOSm+gAETHjhpvqg2ZcXpy5YoBdvZEXDM+Gfp2CJ
 GDpHef00SXTVhfc7Q/LGY9ntCQm2tpFUCirbkyPny3EqeYRB2ChL2bTD0r5rBP/SEPwj
 UfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LaSdrAkBG0kVYcsb3RA4ZEguAQ8Z2HOK4kH0N45UkDM=;
 b=LmwvCs6IENeqdjl2fOiK6UZuz1jb4QoDFkHPK/q8kYPciV6Pg/yY/Xjfh4mn1bsCxE
 sWWEsYm0df/ChvnybqXXzl3/Hwh30yz6vk4WdXvQo+NMEJKKKSNIAezB/WEmaqqj/LDX
 GX58xV1ireM/eNuKJ/b3XbyqayYsNV9kYogxIvWIZDBlq4Od60GTH28XXAl4ZRjSxBfI
 MgjnWzbM+KLCPqGekK8TCQ0KSRfjzEWPGmUo1iYUHE6Wrw664reRV17PJm2BGT+4yakp
 WTA2z5XRvLgKYf7pXqiBmTqfkCfQ6LB17rLsvUsMMRtmtlbDQefMMzS7I/lWg0KzW8f3
 LgRA==
X-Gm-Message-State: AGi0PuaJiKKfnWnK2u5uApW2KsfqpsB9BRAB1CdCCDIzDDGq7oXYcxYt
 oAg/GPzc1SPaVzPko1DZriDSjebZde8=
X-Google-Smtp-Source: APiQypLpEkW8He0GVeYeYJ49LhfBaa0E4uv/Un0z1vn8Ph/pvWkRzNZdwTbMVUrIAmBUs2tWs6vjeQ==
X-Received: by 2002:a5d:420a:: with SMTP id n10mr2009230wrq.235.1588229843372; 
 Wed, 29 Apr 2020 23:57:23 -0700 (PDT)
Received: from localhost.localdomain (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id k184sm11139730wmf.9.2020.04.29.23.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 23:57:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] scripts: More Python fixes
Date: Thu, 30 Apr 2020 08:57:17 +0200
Message-Id: <20200430065720.10763-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::42e
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial Python3 fixes, again...

Since v1:
- Added Alex Bennée A-b tags
- Addressed John Snow review comments
  - Use /usr/bin/env
  - Do not modify os.path (dropped last patch)

Philippe Mathieu-Daudé (3):
  MAINTAINERS: Cover the GDB Python scripts in the gdbstub section
  scripts/qemugdb: Remove shebang header
  scripts/qmp: Use Python 3 interpreter

 MAINTAINERS                  | 1 +
 scripts/qemugdb/__init__.py  | 3 +--
 scripts/qemugdb/aio.py       | 3 +--
 scripts/qemugdb/coroutine.py | 3 +--
 scripts/qemugdb/mtree.py     | 4 +---
 scripts/qemugdb/tcg.py       | 1 -
 scripts/qmp/qom-get          | 2 +-
 scripts/qmp/qom-list         | 2 +-
 scripts/qmp/qom-set          | 2 +-
 scripts/qmp/qom-tree         | 2 +-
 10 files changed, 9 insertions(+), 14 deletions(-)

-- 
2.21.1



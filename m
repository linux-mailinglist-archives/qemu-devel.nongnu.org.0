Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DB81A0C30
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 12:42:53 +0200 (CEST)
Received: from localhost ([::1]:44918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLlgy-0003QS-Ck
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 06:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLle9-00076V-CE
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:39:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLle8-0003vS-5i
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:39:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42536
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLle8-0003ud-20
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586255994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFAV8BWw7vUpDiip7PjHHx3idMX+P2HOVfCLWi/V21w=;
 b=LkGVxEHaFcKOlKSektxXYwBP3z6SNTD9BDFVojqpPU30aXwNt4vGglDBXPszlksnTkVO9c
 WmSga549d5wjFiV/5E3KQJCFw1UZl12AcGa+X+snkTyz5JyHmU6UQb48um6u4I/+jU+vl3
 kmn5nF4sOeaMw7r1U1UpV1GS/V5nLkY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-VgXym7AaPIyvg41ildP4xQ-1; Tue, 07 Apr 2020 06:39:52 -0400
X-MC-Unique: VgXym7AaPIyvg41ildP4xQ-1
Received: by mail-wm1-f69.google.com with SMTP id f8so424593wmh.4
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 03:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85bgvfAvchsqkW8ko6hk+W6U/5ywoj9z028mmfe5LFY=;
 b=qAHseHot7xe7UlHSUT4pZbWQ9xU7vi5+SxjOP9OUOOHTVFvs/YEBR5B6sSuFjk1Y2z
 p0We9jLRK5Vc0aGnHaj+3Dev68B36d4KGh/10GuGzN+OH59pjoDvauLMW2Q7+lzZ6qCp
 kml5sIMCRnT9cytHZ97iMttZrK5Zm2iXdNUn3r01EJMJuFkuIDzFZpNWRNe/TprJ4gVN
 hMM+76JpGP7rcVwGnHclszooi9jSUwcWwCiYymrsjj86Vq4LXqgLVLMOeGkRZbObBc5v
 +4heceV4PNWHpSdG23q2EgS27FzBTubqTryAj/yaxJBhtcVwexTGS9g/JPuvZ+eUpe/b
 7Kjg==
X-Gm-Message-State: AGi0Pub431rlWvTQcIJ24HcYpNzBaRyNGPQPw9ItQWsBUh1KX/oVnSTQ
 2uGfJhIP3Ikyp7dsHKMaBxlF+EVAH2O7qUU+Il/T7l5pEHS8ds9GcQcRYCMtw1zG7b0uV28PFed
 s/dyh8/rI5P9FgVw=
X-Received: by 2002:a5d:684c:: with SMTP id o12mr2245354wrw.0.1586255990844;
 Tue, 07 Apr 2020 03:39:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypKT3n/0EU6l2K/8+jJDGnQ/WpM11VjP1eq+KA87B6e50kBma3fC0xhUiB9McUDjOT6cokNbng==
X-Received: by 2002:a5d:684c:: with SMTP id o12mr2245336wrw.0.1586255990642;
 Tue, 07 Apr 2020 03:39:50 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o9sm25512071wru.29.2020.04.07.03.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 03:39:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] .travis.yml: Cache acceptance-test assets
Date: Tue,  7 Apr 2020 12:39:20 +0200
Message-Id: <20200407103920.32558-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200407103920.32558-1-philmd@redhat.com>
References: <20200407103920.32558-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep all acceptance-test assets in the same cache bucket.

As of v5.0.0-rc1, the cache is 2610.11MB:
https://travis-ci.org/github/philmd/qemu/jobs/670558103

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Message-Id: <20200403172919.24621-6-philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .travis.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index e0c72210b7..2fd63eceaa 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -318,8 +318,10 @@ jobs:
       env:
         - CONFIG=3D"--enable-tools --target-list=3Daarch64-softmmu,alpha-s=
oftmmu,arm-softmmu,m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-so=
ftmmu,nios2-softmmu,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sp=
arc-softmmu,x86_64-softmmu,xtensa-softmmu"
         - TEST_CMD=3D"make check-acceptance"
+        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-acceptance"
       after_script:
         - python3 -c 'import json; r =3D json.load(open("tests/results/lat=
est/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"=
] not in ("PASS", "SKIP")]' | xargs cat
+        - du -chs $HOME/avocado/data/cache
       addons:
         apt:
           packages:
--=20
2.21.1



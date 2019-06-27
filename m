Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEE0581FB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 13:58:27 +0200 (CEST)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgT2o-0003Un-Pg
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 07:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38713)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hgSyB-0007DL-Hw
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 07:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hgSyA-00015Y-Mx
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 07:53:39 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38517)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hgSyA-00014m-Gg
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 07:53:38 -0400
Received: by mail-wm1-x344.google.com with SMTP id s15so5366147wmj.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jun 2019 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfeZ0NRWEk9Ba+NadtgQ2gsE2MLqYIKeLmXUh3zbtbo=;
 b=pWvDobaoiSnuTFnhGXSrin8fIlVn8pMMSuNoD11Imjx9RJ2MLKgTWXX0hAn61eP0Ey
 1HYXE5NfscwkW3u1X40Ku/5RZXamNxtVGAaIzjbdwjOEE2IKO3YEFNBw8bzBTMLrfVVH
 hNCUsmKIuMw/BG3y6PW5MYFrHiDq3wHJ8vbeJZwnGACT/OySpCnVm8NnpbscECZOooRt
 IOhk6NqnP6vqdJrRxn6vZgSSdiBZj9aYOrpqoRj1eDmR4lFWh1hCaOs+oiFtyCT6lTmn
 WSIdQL7wmvoXTnjyhyojJ5eXD2g68+hBrXCao4AkJ48JJOvT8+weB1E0xPluXdFAXgLz
 5Y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KfeZ0NRWEk9Ba+NadtgQ2gsE2MLqYIKeLmXUh3zbtbo=;
 b=eDmn7v6I+/zZSoNmXfMCAr7vrwKgIds83xR2kNJEVjcIMqm7SDPnBHvIK+vEAEvOEz
 Dl+ZyoaNF04/Ta0g8UwR7HYX9ShQdCoEHIRM35QJhMaFvHfsGnAcs+aWiCF8S5aN1/aJ
 b63Ml928WAmXXJAU0I6FHz864EPk091Xh+3UKd3IEq8aZs8MRkgI4eOxA/3kGYGGDH5E
 DLPzDeFTtqD8I90ppkM4Z5j3b4Hz5FdU15hdVyTq+/BOwMsQSmWDGxVCjnjNEAekBB9d
 /sSB8L6Os20BDvkLbyvOW/2Hmx32Py2AKB8alcQCpwe8kmisvXDB0LsoCas98Ecr8LZU
 S4Nw==
X-Gm-Message-State: APjAAAVhQjPnQXQN7ojDWBifTB31wKbOQnjITUHCWV+7Kox59sOXxCTO
 /6UUsoJmkPXemiN6bp1r1WvsHCHA
X-Google-Smtp-Source: APXvYqw8PoPTajvBUziWalPt2OiewrVjbL/psLcBvdi+9zmsGp5p0YY172aeAcAH7AdNBqw6WpPv4Q==
X-Received: by 2002:a7b:c251:: with SMTP id b17mr3110051wmj.143.1561636417416; 
 Thu, 27 Jun 2019 04:53:37 -0700 (PDT)
Received: from x1.local (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id o126sm6196408wmo.1.2019.06.27.04.53.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 04:53:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Date: Thu, 27 Jun 2019 13:53:31 +0200
Message-Id: <20190627115331.2373-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190627115331.2373-1-f4bug@amsat.org>
References: <20190627115331.2373-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH 3/3] .travis.yml: Let the avocado job run the
 Leon3 test
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
If this list continues to grow we can
- split it (as other jobs)
- move them to GitLab where we can have multi-stage jobs,
  avocado tests run on top of build jobs.
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index aeb9b211cd..37708b3438 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -231,7 +231,7 @@ matrix:
 
     # Acceptance (Functional) tests
     - env:
-        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu"
+        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,sparc-softmmu"
         - TEST_CMD="make check-acceptance"
       after_failure:
         - cat tests/results/latest/job.log
-- 
2.19.1



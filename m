Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85652148C96
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 17:57:32 +0100 (CET)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv2Gx-0005FL-Gu
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 11:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1iv2Fu-0003d0-16
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 11:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1iv2Ft-0002y6-4i
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 11:56:25 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34163)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1iv2Fs-0002ws-Vz
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 11:56:25 -0500
Received: by mail-pj1-x1033.google.com with SMTP id f2so740623pjq.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 08:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RIEQhZ5WEe7hDe6XHzbT9XXua29+aUUP5Ja/7DtAgr0=;
 b=vUEEWhQBNCKS171eNvRz/83KqU1NbzdbhzdeWwM2r4jkPu7kAWWMonbXAH1J73bZTX
 DSN2EXhyAEH4CngzqFGd03EH/c1oKTAofkSnyQQqsmwjsitAi+aneegyNvciBBpdJF4x
 mjdV0Oge04M9UKvUjPS7HjI2d15/XXF09TJzgkmfB/cMfBbn/IVV1+/oMZ5PFA7gAl3N
 Z/7u31UMrXEL67V/lKRH+2mbbVfJkkQIh0XEno96TmkaBzuQqkhD23lXYKRHzsAnugoi
 NgWgdFeNFhWiRtHRB+BCaz9cTDLE542dT/dydxxhmxOk6OSe+XoaMYBqT+zEXws0A9iL
 U+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RIEQhZ5WEe7hDe6XHzbT9XXua29+aUUP5Ja/7DtAgr0=;
 b=GwOjooaelHVdwuqVYeBuu6OqEJBspKDApqYwXw4YoVEkvCdF/eFOnAstaUlyUxEqDm
 xbj6eC2ji6nvILM+kfMAp4C8gD78vngBWE4cqywyNlNwDu0SGZrmLjHo1IVzkKxFoLJR
 qDNSaIjpwgBWcYawDnsEezj/ARkUlaZ83oydQujYkNwMV+wcrnSzKeA6AYvK6XA/13Dk
 QLC/0DVPEWBRZmNUKez6ceQNbOcwuOjpR4ZPlm+F0u+aVVa3HrriYivlCpZmHU2dQWos
 vJ7M4lWhAtswUG7nVyXXTQzJivKhFf9tfJFdqZ4jyBP4+9LxsCTEbzPk+zWOzHoKh2mR
 /J5A==
X-Gm-Message-State: APjAAAU8ZSzerjJwmejVgM28wCA0rFY/vrceLsGaYULxE7Gt8N44Cifp
 J6HsCaL3C5Ga2bIqbXwl1R/nmMV6yMQ=
X-Google-Smtp-Source: APXvYqzaQ8OfGf7XsfO7LUcxwRuVj2VyJIeEiLtL0z5IabDBVRIbXEJfgZBLaRDB0qfq9yMzziv3DQ==
X-Received: by 2002:a17:90a:d205:: with SMTP id o5mr204259pju.46.1579884983677; 
 Fri, 24 Jan 2020 08:56:23 -0800 (PST)
Received: from Rfoley-MA01.usrd.futurewei.com ([12.111.81.71])
 by smtp.gmail.com with ESMTPSA id l10sm6969953pjy.5.2020.01.24.08.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 08:56:23 -0800 (PST)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] tests/vm: increased max timeout for vm boot.
Date: Fri, 24 Jan 2020 11:53:29 -0500
Message-Id: <20200124165335.422-3-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124165335.422-1-robert.foley@linaro.org>
References: <20200124165335.422-1-robert.foley@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1033
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
Cc: fam@euphon.net, philmd@redhat.com, alex.bennee@linaro.org,
 robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add change to increase timeout waiting for VM to boot.
Needed for some emulation cases where it can take longer
than 5 minutes to boot.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Peter Puhov <peter.puhov@linaro.org>
---
 tests/vm/basevm.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 991115e44b..86908f58ec 100755
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -310,7 +310,7 @@ class BaseVM(object):
     def print_step(self, text):
         sys.stderr.write("### %s ...\n" % text)
 
-    def wait_ssh(self, seconds=300):
+    def wait_ssh(self, seconds=600):
         starttime = datetime.datetime.now()
         endtime = starttime + datetime.timedelta(seconds=seconds)
         guest_up = False
-- 
2.17.1



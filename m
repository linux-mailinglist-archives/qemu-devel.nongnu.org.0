Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12AE313F04
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:32:30 +0100 (CET)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CGr-0001R0-On
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kh-0003Cb-FT
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kD-00057C-V8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuEfVjlDp2IXn4e5RcstBTTMJAdpKbTbi45GMwk+iCc=;
 b=ivuFw03YItffiaHwyDDtzGxf5wJT25uw0LfEJxYgxicRfCdGIvrihn6A0yLaqtEGok3H1U
 LhinqevKbQi7RA1NK8gT1ERRDZSKBbCGC0O0jicYyo+4ry5ivDCWzq6z4n75X1mgO/oeQo
 pMn+5bq5KTgIX0oHv0fmb5RezySDtX4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-j_DhTzTuMtm1duQdJOcVEA-1; Mon, 08 Feb 2021 08:38:20 -0500
X-MC-Unique: j_DhTzTuMtm1duQdJOcVEA-1
Received: by mail-wm1-f72.google.com with SMTP id z67so8674636wme.3
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tuEfVjlDp2IXn4e5RcstBTTMJAdpKbTbi45GMwk+iCc=;
 b=OBcwMCUT9GvcLmY8DT0P7TkMnihNeia313FJR2uY53FpS++YGonRS/0VkRE8TadeKE
 qjg2nzGy14CvAzkHlzUQ8ysVp42gKF9DYT4nA2hjQJAK5Xd+bH1OIK4isTvqcWKJvcgo
 0XvFPld4hJKTvA3yhREwnEbhzKCjX8vqQiUCUcWYe5NoeGCmPdh4G2l9LAYLKX98cCOJ
 a7JwNsPY/nJ/ZDd3TJ1tE87/XEInbFbR44AWakdqCnPXz9uyh+UXSRliLEjYF1A0ZJXR
 HnQgSR3BTYdQQzvCBLZBToWttjPYwg9a2c/Iub2imEUMZTtmRCM/cEDSNOsUZlntb/OQ
 beVw==
X-Gm-Message-State: AOAM530ckSplNgIYsOm7JrG7r2fUtvb+rmFgVRs5oqNgbon1mrwBL5fe
 rf6bZcQRwdDXKXTiRr7Zx1Lc4ZPZKjaBOqm28JnC7l6MLLJP33sccmzi/f0C5P8ThOan/Es7lrB
 sUlUSIQUo7WxM1F4sdFPJi1sMEBWYwEm9Wt6QPI1ot2qqtUUzp1m5ECYEtlJIw/30
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr14774971wml.164.1612791498087; 
 Mon, 08 Feb 2021 05:38:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyprMe36auS5d51lc0SNSurbhj+3RjMGg9xVmPRSsZcQLj3ZnmCD97gPd9HIJvP/kNYRpVn7g==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr14774948wml.164.1612791497854; 
 Mon, 08 Feb 2021 05:38:17 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s6sm21020366wmh.2.2021.02.08.05.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] tests/acceptance/virtiofs_submounts: use workdir property
Date: Mon,  8 Feb 2021 14:37:05 +0100
Message-Id: <20210208133711.2596075-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

For Avocado Instrumented based tests, it's a better idea to just use
the property.  The environment variable is a fall back for tests not
written using that Python API.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reference: https://avocado-framework.readthedocs.io/en/84.0/api/test/avocado.html#avocado.Test.workdir
Message-Id: <20210203172357.1422425-5-crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/virtiofs_submounts.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 361e5990b65..68d3cd68696 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -136,8 +136,7 @@ def run(self, args, ignore_error=False):
         return (stdout, stderr, ret)
 
     def set_up_shared_dir(self):
-        atwd = os.getenv('AVOCADO_TEST_WORKDIR')
-        self.shared_dir = os.path.join(atwd, 'virtiofs-shared')
+        self.shared_dir = os.path.join(self.workdir, 'virtiofs-shared')
 
         os.mkdir(self.shared_dir)
 
@@ -234,8 +233,7 @@ def setUp(self):
 
         self.seed = self.params.get('seed')
 
-        atwd = os.getenv('AVOCADO_TEST_WORKDIR')
-        self.ssh_key = os.path.join(atwd, 'id_ed25519')
+        self.ssh_key = os.path.join(self.workdir, 'id_ed25519')
 
         self.run(('ssh-keygen', '-t', 'ed25519', '-f', self.ssh_key))
 
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E22B313F1D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:36:20 +0100 (CET)
Received: from localhost ([::1]:39738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CKZ-0004ng-J8
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kg-0003CW-Mh
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kJ-000582-Ek
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXPzzUSyI/Ecbth+g0JqoFwcUOJqhlalFuyB188Gi3I=;
 b=SfuiNztRn3QtXJ6RsjQUBWuLAVrEKGRM6TcbeZgBtYXjCwO2IlBd7TUTNK21N65aj6Qdvu
 8L5ITwBO9vYC3/jycY8CUTNkiO0FUa1d0Mj3EeXfimNx3egQImIM1dAshDbif181DNZiHX
 HEkdpx/BSgAGZERGPYwmFp4PC+vBUss=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-mI0FY1apMymTpnRbTFSq6Q-1; Mon, 08 Feb 2021 08:38:25 -0500
X-MC-Unique: mI0FY1apMymTpnRbTFSq6Q-1
Received: by mail-wr1-f72.google.com with SMTP id x1so6417166wrg.22
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RXPzzUSyI/Ecbth+g0JqoFwcUOJqhlalFuyB188Gi3I=;
 b=ISroLM3hk1LvubwISC7EUOFa+c0IfaVA8g5PeJNhX97+zXoAs03QvJeNhYtvE8JMyU
 eYd4D6UNsfL9LoiYG9Ua+m2BlfaaxuhuLYOat2Vq4fVNq3rp/4L1Ue3DBCxp5XOX0N52
 EoAMedHASkdsbwvhYnaljRWgUExtO8v72TXdiHgLOWasSmi/UlZ6scrjhoqfW1RUwv8s
 feYTT+xOiDBA+BcEnb8uXaXLyepRmJNywjY6XF+mP3xzi6AJ0aoVIimnDd/eyaB+6HGd
 ky5ggDPZXzeoYZ0aCTrMWJfFZrBdXAx3MjeD0ybMWCm/tyUqxjMH3wgE9L+ZIdkSbid9
 JuwA==
X-Gm-Message-State: AOAM530HU+KN1B8SH5ATbkIt1LyreY8pGWxGza+QFYsCYEVOTV7fHyGY
 6JwV0S6muZMQMVUhO1A0/KPdQaQ0O/daqSurkGFuPLkjYTg+bNYjAk+7MFk9w54cawlXRahMItD
 N1Edv++hfmhFfjev/9XVcpAM7Sbu44GMXoNlskVskASH7u4auu8e7vYXMm8dyLurO
X-Received: by 2002:adf:a501:: with SMTP id i1mr6946641wrb.149.1612791503180; 
 Mon, 08 Feb 2021 05:38:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUHLncLt1yYt0iSWMYbk7Dar0iIlJxeRzdVGcHt3VBy3PjmTK2OzYbf4T3s5XSS3lZxbpiVQ==
X-Received: by 2002:adf:a501:: with SMTP id i1mr6946620wrb.149.1612791502910; 
 Mon, 08 Feb 2021 05:38:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q15sm1397945wrr.58.2021.02.08.05.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/18] tests/acceptance/virtiofs_submounts: do not ask for ssh
 key password
Date: Mon,  8 Feb 2021 14:37:06 +0100
Message-Id: <20210208133711.2596075-14-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Tests are supposed to be non-interactive, and ssh-keygen is asking for
a passphrase when creating a key.  Let's set an empty passphrase to
avoid the prompt.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210203172357.1422425-6-crosa@redhat.com>
[PMD: Reword description per Alex Bennée comment]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/virtiofs_submounts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 68d3cd68696..3b5a242385d 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -235,7 +235,7 @@ def setUp(self):
 
         self.ssh_key = os.path.join(self.workdir, 'id_ed25519')
 
-        self.run(('ssh-keygen', '-t', 'ed25519', '-f', self.ssh_key))
+        self.run(('ssh-keygen', '-N', '', '-t', 'ed25519', '-f', self.ssh_key))
 
         pubkey = open(self.ssh_key + '.pub').read()
 
-- 
2.26.2



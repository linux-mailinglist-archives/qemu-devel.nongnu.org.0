Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BD2EC4E1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:28:33 +0100 (CET)
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxFQ0-0001kh-2y
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNx-0008Sa-Hp
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:25 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNv-0005TD-Ph
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id q75so3711189wme.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cPqsftr+DIt7BqRImmpdlyWvNspWZdDTEDxYpNYOCtU=;
 b=kgpZFs8PEi6fVoYAzP8YQHrQcp6bEod88/E4iPNks8N/ky2O9UalTeUQzvvAiIpgqB
 RSQoOC2ETdXc0pnlvyMR5VrVxdWZUNJ5kDuXfa8A6tlK/w+7zg+t8mblrp5zD5tGWLqM
 acnt/pNptggCdKfOsZfV5WSviTHvfNweMhaZpoeWpgAK7jTN2iZHdG5Fqh1l/r/W+Y+t
 IA6LCO+Bj4czmtrkf12cC3h0cUe89osY10SGXIW/R5VthjajWRYmLEnrKzHNZl9a82Ji
 vUMedzkknatb9iLDk5s8dpcli6c3lptZMwFmPxjNDZ8ddOMKRpf/fj8A3QWdNngn2m/x
 Jnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cPqsftr+DIt7BqRImmpdlyWvNspWZdDTEDxYpNYOCtU=;
 b=LXrqQcU7FheqqIgFeXtGIytAM5ZINvYN/I4XacYuU8uen4a6Mm6Dlk/rYAO0eJZLWh
 fH9nVJPXbv7+AVm8nb5Qcrh2xqGT/o6KI8ETS2WEbKqO1H862i8KuYiGZdbYyZFaoTRJ
 YEDjd9reQKFNf0sRYdBPIsic8OwuDP8mYpae+dTTXzMT19zhTHkmOcus+vl5DuFbLJ69
 Yy9zoWxfYVAURXGJl6sRWnqfME0TcAyJE+CasP6ISQbNDm0HPvF7l0h44brIR/wp++Ie
 UH+U0jI+D9IF2dZXqFnULiM753DmIctzi3Yg6mu1a8aQH+a/HPKGK/S45NfA/2AkH9ip
 atdQ==
X-Gm-Message-State: AOAM5322pvYfRM07rYUimQy0l+BEumDsipUahNbh3wqRb9G6/m+OtGNE
 lNb8JnB4dORZUkIjAH0H3x66CA==
X-Google-Smtp-Source: ABdhPJySl0ixby8k2FnuS+D0itEhnB6IzkS2VIkYfajWhf6OtMtCwqhSvOlxBu9lLG3QIgZyqi+F1A==
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr5130349wmi.23.1609964782335; 
 Wed, 06 Jan 2021 12:26:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z22sm4229465wml.1.2021.01.06.12.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 12:26:18 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A520C1FF8F;
 Wed,  6 Jan 2021 20:26:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v4 3/4] tests/acceptance: bound the size of readline in
 s390_ccw_virtio
Date: Wed,  6 Jan 2021 20:26:15 +0000
Message-Id: <20210106202616.20004-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106202616.20004-1-alex.bennee@linaro.org>
References: <20210106202616.20004-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The read binary data as text via a PPM export of the frame buffer
seems a bit sketchy and it did blow up in the real world when the
assertion failed:

  https://gitlab.com/qemu-project/qemu/-/jobs/943183183

However short of cleaning up the test to be more binary focused at
least limit the attempt to dump the whole file as hexified zeros in
the logs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210105124405.15424-1-alex.bennee@linaro.org>

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 0f81af9950..eccf26b262 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -241,7 +241,7 @@ class S390CCWVirtioMachine(Test):
             self.assertEqual(line, b"1024 768\n")
             line = ppmfile.readline()
             self.assertEqual(line, b"255\n")
-            line = ppmfile.readline()
+            line = ppmfile.readline(256)
             self.assertEqual(line, b"The quick fox jumps over a lazy dog\n")
 
         # Hot-plug a virtio-crypto device and see whether it gets accepted
-- 
2.20.1



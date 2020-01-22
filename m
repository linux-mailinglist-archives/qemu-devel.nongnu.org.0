Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD5144A16
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 03:55:43 +0100 (CET)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu6BB-0003sT-PC
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 21:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iu662-00066P-KT
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iu661-0002td-4q
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:22 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39350)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iu660-0002tJ-VD
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:21 -0500
Received: by mail-pf1-x434.google.com with SMTP id q10so2560027pfs.6
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 18:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObBk+vUxn+dSJ2XFF+LrNKyy5bCa/sEjKehWCWAOBzw=;
 b=aj75Md6rAzLnCZchpKeM666PFo6NCY8tM9z+noe+9Tcs63e7UI7iySWnNGMuQNRV7l
 aAq+hH1Low3shxENTUMMVrBTPdi1frZOIB7tFAGFpxqb+uueIElzfOiJ1KOPY72Gf9w6
 rFu3VQutgS06xK13XYhW7+fjYq9pB+nTvBM/wlkr94fIWggu8GMNk9kUoP6p9NX4glbn
 BFXHOkog2PVKuTqCKMPAwuExoCSkJH3Gsgs4jv8IERasoMkUchOc3GWeJ2UoYrEsMMtJ
 Wc8zompLvmBV997lr6ka+lJAfOLIJ0ZobeXhCALx7H8FD8zQYND0navtDNDj0D+uAtBz
 fazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObBk+vUxn+dSJ2XFF+LrNKyy5bCa/sEjKehWCWAOBzw=;
 b=oEPmACsecG3iUplOeGC1nRoeeOghprSGVc9UWJBGxFHCajoZ6bEJbP0D/P36r7G4hs
 2emCOMnG7HLeOWtMvPfuiEPFadeBWi+VmEDcND7qM16sjcw9XMi0W5HKVnrKf8M6Pf2q
 4N6npPu5QjI6Xrc+aQNcTIfvN45AZTrkopyTrcvb2FkyC/JEZxPTKTrRnD0iTGXExVVt
 gbVDgVyO3qSUrFR4OGQpDD846p/Dgit5VzxlLXKXH/K5LAx+z9E4rqSnA1aQFXCAG4Z7
 UfMlURxNqxAH9OtsrWSrVhhwOcBQM98l/6UG0OUtc3A7feUzUpZURraLhOEvEyjHOwNI
 2uRg==
X-Gm-Message-State: APjAAAWRQcZr2an9yN3b/EyjVuGjmeAwjDrdxzP0/q7XHBvuCgE3uiDR
 bQchI6+th+pDDvQ2aeAdEiUidG2bVCo=
X-Google-Smtp-Source: APXvYqzERdfM3fEqyxF8f0AObtrSpYxs8BMSs02G+vHKOKQDmzizvQc7rGox7VHQ9/ERK8pmTmePZA==
X-Received: by 2002:a63:454a:: with SMTP id u10mr9061801pgk.248.1579661419640; 
 Tue, 21 Jan 2020 18:50:19 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id c22sm44149883pfo.50.2020.01.21.18.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:50:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/16] scripts/git.orderfile: Display decodetree before C source
Date: Tue, 21 Jan 2020 16:49:46 -1000
Message-Id: <20200122024946.28484-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122024946.28484-1-richard.henderson@linaro.org>
References: <20200122024946.28484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::434
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

To avoid scrolling each instruction when reviewing tcg
helpers written for the decodetree script, display the
.decode files (similar to header declarations) before
the C source (implementation of previous declarations).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20191230082856.30556-1-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/git.orderfile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index e89790941c..1f747b583a 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -25,5 +25,8 @@ qga/*.json
 # headers
 *.h
 
+# decoding tree specification
+*.decode
+
 # code
 *.c
-- 
2.20.1



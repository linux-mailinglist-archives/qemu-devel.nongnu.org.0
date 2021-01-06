Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F32EC4E0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:28:31 +0100 (CET)
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxFPy-0001gP-UO
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNw-0008R8-IP
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:24 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNu-0005Sz-J8
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:24 -0500
Received: by mail-wm1-x331.google.com with SMTP id c133so3420284wme.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 12:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GqQRbYIy33Jj7mt/GCE7WGACa/d8Oc7GET2pNDueGUo=;
 b=i4KgSS6xPQPfAIDLv/FbR5+fPwWRBxfffEA149wmXFki+LS9vO6Y2j0NQAFZieHZOO
 1bN6seQuT0XVpyYgOOvq9Y+QC1quw4604ZvCcDNyxIKAh+YwFkvA6MQ7Cccu45ufwaPl
 0hWt5GV7pOHV+wBKbk98CEh2bh4jvMhkwMeCiPhN30LZokR7REhef5dWGZlGl8r+GJNM
 uC8sJFXkm0C7m2hG3Ae2zOC24ZkjyzRwsxtZdERnE+QJLloFN9cl++LyXsNN97HiQGvh
 PHYrcWyQCB05XWDLK/6xBvf9M3Db35OWvaYajJprq569jCYa59ZQQF3dToN4C7mfbY8i
 APRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GqQRbYIy33Jj7mt/GCE7WGACa/d8Oc7GET2pNDueGUo=;
 b=DXglwi4exHEKHQ97WicvSb2lZSgJcIP9TGOAkCiWtnqzPavC1b8pFN6SprECmX+w0K
 bnU3cRGpPFHNC5g4ZuL7z5PaNifJcb+9605p84jBPq7SuCQzEmQxG/GNgZo6bgE38KYT
 W/XXBO/PLZgAZKqsHTn4nWZzlG29tzIgGdDMETKgdgU6SLcvRHbRyOxBOSrwFhWJ/klq
 oEgTeGkX4U3ASDQaX/Rv/Fkc61Ri1Fl1YoiFWDBhyDUPmFFXTAnpmBPBltH726CqtyTV
 WJJVRR4TKU6SW72UhHNatqo3X6rOpT8Kpzl0NUklR92hZ2NIIbbuwofLIw7buU8l3MEk
 a+8Q==
X-Gm-Message-State: AOAM531xSvoYOzZIbzLHGHurbUwoavEGOfBQFcsOFnhrho8qjghGCLwL
 3zvnHjeqxKYjStOzKKWLUhmSTA==
X-Google-Smtp-Source: ABdhPJzRj6R0zJxN+N2RM52kIx1uQr6h5+1KlM2ZjJbNjqjaSMFtHW+F8FnYlaHFB5vxT9kvXl6zHw==
X-Received: by 2002:a05:600c:274d:: with SMTP id
 13mr5209435wmw.77.1609964781191; 
 Wed, 06 Jan 2021 12:26:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q143sm4340539wme.28.2021.01.06.12.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 12:26:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9083A1FF8C;
 Wed,  6 Jan 2021 20:26:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v4 2/4] tests/iotests: drop test 312 from auto group
Date: Wed,  6 Jan 2021 20:26:14 +0000
Message-Id: <20210106202616.20004-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106202616.20004-1-alex.bennee@linaro.org>
References: <20210106202616.20004-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "auto" documentation states:

  That means they should run with every QEMU binary (also non-x86)

which is not the case as the check-system-fedora build which only
includes a rag tag group of rare and deprecated targets doesn't
support the virtio device required.

Fixes: ef9bba1484b ("quorum: Implement bdrv_co_block_status()")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210105100402.12350-1-alex.bennee@linaro.org>

diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index e4fb6327ae..bc5bc324fe 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -318,4 +318,4 @@
 307 rw quick export
 308 rw
 309 rw auto quick
-312 rw auto quick
+312 rw quick
-- 
2.20.1



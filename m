Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8293302D2
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 17:00:06 +0100 (CET)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIvp7-0001jY-QG
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 11:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lIvmh-0007Sb-6M
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 10:57:35 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lIvmf-00056O-47
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 10:57:34 -0500
Received: by mail-oi1-x243.google.com with SMTP id d20so8350403oiw.10
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WZ0WodKI83AjaJZfoKvN2o6wyqaUJvCDkdSFGpgrdp0=;
 b=omHHaNmsDc3mQcQmu/N1dN0Uiw0eabnKiHaQ3PZGDgyhxnIQ4fauYjMAxBaDSwGCUO
 7FYAlqiak0w+ZnvOg/zm2kumBMz2dFYBXF4SP0lBPJilAqva+ZjEWqWSSHBWk81b1lyy
 XrrydRzhDXJI8tikaxzMlm/X5S6wOysSf5i1OgA4bwo3Jwkalun4UBITUXq8llt4Q6S3
 kbGv2BIw/HSriTnCpfW9S8+OzI9/Sjg2BjjD+2DmlG9ApjYZ9yYYt0m2ygXSUqSgYfyh
 fYmh5JZKgBA2+Yt9cy+VhibEVKUU8q7720648v64tSNC+AFn/fy8s17gg7mBnEYkDYYO
 seag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WZ0WodKI83AjaJZfoKvN2o6wyqaUJvCDkdSFGpgrdp0=;
 b=aBvIzoDog/NxgIbaq1gGRidQHBtfnLyJDR3ArhUK17iPzyGNzWuhE/i4YQC2uDa5b1
 dFkiGHughqrWtZTWQ1pCF95zsEonAoec3iO8SCw+CDar+fWcslTskMK0OtJ1OzLP3c/p
 37ua7kXozU9LePQhL1h+WEUqy+EPtL+7gbfcRLPml7/L82CyLWc1WEFBQNcn3OPNAZTz
 /klAuoS37KWsm1ACATw4Glje5lhiMWZRnGk+cZsjPTS4wH+q55KvXisMIhk6am28h+PV
 XsQpwwpOxRwSg7s788VjEF8S0Ti0NcTvQR0Ewq6+on2kToss/4dcCTE1GI0hxFxdCxRB
 s4lg==
X-Gm-Message-State: AOAM532uvhRV04myvttM0dvm2q+HaZd4IpjIPR3g6SE3fi3Kjr20BQXn
 4899XJZHX/8LmfqIXeKFMKRzZNs0ac/iyClK
X-Google-Smtp-Source: ABdhPJyU+14CVT0Tc/5HYkYrr9qDjS4SCPJZzMSc8TRluNUiIDBkNP0QKEqdhwLmCH8mWwsHrjiiTw==
X-Received: by 2002:a54:4806:: with SMTP id j6mr8928013oij.15.1615132650809;
 Sun, 07 Mar 2021 07:57:30 -0800 (PST)
Received: from rebo.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id z14sm2170468otk.30.2021.03.07.07.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 07:57:30 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: RESEND [PATCH v2] bsd-user: Add new maintainers
Date: Sun,  7 Mar 2021 08:56:53 -0700
Message-Id: <20210307155654.993-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::243;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x243.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FreeBSD project has a number of enhancements to bsd-user. Add myself
as maintainer and Kyle Evans as a reviewer. Also add our github repo.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26c9454823..ec0e935038 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2896,9 +2896,12 @@ F: thunk.c
 F: accel/tcg/user-exec*.c
 
 BSD user
-S: Orphan
+M: Warner Losh <imp@bsdimp.com>
+R: Kyle Evans <kevans@freebsd.org>
+S: Maintained
 F: bsd-user/
 F: default-configs/targets/*-bsd-user.mak
+T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
 
 Linux user
 M: Laurent Vivier <laurent@vivier.eu>
-- 
2.30.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843443BA508
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:28:05 +0200 (CEST)
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQhg-0004NY-H3
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQfw-0002Jl-73
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:16 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:47077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQft-0001Mw-Iz
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:16 -0400
Received: by mail-pg1-x52e.google.com with SMTP id w15so10949386pgk.13
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 14:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dGTiGJOTp/bspxX8sMms2I88vB/dqPcoL0Gmp03XhO0=;
 b=FNrM8fnxcHlFZDoHd3nDfmNjG7sIXffHa3bVORryQ7iJTfJhKbPVdijrp5RM6O2Yno
 xxKk4jVmrj8a7jbrnkZHSVrq9/0Yi+atNEQnGgoebc1MdOfPHK+sJ4QgPQazrDxt2MGD
 mzullsEY9p0DMgN1EyHT8ocFzRPGJMq36tSu+wCv13/0tZ5vge52iIWK8iVRIbfKDgr9
 o3pyxU5fI+U7RKhHY+xQ9g77mZhGrza4U0AgyLi9Xii/RGi/Okc5x/A/vHav3w94VVQW
 jSW26ZT3Jgt9/KH3ulEkvYvc6ENmISxNGQr2649fm9d9wNCHgXgQLZazzg0W64VxoNrW
 1VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dGTiGJOTp/bspxX8sMms2I88vB/dqPcoL0Gmp03XhO0=;
 b=UysmJDUUT5gbzHsoaz6PxnkVayA0TlJgMORDWMw+LWSGIm/H6Z0W6tvDFqf60lawvI
 rtyagi810LIaMOgEhe3es2oUBYVeWkaDSeotoglZF1j9ub3Em57wyuIMIwdkzIttxg5G
 CdjAF7hIHwjxbxLH1aDxYxBKJGV19gFJJYhRxFhCyLcwv/fHcxmyIOFlE2Y+XY/PXswX
 IUk91jVNOoMKukJbij5J4o4KkNy7GfWv8YFPdhAu/6WFZkiag1gMgJ0UBDZddBO3YsEN
 D9ImPO/kIUmL5E5RS1FHbCv5e97yEARbyAbeoI+lHKOesY+x858R3LYw6K2KjOWsRA1Q
 Do4A==
X-Gm-Message-State: AOAM53032/TKTX0vDRx2ljJPctk4fo1ncech52jzifURzQscA8u8AlaC
 eHhH9c4/407hhMtKBoo7Wn0=
X-Google-Smtp-Source: ABdhPJyHF3kITH/CXj5oynnfAA9GV9Su6vz2y7xA3CovS7HHBbUfGPZDUBVG/SL2cK24tx+mxF195A==
X-Received: by 2002:a63:5015:: with SMTP id e21mr1912435pgb.272.1625261172247; 
 Fri, 02 Jul 2021 14:26:12 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.1])
 by smtp.gmail.com with ESMTPSA id o16sm71563pjw.51.2021.07.02.14.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:26:11 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: jsnow@redhat.com
Subject: [PATCH 1/6] python: disable pylint errors for aqmp-tui
Date: Sat,  3 Jul 2021 02:55:58 +0530
Message-Id: <20210702212603.26465-2-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702212603.26465-1-niteesh.gs@gmail.com>
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disable missing-docstring and fixme pylint warnings.
This is because since the AQMP is just a prototype
it is currently not documented properly and lot
of todo and fixme's are still in place.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/setup.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index bce8807702..1a552d672a 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -89,6 +89,8 @@ ignore_missing_imports = True
 # no Warning level messages displayed, use "--disable=all --enable=classes
 # --disable=W".
 disable=too-many-function-args,  # mypy handles this with less false positives.
+        missing-docstring, # FIXME
+        fixme, # FIXME
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.17.1



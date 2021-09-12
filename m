Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD56407D6A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:59:19 +0200 (CEST)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPP4o-0005Wh-Hk
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPOuO-0007s3-Mj
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:48:32 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPOuM-0006ex-Sj
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:48:32 -0400
Received: by mail-ej1-x62c.google.com with SMTP id h9so14647771ejs.4
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LQhHQo7TbvF9Uns6y6CZcNI5Rj8ePDOMGNWM3NJzUpE=;
 b=cigbXwERKUAZJutm0g830okjhVyd9ZUzpGKhNytF9MxgwOfbX/xRcQZgRsAPb88jLd
 M3D21drwM6eTYLyoKnwmaPzv7edYQFIMdWBdLOLo5FZVoUlHxEsNJSc2OA3h2K4gAylX
 66nwr45ZrceJknWYrDjWb0aKnAbhc8xcE8LWmZeTdddIWCXjqFT0RE9HvAyhjONm9yuC
 JV1AXYMhSpNWg85khK1vy+6XOId5VMq2ZxS5lFcnr8q7wgDv1g3RgkNPqizYMifgnjrL
 DKAbbnzDc4tjPOXMGaIdGDMvjd+kmW07SKH1dF6lSwyk9mFaqAAvSHMynPf6kDQbxX/7
 bSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LQhHQo7TbvF9Uns6y6CZcNI5Rj8ePDOMGNWM3NJzUpE=;
 b=eAaUc3U2U3A3mzibwWaiYrDql64FsZrKbSqdbI3u0xurGT+FNj5tZ01CxLhChrxn6f
 gxge+/yVPV8sNj/tUokzPK2ad5l3kDNCw2Keq5/e3V15KmKLZG/DP5LElZ0WKOXYSKMa
 +rZnGunWZri2vsybWjglDGfsWp71X/eSIA+9Wzq1/Gd/74FKw9QvzvocmPVJ1apWrrO9
 7w3slWvnRQPs2wplXqMBqRsBSkXv25Swewn2Kdv9veDJ4mvEDMc6V1/kpPn3eCbsyZkF
 I64MbNiyo/57O76u3f/Dj/HZC3jR2xhUb1uU/S+oAMLTgqIcIfXzIgBb7zPrK3tDFb8A
 095w==
X-Gm-Message-State: AOAM533UuFxXtfHr77sCyVIAar1eVk3YuiXL4H15LO0UtxnVBXOHfgHT
 OGGGSVSkKqDpZ/nAvRT6jSEiiWU4s5Y=
X-Google-Smtp-Source: ABdhPJyo0NsYoi2d8yvTZEBth7n9zTwrCPT7b6+2y4iOUfJWEt7eYVuAdCJ+7ke8o7XDsmYxqZvT2g==
X-Received: by 2002:a17:906:308d:: with SMTP id
 13mr7263079ejv.570.1631450908405; 
 Sun, 12 Sep 2021 05:48:28 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 s15sm2328009edr.6.2021.09.12.05.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:48:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: link to archived Fedora code of conduct
Date: Sun, 12 Sep 2021 14:48:25 +0200
Message-Id: <20210912124825.502929-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fedora has switched to a different CoC.  QEMU's own code of conduct
is based on the previous version and cites it as a source.  Replace
the link with one to the Wayback Machine.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/code-of-conduct.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.rst
index 277b5250d1..195444d1b4 100644
--- a/docs/devel/code-of-conduct.rst
+++ b/docs/devel/code-of-conduct.rst
@@ -55,6 +55,6 @@ Sources
 -------
 
 This document is based on the `Fedora Code of Conduct
-<https://fedoraproject.org/code-of-conduct>`__ and the
-`Contributor Covenant version 1.3.0
+<http://web.archive.org/web/20210429132536/https://docs.fedoraproject.org/en-US/project/code-of-conduct/>`__
+(as of April 2021) and the `Contributor Covenant version 1.3.0
 <https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/>`__.
-- 
2.31.1



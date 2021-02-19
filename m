Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55A32005E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 22:39:48 +0100 (CET)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDV5-0003rA-DB
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 16:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1lDDF9-0007tA-U0
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:23:19 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:32416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1lDDF8-0005KG-75
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:23:19 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id C0F1F82373;
 Fri, 19 Feb 2021 21:23:16 +0000 (UTC) (envelope-from imp@freebsd.org)
Received: from freefall.freebsd.org (freefall.freebsd.org [96.47.72.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "freefall.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Dj4LX4rmnz3Lh3;
 Fri, 19 Feb 2021 21:23:16 +0000 (UTC) (envelope-from imp@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1613769796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oYAHW+M9PCYJ3x9te++hH9CEX3u0ukbpuj8cm48rojs=;
 b=JO3FrGtapBObegnuCFPzvaKUYn/CqDRnFz6FrchQi/SYNJzHfNqiMDC6MT4AZ6E6R1NjOV
 X7PGK6egT3mf3qLEVTy4Z/vD9+xmPynyq/pQ7tExziXjwq/+sw2RKkYoqR4ztq93dFUxAn
 rBuHpkMzNjORwh6deqhgBZ18vg8R5kaB3WLGZmlC957AAXUNuebT9RomsP6h5g4sjtjOHG
 jd423/GwnXjNnvPyKFo4SGpdAiZYE7mTHaNaxYiAYXBX11efkiVnxvc3uN9EJLUbCTGWWj
 poohDV49IKP9bCxNx1/pnDaCUhxxk/G3cbbY41XnjFuBc5JsfbOLRxlXngHsiA==
Received: by freefall.freebsd.org (Postfix, from userid 547)
 id 8A24784FD; Fri, 19 Feb 2021 21:23:16 +0000 (UTC)
From: Warner Losh <imp@freefall.freebsd.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] bsd-user: Add new maintainers
Date: Fri, 19 Feb 2021 14:23:08 -0700
Message-Id: <20210219212308.74079-1-imp@freefall.freebsd.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1613769796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oYAHW+M9PCYJ3x9te++hH9CEX3u0ukbpuj8cm48rojs=;
 b=SKnqyEnJodGf6A2bNZCZ4tPXm9SqBA7JtKO4RJ5Eo7heohMGRf9ROGuuZEfabhycWbKvs0
 /c4Gcj/+c5+3qUfdnECDlu9eixQrcZcNHf2kSy9u1xdAIukdwcZbpvtd85YLHdRPdssKb4
 uUQHramrD+ijzAw+rAYywt0wINsNI6YBO/ohbmP+QDM3QFjrBK8/nKMpza/JvKHs6q3vo0
 Hh4YwsjjWfQfAfHSaFB4iP8GW6JPfEFNfLSX9T7cwkSbfD73FyzCPVPFor/G9mCiL45tv6
 acEAz0gV6djfflYypoFXR1uE3xefdZ7Wl4Hcy+6Ia/r7GqqPeVJaPJl20UaBbQ==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1613769796; a=rsa-sha256; cv=none;
 b=OvSuuv64VrNxC5nRBT7eBy1rbXcjzavvJaFok7UfVUa+bcqQoOmsa4t5rv6Z+NOm9pF+uX
 w8TuvI7Uh4KVvN3c6wNc/4nTdofqOSL+4bSqWm2OC2vO0YX+US79ATRQL3SJe/hpsP9Zna
 mP+IE1HhBsa6ID6gRLDI8OUkAnAWj1fcaPR/O01cLHOaqPyH08evAbbOwZuHWyF2Gf9IX8
 9mAiYncm/iF3sLXepd2Ek4WSHVllSoYWRfUhpyx/iR2V+NK6rTfvXUJPdRdJslkN1jusOf
 InNHxEbHCQNEAQTOimN8dRNkgBFgDg/z7Uv7+YY7PdKN38E1OhJzcibXhWdJ1A==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=96.47.72.81; envelope-from=imp@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 19 Feb 2021 16:37:54 -0500
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>, emaste@freebsd.org,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

The FreeBSD project has a number of enhancements to bsd-user. Add myself
as maintainer and Kyle Evans as a reviewer. Also add our github repo.

Signed-off-by: Warner Losh <imp@FreeBSD.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66354e6e49..141e01075b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2884,9 +2884,12 @@ F: thunk.c
 F: accel/tcg/user-exec*.c
 
 BSD user
-S: Orphan
+M: Warner Losh <imp@bsdimp.com>
+R: Kyle Evans <kevans@freebsd.org>
+S: Maintained
 F: bsd-user/
-F: default-configs/*-bsd-user.mak
+F: default-configs/targets/*-bsd-user.mak
+T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
 
 Linux user
 M: Laurent Vivier <laurent@vivier.eu>
-- 
2.30.0



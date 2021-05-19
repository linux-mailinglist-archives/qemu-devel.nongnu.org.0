Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660BD388C18
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:52:43 +0200 (CEST)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJog-0004Od-FR
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ljJjR-0007Iz-OV
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ljJjP-0001Ef-Me
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621421233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=psir8wgKZpfiXZEk62iCcDLFm/tqi+Sk3hpxD3t+1X8=;
 b=WbyEsrnyfTh3FlEGv1JZV0DViS4KWRYHr39AMJUoh8ORr8LJu/qZ4CHer0INJsNlBM3rEe
 2RHB8R37AdTz5lgT3cuNvrAIyiWtNsdD1nIc2Y6V+yonp41KjCcxWcHr9W+osOmswPbnCn
 rezyn8Lw676V7MERyX7WO5EYma4pPOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Y3c_ZcjXN5OXyNlXkC06gg-1; Wed, 19 May 2021 06:47:09 -0400
X-MC-Unique: Y3c_ZcjXN5OXyNlXkC06gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74EBF107ACE4;
 Wed, 19 May 2021 10:47:08 +0000 (UTC)
Received: from localhost (unknown [10.36.110.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA2D048DD;
 Wed, 19 May 2021 10:47:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] Update libslirp to v4.5.0
Date: Wed, 19 May 2021 14:46:59 +0400
Message-Id: <20210519104659.2724448-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: samuel.thibault@ens-lyon.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Switch from stable-4.2 branch to upstream v4.5.0 release.

## [4.5.0] - 2021-05-18

### Added

 - IPv6 forwarding. !62 !75 !77
 - slirp_neighbor_info() to dump the ARP/NDP tables. !71

### Changed

 - Lazy guest address resolution for IPv6. !81
 - Improve signal handling when spawning a child. !61
 - Set macOS deployment target to macOS 10.4. !72
 - slirp_add_hostfwd: Ensure all error paths set errno. !80
 - More API documentation.

### Fixed

 - Assertion failure on unspecified IPv6 address. !86
 - Disable polling for PRI on MacOS, fixing some closing streams issues. !73
 - Various memory leak fixes on fastq/batchq. !68
 - Memory leak on IPv6 fast-send. !67
 - Slow socket response on Windows. !64
 - Misc build and code cleanups. !60 !63 !76 !79 !84

## [4.4.0] - 2020-12-02

### Added

 - udp, udp6, icmp: handle TTL value. !48
 - Enable forwarding ICMP errors. !49
 - Add DNS resolving for iOS. !54

### Changed

 - Improve meson subproject() support. !53
 - Removed Makefile-based build system. !56

### Fixed

 - socket: consume empty packets. !55
 - check pkt_len before reading protocol header (CVE-2020-29129). !57
 - ip_stripoptions use memmove (fixes undefined behaviour). !47
 - various Coverity-related changes/fixes.

## [4.3.1] - 2020-07-08

### Changed

 - A silent truncation could occur in `slirp_fmt()`, which will now print a
   critical message. See also #22.

### Fixed

 - CVE-2020-10756 - Drop bogus IPv6 messages that could lead to data leakage.
   See !44 and !42.
 - Fix win32 builds by using the SLIRP_PACKED definition.
 - Various coverity scan errors fixed. !41
 - Fix new GCC warnings. !43

## [4.3.0] - 2020-04-22

### Added

 - `SLIRP_VERSION_STRING` macro, with the git sha suffix when building from git
 - `SlirpConfig.disable_dns`, to disable DNS redirection #16

### Changed

 - `slirp_version_string()` now has the git sha suffix when building form git
 - Limit DNS redirection to port 53 #16

### Fixed

 - Fix build regression with mingw & NetBSD
 - Fix use-afte-free in `ip_reass()` (CVE-2020-1983)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 8f43a99191..ed74458a19 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit ed74458a19d1af177b5814b671754c55c7b8d2db
-- 
2.29.0



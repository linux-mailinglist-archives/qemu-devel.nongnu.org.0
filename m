Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED53DF029
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:21:21 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvIH-00036u-1T
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mAvFy-0000F1-1D
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mAvFw-00056E-DS
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628000335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyqrGyn6CWsOg7r5EfYcT4673V1fTbgZBfFzqOd9ch4=;
 b=aLm0rmwqyZsxUucwcjIcK9yFyUD9s7eGmvXbd0qZEiOZzJAzoDqk++dIP2v8UHL1bTR9s9
 jmERs0/kuK7rcIQuyVMmMWu5grgLTC61qoz26EKI8WBrOkt4kI/2iC6473vCkiCNQGWR6I
 OHBs7JgTKc7WtsWONb0nAJpWimF97X4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-aYkks23YPLOQv_IxSmDdUg-1; Tue, 03 Aug 2021 10:18:52 -0400
X-MC-Unique: aYkks23YPLOQv_IxSmDdUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55C441853024;
 Tue,  3 Aug 2021 14:18:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B21A175B6;
 Tue,  3 Aug 2021 14:18:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v4 1/1] Update libslirp to v4.6.1
Date: Tue,  3 Aug 2021 18:18:33 +0400
Message-Id: <20210803141833.3468770-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210803141833.3468770-1-marcandre.lureau@redhat.com>
References: <20210803141833.3468770-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Switch from stable-4.2 branch to upstream v4.6.1 release + fixes.

## [Unreleased]

### Fixed

 - Haiku fixes. !98 !99
 - Fix a minor DHCP regression introduced in 4.6.0. !97

## [4.6.1] - 2021-06-18

### Fixed

 - Fix DHCP regression introduced in 4.6.0. !95

## [4.6.0] - 2021-06-14

### Added

 - mbuf: Add debugging helpers for allocation. !90

### Changed

 -  Revert "Set macOS deployment target to macOS 10.4". !93

### Fixed

 - mtod()-related buffer overflows (CVE-2021-3592 #44, CVE-2021-3593 #45,
   CVE-2021-3594 #47, CVE-2021-3595 #46).
 - poll_fd: add missing fd registration for UDP and ICMP
 - ncsi: make ncsi_calculate_checksum work with unaligned data. !89
 - Various typos and doc fixes. !88

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
Reviewed-by: Doug Evans <dje@google.com>
---
 meson.build | 2 ++
 slirp       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index f2e148eaf9..af9bbb83db 100644
--- a/meson.build
+++ b/meson.build
@@ -1824,6 +1824,8 @@ if have_system
     slirp_deps = []
     if targetos == 'windows'
       slirp_deps = cc.find_library('iphlpapi')
+    elif targetos == 'darwin'
+      slirp_deps = cc.find_library('resolv')
     endif
     slirp_conf = configuration_data()
     slirp_conf.set('SLIRP_MAJOR_VERSION', meson.project_version().split('.')[0])
diff --git a/slirp b/slirp
index 8f43a99191..a88d9ace23 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
-- 
2.32.0.264.g75ae10bc75



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C9E360094
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 05:42:26 +0200 (CEST)
Received: from localhost ([::1]:53108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWstd-0001gj-Oq
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 23:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jLV3YAMKCt8EKFHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--dje.bounces.google.com>)
 id 1lWsrJ-0000JM-7g
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:40:01 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:33590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jLV3YAMKCt8EKFHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--dje.bounces.google.com>)
 id 1lWsrH-0004jv-D2
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:40:01 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 p11-20020a17090ad30bb029014dcd9154e1so2972120pju.0
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 20:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=p1ab23m8r3m0UpAYw3EBQJeJa7d9BxO3N5r4kXpaF/Q=;
 b=PdwN59aHghGVYCHLuKvgPvuFiWa9A7gkL5P4UUc/OfoBWbEDbE7C1Zv0hQmDIDyTkq
 LNU3jGhawih/1GBvltgDV4+j6RdKzK2jaDaO4gKPDgGgPoQHiW5/m+6kilFydAFYQOKB
 93egm3A7v2+5MWeMJ3PY238TW3P/p/GrZeMYQKDqbOVB/RU73pbryGpS0j6XYLDQKGDD
 XpJmx3OdA0VxRwZeK+CKa89WN/WZ1toat1i1EVyqy0Q7+h/o+w+zDmlkEjfIC3umaojY
 4zlObfMehxwJbxa7/Otm79Gz60gnfL6Fwpm/4fYyBlKSwNe1l4l5arZHCytAVToHVxOB
 VudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=p1ab23m8r3m0UpAYw3EBQJeJa7d9BxO3N5r4kXpaF/Q=;
 b=Oqie51F31BdX79nQhk8NGRdjsQe31ouR0Ir217q+a0Q9CtF4ZpScvAEkttO7t4MlNE
 AORlFyafRDsiOByH7FuoTevdwwCSDN4WRKTQhxdEOalhNZKJYYzpaSLvDzVMRdIkZFsX
 /csOB8UTY6/SjgTWKrUAcT9WGOkj9+xTfIMugYLd45WTAxCp7KEH1GBXzDt+jpEKm0z0
 GcTCw+Fth6IqAABP+jOdYESHgT0Jf3O3CCB0f9u4rP39hP1yIlWBVvE3REgWoo3rXMNz
 qcsRMgYfQvKcIndUz0lvW6B9TJGtHV0ouMb+dZ+H2dYu+NARMiJLHeOaaPT53VvUVdwn
 3Z9A==
X-Gm-Message-State: AOAM533vPBH7/GAo2mIh41cRZshz1Zk0Gavf34dooRTCem2JdBx8Awgg
 89Sw/ZlmMZua04HbPl8lsi2hCGIQ0KQsoh+1G80qZDMH+CplC/2b1niXqS9O6Dis1nYKszjdbdL
 3BkrSfMu8rlB1bt4seFiWeCN6IrWTjAmNIjj/K9cf3R1ld5H66HZ8
X-Google-Smtp-Source: ABdhPJyvbn3CFkxmr0eOP9FLwnYIueXzpvYi6xKdIzYgQ7iwKyaTqbmAIkle9I85A2VYhxFWUMCPOuA=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:83d5:e012:e680:1449])
 (user=dje job=sendgmr) by 2002:a63:4652:: with SMTP id
 v18mr1583950pgk.386.1618457996899; 
 Wed, 14 Apr 2021 20:39:56 -0700 (PDT)
Date: Wed, 14 Apr 2021 20:39:22 -0700
In-Reply-To: <20210415033925.1290401-1-dje@google.com>
Message-Id: <20210415033925.1290401-2-dje@google.com>
Mime-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v6 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3jLV3YAMKCt8EKFHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--dje.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

5eraph (2):
      disable_dns option
      limit vnameserver_addr to port 53

Akihiro Suda (1):
      libslirp.h: fix SlirpConfig v3 documentation

Doug Evans (11):
      Add ipv6 host forward support
      tcpx_listen: Pass sizeof(addr) to memset
      Reject host forwarding to ipv6 "addr-any"
      Add /build/ to .gitignore
      New utility slirp_ether_ntoa
      m_cleanup_list: make static
      New API routine slirp_neighbor_info
      Move DEBUG_CALL("if_start") to DEBUG_VERBOSE_CALL
      tcpx_listen: tcp_newtcpcb doesn't fail
      slirp_add_host*fwd: Ensure all error paths set errno
      Perform lazy guest address resolution for IPv6

Dr. David Alan Gilbert (1):
      ip_stripoptions use memmove

Giuseppe Scrivano (1):
      socket: consume empty packets

Hafiz Abid Qadeer (1):
      Fix a typo that can cause slow socket response on Windows.

Jindrich Novy (4):
      Fix possible infinite loops and use-after-free
      Use secure string copy to avoid overflow
      Be sure to initialize sockaddr structure
      Check lseek() for failure

Marc-Andr=C3=A9 Lureau (26):
      Merge branch 'master' into 'master'
      Merge branch 'fix-slirpconfig-3-doc' into 'master'
      Fix use-afte-free in ip_reass() (CVE-2020-1983)
      Update CHANGELOG
      Merge branch 'cve-2020-1983' into 'master'
      Release v4.3.0
      Merge branch 'release-v4.3.0' into 'master'
      changelog: post-release
      util: do not silently truncate
      Merge branch 'slirp-fmt-truncate' into 'master'
      Release v4.3.1
      Merge branch 'release-v4.3.1' into 'master'
      changelog: post-release
      .gitlab-ci: add a Coverity stage
      Merge branch 'coverity' into 'master'
      Merge branch 'ios-support' into 'master'
      Merge branch 'master' into 'master'
      Remove the QEMU-special make build-system
      Merge branch 'qemu' into 'master'
      Release v4.4.0
      Merge branch '4.4.0-release' into 'master'
      changelog: post-release
      Remove some needless (void)casts
      Fix unused variables
      Merge branch 'gitignore-build' into 'master'
      Merge branch 'macos-deployment-target' into 'master'

Nathaniel Wesley Filardo (1):
      fork_exec_child_setup: improve signal handling

Paolo Bonzini (2):
      meson: remove meson-dist script
      meson: support compiling as subproject

Philippe Mathieu-Daud=C3=A9 (3):
      Fix win32 builds by using the SLIRP_PACKED definition
      Fix constness warnings
      Remove unnecessary break

Prasad J Pandit (1):
      slirp: check pkt_len before reading protocol header

Ralf Haferkamp (2):
      Drop bogus IPv6 messages
      Fix MTU check

Samuel Thibault (45):
      Merge branch 'ip6_payload_len' into 'master'
      Merge branch 'lp1878043' into 'master'
      udp, udp6, icmp: handle TTL value
      icmp, icmp6: Add icmp_forward_error and icmp6_forward_error
      udp, udp6, icmp, icmp6: Enable forwarding errors on Linux
      TCPIPHDR_DELTA: Fix potential negative value
      sosendoob: better document what urgc is used for
      Merge branch 'G_GNUC_PRINTF' into 'master'
      Merge branch 'CVE-2020-29129' into 'master'
      Merge branch 'ttl' into 'master'
      Merge branch 'errors' into 'master'
      Merge branch 'consume-empty-packet' into 'master'
      Merge branch 'void' into 'master'
      Merge branch 'master' into 'master'
      Merge branch 'unused' into 'master'
      Merge branch 'socket_delay' into 'master'
      tcp_subr: simplify code
      Merge branch 'ipv6-host-fwd-9-patch' into 'master'
      Document the slirp API
      Complete timeout documentation
      Merge branch 'memset-sizeof' into 'master'
      Merge branch 'reject-ipv6-addr-any' into 'master'
      ip6_output: fix memory leak on fast-send
      Merge branch 'ndp-leak' into 'master'
      Merge branch 'memory_leaks' into 'master'
      TODO for generalizing the hostfwd calls
      socket.h: add missing sbuf.h inclusion
      Expose udpx_listen and tcpx_listen as taking sockaddr
      Disable polling for PRI on MacOS
      Merge branch 'macos-pri' into 'master'
      Merge branch 'x_listen' into 'master'
      udpx/tcpx_listen: Add missing const qualifier
      sockaddr_*: add missing const qualifiers
      Merge branch 'm-cleanup-list-prototype' into 'master'
      Merge branch 'neighbor-info' into 'master'
      udpx/tcpx_listen: Use struct sockaddr * types
      Add ipv4/ipv6-agnostic host forwarding functions
      hostfwd: Add SLIRP_HOSTFWD_V6ONLY flag
      Merge branch 'hostxfwd' into 'master'
      Merge branch 'verbose-if-start' into 'master'
      Remove slirp_add/remove_ipv6_hostfwd
      Merge branch 'listen-errno' into 'master'
      Merge branch 'newtcpcb-no-fail' into 'master'
      Merge branch 'listen_v6only' into 'master'
      Merge branch 'lazy-ipv6-resolution' into 'master'

Stefan Weil (1):
      Add G_GNUC_PRINTF to local function slirp_vsnprintf

WaluigiWare64 (1):
      Set macOS deployment target to macOS 10.4 Without a macOS deployment =
target, the resulting library does not work on macOS versions lower than it=
 was currently built on. For example, if libslirp was built on macOS 10.15,=
 it would not work on macOS 10.14.

jeremy marchand (4):
      m_free: remove the M_EXT flag after freeing the mbuf extended buffer
      refactor m_cleanup as requested in slirp/libslirp!68
      m_cleanup: fix memory leaks
      m_cleanup: set qh_link and qh_rlink to the list head

osy (1):
      Add DNS resolving for iOS

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v5:

1/4 slirp: Advance libslirp submodule to current master
NOTE TO REVIEWERS: It may be a better use of everyone's time if a
maintainer takes on advancing QEMU's libslirp to libslirp's master.
Beyond that, I really don't know what to do except submit this patch as
is currently provided.

 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 8f43a99191..4e6444e842 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit 4e6444e842695a6bfb00e15a8d0edfceb5c4628d
--=20
2.31.1.295.g9ea45b61b8-goog



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864C42F6157
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 13:58:40 +0100 (CET)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02D1-0004a7-II
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 07:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02BF-0002w7-Mv
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02BD-0004qj-TO
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3UTpVZUCbF+UfdbAeLEovXZeobzPoeJ1rpTsNje78Q=;
 b=IoKR87Z2vuNDM6/8i76bYf43YS8k4AjX1L6dNjXc0SaovNw2hpJajC6RAB2WZUxCaHvt+9
 GfJY2Oy9Kswhw7u9BWNpAzk6tENWR+oUhwpjp9cNk8QwXlhTSoaP4vw5uE1SOY6HT85ShJ
 PDHDLghXZ2/W2jqCV8SjRSaLzEcLZjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-9QWPoy18PReeLGZVoK7NIg-1; Thu, 14 Jan 2021 07:56:44 -0500
X-MC-Unique: 9QWPoy18PReeLGZVoK7NIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE367423C0;
 Thu, 14 Jan 2021 12:56:41 +0000 (UTC)
Received: from localhost (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AE0360867;
 Thu, 14 Jan 2021 12:56:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] slirp: update to git master
Date: Thu, 14 Jan 2021 16:56:04 +0400
Message-Id: <20210114125605.1227742-5-marcandre.lureau@redhat.com>
In-Reply-To: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
References: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: pbonzini@redhat.com, j@getutm.app,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 samuel.thibault@ens-lyon.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

git cherry-diff:

Commits on bacb71f1c3ed5f40e393afd8be81bedfba13a401 branch that is not on 8f43a99191afb47ca3f3c6972f6306209f367ece branch
+ 1021b0dc38d39f1dc95a296fe3e05a24a087cdc6 disable_dns option
+ 0f94ceec752592e4ac632a24e3c64a97dd09bf4c limit vnameserver_addr to port 53
+ b57bafa852ef16b133907a13678ec69e9531f177 libslirp.h: fix SlirpConfig v3 documentation
+ 1abf18b2b5edb462797629ed47ad4515a195686e Update CHANGELOG
+ ff4ecf9b6c6542b24b4ac6ea178be9d44e159f79 Release v4.3.0
+ 21f1d933050a40d62612c6274c32de60b811d9ea changelog: post-release
+ 376187c4b14c795763d472214812826eebe7e9c2 Release v4.3.1
+ 73336e08902a7e826f7d960453df037380266186 changelog: post-release
+ 5c1c9d43be61571608e9b14615045b67b830daf5 udp, udp6, icmp: handle TTL value
+ 73ed49ab71998d4288e71e954ef6214b70f23d79 icmp, icmp6: Add icmp_forward_error and icmp6_forward_error
+ 7a4840a57ec7dbc37cca1ab96f058a9610b26950 udp, udp6, icmp, icmp6: Enable forwarding errors on Linux
+ e9b2bc19ae652a2907f247e621b2e4773bdd2aab TCPIPHDR_DELTA: Fix potential negative value
+ 39f9a363eec082f04513413046321abd04163148 .gitlab-ci: add a Coverity stage
+ 1b0093b973cfa0dc041522e5d4e6f576b2df642e sosendoob: better document what urgc is used for
+ 5b9ad89ebbb8afa50162c9156fabd5fc56291088 Add G_GNUC_PRINTF to local function slirp_vsnprintf
+ 8a808aa493980e212b4d5f5465330905c8294e59 meson: remove meson-dist script
+ 0b669b5fbe4d3c25a682a67f1059d8633c963b3d meson: support compiling as subproject
+ 9f82a47b81f2864422b82c1e40e51a2ed9c6ac32 Add DNS resolving for iOS
+ c0eac03e8ce1b9a743231f2fe21e7cb579fc9339 Remove the QEMU-special make build-system
+ 1bfd4d9368f9fa2e4f0731e1266bec05bbc83a80 socket: consume empty packets
+ 92413be68914f8cae2f5bad4bf3ab8491dcbc5d7 Release v4.4.0
+ 07e8cfac69766081871ab620d9f16a630543d302 changelog: post-release
+ 4c4e035813313d02b63fdeb920d56fb2fdc0a5b1 Remove some needless (void)casts

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 8f43a99191..bacb71f1c3 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit bacb71f1c3ed5f40e393afd8be81bedfba13a401
-- 
2.29.0



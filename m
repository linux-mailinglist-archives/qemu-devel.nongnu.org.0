Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A9B2C2994
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 15:29:22 +0100 (CET)
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZJn-00044K-LO
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 09:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1khZFm-0000dz-4C
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:25:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1khZFi-0004mu-FW
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606227905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUdx9ADgraruTHvsInwt1I7WAjcdm3vtnjqHAGy7dhw=;
 b=gcqsnQKPAY+m8Lp4ZCarEMjKaTI8XI/yscAnXC+larc7U4vTFaKcpZ4HIDmhwKu7zQsN+j
 n06pZgqggx0dqUvm8M0aScRQtKFflyBWkCUgUrt6bxAsApmsAYOAWY/XwlApBe3Jvn0VEp
 +zPR8qOdg0gzXsvGArtGV5+uM16khN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-dlhxnehyOoibayHa20S55w-1; Tue, 24 Nov 2020 09:25:01 -0500
X-MC-Unique: dlhxnehyOoibayHa20S55w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5281612A1;
 Tue, 24 Nov 2020 14:24:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.8.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A230F189A5;
 Tue, 24 Nov 2020 14:24:54 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: [RFC 1/1] security-process: update process information
Date: Tue, 24 Nov 2020 19:52:38 +0530
Message-Id: <20201124142238.225417-2-ppandit@redhat.com>
In-Reply-To: <20201124142238.225417-1-ppandit@redhat.com>
References: <20201124142238.225417-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, secalert@redhat.com,
 Michael Roth <michael.roth@amd.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

We are about to introduce a qemu-security mailing list to report
and triage QEMU security issues.

Update the QEMU security process web page with new mailing list
and triage details.

Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 contribute/security-process.md | 105 +++++++++++++++++----------------
 1 file changed, 55 insertions(+), 50 deletions(-)

diff --git a/contribute/security-process.md b/contribute/security-process.md
index 1239967..a03092c 100644
--- a/contribute/security-process.md
+++ b/contribute/security-process.md
@@ -3,43 +3,54 @@ title: Security Process
 permalink: /contribute/security-process/
 ---
 
-QEMU takes security very seriously, and we aim to take immediate action to
-address serious security-related problems that involve our product.
-
-Please report any suspected security vulnerability in QEMU to the following
-addresses. You can use GPG keys for respective receipients to communicate with
-us securely. If you do, please upload your GPG public key or supply it to us
-in some other way, so that we can communicate to you in a secure way, too!
-Please include the tag **\[QEMU-SECURITY\]** on the subject line to help us
-identify your message as security-related. 
-
-## QEMU Security Contact List
-
-Please copy everyone on this list:
-
- Contact Person(s)	| Contact Address		| Company	|  GPG Key  | GPG key fingerprint
-:-----------------------|:------------------------------|:--------------|:---------:|:--------------------
- Michael S. Tsirkin	| mst@redhat.com		| Red Hat Inc.	| [&#x1f511;](https://pgp.mit.edu/pks/lookup?op=vindex&search=0xC3503912AFBE8E67) | 0270 606B 6F3C DF3D 0B17 0970 C350 3912 AFBE 8E67
- Petr Matousek		| pmatouse@redhat.com		| Red Hat Inc.	| [&#x1f511;](https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3E786F42C44977CA) | 8107 AF16 A416 F9AF 18F3 D874 3E78 6F42 C449 77CA
- Stefano Stabellini	| sstabellini@kernel.org 	| Independent	| [&#x1f511;](https://pgp.mit.edu/pks/lookup?op=vindex&search=0x894F8F4870E1AE90) | D04E 33AB A51F 67BA 07D3 0AEA 894F 8F48 70E1 AE90
- Security Response Team | secalert@redhat.com		| Red Hat Inc.	| [&#x1f511;](https://access.redhat.com/site/security/team/contact/#contact) |
- Michael Roth		| michael.roth@amd.com	| AMD		| [&#x1f511;](https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3353C9CEF108B584) | CEAC C9E1 5534 EBAB B82D 3FA0 3353 C9CE F108 B584
- Prasad J Pandit 	| pjp@redhat.com		| Red Hat Inc.	| [&#x1f511;](http://pool.sks-keyservers.net/pks/lookup?op=vindex&search=0xE2858B5AF050DE8D) | 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D 
-
-## How to Contact Us Securely
-
-We use GNU Privacy Guard (GnuPG or GPG) keys to secure communications. Mail
-sent to members of the list can be encrypted with public keys of all members
-of the list. We expect to change some of the keys we use from time to time.
-Should a key change, the previous one will be revoked.
-
-## How we respond
-
-Maintainers listed on the security reporting list operate a policy of
-responsible disclosure. As such they agree that any information you share with
-them about security issues that are not public knowledge is kept confidential
-within respective affiliated companies. It is not passed on to any third-party,
-including Xen Security Project, without your permission.
+Please report any suspected security issue in QEMU to the security mailing
+list at:
+
+* <qemu-security@nongnu.org>
+
+To report an issue securely via GPG encrypted email, please send it to the
+Red Hat Product Security team at:
+
+* <secalert@redhat.com>  [GPG key](https://access.redhat.com/security/team/contact/#contact)
+
+Note: after the triage, encrypted issue details shall be sent to the upstream
+'qemu-security' list for archival purposes.
+
+## How to report an issue:
+
+* Please include as many details as possible in the issue report.
+  Ex:
+    - QEMU version, upstream commit/tag
+    - Host & Guest architecture x86/Arm64/PPC, 32/64 bit etc.
+    - Affected code area/snippets
+    - Stack traces, crash details
+    - Malicious inputs/reproducer steps etc.
+    - Any configurations/settings required to trigger the issue.
+
+* Please share the QEMU command line used to invoke the guest VM.
+
+* Please specify whom to acknowledge for reporting this issue.
+
+## How we respond:
+
+* Steps to triage:
+    - Examine and validate the issue details to confirm whether the
+      issue is genuine and can be misused for malicious purposes.
+    - Determine its worst case impact and severity(Low/M/I/Critical)
+    - Negotiate embargo timeline (if required)
+    - Request a CVE and open an upstream bug
+    - Create an upstream fix patch
+
+* Above security lists are operated by select analysts, maintainers and/or
+  representatives from downstream communities.
+
+* List members follow a **responsible disclosure** policy. Any non-public
+  information you share about security issues, is kept confidential within the
+  respective affiliated companies. Such information shall not be passed on to
+  any third parties, including Xen Security Project, without your prior
+  permission.
+
+* We aim to triage security issues within maximum of 60 days.
 
 Email sent to us is read and acknowledged with a non-automated response. For
 issues that are complicated and require significant attention, we will open an
@@ -51,24 +62,23 @@ of the following steps:
 If a security issue is reported that is not already publicly disclosed, an
 embargo date may be assigned and communicated to the reporter. Embargo
 periods will be negotiated by mutual agreement between members of the security
-team and other relevant parties to the problem. Members of the security contact
-list agree not to publicly disclose any details of the security issue until
+list and other relevant parties to the problem. Members of the security list
+agree not to publicly disclose any details of the security issue until
 the embargo date expires.
 
 ### CVE allocation
 
-An security issue is assigned with a CVE number. The CVE numbers will usually
-be allocated by one of the vendor security engineers on the security contact
-list.
+Each security issue is assigned a CVE number. The CVE number is usually
+allocated by one of the vendor security engineers on the security list.
 
-## When to contact the QEMU Security Contact List
+## When to contact the QEMU Security List
 
-You should contact the Security Contact List if:
+You should contact the Security List if:
 * You think there may be a security vulnerability in QEMU.
 * You are unsure about how a known vulnerability affects QEMU.
 * You can contact us in English. We are unable to respond in other languages.
 
-## When *not* to contact the QEMU Security Contact List
+## When *not* to contact the QEMU Security List
 * You need assistance in a language other than English.
 * You require technical assistance (for example, "how do I configure QEMU?").
 * You need help upgrading QEMU due to security alerts.
@@ -122,8 +132,3 @@ used to write programs for the SoC device. In such developer environments, it
 is generally assumed that the guest is trusted.
 
 And thus, this buffer overflow turned out to be a security non-issue.
-
-## What to Send to the QEMU Security Contact List
-
-Please provide as much information about your system and the issue as possible
-when contacting the list.
-- 
2.28.0



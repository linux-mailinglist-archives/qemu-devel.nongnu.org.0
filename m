Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CCD30FCB3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:28:16 +0100 (CET)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kIZ-0006ge-36
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7jyR-0003XM-Oe
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:07:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7jyO-0001FB-Bm
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612465643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Li6Ao/DbQxPFNLfVf61+wv+1AFJdn7FecJIZ/NshX8k=;
 b=DIOLmwJ4kbon1b/HMCZiL3zGR+20v0wAIzF/7UtgVkk9Yh+U7AiBNlEGGWyWG588jq2Y9D
 xq+pB+SNGQSqHlf0aIHXm6rbjT1Tu7yrp78tvmpQyKkESdMF0nMOOJ3UCyW5aX8c6g/Adc
 kBsPAcqYFn8nDkyUElSmjo+0cY1bNWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-bgpmtzzWOAKp6OirRGCBrQ-1; Thu, 04 Feb 2021 14:07:19 -0500
X-MC-Unique: bgpmtzzWOAKp6OirRGCBrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54F011800D41;
 Thu,  4 Feb 2021 19:07:18 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C77BC5D9CC;
 Thu,  4 Feb 2021 19:07:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] utils: Deprecate hex-with-suffix sizes
Date: Thu,  4 Feb 2021 13:07:07 -0600
Message-Id: <20210204190708.1306296-3-eblake@redhat.com>
In-Reply-To: <20210204190708.1306296-1-eblake@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-block@nongnu.org,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 rjones@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supporting '0x20M' looks odd, particularly since we have an 'E' suffix
that is ambiguous between a hex digit and the extremely large exibyte
suffix, as well as a 'B' suffix for bytes.  In practice, people using
hex inputs are specifying values in bytes (and would have written
0x2000000, or possibly relied on default_suffix in the case of
qemu_strtosz_MiB), and the use of scaling suffixes makes the most
sense for inputs in decimal (where the user would write 32M).  But
rather than outright dropping support for hex-with-suffix, let's
follow our deprecation policy.  Sadly, since qemu_strtosz() does not
have an Err** parameter, we pollute to stderr.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/system/deprecated.rst | 8 ++++++++
 util/cutils.c              | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 6ac757ed9fa7..c404c3926e6f 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -146,6 +146,14 @@ library enabled as a cryptography provider.
 Neither the ``nettle`` library, or the built-in cryptography provider are
 supported on FIPS enabled hosts.

+hexadecimal sizes with scaling multipliers (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Input parameters that take a size value should only use a size suffix
+(such as 'k' or 'M') when the base is written in decimal, and not when
+the value is hexadecimal.  That is, '0x20M' is deprecated, and should
+be written either as '32M' or as '0x2000000'.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------

diff --git a/util/cutils.c b/util/cutils.c
index 0234763bd70b..75190565cbb5 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -264,7 +264,7 @@ static int do_strtosz(const char *nptr, const char **end,
     int retval;
     const char *endptr;
     unsigned char c;
-    bool mul_required = false;
+    bool mul_required = false, hex = false;
     uint64_t val;
     int64_t mul;
     double fraction = 0.0;
@@ -309,6 +309,10 @@ static int do_strtosz(const char *nptr, const char **end,
     c = *endptr;
     mul = suffix_mul(c, unit);
     if (mul > 0) {
+        if (hex) {
+            fprintf(stderr, "Using a multiplier suffix on hex numbers "
+                    "is deprecated: %s\n", nptr);
+        }
         endptr++;
     } else {
         mul = suffix_mul(default_suffix, unit);
-- 
2.30.0



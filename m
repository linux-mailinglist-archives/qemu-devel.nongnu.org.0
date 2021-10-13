Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A183E42BB58
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:18:51 +0200 (CEST)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaPS-00009U-Jy
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEh-0002Cu-HK
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEb-0005dv-7H
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:39 -0400
Received: by mail-ed1-x530.google.com with SMTP id w14so7161478edv.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SuuikUBHzwC0idz8oNxMZ8qqc26pz27g7jT3Vmh3saI=;
 b=EalS5XegZiXTSd+IbMVfkkiOhqMlkYaZWB5Uj+4OcU4weFzGozRgA+psBNh3A/paQn
 K5WuljWiCtUJ5jkhUnlsdjzq9SUKL3CUCoWzBt99wxQmt+Hfciqzoldw44NsYkXeASAH
 7HyW1VtGqQG0N91kFH7sXdlGymrfgfx1vZq45TfgwQF8wOFnEIlm0mZXRsBUhWVWqy14
 SsdeNR38IlfTRwGGm70PsOfKh1ZcsXP3wFx3z1Rx8tYOsyl+gQJR2urwg8Gi/f1OtGP8
 +01GelP+FT8HZ979DN++ARIksJoTdsemZyVLtZeheCoyszjRLwkEqDCU6e5Xdq4XSlSF
 EHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SuuikUBHzwC0idz8oNxMZ8qqc26pz27g7jT3Vmh3saI=;
 b=5LXvZ3Blcc6cTA1B0p4kLFq68lqOW8JtpZFq0V8VIhypDKU3vUa45v4F2YVJ5P7XYs
 6a7OfkHOdMDUfXctLmjTY+GNZ/o2q8pny8Lz+wLKvpkYph5rL+JhFGISv5dUcw6bMc0R
 CtuLLnGwOHmFyMy8VyN603Ox4EJ+iHhtdsqFuka9B/nEhLqMJlex+/2qlc4vxlWrSvUL
 eZXNhRoqWIg8zYXRh1nvaOGjRsv8gvYl4JFFzEyrUVilyO8+SZN5E8je4jbpHMakxsUj
 LKeHr+7sivpUcPE+AbgMnXox3E7GaK3v0FAufbghQ2/hwOf7Ujkgo4/1JXm+vEp01gKO
 jlUw==
X-Gm-Message-State: AOAM533svl2iG+YhynYO/4or6Vp6hRcSSI/+93a4fn0X8ASjtxjhi4gC
 vyYdycpDDfxRVNZlW+7QbRmEmZCyRGA=
X-Google-Smtp-Source: ABdhPJyLxRMWiYfiUMbLQXVGGiBme7Au4psQeeqEyX3U3lv0ESFB+G7UH0I5OycGPYBTbdb9vf2YSA==
X-Received: by 2002:aa7:d84a:: with SMTP id f10mr8044451eds.132.1634116054185; 
 Wed, 13 Oct 2021 02:07:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/40] qapi/misc-target: Wrap long 'SEV Attestation Report'
 long lines
Date: Wed, 13 Oct 2021 11:06:54 +0200
Message-Id: <20211013090728.309365-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Wrap long lines before 70 characters for legibility.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/misc-target.json | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 594fbd1577..ae5577e039 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -300,8 +300,8 @@
 ##
 # @SevAttestationReport:
 #
-# The struct describes attestation report for a Secure Encrypted Virtualization
-# feature.
+# The struct describes attestation report for a Secure Encrypted
+# Virtualization feature.
 #
 # @data:  guest attestation report (base64 encoded)
 #
@@ -315,10 +315,11 @@
 ##
 # @query-sev-attestation-report:
 #
-# This command is used to get the SEV attestation report, and is supported on AMD
-# X86 platforms only.
+# This command is used to get the SEV attestation report, and is
+# supported on AMD X86 platforms only.
 #
-# @mnonce: a random 16 bytes value encoded in base64 (it will be included in report)
+# @mnonce: a random 16 bytes value encoded in base64 (it will be
+#          included in report)
 #
 # Returns: SevAttestationReport objects.
 #
@@ -326,11 +327,13 @@
 #
 # Example:
 #
-# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
+# -> { "execute" : "query-sev-attestation-report",
+#                  "arguments": { "mnonce": "aaaaaaa" } }
 # <- { "return" : { "data": "aaaaaaaabbbddddd"} }
 #
 ##
-{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
+{ 'command': 'query-sev-attestation-report',
+  'data': { 'mnonce': 'str' },
   'returns': 'SevAttestationReport',
   'if': 'TARGET_I386' }
 
-- 
2.31.1




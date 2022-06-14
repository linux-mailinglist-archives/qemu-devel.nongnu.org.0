Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7554B52F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 17:58:07 +0200 (CEST)
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o18ve-0007Rq-UD
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 11:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o18sE-0005TF-RO
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 11:54:34 -0400
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81]:45442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o18sC-0002ik-NE
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 11:54:34 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 206409304
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:y0sO9q78GGgEXFr0YIz9yQxRtKzFchMFZxGqfqrLsTDasY5as4F+v
 jMYDGDUa62DNGv8e95+at+09EhU65KEyYJkSgRtqCswEysa+MHIO4+lIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DnWl/V4
 7senuWEULOb828sWo4rw//bwP9flKyaVOQw5wFWiVhj5TcyplFMZH4tDfjZw0jQG+G4KtWHq
 9Prl9lVyI94EyAFUbtJmp6jGqEDryW70QKm0xK6UID76vROS7BbPg/W+5PwZG8O4whlkeydx
 /1W6722FisRGpaSld0lfB5pF38mH/1vreqvzXiX6aR/zmXDenrohuxtVQQ4ZNxJvOlwBm5K+
 LoTLzVlghKr3brnhuLmDLM23IJ6fZiD0IA34xmMyRnQCeYgTYrrSbiM6NNFtNs1rpoWQ6qGN
 pFBNVKDajzbTCJzGFQyUKh5gf6MvkvRQhJTrUq88P9fD2/7iVYZPKLWGMPYf8HPSchLk0Kwo
 GXA8GLkRBYAO7SiJSGt93utgqrWnnq+VttDRfu38fllhFDVzWsWYPELaWaGTTCCohbWc7pix
 4Y8oULCcYBaGJSXc+TA
IronPort-HdrOrdr: A9a23:Qj+ymqmX9dgE9xYmy76nZ++PUc/pDfO3imdD5ihNYBxZY6Wkfp
 +V9sjzhCWetN9OYhkdcIi7SdC9qADnhOZICOgqTP6ftWzd1VdAQ7sSiLcKrwePJ8S6zJ866U
 4CSdk3NDSTNykfsS+S2mDVfOrIguP3l5xA7t2/854Zd3AJV0gW1XYbNu/0KCxLbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2TSIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjoqi+2eGRhuerNvb8xPT9GQ+cyzpAUb4RFIFq8gpF4N1Ho2xa6+
 Uk6y1QRfibrUmhNV1d6CGdpjXIwXIg7WTvxkSfhmamqcvlRCgiA84Eno5BdADFgnBQyO2U/Z
 g7rV5xjaAneC8oXR6NluTgRlVvjA65sHAimekcgzhWVpYfcqZYqcga8FlOGJkNESrm4MR/ed
 Meev309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw8TxdAZnH0H6JUhIqM0kN
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbWPGebMT3cZdI60rL22u7KCZkOlZ6XkcYzvecPcb
 z6IS1liVI=
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2022 11:54:22 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 j17-20020a05620a289100b006a6a4ffc9a3so7770064qkp.10
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BRniBuZ614k/WeHE/yvxoXu+074mFbM44ypq4UsWojk=;
 b=O07q5/kIaqNdZW7NRmekJ7m4plCICSJSl7VoH8uIkOWh2gnrD2+7bpn7+QPP6Z6jxH
 eIAW5XBo00vtzKXOL4vVh7lB34zcJxtVnctRSIVgmkzYy61Jrt6MP2nmJrwWftfKfp66
 ynETYvBsB0yXtDaTcNCEYTpX8utG6wK+m8GtK9QcOalG5ySbgRkhpyyVJkPVFfiSb6pt
 0mk3/l4yOXocLDKP+/9NHyn5RNmn6ZJFifH45cbXxv5ot2k4M8UuoD4vhdfiM3cp/c0u
 KK7i3W4Iagvd8VLzI5B5BmLyZooxHw5oxEKjmDLUMY+3DZAjj8EttMkSnyN1TZx32OI3
 uBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BRniBuZ614k/WeHE/yvxoXu+074mFbM44ypq4UsWojk=;
 b=l1iQxi7OlNejmVUK6doKX/3ao9o5qWuHkg1CgCKLoOU123YREo/p4dnKAGod6O9MEi
 x+BFE1GcKg6eGXE578Fokf9FJyoSLNCUd43NgGLTuekVlsaJ4smir39Lwk0RULiZhuUa
 VdHd8mQC5irkdAhu38AjHQISyWzzhi7fuo3bPwjembzAeLPeyJyjJ2L0Baqyt8QklCpR
 DX8JSuxNgQEnOon6g4KnJ/Pvxst0+LGKr20T9Ux52CBGAetTLfIo2vFutvvZszVB4CyB
 sNzeBsbEwlG50G+u+4uOocYJpo2yBxxaG7QPlRgEa+9em0qAnB/WzIwCLrZSDjOkIFP3
 hmmA==
X-Gm-Message-State: AJIora9SNX/8YExZYTQ3ekD1vPc4Ul96EXTufm5x2c82yxktBCCO98sl
 z9IHKo7vG+i+LIPFpOHJOlk+S/tTlZf180xqQWOKDekIA/OFZ8DGoYTFpkJKupq/iHmwFMBImNk
 P9DypmmIx4IgZdP/SvEp0KlKL/F+9Zw==
X-Received: by 2002:a05:6214:f02:b0:46a:6b5d:1a93 with SMTP id
 gw2-20020a0562140f0200b0046a6b5d1a93mr3989753qvb.75.1655222061223; 
 Tue, 14 Jun 2022 08:54:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sVey4CVsJsiVOw+S7VO1Hptb8EA/cXqrJMbfaEp7f00De80K2ZDWpe4jJilaYfWQ1/RRUOFA==
X-Received: by 2002:a05:6214:f02:b0:46a:6b5d:1a93 with SMTP id
 gw2-20020a0562140f0200b0046a6b5d1a93mr3989721qvb.75.1655222060617; 
 Tue, 14 Jun 2022 08:54:20 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05622a03ce00b00304eaca5e5csm7537500qtx.73.2022.06.14.08.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 08:54:20 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH] build: fix check for -fsanitize-coverage-allowlist
Date: Tue, 14 Jun 2022 11:54:15 -0400
Message-Id: <20220614155415.4023833-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The existing check has two problems:
1. Meson uses a private directory for the get_supported_arguments check.
./instrumentation-filter does not exist in that private directory (it is
copied into the root of the build-directory).

2. fsanitize-coverage-allowlist is unused when coverage instrumentation
is not configured. No instrumentation are passed for the
get_supported_arguments check

Thus the check always fails. To work around this, change the check to an
"if cc.compiles" check and provide /dev/null, instead of the real
filter.

Meson log:
Working directory:  build/meson-private/tmpl6wld2d9
Command line:  clang-13 -m64 -mcx16
build/meson-private/tmpl6wld2d9/output.obj -c -O3 -D_FILE_OFFSET_BITS=64
-O0 -Werror=implicit-function-declaration -Werror=unknown-warning-option
-Werror=unused-command-line-argument
-Werror=ignored-optimization-argument
-fsanitize-coverage-allowlist=instrumentation-filter

Error:
error: argument unused during compilation:
'-fsanitize-coverage-allowlist=instrumentation-filter'

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 meson.build | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 0c2e11ff07..85134267b5 100644
--- a/meson.build
+++ b/meson.build
@@ -209,9 +209,13 @@ if get_option('fuzzing')
   configure_file(output: 'instrumentation-filter',
                  input: 'scripts/oss-fuzz/instrumentation-filter-template',
                  copy: true)
-  add_global_arguments(
-      cc.get_supported_arguments('-fsanitize-coverage-allowlist=instrumentation-filter'),
-      native: false, language: ['c', 'cpp', 'objc'])
+
+  if cc.compiles('int main () { return 0; }',
+                  name: '-fsanitize-coverage-allowlist=/dev/null',
+                 args: ['-fsanitize-coverage-allowlist=/dev/null'] )
+    add_global_arguments('-fsanitize-coverage-allowlist=instrumentation-filter',
+                         native: false, language: ['c', 'cpp', 'objc'])
+  endif
 
   if get_option('fuzzing_engine') == ''
     # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
-- 
2.27.0



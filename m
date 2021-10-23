Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44B14384BF
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:43:09 +0200 (CEST)
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLz2-00040d-Rr
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnw-0005Gc-1Z; Sat, 23 Oct 2021 14:31:41 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnr-0006Zo-S0; Sat, 23 Oct 2021 14:31:39 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MAOeB-1mYcW01XqN-00BthL; Sat, 23
 Oct 2021 20:31:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] analyze-migration.py: fix extract contents ('-x') errors
Date: Sat, 23 Oct 2021 20:31:23 +0200
Message-Id: <20211023183123.813116-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CarLG2sdS3W7idOI9tEpAj1vPolrYUWKi5sgCd+ep0jBCVUjNGB
 jJ8jdY7NffvHY6iY7Mw3R0PNTQJn2vdFLy6s4bObMnjShrdzblgrWpmYVOSHvbnShIWAyyq
 KrMeM5Pu0SpuiOyDHyFGX3RAYxKU+ecMYBZXAoMq6PJQlRD8/tc2N8VzpDsLIorLbMICoER
 ZRBE+czLpcOT0ZBaEMd4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MMtDmQYFf9A=:g1EcDkUnbGVR+dCJjcsLe7
 ohKx5boA2wM7A9AUe0Jcbvm0fx4TEPHF4QOfL5N4J+WqJ0aUtMerstKWFdxDvYliTE3TaFBT5
 hN5h6IEgCC0ZYDTKtX/qGbKK6EMLVj/y1P0QaDlXYCaBZpUt428Nhq9BnzvZL9XDZXnq1qcjX
 M8Jjb9J9Ok5OHmdUtEv27BrLomAidZBS8B9M8W+JWkLqsNb2yyTt647mlRBekrvMCiMIn+Aki
 XMa+VjWeQgbbBLF/e+kyKvsh0J0zWuUnfSiH0oz9U6+dbFnFytLhG9aPXXXtRFl0uMw974/IL
 +Y5XtF/WvcQDKYDr0YEvM7+6a7cRYD5j+5rLI6fTtZnmt1qZ+DMhsBzGXSr3bo8n3MRzwI30D
 Ge4+1/tNjDnm2z/QE/+weHYJU86OzRf7qwXRtzPH7Mh94TJb/FH+3klOzPC15y07Rhx4ue3XI
 y7go1PH2G4XPc1F0e6klFKT0P+N4qGnN8dXsFf0LpeT+cIwHmeLR7I2veotZNOJMeytOw1hwb
 JbeA/U3SHtNhxBmR0/ZDXvx6aoxlARU1YvH8xrG9uC0umKWMDS2B4fUZywqOUzrpdTPt7ZvpE
 5yhUBoNWiPwlWDxy6aSjYBCWm/rNcTOEI3lXlX8TlU85jDpKXjHjFAufNfiG2Cse3IFDPpDNi
 oDKA+AJSw/eiqV/jfDBsJmu/mjr1xQYstfe+RejvKuhfTl+tUo8/MM2aym9KVJ2pgXiY=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

When we try to use 'analyze-migration.py -x' with python3,
we have the following errors:

  Traceback (most recent call last):
    File "scripts/analyze-migration.py", line 593, in <module>
      f.write(jsonenc.encode(dump.vmsd_desc))
  TypeError: a bytes-like object is required, not 'str'

  Traceback (most recent call last):
    File "scripts/analyze-migration.py", line 601, in <module>
      f.write(jsonenc.encode(dict))
  TypeError: a bytes-like object is required, not 'str'

This happens because the file 'f' is open in binary mode while
jsonenc.encode() returns a string.

The results are human-readable files, 'desc.json' and 'state.json',
so there is no reason to use the binary mode.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211015131645.501281-3-lvivier@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/analyze-migration.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index 9d239d309f33..b82a1b0c58c4 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -588,7 +588,7 @@ def default(self, o):
 
     dump.read(desc_only = True)
     print("desc.json")
-    f = open("desc.json", "wb")
+    f = open("desc.json", "w")
     f.truncate()
     f.write(jsonenc.encode(dump.vmsd_desc))
     f.close()
@@ -596,7 +596,7 @@ def default(self, o):
     dump.read(write_memory = True)
     dict = dump.getDict()
     print("state.json")
-    f = open("state.json", "wb")
+    f = open("state.json", "w")
     f.truncate()
     f.write(jsonenc.encode(dict))
     f.close()
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8DC977DB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 13:23:06 +0200 (CEST)
Received: from localhost ([::1]:47056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Ohl-0007aX-4l
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 07:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i0Of6-0004Yk-Kl
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 07:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i0Of5-0006PF-Dd
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 07:20:20 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:55335)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i0Of5-0006O9-4k; Wed, 21 Aug 2019 07:20:19 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M5x9B-1hu5G32Iah-007WCn; Wed, 21 Aug 2019 13:19:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:19:34 +0200
Message-Id: <20190821111947.26580-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
References: <20190821111947.26580-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Dyz+FTs9M8yBZRNT0UZg9ivzFx4vuRw06ZKO9VJlZ/dglEzp+nD
 Ab6JZqBAuH0/2F1MlsyE1niOH2DIDCwpyj2G8czG4uSn8MF8C6d/1KRQ1PiKlPJUIyi1e6Z
 FhtA/+2m2npGlGb5r0JRBQxxMGRBoMco1Gs/MLaEt+hjX7opVGETJDHfaGpd1wEnHPIElY+
 KQP/2WLuQbt5chpVq/G/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vKlawgQCwrk=:5TEchVoecxcoa6h/lj0huH
 82xQFN/YSJDGekkJTMb+RLmTcizyy5JR8+84NEHMYgTI6/IyaHDqTYmr/Xh6aa5KoX9UCeKhz
 CrgYgoLZAcyxiZeANMq9PGH0wugqkqkrZB6SDyAGDpVciSug3tQrNc8DA0t1wuzmfR9JpB+92
 oZAem9vrduHCIoR7HVuLtQR+4kD+W03AdSDYMsTsnWRvIG6T36c3v59UVHMq9Ca065uZwiYOJ
 IGY00hAIYK4jbw18pKz6sTmV6+2CA9kPYJgF8SzMLwdx/gAOcAXstHTkJ9vgJRF4qeQkeygJq
 rA889WbSLP17MudScFQkpOQwXPrXSkfnyR4eqg9PBu3wHigtgOBSZB1+JNP8qghZmENCC46gq
 wCzUtlzItoLu9/vFj1MSx/tulayl00dZSF0BKghTVyBPlD1PqSBxDkMYDni4rAnH120VyFc/s
 oQxtDWsEypHvsC81/kI/GMYWwG4uHHL74bspH+FA1PdmPqOFsLEAgEBMWmbAp5rQuSewDvwWS
 T/Y8VDIQme3urz0nE3TMMTkGuDvRadXiB2RRIVy0aeDJq+C0dZkgtc9i/zg6VyFa95NcT+ewL
 g/RoOWmdAtAfK8viWyio1zDRII3t2YmFMIuUUvR/qYrMVC15aWbXxClN/4/OZaQZhQIQStB5C
 zAKON4TdP8AQRjqIzesFheajewO3gLhoGqFZAxTD6A8BZWsBXEJTY10+cf5TZtzhi0CRiX1yc
 pa6zRfzGcAsAVcJeOAK60ZQXx62C6EQSnHJGlw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-devel] [PULL 01/14] test: Use g_strndup instead of plain
 strndup
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, "tony.nguyen@bt.com" <tony.nguyen@bt.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "tony.nguyen@bt.com" <tony.nguyen@bt.com>

Due to memory management rules. See HACKING.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>

Message-Id: <dce313b46d294ada8826d34609a3447e@tpw09926dag18e.domain1.systemhost.net>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/check-qjson.c      | 2 +-
 tests/migration/stress.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index fa2afccb0a24..07a773e6530b 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -767,7 +767,7 @@ static void utf8_string(void)
                     if (*end == ' ') {
                         end++;
                     }
-                    in = strndup(tail, end - tail);
+                    in = g_strndup(tail, end - tail);
                     str = from_json_str(in, j, NULL);
                     g_assert(!str);
                     g_free(in);
diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index 49a03aab7b83..d9aa4afe928b 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -104,9 +104,9 @@ static int get_command_arg_str(const char *name,
     }
 
     if (end)
-        *val = strndup(start, end - start);
+        *val = g_strndup(start, end - start);
     else
-        *val = strdup(start);
+        *val = g_strdup(start);
     return 1;
 }
 
@@ -126,10 +126,10 @@ static int get_command_arg_ull(const char *name,
     if (errno || *end) {
         fprintf(stderr, "%s (%05d): ERROR: cannot parse %s value %s\n",
                 argv0, gettid(), name, valstr);
-        free(valstr);
+        g_free(valstr);
         return -1;
     }
-    free(valstr);
+    g_free(valstr);
     return 0;
 }
 
-- 
2.21.0



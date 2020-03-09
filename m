Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0212B17E3A0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 16:29:38 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBKLY-00032D-OW
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 11:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK37-0000Xt-AL
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK35-0008Aw-Qs
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:10:33 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55661)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2w-00080n-85; Mon, 09 Mar 2020 11:10:22 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N3bb3-1jJxBL1GF9-010a8L; Mon, 09 Mar 2020 16:09:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/33] hw/hppa/machine: Include "net/net.h"
Date: Mon,  9 Mar 2020 16:08:20 +0100
Message-Id: <20200309150837.3193387-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MPGPHjvrWrdssREGZDVoZoVrd73jIw1m3oj0biUTv8d+aJFuRkj
 rovYptmQLlybR3QtYGKPpX9Y9rJhygQx9ZdOzUXOI1AmVHh98pGIX38wKzRT6TmqZvqMs9U
 j0eXKwFTXefiYkV04vGrNZvfw1QlrsCt7sR96JWBEdU53VOlkb2kHr54MmODXWhLk/PgLL2
 m722h1UJfEb52ipcrKJYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ldie3iEqQ94=:Qb+p9BgwIF0Dttg3FBut/7
 etrGFk0fngaGrTOxJhQId/D7B4iqKXWOrle/WnxFieIQrgp+hOXUpKEkjUAbQJRP/L4ZrzmMl
 sJo2qjyx32a8+/JZVy+F2CSdbomtu6ca6e93Rut1/+LcjAauaUSXITHKYXo9AC86RxpLJ6Xoo
 hwZSpBF52pyrugY8sRv4l3TQQIGt9Q4eOYBemhqU/64HWAARi7e0wX/gSZrisa8iVJTzWyqK9
 3ttbqcnboZnQF69ZfpZdpa2J2DmOAGv0+NdYjarptpexTBWtiubTC7U1FMbihMQOqZKWGxRER
 hH+BOquwoBBBl4tSHUukhhjbnN5L0zl79Fvw6TXFYBstqc584rF0MIkxeBjs6o8nUUENOitcm
 fHzATEcS/3pYnhiLW5OLHrahUCko7I4Lwn0407qlD1J81rLs18HWbMm9Z3PMEOUJrEhjR++Dk
 j83v6bTJE/86hkB8rMdyN8N+YWzmINgzudjlkkzW8j0W2EOhy3B8tFBqDJhyrIiwfl2kshq29
 Pt05ocQCGqmqi+HpVdDB8uF8Gsu4X3/UqazacRmQkCz3ZOHa9D2ixiDeXU63Yz6LnWE/nuLMj
 pcvftQnE6IffAsTNcLnHxwU16XgW6MmLCaSTIP80X/NQv67xykiVEIAq0wAW6Q5DThBsKjQiN
 p9yfM8OzPdETG0thmMfpRQvyxwdu5YPmsxxMLf9NNKF2bLTmMF76E+SHlLYv4ERgoO+AfiGgP
 ej20EYfq7h6zg1w0C9K7FoT6mzeSCLp4UZGp4G6zmT2f19Nsauck5Hrswsh8BIpwWoBQFWEmP
 JAg/QkzjG8TpRl2J1M65v6B77z+V+dQz9Qd7sC5DfW/LVDfGQsfb2TDNkPkjal0N+mpoFCy
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

hw/hppa/machine.c uses NICInfo variables which are declared in
"net/net.h". Include it.

This fixes (when modifying unrelated headers):

  hw/hppa/machine.c:126:21: error: use of undeclared identifier 'nb_nics'
      for (i = 0; i < nb_nics; i++) {
                      ^
  hw/hppa/machine.c:127:30: error: use of undeclared identifier 'nd_table'
          pci_nic_init_nofail(&nd_table[i], pci_bus, "e1000", NULL);
                               ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-10-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/hppa/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index bf18767e2494..9175f4b790f5 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "net/net.h"
 #include "qemu/log.h"
+#include "net/net.h"
 
 #define MAX_IDE_BUS 2
 
-- 
2.24.1



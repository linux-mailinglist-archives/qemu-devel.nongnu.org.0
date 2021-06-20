Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE75D3AE02D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 22:17:13 +0200 (CEST)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv3sW-0002SN-R9
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 16:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1lv3rE-0001ba-28
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 16:15:52 -0400
Received: from smtp.lg.ehu.es ([158.227.0.66]:15790 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1lv3rA-0000np-Oo
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 16:15:50 -0400
Received: from imsva2.lgp.ehu.es (imsva2.lgp.ehu.es [10.0.3.246])
 by postfix.smtp1.imsva1 (Postfix) with ESMTPS id 242C1183FFB;
 Sun, 20 Jun 2021 22:15:36 +0200 (CEST)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD0265A04F;
 Sun, 20 Jun 2021 22:15:35 +0200 (CEST)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1A205A045;
 Sun, 20 Jun 2021 22:15:35 +0200 (CEST)
Received: from smtp.ehu.eus (unknown [10.0.100.79])
 by imsva2.lgp.ehu.es (Postfix) with ESMTPS;
 Sun, 20 Jun 2021 22:15:35 +0200 (CEST)
Received: from c22643ce596e (unknown [93.115.202.211])
 by smtp-2 (Postfix) with ESMTPSA id 2D582183FFB;
 Sun, 20 Jun 2021 22:15:34 +0200 (CEST)
Date: Sun, 20 Jun 2021 20:15:25 +0000
From: umarcor <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: qemu-binfmt-conf.sh: enforce style consistency
Message-ID: <20210620201509.GA9@c22643ce596e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: ACL 200 matched, not delayed by milter-greylist-4.6.2 (smtp-2
 [10.0.100.79]); Sun, 20 Jun 2021 22:15:35 +0200 (CEST)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.6.0.1013-26232.002
X-TM-AS-Result: No-3.259-7.0-31-10
X-imss-scan-details: No-3.259-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.6.1013-26232.002
X-TMASE-Result: 10-3.258700-10.000000
X-TMASE-MatchedRID: ehvrJQ9m4PA8mRT0SYY6fhIRh9wkXSlFW1eClGWYNygHZBaLwEXlKHch
 tJI6MELj0tx5yJ6Gw/qpCdxEtHSD96heHRKIaMTMlchF+IvkllMjbj0krjlpbft9kl8N0IhcdCI
 Zl7SNYAyOpJMltluhQyQLkBm/aHTAqI4fCVjNwZx79ecN/UvAEewlOGZoQVV0lhoZR16K112/35
 G8ZJR1gL9p0+NmFAkoX/2hCeJrRE9ccQ8eam5Eff7E6GNqs6ceXrupZTqDOwZ5w0EauQomR46HM
 5rqDwqtU1j5qwevKrCOZgNLeCPTfU2YkgZfX6RIe6uoHd6wf5Ja4qjvpAjNn9niVNUwqc0jb3FL
 PqctkkqI5KjM2Ghaf/dZLmhDPlAcK3Ek+KkQM4zmzj3HTjdouUc/AFp917cRrOvT9wALXjAF64g
 MSa2c/g==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp1.imsva1 [10.0.100.79]);
 Sun, 20 Jun 2021 22:15:36 +0200 (CEST)
Received-SPF: pass client-ip=158.227.0.66;
 envelope-from=unai.martinezcorral@ehu.eus; helo=smtp.ehu.eus
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: riku.voipio@iki.fi, eblake@redhat.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spaces are removed before '; then', for consistency with other scripts
in the project.

Signed-off-by: umarcor <unai.martinezcorral@ehu.eus>
---
 scripts/qemu-binfmt-conf.sh | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 7de996d536..13bff41b47 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -221,7 +221,7 @@ EOF
 }

 qemu_check_access() {
-    if [ ! -w "$1" ] ; then
+    if [ ! -w "$1" ]; then
         echo "ERROR: cannot write to $1" 1>&2
         exit 1
     fi
@@ -230,12 +230,12 @@ qemu_check_access() {
 qemu_check_bintfmt_misc() {
     # load the binfmt_misc module
     if [ ! -d /proc/sys/fs/binfmt_misc ]; then
-      if ! /sbin/modprobe binfmt_misc ; then
+      if ! /sbin/modprobe binfmt_misc; then
           exit 1
       fi
     fi
     if [ ! -f /proc/sys/fs/binfmt_misc/register ]; then
-      if ! mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc ; then
+      if ! mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc; then
           exit 1
       fi
     fi
@@ -248,16 +248,16 @@ installed_dpkg() {
 }

 qemu_check_debian() {
-    if [ ! -e /etc/debian_version ] ; then
+    if [ ! -e /etc/debian_version ]; then
         echo "WARNING: your system is not a Debian based distro" 1>&2
-    elif ! installed_dpkg binfmt-support ; then
+    elif ! installed_dpkg binfmt-support; then
         echo "WARNING: package binfmt-support is needed" 1>&2
     fi
     qemu_check_access "$EXPORTDIR"
 }

 qemu_check_systemd() {
-    if ! systemctl -q is-enabled systemd-binfmt.service ; then
+    if ! systemctl -q is-enabled systemd-binfmt.service; then
         echo "WARNING: systemd-binfmt.service is missing or disabled" 1>&2
     fi
     qemu_check_access "$EXPORTDIR"
@@ -265,13 +265,13 @@ qemu_check_systemd() {

 qemu_generate_register() {
     flags=""
-    if [ "$CREDENTIAL" = "yes" ] ; then
+    if [ "$CREDENTIAL" = "yes" ]; then
         flags="OC"
     fi
-    if [ "$PERSISTENT" = "yes" ] ; then
+    if [ "$PERSISTENT" = "yes" ]; then
         flags="${flags}F"
     fi
-    if [ "$PRESERVE_ARG0" = "yes" ] ; then
+    if [ "$PRESERVE_ARG0" = "yes" ]; then
         flags="${flags}P"
     fi

@@ -306,23 +306,23 @@ qemu_set_binfmts() {

     # register the interpreter for each cpu except for the native one

-    for cpu in ${qemu_target_list} ; do
+    for cpu in ${qemu_target_list}; do
         magic=$(eval echo \$${cpu}_magic)
         mask=$(eval echo \$${cpu}_mask)
         family=$(eval echo \$${cpu}_family)

-        if [ "$magic" = "" ] || [ "$mask" = "" ] || [ "$family" = "" ] ; then
+        if [ "$magic" = "" ] || [ "$mask" = "" ] || [ "$family" = "" ]; then
             echo "INTERNAL ERROR: unknown cpu $cpu" 1>&2
             continue
         fi

         qemu="$QEMU_PATH/qemu-$cpu"
-        if [ "$cpu" = "i486" ] ; then
+        if [ "$cpu" = "i486" ]; then
             qemu="$QEMU_PATH/qemu-i386"
         fi

         qemu="$qemu$QEMU_SUFFIX"
-        if [ "$host_family" != "$family" ] ; then
+        if [ "$host_family" != "$family" ]; then
             $BINFMT_SET
         fi
     done
@@ -343,7 +343,7 @@ QEMU_SUFFIX=""
 options=$(getopt -o ds:Q:S:e:hc:p:g: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
 eval set -- "$options"

-while true ; do
+while true; do
     case "$1" in
     -d|--debian)
         CHECK=qemu_check_debian
@@ -356,14 +356,14 @@ while true ; do
         EXPORTDIR=${EXPORTDIR:-$SYSTEMDDIR}
         shift
         # check given cpu is in the supported CPU list
-        if [ "$1" != "ALL" ] ; then
-            for cpu in ${qemu_target_list} ; do
-                if [ "$cpu" = "$1" ] ; then
+        if [ "$1" != "ALL" ]; then
+            for cpu in ${qemu_target_list}; do
+                if [ "$cpu" = "$1" ]; then
                     break
                 fi
             done

-            if [ "$cpu" = "$1" ] ; then
+            if [ "$cpu" = "$1" ]; then
                 qemu_target_list="$1"
             else
                 echo "ERROR: unknown CPU \"$1\"" 1>&2
--
2.32.0



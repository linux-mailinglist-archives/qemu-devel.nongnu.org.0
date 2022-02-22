Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D74BFE52
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:19:06 +0100 (CET)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXsW-0002B0-Hb
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:19:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXq8-0007y3-H4; Tue, 22 Feb 2022 11:16:36 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:53079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXq6-0005Y3-OS; Tue, 22 Feb 2022 11:16:36 -0500
Received: from quad ([82.142.17.50]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N0nOF-1o7mrm1QUn-00wpmZ; Tue, 22
 Feb 2022 17:16:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] configure: Disable capstone and slirp in the
 --without-default-features mode
Date: Tue, 22 Feb 2022 17:16:18 +0100
Message-Id: <20220222161624.382218-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222161624.382218-1-laurent@vivier.eu>
References: <20220222161624.382218-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jmiTSf0P/ZR2i25ZYJVT5r+IhDLNzMuFV+yrUmRkkmJAIoJ01nO
 C5W0hSdwu43PbJctNt7yjvm8eN+IBflsyfkAWSCz+xAXDY1oJjO7ALI5ugat2E1GUBRzu0B
 vWUk0GPL2T0eIuk19joHWl1erCKlb78mtAuBpUUBc1tXrrFOGnXsTevYpGVZvgZxAhS0qcf
 VslxWW3YLEprh2wdKpVEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2hJqmHtnbFk=:W5YJ4YAvU3LvPWOhFCl2QO
 iaEHRX19T57IA/pIGF+usD3Wa4Bp8BTBxOAEGQTdKfUF4fqhpGszG8O0KBRu061zOuUkQ5fmN
 cKUkpeG7VszAhGCKTtarHhWwV4od+bg3zmKc+x4AHU0rBS1pG5meK7sdQsH6q6W3vSxn1Chdz
 T1djLgAnXkzZ1KEztVqjw1ciohApntV0wj0BvlS84u2lvhXkq2RTHI6RNDi+ehol6HMEsJZqN
 wljxs2XTla9FqxGIQptqGyetXVnx1Hi4lLd9QNVyR9ezV2PNLZQTyO9v4hWeNLBukwkCB7SdT
 x77KeVwhLnd4/8+7fF5lp1IGGZJQXfM9DrQ2NfVeEJ46VU8QneEHOSJa5yoTNCpWv1Ql2G85A
 da6BqFWI1PKxgJt0eELD6fw7ArN4Y484wvy06WoqnLCxCi4GSiuo14o7O9uq8mulPW8Z5ox3A
 jdxSiFFvPvj4LhKuJWTEdgBLp4lj4Y2ZQC0O+J+XwzX6EltzJNQwmyo8NmcQ9a7as1KvjwrL4
 //Y7l5XRNIgxB73y43lixZv4SnvJzFUSGBDlfsi6VTHQer9SJJZumDZ6IfI2Qass6l12soJQx
 LdxR1yQzDzePN2ouYekqJ4e9sDGqWOPeOGIZ48yakAADVNb7BBjPk/cME8YKJXLlig//Nf6ey
 eWRLe3Uc22nlQVNNUfkW08mQrpscIKvP4QZej2j1N1/btqJhPejXyXakW+HTX+lF8Mgg=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

For the users, it looks a little bit weird that capstone and slirp are
not disabled automatically if they run the configure script with the
"--without-default-features" option, so let's do that now.
Note: fdt is *not* changed accordingly since this affects the targets
that we can build, so disabling fdt automatically here might have
unexpected side-effects for the users.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220221090647.150184-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 3a29eff5cc16..36d10d95bba8 100755
--- a/configure
+++ b/configure
@@ -361,9 +361,14 @@ slirp_smbd="$default_feature"
 # are included in the automatically generated help message)
 
 # 1. Track which submodules are needed
-capstone="auto"
+if test "$default_feature" = no ; then
+  capstone="disabled"
+  slirp="disabled"
+else
+  capstone="auto"
+  slirp="auto"
+fi
 fdt="auto"
-slirp="auto"
 
 # 2. Support --with/--without option
 default_devices="true"
-- 
2.35.1



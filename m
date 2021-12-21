Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A7647C13A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:14:10 +0100 (CET)
Received: from localhost ([::1]:52696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzfu5-0004e5-Aj
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:14:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1mzZUr-0006yd-11
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:23:43 -0500
Received: from mail-108-mta230.mxroute.com ([136.175.108.230]:35733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1mzZUp-00043W-5d
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:23:40 -0500
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta230.mxroute.com (ZoneMTA) with ESMTPSA id
 17ddbdb27c6000b7bf.001 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Tue, 21 Dec 2021 07:18:32 +0000
X-Zone-Loop: 632ee66f56a16adbc2c969139e97e5e16519ce7a87fb
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cNpOR7Fge87sOcn1JvgK6Wat4jnispgRDdBKTnaBGuw=; b=MyaLULiOXVpN29cz9wGsRSmHlM
 82X+QtbHlUVcT+NF5aRyxiTxumEKmcGcee37otlElMwFmvH1ocOkxNBraRlxNa+t/QG1fyoqW5ibp
 Xas9uOs8wTWEDMnUUcLYwUdluufocRbo2kDAwdkrYqsBdy0NCPpbd/A8KLzwwBkSmYQg+d5U2Hw2m
 hyGhXubF6eo+CAaEgOrWhVZJYc+eJYogJzw/Yietp5t1ywa6xZFtY9zSyBHhFPg0nflp++Zslm2/2
 h7G0daFT/kNX5eDjV0l68+GSMNWylonY/YG7ZfB1WjY0HgbBmtyRRtq0k5ZXyUG6RwnE/gZvYtusH
 Fs3fL47w==;
From: MkfsSion <mkfssion@mkfssion.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: Add -set options to device opts dict when using JSON
 syntax for -device
Date: Tue, 21 Dec 2021 15:18:18 +0800
Message-Id: <20211221071818.34731-1-mkfssion@mkfssion.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: mkfssion@mkfssion.com
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=5, required=15, tests=[ARC_NA=0,
 MID_CONTAINS_FROM=1, FROM_HAS_DN=0, RCPT_COUNT_THREE=0, TO_DN_SOME=0,
 R_MISSING_CHARSET=2.5, RCVD_COUNT_ZERO=0, FROM_EQ_ENVFROM=0, MIME_TRACE=0,
 BROKEN_CONTENT_TYPE=1.5, NEURAL_SPAM=0]
Received-SPF: pass client-ip=136.175.108.230;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta230.mxroute.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Dec 2021 09:11:50 -0500
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, MkfsSion <mkfssion@mkfssion.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using JSON syntax for -device, -set option can not find device
specified in JSON by id field. The following commandline is an example:

$ qemu-system-x86_64 -device '{"id":"foo"}' -set device.foo.bar=1
qemu-system-x86_64: -set device.foo.bar=1: there is no device "foo" defined

The patch adds -set options to JSON device opts dict for adding
options to device by latter object_set_properties_from_keyval call.

Signed-off-by: YuanYang Meng <mkfssion@mkfssion.com>
---
 include/qemu/option.h |  4 ++++
 softmmu/vl.c          | 28 ++++++++++++++++++++++++++++
 util/qemu-option.c    |  2 +-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index 306bf07575..31fa9fdc25 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -45,6 +45,10 @@ const char *get_opt_value(const char *p, char **value);
 
 bool parse_option_size(const char *name, const char *value,
                        uint64_t *ret, Error **errp);
+
+bool parse_option_number(const char *name, const char *value,
+                         uint64_t *ret, Error **errp);
+
 bool has_help_option(const char *param);
 
 enum QemuOptType {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 620a1f1367..feb3c49a65 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -30,7 +30,9 @@
 #include "hw/qdev-properties.h"
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
 #include "qapi/qmp/qjson.h"
 #include "qemu-version.h"
@@ -2279,6 +2281,7 @@ static void qemu_set_option(const char *str, Error **errp)
     char group[64], id[64], arg[64];
     QemuOptsList *list;
     QemuOpts *opts;
+    DeviceOption *opt;
     int rc, offset;
 
     rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
@@ -2294,6 +2297,31 @@ static void qemu_set_option(const char *str, Error **errp)
         if (list) {
             opts = qemu_opts_find(list, id);
             if (!opts) {
+                QTAILQ_FOREACH(opt, &device_opts, next) {
+                    const char *device_id = qdict_get_try_str(opt->opts, "id");
+                    if (device_id && (strcmp(device_id, id) == 0)) {
+                        if (qdict_get(opt->opts, arg)) {
+                            qdict_del(opt->opts, arg);
+                        }
+                        const char *value = str + offset + 1;
+                        QObject *obj = NULL;
+                        bool boolean;
+                        uint64_t num;
+                        if (qapi_bool_parse(arg, value, &boolean, NULL)) {
+                            obj = QOBJECT(qbool_from_bool(boolean));
+                        } else if (parse_option_number(arg, value, &num, NULL)) {
+                            obj = QOBJECT(qnum_from_uint(num));
+                        } else if (parse_option_size(arg, value, &num, NULL)) {
+                            obj = QOBJECT(qnum_from_uint(num));
+                        } else {
+                            obj = QOBJECT(qstring_from_str(value));
+                        }
+                        if (obj) {
+                            qdict_put_obj(opt->opts, arg, obj);
+                            return;
+                        }
+                    }
+                }
                 error_setg(errp, "there is no %s \"%s\" defined", group, id);
                 return;
             }
diff --git a/util/qemu-option.c b/util/qemu-option.c
index eedd08929b..b2427cba9f 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -88,7 +88,7 @@ const char *get_opt_value(const char *p, char **value)
     return offset;
 }
 
-static bool parse_option_number(const char *name, const char *value,
+bool parse_option_number(const char *name, const char *value,
                                 uint64_t *ret, Error **errp)
 {
     uint64_t number;
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B39165BA2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 11:36:14 +0100 (CET)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4jBl-0007hP-VH
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 05:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <darren.kenny@oracle.com>) id 1j4jAt-0006tz-Cd
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 05:35:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <darren.kenny@oracle.com>) id 1j4jAr-0001NX-Ap
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 05:35:19 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:46704)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <darren.kenny@oracle.com>)
 id 1j4jAr-0001NN-1s
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 05:35:17 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01KAWJe8038026;
 Thu, 20 Feb 2020 10:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=MFGHSTltpcOCVLcEFsyDm0BmAIYMlZX+44Y0WZd9tHw=;
 b=oTO5Bwgymip5iIPc3DoFcMS5T04omuJ6WX6oOI2omNm8auE3Lkryyy/DZ0EJqx4MwjZK
 ZSqGPTaNrRt2QkQKMz4yPS2/2yB8Zpp+RVZYF0m720R9GyH8BiEHJMwTxjxo+ka6tQGM
 w3ZhlX1ykZjxCVm9H6YC69HvsVpf9CALxkHrJr3n6t9ss7WkknpCoN6pRtPCktxnRMuF
 KYziucu9R10anN9nnICjdWLLF+vwc+Ll0VOvzZw/aoTyt5ZxYxSBlQbWyFZeerG99wXf
 9i+rKBtFZc+VV5/BVPbqOc76Hf6HGQ07FdlR1VnU3+EfblfcbPtQSvoB83DwBfo+jHMy Mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2y8ud18v03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 10:35:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01KAS01Y193335;
 Thu, 20 Feb 2020 10:35:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2y8ud5napm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 10:35:14 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01KAZD8u030333;
 Thu, 20 Feb 2020 10:35:13 GMT
Received: from starbug-mbp.localdomain (/10.169.111.17)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 20 Feb 2020 02:35:13 -0800
Received: from starbug-mbp (localhost [127.0.0.1])
 by starbug-mbp.localdomain (Postfix) with SMTP id B684F59EB473;
 Thu, 20 Feb 2020 10:35:10 +0000 (GMT)
Date: Thu, 20 Feb 2020 10:35:10 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v10 16/22] fuzz: add support for qos-assisted fuzz targets
Message-ID: <20200220103510.cidqn4qqovpaycvl@starbug-mbp>
Mail-Followup-To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 bsd@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20200220041118.23264-1-alxndr@bu.edu>
 <20200220041118.23264-17-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20200220041118.23264-17-alxndr@bu.edu>
User-Agent: NeoMutt/20180716
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9536
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=2 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002200076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9536
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 suspectscore=2 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002200076
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 19, 2020 at 11:11:12PM -0500, Alexander Bulekov wrote:
>Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

>---
> tests/qtest/fuzz/Makefile.include |   2 +
> tests/qtest/fuzz/qos_fuzz.c       | 234 ++++++++++++++++++++++++++++++
> tests/qtest/fuzz/qos_fuzz.h       |  33 +++++
> 3 files changed, 269 insertions(+)
> create mode 100644 tests/qtest/fuzz/qos_fuzz.c
> create mode 100644 tests/qtest/fuzz/qos_fuzz.h
>
>diff --git a/tests/qtest/fuzz/Makefile.include b/tests/qtest/fuzz/Makefile.include
>index a90915d56d..e3bdd33ff4 100644
>--- a/tests/qtest/fuzz/Makefile.include
>+++ b/tests/qtest/fuzz/Makefile.include
>@@ -1,8 +1,10 @@
> QEMU_PROG_FUZZ=qemu-fuzz-$(TARGET_NAME)$(EXESUF)
>
> fuzz-obj-y += tests/qtest/libqtest.o
>+fuzz-obj-y += $(libqos-obj-y)
> fuzz-obj-y += tests/qtest/fuzz/fuzz.o # Fuzzer skeleton
> fuzz-obj-y += tests/qtest/fuzz/fork_fuzz.o
>+fuzz-obj-y += tests/qtest/fuzz/qos_fuzz.o
>
> FUZZ_CFLAGS += -I$(SRC_PATH)/tests -I$(SRC_PATH)/tests/qtest
>
>diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
>new file mode 100644
>index 0000000000..bbb17470ff
>--- /dev/null
>+++ b/tests/qtest/fuzz/qos_fuzz.c
>@@ -0,0 +1,234 @@
>+/*
>+ * QOS-assisted fuzzing helpers
>+ *
>+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
>+ *
>+ * This library is free software; you can redistribute it and/or
>+ * modify it under the terms of the GNU Lesser General Public
>+ * License version 2 as published by the Free Software Foundation.
>+ *
>+ * This library is distributed in the hope that it will be useful,
>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>+ * Lesser General Public License for more details.
>+ *
>+ * You should have received a copy of the GNU Lesser General Public
>+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
>+ */
>+
>+#include "qemu/osdep.h"
>+#include "qemu/units.h"
>+#include "qapi/error.h"
>+#include "qemu-common.h"
>+#include "exec/memory.h"
>+#include "exec/address-spaces.h"
>+#include "sysemu/sysemu.h"
>+#include "qemu/main-loop.h"
>+
>+#include "tests/qtest/libqtest.h"
>+#include "tests/qtest/libqos/malloc.h"
>+#include "tests/qtest/libqos/qgraph.h"
>+#include "tests/qtest/libqos/qgraph_internal.h"
>+#include "tests/qtest/libqos/qos_external.h"
>+
>+#include "fuzz.h"
>+#include "qos_fuzz.h"
>+
>+#include "qapi/qapi-commands-machine.h"
>+#include "qapi/qapi-commands-qom.h"
>+#include "qapi/qmp/qlist.h"
>+
>+
>+void *fuzz_qos_obj;
>+QGuestAllocator *fuzz_qos_alloc;
>+
>+static const char *fuzz_target_name;
>+static char **fuzz_path_vec;
>+
>+/*
>+ * Replaced the qmp commands with direct qmp_marshal calls.
>+ * Probably there is a better way to do this
>+ */
>+static void qos_set_machines_devices_available(void)
>+{
>+    QDict *req = qdict_new();
>+    QObject *response;
>+    QDict *args = qdict_new();
>+    QList *lst;
>+    Error *err = NULL;
>+
>+    qmp_marshal_query_machines(NULL, &response, &err);
>+    assert(!err);
>+    lst = qobject_to(QList, response);
>+    apply_to_qlist(lst, true);
>+
>+    qobject_unref(response);
>+
>+
>+    qdict_put_str(req, "execute", "qom-list-types");
>+    qdict_put_str(args, "implements", "device");
>+    qdict_put_bool(args, "abstract", true);
>+    qdict_put_obj(req, "arguments", (QObject *) args);
>+
>+    qmp_marshal_qom_list_types(args, &response, &err);
>+    assert(!err);
>+    lst = qobject_to(QList, response);
>+    apply_to_qlist(lst, false);
>+    qobject_unref(response);
>+    qobject_unref(req);
>+}
>+
>+static char **current_path;
>+
>+void *qos_allocate_objects(QTestState *qts, QGuestAllocator **p_alloc)
>+{
>+    return allocate_objects(qts, current_path + 1, p_alloc);
>+}
>+
>+static const char *qos_build_main_args(void)
>+{
>+    char **path = fuzz_path_vec;
>+    QOSGraphNode *test_node;
>+    GString *cmd_line = g_string_new(path[0]);
>+    void *test_arg;
>+
>+    if (!path) {
>+        fprintf(stderr, "QOS Path not found\n");
>+        abort();
>+    }
>+
>+    /* Before test */
>+    current_path = path;
>+    test_node = qos_graph_get_node(path[(g_strv_length(path) - 1)]);
>+    test_arg = test_node->u.test.arg;
>+    if (test_node->u.test.before) {
>+        test_arg = test_node->u.test.before(cmd_line, test_arg);
>+    }
>+    /* Prepend the arguments that we need */
>+    g_string_prepend(cmd_line,
>+            TARGET_NAME " -display none -machine accel=qtest -m 64 ");
>+    return cmd_line->str;
>+}
>+
>+/*
>+ * This function is largely a copy of qos-test.c:walk_path. Since walk_path
>+ * is itself a callback, its a little annoying to add another argument/layer of
>+ * indirection
>+ */
>+static void walk_path(QOSGraphNode *orig_path, int len)
>+{
>+    QOSGraphNode *path;
>+    QOSGraphEdge *edge;
>+
>+    /* etype set to QEDGE_CONSUMED_BY so that machine can add to the command line */
>+    QOSEdgeType etype = QEDGE_CONSUMED_BY;
>+
>+    /* twice QOS_PATH_MAX_ELEMENT_SIZE since each edge can have its arg */
>+    char **path_vec = g_new0(char *, (QOS_PATH_MAX_ELEMENT_SIZE * 2));
>+    int path_vec_size = 0;
>+
>+    char *after_cmd, *before_cmd, *after_device;
>+    GString *after_device_str = g_string_new("");
>+    char *node_name = orig_path->name, *path_str;
>+
>+    GString *cmd_line = g_string_new("");
>+    GString *cmd_line2 = g_string_new("");
>+
>+    path = qos_graph_get_node(node_name); /* root */
>+    node_name = qos_graph_edge_get_dest(path->path_edge); /* machine name */
>+
>+    path_vec[path_vec_size++] = node_name;
>+    path_vec[path_vec_size++] = qos_get_machine_type(node_name);
>+
>+    for (;;) {
>+        path = qos_graph_get_node(node_name);
>+        if (!path->path_edge) {
>+            break;
>+        }
>+
>+        node_name = qos_graph_edge_get_dest(path->path_edge);
>+
>+        /* append node command line + previous edge command line */
>+        if (path->command_line && etype == QEDGE_CONSUMED_BY) {
>+            g_string_append(cmd_line, path->command_line);
>+            g_string_append(cmd_line, after_device_str->str);
>+            g_string_truncate(after_device_str, 0);
>+        }
>+
>+        path_vec[path_vec_size++] = qos_graph_edge_get_name(path->path_edge);
>+        /* detect if edge has command line args */
>+        after_cmd = qos_graph_edge_get_after_cmd_line(path->path_edge);
>+        after_device = qos_graph_edge_get_extra_device_opts(path->path_edge);
>+        before_cmd = qos_graph_edge_get_before_cmd_line(path->path_edge);
>+        edge = qos_graph_get_edge(path->name, node_name);
>+        etype = qos_graph_edge_get_type(edge);
>+
>+        if (before_cmd) {
>+            g_string_append(cmd_line, before_cmd);
>+        }
>+        if (after_cmd) {
>+            g_string_append(cmd_line2, after_cmd);
>+        }
>+        if (after_device) {
>+            g_string_append(after_device_str, after_device);
>+        }
>+    }
>+
>+    path_vec[path_vec_size++] = NULL;
>+    g_string_append(cmd_line, after_device_str->str);
>+    g_string_free(after_device_str, true);
>+
>+    g_string_append(cmd_line, cmd_line2->str);
>+    g_string_free(cmd_line2, true);
>+
>+    /*
>+     * here position 0 has <arch>/<machine>, position 1 has <machine>.
>+     * The path must not have the <arch>, qtest_add_data_func adds it.
>+     */
>+    path_str = g_strjoinv("/", path_vec + 1);
>+
>+    /* Check that this is the test we care about: */
>+    char *test_name = strrchr(path_str, '/') + 1;
>+    if (strcmp(test_name, fuzz_target_name) == 0) {
>+        /*
>+         * put arch/machine in position 1 so run_one_test can do its work
>+         * and add the command line at position 0.
>+         */
>+        path_vec[1] = path_vec[0];
>+        path_vec[0] = g_string_free(cmd_line, false);
>+
>+        fuzz_path_vec = path_vec;
>+    } else {
>+        g_free(path_vec);
>+    }
>+
>+    g_free(path_str);
>+}
>+
>+static const char *qos_get_cmdline(FuzzTarget *t)
>+{
>+    /*
>+     * Set a global variable that we use to identify the qos_path for our
>+     * fuzz_target
>+     */
>+    fuzz_target_name = t->name;
>+    qos_set_machines_devices_available();
>+    qos_graph_foreach_test_path(walk_path);
>+    return qos_build_main_args();
>+}
>+
>+void fuzz_add_qos_target(
>+        FuzzTarget *fuzz_opts,
>+        const char *interface,
>+        QOSGraphTestOptions *opts
>+        )
>+{
>+    qos_add_test(fuzz_opts->name, interface, NULL, opts);
>+    fuzz_opts->get_init_cmdline = qos_get_cmdline;
>+    fuzz_add_target(fuzz_opts);
>+}
>+
>+void qos_init_path(QTestState *s)
>+{
>+    fuzz_qos_obj = qos_allocate_objects(s , &fuzz_qos_alloc);
>+}
>diff --git a/tests/qtest/fuzz/qos_fuzz.h b/tests/qtest/fuzz/qos_fuzz.h
>new file mode 100644
>index 0000000000..477f11b02b
>--- /dev/null
>+++ b/tests/qtest/fuzz/qos_fuzz.h
>@@ -0,0 +1,33 @@
>+/*
>+ * QOS-assisted fuzzing helpers
>+ *
>+ * Copyright Red Hat Inc., 2019
>+ *
>+ * Authors:
>+ *  Alexander Bulekov   <alxndr@bu.edu>
>+ *
>+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
>+ * See the COPYING file in the top-level directory.
>+ */
>+
>+#ifndef _QOS_FUZZ_H_
>+#define _QOS_FUZZ_H_
>+
>+#include "tests/qtest/fuzz/fuzz.h"
>+#include "tests/qtest/libqos/qgraph.h"
>+
>+int qos_fuzz(const unsigned char *Data, size_t Size);
>+void qos_setup(void);
>+
>+extern void *fuzz_qos_obj;
>+extern QGuestAllocator *fuzz_qos_alloc;
>+
>+void fuzz_add_qos_target(
>+        FuzzTarget *fuzz_opts,
>+        const char *interface,
>+        QOSGraphTestOptions *opts
>+        );
>+
>+void qos_init_path(QTestState *);
>+
>+#endif
>-- 
>2.25.0
>


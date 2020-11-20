Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F382BAA16
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 13:29:56 +0100 (CET)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg5Y3-0008Dh-BJ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 07:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kg5Vs-0007QL-QB
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:27:40 -0500
Received: from de-smtp-delivery-52.mimecast.com ([62.140.7.52]:51323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kg5Vn-0003np-R9
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605875253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JdR0Ot+KCFZ3cjaRat6IojqsnYqSxu1fGDfT7R7u+28=;
 b=KlYvOBQtuAcK1zhtILpZFuJNgQO5z0DxQRsyX4kynZGBgI3wrHoWpnbcKo7b/A+iw+XZDn
 QtxjOvr2DwESWeFjPiIZ1yHRNFQ/HPhQasWS3t+u1G7eHNZ18/69zyDk+WtkX3V+Lk2z4k
 vAl1+rCjCVjGYK5XmuV7mG+YDlTO22g=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-ZhFUv_gVMEal9pqZmrCumA-1;
 Fri, 20 Nov 2020 13:27:31 +0100
X-MC-Unique: ZhFUv_gVMEal9pqZmrCumA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+supk3L3qEqb5wzXX2BW4dyE1yxFPgeV8pXSiXW6KtcfYIBzZPCtTA1kZ626ld8HjfC6poeLs+0zMUe04Nr1Mzba2SpFyExN30ruA+7/RCv+jJJpSI2JrhuZaj+F7Gh8aazUZv72mkaic9WnAYcfuFfbxKb1Jk3ikG3cWSpH4Bb93erhZyxABRcFc0JdwPGm/3uIuKFHfAsmfDbKWAeNIpKZp9LD8re6BmH3ESdCMww7me+Q3rKGcE/Ngajqy0AadGz8CMHVk94cG7HNpm4G+Wpyq0RV7v0/FVi8OcNjxEN2yBk+yOovahhoDADCNbb5r24UrwF5eXFnRjJh6nDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GS4XYrHF1gsDFV0ekg5FWJl4884BS5zlVm3FRZfT7lU=;
 b=gwFYDuThgUCtettXY363u+9xw24R0pYqzftTtv3sclgjHUPY1OCmjRebwYhEi25l0UuLejdlrTH/sHqBlomIX2YBij75zZVTPpOc4gs8SMDuLvvjeHx9Lb3w8MzKNqOh8FeRPCfpFg8mdeExNMJV2DkkIssdvqeft37XtK6DoYNikKxgevVJoYQHLDz7Kq/RAdWXq59J98AtKOVtsFpSVcbmnOgCa7hiuKpPkTHEv8ZLRaWUwOGHhMnzLA/BRtY07EC1JkD8mLaAIZJIy4nt4fKf7O7SMfiiE0fEBHS3fTREjHEA6fjCMRcbKyBYxNPMKeCM7MRPDx0oQNS2yVIcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com (2603:10a6:20b:aa::17)
 by AM6PR04MB4152.eurprd04.prod.outlook.com (2603:10a6:209:4e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 20 Nov
 2020 12:27:30 +0000
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::8945:92d8:e72a:6245]) by AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::8945:92d8:e72a:6245%6]) with mapi id 15.20.3589.022; Fri, 20 Nov 2020
 12:27:29 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: mdroth@linux.vnet.ibm.com, marcandre.lureau@gmail.com,
 Lin Ma <lma@suse.com>
Subject: [PATCH v3] qga: Correct loop count in qmp_guest_get_vcpus()
Date: Fri, 20 Nov 2020 20:27:02 +0800
Message-ID: <20201120122702.4413-1-lma@suse.com>
X-Mailer: git-send-email 2.26.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR02CA0168.apcprd02.prod.outlook.com
 (2603:1096:201:1f::28) To AM6PR04MB5782.eurprd04.prod.outlook.com
 (2603:10a6:20b:aa::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from t440p.suse.asia (60.251.47.115) by
 HK2PR02CA0168.apcprd02.prod.outlook.com (2603:1096:201:1f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 12:27:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8d0b993-85b8-485c-9ba3-08d88d4fa5a7
X-MS-TrafficTypeDiagnostic: AM6PR04MB4152:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB41527CE67FF1B6BAE8CDEF79C5FF0@AM6PR04MB4152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+Lcw2LzTE/khO/VDz21BPiS2Mv7ykdpgzsWgUh6bKpvhmYyfhQqlGDtxSisJnWQAp2DeZ3OuYbn4r32GBfHV0d+lcLWVErqOX9J4zSXTFKycY2kWBXIaBKhGWUXMCHyn2fagh5qX2dIPuW06+/HPq94GLx2UFMHFPEb1C+UoCE7inzckW2z7ajox/OPRswv1o+3MuXoh8TCauv5IDCznEGox+fU41cGfcxcXX9ai92qEj3o9bWhjcwdIbjzY/A7y0Tey6mJD3QUxyHABL3gKdecMyyXkgECH7CwDext+9hvAdh8rUh4CWcb9oO5cEcW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5782.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(366004)(39860400002)(136003)(2906002)(8676002)(66476007)(16526019)(6506007)(55236004)(36756003)(52116002)(5660300002)(316002)(4326008)(8936002)(2616005)(66946007)(6486002)(1076003)(186003)(66556008)(6512007)(83380400001)(86362001)(26005)(478600001)(6666004)(107886003)(6916009)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5DpFtR2D8lmoosBiL9RjzoJuAI9tkETdQUtMUbTR6ZTLCYAaerMB5T96sdAGeXIhZFlRu6eTVnwUboeiaZnv8qZuqYPtgluKpJZXH8r7rSFk2oPnikOR1sIBwzAKIjyX/mwKdmBLcVz/r31CkqUfWUOC1xcUSNjPkaCME0cO+ca1P0927MufD/nL8vjPmwHfrtSH8UPjYK/3lW8P4bdJR0c3nFgHC1ULHqQTbMDBnbU1lsUjVeCROmD0fOJQ5upTyRQzkVMf7v8hf/Zj8MxdZaZ3Bw7Ty5Eoqas/uN74x14ROmZrPKDY0XyQWnaDs4N76lCqxjvnCRhkJqwYscY58BCb5elPz9rxRjoOScoUTI35y81f83tdAtxDvAyFDG9da13EUl6gAXVPpF0O/WDln/GDwu0XESWnCBKIzATINzXBqZzgQdE67ltybibI8EvohnT4Mgn1QNUr8ZX46DqhGqUWEUn168GF8eAiO5iit9KeHHqef8fWmTP1wVgICnHreBfYIyhVZwlUFy6YdIRKaZzcrddmdROzCQRjq6nz4g88qnmdojeULxuugHo2P3bR5r31jdeee7uYE7meUyp6B3G/VZwvND0qjoTcWhcEEP7jfzAYvQIgt19hJ7hlA5wEcGz8fv4TXwRQ6XhpZqmGwexOp5fKHN0n8FmU1URg3S1vhjxvZvObpITU7LiAbehgunUjDMFIk1ZmTCpu7G1rRU+B74YJbjKztDb+T4q4jPvDMjHrfyv4BGPCpz4KUiS54aAAXg1vUGyogxEO/iIADyDPCQ+r3fKsP5txqTR+Jw6wMg/HHmrhi1qT0TRk8mEfeZBRkuiea6zamdC85LFrLgEsRrJ0XdWYx3yCLnuB1YOfLXFaIfvWEaIhjsDVLV4sUbemHgGC9OhF7/mS6ccT/g==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d0b993-85b8-485c-9ba3-08d88d4fa5a7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5782.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 12:27:29.8690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKojag/7hDusIb7KyMqn4bD1ys73gRgcDJEACTIDgX7F1H07nnzqiWco0EN0TwoT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4152
Received-SPF: pass client-ip=62.140.7.52; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-52.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The guest-get-vcpus returns incorrect vcpu info in case we hotunplug vcpus(=
not
the last one).
e.g.:
A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and cpu3)=
.
Hotunplug cpu2,  Now only cpu0, cpu1 and cpu3 are present & online.

./qmp-shell /tmp/qmp-monitor.sock
(QEMU) query-hotpluggable-cpus
{"return": [
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu2", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": 1,
 "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
]}

(QEMU) device_del id=3Dcpu2
{"return": {}}

(QEMU) query-hotpluggable-cpus
{"return": [
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": 1,
 "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": 1,
 "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
{"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": 1,
 "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
]}

Before:
./qmp-shell -N /tmp/qmp-ga.sock
Welcome to the QMP low-level shell!
Connected
(QEMU) guest-get-vcpus
{"return": [
{"online": true, "can-offline": false, "logical-id": 0},
{"online": true, "can-offline": true, "logical-id": 1}]}

After:
./qmp-shell -N /tmp/qmp-ga.sock
Welcome to the QMP low-level shell!
Connected
(QEMU) guest-get-vcpus
{"return": [
{"online": true, "can-offline": false, "logical-id": 0},
{"online": true, "can-offline": true, "logical-id": 1},
{"online": true, "can-offline": true, "logical-id": 3}]}

Signed-off-by: Lin Ma <lma@suse.com>
---
 qga/commands-posix.c | 45 ++++++++++++++++----------------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c089e38120..ee05e694d3 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2376,24 +2376,6 @@ error:
     return NULL;
 }
=20
-#define SYSCONF_EXACT(name, errp) sysconf_exact((name), #name, (errp))
-
-static long sysconf_exact(int name, const char *name_str, Error **errp)
-{
-    long ret;
-
-    errno =3D 0;
-    ret =3D sysconf(name);
-    if (ret =3D=3D -1) {
-        if (errno =3D=3D 0) {
-            error_setg(errp, "sysconf(%s): value indefinite", name_str);
-        } else {
-            error_setg_errno(errp, errno, "sysconf(%s)", name_str);
-        }
-    }
-    return ret;
-}
-
 /* Transfer online/offline status between @vcpu and the guest system.
  *
  * On input either @errp or *@errp must be NULL.
@@ -2464,24 +2446,29 @@ static void transfer_vcpu(GuestLogicalProcessor *vc=
pu, bool sys2vcpu,
=20
 GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
 {
-    int64_t current;
     GuestLogicalProcessorList *head, **link;
-    long sc_max;
+    g_autofree char *cpu_dir =3D NULL;
+    const gchar *line;
+    GDir *cpu_gdir =3D NULL;
     Error *local_err =3D NULL;
=20
-    current =3D 0;
     head =3D NULL;
     link =3D &head;
-    sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
+    cpu_dir =3D g_strdup_printf("/sys/devices/system/cpu");
+    cpu_gdir =3D g_dir_open(cpu_dir, 0, NULL);
+
+    if (cpu_gdir =3D=3D NULL) {
+        error_setg_errno(errp, errno, "failed to list entries: %s", cpu_di=
r);
+        return NULL;
+    }
=20
-    while (local_err =3D=3D NULL && current < sc_max) {
+    while (local_err =3D=3D NULL && (line =3D g_dir_read_name(cpu_gdir)) !=
=3D NULL) {
         GuestLogicalProcessor *vcpu;
         GuestLogicalProcessorList *entry;
-        int64_t id =3D current++;
-        char *path =3D g_strdup_printf("/sys/devices/system/cpu/cpu%" PRId=
64 "/",
-                                     id);
-
-        if (g_file_test(path, G_FILE_TEST_EXISTS)) {
+        int64_t id;
+        if (sscanf(line, "cpu%ld", &id)) {
+            g_autofree char *path =3D g_strdup_printf("/sys/devices/system=
/cpu/"
+                                                    "cpu%" PRId64 "/", id)=
;
             vcpu =3D g_malloc0(sizeof *vcpu);
             vcpu->logical_id =3D id;
             vcpu->has_can_offline =3D true; /* lolspeak ftw */
@@ -2491,8 +2478,8 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)
             *link =3D entry;
             link =3D &entry->next;
         }
-        g_free(path);
     }
+    g_dir_close(cpu_gdir);
=20
     if (local_err =3D=3D NULL) {
         /* there's no guest with zero VCPUs */
--=20
2.26.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29E12C9776
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 07:15:53 +0100 (CET)
Received: from localhost ([::1]:46004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjyx6-0000Ev-SO
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 01:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kjyvr-0008EJ-D2
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:14:35 -0500
Received: from de-smtp-delivery-102.mimecast.com ([51.163.158.102]:29109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kjyvp-0005oS-2K
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1606803268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tz8qhuHBLdymP1Vdd2wmrhSzsVX2mHsLaXOjFLqY9+E=;
 b=Eqw9eE36dyisXyFNa+t1dAvZKXenWDsyIzEsFujf/7BweGfL9NOxjQ7eE4dyxI5sFBRegy
 MGMKxokXO5cwhOvfnhN+jT8q+FfXTBx1U64iSasuMVWkXVflxN5HKkmTQSGG8oi1P61iuv
 0alsR9ayrz9bE/EgSUuGBvXt0ENwO+E=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-pU8gZq6yNk29eckg-gfBIw-1; Tue, 01 Dec 2020 07:14:27 +0100
X-MC-Unique: pU8gZq6yNk29eckg-gfBIw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA+KtUyDV9bFlj/ekdh08JbjuEpXuOSI4sBpY3TNIylZsvxeXtymcdmuk+fqtiw/eBmmEIpwdpJpUnC7eofH8KizPh/gbApxY+tSfAeiecBU7zz2p1SpX0p0wmig9Drsr1bY3CWUMCEiTyi0DqOPlWubT2148ogyYMAjxEra7Uu4nRDtT4a5TKGj7V3kk9wSjqOCzYGZNocqZMij66YJNWhzMYAEikL3fbIuIe7yFsiqYvhe5Cvb3KhNvpM8/hEGOblnz/Yq3KFVe/XATk0+ANhLAdeC9AWyaBF74MmNucZFtq6ueoTyaNOXA5ghK0yODiEBbXqUSAxXlPQJwp70JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30ndSeVVr83GbCesjBKx+xC9aVcLGjBsJdsXnrqff5g=;
 b=k5RGUhdhVvFYHkTepKbDUz2SXZciQwMseBjnh46POJXK11kdNlknxwVhlfDb7yruv+4sCGdk37eokmXr6Wpsy+OPTy4C/tL2tNON9AjgUOlbf75cvgJuonBCZ0z9skz5fu65S6dZ54YrBeLrIUIdKFmfw26GuxwKtVsFUbncNZmdsoeV85vtCu6ksujsg6evgdDiPZ1GQFzFdrDLQQLmF8eSBYjy4c75BGhi2csOLHlx2PNw7nsk1Wocs7hWjRlISrNvOCoYI8l75vT0LzXU4Oyykc9fHvV3sDqMZWj3F56w+5xIxFgnpEMZVyU/vPmBCiRi06b90TN0dksRXAmptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from DB8PR04MB5785.eurprd04.prod.outlook.com (2603:10a6:10:b0::22)
 by DBBPR04MB8027.eurprd04.prod.outlook.com (2603:10a6:10:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Tue, 1 Dec
 2020 06:14:24 +0000
Received: from DB8PR04MB5785.eurprd04.prod.outlook.com
 ([fe80::1568:6438:1cab:7e35]) by DB8PR04MB5785.eurprd04.prod.outlook.com
 ([fe80::1568:6438:1cab:7e35%7]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 06:14:24 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: mdroth@linux.vnet.ibm.com, marcandre.lureau@gmail.com,
 Lin Ma <lma@suse.com>
Subject: [PATCH v4] qga: Correct loop count in qmp_guest_get_vcpus()
Date: Tue,  1 Dec 2020 14:13:56 +0800
Message-ID: <20201201061356.18438-1-lma@suse.com>
X-Mailer: git-send-email 2.26.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR04CA0045.apcprd04.prod.outlook.com
 (2603:1096:202:14::13) To DB8PR04MB5785.eurprd04.prod.outlook.com
 (2603:10a6:10:b0::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from t440p.suse.asia (60.251.47.115) by
 HK2PR04CA0045.apcprd04.prod.outlook.com (2603:1096:202:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Tue, 1 Dec 2020 06:14:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9783276a-af4b-4483-e4b6-08d895c059ac
X-MS-TrafficTypeDiagnostic: DBBPR04MB8027:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB8027E69A19FF5472A20E3964C5F40@DBBPR04MB8027.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYgxB/ZIrJ782tykMmb4Yy/TeFSMNtxydskSL+QNV7LZP/Z9Xm13ur/JXCKXS3ACWJxeWS5CDrzpV698pQFpXljehQ6Fl2YYxcpHFCp48wYWhRSkIhPyqmXXiy3GUF9YLnZoiaSHab5fG5o/d/qAtGe7ED1SEwXGvxfDxcRlpzUGJ5+Rqxq6OYpb0AoynARbR2F2SRt2tiJQvkLaGetxtQwCb2A9eaG6rTWiBWPgBod+b9f5jB4GdX+8iQ5+uGpCN8WqZ25V7PkKWGuYNF5RrmHsX3nXy4zvZD78x8vpmHrMAoI+EuQO/vAUIxAqV+Y5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB5785.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(346002)(366004)(376002)(136003)(478600001)(86362001)(83380400001)(36756003)(2616005)(956004)(5660300002)(16526019)(186003)(1076003)(66556008)(8936002)(8676002)(6512007)(316002)(66476007)(4326008)(6486002)(6666004)(2906002)(6916009)(6506007)(66946007)(26005)(52116002)(55236004)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vb8qTdh/6vy4JzTzyynyFVySaosQUJgJIMj26YTcP4h/X6tTD4XVrBMgeHvW?=
 =?us-ascii?Q?vb8JPu3rQzzEGZQQg4qNFo5WT9fRvDKQF6BcJTfJEFN9318oUtqsymoqCqaV?=
 =?us-ascii?Q?R5F8f/tchfjU/hWf7QCpcHrYiKGMrx6NLGA8wQLDh1Wpj9pxdTptvPVd+Viu?=
 =?us-ascii?Q?VN5QD4jQjFMiPTDzP/9+b/ChWaZwgm6iE4HqRQDxFqs62IS/JJKPDvfnWfyT?=
 =?us-ascii?Q?tmLjFCzroMCvTkpaA9rL3G1Mf6n81bNjIq7cLQtg0IpdolhfGUFNSeA8vR0K?=
 =?us-ascii?Q?NL0z48D2HdKMHvDG6fU0amP/RN5fDxOQuYaB/bqCDza8FTF9CJh7ke37qoC2?=
 =?us-ascii?Q?LBXfhEQqNRSoRwiBW/2ciclUn8j6SW9SY1+UmItlIwCE8/WCQ41ZaG+RJWcb?=
 =?us-ascii?Q?hUhIP95g2BD/vTJLct2MZ6nHZQrTCt5QmMOIyJ5AQpywDzPkJd4eX5paI8j8?=
 =?us-ascii?Q?Ciyq+xzE8Jhk4o9W2yTpJXh1GnbltPrndF1gp9kdYcoWQH2n+PavOPGBlQTZ?=
 =?us-ascii?Q?0I9sJaiG4rSjwCjiN/B3q68BH/Chw9qDyZ4iLcag0f9sriXbC67BjxItqmTj?=
 =?us-ascii?Q?Omxy9xS/Var1kFtRoFtFrgqTtLcOVFcDU/5TVi6Hk25jlSwnjW7TY1gzLM+W?=
 =?us-ascii?Q?1p3ueNse00vv6HFE/WxR3yaoVS/bA1QOWesGXvjuFJbR6NkkOrOqHdOjSA9i?=
 =?us-ascii?Q?mamLmdthyE82yUE5D4ZnlJYJEomcZ7pcDLd3CGArIVoIChUa/5K88uo03h9X?=
 =?us-ascii?Q?kpRtBwBXrta4MbfgX8nZozt9XfBjDesDdZ1KaJaNmJwft28xRamB7V4duLpe?=
 =?us-ascii?Q?+SDlFQWln+56NsArkUj6Kp3bPYZis9w+GB04jvX5kbpYE8wb5UcEwj4OrvA0?=
 =?us-ascii?Q?ilmPPGSXA5K50JGq8p4yQ3oWWEKHnA4TnkS3hocW63X+BWOFiQWFzq+bqw+W?=
 =?us-ascii?Q?O08pW8JATcFIaQQqBl6PsSxG7Twz6eFM8gcux3tkO38/Xn1+nvbmrXiMiOHH?=
 =?us-ascii?Q?lt1K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9783276a-af4b-4483-e4b6-08d895c059ac
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB5785.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 06:14:24.6316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oc0TFcZcVceWaHFYWrajueRodJVt9Qjh6hpVfjg+meq1YJvxNSVjb5PSaEUy4zAM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8027
Received-SPF: pass client-ip=51.163.158.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 qga/commands-posix.c | 44 +++++++++++++++-----------------------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c089e38120..48dcdae239 100644
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
@@ -2464,24 +2446,28 @@ static void transfer_vcpu(GuestLogicalProcessor *vc=
pu, bool sys2vcpu,
=20
 GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
 {
-    int64_t current;
     GuestLogicalProcessorList *head, **link;
-    long sc_max;
+    const char *cpu_dir =3D "/sys/devices/system/cpu";
+    const gchar *line;
+    GDir *cpu_gdir =3D NULL;
     Error *local_err =3D NULL;
=20
-    current =3D 0;
     head =3D NULL;
     link =3D &head;
-    sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
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
@@ -2491,8 +2477,8 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
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



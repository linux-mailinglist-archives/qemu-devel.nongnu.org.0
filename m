Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FCD30872F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:03:15 +0100 (CET)
Received: from localhost ([::1]:42362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PgP-0004V3-W1
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1l5Pcx-00030H-8h
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:59:39 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:58469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1l5Pcu-0005Ch-Tv
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1611910773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f0585K751f8RQG0iVboZroo0lHZZeehCXzKSQvadlJU=;
 b=Eb0i6GcN9dajf1Gxw6AbvPVEDVjo1DuGOMdO/W7uTf/ReVpCKYq9XlYD+ldPBFDpV7gDKy
 kI4bbp8HwQTICzj8ZG9JLT6VPrYbZ+iHeuGyXVPJSyJ1mfnDj518olClevUk06b2ZFBwae
 zu/WoPss9rnsOSb+UheMK63n/fu+ug4=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-KB0TZO1YOLixHxA6yZENrw-2; Fri, 29 Jan 2021 09:59:31 +0100
X-MC-Unique: KB0TZO1YOLixHxA6yZENrw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UODt9D8f4CF6hNBo08hgQMdT5hfwvUxq3LtXLSP80MElTPvxLCDEA1nt2y6uVzI3Mh1C7H7hmYWjHipiY+t7JNS8ZfkzLZ90iZScHTQJdhIWbZ0WNMm6+fwu8DVTmdPeY65zOpwBwJEcLzIFBfJVpEHqDBiLd4iRZ/p29omEQvWmWqmrUrUvPppzcC4ApzRshM42v61J6r8YRgsJVwu/mcDpt3S5MNPR4pbL6oOZ2vmLE1xPkUeArd1NVABSD2aHfHPR0JF3p3X0rdBKbytuJ9tp14BjXX8HVyKuHSA44VCVGiN5sOa9xlvoLQonCKMDCOPoA20rRy31EVWmce51yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVvQqAKRcBu+UCtKL3u0fKgNpGttKGvteCQsTcOPhUM=;
 b=FT3fiyWy/F8sJb23YwEKBYfQiU1BqWjWpzpp5dV5ON/708mLmcP0iD6NgEJJdEiUlap6AwwvaCjVGUMMPzghsT9GbF9lj3XhUVNx5fqqv/zZVT2GLNIy8iSOnBmcbvAI0R1zVhDn0mJFOgb5q+GbDLHJJbaoiLuCX5w0nCuIORVIc5Ncgt8UaArPLUybhU3/W+V369J9mc9XDDBk4DeM8aaKVs85t+eFs0XR8VydkODVlFs06Yz0aAZZlR+qKWSTrQfJ8VWBAb6yFxnCodLasQv0BpwCReuZr2olcSkJCY6HpD7BTgB5kkyDEcExrU9dxeOG2fxVYj5cOzTfGRJB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com (2603:10a6:20b:aa::17)
 by AM7PR04MB6837.eurprd04.prod.outlook.com (2603:10a6:20b:10b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 08:59:28 +0000
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::1938:fe10:6659:cb1a]) by AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::1938:fe10:6659:cb1a%7]) with mapi id 15.20.3784.016; Fri, 29 Jan 2021
 08:59:28 +0000
To: qemu-devel@nongnu.org
Subject: [RESEND] [PATCH v5] qga: Correct loop count in qmp_guest_get_vcpus()
Date: Fri, 29 Jan 2021 16:58:52 +0800
Message-ID: <20210129085852.22224-1-lma@suse.com>
X-Mailer: git-send-email 2.26.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.212.198.125]
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To AM6PR04MB5782.eurprd04.prod.outlook.com
 (2603:10a6:20b:aa::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (139.212.198.125) by
 HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.2 via Frontend Transport; Fri, 29 Jan 2021 08:59:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e043d83-4f85-423e-cd11-08d8c4342f35
X-MS-TrafficTypeDiagnostic: AM7PR04MB6837:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68376D5C3BB757C98B511055C5B99@AM7PR04MB6837.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AWOlKovh/JuRvBqNn1VwulVSn1PQPJ6bm79gNbVJOaOMc5GtM9h8UJmzzuYQlShfYGw36C+OKhGlmLbQlBIBk8Q1DL4cc4PxXJEH3aykzTWug6nO7PWYEbDsDGPxGEI/8jQszilvZ7NDwkIOahX/Y/midlNp7+8GCx+fmdMmNRKV72Nse2EanoRfVtmvhj3NPlV8DXUNvswkj6JcvXbI86m9Wl+yXYDq/ObePBuXCLf5tin7E17x1/T8KwFOVe70aQk5oD6wpxqpQlbl8pecVu6FVVlNK+o3D4QT104I/Y8Kz7hvwDekYqe1RwBYJ3Ecfqj/4CzqeMQJriSXi92p2YZDE4W1r/e+uCUc22P9eJEB6gtfr3wluM79Fh9xWIQB0ZapdDPcD8T11Nb5siX91rCNhu+MipOJZihIzOL0QUFY5mf1+TxI5FY3Em401T2bOg7jN8nViQKYWK1hEqnf2Rwc2tKcRDZT04w0aDIN+k3f8FcEQ8l2JXufSxW83xR3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5782.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(366004)(136003)(396003)(1076003)(26005)(956004)(66556008)(2616005)(36756003)(66476007)(5660300002)(186003)(6506007)(52116002)(16526019)(66946007)(83380400001)(6486002)(2906002)(4326008)(6666004)(107886003)(86362001)(478600001)(6512007)(6916009)(8936002)(8676002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l8Mub2kVInyqtESsaPWJv/ijC6FxAYUkwxesrPl2kcP/m+Z1IeGOxT4ACsx6?=
 =?us-ascii?Q?i6VecRrwqkQPy5vAkWiBAJdtaYESbzGokXkSW/xg1tsMyPctirfR5bIcdq0Q?=
 =?us-ascii?Q?99h26TErJgj9TGAMBTtrzOVQd77c7ShPxIdIHt+3pLiaw0FClnBoy8+3k30j?=
 =?us-ascii?Q?YGZIE5oJ7DCYiYy1CH4Paz7FK0mCYpxersrDDMboy4YJnmKn5TLFTm5Tw5Rn?=
 =?us-ascii?Q?5jlCgfCIZWGaYB9RDsecio7WxWNoj+NUgtEi3mpsPQsv51PgfHF7svw3gMyq?=
 =?us-ascii?Q?C0HZxnMw3rhXRSb8s0Hh4wgfA9liBQs/97CsSGRqwh9ZHNajGv+T1yw3qr3w?=
 =?us-ascii?Q?U/U/pC9mQF4r6qXAgXgi/sFYxfr7JuN+h4SCwnw/bB+buL//RcmuJ5EDNneh?=
 =?us-ascii?Q?BHDAF/aY/UcvqQAK5QgAoCgWJ3QB1lO+gMTXkTUVop+i/b96ChvLWvdBJDUe?=
 =?us-ascii?Q?iWup1fbesxid7gRHflTE+aREdO2OC/Q7tqmYckkyUh+dlp3V6awuj5J3sycz?=
 =?us-ascii?Q?1hISbTXsLRCI4OfnXTxGqbaB6W3njtdC7T82wzU/0Vy6C1L6akujKKzCHzBF?=
 =?us-ascii?Q?MHVLJbH3iZSP/f7XZ/Q668p9+4TRyvCYv5ZfpxCHUw2Pc16msUcH6EtmqFvM?=
 =?us-ascii?Q?FtL1E2o/Eyu0uzPt1L1h/tEkW80s4srRFu8H5tnhQGz7fLuXbC/+M2QQx5Yn?=
 =?us-ascii?Q?ibr1fOA/fFtpk8A7T0jWKBGSTunoFw3xO+r13b3rI4V7oxZdQfN/40bG19a4?=
 =?us-ascii?Q?ZS+M/PKVTzW5rlIOesFu42+8+INVtGUr8bagM0ZRjfZORkVRl4UrRa4zL4Eh?=
 =?us-ascii?Q?17pP3aVkX2Yx5vp+mBlJiyXYXOCrH276lUEqCKvPCJtc/476vZntkgJ4FBsr?=
 =?us-ascii?Q?DZ10143inaGCV+DCSgE+uRcnxbefsG3mcca/s8zTN52EIZk+0XX8vsu9Nx1j?=
 =?us-ascii?Q?v7DKMNZOrT1Tz0qr3XuWTbKktpoJfC7veB1EQTm5xLzTzfwp96c4ejzNNrcz?=
 =?us-ascii?Q?BaZ+yHLDwqLeP3imHt2+yVa3gQwPb3AJaNfGjUN7+JSB5bBWM+s9oqPVYKDx?=
 =?us-ascii?Q?ygNrvVGW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e043d83-4f85-423e-cd11-08d8c4342f35
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5782.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:59:28.6001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9P4cmeyEvoDAoEUHK8RuRWikBIr7nh5v7QVFxq3G0oQh4QYLikETTBdPrliDqMdM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6837
Received-SPF: pass client-ip=194.104.109.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, Lin Ma <lma@suse.com>, philmd@redhat.com,
 marcandre.lureau@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Lin Ma <lma@suse.com>
From: lma--- via <qemu-devel@nongnu.org>

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
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 43 ++++++++++++++-----------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index edf785b2da..646d9cebb5 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2385,24 +2385,6 @@ error:
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
@@ -2473,24 +2455,28 @@ static void transfer_vcpu(GuestLogicalProcessor *vc=
pu, bool sys2vcpu,
=20
 GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
 {
-    int64_t current;
     GuestLogicalProcessorList *head, **link;
-    long sc_max;
+    const char *cpu_dir =3D "/sys/devices/system/cpu";
+    const gchar *line;
+    g_autoptr(GDir) cpu_gdir =3D NULL;
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
@@ -2500,7 +2486,6 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)
             *link =3D entry;
             link =3D &entry->next;
         }
-        g_free(path);
     }
=20
     if (local_err =3D=3D NULL) {
--=20
2.26.2



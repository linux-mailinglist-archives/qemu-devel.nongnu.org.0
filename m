Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3345D2C9E69
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 10:58:01 +0100 (CET)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk2Q3-0004lb-Ok
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 04:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kk2Ol-0004Ka-FZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 04:56:39 -0500
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:55600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kk2Og-0006r8-7I
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 04:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1606816591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PwtdjWodP51av1pwdM31IH/IVZzRV8i7jaBoq4WKYf8=;
 b=mDibXj2kxBP0Y0+HIBc1idfbKFM+y+hB2ybxmZw1k8I4H4UPrX6s6y9sn7zbYOfgjXN26I
 kiulQiOn0+FBi61saPlG1ew44uzCNcEjjZN8mQc+8yZyfdMp68G8B8zpWRt4zbMdUwC2p5
 SuHHmzqmxiwLXPEce3iJ86dhJtcG2Ak=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-TgANhkQKOryg-l21AfrFDA-1; Tue, 01 Dec 2020 10:56:29 +0100
X-MC-Unique: TgANhkQKOryg-l21AfrFDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIRRyy589eqewJRG67UNfVbAnoyyQcsB5AAZ9tVJVLM4tfJDmjwVHxIZjCcF2ykXCBfQoSdrvjc5C8W+gou10zDceCUouEsSt6S/NdDq/KLQcJqQUYuQFYwvpRcgCvbLWbi0PwEVOJI9vTPG20rJwFP2IDsui5NTowT8rqonNfCAxvgOHaBf2eBrDiHONBt4EdH8i0m6f87+/S5mZU/j0Pxa0jgtcsIPvscWGycUL43T7vWwh5k7hqluhCb7ej7jkwJ1Wami0yJHwVmjW8bQ+GM5SxAss5tXTLBB+PlkU/vHvCY/gulqTnvbNO5dOjlwAo8K9e4jUv+CaCkyRsic4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8x38IX4IophyeBFe6/sBwmt8bMZIt0YOZQei2HwccM=;
 b=asKrDRgepcG6fEU1B/X9PusWG3TvGzoYlsu3Gw3ZaAtx21IMLWsy6vx59VoPqi4M16TAHOyihc+tpLWMiXzaOLCSkunEdyo4ldhjGmXc2Fuy69dMDHopPjBJnFU8/ee85vLK1uHqVeMMJ84Jkm3Zqx+bc6gnF6IpQdGLxYFw4+0hl5oGPu/uO6sNt5LYIMVibEzeOxZ7Pu9CgbOieGLfKTysSI1vU1s3bCkAwUHSjE/OJFO3Rd2OCvLsx+lbGAhKUi1nUWBV9hguCs4P7IXBOwZSV/mf7WjKA+q8SqYliui87Wk9TB5oGtQWmkSOomzRxYTFZJ6CuLNXrVwHpcuB1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from DB8PR04MB5785.eurprd04.prod.outlook.com (2603:10a6:10:b0::22)
 by DB7PR04MB4105.eurprd04.prod.outlook.com (2603:10a6:5:26::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Tue, 1 Dec
 2020 09:56:28 +0000
Received: from DB8PR04MB5785.eurprd04.prod.outlook.com
 ([fe80::1568:6438:1cab:7e35]) by DB8PR04MB5785.eurprd04.prod.outlook.com
 ([fe80::1568:6438:1cab:7e35%7]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 09:56:28 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: mdroth@linux.vnet.ibm.com, marcandre.lureau@gmail.com,
 Lin Ma <lma@suse.com>
Subject: [PATCH v5] qga: Correct loop count in qmp_guest_get_vcpus()
Date: Tue,  1 Dec 2020 17:56:07 +0800
Message-ID: <20201201095607.23389-1-lma@suse.com>
X-Mailer: git-send-email 2.26.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR03CA0048.apcprd03.prod.outlook.com
 (2603:1096:202:17::18) To DB8PR04MB5785.eurprd04.prod.outlook.com
 (2603:10a6:10:b0::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from t440p.suse.asia (60.251.47.115) by
 HK2PR03CA0048.apcprd03.prod.outlook.com (2603:1096:202:17::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.8 via Frontend Transport; Tue, 1 Dec 2020 09:56:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12938375-6b77-4baf-d34a-08d895df5f61
X-MS-TrafficTypeDiagnostic: DB7PR04MB4105:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB41055E7B9F8D449451770B31C5F40@DB7PR04MB4105.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMqpA1ICxSzLq9TOebrusYPdZECpddyAz/tSSWOPW3fKI6CYQcEiIjK5TMJhHzvuCsgfRiYMvkhmIOPQI1sl1/nPPUQ2PaFJ6EAGQvxa7++noJR26IvQDtgDmEPocTVvf8dI/FYWpX2IQu7vc5mJPRE3dRF1t7dZcDn0mY0pPGYdfftVHCX4NdjepwVEUxyzWFC1s5PXqMbNedDmOSzv1eYm43lFQ2T8QqfSSwDbCZdJqo6Sv0nL68k0yUOT2fW7WVX/T+jT//1K7/Ecdt65EnTmGbOdT50LK4n1ThGkYnRwkXRXNo5Qg/ZD9EiDsQ1B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB5785.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(346002)(366004)(376002)(39860400002)(8936002)(5660300002)(6512007)(316002)(6666004)(2616005)(52116002)(6506007)(6486002)(66946007)(8676002)(86362001)(26005)(55236004)(956004)(478600001)(66556008)(36756003)(83380400001)(1076003)(6916009)(2906002)(186003)(4326008)(16526019)(66476007)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+0U50TK+kdN1CXBGtKgiNAopd3LexHueNADFQ0D7MJpeEH5z3EfmFqXbzDuj?=
 =?us-ascii?Q?UpCHmHe+knp74VLTC6+htI+F/I1+ek6iYfj2P3LB/6XUN3h2nhfh4COs+7Bg?=
 =?us-ascii?Q?4rdl9wOc4KXSso7ZKQcruuXLXwV3vzc8+e5eNQa47wYiXAoRxR/4tewMtvIa?=
 =?us-ascii?Q?1XFtGnKxSwKW2KJamFpMyGyDRrfx+HaWdLjO8sZWwaKeFOW2UxgOyCiafI6w?=
 =?us-ascii?Q?/cFpqQwo2CkBNxLOnmp7YZSnsb/E/P0Q5ObvHDSkhugwi2nCj6fjOUUhGd9H?=
 =?us-ascii?Q?uTTCNEucXmfLjMbNsNOt5mbOwOc/otbock9qRKigfuoN8cVtObz6gl/TQAcw?=
 =?us-ascii?Q?/cXM4h4bP8+4mYCpugBL0pcuiA8ZedueYy++IY/0YOGkPr4gooRYU8SmrqHQ?=
 =?us-ascii?Q?UO28QESnDBrz7d65paLhM8rh7pxbppeRNFz5Oee6zDwbrIca1fFW38japRoH?=
 =?us-ascii?Q?FEOa5R91OOrU5o0Dxid34yBAjU/wNvL2h4FfXUIDEeZPH0XgvtSVgjH5dtWm?=
 =?us-ascii?Q?dfD+rIQw7afdG8x+i8EINSV679Nx/9yKOiOgJyMZkh4I3CzKxY5P4ZqisNuJ?=
 =?us-ascii?Q?NLV/awGR3v01ag1PPj+1GV5Xsn0fq3f/S5+8s6NRyjDEFJ+m2sBGuxXEkglg?=
 =?us-ascii?Q?oD5Am2jRB/eDPhETfHnb6kL8Vu60SgmcrFFqkHe3iKm+d2hIAqoZinXQtzXM?=
 =?us-ascii?Q?+i+JC81Cf3j/9DgJFE0ruaVj8Pwr5GCzUqpIhcAeR5XojV1Mx9KUQrcVuBjr?=
 =?us-ascii?Q?HNA5Hc4A2EnsVkBwnPjYKY1VJC0gG8X4Y621s+ZBO6MDMlLogll5v58Po2Ok?=
 =?us-ascii?Q?o9XhC05CQOd4zyvoyZLCBZhgpW4IoLYd8oCNgLxZL+ucelpDGaCpQkVW4G/0?=
 =?us-ascii?Q?KawkJlLduO7kU/xTKJjWfkJ/gXa3RUjboATivvhF8tjgwx9qLuQQVQgxcOWN?=
 =?us-ascii?Q?sk2gTQ+8oHWKvOoASvtJa9KyYSRhiI0MPieVw5ACX/CxtErkqD6Zf5Dd4vHW?=
 =?us-ascii?Q?2PLR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12938375-6b77-4baf-d34a-08d895df5f61
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB5785.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 09:56:28.5526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O45JKGV8xNpL48/NGnnfWDiAHUXxuqWrqWiPow5+VzKcm5zDyIVWeNnJN/Wrwk0N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4105
Received-SPF: pass client-ip=62.140.7.102; envelope-from=lma@suse.com;
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
 qga/commands-posix.c | 43 ++++++++++++++-----------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c089e38120..f66bf84126 100644
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
@@ -2491,7 +2477,6 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)
             *link =3D entry;
             link =3D &entry->next;
         }
-        g_free(path);
     }
=20
     if (local_err =3D=3D NULL) {
--=20
2.26.0



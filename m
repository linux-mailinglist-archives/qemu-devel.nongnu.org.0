Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550782BA63F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:33:48 +0100 (CET)
Received: from localhost ([::1]:41944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2nb-0000y1-Dj
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kg2m0-0000Cp-HB
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:32:08 -0500
Received: from de-smtp-delivery-52.mimecast.com ([51.163.158.52]:42130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kg2lr-0007b0-07
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605864711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=15jcyd2Ggtg197iO044NvKVy+n7kaptVX7mT5esK5/4=;
 b=JbI6sXJ75I74zPGQfR9gvLoZF2Cnyd/acndxfbg5w1riYnnZR4bmT7S8m0p7ZSpR4RLt3w
 hmAiHos7/nHy8UW26mesSoj4M+O8pCfVwbrKsQWbpkeTx2YKXQsxU8UqUvdiLX8FgF11nN
 KzT90HAKsKzVzHZ5l4JemCH5EbLyAZs=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-nq_vyNK4PMGTFRAtOZtkag-1; Fri, 20 Nov 2020 10:31:50 +0100
X-MC-Unique: nq_vyNK4PMGTFRAtOZtkag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/CNcfMXZKSJDDsMfjJ/oZZ/zG0czm6Zl/iWrBKUYkF74Byee8DTKHMTYVMuN1M6BsnbXz4eANYO6O2aL4GFWcE0MoeThdHMH0qzzIhipiUvQXaqXJQkDk/7zi6Is3IXVHquvL4PXdJZm93Sz9ocKha94JnT5GG5lQoa5Y4AFJvwySzzCElWI0bRqOMFAhtX6vsKFEAcOTob22ENrLQb0ifF+v4RlVokSGgDQ3kRb6EHJtil0NIWHSKw13RKpHDAes5EeNqUCbnJZ6nIm5PVNTyhYTDUW5DK+y0d6ksPjkte2+TNgLVJgYd0TGZEmujZRGcJGIWp1DONhxLlbdrLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnLKFsC77SfNZpbPK6Xj8xKtmcaxZ65Cn2dlCKBN2CA=;
 b=jzXudEcVSTvZX4X3A8Byj+6yHaziq+t8zLtux7LdsBtSZaTw9i9UbYdtTTnXDUS2x1K0vsUI1VX4GeLEluxDP8hzcPz2PStiCJnQXtq3sf23DFpnq+8SBPlOEKQ27Tfb7rl2zPpWWA4+nIMjCmqI/4Cb8k2I2MP8OdeKkbY8hbnnDKAGagHxk5BuF6iuIYLZ9zOb6u1fl4UoSRHLH90FrxyfieZsoBqSVaxrVYytn8U2q+uj6gbEsxyyNUuy1Wc3nl1Z7WGjdcoi4QD9LzUZNzEUFQIcU6aC+5driAlUFIJxDqq/ILIXTHryLIeB7AfDnJbwWzM45xa3hRm81wXvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com (2603:10a6:20b:aa::17)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 09:31:48 +0000
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::8945:92d8:e72a:6245]) by AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::8945:92d8:e72a:6245%6]) with mapi id 15.20.3589.022; Fri, 20 Nov 2020
 09:31:48 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: mdroth@linux.vnet.ibm.com, marcandre.lureau@gmail.com,
 Lin Ma <lma@suse.com>
Subject: [PATCH v2] qga: Correct loop count in qmp_guest_get_vcpus()
Date: Fri, 20 Nov 2020 17:31:23 +0800
Message-ID: <20201120093123.28538-1-lma@suse.com>
X-Mailer: git-send-email 2.26.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: AM0PR04CA0100.eurprd04.prod.outlook.com
 (2603:10a6:208:be::41) To AM6PR04MB5782.eurprd04.prod.outlook.com
 (2603:10a6:20b:aa::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from t440p.suse.asia (60.251.47.115) by
 AM0PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:208:be::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 09:31:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3f3a76c-2e8e-4fa4-c8e2-08d88d371a9c
X-MS-TrafficTypeDiagnostic: AM7PR04MB6840:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6840FBCB462F5861FD448928C5FF0@AM7PR04MB6840.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WEDzrzyJ+eV49dTjpotZ006ff7ukB+RG+DWLct4DKnIfB43TMRKDRxMxKqtUaZzfkMQhtyyDqmxJ7Xp3126guwpOyutmYrosrzcLcSvbtu1rXiMi+DWxH8/0if6Pd/0WN0AVOXUXlM5Dp9Vb87sBU/yvVU+AEJ2a5HTgtjypdljaB1wfCDjjRSYlQPlIdB5x4ca9DKvwZq+5XCSB8RhftJnVByAcX+jAt4+Z6XSa0AeLiMwopDIp86mNWLSu9sGpRiPIfX4ksAALZ2Vb70bafxHyZi95GFrtdGBi623SlvrLnsMRwQoceC853omGFjyM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5782.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(346002)(376002)(366004)(396003)(136003)(316002)(8936002)(6512007)(2906002)(66556008)(26005)(6486002)(86362001)(66476007)(52116002)(8676002)(6666004)(186003)(2616005)(6506007)(6916009)(83380400001)(1076003)(55236004)(5660300002)(66946007)(4326008)(16526019)(478600001)(107886003)(956004)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +o7m/fGylsTV+3mkfUso9TY0M7mbSnMHiXM/ObjGx8m9Q8njxOBpjM4jS+BhpIalf/WfO4hFaXYXcx8wsUB1TMAOQyv1WxjSWVZ+wgOiOAfY3CWrzHuiPeYYOBIYAGGfpkRVyA5/Iyc1WV39pE/uD6x3FQ/Jf9cqlk8jh2+TIT/n//+F9V4GzffVGC3zakdhlTBvfG8ToKm3BeIQw7sdujqPBvlV98eIz2zVSL9MeGfmtQ5SfK1c3SIFB2dCCRDzRECSd7iax0599QZAp7mojfQfRhFisWvzZfVbrAoPC5kRIc8AYlBvcTAOHywEWqy+SFJWoHqFMrSQm2UAb9AuCOcTzJ0Doh+hqyDIcDNBYeqHwCgLVv64wsEuBrT5K6pzgei2EG3LQ2ivovL3JN1899/qwO4G6wo1H/V+C0huKYxeSM5d9WjBb7MfIX5z0ijvXKHVZmA94afKykcuMq8CLxRxZvu3gEp45GTj97g826CWCO/YdnHmn5hV+ScTEtf6kHf5gm3bF/l8pN+X5/IkeT3PFsAdQ1TyprVJFgJHkf2RiRf0RD/sHlKG8VjQ+0Ja8m7sI4F1dGcJ2qSwhrbcIUQpG/znvGYl+ZUcL3J+EVVOqkrNNy31hw1tFbpxtLMIEWWAuiHdQI60LURROI6jh2lcW6LoPR87xKNbVFdtrV1IR497zKeyTDt7P/sFwUdqPVfaZaaI+0+fG/sDaZSoI7qZo06dpEdqYGqrmi723zB/ewFzX08JnLE5cADZ9g2bcMxCUp25aMJh8pLFy0wJWCTKQF7KRQ1ZxfrFZEPAmVj4oW+Jte7WbM+rfbtORih72UUnFH8XtlsLcI5W9UAnmU9VVjI0MPZ90edn8mxvgFXanSMCSpPy+0xjssdMkowjsrzDFAkuSrdhFwMG+1i9FQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f3a76c-2e8e-4fa4-c8e2-08d88d371a9c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5782.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 09:31:48.7222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AadNLjtAHF5J2l0oRe4kvcuSzyWCAn1OjpBAB337e8USOW/42LfhvvJwq229wyd2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840
Received-SPF: pass client-ip=51.163.158.52; envelope-from=lma@suse.com;
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
 qga/commands-posix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c089e38120..d37525b5a3 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2467,6 +2467,7 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)
     int64_t current;
     GuestLogicalProcessorList *head, **link;
     long sc_max;
+    int i =3D 0;
     Error *local_err =3D NULL;
=20
     current =3D 0;
@@ -2474,7 +2475,7 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)
     link =3D &head;
     sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
=20
-    while (local_err =3D=3D NULL && current < sc_max) {
+    while (local_err =3D=3D NULL && i < sc_max) {
         GuestLogicalProcessor *vcpu;
         GuestLogicalProcessorList *entry;
         int64_t id =3D current++;
@@ -2482,6 +2483,7 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)
                                      id);
=20
         if (g_file_test(path, G_FILE_TEST_EXISTS)) {
+            i++;
             vcpu =3D g_malloc0(sizeof *vcpu);
             vcpu->logical_id =3D id;
             vcpu->has_can_offline =3D true; /* lolspeak ftw */
--=20
2.26.0



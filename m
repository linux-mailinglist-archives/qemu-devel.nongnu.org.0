Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0A2B8B4A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 07:10:11 +0100 (CET)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfd8z-0002qH-MT
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 01:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kfd82-00028u-Ty
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 01:09:10 -0500
Received: from de-smtp-delivery-52.mimecast.com ([51.163.158.52]:58490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1kfd80-00064v-56
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 01:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605766144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bM+hndCUPOTFIFba7bun1TFdTb9d4i7TLDeT7VhwpcE=;
 b=P+AtyIKQY8qDIKJ23hFCNjgqY01ZswE8/BodD4w+UclIx7FAsAdosvlehBsi4uSUNVIE6e
 +VfiWTbRAav2H/PIobxVZ8nRoK6KLCyoUFbs0eb0gzG2n5jSN7mPNknPK7vKtjZX79QQD5
 PiUF1jjK/ZdX5u9TP1L2pk7AiUY8gD8=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-sxmHktIFPyuxXuKLIIdeDA-1; Thu, 19 Nov 2020 07:09:02 +0100
X-MC-Unique: sxmHktIFPyuxXuKLIIdeDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQDlF0vQr4jX73cDGktSe74gBW7kiUH4OYi4cEc/eOOHMBOUhLgLkzpZY6MOEMbfR4rNCTfVu35ReTPyptpsmBUc2Y6QFyVwENpoXfY5FZUqqMFNQLks9NmyxvxnetOzLcn1jqm6V/5yjth8e22DasNcafM0jhBnnRYImuaEh0Y9wG3Pgv+ut2SUuqMFjVZk6+a7YANl/wLWKR5XPrWixedAMcHFU0s6O8SY27qYhK6tjvZyKdnuEwL3gDhIjr3U+K0Mu60wAuJOBU0kMHdAKExRoJrBOj0fYxcdkYUS4nN2rD1EVXp9ovw8mVFJbd6PChRz33uYgD6HIV07Os3g8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QccSC92OiPepI7YxfaUXK8HPm/vV4wh/Gj7dNUF7ME0=;
 b=n5MW5WFulYhAcOXaY5X1mZug1BdHhR3kTkOTKdMq9+jw6Q4dTRsuEnnAcg+MbVBFL8dSuTFpj8zToIhGKt0zfAO6cqVycvKBoANeRx50ymq3Hiq+fQDDgiO4FfjxRroaCGEYhqlAVc/k4FqYzN8nvPLTk525i5ZUVYRyUWMUU1H81TwY3sZFvilox5d1fv6nNgak2JcvqNjsPDzvuDe81ZlYVnJRqQO2BBy/EavcTT7IbFopFSoAGQlgr+k7Qp3DCPNoAlVyfstX/DipAuLq7BgLhE96S8TuftCJvN0e81zDCgZqiM1fXRcixfRXtOKn24kjzPg7TWl/dSMM+efHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com (2603:10a6:20b:aa::17)
 by AM6PR04MB4101.eurprd04.prod.outlook.com (2603:10a6:209:4d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 06:09:01 +0000
Received: from AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::8945:92d8:e72a:6245]) by AM6PR04MB5782.eurprd04.prod.outlook.com
 ([fe80::8945:92d8:e72a:6245%6]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 06:09:01 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: mdroth@linux.vnet.ibm.com,
	Lin Ma <lma@suse.com>
Subject: [PATCH] qga: Correct loop count in qmp_guest_get_vcpus()
Date: Thu, 19 Nov 2020 14:08:33 +0800
Message-ID: <20201119060833.25328-1-lma@suse.com>
X-Mailer: git-send-email 2.26.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::30) To AM6PR04MB5782.eurprd04.prod.outlook.com
 (2603:10a6:20b:aa::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from t440p.suse.asia (60.251.47.115) by
 HK0PR01CA0066.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 06:08:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96376bca-1bc4-4327-a66b-08d88c519c1a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4101:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB410102F9FC835252A99CECA7C5E00@AM6PR04MB4101.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ChjTLs54wr3SuBSJL3a05vYXTOnGZNU9Ap87RPPw//SE59JviwPfvNOGYXdLjoIyAk2H9Pfuw53OEDI+Za/OS3gqsKgLAJhrosziCHPUo3CB1FEU5KabO+mFYT0Ya5sOgrlZF+CEztYQBcASBt4QJcJ9Xnl2IQn4OcCQLMwTA36IGD141kovhx75Qct0mNKEIN0IgJlD6pwS/jQOzQW/L+AngQr5gwhGYBBm/5QYY88iCnq9uQKXqsN1gEqfSgsI+R7mR8M8Lnk2g1NQTHPwS3m/GmPX4NWoP/f5ROR6luDGLAc6NgDTl2dX8RNTYFH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5782.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(396003)(366004)(346002)(376002)(136003)(478600001)(66556008)(16526019)(66946007)(8676002)(6666004)(5660300002)(8936002)(6512007)(6486002)(26005)(316002)(4326008)(86362001)(2906002)(186003)(83380400001)(52116002)(36756003)(956004)(2616005)(1076003)(66476007)(55236004)(107886003)(6916009)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: UKjHaxxC5f2ClAOr/5zo0aWwu+vYDQBCKvNCYIudwuoz7L4/qTY2qROTPX72QA6vFtQy4y1FbqkmLPfRF81GsI1j89xuCXZpzkk1r6QWx+u4WDKl+3BlJZmFS4ojuGaYo4eXTwnsloUHbqDgSkr+kC49uB4Ng2fSYpefg56nvcQmM4EOHS8GWw+LDP7JOhi0DFBj11ldtrIxauoV5I3UUzGg+xBzkV75QmJj3l57kUtILR2NQJWElYMSnXsBBCiQiOvu1wZZUft7RXw+zaD7IbPCGmLYHTTltGufH7TeSXYnKFjQj83KxOw+lJ6ujN2R15kHtfEruY93gYHqmV4y8Oyq3bmI3l7VUn2pFLnK0AxAjFUYtWLFPsR2ChGeM0tXzm9ioLBcTY+QQTeSa2xD0piePYbs+LU6emkjekx7LwzWmxaTm9mZlpFAeCaPwFG9Ec/HTi8GDCFpbRveVQcKIEWCBO9ZMKvcZ0vrZR1Z2vHlRScS/tD7RpftSK+DsCAKWqvW/UPrsZualYJ4T2JVDH0BGDtfYC3+iaWBMuCpJGRuYnj8GS3QybtFM4t/YdPTsjsRmcrPKbDL+EipqxQW04G0BlPKMAuLXNmdxoZcl6X6WJIW6xqDhAYvhDTjcNS1k+7X4pwYjnzjOlu2eRKRjp6wvQkc94VwnAjN7ACwRsXH/5MoYnlAUduHyM8354vFdrPRLq3h/gDcn+9R6f6Gn6VHkrv3MSeNhBdr/vJZ/OmTenl+fN/FfdtsKsHh40lmzDhH5k378YrCG2Vrq3m4MqTlCF40tHzsqtBy+BPJSL6mpa3wjN1rGDxnmG6ZjLP6Zl6hbReR9wwGcgXB0qmxabLX9iWnilT6D7KD9Gza4n3mPMfHxVnmt84eXS2Oe3jWoieY8FKg8FDxV4wSqoq0+g==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96376bca-1bc4-4327-a66b-08d88c519c1a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5782.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 06:09:01.5725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMSQyLcRLmDjAl4MvFBkKl0dxLjE+HIOpwM7cMPeSuVjAghtBcqN4/KUoL64gjMC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4101
Received-SPF: pass client-ip=51.163.158.52; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-52.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 01:09:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
{"execute":"guest-get-vcpus"}
{"return": [
{"online": true, "can-offline": false, "logical-id": 0},
{"online": true, "can-offline": true, "logical-id": 1},
{"online": true, "can-offline": true, "logical-id": 3}]}

Signed-off-by: Lin Ma <lma@suse.com>
---
 qga/commands-posix.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c089e38120..6452e14a0f 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2466,15 +2466,15 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Erro=
r **errp)
 {
     int64_t current;
     GuestLogicalProcessorList *head, **link;
-    long sc_max;
+    long max_loop_count;
     Error *local_err =3D NULL;
=20
     current =3D 0;
     head =3D NULL;
     link =3D &head;
-    sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
+    max_loop_count =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
=20
-    while (local_err =3D=3D NULL && current < sc_max) {
+    while (local_err =3D=3D NULL && current < max_loop_count) {
         GuestLogicalProcessor *vcpu;
         GuestLogicalProcessorList *entry;
         int64_t id =3D current++;
@@ -2491,6 +2491,8 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)
             *link =3D entry;
             link =3D &entry->next;
         }
+        else
+            max_loop_count +=3D 1;
         g_free(path);
     }
=20
--=20
2.29.1



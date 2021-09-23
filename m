Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D234F4161F2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:21:33 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQXU-0001t7-UF
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mTQSZ-0005Up-AO
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:16:27 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:9120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mTQSU-00072V-Ju
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:16:26 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NBQ6ip008964; 
 Thu, 23 Sep 2021 08:16:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=Y+xIH6owmCPOghcwJFtYp08CXvK3zoAFBKX9ABs4POM=;
 b=B5+MgEGQxNuY4HLnhofyAqa2RI6/L5NTRhD8hLGnEQHCCtrYN57HVfhhSXJUDBgWZaog
 ZS22m7b6k0PGH3NIrfdx6vnSiBA0XBEXQKwwtd0QFc2JMEOSfnHzhVWu73DaIILnFDij
 uD/6ezvUm60ygMOBSIYGcij/R99laEGZfNiUrTLIk6OWMFqzgE/S2td7ZoELifWQDxB+
 mExnSFIxByL702v91NHszQIa/metxBGUQ7BxFojiAli1V8HkcV4VSYIgudMCNltXrzKA
 9nitJNDXht4+sBVT5V7n4Bik53rdutWOOlrr/SQU+COYwq+tjTX7Eskd34Iadxo13ERZ pw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3b88tfa89v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 08:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GadfhsyIS10LjZ99p477MevRHAYdRpQsPtnG19ekRzMNO1z50arn5xoKTkvjyYgyh4hRSIlze65dMTAK4eVXxqVTBmIuNpW6yYFM52vZXYxdK2hZEG4hNSJyz1m1jcUstP6ZdoWvU+xFk5fYVkuNv0pZduPw/89AZJpl6uvsJNY3VTUjp8oQMD4fhQt3g9H61IrWc5sFZwPBYXX6m79QEatfESdfK/8WbRqiYxFPWO6ERdyRukQ3/WYNfZADKjnZmYhou+nKnJ3GlKy4gYpRwboxzULPKwob+RFhXLyKNH8xutfzTbb+aYghpaGkfA00Y3HOmNA5UZX4Odri7thpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Y+xIH6owmCPOghcwJFtYp08CXvK3zoAFBKX9ABs4POM=;
 b=D0XZYDsLq9Tc9adKxzFXRfSNpWUghu2+/JME7Y9wbhGVZB1Lif/jGNgM6GLpYkrH1zz5yPb+q2xAbHDn2H86fDjMo1xQ7p0fzRYuqpKjonGxW32zdK3R+91vmvtR3xVtWQPHfnZj8aIukG80Zi3DWMxMfPmk+ofwrUKJ+rrdhDLeDsy856c+bIM+UkRVigP7xrUtvQ+Q3443ipTXdAk58ho/o415cYiIztSHh9tQf49AhB0ut7x7rmvwXNsR4IAGXmjx3zuFaJWV597Lsoj5N1vRAwJ7xAZszCo2pOC+d5NHuu8r2Mzv254ZCYMQ6rYAjLB6haEG84+GMqF2j2KajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB4541.namprd02.prod.outlook.com (2603:10b6:805:a3::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 15:16:17 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::992f:b2c5:6a7c:3cfd]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::992f:b2c5:6a7c:3cfd%3]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 15:16:17 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "mst@redhat.com" <mst@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "eblake@redhat.com" <eblake@redhat.com>
Subject: [PATCH v4] Prevent vhost-user-blk-test hang
Thread-Topic: [PATCH v4] Prevent vhost-user-blk-test hang
Thread-Index: AQHXsI30NshmTBasgUKEpjtgH4cu6Q==
Date: Thu, 23 Sep 2021 15:16:17 +0000
Message-ID: <20210923151610.26615-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ad63cbf-29e2-4dba-5d1b-08d97ea5173a
x-ms-traffictypediagnostic: SN6PR02MB4541:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB45412CEB471C68CBF3319001EAA39@SN6PR02MB4541.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mxx8Ie18BHWU5joIIpAV5SGA8Kn2+KLJhxHVKNG8GbiiLra6eKlNvt9wOb8ahXdrbSy4Rli4W49oNEAKyPoi++gw1wZ48UV4PxXcZpAr4Qgi2cmYieGq4FlCf3yEjADmGBZl18vOFKdsR1jK1avSEfhWGmOe1YG24gHEk/R6rRAtdhNIOYtjCU+X+5VnzHtlFwXukDJyo8rmg1wR/XyQWW5A+qaRyD+u6foRLr3+4CFzwJgKpd7Vr/3AckNom5LMy8b7F/tacb0HNlYkTTMblF6AtH9e8qRKlNKCyXl3BDaXHSFLj7TWaXWdL+ISiF9kkAuGYGf3b8XP6g9Lt4K1ZbhP0aGE0HthpAUGZ7FNAjp0yv6XUtOJVuHnPgVpI45u+NF0BbMHfbwRilt9nS0ESdWrk2ZX51G4kD4gmfNXwOdeI2VCk71ht7CdAreCQXD+D18WoP3rBZoFcXSXu34V7RnDrz2p7pCQ8EKvfUvOsW31FoozBvqk+NzFu0Z4YH//t1fFzuZME8gE5omr1T8yC+X59ZsQHkyFLVA6V+clwvs93NoSYf6wTUDlvc9cUJWNcCQWIyfxTyi1sjid/yOySSl5A8LO27zzR7FzmgzKZFqFRg0PK/S+/cKIvlqTck9o2qmZV10a4+TJTCWXwlOx1JEzKR9GErw6eHIADTsUF5iTXox7dBgvI9smZW51FeOw9Y6ZonzWx59nF0TfvAbrnIZfwYBeBGCXxVrhKg/KLJkt4KtgPINCLIkRiViWEGjGu/O7e4gkvw1+ZkuLUZEni/APjMgv0bogxgWpFYsghGo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(186003)(86362001)(6506007)(1076003)(36756003)(38070700005)(966005)(508600001)(2616005)(8936002)(91956017)(66946007)(122000001)(4326008)(66476007)(83380400001)(54906003)(110136005)(76116006)(2906002)(6486002)(316002)(6512007)(66446008)(107886003)(66556008)(5660300002)(8676002)(44832011)(38100700002)(64756008)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CrQT2Oe7C0/B23dhYwOwiiKIrTiBF1IUdcSy6xXYqTsQ77JUq8SzVU1cuM?=
 =?iso-8859-1?Q?7APEqxZZ/KHdNeT88/mn6vB+I5w1RsbziinU2kaW4gk/n7E46xThV1Dyt0?=
 =?iso-8859-1?Q?uqROFrys654ykt970EwIsONxiIThDbtR0I3o+lUMboqM91yboeljvFA3BT?=
 =?iso-8859-1?Q?vOxvi9TmiYnkcPfo44thP7/twonf310yh3lwY1/xTc//QOWOEWX1w64+Nf?=
 =?iso-8859-1?Q?Z9jvUIvzwCGm1UfuFLVGWlZTgHEvPJvA+cNfiA8wf6JXy34boNzs67KD35?=
 =?iso-8859-1?Q?/k1k2YTD4IUd0CtD+zvGSygXR2mUYBRmstqJiW0r3k09qkns5WPyBWdKB+?=
 =?iso-8859-1?Q?9uNlPXmFlP4jlAZY6GAJdnLUA17aOUSY6ae+SMmQXBGSc2Mvc4XUDXjk7v?=
 =?iso-8859-1?Q?DPHJ5K88DgxTxgfblGpRkaWc5enBdmQ9aDeeA1Kr17ohR80DlU4NI6O/co?=
 =?iso-8859-1?Q?3r592c5AV0RG2Ck98uo/PvwMg9cwtePjJqpZu4urUqxIgdMgGIbf73SKC/?=
 =?iso-8859-1?Q?Z9pKewR3trphVUKDmiSO0nV577UZKvFdzzLLYggNaAYLMJzcEiPpBxPiyv?=
 =?iso-8859-1?Q?l216V+lGDJHtoCf8uJBfDB2I8yCNmo46uIxxkEW1Gch7spYlMCmYRsdxtB?=
 =?iso-8859-1?Q?33PkZZ1Mw0fgEheTmJaBtm15sDMx0T0TI6XFdcFWfiLZJGflyjkszb8TQM?=
 =?iso-8859-1?Q?SV05NRddvJlwiKVlfSqHwjra7NjtbqkC1ypBGZ0auTqNasBQKXFmpje4b4?=
 =?iso-8859-1?Q?cFLhLTvuVx3g09mAqjCPBloU6Z74Z7aRV051KSQ8Y4MYUU/RVWypljBhL+?=
 =?iso-8859-1?Q?FJZQOlNuwwwSx/3b0S/8glXT7Tj9EaGWvF27xB2nhqizfCuYG8cfFn4XS9?=
 =?iso-8859-1?Q?SWmX6cjHJMNtAvYSojyoeQtG4bgE8mu1fkag8dECp7G0Dx+a5jDv4Xag9S?=
 =?iso-8859-1?Q?hmNTxbUoNDePtnPNmbD6YrOou9oduIdqJxc24ZHMLQ6LuwWo4UM49BiZXX?=
 =?iso-8859-1?Q?wemH2UIOAPmHpy6b4ZSCKlwA0fkEDTaP0hvKyZ4fZhjNpxmN9+F8wmOcOT?=
 =?iso-8859-1?Q?So1uaoCP1Vk1y0shBEeZdg7cDtVQLMkpKkxNnh2AOD+RcqEZpifb4MPCDb?=
 =?iso-8859-1?Q?vS8IIazQKb1T0K7uOrJZnJDY0yZzZdjKW7Pf6VvrP/RgMgkO7RLXMMJhR3?=
 =?iso-8859-1?Q?dVSn/cwcTAvrF0tMdd6znerwgho4C9e2N6J/X43eL6K2mgrckh3+NQrngJ?=
 =?iso-8859-1?Q?6pCKhbsfVx8P+0/Nh1BF65gba4rEarmEiDneRDQ42hvlQUiUY64XyIMHaP?=
 =?iso-8859-1?Q?KI+IyzFuMn3wNVyt6Qjd+14dqrD4eP9u1VUPVWTMPclk6llnJ9hGLqEohI?=
 =?iso-8859-1?Q?u4DKhopI0L?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad63cbf-29e2-4dba-5d1b-08d97ea5173a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 15:16:17.2521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nw84CRJP01rP3E5O5gBkjHB2boafOvevDljhThyEwcnmnyd/qO/isYN7J0rNlupPOG+WcElpqGZLAmb83nJ4BwHFotkPmFVa3iQQu0z3GyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4541
X-Proofpoint-GUID: 04jMAO7x2SV9vb8-9FalZoon6QQ85fU8
X-Proofpoint-ORIG-GUID: 04jMAO7x2SV9vb8-9FalZoon6QQ85fU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_04,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the vhost-user-blk-test, as of now there is nothing stoping
vhost-user-blk in QEMU writing to the socket right after forking off the
storage daemon before it has a chance to come up properly, leaving the
test hanging forever. This intermittently hanging test has caused QEMU
automation failures reported multiple times on the mailing list [1].

This change makes the storage-daemon notify the vhost-user-blk-test
that it is fully initialized and ready to handle client connections by
creating a pidfile on initialiation. This ensures that the storage-daemon
backend won't miss vhost-user messages and thereby resolves the hang.

[1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=3Dnv532bE=
dyfynaBeMeohqBp3A@mail.gmail.com/

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
Accidentally left a raw free() in v3. Converted it to g_free() here.

 tests/qtest/vhost-user-blk-test.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk=
-test.c
index 6f108a1b62..6898f55f11 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -24,6 +24,7 @@
 #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
 #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
 #define PCI_SLOT_HP             0x06
+#define PIDFILE_RETRIES         5
=20
 typedef struct {
     pid_t pid;
@@ -885,7 +886,8 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
                                  int num_queues)
 {
     const char *vhost_user_blk_bin =3D qtest_qemu_storage_daemon_binary();
-    int i;
+    int i, retries;
+    char *daemon_pidfile_path;
     gchar *img_path;
     GString *storage_daemon_command =3D g_string_new(NULL);
     QemuStorageDaemonState *qsd;
@@ -898,6 +900,9 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
             " -object memory-backend-memfd,id=3Dmem,size=3D256M,share=3Don=
 "
             " -M memory-backend=3Dmem -m 256M ");
=20
+    daemon_pidfile_path =3D g_strdup_printf("/tmp/daemon-%d", getpid());
+    g_assert_cmpint((uintptr_t) daemon_pidfile_path, !=3D, (uintptr_t) NUL=
L);
+
     for (i =3D 0; i < vus_instances; i++) {
         int fd;
         char *sock_path =3D create_listen_socket(&fd);
@@ -914,6 +919,9 @@ static void start_vhost_user_blk(GString *cmd_line, int=
 vus_instances,
                                i + 1, sock_path);
     }
=20
+    g_string_append_printf(storage_daemon_command, "--pidfile %s ",
+                           daemon_pidfile_path);
+
     g_test_message("starting vhost-user backend: %s",
                    storage_daemon_command->str);
     pid_t pid =3D fork();
@@ -930,7 +938,24 @@ static void start_vhost_user_blk(GString *cmd_line, in=
t vus_instances,
         execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
         exit(1);
     }
+
+    /*
+     * Ensure the storage-daemon has come up properly before allowing the
+     * test to proceed.
+     */
+    retries =3D 0;
+    while (access(daemon_pidfile_path, F_OK) !=3D 0) {
+        g_assert_cmpint(retries, <, PIDFILE_RETRIES);
+
+        retries++;
+        g_usleep(1000);
+    }
+
     g_string_free(storage_daemon_command, true);
+    if (access(daemon_pidfile_path, F_OK) =3D=3D 0) {
+        unlink(daemon_pidfile_path);
+    }
+    g_free(daemon_pidfile_path);
=20
     qsd =3D g_new(QemuStorageDaemonState, 1);
     qsd->pid =3D pid;
--=20
2.20.1


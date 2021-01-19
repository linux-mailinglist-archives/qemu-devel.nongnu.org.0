Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906B62FC13E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:39:49 +0100 (CET)
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xn2-0003Y9-GO
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcm-0000tv-JJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:12 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xci-0000E4-HA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:12 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNaJt002873;
 Tue, 19 Jan 2021 20:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=S6YIy5eSZef2MabxG1ZplSDUOQ10N7agnUBJJ/wuMMM=;
 b=x1zRb+FwuUWFYYOn22WdwwFnPLcEkrlt0RJ8FCgumFaY/3pGT1snUHs/D8iKbGMbbeKr
 qlK9LywwiKNZr36viYGMoTLT5Z5x/R6qdOytGhPN8utj1gtEk20JKzJu05rnsTv5gocp
 pKqUj78sKSXlyNt5hLz0RTzTTbNkFfz+0/QGNOiv9AN6yv9q2EsrGHpJxdvmNDSb5yZk
 IPexDr9LgraCsNPjeVLQjFdPK6xrNvNrOeW1oWB5BJd8HxuLxdIGeSnpCDViqvJtNVOQ
 AiXLpXvbDd6E13b28P561cn0P34O1QmCRjp7Ua8PlXEGP3k2rD1JyaXYbOfZPaKD9PRf 6g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 363xyhtarw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:28:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPkEP176110;
 Tue, 19 Jan 2021 20:28:57 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
 by aserp3020.oracle.com with ESMTP id 3661er945j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:28:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZE34CkYNz0FxB6u0zVdTXYVmfFr6ONUCXTCc24h/8aN9Jhm+NR5hsUF8QZlR9BlksymAFc/QT+59LW9mO4Ivr2reytArwbRmXj/EtOlgjJEIDBItyBJ6z1limrrDoTYM0oua9kMiSn7qmyHg/jb0cmCNS0kMHeDgfhUNOpv00QNPUDKo4UbYUsrK+1+DUorf2cyILXQ2hUrI1c9zTI2C9+q7eCDzS7jPqlz5IsJwOFWFGcHxFailFnRSKkNpkITezQqv0FhNu/1RxbSHZ79dWsWad/SAUhub/rTTlc8Ineypvp52APB+OliPjzzohIRJh9A/WE0heng1Rl67ZMk45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6YIy5eSZef2MabxG1ZplSDUOQ10N7agnUBJJ/wuMMM=;
 b=JvP8Qn85/pifF2tAyfztFhcc4avP9Nk84bKWlREDzeFOXUFZx8wYbpn27Ukof7B6naQfNa1TTNbEfCFprmLU42Tvbs9CJzk9SArTTylEUeOCh3J9Hu2yOhUJvq7IUf48v/COq92+RBr/1HVR6yifG5B1wPa3kdLefOO996db67KegOHfPgnwOfeelcmF7w2lOIwsyN91GMocOv3PvpspYe9qzr/6pNYr7JEn7aZOOQbzI1z3/MQg6P+KkeiOb0f3bh2Hmy3ezq/3xVarzixQD8DTEsegQ1I7GmDuwMfOubt3bLVE71lYr8JnOUYsTA+sCQAeerlgZ94HG8OxwdgcEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6YIy5eSZef2MabxG1ZplSDUOQ10N7agnUBJJ/wuMMM=;
 b=aBQDDcVbdDMxB4BpnOioz+4b06XVZBoRPvW7zeUaEOG2bxIhPx4yb9dj/W1bRv039yjKfvPkUQ3QrMgrD+KlWHvR/z6Y+LFpijBPkHmLRVuOOHFLk/8rdZmLnfDqeE0SpSPlHTNH0DgvH0Ems7ZfYPbxOXrtzTswqUQfuIVgntw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:28:55 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:28:55 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 04/20] multi-process: Add config option for multi-process
 QEMU
Date: Tue, 19 Jan 2021 15:28:21 -0500
Message-Id: <595551af14a90aa2bae9d0b9ee049a9af1379681.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:28:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ae761f1-766d-4f8a-7031-08d8bcb8d7a5
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB33497868B7BC5AB67300310690A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7f+QnmrtcJ3mqoQFztBDjN2TB203fEohIbxyaQQm6JP+Cp/CTaujiIxXMVMnyq8/pkP9xuNF+USz26bjy53fzNfX42+dwKjNUUrpY1+KrLdoTSsoKMc7NHt4jHWuFo2dtHGsRja6shdOMc1Xz3815MAPnSTJzG2dJ34Mvo76TdN0HMqCTHKK3gzZ1unPWfU5IovHZaHVn+cvSn/xiRByUQqtWeMyB+GQGCXMu8vVmv/OlI3XbfuKBqzzgpu/D2ba9Vwxjd2vhQaX4KLG+0C/t/Qt9BVU3SS03s6GgkX9M4OsfNPqN9dk9KZ5rrXre5JQQ/FlTRkQEGQh8LwIH+NoJ5aRHtqHxRjwuCWm8SMPmbBn1nmdyyh+nCXOfryYfbgBiRIVMDuFgPJFVLAingYQqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uw89i+pLz58Pcj2nzbOoNfs2BJSW8sNW+2RRVuC+v8YjkxWoqt0b0W4GsPXu?=
 =?us-ascii?Q?YI2gz2A9sua0fpUHxUmaIptaK37eOB05kbc8ULqXgvl/Dw6heuogu4bgik11?=
 =?us-ascii?Q?TukgZ5naaihG5qxvelsmsyMaYzqI4Myd2e1WpGVPZyX7D6cVX1iRMfVZFJ09?=
 =?us-ascii?Q?FE/IRu4RLHbsEf8gDJFN5VB6n0nOuGhdYLu6I5nb84nx+alDfEcj983/KqnR?=
 =?us-ascii?Q?qXhyC5DsM3YLg5OJ/OjEuSl17jUpHPJr13t3CkBgrtkFsNbP3eQK++RoMDKN?=
 =?us-ascii?Q?/2x50Zy863LFKP6+6sL4T5h5tpnkevsqsG71wjSnRvVkPgfS6lyfrc+Qrptj?=
 =?us-ascii?Q?e19/BzB52lH0FQIw3nawLrOBZMjxFxjoT2mCu+cd87el9IOWWy+Y94qkbhji?=
 =?us-ascii?Q?ta4Mb6FHb2td6Y3McUNd00JdrQiW39IaGthhjV7Afp00GBo5qGVpDIdQbmYB?=
 =?us-ascii?Q?bkcUhvfjZ0hi6mdo6TN2O4RgRRHOwe85ij4jICwtuNlC8L8LynWRdm9n7IV/?=
 =?us-ascii?Q?tJ4EV6Px0z0XuJ4gc5/1VL3SW+hTThAr7+z1ifgzwhHuoLS+nXXpVgNEbbn9?=
 =?us-ascii?Q?tMnyvLvrrfArautGGLPsiPN6VTiv33scZFMyScmjY1nVon91YF99/XQXokqN?=
 =?us-ascii?Q?gMwKKt6rPRQMioHmD3IFioe+rMhH8Qe8irHqXDT5KgoEfFx9AGH9pWhQNEUd?=
 =?us-ascii?Q?VLN97PVHgWQbb/FcAXanFn8wTH/pYj6q3pTvmLCcefOp75dxo0PFp2erDIEl?=
 =?us-ascii?Q?6fgMtLlsBC7SGkKfATVubEmndVFjY/TjJrlEvq3rM4H9UToysedMlo4XDsuU?=
 =?us-ascii?Q?Cv0PqUi/rB21pm66ODdpyJ+zjWzs6+BqxD3PkSx6P3xVYXS6dyM1Cyh1hM1B?=
 =?us-ascii?Q?E3vjDmvxgXSFgTfGXvy5m8HxAeP/OzxMbORM7y9yrSlb9C49V9GZRruLKEsN?=
 =?us-ascii?Q?J9qpN+7NTvv0w5w9gW9KxJlfjM5uaeSF6yRI/l3pKkE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae761f1-766d-4f8a-7031-08d8bcb8d7a5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:28:55.3081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7FjalWf5kBmTCo7oLmQqa4w/w9hes4h/C8tA3rqvzLWOmAmTmyxKEFVF15pb2Bj1KRkyrSpjin0jVCSEQ88Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add configuration options to enable or disable multiprocess QEMU code

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure         | 10 ++++++++++
 meson.build       |  4 +++-
 Kconfig.host      |  4 ++++
 hw/Kconfig        |  1 +
 hw/remote/Kconfig |  3 +++
 5 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 hw/remote/Kconfig

diff --git a/configure b/configure
index 9f016b0..1c1ab0f 100755
--- a/configure
+++ b/configure
@@ -461,6 +461,7 @@ skip_meson=no
 gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
+multiprocess="no"
 
 malloc_trim="auto"
 
@@ -806,6 +807,7 @@ Linux)
   linux="yes"
   linux_user="yes"
   vhost_user=${default_feature:-yes}
+  multiprocess=${default_feature:-yes}
 ;;
 esac
 
@@ -1558,6 +1560,10 @@ for opt do
   ;;
   --disable-fuse-lseek) fuse_lseek="disabled"
   ;;
+  --enable-multiprocess) multiprocess="yes"
+  ;;
+  --disable-multiprocess) multiprocess="no"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1897,6 +1903,7 @@ disabled with --disable-FEATURE, default is enabled if available
   libdaxctl       libdaxctl support
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
+  multiprocess    Multiprocess QEMU support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -6135,6 +6142,9 @@ fi
 if test "$have_mlockall" = "yes" ; then
   echo "HAVE_MLOCKALL=y" >> $config_host_mak
 fi
+if test "$multiprocess" = "yes" ; then
+  echo "CONFIG_MULTIPROCESS_ALLOWED=y" >> $config_host_mak
+fi
 if test "$fuzzing" = "yes" ; then
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
diff --git a/meson.build b/meson.build
index 3d88985..01e25bc 100644
--- a/meson.build
+++ b/meson.build
@@ -1194,7 +1194,8 @@ host_kconfig = \
   ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
-  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : [])
+  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
+  ('CONFIG_MULTIPROCESS_ALLOWED' in config_host ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2508,6 +2509,7 @@ summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
+summary_info += {'Multiprocess QEMU': config_host.has_key('CONFIG_MULTIPROCESS_ALLOWED')}
 summary(summary_info, bool_yn: true)
 
 if not supported_cpus.contains(cpu)
diff --git a/Kconfig.host b/Kconfig.host
index a9a55a9..24255ef 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -37,3 +37,7 @@ config VIRTFS
 
 config PVRDMA
     bool
+
+config MULTIPROCESS_ALLOWED
+    bool
+    imply MULTIPROCESS
diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b..525fb52 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -27,6 +27,7 @@ source pci-host/Kconfig
 source pcmcia/Kconfig
 source pci/Kconfig
 source rdma/Kconfig
+source remote/Kconfig
 source rtc/Kconfig
 source scsi/Kconfig
 source sd/Kconfig
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
new file mode 100644
index 0000000..5484446
--- /dev/null
+++ b/hw/remote/Kconfig
@@ -0,0 +1,3 @@
+config MULTIPROCESS
+    bool
+    depends on PCI && KVM
-- 
1.8.3.1



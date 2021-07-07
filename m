Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4873BED1B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:32:14 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BPC-0000ms-1K
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKY-0000RE-DN
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKU-0006lL-69
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:26 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCNpM027395; Wed, 7 Jul 2021 17:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=BBeWnLRn9nNNpOjCplQJxzFvlhXSUah4N1iMBB359ns=;
 b=eECbLmCqBt/ZVTL3Z7hcAdOFK1/j/T7lJ+GdvzvdEnUriP4ijcQGLla4BNjg/iTkFwiD
 ScDfZu1L4vPZirV/grL6ZZaIWwrmmYatTQU3231XJw/IrSSlONXLyzmjAvUqj9lWDerJ
 wsQ2O1Onq8vmbGvpB0f4i/5ykhCnntqeLH1SNr4JYDyAXvPWmu4Dz4cgRFrLlYtlljK1
 uC+v0Sm+Bn+naTMwEi2z5Kpwuk6gcyqt/aXc2MLDyKsqgLFXLO4pFPbdS/VLAyclEFyb
 si/JF6psPcB/1uH8fkOdDDyg08UpzDshhpDkv+19ANMbWlzLAJDISjQj2rD7U4tKk77A LA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2smmq74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAKTF068866;
 Wed, 7 Jul 2021 17:27:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by aserp3020.oracle.com with ESMTP id 39jfqayy1b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyhsnV7cQgjw25kusADxx/ucFDwKm7WwyHU+BpN6ALMDqH+hiepaeeDYxHq2M8DZkMTpAIOnmr6RjOS6VwfhDwqCcl0Ma48dX9bCIxkCC0UfOSqkEr35M4MnZC+bwsPPLtsY42d/7s3OMR5JtvYvKXOdy473hM+HIiiOmDTvLy5gzJ1YkHJlkNDGg638ofAGFFuodpb1GxS4tcqrFn54w7HfoFaavLYl+rnFEaGDi4xyr7nBYWxLtOf0VT4z7IoUiR/Xt6fEoIvPDhEwR6hmFNjN9AEHFmRF3EuJ/IL1OKNyVN/3/O39Kfj69dV5i5IGKUeTBwQfOCLlauZlJ4Yw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBeWnLRn9nNNpOjCplQJxzFvlhXSUah4N1iMBB359ns=;
 b=lqXKgvJAkKoEZr7nxFKki1VlXkHC+cyGFM6n6EvKj30svL5bKMEhuUOGC+2GTj9/hb98ldvfqS7yAOmOrTxh4K6T+GQ46aXI/sQB7oP0rBAAsDfMsxIIGkVHZYqqB/uYq7yVHfkZ9mjrowiWNf9GeXM9kSvPVYqkmvkVM2Kxg6K1GKJR7eXwyL9hVSMJapfc388uPJzA7HNb2x8ByKlbAzsWNSzYUgcaiSVaMEXQJxTpG4UJ6NxiJMj87O9686dJDInRvtIeezshuuq3ujXtRH3xjVRfcXusK17ORCj8E5Ie5TTLj264EEL8QaPYFhg4Aw87nhBb5AvUrFVOHc19PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBeWnLRn9nNNpOjCplQJxzFvlhXSUah4N1iMBB359ns=;
 b=rlFSiKYYQQYpk2xUNScEa2l2cbeXuXT792fSbNRlbt6lHORbLLg+B+W8aBXkZzDjSfBDJT4xLxZexREHScSRJsmy7J06V/uUNsiEqlSwEqB67bhY8Y0b4q5qKZIXkP9YPJ6719tpAoarA/J8HNb/yCk3/a8fSZNLy0UfeEQFr0o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB4104.namprd10.prod.outlook.com (2603:10b6:a03:11b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:16 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:16 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 13/25] cpr: HMP interfaces for restart
Date: Wed,  7 Jul 2021 10:20:22 -0700
Message-Id: <1625678434-240960-14-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77bea887-b7ff-4c5f-ca20-08d9416c7700
X-MS-TrafficTypeDiagnostic: BYAPR10MB4104:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB4104FFBDACFB6822DB31250CF91A9@BYAPR10MB4104.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bdYITMFtfbNqpyD7aR8XvcvTDcmAQvOXDuBxg/3s0bX77hiH9YiFGP66Ow0nUfjqysIdxBgcdVew6LSYFk7YQlfC/JpSTt14qFaBKbEwD24Bkatt73SU9JdLEk/zUy2IOYpnfwbvrQBIME97sWQvtgIwY7BDBK6h2DHjYIzt9/iCjyZiueJro8r9CsKOVNKLkLqdUeLBLA29Mm6QHZXDM+ngCacNsb7wr5864Ossk1pZ6WcbTNH3XI8Ro9ZguxSCto7JwLBiCUwcPlR8PBNlWQ3RW3O9vlcXkvbxjEYWAWKyref3L39eGYu8ru79aPEIrWauQ3SGZSxG4nQXKUYhOjDjvf5Oa736FYVuzjEfmgdVlYR4sKrdGEtLnqOHmkYaMU23an2afkDNV9k4DiVYFTENKSLLxKRNgOn2zzDl6yAYMQ9nOV+4E6coOJfliaAwtOwDEso5yMlyQCoEN03f8SeOqaPv0Mntypat5a1aGYlCq3FUvZSMuk0zTnx4csyiRYQGTpyZjc8jH7+QLNlY6d8Qu1tYXLbEz9WUzEYzDwatqErZ+/8M2c1XdVK2rXYrjm6Zfbw7jSG0Mmo5AcRLwFjuO0OMyjYkgZIGnnNN4B00lOW8hSveWj7uER8anwd0frL2XYiuTJXw8CupRzz58FZTP7+EJfmHmTIJrPyw1Y1bIndpbBJThoJx6OJ8ji/gvhBjs9IiUjsSv9fdiZNn6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(136003)(396003)(346002)(478600001)(36756003)(2906002)(2616005)(38100700002)(186003)(6486002)(66946007)(8676002)(7696005)(6916009)(956004)(8936002)(26005)(66556008)(7416002)(38350700002)(66476007)(5660300002)(52116002)(54906003)(4326008)(107886003)(86362001)(316002)(83380400001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1W6gOfvgCunqjHUU8GuKNIvd3pL2RU+/IQ0KWtSzuDZtGEVhdoGOy7tKUx5V?=
 =?us-ascii?Q?/yldVHd/A3sAnH3jB0mB6o1SELPyEfmWSJErFoOv94bX5fHo7KhOOn4DjRL9?=
 =?us-ascii?Q?gqrOUf1HbcPIyLG5Zq8wS3Rim9b+MxCWgZxv1BPR5CpfnMrl6L2M+rrsNrOK?=
 =?us-ascii?Q?RCMD8mVp9Z4Lh0rsgJ5IHKfVihhbrBXIFydyea0d5/rnezS9C4ivMqrNn1jf?=
 =?us-ascii?Q?nzCTf9bYFmY7Hvuka4C/Ya1jwhk+/daBuc0doB3iDB6en82jqUu3Phm5zmT+?=
 =?us-ascii?Q?Z230/v1NWnjarNXVapgCYyULEoOGB0ub3a3WiVAoQ4vMtB2CsJH9E2zSao2Q?=
 =?us-ascii?Q?PkyiPt2wn7Mt8OIqBFWgjeuy/wetysofGDq+j/SJAuwmvgviaJJ5RfxMDzRI?=
 =?us-ascii?Q?4BMGVJGmlHSCrX5MFeQycU3aKEnHf2HHP7kmIaR91TftfRVdDJUrLef/Vd4U?=
 =?us-ascii?Q?8X8OhGRC3tOP7agj9F30U1jLd2Viw5WwwgXUMYUr2asUqeVn+cl173ArSxhN?=
 =?us-ascii?Q?XtObCNsp/hmsSyrGRyj1dMzyUi+RdSzhz0gQSqvhw1QuW3TWmZ24oOJ5J8ab?=
 =?us-ascii?Q?Fj9DrmYbR4kfTcvARN7xH/DxRfWgYRm/9djZYr664WJEIwY8AwKQkePsqJo6?=
 =?us-ascii?Q?NZ0PrFpI3QaSQNwqqnhWSmpzwEh92SSKWysRX+MXFFCKnlbC/f+iNMxYgtAJ?=
 =?us-ascii?Q?1HNxLP4rKrTqZDkudpiJBRQI1+MqQebKJLuL9GonihIhbq2EFIU+iiB8aNOW?=
 =?us-ascii?Q?Wfre74GpYosT3zusji0ohC/YmQDxOb/uva7LtboUQxzDyt/m4lWcTKrZQN8E?=
 =?us-ascii?Q?FZ0D89XejCWMgLbAbd9i/YScujIvVQJhzWhRTrsxjdSNnKJSszjFtL7Bdgj+?=
 =?us-ascii?Q?ZYLkxzwboP45f5rJKDYu5pdX85bQZ67isxO1/M2aBVmVUCCV0GOL8QpCr6dD?=
 =?us-ascii?Q?cy2XJTuGmJsmBwN8m+Fxf3t3qxiRCdMIM4l+dx8Y+haUZCfpSXyHZCGbg+t8?=
 =?us-ascii?Q?O+5q5d/TmBf9fVwnpAwIRA3z6ONFdcXTjAUJmnuN4pWwcmvhrdL9qig3KCCY?=
 =?us-ascii?Q?zXTUxLj35mPFpbx418EPab90SAYpKyBJz8caMtI1tQgLzKv8ABMOTPOr3Geb?=
 =?us-ascii?Q?nOmbK23YtWyLA4FvNFgi/Xaxc9TrIV+BaOwDjJsyl6HCq7GY+ET2QL12Wdq5?=
 =?us-ascii?Q?UFsW94MO5vExqQReR9rhaz0C1t6/NsKbf82YHKr6D0nbDk1Jc274Osqst2zU?=
 =?us-ascii?Q?tkMAC5IJx55ue0PCG8y5HY4Rs2WqcAoLh8xRudjQtBeKV71Jinf2enEQdYrh?=
 =?us-ascii?Q?umdEPPO4n7B65SvBTyINE3zz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bea887-b7ff-4c5f-ca20-08d9416c7700
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:16.0998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2CJ31efuyq2mtp+skzQefNkwkr3lr2DfY/gAc+O4sGjh7QtkqMf6OZZ9CS6GbzKNV/GWZu1mDbi+Q8G56NQOQIKkaZVY1DKv6JdhmJZ0dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB4104
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-GUID: mCuuVS-UdjLW5Kn7_Lb1Ju6Fi42BkCTw
X-Proofpoint-ORIG-GUID: mCuuVS-UdjLW5Kn7_Lb1Ju6Fi42BkCTw
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cprsave <file> <mode>
  mode may be "restart"

cprexec <command>
  Call cprexec().
  Arguments:
    command : command line to execute, with space-separated arguments

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 20 +++++++++++++++++++-
 include/monitor/hmp.h |  1 +
 monitor/hmp-cmds.c    | 11 +++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 11827ae..d956405 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -366,7 +366,7 @@ ERST
     {
         .name       = "cprsave",
         .args_type  = "file:s,mode:s",
-        .params     = "file 'reboot'",
+        .params     = "file 'restart'|'reboot'",
         .help       = "create a checkpoint of the VM in file",
         .cmd        = hmp_cprsave,
     },
@@ -379,6 +379,24 @@ If *mode* is 'reboot', the checkpoint remains valid after a host kexec
 reboot, and guest ram must be backed by persistant shared memory.  To
 resume from the checkpoint, issue the quit command, reboot the system,
 and issue the cprload command.
+
+If *mode* is 'restart', the checkpoint remains valid after restarting qemu,
+and guest ram must be allocated with the memfd-alloc machine option.  To
+resume from the checkpoint, issue the cprexec command to restart, and issue
+the cprload command.
+ERST
+
+    {
+        .name       = "cprexec",
+        .args_type  = "command:S",
+        .params     = "command",
+        .help       = "Restart qemu by directly exec'ing command",
+        .cmd        = hmp_cprexec,
+    },
+
+SRST
+``cprexec`` *command*
+Restart qemu by directly exec'ing *command*, replacing the qemu process.
 ERST
 
     {
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 98bb775..ffc5eb1 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -60,6 +60,7 @@ void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
 void hmp_cprinfo(Monitor *mon, const QDict *qdict);
 void hmp_cprsave(Monitor *mon, const QDict *qdict);
+void hmp_cprexec(Monitor *mon, const QDict *qdict);
 void hmp_cprload(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a56f83c..163564e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1217,6 +1217,17 @@ out:
     hmp_handle_error(mon, err);
 }
 
+void hmp_cprexec(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *command = qdict_get_try_str(qdict, "command");
+    strList *args = strList_from_string(command, ' ');
+
+    qmp_cprexec(args, &err);
+    qapi_free_strList(args);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_cprload(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
-- 
1.8.3.1



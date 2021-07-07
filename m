Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282BC3BED24
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:33:52 +0200 (CEST)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BQl-0006cw-69
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKX-0000Mv-41
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKT-0006kY-0a
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:24 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCNpL027395; Wed, 7 Jul 2021 17:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Ql4BaF/gK2L7/cYlLylEl2VIg9AptK3OxZelqg16maQ=;
 b=xipHHSMwGUAiNq2Ifzwvq8CH2BsHT564qmH1PRFLy+GgInJbi24msrrWu8uo+0FNlFf6
 IAhGp+deto9Cw5xyK597fUlgA7n+0LVAQiknGKi83h/uIPczQdOLwJVrqvbJ8zuW2XGY
 tkC97RDjl/R1j30GNqLyFO2AXyqOl9DlabX8CQBHpJ2T0u3vk8So1bDcK34kiUWdwarc
 NYwywUeFIuCyImdsSxLnWGEjek79H39hz57DBTf6rcwLzSDq2iBiVqM4Tl+J7m+6TD3G
 DBbmHokWDRAoPBIhB8DDIXA5Qsku5yVp4YC2TxgJ5QsddziF4Gj5Gn6sRO0SPoj5d40W 9g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2smmq72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAKTD068866;
 Wed, 7 Jul 2021 17:27:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by aserp3020.oracle.com with ESMTP id 39jfqayy1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V33PLQRimgdgR9HxFj5xL0L1oBBtIGEcoJ6Anqjh2Epe/Vvkhc51nP+Ra9gQyNIjiMR4BZF5envwtUswnwYuL89oKkSkGqvWUs1ryj1ewf5BG1VTFOTVo48xcrqwC3k8EdVcLCSkQhljLBPInbbhDyMqueYdMayi8oHU+szrcDKFtAWXgv5Xq8XvZmUojtPmIPLDwOQvsuKH0VSIT4gmiBMVDS9Dr3wotGEQfo5alRQzRROksgT+opfJgZCSPPaZaG5kRJTi8VOriRom9fFKsAWi6EZU7TXewA9K1rVS+l6/5vhyZ/nypt6SGNXqMKhgqNmEviPfbXVR7IDnUKO6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql4BaF/gK2L7/cYlLylEl2VIg9AptK3OxZelqg16maQ=;
 b=OTEv/gnYsqY7I2OKhRWFBVD7LPtK7KP7j3gVpT2fYhnNTVu0gBoE9OOAtP5DDXr/SjqvLh12YvndUE+l36PJLByhNHKNLcblZnEDRuXdGKdi+T0bK0O3it63msgae5NXOC3zKakmNuhVcjUyxp4k1kkwN8bjxy2HyN8TqyuZjREZxraido0u5YAFuMpxrIy38TycxkQcQBEW/9Zwgzwdh0lCwlWKYysB3CrIRpT3OGBOewp37iIIdwAAiKAqBwPeJP5fRQy0kY6sTaMGLq74NHoOb+QBC8hnA4an21padGTua+xqcJJajH1HMXy3ES1rcy1ps8YQoo+gdQMEVGZWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql4BaF/gK2L7/cYlLylEl2VIg9AptK3OxZelqg16maQ=;
 b=s7r5s4akNh+qeblo3FkSpRF0JkRfRXPgTSKX20PYTlyak27fU7o8BJCjPH35lVYhj7MYChJ+h9jfJDtR5aRDZj949AT4pxmFbCzLBPAgTTfz1If1qyaa2Q6mySNBdaHb8Qihyec6nn/2EEmnRy+rauGTPwayNCarc1AmonUEVD4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB4104.namprd10.prod.outlook.com (2603:10b6:a03:11b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:15 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:15 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 12/25] cpr: QMP interfaces for restart
Date: Wed,  7 Jul 2021 10:20:21 -0700
Message-Id: <1625678434-240960-13-git-send-email-steven.sistare@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: a50d6463-fe2f-48f8-b9df-08d9416c76b0
X-MS-TrafficTypeDiagnostic: BYAPR10MB4104:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB41048865A1132C2834478BF3F91A9@BYAPR10MB4104.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d0hbcMmMGImudvYRMFU5aOtzAImGtkVa2sOq2Jiao8uBH7hFeNVxvYaVETs9kDPs6uA5uQZJykpi1Pc3KyWEfEm71HqvDkt+2RH8Oc3U1ByN2epxpOjbQ2YBkebtNbi/91a9DgRlP0p2BOPN8GqI34xt1aVsr9Sh4f7R/1JxV9jhm6iCfl+WVEvEyeImt3mR2aNCdqu9LNclGnuozxcQ9oSghliQLuh4kfz/HHuQt3rbac6EkoutqAm5C0qLoIo2wLhiXkjmjByH1PMqu/g8hRK3a2rtOECzRGCZ2NwwDav/uzFWdh5iOqr/8GQhija6IDPEKcPDAXIVYsFrEpkJevu0xFoXnoI2iXcDAauAOxo4gfZ+X57xzoaWHEPuxc42T1knE1Rrf8I4klvq/15Dl+TjwWlcUviAsm+evQztht0tCaWXPnQja/IVRI69sN6xIk9vpZsZ0HTC+OvyUwMDGqvjMoFf+MxCNSgB4WnOEfP+E+LZhROQfTupNGiWFoOGdl6aRdqpMVAEJ7p5p14lNselwh1haU/yLrv3XbbmLRt54Cj+FL4JvNfZdVF8DjQwcgHL5xKmT30vPpJ2TDzyJTmNPC/M7lShUvA4QfkAH3Uwef0v3usKYftiu6c5KymJVhIRjLs9iDP5/cMY4KM0YInE0vvu13gfzL+0bNTRXHC9DBnK8vNzo4M3YMy32plLLMsAeK5JfoUz6ePXFIRXoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(136003)(396003)(346002)(478600001)(36756003)(2906002)(2616005)(38100700002)(186003)(6486002)(66946007)(8676002)(7696005)(6916009)(956004)(8936002)(26005)(66556008)(7416002)(38350700002)(66476007)(5660300002)(52116002)(54906003)(4326008)(107886003)(86362001)(316002)(83380400001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Og0g67iTIR+EQOCNnisBvdJD+3TvDyqcEik9VyTh0gPNqu9GfsJmlUwm09Ns?=
 =?us-ascii?Q?XJWC4YfFBS2ro0rvI5nB0e/wAlFajf9YjzUxs/HPgB8FJ468nD5i405IuyPG?=
 =?us-ascii?Q?xaDTjaGtXnAHogUYEgZTKLuzSrKgWtkgBqrkFbHi2VqSlczmu3Od4a5pWKve?=
 =?us-ascii?Q?hldDQzdWC/6DksypVWjWeqzZqcwTHNyhFpbtmZoX40ygeMtYQnfZnvvgktas?=
 =?us-ascii?Q?e3bdvoB4bNdBI/TrzfK8hpGjcPEeFkN+We51Sv7tNcXeyF2pqln8PgSU7GOr?=
 =?us-ascii?Q?mswDxe09Vy93V8IyG22UXvXUya7jF5L+DVgwMuk4hX/Q6WDZ8Z79isTRR6OY?=
 =?us-ascii?Q?1irlD38h4UkPwGJqaroblVA6ig9eDVZiEvkFvrkTlBTOIEmefuIYD2WuQOyM?=
 =?us-ascii?Q?6dmML0/sNMbdgu2zvIqSF+bYaFnQgV47GIv0a03P2qCMwcGEJkaAaiQWdBBx?=
 =?us-ascii?Q?h0LuYkymsRAsMyWxpIIrCAA7a/tANnW+w+NYMYc3TDBfExwqKfnHRVS6perU?=
 =?us-ascii?Q?miy/z+Shao25HNmG+UrGnxuZJ0aWMg15Ht/4oWxB+Hn07aU5cQffICEw9Zdl?=
 =?us-ascii?Q?iWiTgNE5n0BW9nr7+L9JiDDejJkn60UdwwTYTk875O7iT0nlRVnd/anVrdWh?=
 =?us-ascii?Q?o1eb1Y+7Vp0LYrfF7WnglE8QrAsKSYQORrlz2cD0ujXeSCc37g3pugS70+el?=
 =?us-ascii?Q?O1bMT4sN817E/qhCFMJ7suZEvK/qCo6zVR5k5qUwLX5hwWT1gyLOHwJhotkm?=
 =?us-ascii?Q?dCd5AsZL5ar287EOBnAaq27pR0VYF06Gm4negz4phKVp3hGRTOXvJSeRWVjW?=
 =?us-ascii?Q?pyRsyCJbCjDyIEV612jV15Lo4H8sBG3BWxuLGvmQCPZ2rOvUvQmXXcpNI2Pd?=
 =?us-ascii?Q?399RbCQeqfzsX2FHvrsPsBEfYUcGr0ZvXoIulyhF0rgXVh7C7vljQ0EFu9Eb?=
 =?us-ascii?Q?KZLMhyxh5on+SBDtONfjHksBM/Es3I9vIZWfhlofv4lfxllKU5ohkGujGhGt?=
 =?us-ascii?Q?MGlJnCoS2a4MGNUFXsOE02iklxVLJOcs8J5zIZf73kT1NeDtHn4jzKP6Hw8m?=
 =?us-ascii?Q?re+7Kr9dUk4BvmXlIzRMiRlgT8rqmbsrDyypPCVKogPaYHEkE9Wv3ywU5Cuj?=
 =?us-ascii?Q?ibPt46b5RPpc9VNpWttl68SAQgZaK3vQpAEP3UFTOl1HBxdRsbs5/U2DQASw?=
 =?us-ascii?Q?kyi17Qt4KxswLVcbUcdBxyXJLByNtJ3ZY9/1eMatThgNTVAaN1qfMBlRVFvv?=
 =?us-ascii?Q?8CXwGhFfu/khLDHCsN4cRjg6yCHe315bwjTAt/gapr11U3xkJ9Ox8cgRF0A4?=
 =?us-ascii?Q?AgCdifCGdlDgUJHC1QkIQi2B?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50d6463-fe2f-48f8-b9df-08d9416c76b0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:15.4621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkBbvqDB067lb9/CbUIB9SacAKYFpr8zq0VIEDq9iuTyECP5YwKWLfmwrm/lg0D1NG6YGAh2GPgpg5m5FhyqeCa08P5gMQbAXW7N0+auE3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB4104
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-GUID: HGXKVT_jyeJZQvRaknTW1QWYCmQdozo-
X-Proofpoint-ORIG-GUID: HGXKVT_jyeJZQvRaknTW1QWYCmQdozo-
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

cprexec calls cprexec().  Syntax:
  { 'command': 'cprexec', 'data': { 'argv': [ 'str' ] } }

Add the restart mode:
  { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 monitor/qmp-cmds.c |  5 +++++
 qapi/cpr.json      | 16 +++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 1128604..7326f7d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -179,6 +179,11 @@ void qmp_cprsave(const char *file, CprMode mode, Error **errp)
     cprsave(file, mode, errp);
 }
 
+void qmp_cprexec(strList *args, Error **errp)
+{
+    cprexec(args, errp);
+}
+
 void qmp_cprload(const char *file, Error **errp)
 {
     cprload(file, errp);
diff --git a/qapi/cpr.json b/qapi/cpr.json
index b6fdc89..2467e48 100644
--- a/qapi/cpr.json
+++ b/qapi/cpr.json
@@ -16,10 +16,12 @@
 #
 # @reboot: checkpoint can be cprload'ed after a host kexec reboot.
 #
+# @restart: checkpoint can be cprload'ed after restarting qemu.
+#
 # Since: 6.1
 ##
 { 'enum': 'CprMode',
-  'data': [ 'reboot' ] }
+  'data': [ 'reboot', 'restart' ] }
 
 
 ##
@@ -61,6 +63,18 @@
             'mode': 'CprMode' } }
 
 ##
+# @cprexec:
+#
+# Restart qemu.
+#
+# @argv: arguments to exec
+#
+# Since: 6.1
+##
+{ 'command': 'cprexec',
+  'data': { 'argv': [ 'str' ] } }
+
+##
 # @cprload:
 #
 # Start virtual machine from checkpoint file that was created earlier using
-- 
1.8.3.1



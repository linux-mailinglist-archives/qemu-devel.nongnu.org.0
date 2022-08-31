Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AC45A8844
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 23:43:40 +0200 (CEST)
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTVUp-0004Xd-3Q
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 17:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oTVRW-00029l-6k; Wed, 31 Aug 2022 17:40:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oTVRP-0008ND-9c; Wed, 31 Aug 2022 17:40:12 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VL0xNL031375;
 Wed, 31 Aug 2022 21:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=QG01RfUs/kBeHw5kd3oqPDTED4Q26ML4n5C7iSbz5B4=;
 b=KQrMQu/lsNshYyL5FlSLax/3w4L+wqmXT16ZNxPgeiPOt5yuDIQ4NPA6HYaN13xn+kHv
 XHhYwvVVziKpb7fiawB1mtRjaABrqe2ETcDZg3M3TmXLyZAVs05caRk+Y8sW8gomTaT4
 8xP+sIEgPlnbbDHdpi5sY6WePSEFiyhBUDrfVbhWo9MNGOwr8qOVMSOkMqod4auQ6Wpy
 rTzcmaJha7auXSy95DIrQTgkSy4UEeWqEfLQmMd/0qMJpPselWOg9WwXDCHN62ppHYCY
 jK00IcznI//1iOLCikvq3DrTZuEQv095NX3uwyvMObgALztgQ95Cr08NBisW07MOB8dm KA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7a22aey4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Aug 2022 21:40:03 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27VKDOeq022063; Wed, 31 Aug 2022 21:40:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q5fwag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Aug 2022 21:40:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4etVrtow/6ZzMCx43qG68nxTAZGA+g+SzxRTW93KLcrHuep3GxDMJ9+8tahRkkxxJxoHtXMU1u1oOqUAPi90XKM/pPANuUwxDBQ1kPz0jE/IGreB/9gFh/hvm2EjFuGOiaiO3ELtj92jfOKmlQ4R9KFqa3COlRaJd4TRnDfGQ4IYHVd8TdE5MNi8XI8H04XPGBdezwGBQlKMSY80FmupJ+h8dyGlA9UBHSiNYnreEjPBUNpCXv3PtEXde9jhQl0vqqcy7pGhigXwm9T6W/lfRnhMMWTiKv3gMJePW4Txdvby/RJMnOP+rRZlWC2JM3eyybxrkg2ByyHCirF6+h1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG01RfUs/kBeHw5kd3oqPDTED4Q26ML4n5C7iSbz5B4=;
 b=J+SRIH4tuEf6w2PPv80kgCIDoiiaHye+LCc+5uihxuTaSBaYI+2YJaE2h+kMrC2fTxpHhmXarQTVaaTFLnuXVS2Iz7oURNmb3WPixvAEqqW/9P/tN/rPG+p0L4Xt8Saiv/S0evxnqpLbm8sJu42XFzkzAlR6ZM5gJYP4JsXNtOe1gugwQDUNbRnpHihOLIylSzu7RFFA6BFp5XwqXcsIKjsWabRPgwEUkkTQ5g9zWtjIdWOn6zhd9gROAMDTkJbuNuywPbfC2gfkMU80nO4NDX/PT7rZI7p5YY6HnYP2qe23UrFxnAhUnF4IVMno1sruhsgQGvmoGFs+52d9exV0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QG01RfUs/kBeHw5kd3oqPDTED4Q26ML4n5C7iSbz5B4=;
 b=Bf5NHJXOy06t6QoRC0MWXlVvNMxdH1V+whVhnQ3DNfvzRN5jnwD3+wKW3JeV/SOW1Qkdia5HFzV9XC4xUDL7n4ABIT7lWJgheQNzRZMoAxI6x9axNEHmC+efS7UBtVhTt/WOdKiEQlz0zwmAC/hSF/dBkfiE3Vo8M/IqEB2Heyc=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 21:40:01 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d%5]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 21:40:01 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: dgilbert@redhat.com, armbru@redhat.com, joe.jin@oracle.com
Subject: [PATCH v3 1/1] monitor/hmp: print trace as option in help for log
 command
Date: Wed, 31 Aug 2022 14:39:43 -0700
Message-Id: <20220831213943.8155-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0055.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::32) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 515af20d-7f22-4d38-3cb0-08da8b995b75
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4429:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YhR38HxuiHminVcdduqof/Px8BWR1pKZ0xV+54zisjtd3kO4fyLx6EGXd830sYSyp5g8tid7l66BnXkHaTlkEl187NBa0DvKEV/0eFt3RKJl+E9EVQGB3PNwEq9QW+hrHvlkfjKxBAaVuq6T7dpvHyduAY0AUlnAYYGpL6C/NIXpTCv4UjhMnXcJMG4xmtDd3BWmv+xELBVISx1JsI2BhOTCQ6fDCubPUhLptPzE4kS3YtEXgLMBgi3Mf7wZipAizrA+0GKaa23K4yrgK4RHSMKjqpRAL3qyl6h4Fw/cgNdsSpRlt7QebJlrHkJfEHNCMXO9G43500gvFnXm20t4hExGdVPlzxzjRgC94472fI8PyCb6gxW1eNsoToim/RovsyPbbggg3dKhRTwwhH/I7Pa6UGsNqO8MWzUCJ/r9AeZ+/WtKj0+4UDn6ebgJ1qjXHtY9tlBIGlHefGyUIc/Y9H0SvI2/VD55062yYOYROnvr4CxRNKfPnk2ZtdLSDJdCcD71N2PZYvvcRmkXap9plOC34/s8/5pIfnt4V5GbxLH4I/7uIaeH7DG/kW9UzQFjFdfYvjcEJ+a5fAcbK45dBpHA8bOSeS7+2WbbPwg0cjr5AMRGB9Xz5c4Vm6eQ5tzbfinVA4pD1w3gwn3WTA6e0rK8qoqGTafyUak/ptQlmSVJFsXe5RimQjI0n4SZ/LcW5HllcxWZTciq2lzmG/xRMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(136003)(39860400002)(346002)(396003)(36756003)(6512007)(26005)(6506007)(1076003)(2616005)(186003)(44832011)(5660300002)(8936002)(6666004)(6486002)(86362001)(478600001)(41300700001)(107886003)(83380400001)(66476007)(66556008)(2906002)(66946007)(316002)(4326008)(8676002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xig/+mNh3QCRwFsSW5+Psc/vPww/H+ilvo6+1Bb8j+VfKJf1KV40Ce7yifYs?=
 =?us-ascii?Q?gQDbJ30ZA9hP7W9hd4ZmE9pqvlRD2dAMiO0Ah1HYnzjp/Z527kS34QOqAYR8?=
 =?us-ascii?Q?dXgVMv6NoAwNAlPPRPDeCZubg3arC55zqhNe+B5q5LfR9O9gup5kdw2WDSld?=
 =?us-ascii?Q?PTr92Sl0AFPCnCHQu3ISlZEnZN40YV0dl8M2GfP5OXmBVVENgFzcEaATWt+Y?=
 =?us-ascii?Q?93kfEf+7Q3+1YR/yR+aAbWCDGm2xNyBYAzJ2NCcHwRJgbm8XJYR8fq2LBWcu?=
 =?us-ascii?Q?x5owndfRoAlPzT7yta29+WKlFO1oJPrNp86FPe0Ej3PwCYVOoy+24MsxN0Z6?=
 =?us-ascii?Q?aS+noFs6XzVctr+DfnNKlGTmglWQH0bP2ftfmGSUu7vBFyaL8DbGXlGlq0H0?=
 =?us-ascii?Q?CjbJ7gHNh1SYdz8vazwD4G13DeValTUh13QfFt5z/ez2XVfXNeW0sPIaNGKy?=
 =?us-ascii?Q?SZx44yDWtfQH0AvZPLQWdCRAgcArbI/oo4z08Rtgup+S6EDCiVDEuIxV4sT4?=
 =?us-ascii?Q?9tzMO2BRYsij+KA6LEaqrRy/1wo7dAsWl4uWYDyFTmS5HyLL7B7AMqZoWZ52?=
 =?us-ascii?Q?Fy/oeGUmof2/2tAKO4WWgcLCHUXVN3SLuMfb69+kTzzKJy7VCtS84ZkAk2jJ?=
 =?us-ascii?Q?GhcLXmpYlB0Y5BnlUWdTYLKMCCHJQDael5om2Wfwx6v9nZ6776xEWFnp1swF?=
 =?us-ascii?Q?7HHQKks4EF+FfnSMO1W5QgZzeFYhtIDFfOWM46hl/4Jw0LKsm2dUPUa64GqL?=
 =?us-ascii?Q?ZAG4Z10Nh1Kr+Dr0/g4KujLW9x01s1Kl36ZUgpfCgxQVZ2h5aSIPNP2EFS1n?=
 =?us-ascii?Q?ZhOifPoO31cTPFBf/kN3BtYCtLJLTnGbZEmZM7zaZ7KWHc0Hp/HelNHgmhnX?=
 =?us-ascii?Q?MykWQriylh4RA07vpaJd9JJw/fLcEFiZ2tsgC8GjWfpkA7Tx3LvhI8JWUupa?=
 =?us-ascii?Q?mP7gNsazzc349lO4yIiuhFyGlFvUblPDryB/uyghtYqztNt5Tpy8Ewm3zRCI?=
 =?us-ascii?Q?BtRGmEDyGAMN5z9yLLK5sm9v/e3kugHnmVbSX2YioC8MAGzgnyGVydZxpj3T?=
 =?us-ascii?Q?fzxntrmH39JewECllKSj70xe9ps0MA041qZxUG1IsNBKx9HWo1GWlDiCo37K?=
 =?us-ascii?Q?ZKfUb8Pfk9ge5lIQyEmaB9osnYsjJ3rQWCBKKSYBVZ+P9FaGCU2QogpEY7x/?=
 =?us-ascii?Q?o090yf48u42WMBqbAyes08YZlNzwWtou3toP44t+HGSB2E/2Ct2RKieawWBn?=
 =?us-ascii?Q?jBXMDtag9wIcK3BU06bUCOyv34o+ImVyBbXRBJyaehbiUp2VGNIc5V4csam+?=
 =?us-ascii?Q?BXEyWDdA0bT7xpls3s6rPflcWqeRdhVyNKecv4FpBfRBmM7lRa2UmrmQ4Nfq?=
 =?us-ascii?Q?qN6q83HeH6r5bkgpenlt0B/onp/6YT2byKeurh5ogBp3cJ3Vq/6YsXZf1Asp?=
 =?us-ascii?Q?yGGv02JnWsTr5cKEuSFUI9oPhrRzk+jhb1NY2ulDqeGC65luYl8OEljHMrT6?=
 =?us-ascii?Q?4fPSGwaJ7yG/hNE1ayN0davfWfIANnn6BbF394jKpXpzgjJhNs8UbiVA4tgd?=
 =?us-ascii?Q?R54gToCz8tBf/zXMgJWtlXMB65g6bIma8m32b5J7en1lFZFTnNwa1RElnXP+?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515af20d-7f22-4d38-3cb0-08da8b995b75
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 21:40:00.8575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsjO7XICiCESY5Xn/kmH0wLS/lg/lkfw6fWCuiUNwGgX4WmrNloYvyrzh/llClPCEz5FGwsps8inaHAo1/Y+lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4429
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_14,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310105
X-Proofpoint-GUID: DEonpeeDnrN3VtqNqeQgXuvruW8q1qwI
X-Proofpoint-ORIG-GUID: DEonpeeDnrN3VtqNqeQgXuvruW8q1qwI
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The below is printed when printing help information in qemu-system-x86_64
command line, and when CONFIG_TRACE_LOG is enabled:

----------------------------
$ qemu-system-x86_64 -d help
... ...
trace:PATTERN   enable trace events

Use "-d trace:help" to get a list of trace events.
----------------------------

However, the options of "trace:PATTERN" are only printed by
"qemu-system-x86_64 -d help", but missing in hmp "help log" command.

Fixes: c84ea00dc2 ("log: add "-d trace:PATTERN"")
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
Changed since v1:
- change format for "none" as well.
Changed since v2:
- use "log trace:help" in help message.
- add more clarification in commit message.
- add 'Fixes' tag.
---
 monitor/hmp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index 15ca04735c..a3375d0341 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -285,10 +285,15 @@ void help_cmd(Monitor *mon, const char *name)
         if (!strcmp(name, "log")) {
             const QEMULogItem *item;
             monitor_printf(mon, "Log items (comma separated):\n");
-            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
+            monitor_printf(mon, "%-15s %s\n", "none", "remove all logs");
             for (item = qemu_log_items; item->mask != 0; item++) {
-                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
+                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
             }
+#ifdef CONFIG_TRACE_LOG
+            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
+            monitor_printf(mon, "\nUse \"log trace:help\" to get a list of "
+                           "trace events.\n\n");
+#endif
             return;
         }
 
-- 
2.17.1



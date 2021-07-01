Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416553B9826
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:28:41 +0200 (CEST)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4Eh-0000oP-RE
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lz4D6-0008Vi-AE
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:27:00 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lz4D4-0004KL-8a
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:26:59 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161LQRER007675; Thu, 1 Jul 2021 21:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=fSj1FUsWrE8OJ0WskyU6kdzq4RaysTEW9I8mKX9A4kw=;
 b=GB7NoXi1ZHZZqGQULnxHZQKNDYFLww0GzUOdJgF90gRksJUSCtFe3jwruU9bginNl+UR
 f1V8TrxDRxnWv1V8n/FTSVoYLOC0UPb3NWv6qoJeffTEW6W9kFmR58mLx7+NKgxbYWFn
 43DYCE9mSxagKdfGd4gmWDUGgz4AJCuQ5+AQWVdxPLZqzp8Bifz87bSpctoJYjV8t19Z
 WKqLW7+UWediGEW0LEvH9+H3QNo83QIj5xTQyb7GKo9DXkq0H0g4voYNiVaAHX20Fh73
 As8aPbn3LpMKl0utpNSGJ/eGTcMj94Sl/5s5mOupUU94z8HP6mlw4O36Z8GqcIUxt68X yQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gha4cdj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Jul 2021 21:26:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 161LG87W078067;
 Thu, 1 Jul 2021 21:26:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by userp3030.oracle.com with ESMTP id 39dsc4txaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Jul 2021 21:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drHkFka9ZtFg/v7H41W0PZMzxmiEdWLezn4WoLcrUenJXf44LiT3x8k2bEQOlH6trSjp7U0xG8ZyuIcqnszZ8zpo7kKCtzDUJR4oNMUVPHrYGwn6qX+9k3WPWaOV6Lo3pJGymYAtQOLo7YdkMsUvNSbGrY/ytq1tDhUfjtPKoPPaAQYfUZiwq7n0AQmVBqomor62Xm7sQI178dSl4z5eGgXVALdjg1bsvb/Z2zvI+q+cYdxiQSCfAS9ZP/Ao5ow8oosR8T0smNJVPCRw0UP+NGJ8Sx0TqMqfJSXyiKiWehRRhD/GNz2KRbM0CMXUBaWN5Y+5nQPSMJhhNZfFgxjJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSj1FUsWrE8OJ0WskyU6kdzq4RaysTEW9I8mKX9A4kw=;
 b=Ml3cBRWg0Nzmvw3YRBJej9M9epl5VdZSv7OpfasYQouYiBdKecv9CS5hG4ptv02rFPFOxd7qOl/8di7dBWzgpVKjeOeW1Vii0Q1DUQqzsthSq1hW04jayDhNKG/185sRtoNR37l8XWyg6iwdQkWSO8cLAH6SluktIA4XunUnu4+wgC2Ihkb0Eo7QZg2+4DBd+9Pmb11T545y91pl29tnuDwOvr7CzXMDIysHctrrNvWrR4nnMlVUU9sAGFaPuK+rq2Rdjvt4XCy9U5Whglhl9fbdK4338Cl3UVkTq3ECRZHycKKjUJBzBZBxncFGAXj9pH8V4CCOTmn00leT2vN8zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSj1FUsWrE8OJ0WskyU6kdzq4RaysTEW9I8mKX9A4kw=;
 b=d4c6ZBNNMP4amfMWoYuQB8tSUhn7KysgwbamaZwYtzJVQmEVd72xRxN7EJ1XjoBrehchlJIrDgHNELOdoIUUXClNnaezR56HJHYKbkWC0xgniiBToPwWlFNikB2z17eGwRqGwsA+LgKr71xX8OyoBNNRSYyVHB0Xl7lcINLDoQE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB4305.namprd10.prod.outlook.com (2603:10b6:a03:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 21:26:48 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 21:26:48 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] hmp: synchronize cpu state for lapic info
Date: Thu,  1 Jul 2021 14:26:39 -0700
Message-Id: <20210701212639.1318-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: SA0PR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:806:d2::14) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0069.namprd11.prod.outlook.com (2603:10b6:806:d2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 21:26:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43a22100-48ff-47cd-93d7-08d93cd6ef49
X-MS-TrafficTypeDiagnostic: BY5PR10MB4305:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB43054D39D2EE72DD0FED1057F0009@BY5PR10MB4305.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3+iumQPAt5pK/DTwBYuALVy6Bs1zEUEyRAWyDADbxAb7/KlpRZuB5gYkQCvlPGf2zNQ0xw+/uw84nNuP/JWGJwubjvEIeuR+NTmFOeZYoAdLC54qm14ddpPT0jtH6YNElNnWoC9hTGLu46FDhVAOFkqS4Jj75UcjnlOLrONcUEluFuE8RSYQqKzhip5qJIrdu3pQ7JEFGvlrNSwmjlPql56fTj37nEp2WgT0qBxsR6a5TS6PGRASC7Mk86bCoEYK6XAd10hVdz8l5wC8sCL1q7dukdbruHhAdSaXcmjx26WTAJufoGixf+O6ifU5dD2MqZecJ4PEmMbRK4dujLHsJv0+fpqYAs2gwiyTcj/Q1hNQtE/WpXRqtg9Rba9xrX9DloKrVj/km9odDR1fvDdLtkH3x7kYuR81b/q7aOQ6ye7E4TuJdguU6/NlTbO7z5tVdl5dcDGjQSfX+n1kF2RsETyn/jXtwnvxSLgEFSC7DCiCxxAH46JPBB89RvnmweJa0SWTYFBbykPlZ1gKJGFY4a9jQxSh42T8GvsUs3ulgP0Eui+AvtKVPjiq1722NpRjizu+5py1hEJKA0c1dCQMWEUqAP1NSmc18Te5LMuCTYKk7muxK1FjVUQB0ZetOJnsoi2SYBDDLmcxDxKoWVFuNo6uf2cgAWUlFreek3q+Feeo9+YkHQxMCAiEdl9CTovnddtOyY7gQtnBZijwhqIFxa26W3jcCUuvCFOvEJFdEVQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(396003)(39860400002)(366004)(16526019)(52116002)(66946007)(186003)(2906002)(86362001)(6916009)(4326008)(44832011)(5660300002)(26005)(66556008)(66476007)(6506007)(6512007)(38100700002)(8676002)(478600001)(6666004)(38350700002)(6486002)(956004)(36756003)(316002)(2616005)(1076003)(107886003)(8936002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bh52JYSxGecb66u4zB61ww9yRGRQn5IT+CfHuK9qVByJ53Gbt7vqNEu+Ffma?=
 =?us-ascii?Q?t2HK3ptQd4DXTS1Z6zlz7nHocfw/uBnbztK1qxAjCnAhFeYPCwwfjd0621V4?=
 =?us-ascii?Q?AZfMWYYCagEU/QLtl+BTYiIU3xQJRH3AMwBNh+EbCwd/1bfLhLKhF5uKJ6UZ?=
 =?us-ascii?Q?k9PMrMs17Njzx8PeU7/jb05NfEipi+w7dhxh7GEDVo2IfT1xeHXM7uYLpjJu?=
 =?us-ascii?Q?qn74o7B7Pr9gXKJSTyDG0VXNml/vYbTiy4rZWNcTTsip5jU8263No9YLF/+0?=
 =?us-ascii?Q?0gR6K6cimFWHlo6/wiFJ5hkgLTsNIEzTk2MtAnniTUq5j/5MRbG6E8Jyght0?=
 =?us-ascii?Q?ed4HeOosUTqT2SjOkGx0jGtnwM5np8zV4mt2WWIJIQOLGBzbllUG+V5SnAFE?=
 =?us-ascii?Q?agX1E96rJP8AwPV15o9JYCMEmiMdLaKVYvlEOG7UAmXCoHrkW6xVl08gtDAT?=
 =?us-ascii?Q?d5qPXWZvjzC7ECmu9am/3m9se6pnNA3vbfl86nXJmNKqbdRsCG/rzAk57XML?=
 =?us-ascii?Q?5gxseMCBCBW+8PPLn6tsrlOpRFKoyqMscdcDyaojtT+HcESmZDEXPkVBTeOL?=
 =?us-ascii?Q?eFfxcQ4MA9AGD7OKUBTv2FjQwqLpstH3UrzFqx67tCjNW0v8faVgnFcFfRHt?=
 =?us-ascii?Q?nvfFj5DInXB/UtWQ/SxFXV6rHU8qOwVmtspfIiMyfN3Ldx24JP6EgNkpPsfi?=
 =?us-ascii?Q?4y0AAFyHoOcqwqTQJegQXuFe32cDWKKV/aQTP/AMlM26MN23S7xPG56kQ2Iw?=
 =?us-ascii?Q?LJduMvlNOD14sQGBjNEFGsTRcO5S3URZfuw54tihXVx8HwOS51Mnk0pwVG1h?=
 =?us-ascii?Q?xGjBu6spdhT5ohbVNWPEl4C+OzJYUxdbpSSefZurL+7dQ0eqhpOkHvAKl5zz?=
 =?us-ascii?Q?Fo+vBcsN9Gx+9N36vnx7bSf5nQK+liu35fkgaSiOvEdrBE3ZMJT88xoFW7n/?=
 =?us-ascii?Q?712Uswherh4Jn4uFOBHiqFVursEnTqeqvxwP62Kv1G/n95lc3YV0QsJb20Mk?=
 =?us-ascii?Q?VrtDVDHtuYM3kd/x3WV33tuKOUhAFA3NrVZdo6vGOrLAzGFkLHiSKDPAPtWO?=
 =?us-ascii?Q?3yqOpuidM9lNMegKsLWj5JWDI1zLc3AC5xg/LoWoJkNFoJQ3LCS26yFXDgjn?=
 =?us-ascii?Q?U+6TU1poD4NaeByUKq/of2EOTlS6uNdQYUDj+iiKeibLWWO/ohesqyTZvDOY?=
 =?us-ascii?Q?VEn+zTjNuyQMiLWDxuvDI6Oc6+r/8msdakUQQ6EGY439ILUPHi+m31GJ4SUT?=
 =?us-ascii?Q?wN3OP4ltlmMhta+OaZXSqF6YRxAdyoEhukecNtIxpWE3CF5d70ECLY3bzcqf?=
 =?us-ascii?Q?NxjjwD0T5eyTCwHYb2KU8HqT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a22100-48ff-47cd-93d7-08d93cd6ef49
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 21:26:48.8148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOwBrwOwFZoEIK/zCdUgY6WjP6/rVX++edfpmLUSAmHYqVLXoXITiNg59qOoti/RdwB9yUAAoQS4Q4/+9pYTKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4305
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10032
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010124
X-Proofpoint-ORIG-GUID: dpOKanAxSANu9L82ohJwSgsxA34WaQtB
X-Proofpoint-GUID: dpOKanAxSANu9L82ohJwSgsxA34WaQtB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: kwolf@redhat.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, joe.jin@oracle.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the default "info lapic" always synchronizes cpu state ...

mon_get_cpu()
-> mon_get_cpu_sync(mon, true)
   -> cpu_synchronize_state(cpu)
      -> ioctl KVM_GET_LAPIC (taking KVM as example)

... the cpu state is not synchronized when the apic-id is available as
argument.

The cpu state should be synchronized when apic-id is available. Otherwise
the "info lapic <apic-id>" always returns stale data.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 target/i386/monitor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b0..09b3b73955 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,6 +28,7 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
+#include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
 #include "qapi/error.h"
@@ -656,7 +657,9 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
 
     if (qdict_haskey(qdict, "apic-id")) {
         int id = qdict_get_try_int(qdict, "apic-id", 0);
+
         cs = cpu_by_arch_id(id);
+        cpu_synchronize_state(cs);
     } else {
         cs = mon_get_cpu(mon);
     }
-- 
2.17.1



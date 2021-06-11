Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C213A48CA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:40:54 +0200 (CEST)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrm5N-00039L-DV
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwl-0006c8-Hm
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:59 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwg-0007i5-9T
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:59 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BIM6kD009737; Fri, 11 Jun 2021 18:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=BSfYP5a+0/RcRkZPG54hDqmJ5uXlzfoHv6ZT7w+a8O4=;
 b=PPdvh56wBer6tRMfJb/rqeWvgjjwj+dPMj32A0nG8t4IgG+kBh0qqAotSnbzlHd5QIsT
 4l1OxL0mACbrC0g2oTIykr/66aWajkeYO/UWuN/sIDIQ8hgBfg7DhWl8NSiRi0Dx+NXF
 ndufo+pXqIsJzivL8zq/QXVto0fKp3cZsyj2RsQxBB0hoWkPQ4BrfjD8hIJu4Q8o0T+9
 GyQAIXmJFjNfbcrEWCE6kVig21yyqHPb1b3FEt1StdWDESB7jbqGBQNCdFRfMUl7nv44
 mAZIt11kJGj+pjCh3uJExcr7w7CzEXuXcHAVb5jUnPixzMXUvD0CQxu5YhJlcLNn4neL yg== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3944hn05jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:50 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15BITjXe011790;
 Fri, 11 Jun 2021 18:31:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3030.oracle.com with ESMTP id 3949cw8h3r-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRx25N5jbrM6RuUNT7XigcgmJr+UIaaz2PkzF9Ymjo6ZdW0f0G062kqaFCecQpt8eGzlrOmxQ/Vo2zDd0im1vsMmj+6wXQy/l3boio2NY3onnp4bwtqrToqaGLRUq/B6t/Jpn9btX5HbQ1xbMtmdq5Fj1dJSKk3y12UpJAly3MZE0c7RiB/yuD4YRYp5KeGfROwtAtoe+QsCRX9QxZ7818OjBHMjLP560mXBwxCdVNqrVWeVWpwCfz0/QAiKZPJFzGnldUYq4t+L55hHkUN1N+ss/ul2UrbDROdBf6/72jQi50EVbqghgwACCG5mcZ9Av6SN49CiAZujpWZ9K88G4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSfYP5a+0/RcRkZPG54hDqmJ5uXlzfoHv6ZT7w+a8O4=;
 b=TM6qk+OpApCTSfAaiJvNrjyN6tNHQGHl1XzndEAad2J0ugCvuArcj27iSlGuFlPVl/hvXOQjdTBixH6qgAJntNbWDjUxvubevJF1/u5avraZFFfZ+9l6uES5pJgC9A3n/Js7ncTRb2hA3ftamXnrC8wVrmqig5JGwgksXFzogdx4KCAA2b0Ti274w61iRh+rWYqIlwYzzI6RGTlg3Oy32zH+Sfu7S4SGN7T14rlrhMn2Z+IyiA08tzfsBOqgWhOZWTWmqNwifgjxc+irVANg8Dlvm5ybTHq4ge8Z4H7JH9U0djWc5dky3hJ5FfI7z10WEExLF1NyYzsu0ABAxChfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSfYP5a+0/RcRkZPG54hDqmJ5uXlzfoHv6ZT7w+a8O4=;
 b=ej39MfcMJD2VDKMbWX7aJMF4+gsEyd8r5afevRouwcnukK22ThbKniRHu4Zt8bkTkm035R4eDkZQqHi0C8q0X9fK0/arcRjv5KIs5Fz7EeT2kA4zk++jvMUwrSf0T02Popeq2kl6eCYA1CE4dGhb5szJ3oyi344mx8HEmpeUbGU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5457.namprd10.prod.outlook.com (2603:10b6:303:13f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 18:31:47 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 18:31:47 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/6] ACPI ERST: create ACPI ERST table for pc/x86 machines.
Date: Fri, 11 Jun 2021 14:31:21 -0400
Message-Id: <1623436283-20213-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SA9PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:806:24::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0097.namprd13.prod.outlook.com (2603:10b6:806:24::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 18:31:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c98c7ea-f427-4d4b-6b00-08d92d072bf0
X-MS-TrafficTypeDiagnostic: CO6PR10MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5457986968BD0A32CBA612B597349@CO6PR10MB5457.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yU5a/pX8k6n9NBv59u3CFhNFCyJjpaBQvYhzDMLbZo+RjL5B7QqgCBb5j4k3Gax3R87LGCQO3+1khWeOFsjxsHV35nQAUokFqoCb7STDV7xSKCVXQozw8K/wwcMDm9N97N2rjOpfFEiwx87Cniy5kwokT1Rzpt38MUcyE9gxOelDYOHeShJ0lp9W7E/My8JRbLWrZPkTef2GwAHmDqa0adxHK2LFcq3ILe15JT3XaU08CkKM2hMeWq149PiuQZnRnaaMHx2v45HoGgDmrRa1Ef2AbDYG7AMCxCVG052F9dT4z98/CI3V+9fN1s7ORGZ8TOzFMRQmC0sRacOJdfukXAyejdsq6dK45ZDYzc214sj2pGBqPEc7JcHdl4ZF7dwLjfnIUi7I87KPsVmKxoT21BIEObMZgHZyhLuZF6+2B5NzcoCpjil1tc1m6G3kGWZIvntA3UcMStvxp7CwRCGqM+l5aygPS4wNx7hWCmYMq53+M7Fa1M4bwAMtU+uJ3mS3CBwtLcU7dNbbs++wbOi5Keno9bq/pbX8WMci7Zf3vzfBTo9QZhwvSISQfioXcUMNNC+wT/eKW2WaWkHHDfDUkKsK0lhcjLwYwnabDsQ1MStEN9y25VvUlqkfywDEa4bqgOvcqanvi4Qbe+cJNCD73f26O0MMw4WRpZBcXVDV4JQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(7696005)(8936002)(26005)(36756003)(52116002)(6666004)(66556008)(186003)(6486002)(478600001)(66476007)(4326008)(66946007)(316002)(5660300002)(86362001)(16526019)(2616005)(2906002)(6916009)(4744005)(38350700002)(956004)(8676002)(38100700002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pUSGcKmJb4b7DHOn5clq27ZUmG+8ZMx0bKaUvPsw9kXhRxBO5jC0uWlXWpoP?=
 =?us-ascii?Q?xaeWIQNDeRH8PsLa3bv71v8rSswp9R1A1gxGOk/1hGhOPN8Pb7np4kP6gJ8+?=
 =?us-ascii?Q?AvAaQW167W4lPLgOxheAb2UFXzScEHErvBf4MiPoqHiIzrYQHmh4zaJnak0Q?=
 =?us-ascii?Q?78lI2ET5xSXBtqpOPy0wKSYV/Okh2gk3W8Bg5ckEsNQg5bj/60h5QW7ay7xt?=
 =?us-ascii?Q?StAbOU7DvnWFZiZ0z+c1r3sv4B4c2vmi9oRUC4My770tNvWHMp0+XZwJIfGS?=
 =?us-ascii?Q?3Z+mipoxyvbD2HyobToUo/d5rDyx2DufqxD6o7hrZmw+qqjZCW1SL1pqyGfa?=
 =?us-ascii?Q?OK2qunvcqrwnyrry/CPZmIUJ2TmhrjWD6eD4doAHaKqbab1tNDeb82/tWa+t?=
 =?us-ascii?Q?HOjbH9f69MfRScIl6ZGb/ZtHnNm0umTeey0V2/wNC50Y2DmJLaXU7r2dNbfD?=
 =?us-ascii?Q?ndTt8Q0MfoBCUHZ5un65pMjyEXGf8/3CzOtCDjxOoGTt2jfQSqS49UVYA0IJ?=
 =?us-ascii?Q?5V5a0q/ID+rosRycsFGU4kc5rml9ATEeGdonTEEAZnfwSY2CcjhiBhLXT3Cm?=
 =?us-ascii?Q?Tb24eq1DlWnkLiFMpelxA+v3taywiVpzWx5muNlC0z/bQfw533Vp0Q1XYp9D?=
 =?us-ascii?Q?3O6RMrmXSmP/10fbaDgkXFgp1H7NrKbHBQsEiF8k/eV1gSAX/ZNs4qVwpreC?=
 =?us-ascii?Q?ohR2ibH9lGpWbZlCXgCVRoN5rWYbBSxBpdF6PPwi1bQATK8B3V3EFd396ysB?=
 =?us-ascii?Q?iPfGOcLToObCK+T6oUKL5KX5WuEFE6EPwWdpgBaGMbMTnAyE2kIB1EN+bwec?=
 =?us-ascii?Q?u3rUy+AYGBL/41du+tPDGcIYG3KcCDY1T4nEIU/wH+yQuUns902IZVWeoJeP?=
 =?us-ascii?Q?QkDxkMbBSscqzUJlUw/QlDpOA0ELFvxTC8tx1xNzKwtUiEYC47HFqET8ZhMe?=
 =?us-ascii?Q?o7VpecF+RKN+vPvStlP9tENb7sKw8okRXwnaqya8pfd6yX12lt4KB/h+XMFB?=
 =?us-ascii?Q?qddQsw1Vwsfb2S6WsZqwc/I8S9/735JNrx6dGuf5f88nAENRRScUkca9Yidt?=
 =?us-ascii?Q?PHmhmBVAjbtV0zZ+dsHlBIllgF41g48w4+flrEhh0jVAX51DM5XoIWxTAF7i?=
 =?us-ascii?Q?W1ePBQbtlrnIcC9fBp2kkjAqP6ARYsruouGI5lQ/BlAAIY3t8YMV2XRO4wQM?=
 =?us-ascii?Q?XioNJ46wElob8PTuLMVbPOAW7h0+VHOuKrdfkve9r+HjMSTxj+1hU3dFSesY?=
 =?us-ascii?Q?o8fXngqHLmbA8T45Ji3ZBHSYTA0kJF/OCpTQQ3tlY2HAR5IXCevpCXE5dAIi?=
 =?us-ascii?Q?R/GOkLTQnTRkaVpg++K2CZbH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c98c7ea-f427-4d4b-6b00-08d92d072bf0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 18:31:47.6366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1exfeeumWoQ70OAZE61srlt8hrZvcjgdfOOWvhWgGQf7p4HuMpqNJ/ajGrUUBUBkI421ElnzXBNsH3J0FFTHL4crs9SQfj5PwxqxwegvKtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5457
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10012
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110115
X-Proofpoint-ORIG-GUID: wY5RcntA4LcYF-NNPLWu0s8AYLq5_QwQ
X-Proofpoint-GUID: wY5RcntA4LcYF-NNPLWu0s8AYLq5_QwQ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/i386/acpi-build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index de98750..d8cae69 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,6 +43,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/acpi/erst.h"
 #include "hw/boards.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
@@ -2388,6 +2389,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_erst(tables_blob, tables->linker,
+               x86ms->oem_id, x86ms->oem_table_id);
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
-- 
1.8.3.1



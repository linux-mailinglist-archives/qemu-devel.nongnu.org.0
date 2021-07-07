Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372FB3BED40
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:40:45 +0200 (CEST)
Received: from localhost ([::1]:46068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BXQ-0001gW-0V
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKV-0000GN-1T
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:23 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKQ-0006jj-3D
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:22 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCNF6029345; Wed, 7 Jul 2021 17:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=OuaoV5BkBBCvBHVDROVktq6g8EY45ffOKBgvHBRjVyk=;
 b=eHqwlR683AhE2tIyV10hEtqDF1j5Us35YykgEMfA6JXcqqCzzyxv2AGZGZMgHXBr9nWZ
 9HXz2DzQvrsgK6JsHmLiYhG27uXFTWSlNoVTx+4vZEYXs1duSN8+Wg0F2tr2sfpzggTw
 AMVPFMiELZkTq+YFSF1YZyGbJh9Ru3OjSPzEwrtM8zRrLG3GDG36nbjJea46wdyRvWlA
 xH26On4G7Mc5kiydSi0+ny3pC8gAjJREcybeJ2oSMfUJ+GHwLUdETHoyNqaKc9QpSlhS
 X87m/6IohHclO3IZZToq274tStKGhB+j3SHZykqB9gEq342Jcqp7RmtGeFoFwZEiAf7m ow== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aacpau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAMKp068988;
 Wed, 7 Jul 2021 17:27:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3020.oracle.com with ESMTP id 39jfqayxx9-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPp5Y8sY881VJjIvhamvCIat9g/ByPpuJ0fcvRaqlLkmkPgXtNFPs9W0Qnb5AgWtJwYMFzeJYEjVSfjoOfp3Zg/amIRRHoAdEYSGWCDLUp133jxF012QgBSE5JpD3Xa1t92HjoHwbNG/xtctqMh4BbNcSaHcXUx0g9xELRmZmiSuxV0kiSLy1ZZ9uvIJYgq8Y9cuqQeXORuZWQzFz127mhkKabPa0cr6Q9VFE306tB18CvWUxbKa4iURNYfhnUfYZeF1J4R/c0kQMvvT1XHbSXfPC5+/ta1wwQo+4UOw5H5OfmD7LcZMtaEz4IBhdRr++8wtbdFbDT7Fla8EgIvrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuaoV5BkBBCvBHVDROVktq6g8EY45ffOKBgvHBRjVyk=;
 b=dGEtLRJhV+r/WEtSV1xiSE/xUd/TaYnML2am1ruHC7Ke/y1cx36nImIJ3jkr1oD2Y3kKZU3B0Aq/fFs7OMnzmfmTBAmvd7QmZIgvwYaxhnsHbaBGsQBSz69TGNSAxQbA90GRReK+05jWXA0/NHlNBBcOmjk4ZIb2a31RFO6rQZ0puMcLyiBjtGrmS8dZ3sUzN2OiGX+f7d9YoTEe5d4ERsbLBCad+Cpd3pCm3VQUPhowO8eRxw6DCGb8xJHSmq9XrYRnFOD88JOkYrCXxbKkWVfCT0m5sk1k05XsVdhpV9xD4khIBAvlsteyRjk6Aom7/jETKj6Tx1EmlPzBdrpM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuaoV5BkBBCvBHVDROVktq6g8EY45ffOKBgvHBRjVyk=;
 b=ItAkHuedgAHHxlmWJnpJ9+OY1T3HV6FTzF3qhUj34T7dd4tQOqgXgsuUaJNhIyd2+y9g70AQkNUc09PTtASP4tLEX6m41GOba1Z6JsF37QXEbaogU/JULFL3kNZsnsn1JthAVF72su5OzUyrS9eBlNsA20rZGdWASBQ0bsfhWS4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3285.namprd10.prod.outlook.com (2603:10b6:a03:159::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:27:12 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:12 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 07/25] machine: memfd-alloc option
Date: Wed,  7 Jul 2021 10:20:16 -0700
Message-Id: <1625678434-240960-8-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 057d43d1-5211-4211-29b6-08d9416c74c2
X-MS-TrafficTypeDiagnostic: BYAPR10MB3285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB32858D2F24D364413664CDC6F91A9@BYAPR10MB3285.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFP6XHYf3ZqMVQq1yKlU02m1RO4P7gtoOpkE0Srwd5VZjjPeWrv1mU/zDL4A4nVibHmxXuxKhVwx3S3Uu308nEm+l2GqAvS/XA8MRM/EOFQlm9nq+bG6yvQ6VNngqVtiwGvwascCMRLLrALr0aCGxejZl8zeFq3XQXPH/RxDizlm28CKC9TTiR21nuF2YNRK9VtFedyolVAou44CFF8rIohdOBTDbHMV5CXTYSuGobLiXmfRxOhgUk+OFem5iZeCDWFy0eiTiGMYyhq+NPU6qNp/cJ1eoAufCSVhhmHcLsIEfJd5VZBhvlbwglpgFmCTvLkjaMpm2OFWiNZGJzpGEu7qu/qQFJdGi8mclbLCYg4z5Lo7aNfxx0kLF8vIgH1dUB5mI3X2sG6j1h8yFJLlGwR+4RCOJVplVc3K9dCG59SbL7T7mtv0Uh5xJg5OYNrnwRexwEY+W4mpgZ4KHX77G++EqvUHNTHsDqLgphlltre66/CFxx8H2XnGASd1kjpWn21dHvHbOlSQ1FchafYEM4LtPUm9jPO5R5mbdh6gmEsJ4vkVk9Zet8+8xEA0MlgudOWHJ7Jq1SkNzpSj2H/CuLir8ki4AA6Kg4UU8MrWkxF4puE230BYTaMIC3GYr7tdsP6d+H9UGdztlHY1rzMdlNMjkcMVUbTxRPALfXGzFjNHCOUtpM6s9cj8vxnT9erN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(396003)(39860400002)(346002)(4326008)(8936002)(54906003)(7416002)(66946007)(38100700002)(38350700002)(107886003)(86362001)(7696005)(52116002)(66556008)(66476007)(2906002)(83380400001)(36756003)(6486002)(5660300002)(2616005)(316002)(26005)(8676002)(6916009)(186003)(956004)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?khDs/0YfUpPSb5PBNlV9gFoQZs0+TEknbp3kxiknMvsE24XDB95/2ni/ZGYi?=
 =?us-ascii?Q?CVCxb1wzsO7jxltW2SKwYPasSqxxqse9UY8Zho4NPyuopqQ61TCEYYBmOerA?=
 =?us-ascii?Q?VKQlkhUZoCaXHQZf4gEfMmsP0e1yr7ARY0krmfAVsAsSED0V3Jw2WhYT8AtE?=
 =?us-ascii?Q?koGG8BmxXvtcv6k5FqQhThwRfvEPl64GRi6PgEdSHSuSGSweySv/B86o4vN3?=
 =?us-ascii?Q?YYnUpYpseo66jQDUnWYLEIS4UbfdAQqdoD1+8BYvrLONaeDgOvEKLhAqgdC9?=
 =?us-ascii?Q?Djl+shiy0MBsSxUaC4BhIROhQFQyWYpSJbrpMmrsW1lLjJfn79lsaREUWCr4?=
 =?us-ascii?Q?C+0inE+rfw9eincro4p2UtCrD5Yt2xjDKOHrkPIjEo9+Zj4oWpWfYlDnmpKL?=
 =?us-ascii?Q?NNlx0GPmQgI2Mt52sZ7FyKtW0bur1syBVJ+3bA10LirKVBe+eRQmFxxbp8cO?=
 =?us-ascii?Q?LyMBSf/01lbU/MjJaIT9TvNXhTMNkG4j3ok28PaeE4GBByBAmG+oUAqo0D6I?=
 =?us-ascii?Q?5sS1oSKZlWw/mPpdD6rbfw1JWUS547UE+cgq04R+jSSLIpKNUPsUMHjJw0Qh?=
 =?us-ascii?Q?AzSRIHbZj2GGWk/vplHleGuaR97LS2q5bw38Nm8hutdpK4CsG1r4XqosoiQw?=
 =?us-ascii?Q?MXqhHA8Q+FegFJ0nDnwFUJLcC/y6SzSmD2GsEc4+EXpx9+M1hNx1rdn3B/+j?=
 =?us-ascii?Q?bW33qD2l2jlzXKwb0BSaHONeB3R+wZroM+wWTkkrCQMY2P+sFOdoL1ntfpYF?=
 =?us-ascii?Q?QuX+0KClTH9dxLwTLlAQe9oKcQB3fq9fwdQx1g4c9MGFeTSp1gek/OFOYp1g?=
 =?us-ascii?Q?LV6xXPfbbUpF6CVbDw/DGWVJFfUXiITOTL1S63LN4Pleog6x+CS3lbOmtKAZ?=
 =?us-ascii?Q?ZnjYalGIt7AjDsRA2nQ1kuy9nrDF8nGWWcQVginyUF0WeblSf1+0lO7vb3nP?=
 =?us-ascii?Q?eyzh3WyPF6Z6tWDTFi6zaas4BSRo8b2tC4WFgco8Js7buCSPxmaCdjJWzHeS?=
 =?us-ascii?Q?kelRfR/EftgJJHSRjIG5Wf36huoUrMRZYG7wyOX87hEaCzXXjCUAXK0cV+I1?=
 =?us-ascii?Q?s+HtbHheTtPg7VJXgjWGiAEpuREFRGx5NTl/Y5zYEsZicSBsj8MXjdEHOUop?=
 =?us-ascii?Q?87qWet8exP6wiHD/wRkgKCFxN8RQzmdMEsW8pbBIMv5rYY+u0tYzvHLsmX0I?=
 =?us-ascii?Q?pf50jra85GExm6wrwDr5hVjC5+V4HBCWrCqVwNevhHtnRkcmfzc3356kxnRs?=
 =?us-ascii?Q?PNmHySuyD1KOvJAgHYH22Ew6E802378IAsUyHYkBIKyuZOLbcO/CBqPIJUeC?=
 =?us-ascii?Q?RFysENV65c+J4ki5DVMQN9z+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057d43d1-5211-4211-29b6-08d9416c74c2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:12.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puwNZYGhVVxmnJ5c8sQ1csJ9mDanpzcTpdxIdsVev3lnFLp1MKMEuBFkznH2W3tsLzCvkdkhM7VvRujYWof1KAB7STUkfEFBajMd0JkZCw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3285
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: O5O7QzWdY3MD6PBTtugBOKHTwd_-b0D-
X-Proofpoint-GUID: O5O7QzWdY3MD6PBTtugBOKHTwd_-b0D-
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

Allocate anonymous memory using memfd_create if the memfd-alloc machine
option is set.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/core/machine.c   | 19 +++++++++++++++++++
 include/hw/boards.h |  1 +
 qemu-options.hx     |  5 +++++
 softmmu/physmem.c   | 42 +++++++++++++++++++++++++++++++++---------
 trace-events        |  1 +
 util/qemu-config.c  |  4 ++++
 6 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 57c18f9..f0656a8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -383,6 +383,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
     ms->mem_merge = value;
 }
 
+static bool machine_get_memfd_alloc(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->memfd_alloc;
+}
+
+static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->memfd_alloc = value;
+}
+
 static bool machine_get_usb(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -917,6 +931,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "mem-merge",
         "Enable/disable memory merge support");
 
+    object_class_property_add_bool(oc, "memfd-alloc",
+        machine_get_memfd_alloc, machine_set_memfd_alloc);
+    object_class_property_set_description(oc, "memfd-alloc",
+        "Enable/disable allocating anonymous memory using memfd_create");
+
     object_class_property_add_bool(oc, "usb",
         machine_get_usb, machine_set_usb);
     object_class_property_set_description(oc, "usb",
diff --git a/include/hw/boards.h b/include/hw/boards.h
index accd6ef..299e1ca 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -305,6 +305,7 @@ struct MachineState {
     char *dt_compatible;
     bool dump_guest_core;
     bool mem_merge;
+    bool memfd_alloc;
     bool usb;
     bool usb_disabled;
     char *firmware;
diff --git a/qemu-options.hx b/qemu-options.hx
index 8965dab..fa53734 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
+    "                memfd-alloc=on|off controls allocating anonymous memory using memfd_create (default: off)\n"
     "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
     "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
@@ -76,6 +77,10 @@ SRST
         supported by the host, de-duplicates identical memory pages
         among VMs instances (enabled by default).
 
+    ``memfd-alloc=on|off``
+        Enables or disables allocation of anonymous memory using memfd_create.
+        (disabled by default).
+
     ``aes-key-wrap=on|off``
         Enables or disables AES key wrapping support on s390-ccw hosts.
         This feature controls whether AES wrapping keys will be created
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 9b171c9..b149250 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -64,6 +64,7 @@
 
 #include "qemu/pmem.h"
 
+#include "qemu/memfd.h"
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -1960,35 +1961,58 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     const bool shared = qemu_ram_is_shared(new_block);
     RAMBlock *block;
     RAMBlock *last_block = NULL;
+    struct MemoryRegion *mr = new_block->mr;
     ram_addr_t old_ram_size, new_ram_size;
     Error *err = NULL;
+    const char *name;
+    void *addr = 0;
+    size_t maxlen;
+    MachineState *ms = MACHINE(qdev_get_machine());
 
     old_ram_size = last_ram_page();
 
     qemu_mutex_lock_ramlist();
-    new_block->offset = find_ram_offset(new_block->max_length);
+    maxlen = new_block->max_length;
+    new_block->offset = find_ram_offset(maxlen);
 
     if (!new_block->host) {
         if (xen_enabled()) {
-            xen_ram_alloc(new_block->offset, new_block->max_length,
-                          new_block->mr, &err);
+            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
             if (err) {
                 error_propagate(errp, err);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
         } else {
-            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
-                                                  &new_block->mr->align,
-                                                  shared, noreserve);
-            if (!new_block->host) {
+            name = memory_region_name(new_block->mr);
+            if (ms->memfd_alloc) {
+                int mfd = -1;          /* placeholder until next patch */
+                mr->align = QEMU_VMALLOC_ALIGN;
+                if (mfd < 0) {
+                    mfd = qemu_memfd_create(name, maxlen + mr->align,
+                                            0, 0, 0, &err);
+                    if (mfd < 0) {
+                        return;
+                    }
+                }
+                new_block->flags |= RAM_SHARED;
+                addr = file_ram_alloc(new_block, maxlen, mfd,
+                                      false, false, 0, errp);
+                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else {
+                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
+                                           shared, noreserve);
+            }
+
+            if (!addr) {
                 error_setg_errno(errp, errno,
                                  "cannot set up guest memory '%s'",
-                                 memory_region_name(new_block->mr));
+                                 name);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
-            memory_try_enable_merging(new_block->host, new_block->max_length);
+            memory_try_enable_merging(addr, maxlen);
+            new_block->host = addr;
         }
     }
 
diff --git a/trace-events b/trace-events
index 765fe25..6dbcd0e 100644
--- a/trace-events
+++ b/trace-events
@@ -40,6 +40,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
 # accel/tcg/cputlb.c
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
 
 # gdbstub.c
 gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 84ee6dc..6162b4d 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
             .type = QEMU_OPT_BOOL,
             .help = "enable/disable memory merge support",
         },{
+            .name = "memfd-alloc",
+            .type = QEMU_OPT_BOOL,
+            .help = "enable/disable memfd_create for anonymous memory",
+        },{
             .name = "usb",
             .type = QEMU_OPT_BOOL,
             .help = "Set on/off to enable/disable usb",
-- 
1.8.3.1



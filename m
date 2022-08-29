Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FC35A46C8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:08:42 +0200 (CEST)
Received: from localhost ([::1]:37834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbhA-0005uF-D9
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSbdY-0002w9-72; Mon, 29 Aug 2022 06:04:56 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSbdU-0004U4-GF; Mon, 29 Aug 2022 06:04:54 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T7CQjI032698;
 Mon, 29 Aug 2022 10:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=J29Eyc+Qk6HuNE6jFFiWwSR5CTYYFhBqfEvq8DiWHqE=;
 b=euRYm1yc5+qPXQq+I6bQIFaQpM3CLZqfOEqTI9gAsPsBMH+cpiiGzAHp7FDNyC23paEl
 fC+u5kecWbI5Uv5EJGpa/wFLHu3M7cSjTpA2wtIbhHg3MeObLNxHshlaf0/YlXVu5MBe
 eLPZ80e1FXi0AFNjqgPtPND5WTbUIJ3JCHx8/wT4KchwfwAjy2z/xwgAi+P3W+PkxDyY
 VK36VHp2QlVENUpmkw9oY/0bKJTJ80+c5T6X2/s6jWqXfKreC0xOEV/dZHubsvkRADSi
 VHoqv4TJx0524jKwKAuL+zn+oXxIZeWJgj/UzRKg9OAySpZ+J1jviOlpOBsHkn/mEVdz qQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7b59tw1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 10:04:45 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27T8roak002857; Mon, 29 Aug 2022 10:04:43 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q2b3pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 10:04:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clw/Y3RwTuf9p3PSODhE/KRwzsBDwqHTYU5uCtSgMkXATrWsuCB2nJrJH0Ab1gLv5dn4Vid1ZbGMaCcEkAgRzE7XdTLO/AREZDf8QgPurw5SPNeHXfTgUC5KkXHNEgFt4vGrfjZ3O45yaZ+Y/EaIG12m0A//+9wx5G3uwbaXcDpWZLCaWvtWIBSinxs9UZ/uU+wEdYLsU7xNwZttlYhBW0aQRH9ZC82UPFkDF7Rvri9USvmJLdf7lwR5qVUqa4dLv/Oql07f8+HRA0RGPR1+gg//p1OyjRBjocYxRpciEwFWRWvQ2kruufal8KWQC9iOqBSic61eN5jRGw2WXt4B3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J29Eyc+Qk6HuNE6jFFiWwSR5CTYYFhBqfEvq8DiWHqE=;
 b=DtDDc8CSSsSbFgenZrrk/M+pJR0aCsWNo2yOIKAja+Dgy2J2nGPmXI070bf8xrLNZSFPhpmjLtOL+5KsyTX+NNOdlLsckFnz49CgNhZAkdjZzp0LglZCbXCZkuBzCeqQJ+e6Nya4scSO7kQM7SECotF0f6jafYzc8+p2MhfOOTG+m4WgSW8qcv85JF41N8zquzJLY9vq3Dsat7cQuytnEgQylS70+dO8c9iWnv7m4cEwY/P05+xqvH9yQxHaoUsc5rC051jHB+AUd2WtG4tz2//RyDUDFQ8lWjAEhsRliJwe9FdUaND0SBQOony8XJ1Fbyny33Q4ZXErJoV2Qko3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J29Eyc+Qk6HuNE6jFFiWwSR5CTYYFhBqfEvq8DiWHqE=;
 b=N9Pv3YtXSVzVMUULa7rZjnb0Jix7idhNLZ+r9mk1UBjeg1ZOz6x64lFtVd5m2XgTokh2mG0KLkQExGQ0aqTcB92SJP0a8v2lgWs3O1U9/xk/44sIwe3syxMU++6kz9yfjbU6tp/tK66+xRH3AFGZY8trjTfnSdJNsfiPzc6mY2E=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4463.namprd10.prod.outlook.com (2603:10b6:a03:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:04:41 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:04:41 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: dgilbert@redhat.com, joe.jin@oracle.com
Subject: [PATCH 1/1] monitor/hmp: print trace as option in help for log command
Date: Mon, 29 Aug 2022 03:04:47 -0700
Message-Id: <20220829100447.1530-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcac262c-1ec6-4703-0bb2-08da89a5e41d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4463:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rw/DHZj6I8GWkPGTROThBGO9VD9DvGoxJp1CanpOMwSJ8eP0nAZEtW0ywN2aVqMOlR8HqL20FuMnjfsKzF8mwNJ4bCiXMKqIYna9SAVQedS/PqTMM203loPgu9/7NkhYEsUdVbm31t3rInuDCpd6TYKQgkzs5AKKb7hY707UuEjCn7NzRiLRQrPkEl+TvCgdt02/9OJsaz2loTGkwuy1utOuG4bkiJqviga1Kia1Wn0sjQx6AxWkxlkUbrB0G8hxkM8gnpmJl/6MXrtZyKIvUbgOU/epKvYxZFswgUFAVgy+pfx0SFZjyXgESEaBOkVBUB4Qhj+2j0MWlZVy0V9+g7jZTRL8Sknw1YFDXXOzAQ8KaWv9/J2p+fHvKdmGCMqXtoeQtOlmcd7sbgZBeUvuGm5LvPfSLpIBvBslSXei0T/aa9tNBuJg99Hh56iKp+fiIGp6XpjI9KF6o122vkY2NLyyjQ/6DtxpRmkkrk2RK0OG9IyOCUFqIapMLMs0RVVjpVhd0ldk5J3/TWzyuXnSINm5ZT8wC+L4+CLQ0nQKq7zbawegc3UzyVnxGyiCudOecziFGQWljSmvH4iOx/kmOyG/F7BdppnW3lGZYC4NZoW2p1Mo2jJZ5qnHM0vFvxDG6S443AlJ71KQllOX50tdbEGwqYQcdz0CdaEIDuk7vE0BnlqfxFgUXcy8xfpKm3M409Fvdo3TPk09rTu2O3+mDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(366004)(346002)(136003)(39860400002)(2906002)(6512007)(38100700002)(107886003)(26005)(44832011)(6506007)(2616005)(186003)(1076003)(83380400001)(8676002)(66946007)(4326008)(66476007)(66556008)(6486002)(316002)(41300700001)(36756003)(8936002)(5660300002)(86362001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MusAOOyggNYlxtFpZLIBkoxM/bKh5Hxers0w8p54SVnRhZRtmJz0zjqFeS0a?=
 =?us-ascii?Q?jgBjhGz2TowyzXD2cybpijFSdvmbHM8efPCjuxbyxuuuK5EaQWcgZgQhD8Qm?=
 =?us-ascii?Q?j9yWw8cxWn/fSChnRigk1cBZA49eQlkpQUvCy71NwV9K4ihfyS7c1kIZs6XX?=
 =?us-ascii?Q?RWVO44VkqyModlzVgKW4hstAt3d+oaWnK0odl7geTONH7zDtAy3Eq7hQr832?=
 =?us-ascii?Q?lxYT/v57NADAA5FD9QaveFwSorVY5WbEEdU+xh8msXcF/B/riB8Ccvw1pbw6?=
 =?us-ascii?Q?d3RkZgnjSoTl4KnmPLKNIILkZBOWvrP0WPvpSZBlHX6xQd9ZwMrtuRpVOoaE?=
 =?us-ascii?Q?p4ea3yWZmEoQ/pk0nAEGPEta6kB8hQ1g0S11pHAw6q8BoDCnyRqa2zxcYVkt?=
 =?us-ascii?Q?FwzA0vtldyCJ+9/WA0bfNEs5zKeIbNO1DfINrKLC+tQmslJhPTlTB8oR4nvx?=
 =?us-ascii?Q?TwnJdLLmFHmXdFwt3WhfZueAnkuy/i9iw5OjPwvxxrXKrdcFe6Eh/mVpDjjC?=
 =?us-ascii?Q?EzJCaAbLytE4eIC+iwLgxSK++hbvq8kAcxvBV983ovlAAJVS2744ADFBkvMe?=
 =?us-ascii?Q?3QKw1zgm+wSnNusAjK2VQvdzHGN8Ox2uq9+fOmZaGibg5rfNaNOPiTwTwNa1?=
 =?us-ascii?Q?vk9Ed1FlHLdLpGuMhFkBLa8r1qyaU+3u+5nDmO2H8ue8Dm/GchOggRwkFq9n?=
 =?us-ascii?Q?M1GrisiH+2+b5sW1veWBgAsFIyUe1CFcmnwKD+DSnLZBU15/XMOv3e2jItRj?=
 =?us-ascii?Q?P6HUUnxr69UYxZ0BdhOsnITbhHZRL6zRkOh0Jm9CKPP1+Kkr43NVOltawhx2?=
 =?us-ascii?Q?y7qxIJvOJd6YWmyQjFowfUPJmTVCYRyWFy828Ljub6NMTpt2tO6mW3mIgv3o?=
 =?us-ascii?Q?QzgIjc8MPc/YE0/nT/1uGBhxUaX9ITgwhyb06mghtd0yYdln5wfj01NX3Pt2?=
 =?us-ascii?Q?VxaqNUglb4hKsVpFKmS/OaEIdTyRkp3jYmmHZG6tstDl4VskkHNFAqK0C6iT?=
 =?us-ascii?Q?WVKPlK62Vs61UyJ8JEhcRZsGgUBUBaPzTsDRmmRQEw+jusZQVkklTGaiQJjo?=
 =?us-ascii?Q?Nf1y1kotUljutx+Ww6E9CtUQNzaTxx3x6PqCyqqZ8JIhWjs8ga7xpJIkPceu?=
 =?us-ascii?Q?wH0SgjUyeEj+s0TXTJn+vbfFKZk9wQ2opSH6Y7sJtvCN1wXjpB42vuGjEQLj?=
 =?us-ascii?Q?TuRJGxn5qKVioXmZuQKGNQIKx/zfkXePaBjmirgyldJVt8NpzBtXtUSN0lus?=
 =?us-ascii?Q?z+HejjxAQFb83tzMdWlsAQoXEJPAScXDIUe+cNzvvP9083b6947rdhovOlvD?=
 =?us-ascii?Q?jqCZNKPeKE34Wp6HDISrOlMIPeFyZFBRMy/moqrJDLrhEoh4cUYfeV18/p6c?=
 =?us-ascii?Q?dQUczgIdDkxWsFnwzvu4QXO/H6ma4/ADa4Zr3ytPN+PS5aQMObLWL2YRGwNq?=
 =?us-ascii?Q?Of1+OE82JNZsl8OTie9rNUmEpHgekWP5U4ke3rsqw4N8hUpD6epBIjevTYNj?=
 =?us-ascii?Q?M7DXx41C/L6qdagbUsMLQPEEwsBnaBWxPdbasgmQdK26mGDimRuCI/7zl6oa?=
 =?us-ascii?Q?1ifswnQerjDiiep1ad7nP8hkwfoQqyY1ikOx1Hv4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcac262c-1ec6-4703-0bb2-08da89a5e41d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:04:41.7155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVllpUJJSy2jl/ucSmb9IgWtU8Ngfd/DPWzaOEZkpyHujsDtsJ7HKoyhTJ4YM87qb2SnPdAQK7dQb+U+rL7OEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4463
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290050
X-Proofpoint-ORIG-GUID: fgFZ4Ycamib0tygl2F4RXLwh3waovXtJ
X-Proofpoint-GUID: fgFZ4Ycamib0tygl2F4RXLwh3waovXtJ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
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

$ qemu-system-x86_64 -d help
... ...
trace:PATTERN   enable trace events

Use "-d trace:help" to get a list of trace events.

However, they are not printed in hmp "help log" command.

Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 monitor/hmp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index 15ca047..9f48b70 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -287,8 +287,13 @@ void help_cmd(Monitor *mon, const char *name)
             monitor_printf(mon, "Log items (comma separated):\n");
             monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
             for (item = qemu_log_items; item->mask != 0; item++) {
-                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
+                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
             }
+#ifdef CONFIG_TRACE_LOG
+            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
+            monitor_printf(mon, "\nUse \"info trace-events\" to get a list of "
+                                "trace events.\n\n");
+#endif
             return;
         }
 
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AE321E81
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:51:13 +0100 (CET)
Received: from localhost ([::1]:38212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFMW-0002vW-G7
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lEFJb-00013N-VW; Mon, 22 Feb 2021 12:48:11 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:34386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lEFJZ-0001y2-5p; Mon, 22 Feb 2021 12:48:11 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MHk3r6104226;
 Mon, 22 Feb 2021 17:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=jk2R58gq0UYjjMx2VkQKAlIeZKH8PUpycv1oXRGJIC8=;
 b=lpyjrJsubpIU5OpfM/22KD4YLbZkBc6ItWcktCpXfiHatP0ii4RXo7KTXIfg252zE93u
 OnjxnV1qQFiAD6x6nosge5hnHSPOMwhkQeaCGYjf/zcnmV4Akz7OEP3eCRgvZfhiRcfb
 7+wdFSrmHv5AooqMEgUWl5AP1sdxe7/kK+uT5kFzqLXM5ng0wd6Ihu/5kLmZqO+oBaT5
 CDwVahAIUWSAndsAw0kmPVtW23v1l1v9PtOLNSSXx+elBycWcINtcqd5trDPVlweW2bl
 E3amEtZE1yUm7Sinvzw/p127rIb5qxXUgUtFWWMbux4J+J6KkYMtQAzxgYFAD9KuarEE Sw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 36tsuqvj2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 17:48:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MHkPu8106492;
 Mon, 22 Feb 2021 17:48:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by userp3030.oracle.com with ESMTP id 36ucbwdp2k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 17:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geVJfkoYPoBz1oC0kg4ViheExqOpEAjL8tAliDaHzG9aqQlKEIZ8/SLggE4CPPYQIXZBPYdnv9FWZgVoddMJdcE1uJqYhVydxL2XbwrUn23amTq3i+PsyKrIe5Yjug5FJFlz/wBTXgalB4xzvJS2QEP97Z8Y246VhcgmZU3sult7lKVb34cH2Tnfxgzrr6C21NryPovvYH13R2o8SyTB/OVME+ew/boxfXYDGY1BhHo2SVeRGjue8VbcQ9AYhDqZ+DYdnFmUG0TCl7EwahoI4GtSvVIzXh5HO+8caVnkxQaCAvTLlV8OcNazfny+T5vstqvHXmWANNRUjFk+Q/fdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk2R58gq0UYjjMx2VkQKAlIeZKH8PUpycv1oXRGJIC8=;
 b=Mmyn25DL5PIFTgJMSTlUO/u7BB3Y2zXwxDj6QqZlsAiKS/vgExjvKTyVYfmbKe1m93uQgWLNdAbVwNV2+J8+aZwBn0UdocXFxUjUKEjUHWxdOfCmh+a4dElM5p8QYbHLB3HmGHjsv2P3AZ9d9LlhRDE2rPVIxOiNXMsHIMivrQF3Vyr9rwS/oDY0KHo0H3MBhGlDu21jk+SuKsljsBVnfF1NnY7CoBKjc+ap+2x5p2ouDV0vR9UqKGicOXISp5d7/OJ/XpvRVQfTjf8O9Vkq23UFRQwe0wcFHVj6hiCJd7zMpEZZMt1dx6g6eKbblOZBl8I5FVx0ab+yXdH0Kj12RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk2R58gq0UYjjMx2VkQKAlIeZKH8PUpycv1oXRGJIC8=;
 b=sWJj/3nsRS7PnW4BicCgUiNf/xaY1/6nGzEIIkJhWOSSpcjw9T5g1Cvwu2SG4wqpW0j0K9oNXyCT8fTr+pF6fI/v2bOW95lRhV+asH6e1mv0Y1CjmlaCLo5qaUbqS6k8fsB9sBNpH5w4iiJbSpja5t/Jb2tkhlC2ZwTR0iVC8KA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3466.namprd10.prod.outlook.com (2603:10b6:5:17e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Mon, 22 Feb
 2021 17:48:05 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 17:48:05 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 2/3] hw/pflash_cfi01: Correct the type of PFlashCFI01.ro
Date: Mon, 22 Feb 2021 17:47:56 +0000
Message-Id: <20210222174757.2329740-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222174757.2329740-1-david.edmondson@oracle.com>
References: <20210222174757.2329740-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Mon, 22 Feb 2021 17:48:04 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id ea7c68c5;
 Mon, 22 Feb 2021 17:47:57 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11dcd2ab-7edc-439c-304e-08d8d75a01c9
X-MS-TrafficTypeDiagnostic: DM6PR10MB3466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3466424C6FD1A43024E3BD9B88819@DM6PR10MB3466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HBQIlCJ26vg9b3zTUJrToBCK4yRlk4D/9uPwBkgpO3yfSP14RH8ffoEDOBX9tSDiWbfKkhc+eninjJHM+qlKiCoZ7tpYt9iA/NKx0DvxFh1LHsH8KoScYvYHcdbftvRuE1xeU1SnbXd114l0aPeeJAoxkaHkdDU9i52kn+diihlrNQjr9f0LHvPTXvPE3XqNLFi65IM6CtnlD1au+kWrDJOPVaz6FJlXjuscV5lCwvew897vF52MJVJF8IWymgw3O04cOptoN95Nxo1RZNakT6focwrzJYfB5RQ+KBaMUe4z0+XMHf5GBrb4LoTM0c5k8TKXV7IsDVE17QbUw0yknSmQi5HGrGbvoH68xmAClI+nGxHBGzaUk+72PbnTtWR6PxgronvSgZt6+9zzLpS7BEN9d83j1n6JdAWhGXO+m+bscUsleYK7vr+jlDtR0WneiXreqtok5Cg+cpaHH3+E5m6zbxwcs9eiVNUMZQBUMJESVnaqaoMHjtdVWsZzmXdHjSWY73mW9NbVj5uRwSCPig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(366004)(39860400002)(376002)(54906003)(478600001)(44832011)(316002)(83380400001)(52116002)(86362001)(186003)(66946007)(66476007)(66556008)(36756003)(8936002)(107886003)(4326008)(5660300002)(2616005)(4744005)(1076003)(8676002)(2906002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M3FSNjcxdFFqQk8yYzd2VTRabEVkRkUzbEljbXdhNnNzQ0U4OEJlQ3R3cTVn?=
 =?utf-8?B?QTZZVWNndUlYdzhCZWszZCs3T0JxQ3I3RndWT1ZHUUwxWjhXUElKNjlHcVdz?=
 =?utf-8?B?WFdBSzVNUTdwYnhtdE1IZVl1c2xEWDlMV2FEdEIzeVJ2aEtzTXBsbzRvbWhS?=
 =?utf-8?B?WkoveG1HaGQ2SE1WZEtiRlEyTXJ1K2hJZk10K2FIbGlQb25kYyszVUJrOVRS?=
 =?utf-8?B?RjV0dTgreEJaeUo0eUFRWmhRNEdkTTN3eXRHTkZCbGUyMkk4ejhuRmsxSlc0?=
 =?utf-8?B?QUMxcUc3dGZWeXlhVnc5d1ptZEwrSjBJSFlCeGd3aVNtdzRxMWZyZkFzVXQ3?=
 =?utf-8?B?bWZ3WEdSeVIwZE1qVTkzSHdZK3FzS3F5UUlYR3IvTTB5cktMbzREYllQTG9T?=
 =?utf-8?B?YmVOQjZHaEd5QTdianRXZW94QmFnR09kZVppL1dSNWdhZGF1Nkg4Z2xNOGtF?=
 =?utf-8?B?Uzlpa1lpUkRTL1B1cU5UVTY1c3JweitXU2hrU2ozOFA5QVNWSXBRY2FJcEd0?=
 =?utf-8?B?Mm5qNXJjc0VwR0pGWmhKQU9UbENKODZjZjVyNVd2QUVKOThlUnI2aUVBd1pn?=
 =?utf-8?B?QUxoc1BFcHd1SThhSDVSZi9yOGZHM2dyeXJ6WVZCa0JZWHA1VzZkVHJjSkFk?=
 =?utf-8?B?YWZTYUNmTTRDU0ZONklKWjZUYjI2YnVRV0FaN0lpUzRWOVE2QUh5SHFTcVRh?=
 =?utf-8?B?akprODhtZlBkWEhLNVYzTXg0MVdGbjRIV1oxNURNVVh6T0JlWlZCV1FacGNp?=
 =?utf-8?B?U0Q3S0htb2l5TDlod1BnVUxTQzBRV0FLR3pZT1FteElET2xmMG02dWZGUEdP?=
 =?utf-8?B?TThOUHhjSitFSFNpZzMrWmdrL3dvVjJPT3NTM0FLdGFDRSsvYUs0UFJLclZ5?=
 =?utf-8?B?WE51YzdkV1ljR3h0N0FJdVRoSW1TSGcxLzlHdGs4N1ZQUUtQS3J6YmV4VU0w?=
 =?utf-8?B?OUw3QXYybUhTdVEyRndzSE5mMGtEdWk2eXhhcGpLVDRlUFNXekQ1bnhTSzZ3?=
 =?utf-8?B?RVBjM2FmbWMrbmpyVGxjNFdzaGl1ZlBZNm9JN2ZURE1EMkdCL3g3WGxzVTlv?=
 =?utf-8?B?WGtiZVFjZ2FBT000WE5qdTZmN3R5S21HZnRwM1BrR3V6djNGOE93czZLajMy?=
 =?utf-8?B?endSdXpkSE90Z1Blb0NlTEQ1emhUdG5WaVB5cDdjZkt0ZnVpbEdMeGsyWGdU?=
 =?utf-8?B?US9kbmNickd5WUpoZXcweG5LN1BJd0RGOEtsNzM0TkVobHhpV2EzTHZsbjRL?=
 =?utf-8?B?VE40RXNKSnJJem93a3BUV2dETytDYUNIdktHNld3UmlzYnZvSlp6ajQwayt4?=
 =?utf-8?B?bnh1ZW1vbUJCRU5nSEJScTJYK0p4bW1IeEU4SjljMDdkSWpKRkNaeWxValFx?=
 =?utf-8?B?Tm5QbVg1VVVIU2dSNFdlbGl1Q2NKNWlkNE8wQThNbkhBSy9wYlA2SStJb05J?=
 =?utf-8?B?SWJ5REdHdGQ1WFVadUdQL1ZqUTNibmNUSGcvdkRyNUEzNzE4WWFQSSt6S1Zu?=
 =?utf-8?B?czlmQmVQVDB4NnZnWDhWNkNhbm10SmhDMFZ0aGlaZFFrTUxvNUNCemVFMXZI?=
 =?utf-8?B?bWUwNkplSjM2NU9VZURNLzYzeVc1QXVnMitnanBUbVJncFZTQi9NcERzTTJj?=
 =?utf-8?B?dmFVcHhpYTk5YzJBYjJzQWxDUHp6Wm9UdWcxQWtzWllvWmx5akt0RGZDNk1T?=
 =?utf-8?B?L2w1YlF4aTJEc0taQ00rMHVlN2l0NkF6cmNBbWFOQWJkcUlCQWFRbkYvQlho?=
 =?utf-8?B?QjcvNU9abmxmRnAxRVpRUFdsaHR6aVRoaFk5dXh6RVdpWXB3NitIb3VNdWs5?=
 =?utf-8?B?YzRReDc2Zmo3dEt2YjdaZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11dcd2ab-7edc-439c-304e-08d8d75a01c9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 17:48:05.2794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgE2s7zXSpfe2c5cdPJ70Y2W95L9XtNZG/cNUQbwn8zXwbgOgLvkYvYC34mrdw1ZOyG93sAMiUH0SCmt4RDX9K03Koo4U5AxjTT/PZ00ing=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3466
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220158
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220158
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PFlashCFI01.ro is a bool, declare it as such.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/pflash_cfi01.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 9e1f3b42c6..6b21b4af52 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -72,7 +72,7 @@ struct PFlashCFI01 {
     uint8_t max_device_width;  /* max device width in bytes */
     uint32_t features;
     uint8_t wcycle; /* if 0, the flash is read normally */
-    int ro;
+    bool ro;
     uint8_t cmd;
     uint8_t status;
     uint16_t ident0;
@@ -738,7 +738,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
             return;
         }
     } else {
-        pfl->ro = 0;
+        pfl->ro = false;
     }
 
     if (pfl->blk) {
-- 
2.30.0



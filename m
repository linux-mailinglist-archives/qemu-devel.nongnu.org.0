Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C8332A12
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:18:11 +0100 (CET)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe7e-0002Mv-8X
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXI-0002ok-C4; Tue, 09 Mar 2021 09:40:40 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:37304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXB-0003nO-M0; Tue, 09 Mar 2021 09:40:36 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129Edwd5153306;
 Tue, 9 Mar 2021 14:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=6X00bJZSU8oM4dFY4zWwMUXZMkp/GRsK7l1Po9JrRgA=;
 b=i9qHtUkUgQJ5KEkbzkwGufQGPcq25rpFdBf2y7YtAU16aYcrdeuWOZlNW1/j7zfMkuku
 HthN3KiyxwdUSuwBR19RC2dVIg2T6ZsYFuHuCJtdTj3vyeH2lTVZJ5WKbcDqG7Z8vJO/
 yzhDV+zR2wvGQ7/KtrdhAB/GoFre4tdCD8+hxCxmLBriQzeDRtJ0vauJpj5z7ogo6929
 PZJJple7KbK1Azkaa+I+dMy/0HWaay3mABk+W/PxrSuEYjx+TQLHei+XxZxvnI3ebObT
 41xY6oxWbooxMdCXhrpEnLwDkswMP+EKA9Oljmc9AYZz7e0xX070nbE7JkC8Gy9Ez43p mA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 37415r7gh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EVOYn193150;
 Tue, 9 Mar 2021 14:40:24 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 374knwwjvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYfSuX7p5GiGsoFwkGPgc3XLzKc3S8TLQvdp4WeI1YQhtIPvMjuOjLSsNW9cD8kbkArzptsy2u/8yy7p+3RvV1NK0ziMlZmLmierEsRFYId5PzSp81+0wYhOXnfxDcR4BXEUKiWQNA94WZiKL2b1nfvMLi7cu5V3iV68SjLops3l5LHfgHGMr9i83SddAa5a2hUs532KB3odHwlbxhBh3d3Bfs3wOchlVilJk72tIM4whRCI66lmI6v+8+znph/UnSrl5ox0fq2sVqw7PVliv89U3P8LUDUJwJq0EVpQLUj8sH7MLRMKtxK7iOqxo5SYvUQd2dBolvlDUgk7MVm04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6X00bJZSU8oM4dFY4zWwMUXZMkp/GRsK7l1Po9JrRgA=;
 b=GQWtQ59tUqRx8AALPmSHAVFenQsTQ5gCf2+qvbt2UvdlbQqGo4ytUPDNbL/lU4gZSVNJyPVHbMzpepF2vZxnsmpGaofjvANPog6BC9XJdDv5w2C6g47hDqP9QwBQT4Mxowbmn9DndkyiYQy97hchydKJFhje8DPltlvqfLwUpFoAgxZf9UArcvg3meMX6hJ0N5uVZVeSVFi8iQVUGi6/b7hmOBrjpmUr/NgcTfUpViACAz3Qju66kgfY3BgaAgI2ePGRm1asxuMc4XitqSGqZ/vc8PFnuCB+Q29iBdmAdFk9f2YkcPI2HqiALEU0PH1ECvarDsL7VKc9JmWyCEHPFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6X00bJZSU8oM4dFY4zWwMUXZMkp/GRsK7l1Po9JrRgA=;
 b=OfOvzPK/+bPm0Vl0XRCslvPpJFXaD+x1Y1m1v1y4AtKXP6M1Kemwg+uStGEBGyQAS4mR/3qZDFPIcPczRiC+PCneyUr9JNx4gCwdUbXZBkQ/t+4Wwi45nv4rD/2M7Voj5dhhzpgJ73mYJ945JL3EwiWDYuAu8nzlZoaIMFU08oM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR10MB1771.namprd10.prod.outlook.com (2603:10b6:4:8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.29; Tue, 9 Mar 2021 14:40:22 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 14:40:22 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
Date: Tue,  9 Mar 2021 14:40:10 +0000
Message-Id: <20210309144015.557477-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309144015.557477-1-david.edmondson@oracle.com>
References: <20210309144015.557477-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::34) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 14:40:21 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 4b3c2d4d;
 Tue, 9 Mar 2021 14:40:15 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18c55d63-0723-4e30-a91e-08d8e3094505
X-MS-TrafficTypeDiagnostic: DM5PR10MB1771:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB177142BEE5A105AEA74249A188929@DM5PR10MB1771.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4s5oCH6ZnLIGgLo2jnr8Ru+YrJhsX+esCAEJeX+qnOTps09E68h5gvB9G8AwuzRO58I04uhPsu6SjKM3fnSMU2jdx+PLtNKcJmURBkUeX8dSIA1OoDLJVB4xUXF9iJOma2joLyFB4K5odwgdLIHPpgtYHgIFQm8ZgaAcqzHo1eyXkTxe1Ns9pCaqnTOkkUsmB+RlT+ZcaVIuGpREKjXPdmCCiQR1oq0HbXqCgAiY+qHrVb6UtgnHLAXJlnFRFA9I3WQ2J/7LjRMYbhiriY4PPVpkGAoKg4PyIHeOyn3zbHhO5ArGkqWKaLYZKJFjH76ihFMczwVxzbInFZ2qUqIhJqw/JXjqq/RT9/rS+VP2ee7hmMUmg3QlWzFHoH1H1Hliburj0jSXYgeAWj6Al1Cuuc06Q9g59WQRpBz+3a++RpyFYiB/B9Dc63YJtptWMp7c1Z2CFl14SHNF1ZTJkjW+WiXN5dlLamI1JehxZ2Cbfh0omtpoqRVFvznveFb2Gr/bH1dDUAP2cSvnQyinmrRH8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(86362001)(186003)(83380400001)(66946007)(44832011)(316002)(52116002)(1076003)(36756003)(8676002)(8936002)(54906003)(66556008)(6916009)(478600001)(2616005)(4744005)(5660300002)(4326008)(2906002)(6666004)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ky9sV3E3bkx3VC9wSmZ4Ymt5SlV2K0VBaDJsRGZTVlk2WGQrcmFSSE12c0s3?=
 =?utf-8?B?ZFZ5SXN3dTJOenJYaTBsNi93YnBjYWRiS2JqNEU1c0VsaUtCUUVPajlqOFVV?=
 =?utf-8?B?d3N3bE9samNNSjlaaWJZbUQySkpWNFR6U0ZiYTV2YUtyL2ZuejRiVHNaZVZp?=
 =?utf-8?B?ZjdLaVJBcVAzTURINnBWSzJqek9LVk0vUUZ2azFxSVlJbUVTNldWaHFPYmdU?=
 =?utf-8?B?bGwxazJIS0xIL1FrN0hpc2lXbHNTTUNLL3dKV2FxN01UeGNDUFdtT3cycnRy?=
 =?utf-8?B?aDVmVEd3U0pqUmRuM25uUktxRmc1RHM4WThvNmgvS0F1N1NwMzJBWG5Tc2FV?=
 =?utf-8?B?djQrRGRJRjliaUNJRXRDTFVsZmZYd3QzbjFHaHZiaUl1SVlVaDk5andtL2h2?=
 =?utf-8?B?WFQ5VksvWE9KQW9JVE5uVk9BRUttbGN3YWhKWFdleUNlaWJIbmhMMW05U1pM?=
 =?utf-8?B?WHZDQTYvK1F1eUMyYjR2aDhZSGdlSVM5TFFtZ3h5R0MrbzNLc1B0YWJVc2Vh?=
 =?utf-8?B?QUdITTllcml5cU9zZ3BiYXpjS2hHQm1FUmFpWll0TUpnc0pvZGtnWnF1ME5n?=
 =?utf-8?B?NjdiWW9DY0pLUFJVZGcwbHhJREVDUU40NlY4YUs4YzVvSXRGc1hIWldlMFFi?=
 =?utf-8?B?MlMwa1VkZmIxY2F5UmhRYVdzNTZ1WjNsZi8xNEg0cGFSUlhLSlo1cTRFL0ZO?=
 =?utf-8?B?OTNUaXF3MGV3Z1RqRk9HaEZoTHVMaFh6MEdDWGJBQ0dmUDZUbU1lYjNoSWJ0?=
 =?utf-8?B?ZzhmdDdDTENIZFR4ZXNtUjI0T1lsUDNyRDFxaHFUejNxZTZTaDgyZXpQc3Uw?=
 =?utf-8?B?NGE0cDRtYzNKVDVNZ2N3cDAxUGkwVEFUR0IwSnFKaWpPZERiQVJPSGRnMS84?=
 =?utf-8?B?SmorZ3Z3QWt2UTdmM3VKUzFPdFh3dzJwbHEwSmx3Z25ITkxYR1hOMWNCdUNM?=
 =?utf-8?B?aWhDbjU1eUtMVExnelJWbVdSMGxaSENtTHFLTGlKR0lzU1pGUWdoMWhOZVdO?=
 =?utf-8?B?VXFPK2RoNFVEUHJaVDJrVy92Q3poU3B1SVJIaVlZbldwS1g2TkFqUTl3UUo4?=
 =?utf-8?B?cCt3V285b2ZKTCtOSXNzNjJsT0NTMU5ZK001bW01eFRPbXJGUGhZSFM2YlRp?=
 =?utf-8?B?V2JSem10OGRpR2wyWWNhOTZoV1Q1NXhIdk05U0kzalFvMEY5SkI2Z3ZNSFgy?=
 =?utf-8?B?dm1Gakd0QTZKcG1mR3lWbjNWREt2K3lsV1BLS2F1MVFkSzRXc3EySzRnNVJk?=
 =?utf-8?B?S3p3NXFNTjVwMkE2SHZtWXRacDhJa2RxNWdPOElrdk40QjdlcDF5NFd0Mksr?=
 =?utf-8?B?U1VDdzBSb1c1bGxKUnA4cUdRWi9lL1UvUGZ1M0FXakYzaVJZclNZWTNZelZU?=
 =?utf-8?B?NTZzYkFiRkorRGhsWTk0OXkxUGg3QlplWXJDL0xXaVRUNGlvci9LdUl6VjVD?=
 =?utf-8?B?bEQzaFR1M1pKckVCVDNQYzJ2dXlHNWxUV2VSTU1kaGVOeEN6amhxbDlFNVJ2?=
 =?utf-8?B?MmlJZ0hIUmFkUEdjaUdwYmR0c01OQS9vSzV1QWpnbk9uekJJeHNvYjZrZmI5?=
 =?utf-8?B?OHhqdFZ1YnRVTnlaTUhIWm53ZnhSOFVXamJVQ2w4RjYxVGtITmtYMkhmeWdR?=
 =?utf-8?B?ZUwrdURzVStLWVJ0bTVDdXFzbzk3V1AwaHcybFFVVFNBcUlJb3dHNmdZZzdh?=
 =?utf-8?B?bEdvK1Y4Vjd3cmoySFhRdzFkUmRlYVp0RGo2KytKbTRRM2hWa3FiWTRSOTYz?=
 =?utf-8?B?MTRUK1FIczdZRmsxWUVPb0RSaWpISjFNQnVYV010aXhYcFpFTGNHallaWk85?=
 =?utf-8?B?c1pkYzlqNDFBdU9PU1QzUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c55d63-0723-4e30-a91e-08d8e3094505
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:40:22.7643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URhhzJvYNwgQNSlxZSnFWHRxQ9KvCd7aq5EMPZAmfD8I5brupoBdX78wa9D7s1keTB2NCBSlDF1eKe6mlvLusxqaGuGc/WVgBSastqrYono=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1771
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090074
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090075
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a new bitmap entry is allocated, requiring the entire block to be
written, avoiding leaking the buffer allocated for the block should
the write fail.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 block/vdi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/vdi.c b/block/vdi.c
index 5627e7d764..2a6dc26124 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -690,6 +690,7 @@ nonallocating_write:
 
     logout("finished data write\n");
     if (ret < 0) {
+        g_free(block);
         return ret;
     }
 
-- 
2.30.1



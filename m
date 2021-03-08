Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7304A330B3F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:33:09 +0100 (CET)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDCG-0003By-F6
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJD9i-0001tH-IV; Mon, 08 Mar 2021 05:30:30 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:48384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJD9b-0006Ga-Ug; Mon, 08 Mar 2021 05:30:30 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 128ANWN4043190;
 Mon, 8 Mar 2021 10:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=jk2R58gq0UYjjMx2VkQKAlIeZKH8PUpycv1oXRGJIC8=;
 b=sgKKKPekPjiwhb/BDuhCLcHu9pY8rkSA+/1VSNOC7KHRwHC/7ka4X9n62pkbFtQBkh2z
 1D5Jm7O+s7/IvZz6nhoYROYRrpH1lm1EUK1kfSUuqfdcavrjCVTeqsEursI8DIbvcD06
 jOdjAQXgaWAKVXeyRrmyszRyOjIbRDsTvrGxOtFluP25Q2wLOSmcwGaUkTKhYBgFHKdf
 iSYl25EOy969ENvyah8xe4VkBY8ihh/S4GBTIN8R7lJ50VlO+7UiwUAYf34WQ0fGd4qb
 maz7HbkFWECXbGzVy6+aSCEkoBTzMTpyJvUd4L6MMWqUFaHac84EeN/dbvmABPa5PZlK Mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 373y8bk93r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Mar 2021 10:30:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 128APKLR029357;
 Mon, 8 Mar 2021 10:30:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by aserp3030.oracle.com with ESMTP id 374kam3242-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Mar 2021 10:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMh2nWOD02OCAJ/JP3bMfVJ8M57I5prBB7Pj3/319Q4gPKi9sZf3XUVV55LeiCmIAXXerjgEAcRHvrtwgv5mUG1mQMaoQ9A65TMMxdNQaDMEOXEw5ctGwkkh/QBPNwoY9ff17RGPLg+8J5z90l6E0va4Ob3X9pMgAUlr4zXs99+6FLIwSPxl+Wb32u9RCtlRpOu1cVl0gGYDAhTZAcGBnWcaV0uEYbG8TsDYDKyog+I81jaruvWfqfbfX/p/sXw3JrRG8zLE5lDdONNb5+nGXLkO8kBmqHKUxGmlxJxolwKPuOILNjRIOuEDHvHHOiVvGHceq/3nqcgbxljiYFSXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk2R58gq0UYjjMx2VkQKAlIeZKH8PUpycv1oXRGJIC8=;
 b=nMleHf90mbyGvs4IRJ/jZsijs1bh292PTBEbXF2t4MbnEIWxRZ31GtdFJflZQ2vZedeSMGl7kthYEoujtZc0WC8JUT4vYZ9E0cLmfIvUdaLoeGWZLNkwK9yGGVRltw1PGZbzGfWuyPoxjISHi22iI+JPumMordwcSin5PYGltdzni1UIZ5/DOlf2zdHgOy7qGL7ojeesoNHJBz2PgQgLMF0SIFJaQTwfh5smWBO1GF5WMfmNxMqSbHcPqxNkaP22SDlqz/FbtcQDLneXaYgd1ZS408icsS6nvYQAjskntNbyywWn9d2/Ab9q6Ydi1ISSuNQKCcDWrF02n/qFaacv7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk2R58gq0UYjjMx2VkQKAlIeZKH8PUpycv1oXRGJIC8=;
 b=h+tfY5sUjH+EqRKex31P2jA/DKJLpauAwdnyHT58IzVkqxDx2Oee0WpUdpKoPf0MQq+zHOwbTDJ9o9EsrxajwCjUp5UqKlyZaCxx0IvesmfSxky12AuZTfP0mc8nXeKV96F9vOZWq7zvaDqWCtH+wq1huCNfzLjnVT35/1vhEjM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3705.namprd10.prod.outlook.com (2603:10b6:5:155::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Mon, 8 Mar
 2021 10:30:16 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Mon, 8 Mar 2021
 10:30:16 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] hw/pflash_cfi01: Correct the type of PFlashCFI01.ro
Date: Mon,  8 Mar 2021 10:30:09 +0000
Message-Id: <20210308103009.3295532-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210308103009.3295532-1-david.edmondson@oracle.com>
References: <20210308103009.3295532-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0269.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::22) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0269.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:194::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 10:30:15 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 43097076;
 Mon, 8 Mar 2021 10:30:09 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7c332ae-0663-4773-3111-08d8e21d2a36
X-MS-TrafficTypeDiagnostic: DM6PR10MB3705:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB37050FE9724743C12B7EDFC488939@DM6PR10MB3705.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /yK5uIH0NQ1MCLpK65R0TNAZtL3dvcBMziUn+ZuQ9ojuy1Epe3XlFYNfI75HPsamNasLMD4rQuvCHBDbNwcPHhc7beiqRu0dzOcxqFSL6hRcmY+JJ3ffsKn69tmCLwdNuqXr0JsNJGPCFUh/Dl+10Btoz3OICMzKLMRxkZerQoSzXTXp5B48zWETU51u08h5iUmVldyX4/bUNKX3ogpiNdfs0VMKQMfCzOC+lN+CQxLL97ectHf+FhSgRdjjYNXIaJcshiLV4/Lqe++YXbtddQ1Ijt8rPt+r5WFELX4L6Od3Hu51NW3af+HzyLkF1lqVgmDR9WbiqbFMCatN/+neJAUl7zuDN7ccBmHblyWMSEAiL3jSCBwhm27Q12kJ5WyvE/8fxhMmFhjrWJc59+YgjX7SbLP2Z6kRPnPjyUZKHHUglYUU4nZH47XvNk2gah06ds04TWo+3bQP79eFAX4EoFgPPz7pTM2Rv6A/MhYxMqf8lXl48STFAA65p+XCsMYXuKv83/1P19Z7EPKHkz4Dig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(136003)(376002)(39860400002)(2616005)(1076003)(6966003)(66556008)(4326008)(8676002)(66476007)(478600001)(66946007)(316002)(36756003)(44832011)(86362001)(5660300002)(186003)(107886003)(2906002)(6916009)(54906003)(52116002)(8936002)(83380400001)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bWgvb0w2ZkZVampYYkNmQnlvSStNMTY4MzNSc3c1bENxZU5kS2RrSE1qcDIw?=
 =?utf-8?B?bVRGZUg2NzMyckxLMGxvd1piYmNMVmRNa012SGNESlorNFZnQ1JiWGkxWldM?=
 =?utf-8?B?Y0lpelE3Rm5mbGRRTk0wQWFXOGExQWFhUlBYVFpsdTZnbHB0Mk00UjRGYzVa?=
 =?utf-8?B?YTRUY2lTRE9zTWs2SCtyT0kxNGxjbUorMEhJRkVoYUpJTzVWcHFWY2cyTzVs?=
 =?utf-8?B?cFRJVWxLdVZOdVBnZHZDK0pVL2hyQ0h4d015cU9qUms1bXI0dWRBWEpURFdq?=
 =?utf-8?B?ZzVIQ2VsVzRpU0w2WEFwekFnQ1MxR3hmT1VGOXJZRUZobWcwZ3p0ZFBMZ1F0?=
 =?utf-8?B?WkFBNzJIeXptQzlZRlNDckRENUhmT3BiVlprN1dnUmlRYlBTZVVqYVpHM0Zj?=
 =?utf-8?B?dHEzSnFOd1V2TXhIcjdQRTB4MHdNSG03SHBHSklEQmxSemEwR3E2c0xFelRC?=
 =?utf-8?B?RG1zbTg5eWlzZDBqcXBhYUpzbWkwZE8zWEIvUHRqTkp5ZHdGUFNWQVN3TEcr?=
 =?utf-8?B?VElhb01abHVmQlhXK2tGcXhTVUtMaXBSQ29rWnZKZTM4bzcwY3RLc0ExOERn?=
 =?utf-8?B?bW5PN0lrdFViWVBvc1FoWkNmNE5DL2twbUh6VlVZT1dZWkJQczlOZit5YXBl?=
 =?utf-8?B?MlRIYVBYUjRrR1g4bGpRUlpkVVlPVG1jbU9meGdGa2Z2blU3Zkd6RWpWakR1?=
 =?utf-8?B?TkovRlM2UmlRMzcrNWtEV0hCb2xPTjYyR0MvTmw1YlkrWHhjYWdBUFFONXFw?=
 =?utf-8?B?K2V5K0dTczdpOG9OS0NsM0RZZjlCQnF4WDMzbFBRa045RThaTjd3dHFyTW5j?=
 =?utf-8?B?Wlg1QjB0QWwveUF4V0M3L09ucXBSNUVDYWcxWlRVRERWY1lKK0ZINndFWFJn?=
 =?utf-8?B?OXFickVydDR2aXhEZDBWUWd1M1VGcFM0KzdqTFFGSGM1RWIwZllCMWVrTzBM?=
 =?utf-8?B?azh0dTYvR0lWZEJJTnlxZ0QxRTFTOHAzWVhjeVpZOEkwOTRHbEZtL1ArVlYv?=
 =?utf-8?B?Y0ptOFIrY0VUclBwRUdwSk1zWm1CY211cGZQY3ZRWHlGczlvQUdzeksyV0Y5?=
 =?utf-8?B?SHZaMEF6MFlWa01vdlVsZlZiRXRHM1RYbWx5azR3N09aK0tCYTJkbllSTk45?=
 =?utf-8?B?M1dZYnNhdFo4dngvNmxEWHA4bU5pUTIxUnRJZ3g2UFZVcG1JYjRVTjd2ZmUv?=
 =?utf-8?B?VjFvQ1B6Vi9aaEJEeFZ0czBTdlQ0VDJFdHNsQjBBL0p4ZVRkQ0ZibEIyWDFz?=
 =?utf-8?B?UjkrR3l2Ym1YZUtnK0NSSVh3czZocHF2d0tMYmxURitFaFJack1BMkFjamov?=
 =?utf-8?B?dlYvZEdsZEgxT3pFdFBVUThyaCtFanJ4Z3FKNVRoLzlWYnRIT3FKSUozUENJ?=
 =?utf-8?B?ZC9pMXBmZjVFMkFNdGZZK2pXaEhTMnVkV0x3d2FSSDNreTJOeVB1OXljSXNX?=
 =?utf-8?B?bk1ycXdQekdyeXE5OU5XT1hsU1NjYXlRZzNJNGgycnpVWWVEdCtVRnBVUGcx?=
 =?utf-8?B?K1ZPRzF2ZXZ0RW1FVmdYM3RUVzlyRVlNODd2d2o4ZGQrRFhKWlA1bVUrQ2FB?=
 =?utf-8?B?dGEzdG9kYk5Xb0xwdXkvYmpRQndEUlhvamFWdnloa1ZINFJJM0t4aEN2QVl1?=
 =?utf-8?B?V1E1NjdWdTZpeVd0UDhzV2J5RHBrckJJbi93NDlDUDR5dkhVeGtHaHEybjls?=
 =?utf-8?B?UTVJK2FJdW1MQ0xoL0JuVWZLa3MzWVF6S1dwRWZQWWVqaU1MMUlLRjZJa3Jk?=
 =?utf-8?B?L1Vncmx2anY2dUhNbC8ycTRGeloxWjltMDhpRUxGY1BJVzA4ekd4aERSaU1H?=
 =?utf-8?B?NGxpSHRjSmNTSWVUUTBMQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c332ae-0663-4773-3111-08d8e21d2a36
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 10:30:16.5197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B92fEpZOutP1wggq6T0KFYLtocT+aDRsT48KdJd3lMgVmzB6VF8CoECm4bHKZAbtttPW6FL0OoL3qY0+aOn10uZy43qjy0z1v7F7PQxS440=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3705
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9916
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080054
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9916
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080054
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
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



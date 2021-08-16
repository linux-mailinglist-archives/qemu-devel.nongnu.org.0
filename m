Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD03EDB35
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:48:15 +0200 (CEST)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfmY-0000kv-Ap
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhc-0000iA-6M
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhX-0007xB-Lf
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:07 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGaDUi000575; Mon, 16 Aug 2021 16:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=wurk93t3EgNHShjLwZYYsyPz+MrafcioJ7ppfdsGyhk=;
 b=yFE8kNoS7OZl8IAfyGUcvABGJMs0B8txERGOuzJR9WzKrMUFtX/OYAj6lXPqaIF4rBgd
 G7svVm9m4G1TgbtmqbGek82B3npQHfmy43ULW51CwiLmqkHkGHQ1Y5TDVE+lbgul9ifQ
 WRlIFDYFJr1A0LdJHXDBSQf5i/qpyfZAFQ/T7TjLROwKUMAKSoGj2JEZFXrHt/6ZF81Q
 DdIiuSgY7njgvo3uZdKRFFGrrjdcyrU616N9L4RjU+Gu2PZOm0+19rrdVTVsQe8ydaF+
 ngWLGfxhuI2UhsLEIFaTaY3wC1hze2nKpFQoWILDjn1jqGj4Fw/vaErqA9NeBVxg3hme ZA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=wurk93t3EgNHShjLwZYYsyPz+MrafcioJ7ppfdsGyhk=;
 b=SgXhP8i6LSMKUZz68bqKmkV22m0eLhprEpzYd6NIpqenOzHZsSIMmSwrIAGBpnPkeWNn
 Gbdtrq2iQ21z4YSGPnfgLq+XtPEw6cbnIIlTeQI9sdUEgY8XPiriD5FZQi37H0fD78bp
 yxe3ryvlKLZZsMUxYJjo5yeAoWm+dnh1dOuUkBwG2RJZnXr6bzx79+q8eym+4epU/EWj
 TF7HooYPnyNu6VLvbfeIW1TpWmVJvABFpw9CziHw8I1XpGbEC/EUNGHs8yLWbjVENiXq
 gULrbabNW+6yJDLw6AumT1hbIPDE3ZeOFVco7s41ftyaLChEYnCF3Lne3dyC3iFCU+4H jg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af1q9anuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeijD113651;
 Mon, 16 Aug 2021 16:43:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by aserp3020.oracle.com with ESMTP id 3ae5n609gk-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5RYhsXAZiUJ7PJ08QtSW1vu1JtjV9OIdEdNM1U+G9m1INYYZPZAzqubEuNYtT5qOMU0lYZ51jTwLPxnozZ1oez0fepC7pm4ynf0p7q9suK0aSwehxgDrDJqnAGol4LwE8srN1NvTKMaAqpaMmi2DsNJwhujdqaJHdRZ/G0VTT3QeSkKQkXfChRAEScoj7DEdQUe2n9wdTrejit90mPT0Jl3r8m/RgGBQ05OjwPvUSb/ezXtVcvo1oBF/lu3gXH+LNE2WMVKEwoAb+FhZAhvUgBV9IV3/SwsC1VXHoKf/lWcznFi1V6HAIJEhR9MHzBCSDLORCYcem+siR8puEi85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wurk93t3EgNHShjLwZYYsyPz+MrafcioJ7ppfdsGyhk=;
 b=K/9+Upc5XkqDH9adaXFCVqEcxcku8sJFxL91RRV9cYDXS+JcXoRjxvb511Govn79I1j6vOdlsyiH4MDjnJfCNIA3OTUtltM4A/aj6IX9rmZ0nCRYlnb3HcaLIhcEjRdP8FUV4yAOWCuIy+Yb5pJ7jamml1SRRmcnpCnMl7avUFScr9+x/QU/6gKBY7yi5QJdg6Lw5bGkTRgWuUfUrjc8EyP1M2rkYnN0YfDShCf72AK444DynPold5+0bPtpCHyXyIgjJM2m/fmpb4eaKEswuqFbvyd4DZszYv/90FRb1qVM1/osngLCseSkEM1AxJBlGVePTnBlHZG8zkYawM53Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wurk93t3EgNHShjLwZYYsyPz+MrafcioJ7ppfdsGyhk=;
 b=J0QmalywJKNTDM4/WF12whivR1NkfV7K7oUJYy8F7CSEodQxXDd0NwpMusEslys0qHpB8PG6ecIH04W3ZQ6M8yBp8EKp3gn029+yE7/NN+UxcBlpiHjcPh3kaLBn1Mvkp6asOd0f+mU9Y6aDOamnoDPUtxn/Pzys95nLEzWucuc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by BYAPR10MB3221.namprd10.prod.outlook.com (2603:10b6:a03:14f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 16:42:58 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:42:58 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 06/16] vfio-user: negotiate version with remote server
Date: Mon, 16 Aug 2021 09:42:39 -0700
Message-Id: <a14c2c09f41ddda83cd710516cac8d210ec9db08.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:42:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 939681f2-6134-4cb6-8220-08d960d4e75f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3221792E4ABF0AEA9CFABF508CFD9@BYAPR10MB3221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HeK6ZdnVt6Pnd4buy7pEm2C6454sl1eMbOwXXfmZGILSeob5hPwKcR6ijWE6zQIu5Xq1THlHKmH/HJ9IdAK7pDZGx5Zc+SEJq2ljYpfD2mIAm4us+AmD3sobzrNF0c70s/lsHtfeSvEeEcUfT8/9x9bjjyscsHGUV0OHzM4a8mc8KCqGEj/QoEzNoLS9WUsURF1WSmS7aYIBwuumoluBQHliXlVG57m4BZlxTmdg/nPqpDkEKcSJbFn0O2qiF5dSgG6AUoDx4GfuYq3Hff3SiCD9T0s0vj7C6v8U41goIHktzkxcWTfbQG8FLb3WTFklQlewZLlOKyC9x46hiqReddTk9d79HovyQx0BLjqYQ/M3+soB8JqWZ2qDFK7TF6gLzOd3fjRbBRgVXbO0MO83AXVSgURu4HxFnciwSY3RFKuuLjTkqqjG4OcV1JOmKO9uBhGKDYOA5xndFVz+DqNk14HKr7z89b34h0W0kn0UPLw2PrfCTx1enjsyeSEkFg9aWu9H66WOYi4Z8povrg2gHoZjnb0AxPD5rdAw2Ay2SFZ2jMZzUltqnO5gDnSE2twVBzFJCjua/u8jFO9dIWEctZD32Z6hpJhOpPfeOvcSHDxOg6pV67hlGfO/6hU02FmoRvfoGcYA9Fx88n81EAw43Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(2616005)(6916009)(66556008)(66476007)(66946007)(52116002)(83380400001)(478600001)(36756003)(5660300002)(6506007)(6666004)(6512007)(186003)(316002)(6486002)(86362001)(44832011)(8936002)(8676002)(38100700002)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WhpJ0+8QuK7pvrGIgm5mO2gk8x49uPB7cCcpCNbc7EdirI5uZLIhv6Y121yz?=
 =?us-ascii?Q?Bs7BOzgP7b9gyHOaFE3ydoWqirlv9JPdkDBiaJB7lEeBMaXjzm5R5VFFIz83?=
 =?us-ascii?Q?IfbeAML7q683uDmJhC/tMdigW0ZiVcUwfinAQCWyGYkyU2v4DNQGgyTG2rTS?=
 =?us-ascii?Q?5keamV21AslmmUKwZDARTXgWVG0Gdea9O35NzdzolTF6MHtWxBh/Rq6wHO7O?=
 =?us-ascii?Q?WXI0VaVXVitcT5pDKIQIYQc7TnXlngZ5ZTO/lYYfwGg8nH40EYx2I7A+D/Vk?=
 =?us-ascii?Q?qWKcy2zHERlsD3FW+6j3gESJXU7tWfkiQByUj3r+6nV6HbEIVIUOA+FtNqYR?=
 =?us-ascii?Q?9y5f4zWd+o/0oXvVuBIi9YhD3hr8tDSMP+C8tKJD1VnjLifxegsWLHrWrKpf?=
 =?us-ascii?Q?r2NMjqF/zYl/S2DNiwxAFT3le5hnMo4oib42wRfVwhGVKD/CnBi5znR/2uV3?=
 =?us-ascii?Q?va1bGDQxD9A/WXCPL64XVRoK3UgltF1ApFYXmGILqsNf9MlXKtqVXASnu4jS?=
 =?us-ascii?Q?q/gDrcQwlxgg533IBBnFgDrx9RomCpOyJVCuRw25SHWowhjzQohFW77SbGS0?=
 =?us-ascii?Q?iM198FB/YXFQ7+QzdMQEoLhpEC47rYP67+dnvO5o+hznbQEOSdwAr3PCvHmx?=
 =?us-ascii?Q?BccdMXlfufGGHV/nqAFEHWsIP9Eq95a56kcqBgROE3zXiBZWYAXC/ijzQLK3?=
 =?us-ascii?Q?QlCipgeOu/CaeErR5IeetmBBAvJOpmNFAkC1muI1hNBiG/RalhocU/MweJTc?=
 =?us-ascii?Q?+3KZ1d/twf4ocsg/+aoan9qKlfUJATSWWB225LQBixExozdle+9mIcPqobO5?=
 =?us-ascii?Q?xA7tHRchUEy60O5lQqZLa4AygSA3h/DnWeKrZ/Ol1HXZ3YlFKX2qkesi3Rrv?=
 =?us-ascii?Q?ebChE8envNj9hbDlD2BQPWrwRhYMg3IrOPZi8ie7Me78PVqymX5L60i1x4gO?=
 =?us-ascii?Q?X07dEhAbRq7kSWmTswO6+KknT3un7BChCxp19RXRyH/9cqpISXZx2KuO8Pbo?=
 =?us-ascii?Q?fpzoMCZeEF208wHnf1McBQsj6gc4txHInxCPoa5w2XdKf8YMC1vT4OpQNp1n?=
 =?us-ascii?Q?1+44nhzK21JYpMf89zMMxXWS8hEO2OCsx4kN8Ho3PuPNNZ48lC0zuiG7QBnV?=
 =?us-ascii?Q?pUvFqBjqrJLQS9w5kKCB8srNMoHacAjsWsW7d0RDwNZ6v49oC3DB31Kc7F4i?=
 =?us-ascii?Q?yeRCMYjyiMYEmbFy/Iloort/JsDaHVyT3nZrZvSEdpcoTd9nq9g2fg/w7SEb?=
 =?us-ascii?Q?QS1mSUGlSFOkPbyIX0ybUbe3/5yD7D+WvCU8exJ5uFqecwN8v7W+4r7KigPR?=
 =?us-ascii?Q?DyD8dMc/IVoKhJmldvjoeUcpJ3yB3NZTBJL6n8QU1XTZlE+5HnxSW9R7K+RU?=
 =?us-ascii?Q?Rai0FP69JOtqwNRfTFBjhXzOCGiI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939681f2-6134-4cb6-8220-08d960d4e75f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:42:58.6541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5+PNTGiUgwTyLXxUePO9cVlxzFhAbXThzQOIbcNYuINaa0m/41FsRT+Nb/oLPJgDUFBI/7VksWHLvQDUhZ1SXAgYuusn9HoXpkLPcpmD7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: MLR0wU_GX5YYoJf4hzscZrCrhsnCo7BD
X-Proofpoint-ORIG-GUID: MLR0wU_GX5YYoJf4hzscZrCrhsnCo7BD
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/user-protocol.h |  23 ++++
 hw/vfio/user.h          |   1 +
 hw/vfio/pci.c           |   9 ++
 hw/vfio/user.c          | 267 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 300 insertions(+)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 27062cb910..14b762d1ad 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -52,6 +52,29 @@ enum vfio_user_command {
 #define VFIO_USER_ERROR         0x20
 
 
+/*
+ * VFIO_USER_VERSION
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint16_t major;
+    uint16_t minor;
+    char capabilities[];
+} VFIOUserVersion;
+
+#define VFIO_USER_MAJOR_VER     0
+#define VFIO_USER_MINOR_VER     0
+
+#define VFIO_USER_CAP           "capabilities"
+
+/* "capabilities" members */
+#define VFIO_USER_CAP_MAX_FDS   "max_msg_fds"
+#define VFIO_USER_CAP_MAX_XFER  "max_data_xfer_size"
+#define VFIO_USER_CAP_MIGR      "migration"
+
+/* "migration" member */
+#define VFIO_USER_CAP_PGSIZE    "pgsize"
+
 #define VFIO_USER_DEF_MAX_FDS   8
 #define VFIO_USER_MAX_MAX_FDS   16
 
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 905e374e12..cab957ba7a 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -70,5 +70,6 @@ void vfio_user_set_reqhandler(VFIODevice *vbasdev,
                                              VFIOUserFDs *fds),
                                              void *reqarg);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
+int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7005d9f891..eae33e746f 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3397,6 +3397,12 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         proxy->flags |= VFIO_PROXY_SECURE;
     }
 
+    vfio_user_validate_version(vbasedev, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
     vbasedev->fd = -1;
@@ -3404,6 +3410,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->no_mmap = false;
     vbasedev->ops = &vfio_user_pci_ops;
 
+error:
+    vfio_user_disconnect(proxy);
+    error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
 
 static void vfio_user_instance_finalize(Object *obj)
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 2fcc77d997..e89464a571 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -23,9 +23,16 @@
 #include "io/channel-socket.h"
 #include "io/channel-util.h"
 #include "sysemu/iothread.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
+#include "qapi/qmp/qnull.h"
+#include "qapi/qmp/qstring.h"
+#include "qapi/qmp/qnum.h"
 #include "user.h"
 
 static uint64_t max_xfer_size = VFIO_USER_DEF_MAX_XFER;
+static uint64_t max_send_fds = VFIO_USER_DEF_MAX_FDS;
+static int wait_time = 1000;   /* wait 1 sec for replies */
 static IOThread *vfio_user_iothread;
 
 static void vfio_user_shutdown(VFIOProxy *proxy);
@@ -34,7 +41,14 @@ static void vfio_user_send_locked(VFIOProxy *proxy, VFIOUserHdr *msg,
                                   VFIOUserFDs *fds);
 static void vfio_user_send(VFIOProxy *proxy, VFIOUserHdr *msg,
                            VFIOUserFDs *fds);
+static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
+                                  uint32_t size, uint32_t flags);
+static void vfio_user_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
+                                VFIOUserFDs *fds, int rsize, int flags);
 
+/* vfio_user_send_recv flags */
+#define NOWAIT          0x1  /* do not wait for reply */
+#define NOIOLOCK        0x2  /* do not drop iolock */
 
 /*
  * Functions called by main, CPU, or iothread threads
@@ -333,6 +347,79 @@ static void vfio_user_cb(void *opaque)
  * Functions called by main or CPU threads
  */
 
+static void vfio_user_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
+                                VFIOUserFDs *fds, int rsize, int flags)
+{
+    VFIOUserReply *reply;
+    bool iolock = 0;
+
+    if (msg->flags & VFIO_USER_NO_REPLY) {
+        error_printf("vfio_user_send_recv on async message\n");
+        return;
+    }
+
+    /*
+     * We may block later, so use a per-proxy lock and let
+     * the iothreads run while we sleep unless told no to
+     */
+    QEMU_LOCK_GUARD(&proxy->lock);
+    if (!(flags & NOIOLOCK)) {
+        iolock = qemu_mutex_iothread_locked();
+        if (iolock) {
+            qemu_mutex_unlock_iothread();
+        }
+    }
+
+    reply = QTAILQ_FIRST(&proxy->free);
+    if (reply != NULL) {
+        QTAILQ_REMOVE(&proxy->free, reply, next);
+        reply->complete = 0;
+    } else {
+        reply = g_malloc0(sizeof(*reply));
+        qemu_cond_init(&reply->cv);
+    }
+    reply->msg = msg;
+    reply->fds = fds;
+    reply->id = msg->id;
+    reply->rsize = rsize ? rsize : msg->size;
+    QTAILQ_INSERT_TAIL(&proxy->pending, reply, next);
+
+    vfio_user_send_locked(proxy, msg, fds);
+    if (!(msg->flags & VFIO_USER_ERROR)) {
+        if (!(flags & NOWAIT)) {
+            while (reply->complete == 0) {
+                if (!qemu_cond_timedwait(&reply->cv, &proxy->lock, wait_time)) {
+                    msg->flags |= VFIO_USER_ERROR;
+                    msg->error_reply = ETIMEDOUT;
+                    break;
+                }
+            }
+            QTAILQ_INSERT_HEAD(&proxy->free, reply, next);
+        } else {
+            reply->nowait = 1;
+            proxy->last_nowait = reply;
+        }
+    } else {
+        QTAILQ_INSERT_HEAD(&proxy->free, reply, next);
+    }
+
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
+
+static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
+                                  uint32_t size, uint32_t flags)
+{
+    static uint16_t next_id;
+
+    hdr->id = qatomic_fetch_inc(&next_id);
+    hdr->command = cmd;
+    hdr->size = size;
+    hdr->flags = (flags & ~VFIO_USER_TYPE) | VFIO_USER_REQUEST;
+    hdr->error_reply = 0;
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -447,3 +534,183 @@ void vfio_user_disconnect(VFIOProxy *proxy)
 
     g_free(proxy);
 }
+
+struct cap_entry {
+    const char *name;
+    int (*check)(QObject *qobj, Error **errp);
+};
+
+static int caps_parse(QDict *qdict, struct cap_entry caps[], Error **errp)
+{
+    QObject *qobj;
+    struct cap_entry *p;
+
+    for (p = caps; p->name != NULL; p++) {
+        qobj = qdict_get(qdict, p->name);
+        if (qobj != NULL) {
+            if (p->check(qobj, errp)) {
+                return -1;
+            }
+            qdict_del(qdict, p->name);
+        }
+    }
+
+    /* warning, for now */
+    if (qdict_size(qdict) != 0) {
+        error_printf("spurious capabilities\n");
+    }
+    return 0;
+}
+
+static int check_pgsize(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+    uint64_t pgsize;
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &pgsize)) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_PGSIZE);
+        return -1;
+    }
+    return pgsize == 4096 ? 0 : -1;
+}
+
+static struct cap_entry caps_migr[] = {
+    { VFIO_USER_CAP_PGSIZE, check_pgsize },
+    { NULL }
+};
+
+static int check_max_fds(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &max_send_fds) ||
+        max_send_fds > VFIO_USER_MAX_MAX_FDS) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
+        return -1;
+    }
+    return 0;
+}
+
+static int check_max_xfer(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &max_xfer_size) ||
+        max_xfer_size > VFIO_USER_MAX_MAX_XFER) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_XFER);
+        return -1;
+    }
+    return 0;
+}
+
+static int check_migr(QObject *qobj, Error **errp)
+{
+    QDict *qdict = qobject_to(QDict, qobj);
+
+    if (qdict == NULL || caps_parse(qdict, caps_migr, errp)) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
+        return -1;
+    }
+    return 0;
+}
+
+static struct cap_entry caps_cap[] = {
+    { VFIO_USER_CAP_MAX_FDS, check_max_fds },
+    { VFIO_USER_CAP_MAX_XFER, check_max_xfer },
+    { VFIO_USER_CAP_MIGR, check_migr },
+    { NULL }
+};
+
+static int check_cap(QObject *qobj, Error **errp)
+{
+   QDict *qdict = qobject_to(QDict, qobj);
+
+    if (qdict == NULL || caps_parse(qdict, caps_cap, errp)) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP);
+        return -1;
+    }
+    return 0;
+}
+
+static struct cap_entry ver_0_0[] = {
+    { VFIO_USER_CAP, check_cap },
+    { NULL }
+};
+
+static int caps_check(int minor, const char *caps, Error **errp)
+{
+    QObject *qobj;
+    QDict *qdict;
+    int ret;
+
+    qobj = qobject_from_json(caps, NULL);
+    if (qobj == NULL) {
+        error_setg(errp, "malformed capabilities %s", caps);
+        return -1;
+    }
+    qdict = qobject_to(QDict, qobj);
+    if (qdict == NULL) {
+        error_setg(errp, "capabilities %s not an object", caps);
+        qobject_unref(qobj);
+        return -1;
+    }
+    ret = caps_parse(qdict, ver_0_0, errp);
+
+    qobject_unref(qobj);
+    return ret;
+}
+
+static GString *caps_json(void)
+{
+    QDict *dict = qdict_new();
+    QDict *capdict = qdict_new();
+    QDict *migdict = qdict_new();
+    GString *str;
+
+    qdict_put_int(migdict, VFIO_USER_CAP_PGSIZE, 4096);
+    qdict_put_obj(capdict, VFIO_USER_CAP_MIGR, QOBJECT(migdict));
+
+    qdict_put_int(capdict, VFIO_USER_CAP_MAX_FDS, VFIO_USER_MAX_MAX_FDS);
+    qdict_put_int(capdict, VFIO_USER_CAP_MAX_XFER, VFIO_USER_DEF_MAX_XFER);
+
+    qdict_put_obj(dict, VFIO_USER_CAP, QOBJECT(capdict));
+
+    str = qobject_to_json(QOBJECT(dict));
+    qobject_unref(dict);
+    return str;
+}
+
+int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
+{
+    g_autofree VFIOUserVersion *msgp;
+    GString *caps;
+    int size, caplen;
+
+    caps = caps_json();
+    caplen = caps->len + 1;
+    size = sizeof(*msgp) + caplen;
+    msgp = g_malloc0(size);
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_VERSION, size, 0);
+    msgp->major = VFIO_USER_MAJOR_VER;
+    msgp->minor = VFIO_USER_MINOR_VER;
+    memcpy(&msgp->capabilities, caps->str, caplen);
+    g_string_free(caps, true);
+
+    vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, NULL, 0, 0);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        error_setg_errno(errp, msgp->hdr.error_reply, "version reply");
+        return -1;
+    }
+
+    if (msgp->major != VFIO_USER_MAJOR_VER ||
+        msgp->minor > VFIO_USER_MINOR_VER) {
+        error_setg(errp, "incompatible server version");
+        return -1;
+    }
+    if (caps_check(msgp->minor, (char *)msgp + sizeof(*msgp), errp) != 0) {
+        return -1;
+    }
+
+    return 0;
+}
-- 
2.25.1



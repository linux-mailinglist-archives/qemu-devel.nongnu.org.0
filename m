Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672DD3EDB2B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:45:02 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfjQ-0003LT-Si
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhZ-0000dk-Uy
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhX-0007uU-FY
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:05 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGaAhs021058; Mon, 16 Aug 2021 16:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=HU+WVZn20enFNMZWdVa5bfgLHRj1V4MI+wkyDyMte0Y=;
 b=yCNoOFoHUrEDmZmMKgVPVyRYB7bJQbrP9vPA1wimH5vaDAKglVD+XS3sllmkPbc4kQqL
 c0nnBx3u3NcS+HQeJ8qsQJLMn2tAHsAjOBUfKj+IEKO3RuuVXjoj1qLG3rVJJcNVg7jQ
 xbM6PXjtKiukIbRziJYxJmfq3VEpfZKovygCZLo9jTWRtPO3hzi9dj11wkzR2hB69VsW
 G6ByizbphwVVuY+/h1Ga47/cKs2gw79rOjmeReLVVwy1BwIdmn9uJyZOTUsF+PgeITjv
 qNJvkZ/pKiYEIkFR6RrxmOZoYFhEL/TX1RUrB3ntN8NVTdBdgmkGEeeQlnJso3NjH/sb Jg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=HU+WVZn20enFNMZWdVa5bfgLHRj1V4MI+wkyDyMte0Y=;
 b=bHAesTW/SIunEFvYfZFZdBhmTqHBVlqSczVw6CD5kP3kzpX9g7dueF/B2TEZMPXxaqy2
 zVl5SsnS4eutCb5o7Lffb+oqkHwzm9BflNZqw8Bapim1ix7t0bzZR0X7VDRpFG0BylV7
 LlhMqLzPyUm/zfN8m5QmtqvPosZtCzeK8g6CtUllf+8p0WrfMyTyN8rMwor2G2RQ2Qha
 lH+HRF/OnSzAo+XmJPpyAg2GDGR0DKc3VDQzS9Zs7aYj+XhG++EUuPJ8/DmFC8IWvbdU
 l9OlfUqSvj4kgFnssEWAGTm+KsMxuqKJjYY3BovJcw4zEq0kDRGqjTnv12wJhgBhH557 +g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afgmb9jyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeijA113651;
 Mon, 16 Aug 2021 16:42:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by aserp3020.oracle.com with ESMTP id 3ae5n609gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6HQETKFi+hK0bFK6FSJMDqPJgfNwhdWvTfWtwbTNMBXW4m+3+sNBtS6pgneFFzVVgh2s1zNPzPm9nN5GgeWtIVN4PbP0DZBlcqU5rE+e3nNUkW1KiVVdM8p/Xu+X90DLYV91ZDnYeqND6GQUuqJ0ok7h/+8XG63ukkNlciV+xK+KYvTZ97RNf4QqMRCOs+xJ2FDAQRnwQnJZBlUjwzsFBwerkMvuzy5YDpsGzffadgDFkLAl4ADS73dpKXZdRpAa3BMe4rzxINvKUHgUVZlWpheCcJz+3ala2ohap69tAfoFh0SV/BtnjKpuKwwxh73X5WdziqD2o/iTvCHrhtiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HU+WVZn20enFNMZWdVa5bfgLHRj1V4MI+wkyDyMte0Y=;
 b=SiZRLKjQKHo95wv2cjhdM1Q7fkR4q8TIaJDz1q7RcKT4iKTFPVReFb4UxLoGXZSNonQKKxuQvQ3q8H9GJbDpzaoZyTD2oon5wYRsKI/8SlDLDtldwHJ+aoB/FV70IkIU2hS81qXKNhaP8qGHh6XSj8bsmD5B89XYWagWzkOJaYCTX3CquirJ3oYYjKNYP8VdryO4MlXZEXE/VMC1bGT/wCt++zLzdre/TXk0qhaZhvTG5aalx9VCR7EI7CK1Zj+SqGtCw41nHHKjkL94oVyzWdJZmdSlyeP90K0AThvA0Ojb7RwYxsMuO9h7PMfz0khQlidi+1JHnZWINWDXjP9LTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HU+WVZn20enFNMZWdVa5bfgLHRj1V4MI+wkyDyMte0Y=;
 b=epXmIH/ONiqfxCY8uH0RoM3jxsUGBXdzvWM2GWvNHYsc1o5JysY+Yo47nQ1J0lazdITxN2h3EBqXj+k/HzzS8///B1SUi0jP9s6Yg1x2LrrglWm3/PH9OaLsu4uq4qf4mdfdnXTmgWEtg88J7evkNTa7VHK5C6TKHTFj1UeMNNs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by BYAPR10MB3221.namprd10.prod.outlook.com (2603:10b6:a03:14f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 16:42:57 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:42:57 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 03/16] vfio-user: Define type vfio_user_pci_dev_info
Date: Mon, 16 Aug 2021 09:42:36 -0700
Message-Id: <4153fb93ac5c353911a1321efc0a02f9f402acd5.1629131628.git.elena.ufimtseva@oracle.com>
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
 Transport; Mon, 16 Aug 2021 16:42:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a8465e7-6639-43ec-0e86-08d960d4e68d
X-MS-TrafficTypeDiagnostic: BYAPR10MB3221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB322114244D9ECEC22EE5F93F8CFD9@BYAPR10MB3221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bSu5LiiNnUFhnoeE8UIHZXNP4EhFo9rvdcy+jYKA1At4/YGlf2xWnWKMliwXH9A1Nl5XdVIJja3wKRKo+/x0jC2z/xlC4W5d1kh+Be/t0hhENyFmhOg+frhf9xNtAUvM9Lf6MvrXsaBBm7lFs7D78V8rBjPIaDncbnuDUzgoZGkRmXD4MUarUvpmKyaEz9Dwn+0ASGCTnJtgF7h4ThL/B04X8jgoMJjdsCGKaZ4OB9aWC00cbuJOKdhxBOZvPVz2i8PoiPq62KlSnB/Q/yRN8WPOGYQc+NaZ08JIey0obaYyF/LnDtZsP3uUAKsimNBl7imLvWQtPGiOrOV5GaKYvMdhWd4DayYXHfUCDS+fpXOwEVP4MbDN8F3WkB8hbk8bdF+uOZvVjC+ywBibN/79Qi9Zah+Nidyahr/fnIWyzrjfA5oPwGLZ9UIU7XJA5hpMYJ7cdLEjx2pv4MZGDPeoLMM7nFaHzq4wIhoztkRVAyRUikV2GnyN5WWzRW25y8HHOfEuGAO4vIrkZvrFnd13FifmDCMxLKNXqBvzhT7cCI+VvsUSamjk+knVZP8jB/dShndthRx9LSOZOFrSOPuMSUd1oUUV/bnhGGGEG065xTufCYVLD2Lnc7ia0py7J0JnPxxobsekjH8aHfp7QvWbSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(2616005)(6916009)(66556008)(66476007)(66946007)(52116002)(478600001)(36756003)(5660300002)(6506007)(6666004)(6512007)(186003)(316002)(6486002)(86362001)(44832011)(8936002)(8676002)(38100700002)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I13HZtuLLRZzi89PHSCxCjtRdsE/gRzrrKKxXCaKLPpV7nlACyNts0Y2FKym?=
 =?us-ascii?Q?8gS0FfSOs50O/I58ADcqUfqguMi+90SqpfR3G5y85KoRQ72tNYgULSypNKma?=
 =?us-ascii?Q?mxGtVaXKZB9Vjc9q4aavROaQmntI4XCMp8VV+wN6IG2E+p2ev/ye2VA2Y4UX?=
 =?us-ascii?Q?UtbFJE3kMK8XNUntIiASURBmmKxPjJAoRiLpbQBPXqUeqkgOpA8e4k3JKrmD?=
 =?us-ascii?Q?F+waRKqgs5052vaTdBwTH3u+kD5j5WPzaf85Y5m23DQ60GMr6DEie000nAhY?=
 =?us-ascii?Q?GFJJKQi7BUjdIzfADeWlijnkd5XyIjKKJKzSJG9Gt+JGnUQVs4gbTSG8tGqX?=
 =?us-ascii?Q?sSY5VB0jNRXXBjUG7IgO8NPzS/3vkmvhlonPHDoIq4jxapnE2nWV0tnlJxkc?=
 =?us-ascii?Q?JbI0W8Vj2Y2GF2d/F28IdY24Dp+YE9+cUncALDWg8/CfHZDuCKblyaC4C+NH?=
 =?us-ascii?Q?uGAoB6OKI/4pu3NbSHfbr8iCA5r4N8ADzxcQV0Z1fxcI555+xPfiWvz+FPjT?=
 =?us-ascii?Q?xUsV8CRuGcW3brGvuFSrRk7gAZawexZtTSXDpYX9SrE5G1/Fyb3xLeQSngNN?=
 =?us-ascii?Q?hOfWlHEsnWyhQ6mduQf/UQPmvChLTQZUEMNgdAkS+z8rFvTKiI2Qv4eryZob?=
 =?us-ascii?Q?TA4FK5/VYsHYhhbpmEuT+wxWiZQkjDO3/ECVVHD4HfyHErwExXnggAOEC0Os?=
 =?us-ascii?Q?sdpHILPzlNAihySZ+fIqsqqIl6cw0J6Sp+l85esQYSI+ABPM3eBbv5PaVMeo?=
 =?us-ascii?Q?h07knqPSOnFj69DuvddMBUN3EggGvS+l4BlykaPsmJuMtLKOZRXgXwDCvdtZ?=
 =?us-ascii?Q?rjCWlrypQ/UFDwnuYb8NVAh+eZC6IJ59QxUhaymIRFcidNxkjlBG+szMZtNC?=
 =?us-ascii?Q?zc97wEJQ9gpFXx+xThiX1Mi2G5I7zdTleSdRO5/y6v4G+Qw6WmxzupJ5CQEZ?=
 =?us-ascii?Q?fBtON5qUrFjc9YOsBiyhl1jqvofOAxIi0mAL/jCTv656A7+KVdSxKYuobiQc?=
 =?us-ascii?Q?du2WoEKlSxf25C0DDE/yoQDmg9X3hqS7rSLrNYfqpuTJ6ez+A9oRfcBPhglo?=
 =?us-ascii?Q?Tm2EaSDxI6vUb6vtqIWgKX9f86rdqOkUZXDMboZ+CALOhHmZNAH2LXDJHeXM?=
 =?us-ascii?Q?6rn8U2y+ajXQZFmXoHhqlDq/VLYIwTHv9i0JdXI+NpijVZ8P0zh0DdCrOC+M?=
 =?us-ascii?Q?ndACPElstC/AJhIP7xX9QejSVdd0C7xo3Za44sCqStKsADxvOKQ/fJvtoZG9?=
 =?us-ascii?Q?nLqdQsLft2HJqVB+pjTl4pNU/TBb3GVYGRsedQ/EyZo3sg5X3zzTQ4ubSbG6?=
 =?us-ascii?Q?LJFDONt5X3kT5tqsS56CUFAPWB6DDjOyOAVLP/dQ+zH8bZTNjINbs9PlXutU?=
 =?us-ascii?Q?BnZnqRLUKG/s01Dn8j6f+rAs3Yjy?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8465e7-6639-43ec-0e86-08d960d4e68d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:42:56.8292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZvnPMdum1+EnrJXOHbPYsiSt+sF8+o1MaNC9H4Zau3y/M8lji49pfJ0OlIfh2y9lvNuM6j63tIdaD/km4edzdOsm3SmCKHU6+OY2oF/wCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-ORIG-GUID: YJicBTfLWVRwpKWVZL02A1fwAXrmG_d9
X-Proofpoint-GUID: YJicBTfLWVRwpKWVZL02A1fwAXrmG_d9
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

New class for vfio-user with its class and instance
constructors and destructors, and its pci ops.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h |  9 ++++++
 hw/vfio/pci.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index bbc78aaeb3..08ac6475a4 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -187,6 +187,15 @@ struct VFIOKernPCIDevice {
     VFIOPCIDevice device;
 };
 
+#define TYPE_VFIO_USER_PCI "vfio-user-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
+
+struct VFIOUserPCIDevice {
+    VFIOPCIDevice device;
+    char *sock_name;
+    bool secure_dma; /* disable shared mem for DMA */
+};
+
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
 {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index bea95efc33..d642aafb7f 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3326,3 +3326,89 @@ static void register_vfio_pci_dev_type(void)
 }
 
 type_init(register_vfio_pci_dev_type)
+
+
+/*
+ * vfio-user routines.
+ */
+
+/*
+ * Emulated devices don't use host hot reset
+ */
+static int vfio_user_pci_no_reset(VFIODevice *vbasedev)
+{
+    error_printf("vfio-user - no hot reset\n");
+    return 0;
+}
+
+static void vfio_user_pci_not_needed(VFIODevice *vbasedev)
+{
+    vbasedev->needs_reset = false;
+}
+
+static VFIODeviceOps vfio_user_pci_ops = {
+    .vfio_compute_needs_reset = vfio_user_pci_not_needed,
+    .vfio_hot_reset_multi = vfio_user_pci_no_reset,
+    .vfio_eoi = vfio_intx_eoi,
+    .vfio_get_object = vfio_pci_get_object,
+    .vfio_save_config = vfio_pci_save_config,
+    .vfio_load_config = vfio_pci_load_config,
+};
+
+static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
+{
+    ERRP_GUARD();
+    VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    if (!udev->sock_name) {
+        error_setg(errp, "No socket specified");
+        error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
+        return;
+    }
+
+    vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
+    vbasedev->dev = DEVICE(vdev);
+    vbasedev->fd = -1;
+    vbasedev->type = VFIO_DEVICE_TYPE_PCI;
+    vbasedev->no_mmap = false;
+    vbasedev->ops = &vfio_user_pci_ops;
+
+}
+
+static void vfio_user_instance_finalize(Object *obj)
+{
+}
+
+static Property vfio_user_pci_dev_properties[] = {
+    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vfio_user_pci_dev_properties);
+    dc->desc = "VFIO over socket PCI device assignment";
+    pdc->realize = vfio_user_pci_realize;
+}
+
+static const TypeInfo vfio_user_pci_dev_info = {
+    .name = TYPE_VFIO_USER_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOUserPCIDevice),
+    .class_init = vfio_user_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_user_instance_finalize,
+};
+
+static void register_vfio_user_dev_type(void)
+{
+    type_register_static(&vfio_user_pci_dev_info);
+}
+
+type_init(register_vfio_user_dev_type)
-- 
2.25.1



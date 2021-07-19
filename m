Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8563CCDF7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:32:55 +0200 (CEST)
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mpi-0004KO-2d
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlH-00048H-0F
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlB-0002Go-5A
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:18 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GFh2024198; Mon, 19 Jul 2021 06:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=gQwXSGT1VJgRsGfyEUhNRTVltwlYSVVa2oUvkt+arFs=;
 b=eRX+qzupr3GexcRniNcUrLqSZGZCIZDNL6iCht3kr1JJtqZOnVgXbg2dfJeQD4nBH3Jz
 pObrH2KbVpHcoUnUTlTdrGMSQkcuEHetHclcjW40imI7Sz8Iq4SsHorrN1bDWHBRK1ni
 jPrRtXTwXgmWA/st8ss4aLSxKy8ODnFgPJ3Q30QeyBomoxGnVeIZxL7D3yB9wLnOVIjn
 KDyQ7l1YTwFc2utAnZCAaLfV2nAeWOzMxcPo+HW4mpo09V9ULe2SA4TsC88JWKDpu4v1
 cr5OrvtPAlbB8bdf23dsXNJuAHf/mXArq594S8Jiais1F8Wi9Vm5k+fNG+ltEHn1W2k2 kQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=gQwXSGT1VJgRsGfyEUhNRTVltwlYSVVa2oUvkt+arFs=;
 b=tpQvSHf+vpTgKMvRZ7jwnfobnnliYr7uTSG9HYsrZ6sXL/FywAn8Aeqkmnsxon6M9qlW
 rK/IzkHvQNGRDpKUaRSzJ0m46Z8sqoVkEaLoceupeov+knA384v8loWKVSgug6tXp2YB
 U6EfzkKqL4MjQVUD7v/VR5b37kOdhdyVyVXS+CTJjWbn6macdknBcpfI2Yp7g4Lz4ZiW
 1GvHp4Ha/9Ed1FTgJcqwIlltsBs9HhOIs97yE/PvAN0UDpUn+FFyfRkDVFAq17oL/ENl
 kr5h3JPRQVZ3gX2kZsaCaJU7eYd/CibvfNtyeoYBCidfAG8qPFWLXesYRCN/DxNgACAY dw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vqm98mmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9T5086873;
 Mon, 19 Jul 2021 06:28:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJoj19h4SX3EUzE0ivsd0sEXnHFo0kl3Dc8s+0XyK78yaxLlyb4tNyc+gbav6MYRsgi3YEKyGtJa8TIfqGT+x6mnxCvtzIknyx3WLP5arqByCo3oyYDCI/DiysDR6igphKZbiaDIyb3N6M46YW3xOK/u16gq86W0Pc5XVpTJSqt2/2XE8JHJoAev7kC7yhXeZIqPckCJWr5isMlljnPi79w7PIsvka0bVpm/XoIdNrX6eRyC6h5vS5CEwofh4BQVIhQ/PBjpGY0TxuEddl7TOIp70v6QVC9x1DPCPiV3h34ZxxsjU3jVcepARSaTaWRoJLvaJRy3OdT6wHl0QchRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQwXSGT1VJgRsGfyEUhNRTVltwlYSVVa2oUvkt+arFs=;
 b=XVH4mvSQxXshA11L7LLSE7NaBC+juzNHh4yvDMDLfGBZocf7ay10LM5swElFPYdDIXqMogRrUwWLxI1UgfYTmdJBeLjaZHGV98LbqPZTJdBSNGBk5hvdF4INJyOYIjYhMDFQOsZVtUxrM6l9AHn3SbzWylWmV/V+BrwZ9FV6JOsM/1wSY9G7NCiFwMWRZpKJgLn+DNIW8P6JVGtBML4SRMPMIf4xwfV+cPi5kDjKyZfflYcKQUQ/CCTX4TIc3RevbuCKcZk8TJh1bdsjQG5OpZ42v6lfip6Jy1CFHzvvTHiP7zXHvHJ09qBM78s5j6HMSmhyNooz8KtGR0J6ttLwgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQwXSGT1VJgRsGfyEUhNRTVltwlYSVVa2oUvkt+arFs=;
 b=r6UoflilAW6Orec1EX0JqDgwOWgTnz3b6Ygfdgwf1H4gWvjOAC7ttH0d+C2jNlgdf2jcdpb5TyxmpLvBo+73GptrRDJcDruTpIOSHfI+89P3RkGAgm3n5x2rJnXm8PBTonraHaDOq3smTJB7exSnq7Lq4OEacie4IFT8R/6yQjg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:07 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:07 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 06/19] vfio-user: negotiate protocol with remote server
Date: Sun, 18 Jul 2021 23:27:45 -0700
Message-Id: <6113d0ffcca09a2d3c74abed63871a53ab583693.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f31ec901-10e5-40e3-b41f-08d94a7e5f17
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4814BCA358A15660FAD0F39E8CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1V1cfRlzeawja4Rd+7GNQ84+HeG8QPaz540duZoZXgKGoyf/LiEZCcwdsFULlFeDDnMkfFHccvBIcuzfSFViKgFYy7Eu5AoQGdj07/fv6ylcRNLgMWcN7mqNZgnpyJ2I/6w01mjrGmmy/kelDTPm2oGCnvCywoWfEh7rXSk/N4c9s4AcxpPTmyDpqOASfrZJNaLJLc6Hg8ZeRyuej83UNDRmvcEWSPdQ6DEVPsDzyM+yNTPoNZaR0+K3/VI7FKdxe+lOppxFpK59y1d81SQx5yH6VE6PALg4IV0LKRH4jYDt1me5h9NrwAWKVdteYvP541Txu4MLiM2y3EyvPcId1t+7rKM3iSDv1FadSDlpa5cOPdTkwWDgMFGmAIv8mZibXHjfVj487aDcgBO3Vi08VpOkL1QHZ6JO7Vy3YARNgKYSppVFj3FrC7IwBJIX7GtBLjLJJl5xMuvQx/e85ZmEbRmUXhIGf2qbBM4LFyUwgfK8BQ6waRO9IPdDG7s964ScqiAuNJ3sxURlAUIWlv6ymgSEKPCBWLpW7wmS8aflvhHkL0Pc054oayFZtX5+LZxIXHZ6qplvWEH6sXNMeDEaEWBjHqjYXfTUNJ2Z+8AFx6p5Atvx/uMtyc3/ETyfJFROdr3Al/QZa3ijdhDB4gekjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tSGLbtB9HwPdrFqP8wl+V2L0frrQxKZmQFE3AZQR7fDv3ks68pxIc4tSd24G?=
 =?us-ascii?Q?Rs+10SA7s2WO8F1wfV2csVQuW6GGC6m1tArpIgsEU07X+8KXuwSYiw4Scn5A?=
 =?us-ascii?Q?Ug6PlKtfDFb3XU1S+GWiKeyqGsAotRex6m9ZwLnIFo12fK6X81lCdjL/Lgy6?=
 =?us-ascii?Q?Is0wQLgupa5nU7jCIdr6W09isbO1w9qbqBV+K4yxa7/QVUdciOXLSzyeJzha?=
 =?us-ascii?Q?YKl4e3qfGjI5JZ6jSyy3Bn7oydsTzaJEESkHbry2rnyIySmCrRdoEYdv/Q7Y?=
 =?us-ascii?Q?f+jI0u2vRFg3tAb9RXN0eFX5+Gp3cZuKaiA6lA/5rBKaPnjfktUhtYUxxWXB?=
 =?us-ascii?Q?mDtUPyJmKiQoQTJAv5RHq8jSdNCTayb4054H64h7MMqml/w3+OVnjuTMA324?=
 =?us-ascii?Q?8DvynfxWtJTbr1VujKkZX17Lx2RAR8Dzwn/RMSHl/sNQvJVss2x4AtmaYFP0?=
 =?us-ascii?Q?J1n2XxTqtDWA6cwNotLJKJn12IqBqbLVh5R4AE/3t6QsIdkb0sci8qZhhezB?=
 =?us-ascii?Q?gBTAchJh+UbuxlhUGYI+qAx7SSg6uPjEi1Dm12ypx3qgRMDH9ABO+4rPFJD5?=
 =?us-ascii?Q?LB+PdyrtSc8uG4UpBwA/31SmN5yka2RkPEn35fh0YQiYByxeXDiP1qO+4PZo?=
 =?us-ascii?Q?ESIRyWK0H2TgtBFoKgwPbT4abl8K1YMXc5ugmcTnQaBowznzYn/89j0AO3QS?=
 =?us-ascii?Q?bDXgxR0YYsDL/vXovEo10pNtVUP1SiXaksSuoEkMUrljSE13w43T3BIN3ron?=
 =?us-ascii?Q?bVMhyEUDNoVxtiJCmmMRBc/ezDylKSivXgyQPDS2wSHjVbVhSacOMBdRPkkd?=
 =?us-ascii?Q?QoHRCgYbSW/btr+fhM7m3uTEb43Ckvixj4BI3NOHzR1QQqYdVWGub8bqSxdf?=
 =?us-ascii?Q?wt40iWY3xB6YK7uQ4aVmAKOSLTg4g2zKeBZDtb9jwZwbUaMqXsF1sitrpVmD?=
 =?us-ascii?Q?coqCEphqqhtqxMCBdZlU9ID2X9Zq42JYpZw5LZypXFu8nPgsoPixxy81w9HM?=
 =?us-ascii?Q?zSmUawyN9CFGL6R6EoHDlHqT0zEXdLJpaV810voHRjOgoKIlR7DgRl8HLV3s?=
 =?us-ascii?Q?Zsgd232HuMwCJ5NryzZRzUSBoidukLdjMwakNQH9Kawckc0+Ni/uCGB2OFMk?=
 =?us-ascii?Q?vF2xuoTowt11iD/l5q6dJWtnFwFUe5zAComTfI6U0jp741grqTyHIE72FXuu?=
 =?us-ascii?Q?lcLqQN24vxyEiiDBWWPdHZDSm32vkHr7nVyZhlwQClmTm3zJrBusFBbNC/e+?=
 =?us-ascii?Q?b8KZQlwmvkxDanw767AAzfB5fzw/mK4AraIqp7P+oAahI2P7nQIvOylE+y0z?=
 =?us-ascii?Q?hyJ5iqRyQXRgKlzmliw04dpYdgAHKY35noc7szLHd8L0orWi+i9uB+yxA41I?=
 =?us-ascii?Q?grYd60bXhQiDJT5vrg9QuQ5SQFLh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31ec901-10e5-40e3-b41f-08d94a7e5f17
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:07.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv8AUS2T8EyJfFpu9ljDkp9tTTH1GT1R9dm6cmbAceaQ3R930Dxgyxnq5sJ35arATPu0BbR5YTC5kzHTE8/VVNlKlWpTAL5ze3BJ5IKemS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-GUID: H169o8KRJ-dAOaucWeuVKGVmR1AhVtNd
X-Proofpoint-ORIG-GUID: H169o8KRJ-dAOaucWeuVKGVmR1AhVtNd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Send version and capabilities and validate reply.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/user.h |   8 ++
 hw/vfio/pci.c  |  10 +++
 hw/vfio/user.c | 223 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 241 insertions(+)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 12106ccb6a..844496ef82 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -64,6 +64,13 @@ struct vfio_user_version {
     char capabilities[];
 };
 
+
+#define VFIO_USER_CAP           "capabilities"
+
+/* "capabilities" members */
+#define VFIO_USER_CAP_MAX_FDS   "max_msg_fds"
+#define VFIO_USER_CAP_MAX_XFER  "max_data_xfer_size"
+
 #define VFIO_USER_DEF_MAX_FDS   8
 #define VFIO_USER_MAX_MAX_FDS   16
 
@@ -119,4 +126,5 @@ void vfio_user_recv(void *opaque);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
+int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1effdcd5c0..8ca1431cca 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3348,6 +3348,16 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         return;
     }
     vbasedev->proxy = proxy;
+
+    vfio_user_validate_version(vbasedev, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        goto error;
+    }
+    return;
+
+ error:
+    error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
 
 static void vfio_user_instance_finalize(Object *obj)
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 371ee9cd8b..24dd45b55d 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -22,15 +22,25 @@
 #include "io/channel.h"
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
 static IOThread *vfio_user_iothread;
 static void vfio_user_send_locked(VFIOProxy *proxy, vfio_user_hdr_t *msg,
                                   VFIOUserFDs *fds);
 static void vfio_user_send(VFIOProxy *proxy, vfio_user_hdr_t *msg,
                            VFIOUserFDs *fds);
 static void vfio_user_shutdown(VFIOProxy *proxy);
+static void vfio_user_request_msg(vfio_user_hdr_t *hdr, uint16_t cmd,
+                                  uint32_t size, uint32_t flags);
+static void vfio_user_send_recv(VFIOProxy *proxy, vfio_user_hdr_t *msg,
+                                VFIOUserFDs *fds, int rsize);
 
 static void vfio_user_shutdown(VFIOProxy *proxy)
 {
@@ -40,6 +50,72 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
                                    NULL, NULL, NULL);
 }
 
+static void vfio_user_request_msg(vfio_user_hdr_t *hdr, uint16_t cmd,
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
+static int wait_time = 1000;   /* wait 1 sec for replies */
+
+static void vfio_user_send_recv(VFIOProxy *proxy, vfio_user_hdr_t *msg,
+                                VFIOUserFDs *fds, int rsize)
+{
+    VFIOUserReply *reply;
+    bool iolock = qemu_mutex_iothread_locked();
+
+    if (msg->flags & VFIO_USER_NO_REPLY) {
+        error_printf("vfio_user_send_recv on async message\n");
+        return;
+    }
+
+    /*
+     * We will block later, so use a per-proxy lock and let
+     * the iothreads run while we sleep.
+     */
+    if (iolock) {
+        qemu_mutex_unlock_iothread();
+    }
+    qemu_mutex_lock(&proxy->lock);
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
+    if ((msg->flags & VFIO_USER_ERROR) == 0) {
+        while (reply->complete == 0) {
+            if (!qemu_cond_timedwait(&reply->cv, &proxy->lock, wait_time)) {
+                msg->flags |= VFIO_USER_ERROR;
+                msg->error_reply = ETIMEDOUT;
+                break;
+            }
+        }
+    }
+
+    QTAILQ_INSERT_HEAD(&proxy->free, reply, next);
+    qemu_mutex_unlock(&proxy->lock);
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
+
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret)
 {
     vfio_user_hdr_t *hdr = (vfio_user_hdr_t *)buf;
@@ -285,6 +361,153 @@ static void vfio_user_send(VFIOProxy *proxy, vfio_user_hdr_t *msg,
     }
 }
 
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
+static struct cap_entry caps_cap[] = {
+    { VFIO_USER_CAP_MAX_FDS, check_max_fds },
+    { VFIO_USER_CAP_MAX_XFER, check_max_xfer },
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
+    GString *str;
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
+    g_autofree struct vfio_user_version *msgp;
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
+    vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, NULL, 0);
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
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
-- 
2.25.1



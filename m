Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB854AD459
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:08:26 +0100 (CET)
Received: from localhost ([::1]:42580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMU4-0001IZ-NK
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:08:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpt-0001xl-KE
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:49 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:50470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpn-0001vq-CP
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:49 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2186dmko012748; 
 Tue, 8 Feb 2022 07:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=PcgQUwvWl+PJG5TKIWJbzjrGqej2468YU/0cDbJ4ZYc=;
 b=nOVgXYXj5+bQu1rrcNMDxUIfu9aAYHygNbtdhYZ0ml2BkALuQoSTbqm3D0UbL6ic/RRV
 pB0UMrQA/eIJaTcHLbrmFmb27Ry978d5oLEMp6vA2hZ1q/3rjr7uylOXPV5QQlaxMng1
 mTugzQbHxzcn1sZEH/oFb4zJHxQx4pALDjB3paH2AkQvI6y3j4UNckOXhPSvYtfP0g2l
 U+ijI7kMjvz6iXrElOd7xDqJjNii7sjMnhtFer5vTZyqEeQtQEJQ5y1/YS/J1522U6Zi
 J34QP8pDGYYucd4Wyn2AxSYT9pLZukNOCABO7mI8FW+kHFvtDWOHVTKmpos4uWklPi36 WA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3fpggk4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BlYw093365;
 Tue, 8 Feb 2022 07:22:39 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3e1ebykknc-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2Sjt4OyMdek5txKTLoAyevjHDN9L5hydD75YfiEnXTL906aWMwgU03LWppEQUgzufcj40xhKAlE3RwVtncaADZidaDBMF8Ll2P8r48EroXZqviVM3AQySpPZlpb+3ht6F8PCgi42pnDwwGYQsjGi/nNAUxO/j/+wnT+EhSwEqDtMuhixoeqnqkEwIwYqNIQbqRYkLx/JE4XigXWysLbGxlxyp7JWfKXIAs8QZXAmtKlS9PKEdT83NhCrN9Ziu40X6mYpfHwiREOW/3UUMnGAE50p6bKp5/bLhMg6YcTKxgoM+k+M2+hmlcDhHw8r8avq7qc3RFz1IAdOqBF4blC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcgQUwvWl+PJG5TKIWJbzjrGqej2468YU/0cDbJ4ZYc=;
 b=ALKyt7TYAl0sz02gdH3h6RM7LtwCzIy4JKHtHxU7evvP8Nn15I2Xx9UfZ4UpJab1r0zUfOgWVYTKN2mtIZ1T/SjgfRvFZFiyBLPcabvx3iZNnf366it6mn/8WHaiC1MPpFqUJK4hbrnqfw9KElyB/L2YOG81Mxf7L8S6auI0IfQNULqjvB7N0y1lqagyG6wt3mQmUZIl39Ig7q7KbLDuWLmWO1Qw4dh8eRkurWG/6rjjSgH1CV4za+KLdokqUsilYAxk8vTUmSsNHVjcfb5SqehvaGM4WvBVu2UaiiqgO/4j9XHdkAvn/IHZAmEX1R0Z2ixK4ThXVs9cDt03X7s5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcgQUwvWl+PJG5TKIWJbzjrGqej2468YU/0cDbJ4ZYc=;
 b=V7/apou4o923evNsuSqH631nPmGEhQv5RUKpVLE6tJRVTX06+ikCR9oRih4MtV609M1KtOoThmPempwMtFHrYLxQWsJVT8zvB5ZZYQuV0jW8ONJyWQgfQ2PxDjgjm87ZhOCJmIMTMcJ0s9TDUzHrkWzxaZqYOXdULHYDqiFds8g=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:22:36 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:22:36 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 8/8] multiprocess: handle ioregionfd commands
Date: Mon,  7 Feb 2022 23:22:22 -0800
Message-Id: <2b891256b5c6ded52810ce3f25c923e9c593cea2.1644302411.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644302411.git.elena.ufimtseva@oracle.com>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 190f01f2-716b-4ede-56f2-08d9ead3c7f9
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB560857D61CE1C25CF38197778C2D9@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cKlke09z0KCzAUVvZeVsWQXv+RFbZNwmsUDPsm5W40HODp8IVBXujHlUuPTfN1U3Z1rzNjqTOuRlhuBu4Rjt/ylSW4Iu4cl57GBXxoOdEK6t1evE4XAvIph6zIa/TxzXlGCDZYdLUKNZGzB2Pe2++bZqqqFkzDlNPlMO96qoM9EaAG4Khilc4PglKcyip5FOy+r9VqbX/IRLeHDJVfoA2iVyQ59ppRA0PyKeaN622Dmig20v0fClYnvuMK5gOumRYID3GJnlU7e+1szH68zRKmcj2Tm0xkOcRRrUfUZvuICruOUzIVylgoDibIHlmqOgH5KDvMYAiwanOK9X2evECA5a6fANhy/PpFDaRp9i84Y3/12niRzrcyRDp9E3/x/E6Fhae2FH6qBW7qQsY2ohxUJfqR6uK0M0WNm1+GMb3KEqo8LyqA3ZGzaAqPpQw6k7ENshJsXnSxoOrlnmLWI2T5PcG3Z60Tte+ci2hc4Mp9ncFiH2YbF93g3DmUjoAZpn5eYYaGsQGqYbMNghpjYNx68yBc7cagJp562Xjywyh1ldX6Z3oAuLrq4Ah2uYFlxkk4U7PSwyybQEdPpaqk3z8BX4tAFzqQBOIpi84FMTRjY2J4ThOdlaLLQXb2VuZS4b0iBxSI5ggT9c/k3S6goVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(36756003)(83380400001)(186003)(38100700002)(86362001)(5660300002)(7416002)(2616005)(6486002)(44832011)(508600001)(6666004)(8676002)(4326008)(52116002)(2906002)(66946007)(66476007)(6506007)(66556008)(6916009)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z5TAPynmb7AYU3AQU+qAL0/gCvdERjL3WJW/KHPIBzBZ3TJaSRKAHqaSwd2r?=
 =?us-ascii?Q?1wxLUXugIR3fkMaCJct0jCi89IhvxYk+Aufs+U52u1Uu7rV6JPz/a91BJWIs?=
 =?us-ascii?Q?G2jhvVebBwdtvyrju7MquF1zWImtjlW4B/qAv1LvaeO1B+EleH+smQOW4gOp?=
 =?us-ascii?Q?/pyMaVmG1gl0FYtaWaiaCXEWlesWP+pxMY2lpmia7zEV3oJ9+Dl3RPos2Pln?=
 =?us-ascii?Q?J7EQVvK3HageuO9MNYwnUEyPTNJV++sS3xcqM6OsQEWQMGeV8VXW2d8fMNRM?=
 =?us-ascii?Q?wiMUp8G6saQePOhn2ZHmol5uWvyzRO3FNIz6QUKcvo0TP9BfIVOI6keqiZwm?=
 =?us-ascii?Q?8RK2bDbHD2J+PRWL7Lgq1lmQEg0NeIRpTF2IjeAs7Zpi1SyfPdOiu1WvSYzn?=
 =?us-ascii?Q?l3xXF3V6FED3qtSusD2vbScUk7xjBdRrg8e4jl3I2dwt+tCL8SDzdVh5tNW7?=
 =?us-ascii?Q?O2wPQV2JUI9q+MkIX76RJ2Er9O2ERvOnyFeqwJU8BsLlR1urpOJi7FFjI9kI?=
 =?us-ascii?Q?WMEcWR4aQCluyy+V/fh5SEbJhOZ0fyZTtd/wyQ/NioZWc7fHC/Ey5r6+QOUj?=
 =?us-ascii?Q?jfaxc2t3qKgxYs6lCQ/rs/uG3mQa0uwUe5i/xqUHMLl8RrsWmq8rohlsxlAC?=
 =?us-ascii?Q?ONJreedGTpoauclibQs291CH8NXcYZH7fZZs8TDdYYCCvaypUV+rSvxN5GQ3?=
 =?us-ascii?Q?pqTWPTFFn0BhA3ZZOv79xyx5Hl1KK4CeRPBrdEuswf58JWS5ouvDFqg77cum?=
 =?us-ascii?Q?6DvA+HF/pGhhChKQKTwPejdmANPPo7WpgPKLNsqefL+ExFDZSOnfy1i/gl+I?=
 =?us-ascii?Q?/BTepC6C9qBrY3Scwq5lh6Y4RgIemAIgAXmFb+6OrtknSuw65OEl4ve2+COf?=
 =?us-ascii?Q?G3qN4XwUDEKgxzZEgzgitE5LxRw3N4PlfJwXatJbowtGru6nDTNQ3gXjykOt?=
 =?us-ascii?Q?KrSR1UP8VeeqECOiq+cPrcu5NMuutP84CXw5kRY69egKOoqizKk1pPPgSlq4?=
 =?us-ascii?Q?jUQjBcULRToAb4ZYYc3QHRQjI2Z6QptgSOWQw8MyoAv5e97594puOC6ntrR5?=
 =?us-ascii?Q?uW+pp+aMIW8gXpB7CoICjgZvauTDjTuMJUEaebDZk78qcDmT2O0zf4akF52O?=
 =?us-ascii?Q?rqLHxHQDDFCG4OJPtFWQEeN1pT/uRACYzpZ0hVxVs1EC935Ks2qGLAJgYxpT?=
 =?us-ascii?Q?rLRbASRRG23htTkXNaaBcg9FySRt7W9H09X9ieyXtJ0Mk8Ufn7PLWD+nHyoX?=
 =?us-ascii?Q?8DPNlZPZX9EXNg1fOOsvipbUSG4pGR9ipZxidvWhMzTIluwu/uW4A42kQmdH?=
 =?us-ascii?Q?ic0Hnlgmlkic9f63GRoyzj3o4RtQKhQvWa1aqcIrUNPipHPF4JoimR/LpwZK?=
 =?us-ascii?Q?sOZxwcXo29do+NOtV5RfQug6pOXzP13WksDfCNapyYplYQHNavu/tzo0XmXj?=
 =?us-ascii?Q?yo4m4or/vGWcg8BxR1fkSkkpQbrhRS+srvST/CBl3mX+iU+OjoWh/kXdX7Kx?=
 =?us-ascii?Q?IJTxTTI6kpYZiaqX0G+CwsT9tCY/kbwmlBNKK2L/hVO4tit6yeMydI19JPpE?=
 =?us-ascii?Q?bIj58j2PMwnKMWOh9KCQx7wZ/xrUAUwoINOq8IRvY/zLsGL7M9+O4lLa3wmE?=
 =?us-ascii?Q?WhT8x8Tut1gQHF6139QeOBrGBrL2PsR3OVOl/FPmd0bwwv3qsbAtGecVmVT+?=
 =?us-ascii?Q?ipOUO3iOe9PpqanFM+L9fGWosY7IiDIlPGrqBqEayIj4QhL/knp3sJTLngxY?=
 =?us-ascii?Q?TS0Fy87Z+Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190f01f2-716b-4ede-56f2-08d9ead3c7f9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:22:36.4735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ur1UnNmCkFmMaYJxRBkdvpgMGW7nGD6sjAXtTwHrS9dPp+xeDUhI8EzlLUz6zaImJT3ix6S5GV2KCSQiYfi9X36Ys0HOl6RiFBfR8gTEG4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-GUID: jm7MNHC1WTFtVX41658yvczAmbDVe0JS
X-Proofpoint-ORIG-GUID: jm7MNHC1WTFtVX41658yvczAmbDVe0JS
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, armbru@redhat.com, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 include/hw/remote/ioregionfd.h |   2 +
 include/hw/remote/remote.h     |   2 +
 linux-headers/ioregionfd.h     |  30 +++++++++
 hw/remote/ioregionfd.c         | 111 +++++++++++++++++++++++++++++++++
 hw/remote/remote-obj.c         |  44 +++++++++++++
 5 files changed, 189 insertions(+)
 create mode 100644 linux-headers/ioregionfd.h

diff --git a/include/hw/remote/ioregionfd.h b/include/hw/remote/ioregionfd.h
index 66bb459f76..8021eed6f1 100644
--- a/include/hw/remote/ioregionfd.h
+++ b/include/hw/remote/ioregionfd.h
@@ -40,4 +40,6 @@ typedef struct IORegionFDObject IORegionFDObject;
 GSList *ioregionfd_get_obj_list(void);
 IORegionFD *ioregionfd_get_by_bar(GSList *list, uint32_t bar);
 void ioregionfd_set_bar_type(GSList *list, uint32_t bar, bool memory);
+int qio_channel_ioregionfd_read(QIOChannel *ioc, gpointer opaque,
+                                Error **errp);
 #endif /* IOREGIONFD_H */
diff --git a/include/hw/remote/remote.h b/include/hw/remote/remote.h
index 46390c7934..53b570e1ac 100644
--- a/include/hw/remote/remote.h
+++ b/include/hw/remote/remote.h
@@ -23,6 +23,8 @@ struct RemoteObject {
 
     DeviceState *dev;
     DeviceListener listener;
+    QIOChannel *ioregfd_ioc;
+    AioContext *ioregfd_ctx;
     GHashTable *ioregionfd_hash;
 };
 
diff --git a/linux-headers/ioregionfd.h b/linux-headers/ioregionfd.h
new file mode 100644
index 0000000000..58f9b5ba61
--- /dev/null
+++ b/linux-headers/ioregionfd.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: ((GPL-2.0-only WITH Linux-syscall-note) OR BSD-3-Clause) */
+#ifndef _UAPI_LINUX_IOREGION_H
+#define _UAPI_LINUX_IOREGION_H
+
+/* Wire protocol */
+
+struct ioregionfd_cmd {
+	__u8 cmd;
+	__u8 size_exponent : 4;
+	__u8 resp : 1;
+	__u8 padding[6];
+	__u64 user_data;
+	__u64 offset;
+	__u64 data;
+};
+
+struct ioregionfd_resp {
+	__u64 data;
+	__u8 pad[24];
+};
+
+#define IOREGIONFD_CMD_READ    0
+#define IOREGIONFD_CMD_WRITE   1
+
+#define IOREGIONFD_SIZE_8BIT   0
+#define IOREGIONFD_SIZE_16BIT  1
+#define IOREGIONFD_SIZE_32BIT  2
+#define IOREGIONFD_SIZE_64BIT  3
+
+#endif
diff --git a/hw/remote/ioregionfd.c b/hw/remote/ioregionfd.c
index 1d371357c6..dd04c39e25 100644
--- a/hw/remote/ioregionfd.c
+++ b/hw/remote/ioregionfd.c
@@ -26,6 +26,7 @@
 #include "hw/pci/pci.h"
 #include "qapi/qapi-visit-qom.h"
 #include "hw/remote/remote.h"
+#include "ioregionfd.h"
 
 #define TYPE_IOREGIONFD_OBJECT "ioregionfd-object"
 OBJECT_DECLARE_TYPE(IORegionFDObject, IORegionFDObjectClass, IOREGIONFD_OBJECT)
@@ -91,6 +92,116 @@ void ioregionfd_set_bar_type(GSList *list, uint32_t bar, bool memory)
     }
 }
 
+int qio_channel_ioregionfd_read(QIOChannel *ioc, gpointer opaque,
+                                Error **errp)
+{
+    struct RemoteObject *o = (struct RemoteObject *)opaque;
+    struct ioregionfd_cmd cmd = {};
+    struct iovec iov = {
+        .iov_base = &cmd,
+        .iov_len = sizeof(struct ioregionfd_cmd),
+    };
+    IORegionFDObject *ioregfd_obj;
+    PCIDevice *pci_dev;
+    hwaddr addr;
+    struct ioregionfd_resp resp = {};
+    int bar = 0;
+    Error *local_err = NULL;
+    uint64_t val = UINT64_MAX;
+    AddressSpace *as;
+    int ret = -EINVAL;
+
+    ERRP_GUARD();
+
+    if (!ioc) {
+        return -EINVAL;
+    }
+    ret = qio_channel_readv_full(ioc, &iov, 1, NULL, 0, &local_err);
+
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
+        return -EINVAL;
+    }
+
+    if (ret <= 0) {
+        /* read error or other side closed connection */
+        if (local_err) {
+            error_report_err(local_err);
+        }
+        error_setg(errp, "ioregionfd receive error");
+        return -EINVAL;
+    }
+
+    bar = cmd.user_data;
+    pci_dev = PCI_DEVICE(o->dev);
+    addr = (hwaddr)(pci_get_bar_addr(pci_dev, bar) + cmd.offset);
+    IORegionFDObject key = {.ioregfd = {.bar = bar} };
+    ioregfd_obj = g_hash_table_lookup(o->ioregionfd_hash, &key);
+
+    if (!ioregfd_obj) {
+        error_setg(errp, "Could not find IORegionFDObject");
+        return -EINVAL;
+    }
+    if (ioregfd_obj->ioregfd.memory) {
+        as = &address_space_memory;
+    } else {
+        as = &address_space_io;
+    }
+
+    if (ret > 0 && pci_dev) {
+        switch (cmd.cmd) {
+        case IOREGIONFD_CMD_READ:
+            ret = address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
+                                   (void *)&val, 1 << cmd.size_exponent,
+                                   false);
+            if (ret != MEMTX_OK) {
+                ret = -EINVAL;
+                error_setg(errp, "Bad address %"PRIx64" in mem read", addr);
+                val = UINT64_MAX;
+            }
+
+            memset(&resp, 0, sizeof(resp));
+            resp.data = val;
+            if (qio_channel_write_all(ioc, (char *)&resp, sizeof(resp),
+                                      &local_err)) {
+                error_propagate(errp, local_err);
+                goto fatal;
+            }
+            break;
+        case IOREGIONFD_CMD_WRITE:
+            ret = address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
+                                   (void *)&cmd.data, 1 << cmd.size_exponent,
+                                   true);
+            if (ret != MEMTX_OK) {
+                error_setg(errp, "Bad address %"PRIx64" for mem write", addr);
+                val = UINT64_MAX;
+            }
+
+            if (cmd.resp) {
+                memset(&resp, 0, sizeof(resp));
+                if (ret != MEMTX_OK) {
+                    resp.data = UINT64_MAX;
+                    ret = -EINVAL;
+                } else {
+                    resp.data = cmd.data;
+                }
+                if (qio_channel_write_all(ioc, (char *)&resp, sizeof(resp),
+                                          &local_err)) {
+                    error_propagate(errp, local_err);
+                    goto fatal;
+                }
+            }
+            break;
+        default:
+            error_setg(errp, "Unknown ioregionfd command from kvm");
+            break;
+        }
+    }
+    return ret;
+
+ fatal:
+    return -EINVAL;
+}
+
 static void ioregionfd_object_init(Object *obj)
 {
     IORegionFDObjectClass *k = IOREGIONFD_OBJECT_GET_CLASS(obj);
diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
index 46c2e2a5bd..2b005eab40 100644
--- a/hw/remote/remote-obj.c
+++ b/hw/remote/remote-obj.c
@@ -11,6 +11,7 @@
 #include "qemu-common.h"
 
 #include "qemu/error-report.h"
+#include "sysemu/iothread.h"
 #include "qemu/notify.h"
 #include "qom/object_interfaces.h"
 #include "hw/qdev-core.h"
@@ -78,6 +79,16 @@ static void remote_object_unrealize_listener(DeviceListener *listener,
     }
 }
 
+static IOThread *ioregionfd_iot;
+
+static void ioregion_read(void *opaque)
+{
+    struct RemoteObject *o = opaque;
+    Error *local_error = NULL;
+
+    qio_channel_ioregionfd_read(o->ioregfd_ioc, opaque, &local_error);
+}
+
 static GSList *ioregions_list;
 
 static unsigned int ioregionfd_bar_hash(const void *key)
@@ -104,6 +115,8 @@ static void ioregionfd_prepare_for_dev(RemoteObject *o, PCIDevice *dev)
 {
     IORegionFDObject *ioregfd_obj = NULL;
     GSList *obj_list, *list;
+    QIOChannel *ioc = NULL;
+    Error *local_err = NULL;
 
     list = ioregionfd_get_obj_list();
 
@@ -143,6 +156,30 @@ static void ioregionfd_prepare_for_dev(RemoteObject *o, PCIDevice *dev)
     /* This is default and will be changed when proxy requests region info. */
     ioregfd_obj->ioregfd.memory = true;
 
+    ioc = qio_channel_new_fd(ioregfd_obj->ioregfd.fd, &local_err);
+    if (!ioc) {
+        error_prepend(&local_err, "Could not create IOC channel for" \
+                      "ioregionfd fd %d", ioregfd_obj->ioregfd.fd);
+        error_report_err(local_err);
+        goto fatal;
+    }
+    o->ioregfd_ioc = ioc;
+
+    if (ioregionfd_iot == NULL) {
+        ioregionfd_iot = iothread_create("ioregionfd iothread",
+                                       &local_err);
+        if (local_err) {
+            qio_channel_shutdown(o->ioregfd_ioc, QIO_CHANNEL_SHUTDOWN_BOTH,
+                                 NULL);
+            qio_channel_close(o->ioregfd_ioc, NULL);
+            error_report_err(local_err);
+            goto fatal;
+        }
+    }
+    o->ioregfd_ctx = iothread_get_aio_context(ioregionfd_iot);
+    qio_channel_set_aio_fd_handler(o->ioregfd_ioc, o->ioregfd_ctx,
+                                   ioregion_read, NULL, o);
+
     ioregions_list = list;
     return;
 
@@ -238,8 +275,15 @@ static void remote_object_finalize(Object *obj)
 
     k->nr_devs--;
     g_free(o->devid);
+
+    iothread_destroy(ioregionfd_iot);
     /* Free the list of the ioregions. */
     g_slist_foreach(ioregions_list, ioregionfd_release, NULL);
+    if (o->ioregfd_ioc) {
+        qio_channel_shutdown(o->ioregfd_ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        qio_channel_close(o->ioregfd_ioc, NULL);
+    }
+
     g_slist_free(ioregions_list);
     g_hash_table_destroy(o->ioregionfd_hash);
 }
-- 
2.25.1



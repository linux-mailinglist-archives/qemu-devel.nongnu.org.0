Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F534AD390
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:37:23 +0100 (CET)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHM03-0006NN-0N
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:37:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpt-0001xM-93
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:49 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpk-0001vF-St
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:47 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2183uKZp026741; 
 Tue, 8 Feb 2022 07:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=cArrDJ+HuxvseF230tWDHY1+lCkYH+jYAhnBaj1w0Ks=;
 b=RAWKqFnA3gFfSTjeYxBugsoLA2SB42fsbwRLH9pnuELZZCfF9FIzwy0Gza4iE89bi4/b
 xHDk6QwVeBgJ/d9Yf8873qIDL3vKsEkYyrfV++v5Qs0SWNVtXbyjM1ZKL5LdhTnT9tAy
 RIb7EIHp7zYzey0WITTumgAeqiMXYnK6VlQmwZ9cU3l5XY2/94a6onnOYtl3HYIi2gCU
 z25t8WOUEeB4aFMpSNxYm89jznS2j1yeDwTURPESJdwxhEiHPZx+TajWUvwUW2ncyPgM
 W6CqLxsLANxtb/5xrQ0SPZHlTTTwXHnRwDHmW7mRUBOzKxxsbnQjDyvp6Uaq5UOe+Frp aQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3h28ge7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BlYn093365;
 Tue, 8 Feb 2022 07:22:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3e1ebykknc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goq+0qG9rhsKJtJH01YGlC9LbLRLm20TZQjjvRm0C1WGFyiL+bZLj8YWTkNQGK8Gn4eXO4wPpecku4dVMRVhlTMteMQruUKFtpsFjR5IgQWjggw1drzjGYWj6EBifp9z1cl9lG/8wW0YQRxGA3S1TN7AQHvAKMuxH3L4zU+ZGWW9YPIHqDMzL1RiJCUO1ofl9FR3FhpanHfcTFJNm0MQZDNQ8jjlsiTJWikMlAcC1E7HHpFr3LnAZcfTBpIuYUvgbLaXFcdR3Jxc9rQPNzBsv6wyLDf7Y7e/TAwEbwgvno/9k5NyarBJciLUdMg/KpiiY+FpZur2VMO1BpCm1z38iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cArrDJ+HuxvseF230tWDHY1+lCkYH+jYAhnBaj1w0Ks=;
 b=XcjRu3o0g9Y5kXYrC7FIAZ8TJ/Xox+18L5eNjg6NOIL39yBO+V9i474aHa5OHNPI2VihHzSMu2WiMRxLZcAykKX4by/j+vgO4MwFdDOqs4asJpxbBCAccRUC4a0672BT4Qsh9ltbb19AWx9eOHVpLvciV+oR8uKzn4kWIO5WuDhHrI2YjbUZvqKxRy9vMnQfCNnJHYLXAzC7EDYEauseIydvWVXpwd3fY/UoLHx19P4gTDigO3kDCC3ChjpiIa42TttPj1a8QjFkwFnDDcYyXiRnUCFp9aFGP7fJsqf45vwPvK3N7S2PiZxZHImNIpghosebXlvuyqiwdQUoJmr81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cArrDJ+HuxvseF230tWDHY1+lCkYH+jYAhnBaj1w0Ks=;
 b=alAQjQHnrH1zdTMuO05IgicLxzaxHTb/UR8Jwly5Zc42qyZqYoZTxfXdURH1Xj9YEy5yOpP7IFe5+GVIsFu8cz7QaRNejNbXHPrqH/CAEQlFexOALifANJ5t+GbKbmfjxtI3WoON5e+mHzZFERREbUJRUh5WbiardUUChV7YGqo=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:22:30 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:22:30 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/8] ioregionfd: introduce a syscall and memory API
Date: Mon,  7 Feb 2022 23:22:15 -0800
Message-Id: <6001ed71ebe40c88e9d903bf0983884f522b2dea.1644302411.git.elena.ufimtseva@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 00b67e84-db89-421b-7d15-08d9ead3c463
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5608A72B324239D9872404578C2D9@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:166;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: livXpfPaiz4Lhdc3+9BMC+lmBl7GBm9FUHt/uCOqhtt3wy26uxogIcm+o0pRk4a3bR40W4gpYiqOJ92+pNsX2ci+5MkdOuZD+UqJhO+drdVmLNP9uLN0y7ysWBpnf5xuTWgQnfvMM+SmQ3MzMTBbm1u9NVKsXdj71wNfQ7F/zjwzyw5x1z9hFkL0Yf8XY1vmsvwGiLDpI0BvxWEcXFAmcH0xQgj+HrjOiW9Dl1l/lEQUHedCaV1OETyJBn1MqrzVokaHnktaJynhQGprKg9PVLTMtAZ/HJEC336XhjK6gdKytJPagFqQhKr4/I8X4mqQIag/KC0pyU55A3qP93cm/o8oRxIzSHO2amIJIZniLA9ZBsw/yxYDT6DZQ3mdPWQyW62W4oQft6gE/u6mLSkuApoKbXcygI3z9320zUpiZJGT/b2thgkNldIL6Am6AP6V6xCoVj/eP6otTi4qSuC9DxPwpfKBO6KSdmUTr8ntr6wfvIcSN88U68Zx19wtkefQHnOtpbw/EMAOOwspSSetsU8Dcb1xc2AuAGpUz7bds0Ev0A1hraBLeOGjokbX7R+r0JHB6KcSIKUSyzohcYy+W7l6pG+gbfJyvLsavcqrGYCwJ5BUGBHB7I7qjhmODW3HEZ7gK/sG1jjRGef4Yp9GDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(36756003)(83380400001)(186003)(38100700002)(86362001)(5660300002)(7416002)(2616005)(30864003)(6486002)(44832011)(508600001)(6666004)(8676002)(4326008)(52116002)(2906002)(66946007)(66476007)(6506007)(66556008)(6916009)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pdG7PN1ZMq2WNuMPFjh/+cgBaxmD3rU6rDGGuOEFz4j43WwN5mU74DdHOIO?=
 =?us-ascii?Q?wpnGawIcdQ55GwO7Q3y7NeGtrD0dPGQSu4+m/xTVdlwXJAJZcr66qHYsuSqj?=
 =?us-ascii?Q?qpN2d6wHYKlECIQ3KLLCnxJ1evWVxm1YW0W3E77H9DUCLCH+zts61OTjsv5X?=
 =?us-ascii?Q?SuaidMZ52ST3eus+8a8kbLV75apHOJJGW+Vcdbj+tqjOSGV2aGGSVBQCsEf8?=
 =?us-ascii?Q?W3fg6ssH+DioOcs6XCvyxbqyDuONewullJ1qRjjTfsMOS01EluNFJh8jOeUp?=
 =?us-ascii?Q?xBQl/qiMA2coYpgUtJ7xlCsNWWURMzf14cZ/zyK9HgzH9eW2zNFOrEATGF85?=
 =?us-ascii?Q?n2KqLiXoH45dlW3cDSXyYnOsX5Krn33z10VBlodpK+H26FJfQxEv4ndIreFP?=
 =?us-ascii?Q?HZTOGdM8zXZh0dvmASzodUm8MNV8CqLWO41tjd8QoAMSY+eVips+AVPduzqk?=
 =?us-ascii?Q?wQhN6m7ikAu8HiPnWtVcoNRWvfp0Pc+HBpK9WvQOwjyKg6qS5NNnwQYrBBR2?=
 =?us-ascii?Q?k+N3HPZfwGDaVShfm63rZgH6GwtO1iTwfzXsz4tirJ0kq3sjtr+SIMH4Tv3M?=
 =?us-ascii?Q?OOHSHaEPACebB3dqe/gwV6RwWqc249Inn5H7UOUuwefvo5mCtw69DrAPsnb8?=
 =?us-ascii?Q?84SBgCnZjWB9+xb6N9EcU9h4W9ikGZmxF29sNicqDLivoUNA3fgcth9ZJJwM?=
 =?us-ascii?Q?0xzST2eztgLlEjc900Ch4zuc1AppXIRX50AqArDV4vjpkf8oL8Wujzzqq4xM?=
 =?us-ascii?Q?7vLyWr3YiCyZf2lUigEYyhPZ6GOkg8nZaYhqzInbJG6y/5u4lvCyVIY4DCen?=
 =?us-ascii?Q?JFvouXg5yju46ut2RCp5Xym7flLMxxaKLVPwpwn4J9mNIy9oo/0T9VouIBR8?=
 =?us-ascii?Q?3r86Tu+5vWkcgpgisEFZBe/B7qarUL9eDPxASSUKDLj0mx6BKMdInBZX/TT3?=
 =?us-ascii?Q?mK8Mevu+xLSBXqVCrgSDUb5uTDXxrzuOpKNhr2dGd2vpPq+dw6wIMdAQF350?=
 =?us-ascii?Q?QxgU/19GKp9BlyqxSkWoSvHHKJIarXoUehMv5pzwJibiHW4lj5DAwXw1SkNa?=
 =?us-ascii?Q?nN2jXsWZy2kOYvTRE7TyUy+Bpcy2NeKhqJZwBONPMppmiExkj1EP25hqcBPd?=
 =?us-ascii?Q?26bHQ188LyyjffnWMM4kkEAW2RYZZfqKI7004LBa6y6yOqn7d6ChldHddgpx?=
 =?us-ascii?Q?YyoB3TR0Nq2WNvNox73N2Gd0V/7DMclUtLdgQrcwu6QLQzpPRaA4vegaOlEI?=
 =?us-ascii?Q?byJdQM6vKnMJtNA8X4O/7UVkgvor0pYnexWyrxJhTRR5Jw/BRWpoGtEsprkj?=
 =?us-ascii?Q?Yp8hSEcwYZrTWki7r7e8fwpyCcRQ4IjyY25eabt40k5y3CFwyVEqIyGMBnq7?=
 =?us-ascii?Q?yWcayZsiD5D8iOaZg4IpDaPx0K2K80xTHWUUkGpsMmLSXYG0hBYFsv3gcsvQ?=
 =?us-ascii?Q?h1KSRmniGZTuAvL2TFHdR4HHtYSn5MJ2SgQlVhO4226VNARDez9jrZIX9vEM?=
 =?us-ascii?Q?rTfSYZ1pEU0YVSBdgvPmSgCo7OeIdwVI0rHZcjuvN4Yo3rXveUwKbOPlw+34?=
 =?us-ascii?Q?S9y7bLh6AdDrzwcg4DnBa4mEmC3NAO7GKqkaYCV4kq+6M4azYv8lIwgOiFYx?=
 =?us-ascii?Q?Aco2X7hA36PRSyLVQ/RrITn8cebbj04dsTmgMgGFMEi4s8cSAh5Nl5pYMBso?=
 =?us-ascii?Q?ZRnoNDVLLmBRIQXrUJHstCZXb/8F/4dSIII+2bN/lFxdjyVrySV47RsLrLt/?=
 =?us-ascii?Q?4YQNp8WIQQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b67e84-db89-421b-7d15-08d9ead3c463
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:22:30.5207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OCcG4yAQFG3AJr2xFUVaZi18o0SC3r5UiESW3DKObQfIOSr3ap5UrweA9STUG/9+5szkUjLB5C2oB2q27dwrMD2D/zg2eCeurcKMryurkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-ORIG-GUID: WYHFq-mHuo6mOQbmCQUbTQaoMW81sFNX
X-Proofpoint-GUID: WYHFq-mHuo6mOQbmCQUbTQaoMW81sFNX
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
 include/exec/memory.h     |  50 +++++++++++++++
 include/sysemu/kvm.h      |  15 +++++
 linux-headers/linux/kvm.h |  25 ++++++++
 accel/kvm/kvm-all.c       | 132 ++++++++++++++++++++++++++++++++++++++
 accel/stubs/kvm-stub.c    |   1 +
 5 files changed, 223 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 20f1b27377..2ce7f35cc2 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -712,6 +712,7 @@ void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
 
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
 typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
+typedef struct MemoryRegionIoregionfd MemoryRegionIoregionfd;
 
 /** MemoryRegion:
  *
@@ -756,6 +757,8 @@ struct MemoryRegion {
     const char *name;
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
+    unsigned ioregionfd_nb;
+    MemoryRegionIoregionfd *ioregionfds;
     RamDiscardManager *rdm; /* Only for RAM */
 };
 
@@ -974,6 +977,38 @@ struct MemoryListener {
      */
     void (*eventfd_del)(MemoryListener *listener, MemoryRegionSection *section,
                         bool match_data, uint64_t data, EventNotifier *e);
+    /**
+     * @ioregionfd_add:
+     *
+     * Called during an address space update transaction,
+     * for a section of the address space that has had a new ioregionfd
+     * registration since the last transaction.
+     *
+     * @listener: The #MemoryListener.
+     * @section: The new #MemoryRegionSection.
+     * @data: The @data parameter for the new ioregionfd.
+     * @fd: The file descriptor parameter for the new ioregionfd.
+     */
+    void (*ioregionfd_add)(MemoryListener *listener,
+                           MemoryRegionSection *section,
+                           uint64_t data, int fd);
+
+    /**
+     * @ioregionfd_del:
+     *
+     * Called during an address space update transaction,
+     * for a section of the address space that has dropped an ioregionfd
+     * registration since the last transaction.
+     *
+     * @listener: The #MemoryListener.
+     * @section: The new #MemoryRegionSection.
+     * @data: The @data parameter for the dropped ioregionfd.
+     * @fd: The file descriptor parameter for the dropped ioregionfd.
+     */
+    void (*ioregionfd_del)(MemoryListener *listener,
+                           MemoryRegionSection *section,
+                           uint64_t data, int fd);
+
 
     /**
      * @coalesced_io_add:
@@ -1041,6 +1076,8 @@ struct AddressSpace {
 
     int ioeventfd_nb;
     struct MemoryRegionIoeventfd *ioeventfds;
+    int ioregionfd_nb;
+    struct MemoryRegionIoregionfd *ioregionfds;
     QTAILQ_HEAD(, MemoryListener) listeners;
     QTAILQ_ENTRY(AddressSpace) address_spaces_link;
 };
@@ -2175,6 +2212,19 @@ void memory_region_del_eventfd(MemoryRegion *mr,
                                uint64_t data,
                                EventNotifier *e);
 
+void memory_region_add_ioregionfd(MemoryRegion *mr,
+                                  hwaddr addr,
+                                  unsigned size,
+                                  uint64_t data,
+                                  int fd,
+                                  bool pio);
+
+void memory_region_del_ioregionfd(MemoryRegion *mr,
+                                  hwaddr addr,
+                                  unsigned size,
+                                  uint64_t data,
+                                  int fd);
+
 /**
  * memory_region_add_subregion: Add a subregion to a container.
  *
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 7b22aeb6ae..fea77b5185 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -46,6 +46,7 @@ extern bool kvm_readonly_mem_allowed;
 extern bool kvm_direct_msi_allowed;
 extern bool kvm_ioeventfd_any_length_allowed;
 extern bool kvm_msi_use_devid;
+extern bool kvm_ioregionfds_allowed;
 
 #define kvm_enabled()           (kvm_allowed)
 /**
@@ -167,6 +168,15 @@ extern bool kvm_msi_use_devid;
  */
 #define kvm_msi_devid_required() (kvm_msi_use_devid)
 
+/**
+ * kvm_ioregionfds_enabled:
+ *
+ * Returns: true if we can use ioregionfd to receive the MMIO/PIO
+ * dispatches from KVM (ie the kernel supports ioregionfd and we are running
+ * with a configuration where it is meaningful to use them).
+ */
+#define kvm_ioregionfds_enabled() (kvm_ioregionfds_allowed)
+
 #else
 
 #define kvm_enabled()           (0)
@@ -184,12 +194,14 @@ extern bool kvm_msi_use_devid;
 #define kvm_direct_msi_enabled() (false)
 #define kvm_ioeventfd_any_length_enabled() (false)
 #define kvm_msi_devid_required() (false)
+#define kvm_ioregionfds_enabled (false)
 
 #endif  /* CONFIG_KVM_IS_POSSIBLE */
 
 struct kvm_run;
 struct kvm_lapic_state;
 struct kvm_irq_routing_entry;
+struct kvm_ioregion;
 
 typedef struct KVMCapabilityInfo {
     const char *name;
@@ -548,4 +560,7 @@ bool kvm_cpu_check_are_resettable(void);
 bool kvm_arch_cpu_check_are_resettable(void);
 
 bool kvm_dirty_ring_enabled(void);
+
+int kvm_set_ioregionfd(struct kvm_ioregion *ioregionfd);
+
 #endif
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index bcaf66cc4d..1ad444a74e 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -776,6 +776,29 @@ struct kvm_ioeventfd {
 	__u8  pad[36];
 };
 
+enum {
+        kvm_ioregion_flag_nr_pio,
+        kvm_ioregion_flag_nr_posted_writes,
+        kvm_ioregion_flag_nr_deassign,
+        kvm_ioregion_flag_nr_max,
+};
+
+#define KVM_IOREGION_PIO (1 << kvm_ioregion_flag_nr_pio)
+#define KVM_IOREGION_POSTED_WRITES (1 << kvm_ioregion_flag_nr_posted_writes)
+#define KVM_IOREGION_DEASSIGN (1 << kvm_ioregion_flag_nr_deassign)
+
+#define KVM_IOREGION_VALID_FLAG_MASK ((1 << kvm_ioregion_flag_nr_max) - 1)
+
+struct kvm_ioregion {
+        __u64 guest_paddr; /* guest physical address */
+        __u64 memory_size; /* bytes */
+        __u64 user_data;
+        __s32 read_fd;
+        __s32 write_fd;
+        __u32 flags;
+        __u8  pad[28];
+};
+
 #define KVM_X86_DISABLE_EXITS_MWAIT          (1 << 0)
 #define KVM_X86_DISABLE_EXITS_HLT            (1 << 1)
 #define KVM_X86_DISABLE_EXITS_PAUSE          (1 << 2)
@@ -933,6 +956,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PIT_STATE2 35
 #endif
 #define KVM_CAP_IOEVENTFD 36
+#define KVM_CAP_IOREGIONFD 206
 #define KVM_CAP_SET_IDENTITY_MAP_ADDR 37
 #ifdef __KVM_HAVE_XEN_HVM
 #define KVM_CAP_XEN_HVM 38
@@ -1372,6 +1396,7 @@ struct kvm_vfio_spapr_tce {
 					struct kvm_userspace_memory_region)
 #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
 #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
+#define KVM_SET_IOREGION          _IOW(KVMIO,  0x49, struct kvm_ioregion)
 
 /* enable ucontrol for s390 */
 struct kvm_s390_ucas_mapping {
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index eecd8031cf..dda04a0ae1 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -168,6 +168,7 @@ bool kvm_vm_attributes_allowed;
 bool kvm_direct_msi_allowed;
 bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
+bool kvm_ioregionfds_allowed;
 static bool kvm_immediate_exit;
 static hwaddr kvm_max_slot_size = ~0;
 
@@ -384,6 +385,18 @@ err:
     return ret;
 }
 
+int kvm_set_ioregionfd(struct kvm_ioregion *ioregionfd)
+{
+    KVMState *s = kvm_state;
+    int ret = -1;
+
+    ret = kvm_vm_ioctl(s, KVM_SET_IOREGION, ioregionfd);
+    if (ret < 0) {
+        error_report("Failed SET_IOREGION syscall ret is %d", ret);
+    }
+    return ret;
+}
+
 static int do_kvm_destroy_vcpu(CPUState *cpu)
 {
     KVMState *s = kvm_state;
@@ -1635,6 +1648,104 @@ static void kvm_io_ioeventfd_del(MemoryListener *listener,
     }
 }
 
+static void kvm_mem_ioregionfd_add(MemoryListener *listener,
+                                   MemoryRegionSection *section,
+                                   uint64_t data,
+                                   int fd)
+{
+
+    struct kvm_ioregion ioregionfd;
+    int r = -1;
+
+    ioregionfd.guest_paddr = section->offset_within_address_space;
+    ioregionfd.memory_size = int128_get64(section->size);
+    ioregionfd.user_data = data;
+    ioregionfd.read_fd = fd;
+    ioregionfd.write_fd = fd;
+    ioregionfd.flags = 0;
+    memset(&ioregionfd.pad, 0, sizeof(ioregionfd.pad));
+
+    r = kvm_set_ioregionfd(&ioregionfd);
+    if (r < 0) {
+        fprintf(stderr, "%s: error adding ioregionfd: %s (%d)\n,",
+                __func__, strerror(-r), -r);
+        abort();
+    }
+}
+
+static void kvm_mem_ioregionfd_del(MemoryListener *listener,
+                                   MemoryRegionSection *section,
+                                   uint64_t data,
+                                   int fd)
+
+{
+    struct kvm_ioregion ioregionfd;
+    int r = -1;
+
+    ioregionfd.guest_paddr = section->offset_within_address_space;
+    ioregionfd.memory_size = int128_get64(section->size);
+    ioregionfd.user_data = data;
+    ioregionfd.read_fd = fd;
+    ioregionfd.write_fd = fd;
+    ioregionfd.flags = KVM_IOREGION_DEASSIGN;
+    memset(&ioregionfd.pad, 0, sizeof(ioregionfd.pad));
+
+    r = kvm_set_ioregionfd(&ioregionfd);
+    if (r < 0) {
+        fprintf(stderr, "%s: error deleting ioregionfd: %s (%d)\n,",
+                __func__, strerror(-r), -r);
+        abort();
+    }
+}
+
+static void kvm_io_ioregionfd_add(MemoryListener *listener,
+                                  MemoryRegionSection *section,
+                                  uint64_t data,
+                                  int fd)
+{
+    struct kvm_ioregion ioregionfd;
+    int r = -1;
+
+    ioregionfd.guest_paddr = section->offset_within_address_space;
+    ioregionfd.memory_size = int128_get64(section->size);
+    ioregionfd.user_data = data;
+    ioregionfd.read_fd = fd;
+    ioregionfd.write_fd = fd;
+    ioregionfd.flags = KVM_IOREGION_PIO;
+    memset(&ioregionfd.pad, 0, sizeof(ioregionfd.pad));
+
+    r = kvm_set_ioregionfd(&ioregionfd);
+    if (r < 0) {
+        fprintf(stderr, "%s: error adding pio ioregionfd: %s (%d)\n,",
+                __func__, strerror(-r), -r);
+        abort();
+    }
+}
+
+static void kvm_io_ioregionfd_del(MemoryListener *listener,
+                                  MemoryRegionSection *section,
+                                  uint64_t data,
+                                  int fd)
+{
+    struct kvm_ioregion ioregionfd;
+    int r = -1;
+
+    ioregionfd.guest_paddr = section->offset_within_address_space;
+    ioregionfd.memory_size = int128_get64(section->size);
+    ioregionfd.user_data = data;
+    ioregionfd.read_fd = fd;
+    ioregionfd.write_fd = fd;
+    ioregionfd.flags = KVM_IOREGION_DEASSIGN | KVM_IOREGION_PIO;
+    memset(&ioregionfd.pad, 0, sizeof(ioregionfd.pad));
+
+    r = kvm_set_ioregionfd(&ioregionfd);
+    if (r < 0) {
+        fprintf(stderr, "%s: error deleting pio ioregionfd: %s (%d)\n,",
+                __func__, strerror(-r), -r);
+        abort();
+    }
+}
+
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
                                   AddressSpace *as, int as_id, const char *name)
 {
@@ -1679,6 +1790,12 @@ static MemoryListener kvm_io_listener = {
     .priority = 10,
 };
 
+static MemoryListener kvm_ioregion_listener = {
+    .ioregionfd_add = kvm_io_ioregionfd_add,
+    .ioregionfd_del = kvm_io_ioregionfd_del,
+    .priority = 10,
+};
+
 int kvm_set_irq(KVMState *s, int irq, int level)
 {
     struct kvm_irq_level event;
@@ -2564,6 +2681,9 @@ static int kvm_init(MachineState *ms)
     kvm_ioeventfd_any_length_allowed =
         (kvm_check_extension(s, KVM_CAP_IOEVENTFD_ANY_LENGTH) > 0);
 
+    kvm_ioregionfds_allowed =
+        (kvm_check_extension(s, KVM_CAP_IOREGIONFD) > 0);
+
     kvm_state = s;
 
     ret = kvm_arch_init(ms, s);
@@ -2585,6 +2705,12 @@ static int kvm_init(MachineState *ms)
         s->memory_listener.listener.eventfd_add = kvm_mem_ioeventfd_add;
         s->memory_listener.listener.eventfd_del = kvm_mem_ioeventfd_del;
     }
+
+    if (kvm_ioregionfds_allowed) {
+        s->memory_listener.listener.ioregionfd_add = kvm_mem_ioregionfd_add;
+        s->memory_listener.listener.ioregionfd_del = kvm_mem_ioregionfd_del;
+    }
+
     s->memory_listener.listener.coalesced_io_add = kvm_coalesce_mmio_region;
     s->memory_listener.listener.coalesced_io_del = kvm_uncoalesce_mmio_region;
 
@@ -2594,6 +2720,12 @@ static int kvm_init(MachineState *ms)
         memory_listener_register(&kvm_io_listener,
                                  &address_space_io);
     }
+
+    if (kvm_ioregionfds_allowed) {
+        memory_listener_register(&kvm_ioregion_listener,
+                                 &address_space_io);
+    }
+
     memory_listener_register(&kvm_coalesced_pio_listener,
                              &address_space_io);
 
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5319573e00..d6caea8174 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -29,6 +29,7 @@ bool kvm_gsi_direct_mapping;
 bool kvm_allowed;
 bool kvm_readonly_mem_allowed;
 bool kvm_ioeventfd_any_length_allowed;
+bool kvm_ioregionfds_allowed;
 bool kvm_msi_use_devid;
 
 void kvm_flush_coalesced_mmio_buffer(void)
-- 
2.25.1



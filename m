Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA34942A5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 22:54:10 +0100 (CET)
Received: from localhost ([::1]:40432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAIu9-0006vR-9g
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 16:54:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIix-0007d8-6Y
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIiu-0007HI-SI
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:34 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJPAPZ032601; 
 Wed, 19 Jan 2022 21:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=wkG+6ip652Gy0UjBy4fRhuNnkoGqv/nHa6VG/6epRF0=;
 b=DmG2U3/Qb33W8LsM6mSDE3CfsXwaS+fxx/gA5q1OCeGrtxnNz/qlw4GH6qMDSEl7DyT3
 x6IA1I49mvRxhD9zlHjZtiqlundUbFqr2re4uawzZhV9tqf5p0SevcWVHI5zD7HuNuGl
 Tvw7fTSnomroBAYLSsYcgZSok2o5xyEiC0X+aQ1g28mrlesGpVcP+UPYc5xdtEAhsK9Z
 3cN2+LBqaGLd2FvUPBZSsIAVwwJk1kmKdQN09tiroRqSrw6oRSraAyyOYZjmPO5IlBkg
 rkyvmeXhpYgOkUVPzKNL/eiL42nJ1KyyN7Cdu+CxEDIfPtNzzlrknL7gQA9TqkTCN4ng /g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q6hwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLa7vu131886;
 Wed, 19 Jan 2022 21:42:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by userp3020.oracle.com with ESMTP id 3dkqqr64m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Umq1ds4lUoiO6Mexosaa0qvedAWEHV20CBZVqM9TpQWdlS9GyLD6TQFmZtgAOEL5qKGM1PjeYDl/ddDm23upa+wDf2mQ9wJk0KmAxgjv3idpMrHgapLFhIyFZA9AFjT25m0qQgfmHVibDnUkMpB8gX29lugqG5tVfX++pGKVthg+yuksyN68m+5CGKmlhTHQirrVah2+xt9rQIFyum6+qescCJbMZWpmW7EsNb4aTck+8Y6a93EATAu0GLboMEVA2SM1K+GWa/9L4/mXVLhrOnDL+k1iivWlZ5fOE0jIGbJluVx8mwLPw9b9jXWP+zH/QgB/zj+Bb48keiFMd7NZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkG+6ip652Gy0UjBy4fRhuNnkoGqv/nHa6VG/6epRF0=;
 b=H0a5v/BlLT6FugWTghNUzHmxxoxCoopNPXsZPrujOH73apsSvZK6pBDVt18pLfrIQ+sJ6xMM+L4Q4WK+aKUtHlofMyQMyckCbF/sK3E2pUAEsDcvOa/eeUC6ziuIs3nCTck/z3r54BOYyKTysA1nlrq/Ms8x05kbGy5Fh46kfvn38e1FUP2dObMY9KRz7EMiz/bhsSav7BxrFX1omDq8q6//2ErvKdkuu7p0obdAQ077BBY6gD21pq9aFJjJL9CN905rJhVtN4ORnTBWFzZPKI50vJ2VLKjQv5vrx/QcbnrWAdhdkOQnJuF7XTeA1gTlBxUi6XRmltee//JGRcuokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkG+6ip652Gy0UjBy4fRhuNnkoGqv/nHa6VG/6epRF0=;
 b=WfYtr38w7RUSXIqM9EL8ctrI/6xAy48xHkWmXG0Bdw2td+3AUdsJgz8+l3wGlzghnnErk+NdwBmheb0X/TpL/jN35Xohws03QWl6cEg2eTNUFo0PPbGzQfMFHqCCZblr3LusLZvljlQjjKAM917jqbAriAnaNvln0idafs4SH/4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:27 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:27 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/18] pci: isolated address space for PCI bus
Date: Wed, 19 Jan 2022 16:41:52 -0500
Message-Id: <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fd2cb20-11f3-49f7-7ee9-08d9db949664
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB5887611BB0036291ED261E2790599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cubJmUI+rJOI3ABPZ1EMz14fUxJX8xfTYnynKMfkET+FacFZC0NExphgAZQS9QegRLHm4Zt5OCRL8M0sBJcAY5OcZXTY/06BO997o9M1lM1Q6pY1+jGsgYsywq7fVkaCOt1Be5pdEgugVrCSeWdP7XbkOYK2PbZoWf9kIL8mF1nmnLwhNoUyJMzC0OL6ha77zt1/4oxy/9Hyq210xQKTwu1+Y3Fuf8tGxw2Q69qGOa04mlAk1wzpk7HvgBzJtzRxMQrQU321S1+FuM4zyV2L4i7plVe6T4QH/uwefe3lOM64UMX8zGsDy3VDdvzh1nMwBnrBsh4ZiPChowy/7A90k9LZZ6tfXPLPADbm5NW9sZ+HbprkOUXLZ9/K97sRIrUeDmq9/l8BxaJI1DajxoYFblYVQdg0JRG27KWUfPqGGBN6IkYqnwDma7XSlFU/YIr2MDox6QQIdYX9aL4I/CWXLyLcCBZViuiksdhIY4Pd1Jpo+rgO7Evfq5RWItt+28r9mOvwLuTtRx+AGzTLuIVmVurJiAimd2eCPCgFVGcroiB7k3n6OWEtsF4kKGUUG+yKz2h5K5A0XlgHWiSqANO+gXyPqI93dKRHQvmqIZE4VmvTRIIaOvGAUlM+nik4ElbN732sH7m9BNlZnA2FdK4N/y8FE63uoTAnIh9zhY7c5PHbQqa58rZdFD92jTKTzRE8bw11Pgabrc4WAICsrSOJQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NWOCXr6VmiuZoReWF/47uTG96DRbDXrcMF0XSg6M9pfVohIWphN3Av7u7TLu?=
 =?us-ascii?Q?GKxJALsx4DFNbSZRXSY8/gy5Xbd/ZEmHMFNjTMGPgHpa6yK60CeTD6F3mjov?=
 =?us-ascii?Q?kXxPQbd355Z7RSRTAFp5ehDHYXNtRWmU/hC2+dM6Nb2rc/BiHIS7dhwjvtYM?=
 =?us-ascii?Q?15ChN39fDLbN+X9h991CkejnSsYc/rgmCg0550TRAGR3zx1YatelhBrm8+xc?=
 =?us-ascii?Q?wNCgS20XoDzwTs8Lv32CBnW/Dk/QHAzv+8ZbcENw4FkIjjzMSQfyon6Nt4G+?=
 =?us-ascii?Q?vy8qlimrmh3E4s1OWtMeZzKnSA5UyhO0uuzvGzmFYWaAePcbcVXqjQL8+ueT?=
 =?us-ascii?Q?duCWHOeTxoq2vQKexBc6VI3lYFnwzt6QsJ2exQF0YZOJqC4bhQ98p2ahXhpE?=
 =?us-ascii?Q?SY02JSkLCSf2Bks59yHxWwQW1f3cs8ZaVDQ4NR7zaKGAQ35NKPgqfnGZ2Ay7?=
 =?us-ascii?Q?5b8CTyMe975+emI7JlFAZQ4HOq3SJIBR/bjzdiy6vmru+yAJ5hI6/WJrMjYc?=
 =?us-ascii?Q?XV78NSsj361zMoRqCPVzHYiJywwg1UF5zeELV1WErZTJJqsPYYbTVTXz2jqC?=
 =?us-ascii?Q?Rk2nkhXdAwV4Ro2lIZYQn4CpN8edt0HMWgZuWpansviauywj1nY8sk8QdUee?=
 =?us-ascii?Q?xi/FBR6EuRsLdcOK+GhJBdpQqKhQXyBXqbwTbgm3pAeCutKbR2YdWAo72Y52?=
 =?us-ascii?Q?zIHI0EO3lxPGIvzHja/J6/u72w1Xccbhn7dPYsHIblpPfa6mVEb67r+jkGAn?=
 =?us-ascii?Q?40TPpdNAsij89Nc7CvD08JCO3AMMXITLjQBIBLdso93Y/oAEBJlC/DSKlQ6v?=
 =?us-ascii?Q?wXrrS+HSaPeQ97sziEfq7tjKSpltl9iaGMJAooDzxvzz7tPWWDVqYQctIABT?=
 =?us-ascii?Q?acXayThNuin3p2iyFecU+aw+PTw/HQnxYrFdaZF5uSM2FyHam5sC5ncZ/cxu?=
 =?us-ascii?Q?MmTJjQA5canBRJdkvQYcJZUfbiX0hYA5QEJ4NSbl0YkpV7Pq7SPaVi5wVmBa?=
 =?us-ascii?Q?+iVVWqmn2uKThkR8tK67hSXEqsnlou4S+QJtwI7jRt4/xziOqkARifUSTkG4?=
 =?us-ascii?Q?3SK4oWKGRzB6oBfOyw65b2QED9tKuUagtKQhaqEITwreR9DCf/AelevRY45J?=
 =?us-ascii?Q?7BTMBUmhXWNbdzoSAGqL+YMDzPM1ILT5Dwa9yLnW7gjQAxe28/2OorsMiXlF?=
 =?us-ascii?Q?RPcOda2d5DL8cAW8EAXaY22AoyFNa9UJUmR9oFTYbMIX/AFllf+/Hrguso4k?=
 =?us-ascii?Q?jTar6Oe/bLnD60T5k8AHVIUPkHjghB2Ux+pASfmKVLNnMkBKFlB0cm/pu0fh?=
 =?us-ascii?Q?IPb4xB2HGYn+eG4cMGC5U1z74P2Q2RVTABEBi1ey4lmVtC7+EC/tfGOfji1g?=
 =?us-ascii?Q?VNfkYrenqtgQBVuLh8TiY6Tq0X0P4Pfu1gOGYy5coQAyPT0XceQl7XVH+FWT?=
 =?us-ascii?Q?4y234qDW1j/AlgU2Aw26EIl8elpCvh6TEJ3ZQRfVsIC+GcrJGT3s9NVs+aI2?=
 =?us-ascii?Q?T26gmcvi0rOqW0vwzUzDqMtYXuxX+PzmV9H+ZRQiGBENKfNOb25izv2HCY7C?=
 =?us-ascii?Q?Gf20udzPWu2te6nsCQxs/Tzgu/d0v4ixsIs6JHwE4PfWbFjI75iaVj1yZzWO?=
 =?us-ascii?Q?HLkyEyDLVSJoUUtI0fCy0L4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd2cb20-11f3-49f7-7ee9-08d9db949664
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:27.5384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjcXHM6snpg54ceTgh5e1RBjMSotCpCG+b8mn1Ea/3raiL44dQs+lZvxcFm+rEPTzFIDWz7WI9ZwUq1DGvBUtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: 0SHafPzeyxy7b5ORSLwHlC2BDHcQSyJT
X-Proofpoint-ORIG-GUID: 0SHafPzeyxy7b5ORSLwHlC2BDHcQSyJT
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow PCI buses to be part of isolated CPU address spaces. This has a
niche usage.

TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
the same machine/server. This would cause address space collision as
well as be a security vulnerability. Having separate address spaces for
each PCI bus would solve this problem.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/pci.h     |  2 ++
 include/hw/pci/pci_bus.h | 17 +++++++++++++++++
 hw/pci/pci.c             | 17 +++++++++++++++++
 hw/pci/pci_bridge.c      |  5 +++++
 4 files changed, 41 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 023abc0f79..9bb4472abc 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -387,6 +387,8 @@ void pci_device_save(PCIDevice *s, QEMUFile *f);
 int pci_device_load(PCIDevice *s, QEMUFile *f);
 MemoryRegion *pci_address_space(PCIDevice *dev);
 MemoryRegion *pci_address_space_io(PCIDevice *dev);
+AddressSpace *pci_isol_as_mem(PCIDevice *dev);
+AddressSpace *pci_isol_as_io(PCIDevice *dev);
 
 /*
  * Should not normally be used by devices. For use by sPAPR target
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 347440d42c..d78258e79e 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -39,9 +39,26 @@ struct PCIBus {
     void *irq_opaque;
     PCIDevice *devices[PCI_SLOT_MAX * PCI_FUNC_MAX];
     PCIDevice *parent_dev;
+
     MemoryRegion *address_space_mem;
     MemoryRegion *address_space_io;
 
+    /**
+     * Isolated address spaces - these allow the PCI bus to be part
+     * of an isolated address space as opposed to the global
+     * address_space_memory & address_space_io. This allows the
+     * bus to be attached to CPUs from different machines. The
+     * following is not used used commonly.
+     *
+     * TYPE_REMOTE_MACHINE allows emulating devices from multiple
+     * VM clients, as such it needs the PCI buses in the same machine
+     * to be part of different CPU address spaces. The following is
+     * useful in that scenario.
+     *
+     */
+    AddressSpace *isol_as_mem;
+    AddressSpace *isol_as_io;
+
     QLIST_HEAD(, PCIBus) child; /* this will be replaced by qdev later */
     QLIST_ENTRY(PCIBus) sibling;/* this will be replaced by qdev later */
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5d30f9ca60..d5f1c6c421 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -442,6 +442,8 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
     bus->slot_reserved_mask = 0x0;
     bus->address_space_mem = address_space_mem;
     bus->address_space_io = address_space_io;
+    bus->isol_as_mem = NULL;
+    bus->isol_as_io = NULL;
     bus->flags |= PCI_BUS_IS_ROOT;
 
     /* host bridge */
@@ -2676,6 +2678,16 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev)
     return pci_get_bus(dev)->address_space_io;
 }
 
+AddressSpace *pci_isol_as_mem(PCIDevice *dev)
+{
+    return pci_get_bus(dev)->isol_as_mem;
+}
+
+AddressSpace *pci_isol_as_io(PCIDevice *dev)
+{
+    return pci_get_bus(dev)->isol_as_io;
+}
+
 static void pci_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
@@ -2699,6 +2711,7 @@ static void pci_device_class_base_init(ObjectClass *klass, void *data)
 
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 {
+    AddressSpace *iommu_as = NULL;
     PCIBus *bus = pci_get_bus(dev);
     PCIBus *iommu_bus = bus;
     uint8_t devfn = dev->devfn;
@@ -2745,6 +2758,10 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
     if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
         return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
     }
+    iommu_as = pci_isol_as_mem(dev);
+    if (iommu_as) {
+        return iommu_as;
+    }
     return &address_space_memory;
 }
 
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index da34c8ebcd..98366768d2 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -383,6 +383,11 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
     sec_bus->address_space_io = &br->address_space_io;
     memory_region_init(&br->address_space_io, OBJECT(br), "pci_bridge_io",
                        4 * GiB);
+
+    /* This PCI bridge puts the sec_bus in its parent's address space */
+    sec_bus->isol_as_mem = pci_isol_as_mem(dev);
+    sec_bus->isol_as_io = pci_isol_as_io(dev);
+
     br->windows = pci_bridge_region_init(br);
     QLIST_INIT(&sec_bus->child);
     QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
-- 
2.20.1



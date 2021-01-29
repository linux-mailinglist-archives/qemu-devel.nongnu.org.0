Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3544308A8F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 17:53:01 +0100 (CET)
Received: from localhost ([::1]:36176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X12-0000dr-Mv
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 11:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvA-00078Q-5O
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:56 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wv7-0005fO-3F
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:55 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPJl1181259;
 Fri, 29 Jan 2021 16:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=W6eoKK6W4spAqcmNLColQeEE4lnZkEJN+/04zdTvlnU=;
 b=biHiDwt5nC5CiC/uME7AoM/qejHZ4fI86/R9AhAm9hkEyaD7t0cNTV1CERsxq0pRM1AK
 bNSxyZarM+ukR7aDI2p5pgrY2HbRhxfi98H8fBC6ic+qgD6dDVImeOCUSgjl6546UrcQ
 RY7sdsMAMnaljDvuXedP1huQsmBA2EZYrxYK/G+Q7cmbfWgbpRc5QP3xZ28xB9Dpa2YS
 mt5DOX+FJrurhQhHocddXGoGG4UJWroBP7QHtPkglQLWEV8qfjPliido4N8vnA4eDUPB
 qcnGenKn1J/HOzxqHZkQNJvUor+rayXOvSelrd34FijDSYmyP0ePO2PKpw59q3g1rspI KA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 3689ab2dvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOhpe083778;
 Fri, 29 Jan 2021 16:46:37 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3020.oracle.com with ESMTP id 36ceug4251-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k79ffSqaS7TLnGRaw7hWRdwhu/wjjAvt3pMZ5XK+yFcvV1cegRV6sT4atHOyfGXBBwGMQ95/2q8X7fORT4jbgAdK7Oe+K41zD+2/fQ8sLuaTez+sHndquF71eGKxqwbZ0im7UgWpMKNggFmVRZyiUdf8cuiu8CrX+N8cHIaAVo0rJjGLeilnpH3rpdPSiLWOIufiOUFGKSA8P3Vv+CodWAJzvOaEOkxf6blPuckIEfBpN6YR4s+btT31Q5g0RPeRavopT+ZbsWBualL59shdnCSyeRJGAKEKU+2LZLNxhXYyb3mPPO3XmUlyXKceMw1DSIVdFY9LcyYkLOKCvRd4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6eoKK6W4spAqcmNLColQeEE4lnZkEJN+/04zdTvlnU=;
 b=STchPsYLSswFOt1XBtRlWMW8UCt/8tE2yxWUMbG+d8nI1yHkzTjRwcFO0Kfo1OYM3VRc0MXEjFlhLhYT8oN9s1ZD5Rdx/WdAMpXrx5ZSdulMsf/MRcHyXZ5bFNfAJA78zGKkSJS9UdePp1drISaZ7CzBvziUz7FVf8XiNFTZRCIAv3DEN8FspEeZiym9lmFZJEk53oDP045qK/SZ1YkGVZqqS/O3+r9qsqaRSso+tQSim0S8HGCed7DZzIa7U1lLFjdrH5HequQeKNx2+VWZLYQFwcBbkJP4HMHiChnOaxpGfsoy9K2LlrKEpLs1EkwyU1/94m1Z33JM1qArQFP+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6eoKK6W4spAqcmNLColQeEE4lnZkEJN+/04zdTvlnU=;
 b=vweX9LuDsxx6nG5GhkK3V1BjSw/M9TFHnG3GFVjF9hFghIpw5IcdZfk90q2FEiz+bWvatrKRSv15vsiAUaodeKrScnn9xWqIpMrO81brqOV8VQpPh2/wSgQQ+G/ygp726pfe/cJmIyEnoTqv+RV1bqZEEeUt6E0p4tNRSN7I0u8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 16:46:35 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:35 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 03/20] memory: alloc RAM from file at offset
Date: Fri, 29 Jan 2021 11:46:04 -0500
Message-Id: <609996697ad8617e3b01df38accc5c208c24d74e.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e12f56dc-00df-456a-f792-08d8c4757080
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB46863ED543AC333F4BB0EF4A90B99@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yu0VlqVgpDxoXLxgyRRjnIwcxKuBDmOY8Ttt9OpQ2jdf4PbByIhme2gqzQBVqNNO5QrWYC73pqIFUJ+ElCpOUn3MCZ4x/V7sXxoQksBQ1tqJ//pJYnyQIKa04Yz2CDcFHC9vcmPQ7towFLsmrd66vKrn45sHrTy3UYQDM6MG7TyChfFMEbJan5vcG6uC2PNHVU8RqliFUh2Jzv4m8kHhZF72QSIcS4Bx19mJvH8awq3Jm0kSNGC3op33rjH7CAJ8dr9AqMNAZFzQbNmQ4v4KwHieLGwvCtbTvICl0bOL29Wx88SrV0l3XAwxl916NfWtEkFkhZX4bP1CvantCvudiiOIVRhGzqdXJWOcZvOqGCmS67s2OQxqIp2p/NXkdbIghvGcODc5c1CcbBZhP6WYf68OjhJb6ZGV3CLK+5ayNMp7gcXRclX7jGJdwQwE1eTMi2sBOTt8dct8nodPfegSLPC2sQGFDoSYlR1UepvWhOHEr+zFVpIs4M9/95OayaS+WmXEEdXagyKFlYZzR9AByQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(5660300002)(52116002)(478600001)(6916009)(7696005)(36756003)(4326008)(83380400001)(8676002)(316002)(66946007)(66476007)(66556008)(956004)(2616005)(26005)(2906002)(6486002)(107886003)(86362001)(8936002)(6666004)(7416002)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Mzh63d6Gc5zt2bVYWYeBUHFCUG9UkiiZpFVF6agRSFbZE0j4ZpcB2g3QJi8z?=
 =?us-ascii?Q?piDKUFaiod/KfgEZoewndLaE0UlwaCL1LOD8Y2HRT3b2rd1cq8r5Xk/aet2x?=
 =?us-ascii?Q?hrR1ch9pGo29g4FVUFMpwmw1JPBNlvmLCqPCugN/sW+4ky6/DlrVVcuIoxGd?=
 =?us-ascii?Q?vTEAYhpwWTN3P00dGO5GoTiJS8EHmjzfIPsLgKpNREbOS8f8p/LDx3AE7sAq?=
 =?us-ascii?Q?J2uuGKYSXGPFy3m+h1LkU4jpgR+LMYo2RsgZbT6SPNYjpZ1+gp4T0w2s7kLR?=
 =?us-ascii?Q?5iBQUKKGbjDJQlK3IRJVOp282DBJ85G8WVE8B9gr3rJT6/1YSlkw76efMoAv?=
 =?us-ascii?Q?792zdHR0LzLEf3WzRuB3zQCNg6d6SkWW1VWLS6/XR3l8ZVnRrLIVFkfXDW8/?=
 =?us-ascii?Q?jppN7eISF32sVIlHUW4mfvzD98IR31zMF9fNJLtEKBkqpDfR3Jv/IYqfTMZ9?=
 =?us-ascii?Q?p4pSm5O5+zZ6UeS69x1/FKaJkMl1IGSr7eqGfENS2Rdah1t2nHq2mn7/86R8?=
 =?us-ascii?Q?zVO64UHU4EW24egSSHXSZLNbeZ2hlpUIoo0Sn3A4TV8GLm+TFwUI4fV88a9g?=
 =?us-ascii?Q?IZnhHU9Pdswjcqxb9HC8Yl5cpoantayd4qG2PtEVwJbH2XsiO+uLM9sbgg3s?=
 =?us-ascii?Q?7e9pZKfy3t0Dy7NcLNtpQJg3NCzFdfwY7OAxNTHgu7qXM1sTqaDq5nGeLuG1?=
 =?us-ascii?Q?Z3RJwLvn0+A/rLYmE3QCJ1WRLcRROaDy2V/G+RNLp9aFQSZcO5swSqVunYZt?=
 =?us-ascii?Q?agirc9oAFBVVY3WnqE54lcNoWeAJITIOTZZLZCoag70Rcg4qRCEvJ/PVRFZf?=
 =?us-ascii?Q?djKxngrNcLL6ekf26gA47VVJjOdWOb6m1qLX9zXSgz9auyHEdgrJGbZxbuRW?=
 =?us-ascii?Q?HKLB70CFdF6oTy9adL9WswsUiy1b5cn2K7SXyAuxUSAmI+S7PO0mfhs+HAAp?=
 =?us-ascii?Q?yI/bYJmf/A4lQljOaqmrMH7sdDFNB8DenTFqi7NGc6qrmJ3IQzsHfJYijxov?=
 =?us-ascii?Q?LlQ7y3aAlfqUQPkFkX6ocipJ40WSci8VJlVUPN4V3NSAZBCLyLdfyPpI5Pcc?=
 =?us-ascii?Q?86HDkTlA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e12f56dc-00df-456a-f792-08d8c4757080
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:35.2382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCz1BEI9l/XHPQJguRMrL1YLC1bRU+HqpFvBsGKCxMgNJSdEQfOSDhVjiIP4f3QnsY7v9is4w6MnFwHy7QwGKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow RAM MemoryRegion to be created from an offset in a file, instead
of allocating at offset of 0 by default. This is needed to synchronize
RAM between QEMU & remote process.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/exec/memory.h     |  2 ++
 include/exec/ram_addr.h   |  2 +-
 include/qemu/mmap-alloc.h |  4 +++-
 backends/hostmem-memfd.c  |  2 +-
 hw/misc/ivshmem.c         |  3 ++-
 softmmu/memory.c          |  3 ++-
 softmmu/physmem.c         | 11 +++++++----
 util/mmap-alloc.c         |  7 ++++---
 util/oslib-posix.c        |  2 +-
 9 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 521d990..a9d2b66 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -990,6 +990,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @size: size of the region.
  * @share: %true if memory must be mmaped with the MAP_SHARED flag
  * @fd: the fd to mmap.
+ * @offset: offset within the file referenced by fd
  * @errp: pointer to Error*, to store an error if it happens.
  *
  * Note that this function does not do anything to cause the data in the
@@ -1001,6 +1002,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     uint64_t size,
                                     bool share,
                                     int fd,
+                                    ram_addr_t offset,
                                     Error **errp);
 #endif
 
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index c6d2ef1..d465a48 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -121,7 +121,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
                                    Error **errp);
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
                                  uint32_t ram_flags, int fd,
-                                 Error **errp);
+                                 off_t offset, Error **errp);
 
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
                                   MemoryRegion *mr, Error **errp);
diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index e786266..b096ffb 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -16,6 +16,7 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
  *          otherwise, the alignment in use will be determined by QEMU.
  *  @shared: map has RAM_SHARED flag.
  *  @is_pmem: map has RAM_PMEM flag.
+ *  @map_offset: map starts at offset of map_offset from the start of fd
  *
  * Return:
  *  On success, return a pointer to the mapped area.
@@ -25,7 +26,8 @@ void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
                     bool shared,
-                    bool is_pmem);
+                    bool is_pmem,
+                    off_t map_offset);
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size);
 
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index e5626d4..69b0ae3 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -55,7 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     name = host_memory_backend_get_name(backend);
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
                                    name, backend->size,
-                                   backend->share, fd, errp);
+                                   backend->share, fd, 0, errp);
     g_free(name);
 }
 
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 0505b52..603e992 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -495,7 +495,8 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
 
     /* mmap the region and map into the BAR2 */
     memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
-                                   "ivshmem.bar2", size, true, fd, &local_err);
+                                   "ivshmem.bar2", size, true, fd, 0,
+                                   &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 333e1ed..fa65f45 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1609,6 +1609,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     uint64_t size,
                                     bool share,
                                     int fd,
+                                    ram_addr_t offset,
                                     Error **errp)
 {
     Error *err = NULL;
@@ -1618,7 +1619,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
                                            share ? RAM_SHARED : 0,
-                                           fd, &err);
+                                           fd, offset, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cdcd197..5303634 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1461,6 +1461,7 @@ static void *file_ram_alloc(RAMBlock *block,
                             ram_addr_t memory,
                             int fd,
                             bool truncate,
+                            off_t offset,
                             Error **errp)
 {
     void *area;
@@ -1511,7 +1512,8 @@ static void *file_ram_alloc(RAMBlock *block,
     }
 
     area = qemu_ram_mmap(fd, memory, block->mr->align,
-                         block->flags & RAM_SHARED, block->flags & RAM_PMEM);
+                         block->flags & RAM_SHARED, block->flags & RAM_PMEM,
+                         offset);
     if (area == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "unable to map backing store for guest RAM");
@@ -1943,7 +1945,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
 #ifdef CONFIG_POSIX
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
                                  uint32_t ram_flags, int fd,
-                                 Error **errp)
+                                 off_t offset, Error **errp)
 {
     RAMBlock *new_block;
     Error *local_err = NULL;
@@ -1996,7 +1998,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     new_block->used_length = size;
     new_block->max_length = size;
     new_block->flags = ram_flags;
-    new_block->host = file_ram_alloc(new_block, size, fd, !file_size, errp);
+    new_block->host = file_ram_alloc(new_block, size, fd, !file_size, offset,
+                                     errp);
     if (!new_block->host) {
         g_free(new_block);
         return NULL;
@@ -2026,7 +2029,7 @@ RAMBlock *qemu_ram_alloc_from_file(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, errp);
+    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, errp);
     if (!block) {
         if (created) {
             unlink(mem_path);
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 27dcccd..ddffa0d 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -86,7 +86,8 @@ void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
                     bool shared,
-                    bool is_pmem)
+                    bool is_pmem,
+                    off_t map_offset)
 {
     int flags;
     int map_sync_flags = 0;
@@ -147,7 +148,7 @@ void *qemu_ram_mmap(int fd,
     offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)guardptr;
 
     ptr = mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
-               flags | map_sync_flags, fd, 0);
+               flags | map_sync_flags, fd, map_offset);
 
     if (ptr == MAP_FAILED && map_sync_flags) {
         if (errno == ENOTSUP) {
@@ -172,7 +173,7 @@ void *qemu_ram_mmap(int fd,
          * we will remove these flags to handle compatibility.
          */
         ptr = mmap(guardptr + offset, size, PROT_READ | PROT_WRITE,
-                   flags, fd, 0);
+                   flags, fd, map_offset);
     }
 
     if (ptr == MAP_FAILED) {
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 359c52d..3041e9f 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -230,7 +230,7 @@ void *qemu_memalign(size_t alignment, size_t size)
 void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared)
 {
     size_t align = QEMU_VMALLOC_ALIGN;
-    void *ptr = qemu_ram_mmap(-1, size, align, shared, false);
+    void *ptr = qemu_ram_mmap(-1, size, align, shared, false, 0);
 
     if (ptr == MAP_FAILED) {
         return NULL;
-- 
1.8.3.1



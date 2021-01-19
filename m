Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2052FC124
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:36:40 +0100 (CET)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xjz-0008Cr-0Z
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcj-0000pB-Tv
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:09 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcf-0000DX-BQ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:09 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNUZe002814;
 Tue, 19 Jan 2021 20:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=LnLOzmDa5T3JMJMlHyI2N+DKckhRbqWiYe6fNdWlaZg=;
 b=xFdca+Boc2gaGEV48gODMvOAuTAyWf0FI+pcI9SUrMKbG14M50n8lT5lXCb5BDyIiWgl
 jynl+NrnM2JtHgP8QRMNz8rJJxWSVVEYyB1RO46FR6IEFJBKfU936WWpUv98N0SzSM9k
 fQyvjU5KaMbvGKfbNq/M00+hY69EN6uIYC6+j8vY04pfSTy7jyfgQPIWOzm6LIVKb1j1
 QO3B3Z4aqatdlJafzAcy+Dmjik6BMY0FjkgDLxpqFEa+ZMpZED/0g6PHE2+ynVX1UuUq
 pUQqPxqUG8S1dhVsLntTOhN99AWJgp5VwxLiHAuiMbnQAWgtSocP0NUxDXxuNBPHh3TW 5w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 363xyhtarg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:28:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPji9175906;
 Tue, 19 Jan 2021 20:28:54 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2054.outbound.protection.outlook.com [104.47.37.54])
 by aserp3020.oracle.com with ESMTP id 3661er941y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjyC5mZsixRYjI3AeZgcbJn+mcDpYJkG30oOMcu3AUqJMjk3xzD/37tP1VTbWMRbTVquw3CFQOJCmJvnWx37wGAiMXJDT5VxJdgvUOCpQ3pVnRjAYC176q/oNE14wuKVDySjflwail++10TDRCuBSbRT8024s7VGirdX5OxQLcgTbgS825DcvCUFoNV/F4eu88s1Lw1oGeaDwQtU/onfDfzQmCYIZ9EG97wsIMqHa1V+6WLsC+L3JEYDCNifDHmF3Nf/B/nSS3XtV0R5yWrsycZ+TUX4A0xS5rDvFQjvUE5Jllev2AfX9fWxBivvYj7SCtZeeqzxxDG4ppBYMHgsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnLOzmDa5T3JMJMlHyI2N+DKckhRbqWiYe6fNdWlaZg=;
 b=TPxg3zkx6ttvsSjMtWNLFN6r14GlsmkMD5kCNE/csn4TOYoobiIwrvUb+qucOrn6DYknhSQZk+C7jaabrQVf+p7aqOyfumbEiAffiLGBJEufQoxfmuXDLrHRggorTzZvVwcLeZkAyaxLaEyo+WOmcNSJLILCQfjH3DM5QthWzJVLaWKR2Genyb3iG6/27nTgLz3uv0BmNSGg6IO+BpYCrBqXjFaM0ggC6NPnYCu0jgJhBP6K7ZPzlV96rVag1vRu30b3X+m/+hfXK4efAHddRp+1sMrvAGvUO+EeVGpdtpzG3zZxUQodUfRoI/fPq9LDCAJp+EXcrX81tVYqVg4rkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnLOzmDa5T3JMJMlHyI2N+DKckhRbqWiYe6fNdWlaZg=;
 b=IIFJkCwtxKNuQD6zZwlRTs16NKF0iw+PY47IXC2TpMGvK9a+FtoKKdgqkpSEVdfCUdpUwwfpvgHRDWqAgFug6A9WDBffQN/xxe7O42WJYZ4JGKniHCeGoe0GjQ8wEFFPnosssVSHNDLMLqyE6v3SVo8L1IfjGShJKPNnlI7Bfv4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:28:52 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:28:52 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 03/20] memory: alloc RAM from file at offset
Date: Tue, 19 Jan 2021 15:28:20 -0500
Message-Id: <fdd611c958abcb5bdc18673997adfa086b64e0a5.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:28:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b645323-ad7b-4e10-6069-08d8bcb8d5e7
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3349B9322132151CFA751C8790A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygGfce37kjLXI4kGtV9nOki09QL6ExQOk+HwjwBWgtm7wZnWM6H/x1eNh9OqllQFQ6IW6aCIZNX4sUyq1+iW2AiLe3fz2k9jvZM2I87qtTlJY68CtsFXyUjMX+broM4xnnn/+pyKIaFkW+QlIr3eaV9LeUn9HRAG1GTfu2lJMYJOiigP3kCsLagtMOBgRUVxkLUGIWQcirRDuobG+nogp+QFp5K93oESeAigmwIVzdXzB+tCA20EtRDKfnatJC+lvt8lfV5b9mRuDqS8S4P3LPVfMB7jtRJMUyzHRiteDR9+JIliRgKp/jQGWAZIluuj6xbrGoA1ZzSShSHj3p7Z27V2nqHpCTiIiuFnjSklFeSf001U+XXiCxZ0cY74xVaLEL+eXCghhF5uEUd1AcM36w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L1YUEJ7Op4JJtFiDIe0g+vq4sQe/B/TX4NDTdGJYwJFU1FapUR5ZklF3sSEH?=
 =?us-ascii?Q?XIoJkigiLmdWric/xTkSouqBYFCsOXi1xK2u54zB33H5oTXaDuKi+BdxqG6b?=
 =?us-ascii?Q?jRdZ/2XEokuMoh/8whFOODG3RZWZKf5SxhigCIuJRqrhYOr+qu60+3ZoxWq4?=
 =?us-ascii?Q?xuCzTAr1fW0/1cviIwzuzOynqP0A4FxjDzo/JWvJxNwj1n8K9mn4Jh9qrG/U?=
 =?us-ascii?Q?PSh9p8LX2fviY+ijPMocsS+mfJ/Yt4Ch95iobP/gXuGzOBcQ3Z85gIuJHcT/?=
 =?us-ascii?Q?GcrXUasisn7AhMPTo9byk83F0CfOjpHL1Cnoc9zxiiuYE4tbbExSsQPxDHdZ?=
 =?us-ascii?Q?Yc+9fJSZSTqScHIKgsHTTin5tygE5C3YBvE6gUQXQlb8dGMPKir9Z92wb1CM?=
 =?us-ascii?Q?yfjS8icxfIdSP6skknpoAWvv/asRZurQVKtUd1iOmrcu5vw0IpWyokHa4F/p?=
 =?us-ascii?Q?uSSElATmM/FJ2g/hTiAraVyBIMmcbS/S/mS8kfL/umpO77LheUCmzlQxgSz7?=
 =?us-ascii?Q?9Z/zeCncsgCUV99AypSrUnl8P1HE36KA93Dzs61QrCqnfi4gF+uZ0UiYIMcT?=
 =?us-ascii?Q?Yo5ggnyANJ0ZkJfrOhMTd02+UhmXRvK/pq1KDnGsuBBmzY3Vl4qAYBprBkXl?=
 =?us-ascii?Q?izrQ53d3gapF+7b+NIF96vyewksunqHvgqYVnQ3LZofhLZvd/A+FuXmVNMe4?=
 =?us-ascii?Q?yyfMY8bFmHNFiA/JqauOjaMo6bKq6r6t1YBkcIHXp6ymSPw/In8Tl0ZAPVUM?=
 =?us-ascii?Q?n2KbtTjrc0WIzxlBXrWGQd5C2/eaNDl5PEkFSJT9sXWamU624pyNhtha4uHh?=
 =?us-ascii?Q?ZrAsZuVTvHYsJyYjD2uL9b2YRKB0Bs2vhoA5/JFdc/35gbJg0pevKSjOycIH?=
 =?us-ascii?Q?8VEapWwrJM8GWX7Wd/lvr5bN8l3gPxD1TOEpDkCAbCepQePOa/nS6DVFXryy?=
 =?us-ascii?Q?TDkeldThODshOGE8nORdSgxKKlQN7hBmefPBeEtSAEY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b645323-ad7b-4e10-6069-08d8bcb8d5e7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:28:52.3508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOYeRK58dmt8ygsk+Hon7aXH+jYZtJs/CqI66xUTrhhg5W7S6vL0irc0WZhizCmPAGVMgqRINMFPijXb/SXQGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
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
index 6301f4f..31afdf6 100644
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



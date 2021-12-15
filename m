Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B89475BF7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:40:40 +0100 (CET)
Received: from localhost ([::1]:45090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWOV-0000YA-44
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:40:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKP-0005tK-R8
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:25 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKK-0008VQ-Vx
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:24 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEKA5H010344; 
 Wed, 15 Dec 2021 15:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Nsg55cWonSTJ2WAnYrWfyzuLAoWnpcBTa9+mC+yqQio=;
 b=k3wmgMlaDtl4nnNQR3h3YfSOcxsn2uZhkuVklffG9ZlRcuU4IOP7+EgaVRh16Md8fizV
 JPJUlcnBDLLSzWLuYL5VrlLDNo2H6fglLHFQCBmNFeb7gjrgH/v5tVhxPNeL23jcfiIu
 Y4laUdStn3lJlDhZAfKtFV8f2EiKFPygYsyl48R2JSDqcewbp5xa0Izh2DYSVrwtAB0H
 l2994LjD6BweX4AzCIq1JzNHVnUd+l6StbD9Pm6EqRIjRgOW9S4lA+3m5/S+53zS8qn+
 oi3NSlD2rlLDZXzwT79s1tkmrQLfYnKiTNJQVZ24lAlEWh0Y6/ElLkcpL0q2rMpVwj0Y /g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx5akey0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFViMA127851;
 Wed, 15 Dec 2021 15:36:18 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 3cvnes2d2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkVey0v2k6/wEFPiw27eFXwrVQfI260DgnBWwQZSjJtY5i9qRLelJ2evsJvcJMG2FoUy0LzEXyMjMNFtIxhluZlVXeFIaJrd/UM0AGkeDCBXDxLubxYXAwnLzlOugEJ7kuVE5EJFRruiVP0FG8vq15V5ohosXFH6KoC7ZivYhtd3See8AX79OUz/FDx6GnD74E+lIrfTr5+2dGzPQocw63edlzJhCbEjbltg+cocTOFsqDvtVNNuMOEOjLmRwTW4U/1P/bFfosQSKcJ4lXz8ZkqA29Zo1toTIsPbLUwfGm9FGC2zxNe40DAoIpUTH0fV0qsXAMdpvLerBFDh61lKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nsg55cWonSTJ2WAnYrWfyzuLAoWnpcBTa9+mC+yqQio=;
 b=B3zbf/ccnPrukFyVg4usNtR0b00k4fb3obc2dmU0kavfoanN5gDasP2dykwuLJyQjRY4PztF7/vylBgy6ZI9CtJtNXIVJN01PqhGkaGNyTp5HUXK6UzDo3nZn4POfziDpZfaUzBp07oiwuFqu+wmy2DbDis8FH2mUf8crl4L0Ckp05sHtGFZv+20eTTDwvDoAAHwHmMTZb/VVvSAKWV2wiRJp7NKSX4F8xcmXvzQMN7T+C4u1M34VmJ5bAbHxRZu9w+/q6dTO02LKcbPImd1m/Cl2KbvbWgPqG5gc3yMRXktQLvGEwoTsmlLEnFNb4T6McxD20w8qrQMCXpmSvt14w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nsg55cWonSTJ2WAnYrWfyzuLAoWnpcBTa9+mC+yqQio=;
 b=DMsGro52BlCP7eLJfnH9EBrX9DIAZQ0fGMr1PycJ3WxqbLy6qPj+nLMfII483U3OVqUG8N4zc+bpCjBa2e1EVvPbxURZwAgeIFNn/pmx2+PckaqMqt2IVq50KTBu9W7EGOuMrL2rJFLFRM6AGJsKIo9+ubpsKyIe5Qe1KLbr0uU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:36:16 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:16 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/14] vfio-user: handle DMA mappings
Date: Wed, 15 Dec 2021 10:35:33 -0500
Message-Id: <2c9baf82a342cfc4ff3d35e017908b9050faf409.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 390eefac-8010-4142-1ce7-08d9bfe0a1e7
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5282874362431FA0398BB1F690769@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: axm5KJfkjwv296AtEd4T0+mAyK6IoXAx270WXAj00len5fn4iG/Wcm0IRrND2fJC6my6PKYfMit4AmFdhyioeuCH5j7pBr0HXvxxs5+VT07FX/lModi/PNlrB3+meKkQ8xU1o1MR2z9EGbTGL53KsIutsWkNnCo6AopsQqB84z4WkWZvyNIUrMyjZoKzR1X4Z20povxU8+wScF6Vfssc4j+tpPIokXNYVubsr8YH2/U7C66hx/qjKN8apSGs6k15YHuN6vHcs2bcIkIci5oOOapwpI7EdanwXXwru+5lRuI2p5hfKitodBoLjYz0AnthGgujb4/skvagR7kNvdlI8K3u4WsqdlIaGXFLfYDvihdNNoRqqNMprC90GnInok10OC2EVmztTob1C/cILkasydD8NmdRZCXGsYsM8vG3og6hgqUCAYRk3ZdJM7A2TlhQmvZelZBXKQR/reSdTk5ARjv8SgJuXPap2MBE3c44iBgwDWsTksz/zO8rfhXBGIe+DuvX2NRzmsudRQiZfS7Ozu/nQA27cgF5X4Fj0kKTVwqWs0YDPmm+SP0pVEH4LtVQTT/fNAXswglw6MUtn0tfzVxiOooPX890TVnQKLcCtmQ7A581ZXW4qpQ8OCRbqgio+EAicfgzTTuJTijU0LFx01KuQrAM+TKeduiimodympS8aVwU/kmMfHxPXSCru/7WQjyd+1TpJJsC5YWc7MpO1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(86362001)(36756003)(316002)(52116002)(6512007)(508600001)(2616005)(6506007)(4326008)(6666004)(6916009)(6486002)(7416002)(107886003)(83380400001)(8676002)(26005)(8936002)(38100700002)(38350700002)(66946007)(5660300002)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IV+9Y3OOexuaE0330T8vjyAeRiiDqBTO+SLWk+e9wTahfDB4RNwkxcF1rLTg?=
 =?us-ascii?Q?dBHc7DYuXxSxkcrSSi5MAJCKtmSRe6VyWicQ86tMweIdfJkuW1LcFsTPlgTo?=
 =?us-ascii?Q?FCDHrHL7hXzyXQDQA4Mu0XD8IvFPPa5/ZcUQr/HYn8u0stFIFoxpjXRGFPJc?=
 =?us-ascii?Q?qzT47hT4BEBho7sj1IViVdvC/NmxdrZgZvAmXmaidPdmGtCZVp2EXjbCXdFE?=
 =?us-ascii?Q?bOmy9pJO89S7VuUfaQm97qvEN1CfVZnNUG8vpYIuSdoxKwfMpjPe/WD22vid?=
 =?us-ascii?Q?L4vnsnFyYLxr+SdSIppH4oQ2tBfKv4OqbkdpUaKJF5I/5fwsaHBgB4r473ZX?=
 =?us-ascii?Q?YBhjs8RRdz9Sn0kgkoganw9VfJ7+MGlLmiDLCwZ89BOf5sa0oZ0941aECHZD?=
 =?us-ascii?Q?Wx2GoEIs9NAwdqHPnHjP5R5wIVZivtg1TKz1DrYgzrxxOrKJ9HN4s9lNlsb2?=
 =?us-ascii?Q?mG6Ah4vkvMjHvXK3bGbzfh6rpXGK4FEG8R9s2ITjQ4ORaOQ3PxfKmMx8kDcr?=
 =?us-ascii?Q?2mV1Y6etbLKUQIEMI32mZBnkisGX18S64f5NE4c382Y//t2mn/gsVOv6+dwx?=
 =?us-ascii?Q?t5ut2TloNhU7arQELG3J9T+KdQw9ODmjMd7yd5/VYyxeW5tf53cp5CMSBjv7?=
 =?us-ascii?Q?uZi70gWVIzkWwUPIQanDQbaFRB3iGtz7xPz60SQ7Jxv42vkpbhBNNGtW/MKp?=
 =?us-ascii?Q?7wU0rxPqXeyZbeXQrcFX1ID667hi21Y+2IrZ7efi5nsz7nMZoUycR0tuTXsy?=
 =?us-ascii?Q?9vyxpAUZO/nxCzxEoIvRs1miq+GG/WPbZIORJdXvES+r+tISFEuQQuhQiCrV?=
 =?us-ascii?Q?IaTkvilzHwQ6ZfceSbXesPZXjK/G4wWD6gQo49ucTF+7PREYaPacMNHYTChC?=
 =?us-ascii?Q?jfLMXvdtAyOKoY4iELCDEydCRDzO+EAKKCfkUgpzJprUoCwBcn0M8hhBkoUh?=
 =?us-ascii?Q?xAw+y9C+E4D4CIprPwUx88fG1IylQ9knhjNKiWzBEirqg56XcRjztXtHbbzX?=
 =?us-ascii?Q?URpukwy9bm8hjmf4yGmB2POAB5ffTzIqciDz7h/GEBwCKHPOE55f+WwSZ+QH?=
 =?us-ascii?Q?PNFCuQ5knODHsEyjO4SdC1ORsbD1t9QxtHp5F30YegHQkjBZ9Ob4OT3Lfw57?=
 =?us-ascii?Q?MZluR0EfMbRvfDKKwNeHKdVE9TqXtGlLCgNu1bRqf602q+JIjvUScSPBQsEa?=
 =?us-ascii?Q?qn+TVEtxNsC3IXjL9wGxdVBWuoJY4S0O4EmvcpRx2GrtbGTq7Oetmgl+PS+U?=
 =?us-ascii?Q?ljUpbDqQabe8iKmn7cGcEMXYVB+Ow89bBJxZmo3ars/umjU9C4ioOkBxZfpG?=
 =?us-ascii?Q?4ZkobDqUfZ9LdQvZKi1cSnGHXOOTV5B3o9pR2oyoLV6O5hGTIEb1uw4bE3Dy?=
 =?us-ascii?Q?bEj9/Us+UQlUqA88cAwXStWAU3NiydBHvYsOYqSxwWy3X86xslpIGruGe0Fj?=
 =?us-ascii?Q?de4Rnzwv/kh8SP2AXRwKxD3lt2OsdZmMOAqXJjWXbh7D5lDsUEvmKcUfXSb3?=
 =?us-ascii?Q?tucCPcfiS4HP17OJH8n+8UIvu74xY8KXSy3PJiq5/Y6coI/hdx/B7WK2IG48?=
 =?us-ascii?Q?OrROUhkDlCfFdkDiXos0u/wJzB4BxQEvvgt8Zu3w5VVJUljCnVMyN3rXCvf5?=
 =?us-ascii?Q?p5TFhuGkkmr4secRIZ5xFCM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390eefac-8010-4142-1ce7-08d9bfe0a1e7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:16.1211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXVYhoz6KrU3U/M+RAhkoGjUCyCebELBdMwN7TeOCa1HhA7wDJwntXHNXBFkZ80yHL9boiHmGIaNLC8XRaltHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-GUID: 9Tl74gekw-G6D1a5ulmne0pttdRlDSUe
X-Proofpoint-ORIG-GUID: 9Tl74gekw-G6D1a5ulmne0pttdRlDSUe
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 48 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index c6d0c675b7..46f2251a68 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -208,6 +208,47 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    static unsigned int suffix;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("remote-mem-%u", suffix++);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    memory_region_add_subregion(get_system_memory(), (hwaddr)iov->iov_base,
+                                subregion);
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return;
+    }
+
+    memory_region_del_subregion(get_system_memory(), mr);
+
+    object_unparent((OBJECT(mr)));
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -289,6 +330,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_dma(o->vfu_ctx, &dma_register, &dma_unregister);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup DMA handlers for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 2ef7884346..f945c7e33b 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -7,3 +7,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
 vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
+vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
-- 
2.20.1



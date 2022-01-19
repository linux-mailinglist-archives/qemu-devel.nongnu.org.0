Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6524942C8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:06:47 +0100 (CET)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ6M-0006Ob-IV
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:06:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjc-0008Kw-RM
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjY-0007Nb-Kt
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:16 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJOXZ6031213; 
 Wed, 19 Jan 2022 21:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=qyXgyu6ft4LhzYhUJcJExV6EPLFtpxSDTSE9Zfc4B0A=;
 b=AVQ5T/VF/8jTjnOi/GyABzsDqbkruOJMtzhbrr4MISkHA2XhDxGeWDQr/17Y/mTTpqIY
 U6bz1dWwe347HOfsyN7Xrkrh3nVakkR2ul+oK2fKSu44LCP1Qyoelka2C57kHXRkP88N
 29vF9uenUzgbsllDpz8ib/wlOD6ARO1iiRMPcLisuhapQuvZYIDG6kD5qgxyr91Vkt0B
 wOu11MlSV6HTq1446OQQMFiWJkZrcwfFTHUB4X+iKryUV3n8qQ2lGb8+v2Kyk4Of/WyG
 0QJBJcH9bJQotZOj2eshB5bBj9BSVgA0qXtvzA8+dFb/wXKnPEsrIVy9Z4JDcDEo1QqG Aw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vpgq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLauA8147048;
 Wed, 19 Jan 2022 21:43:08 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by aserp3030.oracle.com with ESMTP id 3dkmaeb75r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRTWdUOwGbWh/WmyP/EzkBAEpw/BuUqC1rKaT+/qkuXwdD5yrjd4r0KCcofTEIl2XucaTgk9xKrUu6XlE7rLdqzVeg1HWD93i1kIOpcQQl3eaymYdKiYuem+Lk/yxemENuMez9yQgk2yAEQ0FyQAf43rgbTety9tf4A0zUZzeVFRtGnjT+F52ZvuCrOFp8vmNEKoE9TLwTd17kXNT+8uukJj96pJVr1dGKrhoIXv9i/gwe4NAXaJrsWURDaaQQvVBwHWev5E8lwsl2f1oB/ooWPvTQgGQC3GXiAYHbg8rpHLNQwdOwXo471vymxTCTf7/nUFHowQv25N9pYhaiEuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyXgyu6ft4LhzYhUJcJExV6EPLFtpxSDTSE9Zfc4B0A=;
 b=JBxKVQDErpZnABOc0uXKobwivSZKTjx1zSTOC54z8zf8lwXSr9EsDTIV4QgZWlcTwxOiRpZWQHmNq2CupNpZ5CIEoQpsLjfBp2grv6OSzfp4CF2pxJzXXzVzX1hL9apWBY7b9s9rdqcofyUQXmyvj8N5QO/vXITJ1x+8a2YNJoMGCB3yb5g2nBoj5UbAKXqFMRgpaPuA9n+yTzkKkfSyZEetOoroYUnS3VulMkMEjihmZNEIt9EP0VIO9hNs6F5HkQPSqJkGATU+5es6vudx+0Og8uJ8NatuUBQ0DlvneDkph6+Oy4IXHl8ZPpuL1M+eU9PiAqMCpRKa6YN/TbSaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyXgyu6ft4LhzYhUJcJExV6EPLFtpxSDTSE9Zfc4B0A=;
 b=jsnw3rR9HddtNHjvSztc4qKfzT/OLR+W0Or21nQeuqEkbTLt6mOO+WwD9qWRmDZ0UT/n2hx/tUxDawrsFbRzuvfbDTd+gAxzoIF0tsWpyoQaW4NH/l8J4waXEz9MWKSlnnj9W0+vfKyollPi8u4Bbn8inxcq/nsF6dP32mGBazs=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1497.namprd10.prod.outlook.com (2603:10b6:3:13::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 21:43:06 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:43:06 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/18] vfio-user: handle DMA mappings
Date: Wed, 19 Jan 2022 16:42:03 -0500
Message-Id: <8d72691373f12887ce4ec3203e74ed0ce860d1c4.1642626515.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: a1e23e79-a114-40a8-dbe8-08d9db94ad3e
X-MS-TrafficTypeDiagnostic: DM5PR10MB1497:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB149753787774E7D224427DC790599@DM5PR10MB1497.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jpDig/YuKXVn/ikuZ4wSlDge703QviSpu8IxL6+qn5Qh/sBfRuasposBPDSCjb8BcoiWFdrTTPTz9+exZ68zMaznwMnjzc3nOOx+j+uy7WgINqm2c9DOsb40LQd992TQHdf3X3/vxxHHGI/Hqkj1ugdiBGUUdfM4V81V+12ZMwfjwsgX/6c8m2+GAkDqv3tMWN45xzJ1uUfH9r4ozy7WioD8kf1t6pN6aeEBokfFwBJytJlnVAwHBC4dRRgiiYXZQC0zXUG3OYTp+JHPmG5vWCW87SWkVrU83DqXsHmby0et+yK40Wnc+avakTSR4aw8m9Dbs+FqP0OAtZPebmV1j5AXBUQPDZ5vkeMPhLlW8xFH444k+EE3DEsGk2Hj3CEGrEZyNlwH0Bsu5pDmdEl100Y2gemShvhKQF3cFx7w10I2/4vUnVfquY15xKL6uMvuC1azVOOciwkCv8VpZl1BHSHS6L5tNqiOcTXGOKNOK+UjAJj4VNztCB0crAFa3p+Nm9FcvpS25zSWAhBVTo8DpsAr3IT/hqv9eZU3dTcntvPI9WTNdT59XgdmTcDNE3lF6dL4DHOPkkA4ELMVPs1ZS5Yt6i6R2mZsrACXWkiWVnoL5DmzvNDU4AISu3zRvz6mvvt2Kvb34luuxLXsP2vfPcE4jI/yvCahkwolNuUD4XsKXBGG9rKX/3exTaNKd/nQI88sP9cMY+E6swCWJvHYnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(26005)(5660300002)(2906002)(6916009)(8676002)(86362001)(4326008)(36756003)(508600001)(2616005)(6512007)(83380400001)(186003)(8936002)(107886003)(316002)(66556008)(66946007)(66476007)(38100700002)(7416002)(6486002)(52116002)(38350700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nBVm70Nkce497AtL7z0FbDOriIBFZvWER0UleD/+VeVkDljTYmUr37bZAHex?=
 =?us-ascii?Q?3U/dFvrgKolSngIgnz/tb6m3Qv82hnift2j87UQyJ1KgFJ5+AcLtr6mBsNK+?=
 =?us-ascii?Q?0CbBC5e6zXrhmQRFt8STMC7R44Y7g5nZygWMkh4z92sBrX6ak602WyiP89yz?=
 =?us-ascii?Q?vHwulS09NT+vgcD7QTX4DfS8nHiJ4I//NwoqeM17Nm1fo8l6EQGdgny/8WtM?=
 =?us-ascii?Q?eCzzOsjVMUy3tvD36Irya9tRjaKgHmEr7qMkk+vM8Rao3kCCyuaERxOkQ+IV?=
 =?us-ascii?Q?bqsg6h7o2WVRvzrFzwZTkRQVg1XumlEDzPV+01f6W4oHGaoFb0HVn06y2r+9?=
 =?us-ascii?Q?MyDQvnU/hp7WLC2zRP6XRU5tzE+bRxROlvqFoS9J8TlHkwU6pubVrWWsQ/WT?=
 =?us-ascii?Q?5ozAywTiO3vUX+Hw6bg+5FXxz6cv3CTnrtZm6rTd5bqcp7xJt6cffzV9dx6f?=
 =?us-ascii?Q?VBDKrzl44zon/9EDfzLBpnb0Dy9Ku4qlNVHvePAoaaM9CBFCzEIB4/cMdIT5?=
 =?us-ascii?Q?BXALWsYavRsJYMI8lo3EyjahQuURBlRCwU7tUPXy5LLjiMN/ah0duq/ia0qB?=
 =?us-ascii?Q?l3GcQ4nUhhh1vSpMYHJcFOApMfUEVX3lumTT1a5KiI5gZlm1b5FjfkHZt2F3?=
 =?us-ascii?Q?+SK7uWBBJ4MZBfl4sy1U7z1WDE8JhFYRqx694eN99YYyWqBOvb+Kkb491/uo?=
 =?us-ascii?Q?0Sa+xTcdVpy2mHykOycxpAjeEuIXtZlAdviE1BmxEIZSnJltMZHW5FBiBg7+?=
 =?us-ascii?Q?x9gHzjL/xYeqnuJbqOyeDJhVcz6r4vcgs4o8MdW4HSAXlbBrmp1DjEIqOYx2?=
 =?us-ascii?Q?quHUS8evSHV5mC6666wkO8bI/MjA3i6VsgLbVxoPPydcwMPmyaAjX7ewI2xs?=
 =?us-ascii?Q?cQp4SSGnsIF/701nUcYzaCXBUVUBxtB8O2b1rPWJN4nCFBlHfBvOve65wL8U?=
 =?us-ascii?Q?GOUmgJOt5ErVVbPVSj0koSsq3f5t+wkPysI3bhRLzIyPWMooxEa6TGLfdQS+?=
 =?us-ascii?Q?Qs2MvB8U5lfB5iWPxok58idEaJz1yq7EzkJatyhbwsdrDdIrXTU9k34DXMmT?=
 =?us-ascii?Q?l3w/DAWce2QPKJZeQItynlCwW6+B0rEtXQVC93Jq7Ud6FIgXW9kuWe/UzQeb?=
 =?us-ascii?Q?L7y59wpN8a+YlF5OKIz7D8axRhofCEbTMQ8epld04OlHb7ffQdpNqoi3pXzV?=
 =?us-ascii?Q?sMhKK6Eyf/0jx8fpAE0y2RZNxeffoQq/he5Etu6ShWQLL90YzsLqh10NSegw?=
 =?us-ascii?Q?4pwrx5Ap4ZRYyZoqkWPw1y2ifVw8I4dJ8yNwR4X5GLWW+K9uDOphUErYj7XH?=
 =?us-ascii?Q?DkqQ29h9QVHkLwvZcTXbRVbCqQ3vcD78eTB47sWkMTD+JwKreKmA8QQPhydd?=
 =?us-ascii?Q?EcNUHfVnVy8yZuT1FfPfdXdz7vennP4mvrL9CIecr9gdcLDGQ6JS5XKh1Wvg?=
 =?us-ascii?Q?wbmwgZsoFsVDO17ie1qFCQ0uND6vGV/1Q3H/fSjkkAdqkKD9NzF8mWqZ/zQ6?=
 =?us-ascii?Q?p3EvSk0zuO7/eR8gyBnha/xY41dzBmGZDXGQ0++yHopwjaazB5+D3yp1DsI0?=
 =?us-ascii?Q?9msU/5LVlM9iQZn4Powm5dkW55CVXmn78xjxRGcwIovP5kxPnaI5PIEGei0f?=
 =?us-ascii?Q?S75RiLS+/c/OS4kFPgOc+34=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e23e79-a114-40a8-dbe8-08d9db94ad3e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:43:05.9575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9yz3R+/C1RUVRTuuxkwoy0aEBLfsRUhzqJu0s/7bILVJKsOTB3GI/WsYsQzm4VvZLCWVcR16D23snK85B+XcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1497
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201190117
X-Proofpoint-GUID: boXgJ5mBpJlZWCK0GI4oDtCN77v9eS89
X-Proofpoint-ORIG-GUID: boXgJ5mBpJlZWCK0GI4oDtCN77v9eS89
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

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 50 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 8951617545..e690f1eaae 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -248,6 +248,49 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("mem-%s-%"PRIx64"", o->device,
+                           (uint64_t)info->vaddr);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    memory_region_add_subregion(pci_address_space(o->pci_dev),
+                                (hwaddr)iov->iov_base, subregion);
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return;
+    }
+
+    memory_region_del_subregion(pci_address_space(o->pci_dev), mr);
+
+    object_unparent((OBJECT(mr)));
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -336,6 +379,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
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



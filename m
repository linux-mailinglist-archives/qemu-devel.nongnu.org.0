Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F60507B33
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 22:48:41 +0200 (CEST)
Received: from localhost ([::1]:54156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngum8-0000jJ-Uj
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 16:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngujB-0006D2-Eu
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:37 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nguj8-0003QW-Hl
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:36 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JHpmTx009092; 
 Tue, 19 Apr 2022 20:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=kWOXLWRACCUpI3Zg0gu1Z9iqeuf4i+npHXA5xgJb3UM=;
 b=0yxDSZqIsIVF8Lz8/rNurEDVRlf4LO0xechg5xf3Z8eLT/v6sqVWgPNnTFOT9+PAKpsZ
 EVZDCW+IORLVFb7zEjNDjUCTvMO2kCACI8lAVLGO4KgUj3lkRuA0xf/XXokJBJOs5XHr
 +mzzLS52qIMVcSXjNQHC+IneUC+OygK/8EhH6Nk7UCtAlsOnHUjQ32aMnBi1EQ9b0zv1
 6dbhOqUqcA1QxDJbLeYA2FMjDI+FCNbrJ3pVn864CIxhyo17t3I8qx/cZ4XHSnIIOFVk
 LMq+cudFFcnBGB7MLwdxnPTT3cRX05JkphUaWlD+2hF6RkVfnMRzkmFP0MqjRk3ci49/ pg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmk2q7ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:31 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKZhng016854; Tue, 19 Apr 2022 20:45:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm88sps5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACf8of4GxMUCUI+WNFGra8aHbhl4JjGOt8bKBHuyElfezYgeqS3YZWU4fe+8Yx7bTH7U1OSb+Iuf41+vHjA2N0iCmwCa7aeh1BHjHeZYe82qTG6dpF8DmNPjmhevff6MEHH5ZyB6nRjm+L4WWWokAhm5dv/aQ6HhxVUir7B5TElYEjxDqY5eBua3jnl8WFY4T7uu2D8j6Xo0x8nwlS+EFhBxySusPHAryWfuFG38MjzVdiNkE3cXpGZF8kr8xAUL99vjuR85o+6AU+r4qL7sdfE0kzQzO0kSs0hRiXBEkcHSTTvFf0lTOEFK7/qV9LXe8yCzZKZ9+s8j6P1sG2lpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWOXLWRACCUpI3Zg0gu1Z9iqeuf4i+npHXA5xgJb3UM=;
 b=cWjHhYPKYAG3qkX1lAROlIZucvAIQraEPCyioLkDMvRKOBYrEVhtY3y8KhgoACaO0bKsgx9r8rdtfWmm0qv7g0GDiTuJXTz7MXbpv3Idnvnm4Y5kbSAaZHDnF0/L1Ye2fNLLusOtETAhSthc0YD1F3wOqgGps1FbwkKXc6zsixetVJKQACihSnzAV4LrdG8efqcPbhyr9VZBdS3zbLwmGQEwewc3LUjqHLq2YZ507xdJOokhAX2+S+EfVkFTBBroOaxVoMenL+ghBBmbwivPGLEVTdixYJwaflhGGfr/xJSTGXhfIXBRdoWcqAfTI7Jml+5SK6Knw3p5D4fsPV8eQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWOXLWRACCUpI3Zg0gu1Z9iqeuf4i+npHXA5xgJb3UM=;
 b=biU7dRyGFGQXHL7YguV6atEOp4hswtEqH+ZnEVo7vpeoBcESwl+j2CdKmhQ/cRSWTa6ikf4oibjdCWx3gbx6R3a84xWSZ41lJlShS3WkY8AHDVaptoNb289R00bjlpHb8L3fD1ubx6cAY4GkkYjNe5kFKys6biaXDO/xW8VX7A4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:27 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:27 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/17] vfio-user: handle PCI BAR accesses
Date: Tue, 19 Apr 2022 16:44:19 -0400
Message-Id: <b01b6963d6d342aac6d715aa83695e7998826223.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bed26a67-f206-460c-f115-08da224588b0
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1998AC593508329E946F239E90F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqDpf1uLJbXQug5fX7AkfkGsosMqPHi6mz3V/UXEfScZNP98odkIpSmhoMXXBpGlE0whl4YHp/IIkBpo6NprCXWJar2nkwRX6KMTmGArZVFYWmqKaG4m1hpIFknn6v5VylVxx3pACdhnDnSWyZY8sH0VxGPxODuxRAUMTdonjEP8A4XGyheps65g6uXUh3bq4rfuYzzgMe+/IamOtzGLbYyU4JWM7bBz5p2qI0VAhnQU25UnmVXMQtKET8e+l/yrbMb4LQdGqg12VzwB+7UXETsxHc149rrtIysR+uW1taPGBIYoVofISSEOOVkZfBvS+yNWTBJi68cLaxNWf15Dbfv+YqE7KuG+LjxEaPTH0MpL11gRv60UTxuCRytKgzxNpLmM/drsBO5SDlP93NAHO80qEACSo091Xo7zI2XbQZ5GWwQdFOArW4mvy0Ov9CfbJHspoL4BK86D53ywymX9804ZUaYntSEoqFv8BYlr5qcqBBxDCbd9Htz0Hlovuv1AJqm7cdIA/xmvwLKfPO5XwhIRuLraVyX/W2zpu0OjY8iFTqah3NNMH9zdm9bh5SAiBH13kGdMvbzNw8KEpxF1zgMuHvIAt/MUBNMeu4gBK6xY8exCp7RScDTtdgurK4MNjA8aClPBydLrJSvml05SKZlNpnKAY3QxIDK/ZdQVb2HFU7wW5ToxZgy3jDWj3xBn6EE6oPXn4e8lsKsgf11eNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CTK5rMCVMmkBcQV+DTj5GvkRgBqU6vxdwYA6dP9yoTtNq3gZy0KigF7R+roH?=
 =?us-ascii?Q?Wk7vIEUvmL59/aUJoN1oIcfVz2VNAsIfCPM1lzaqUJpMAqUVEvo9p+tpUxqj?=
 =?us-ascii?Q?I37SKEAb8qCBKReW758ynTQALxF0UDxiPyzuBNflf3PySVlqPZz2hiNEd5FS?=
 =?us-ascii?Q?yeS7ZgWQnNHtvDqC8FOY1ARhW3X8ieRkZvcRPkTLSsRvZILbNEUUh66yYuAn?=
 =?us-ascii?Q?GuXVX9bxH+92jd4/iZjP9Li4PtdLlGeSh2zKEBnMV1WDz2vSeuiVX8+vlWNO?=
 =?us-ascii?Q?FmJaxOVfKfXruz0ml9I5W7+uQ9g2Fn2EzUfb995O4Li3X7waNKL+QJu+Dp/K?=
 =?us-ascii?Q?yy/wv/SdwKYt3MB+FT37Ufu5cEYY5vSGgNyRtrB0+GnhSQGd+MK8T13BOQc5?=
 =?us-ascii?Q?kLzz4aayqzhWQNqsS0F3KdW0EnZZCxRoUGHSVF415ZndyNohkU5DE62YOGQp?=
 =?us-ascii?Q?HBn3VpY2xWJVivp7JfAlrtfGPb4iG/Nmg51Qgm8zrKgJlTyjXczvrvH3KUEn?=
 =?us-ascii?Q?jKiweThSXyvnGJ5adUGC5NcTGYizIkwnB4QqcXfdzsbmn7CG62t8WHALPI3T?=
 =?us-ascii?Q?OEiEbgnhgjXlkjtGPXklZu3pA+AJD82jPeZrMYORG5bjmgpe2IHMGLEAWwCC?=
 =?us-ascii?Q?e4ti3VMa8KQTEkKCsGvUiHwsxzAvE+tt2FgtyVNNUmVoKAPDmEbe5bgz5+t6?=
 =?us-ascii?Q?AflYfII7odosxGavKBJ6ayIczE7TEqEu/jgCjbVOMIklInWL/g33R0RYKyJK?=
 =?us-ascii?Q?G/3mF4JuvEOPxfORFZSftzAQdY+QWAQao3zbABET4TMpIeTm15xPSXne5E1f?=
 =?us-ascii?Q?TzIz5jc+0X7MEHrRhXp0YLTseH21/zbeC+UElmH7SUBFrEckupY5G+EIdgUP?=
 =?us-ascii?Q?EvK++52dmTTn7igBTT4akIu+90AsmIinn+10zJ7A3Nm3vAfjoVNkZev+4p2Y?=
 =?us-ascii?Q?qy26fqMSWyVd1D+P4PMjm0xJst/WesoZfRFO4LlAgrEXRnveJve9FH/n7Y7G?=
 =?us-ascii?Q?vUpVHCpMgY0+/pwAjabfGPi9gmmBOJn5DtoLZj8HQ3lJB6WeSFamv5zyeZce?=
 =?us-ascii?Q?8yrdpbNSDaArTgM4alALqh7LmGXSb+sxciAWL+vmVMt789lbtPAvIc6iyZ/M?=
 =?us-ascii?Q?5DInTU5k4jnU1xCLgcR+V0dg5ST4nTaYciMctfAe6gyfZmT7wlu9KL0xkv7A?=
 =?us-ascii?Q?l8W93BsmzROGtE0BeiR5JAzghIB2rIVl/6FEpO8UUoQuXvE08NHJY3/MskgX?=
 =?us-ascii?Q?ptmFHqPkK8Vyjf+UrIp6k9ZJcfHv0T4OkKu9099m8gIH1yppWL7Zyd9WMOum?=
 =?us-ascii?Q?2ABwMpoVHfDaoWytPrUJIYdst8A7fKQ5veRHKQdVr4hQz5UDYjxV/+x37wyT?=
 =?us-ascii?Q?XA41mQYdpTHi2t0cowRZYo8W682uKPnaFALx4NchZwJ0YG31mDA8ZKsBJAD5?=
 =?us-ascii?Q?VSrbR4O/EH9H2wvpu1LunhsiM6TBChRUBSxzT0zgxMtncRjoTM5VtHz475zv?=
 =?us-ascii?Q?DhNtPacoOIr1BAayNX8Z7fJASmZY0u6yHVCa9S108F22QF4XapUjBRbefDSL?=
 =?us-ascii?Q?12ud9r5kIPVe+PYPRDNWMACb5Y+dfxc7nq0wzb2Cyzk2pN/sHFxVSSKUft8r?=
 =?us-ascii?Q?xqx4yn3KtHy7BhsmyFYn6ThGWIL7u9BWyn8ui4+XAskG+XMxi3YvqdYKuvlk?=
 =?us-ascii?Q?FfSdgSKn3wKohi0TMiB/TMWZ9qHUanZ9dnM3XDTgo3GONBjFIJGNt93Yv9iV?=
 =?us-ascii?Q?u2xHVBIeUA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed26a67-f206-460c-f115-08da224588b0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:27.3668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HLaD1zbkmbXOc4dSkaNq8pZnpxrp8Omq0RtPR3LokA58eZeKYu2m2vLMFz54iLsJ+Ofubs1CFRqXnwaekFaxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-GUID: HOqQuVI92OLu7XFimoHa_psZiu5qalOI
X-Proofpoint-ORIG-GUID: HOqQuVI92OLu7XFimoHa_psZiu5qalOI
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/exec/memory.h           |   3 +
 hw/remote/vfio-user-obj.c       | 189 ++++++++++++++++++++++++++++++++
 softmmu/physmem.c               |   4 +-
 tests/qtest/fuzz/generic_fuzz.c |   9 +-
 hw/remote/trace-events          |   3 +
 5 files changed, 202 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 4d5997e6bb..4b061e62d5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2810,6 +2810,9 @@ MemTxResult address_space_write_cached_slow(MemoryRegionCache *cache,
                                             hwaddr addr, const void *buf,
                                             hwaddr len);
 
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr);
+bool prepare_mmio_access(MemoryRegion *mr);
+
 static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
 {
     if (is_write) {
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 425e45e8b2..f75197cbe3 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,7 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -324,6 +325,192 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
 }
 
+static int vfu_object_mr_rw(MemoryRegion *mr, uint8_t *buf, hwaddr offset,
+                            hwaddr size, const bool is_write)
+{
+    uint8_t *ptr = buf;
+    bool release_lock = false;
+    uint8_t *ram_ptr = NULL;
+    MemTxResult result;
+    int access_size;
+    uint64_t val;
+
+    if (memory_access_is_direct(mr, is_write)) {
+        /**
+         * Some devices expose a PCI expansion ROM, which could be buffer
+         * based as compared to other regions which are primarily based on
+         * MemoryRegionOps. memory_region_find() would already check
+         * for buffer overflow, we don't need to repeat it here.
+         */
+        ram_ptr = memory_region_get_ram_ptr(mr);
+
+        if (is_write) {
+            memcpy((ram_ptr + offset), buf, size);
+        } else {
+            memcpy(buf, (ram_ptr + offset), size);
+        }
+
+        return 0;
+    }
+
+    while (size) {
+        /**
+         * The read/write logic used below is similar to the ones in
+         * flatview_read/write_continue()
+         */
+        release_lock = prepare_mmio_access(mr);
+
+        access_size = memory_access_size(mr, size, offset);
+
+        if (is_write) {
+            val = ldn_he_p(ptr, access_size);
+
+            result = memory_region_dispatch_write(mr, offset, val,
+                                                  size_memop(access_size),
+                                                  MEMTXATTRS_UNSPECIFIED);
+        } else {
+            result = memory_region_dispatch_read(mr, offset, &val,
+                                                 size_memop(access_size),
+                                                 MEMTXATTRS_UNSPECIFIED);
+
+            stn_he_p(ptr, access_size, val);
+        }
+
+        if (release_lock) {
+            qemu_mutex_unlock_iothread();
+            release_lock = false;
+        }
+
+        if (result != MEMTX_OK) {
+            return -1;
+        }
+
+        size -= access_size;
+        ptr += access_size;
+        offset += access_size;
+    }
+
+    return 0;
+}
+
+static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
+                                hwaddr bar_offset, char * const buf,
+                                hwaddr len, const bool is_write)
+{
+    MemoryRegionSection section = { 0 };
+    uint8_t *ptr = (uint8_t *)buf;
+    MemoryRegion *section_mr = NULL;
+    uint64_t section_size;
+    hwaddr section_offset;
+    hwaddr size = 0;
+
+    while (len) {
+        section = memory_region_find(pci_dev->io_regions[pci_bar].memory,
+                                     bar_offset, len);
+
+        if (!section.mr) {
+            warn_report("vfu: invalid address 0x%"PRIx64"", bar_offset);
+            return size;
+        }
+
+        section_mr = section.mr;
+        section_offset = section.offset_within_region;
+        section_size = int128_get64(section.size);
+
+        if (is_write && section_mr->readonly) {
+            warn_report("vfu: attempting to write to readonly region in "
+                        "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
+                        pci_bar, bar_offset,
+                        (bar_offset + section_size));
+            memory_region_unref(section_mr);
+            return size;
+        }
+
+        if (vfu_object_mr_rw(section_mr, ptr, section_offset,
+                             section_size, is_write)) {
+            warn_report("vfu: failed to %s "
+                        "[0x%"PRIx64" - 0x%"PRIx64"] in bar %d",
+                        is_write ? "write to" : "read from", bar_offset,
+                        (bar_offset + section_size), pci_bar);
+            return size;
+        }
+
+        size += section_size;
+        bar_offset += section_size;
+        ptr += section_size;
+        len -= section_size;
+
+        memory_region_unref(section_mr);
+    }
+
+    return size;
+}
+
+/**
+ * VFU_OBJECT_BAR_HANDLER - macro for defining handlers for PCI BARs.
+ *
+ * To create handler for BAR number 2, VFU_OBJECT_BAR_HANDLER(2) would
+ * define vfu_object_bar2_handler
+ */
+#define VFU_OBJECT_BAR_HANDLER(BAR_NO)                                         \
+    static ssize_t vfu_object_bar##BAR_NO##_handler(vfu_ctx_t *vfu_ctx,        \
+                                        char * const buf, size_t count,        \
+                                        loff_t offset, const bool is_write)    \
+    {                                                                          \
+        VfuObject *o = vfu_get_private(vfu_ctx);                               \
+        PCIDevice *pci_dev = o->pci_dev;                                       \
+                                                                               \
+        return vfu_object_bar_rw(pci_dev, BAR_NO, offset,                      \
+                                 buf, count, is_write);                        \
+    }                                                                          \
+
+VFU_OBJECT_BAR_HANDLER(0)
+VFU_OBJECT_BAR_HANDLER(1)
+VFU_OBJECT_BAR_HANDLER(2)
+VFU_OBJECT_BAR_HANDLER(3)
+VFU_OBJECT_BAR_HANDLER(4)
+VFU_OBJECT_BAR_HANDLER(5)
+VFU_OBJECT_BAR_HANDLER(6)
+
+static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
+    &vfu_object_bar0_handler,
+    &vfu_object_bar1_handler,
+    &vfu_object_bar2_handler,
+    &vfu_object_bar3_handler,
+    &vfu_object_bar4_handler,
+    &vfu_object_bar5_handler,
+    &vfu_object_bar6_handler,
+};
+
+/**
+ * vfu_object_register_bars - Identify active BAR regions of pdev and setup
+ *                            callbacks to handle read/write accesses
+ */
+static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
+{
+    int flags = VFU_REGION_FLAG_RW;
+    int i;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        if (!pdev->io_regions[i].size) {
+            continue;
+        }
+
+        if ((i == VFU_PCI_DEV_ROM_REGION_IDX) ||
+            pdev->io_regions[i].memory->readonly) {
+            flags &= ~VFU_REGION_FLAG_WRITE;
+        }
+
+        vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i,
+                         (size_t)pdev->io_regions[i].size,
+                         vfu_object_bar_handlers[i],
+                         flags, NULL, 0, -1, 0);
+
+        trace_vfu_bar_register(i, pdev->io_regions[i].addr,
+                               pdev->io_regions[i].size);
+    }
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -420,6 +607,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 4e1b27a20e..f9a68d1fe5 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2719,7 +2719,7 @@ void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwaddr size)
     invalidate_and_set_dirty(mr, addr, size);
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -2746,7 +2746,7 @@ static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
     return l;
 }
 
-static bool prepare_mmio_access(MemoryRegion *mr)
+bool prepare_mmio_access(MemoryRegion *mr)
 {
     bool release_lock = false;
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index dd7e25851c..77547fc1d8 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -144,7 +144,7 @@ static void *pattern_alloc(pattern p, size_t len)
     return buf;
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+static int fuzz_memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -242,11 +242,12 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
 
         /*
          *  If mr1 isn't RAM, address_space_translate doesn't update l. Use
-         *  memory_access_size to identify the number of bytes that it is safe
-         *  to write without accidentally writing to another MemoryRegion.
+         *  fuzz_memory_access_size to identify the number of bytes that it
+         *  is safe to write without accidentally writing to another
+         *  MemoryRegion.
          */
         if (!memory_region_is_ram(mr1)) {
-            l = memory_access_size(mr1, l, addr1);
+            l = fuzz_memory_access_size(mr1, l, addr1);
         }
         if (memory_region_is_ram(mr1) ||
             memory_region_is_romd(mr1) ||
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f945c7e33b..847d50d88f 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -9,3 +9,6 @@ vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
 vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
+vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
+vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
+vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
-- 
2.20.1



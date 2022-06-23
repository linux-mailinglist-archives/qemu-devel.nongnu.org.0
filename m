Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A4A557ECE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:44:52 +0200 (CEST)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4P0l-00061x-D6
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o4OvH-0003Tp-1n
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:39:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o4Ov7-0002Ty-NL
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:39:08 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NE3NKh003476;
 Thu, 23 Jun 2022 15:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=N4x+18+ojPqS3a/fOX7/D5sg68buJQRW8rfE5ewkUJs=;
 b=KYEoswaepSqXk2oj07UD3gj/aU7pep0Bxfs3tUNKS3yZdHqhaRJGePwZc/372fEsATIO
 Ul1nGBkcdHJ6P/ZDE3l346CEWdlEwklZenwW/Gkh8HBPmrDmszPu9RFmaqEdz58tj1LM
 Dww6z1POoNu8282DrLNhq3ZjUT8AcwAEfWxweiGxM9106ENIwVJ4CHCUR604whh2OYeA
 8NMXWs88EaVWbWoe7AbVI20mHMPw4OZzGrTQd0DauZFfoErS6kyoyg4uWj9VKaRD0OK7
 nmMwUv9i2xRYThgoocKEpDnMcWg0omTE6AkmXgGCpuzPZqOxBTjtuaLrrmaDbmklD4N/ kQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs78u3g61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 15:38:51 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25NFUo9C021194; Thu, 23 Jun 2022 15:38:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gtd9wdxu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 15:38:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7PvTZg1MK59VXyLEPVGk7RjjA6ux99NIVK8bGPC+iAePpCOrCKOg7dNz+S11xWx+qTfLd8bxgUGH9suxptIxnCP5Ss4aO31RuqxYnx4hx9sdJcF/nEy+2AMkBFgjc5JmGjjmogIKcLOaDfO9FZjtmVO46zTCmc5bXm8s/+dc384jvJFQcODj2tTErPljiJXg13yYymUZ4+0ecw3E1AFJFdpXZZYJKO5MOlqtmJsmjAXMh+CDd0ka4JgBL9FcfOXqgyRxUQKRsfbcLhVx2d1ucKkwAWoi4t0gjbAy4YnEjDX+pZZLrBBbYwlr/TvU3zHY/D30s8107dZUumpMbv7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4x+18+ojPqS3a/fOX7/D5sg68buJQRW8rfE5ewkUJs=;
 b=CSqRlSxztLxLzq9nKsEClAXzyY9yCwrrjzgHD0kSpNrjC33TsLqacCHn9L5eg5BrKtjGBXgrvr+xon3aU806LbKQW0TREEQJdAH6nV3adjUJOJb7ZgGZxVgh0sVMJDW5c0Y8SklE/3qUFJuq4g00klKod086MxG4wNxqYaVTgcNhhYFVXdD7kRvSwGqm+WH25UWeETHgEa8MfIYSjfcYFZK7N64h+jjTmgFCkXPWKjZ1OHj7495/nIwhEHHyyUNMPralM7nP/JVlNlFaxxPI/UH7h/7VoZ0fPvwPE0ETr3FK1iKsD7r8UP3iaALsEpTs3JouCuPrDNd13RHJZj8erw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4x+18+ojPqS3a/fOX7/D5sg68buJQRW8rfE5ewkUJs=;
 b=x8UPuqH00FGOmbrFrbO1EYX1FhBBaX3U2hrIj/IB2RyOkvTsdz1hpJTwuuqaBQnApAW31N7utlAViJu+tx8m16g/A2IEf86LxW8fa4sIJ05pMiehXjYshenlgT6IgK/6ROszhnLDaoUkOp5IJgxSfr8LDXdIPsddA3BfgiaWXbw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN6PR10MB1810.namprd10.prod.outlook.com (2603:10b6:404:108::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 15:38:48 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::5931:4a28:ccfe:7b68]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::5931:4a28:ccfe:7b68%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 15:38:48 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: [PATCH] msi: fix MSI vector limit check in msi_set_mask()
Date: Thu, 23 Jun 2022 11:38:44 -0400
Message-Id: <20220623153844.7367-1-jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::24) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 618a1e52-1359-4249-06d2-08da552e7747
X-MS-TrafficTypeDiagnostic: BN6PR10MB1810:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g3rQh5G/rjnHYHGDIZldAz5M1i/ke6O4B2McpNGcRZAIKUnG6T/3pJMfAL0Lbgswyw/1Exw9bH5AykGjyxOTzE6iAgD+KNOKfFXhqOXStNCkSUwa6OQRo1188/0GEsCIO2sLwQDOwsZF236zIBImEPOnAa/f0CE0FRy8qp9hKQdii6pkTqVKcVt8pVNRSm94YhAop3XY6xOEZrcsR6Y1OKyk/krxKX8CGD0mnNMIFtr+chM5F0wSsQ81McjWFIZ9n3Mpu6FjrXGtDik6lsdkHVfbrEJXAPmi1F1fSuHmaqFX7CfIhv0uVl+KXBIXZgJwwwDTNln2FRlo7k5ArwmOmBfms5O8t2LxIxznxvZcbXy5Ez3AM/dDowiDaXfRWlH35ssmmP5cQKsBWNWEMBa8sD25B8PtOPQ5NkhsFIV3dUPAxWHb2UXCPaN1ArA5EDsNhPNXNy6RwOVpB9nIDbVJQ3cJ+09Pe6Lapz6kYyw4l6wSkVEOUeJmFzABSehSYrE/bVCY9L9g65u9GWXaP/1WwCvwrlttyze23yqok2ppncn5F/dCwPs2rjx1Wt+RYY2cSxLWfI7DcsUkwNpUpiWCBAQbi+fxOzfL6aeqqr3HcPsfsM9JIradwOhSm6tqz96Nto1R/1+PUqmKtb+y0id3AOwCIbr53+etlyHVahmGNxUh/9cxheoDne6aDo6Rr3fH9wj+u0tQfJFhZWDWEZJkAgd4Lsihi9qpaRZjDZJLUCSreBOklnjDxyymlMqNAA/dDzJvnuWNCy8go4IYcCMAE4FbPjsi+8XshbequHVgDos=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(376002)(366004)(136003)(39860400002)(86362001)(83380400001)(2616005)(6666004)(66946007)(66556008)(4326008)(66476007)(8936002)(186003)(38100700002)(8676002)(1076003)(5660300002)(38350700002)(26005)(4744005)(2906002)(6512007)(6506007)(6916009)(316002)(52116002)(478600001)(6486002)(36756003)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kndq2l6A3b3NtrtxYpyWInOrWbEgehmjLmGj64zOrmwe8zSNVNq4E1PAnIrM?=
 =?us-ascii?Q?T1bzWsE+s6LibxYcBOTynAovorsUNnCZxLZ1ufp4EMaUz/8X3tsM7l3FsxgY?=
 =?us-ascii?Q?Gy/M3YjZwpc3Cv5fKwns2BGCQfZncLXr6VLcnUoFkVcjhkQOg68kb9eMQI2U?=
 =?us-ascii?Q?LI1gSTh9hysVDLqZwMyP9mEqXRTWJZ1tZQRidgao2iXz/DmpEcQrZ5UiJF1o?=
 =?us-ascii?Q?Dpl6LmMilpLFSyhtnZgQS8zngJVhcF/pzGJn3873cXDw2MQJkxBPtd+3yCKH?=
 =?us-ascii?Q?Zl56tPS7gDN/0zXSjFvtniCA6fe0WMekpzwGRLWrLetveRTpn4+V6jTzdlWq?=
 =?us-ascii?Q?QwKwWC7Y8bAPtIRqvkHKJri8kpA4hUiV3PfKi413kNHr52yY3jBvZrpXGY3J?=
 =?us-ascii?Q?1biW+BtVTCNbC30gYA1JzySzWJWeT6OrLdB5FCksRwhLy8lSAkqtUK2P6njv?=
 =?us-ascii?Q?jnNv5zWJ27T84KBs8Dm6gdAkJdG7yOFdvZQ6feN/T9ZVpB+1H9p6cBLky0N/?=
 =?us-ascii?Q?Lj8D+CvlVC1p1FSzZVrfTcfJ97vrwo/tApPTBtNGQC92UUP6daJETIjfy9aX?=
 =?us-ascii?Q?oiXkqfSozdhzJixyUdVVs/ycBcDEAJyChqyp2RMOeqJgrfq+IFqRgnyqXe9p?=
 =?us-ascii?Q?GXXuNXLc6cp1+00tMoBXW/eARi0SmRJskUVk6ThqFjH4kwdixnjpQg3Tydu8?=
 =?us-ascii?Q?XmjldYrEHOSFjy6F0yMkLNQ/K5E0vK9V9D1YVk7HVOpLNYEVDHcQI51hEqXE?=
 =?us-ascii?Q?D97VA1WaZlaJnogERvDKg5KwXsZxC8eRXpQiqc5jfstuJxlEZoUIkYbAfR/G?=
 =?us-ascii?Q?V0h7ZAnE7IbdIX4JCQ4fVIE8wgp3zo06odVn8LOYR00ehTu/8vHzZtMkhqYk?=
 =?us-ascii?Q?bZXoGefypm8c4wWN3enxwCjf41Kv8fgoTsTyz8lSGHSTdu9sZoE6gG1Jwl2n?=
 =?us-ascii?Q?Gw6ZOE9G+NtsHjXzmXFyTP6xq0co1OvYro1JcK3+lUVYlN1CgepIzsl1oIIY?=
 =?us-ascii?Q?Fdh16BNPZV0pa8VYM9o4YXuxesd3RpOLS9JcJCeiiEyy3eF8xe2LuUNtg4kg?=
 =?us-ascii?Q?UcIK/h5zShoeIL8eug0ZVxk0mbdVSHTWUStejgHlRuZfEFcf9xPLKOevE3zM?=
 =?us-ascii?Q?XVkXuxcb7nEct3w+pOEHpshzvZvRzkUockE8CUUUEpiPGuaArohGuuiyPUXY?=
 =?us-ascii?Q?6FIZscH4gNnPFyKv3u0Tm4BGcEZNUN/xFC8R5jtCdZ8PNgnacI6IAxgyNBwi?=
 =?us-ascii?Q?gWUUPiCvCjOBlYRiIqB6HFnjV+TZ63NeWyAc2GGQPCMDvM4yHqmByYbsf+Ra?=
 =?us-ascii?Q?6euuKcgw1XDXyIQqTiNijGtaiItJVF/0Uu/MGVZzKuPV1E1U7KIQWsWFGVrf?=
 =?us-ascii?Q?6sc4sCrI8tCUzkFZNDCOPSChhx4x38HkFsztGidaHLTcsSZL9M1gFcEYlJBH?=
 =?us-ascii?Q?1N641T9JU06e4oyaymYnEDX8/PQoZlbNPcu7XD7Yot42vZ1FiDkLhbI0FnHt?=
 =?us-ascii?Q?xFw3h+BVohf/yBXF4X7n7Ddrp+2s9M37NJAhZj08p41IjLwVcolzXwF+2eO9?=
 =?us-ascii?Q?ED0dN9Xp5dy8PfFgDwnXv3MBKPINtyD1zU0Oo/bjAQp2yXg3R1IZqB3D94/x?=
 =?us-ascii?Q?/IZDoq6/FUqN6Odep5nvCtUEmEkW0mm3HzHc8ceN7PIvA1gJMbdbeaGbJVIk?=
 =?us-ascii?Q?iDq0uZk6v1HB2p+Ac/eSm8p8lCZOKesbYPI+nmoScFsYXoT1wQLrz/6iPKVd?=
 =?us-ascii?Q?K3LwLmZj2g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618a1e52-1359-4249-06d2-08da552e7747
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 15:38:48.6533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7LIB/EZ54XSEGDuCmEJT7N78WOlyJbWb9PpMWvkkSNJP+a1aXAmdoSUTYD3RqE5qGU5dy6q2JGWCj2p3wf5XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1810
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-23_06:2022-06-23,
 2022-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230062
X-Proofpoint-GUID: Hc-Piqk2LC-_mHtwWv7SrbOMboQaE6c_
X-Proofpoint-ORIG-GUID: Hc-Piqk2LC-_mHtwWv7SrbOMboQaE6c_
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MSI supports a maximum of PCI_MSI_VECTORS_MAX vectors - from 0 to
PCI_MSI_VECTORS_MAX - 1.

msi_set_mask() was previously using PCI_MSI_VECTORS_MAX as the upper
limit for MSI vectors. Fix the upper limit to PCI_MSI_VECTORS_MAX - 1.

Fixes: Coverity CID 1490141
Fixes: 08cf3dc61199 vfio-user: handle device interrupts

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/pci/msi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 5c471b9616..058d1d1ef1 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -322,9 +322,9 @@ void msi_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp)
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
     uint32_t irq_state, vector_mask, pending;
 
-    if (vector > PCI_MSI_VECTORS_MAX) {
+    if (vector >= PCI_MSI_VECTORS_MAX) {
         error_setg(errp, "msi: vector %d not allocated. max vector is %d",
-                   vector, PCI_MSI_VECTORS_MAX);
+                   vector, (PCI_MSI_VECTORS_MAX - 1));
         return;
     }
 
-- 
2.20.1



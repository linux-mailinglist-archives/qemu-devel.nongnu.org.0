Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C9F518684
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:22:48 +0200 (CEST)
Received: from localhost ([::1]:55252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltQN-0000Ah-LB
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLp-0001MJ-1K
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:18:05 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLm-0001R0-Jo
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:18:04 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243E1bJK019152;
 Tue, 3 May 2022 14:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=bwpQbyF89pYHKySXBqp31gT7ja4B8YdjbKTW5AdBJlg=;
 b=axMzp8+x/GSHEbxX8RGkHlB3a1nz5Tez1uLrkVqd8YG4f67oMc3OLnpInYY8acJCBLIP
 /nXgaQKEYKL+mSEMV9hneGmBcTr4Bd3tLbdajAWnMCvzBr/aQa9G+0BSiqYhhlh2xRq3
 1XYsgCNEb+FiNbAROjy3EIU5V601B179+tWT6X3xwr7Aq57tOywBHDIkf6k4PVnQ6PR6
 /YtmlgKU2zCwYrlmSiZw7RLT3W5wL2eYbLMr0nZgIe4FJVB1R9KKZjCpRH9wHeBx4b0y
 E7DM8xQ+wFrUUqBI/LbgzCma9MxhkfXAD4suZ5hi4gpIU8KEijSYrvpFJa3/yDWXU0AW ow== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0annjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:45 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EEqli016184; Tue, 3 May 2022 14:17:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fruj8keq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABZ9bD7g23FnFKyjtfar7U8ijlyVr4UBsV2fKZHHuMFwzY+8tiSRDYG+6H2E4+AdAKcwl/XJ7rY15d/LfggpXF8CVKC1M1gb3ar2eDbP45JJHEjwQCIs3KgaK5C8WxHwDuyTATiAlvoHCwSfsYysgKL5Nq/lsXeRq0B9R4dJcgn3ZRNpZOZtrlbW5Fu9+BX8Fsr7Vwx4+fmPxnCLv0Rv5/l+0C3xmLjSGBBly/gfaObppJJFWIMJoku+ezxeq2/t75dQ2grPDARUrGbbl5/JnBXFE8pz6L52RCDja+bYI7OphzdP1O15PQmp78pdlC+IGT/WWSaoxS1Guu5kNP/gCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwpQbyF89pYHKySXBqp31gT7ja4B8YdjbKTW5AdBJlg=;
 b=YGiqXGiMIQxyuDeZSf2a+c9YIM1cMY8f1YCBmuYPrc7oXKW2uqSju0lxVzvBKjCY8AZeu/+EENlk3Tro+9NieQOyc7KRtM5w8QT78LRUGWKMeCHnZArO0ZSvlHocHDF2yxhRoAteLf6lr+cALstjyo2xJ1gr14qYaMAi3WXzhpDXkRsosRIyYNM8D+hNKA65RKaYhKD9Yu4mofKlWA1Kn0C6WYJBpj3iYMmNyxYATrLGGqW+hNl9Z5JImV6ebo+imI5TnrskCLSXqIXjSJ9LYTMyInmKlPwIv10aNRirFmYQ/bnan5tsR6DREgXBP12ZU3wOgaWo33ndN+Pg34Ws1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwpQbyF89pYHKySXBqp31gT7ja4B8YdjbKTW5AdBJlg=;
 b=vznvNLwj97ZI1eJHjJQG+klSyKm5yzqQsMY4PjuamlmhrZ4sdY9Oa7sgrMlIGG1JVGKeGXsnhT0IgtJcpehO6juWV7W9Sd5dvEwfoSG+jZ4jltsCX5eURGwtMR/Xhikpag1CrT9tMVrhfc7jz9m6fJ6l66SNkzyZHXiS9s2PyVw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BYAPR10MB2600.namprd10.prod.outlook.com (2603:10b6:a02:aa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:41 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:40 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 14/17] vfio-user: handle PCI BAR accesses
Date: Tue,  3 May 2022 10:16:55 -0400
Message-Id: <677a333e1c2843aafa8c6c2487e149208a5a5032.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e143c4f-c4eb-4a9b-d82d-08da2d0faec6
X-MS-TrafficTypeDiagnostic: BYAPR10MB2600:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2600AF93495B246AA5EF25B090C09@BYAPR10MB2600.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xeynjphcred6hC4T+gTnZl+I3UoC5EOrm/ijuXYXqtEGcmgP7gXrOAF9VWE4IP7CMDpGcQ7DjVz1yQgxDBwCZIk7WVs7juYyHKZae0KWonwnurFcQ8GO8//OKiHbWoUetKYGAZCgVB0Q7+nnxvPb6fAjwy2tIhG6m6yuoNun3DJ0TDhJM8XhmHhF46SchYiA8o4fV+ZHm2JWk5Fv1JdkmtRGBtBsZpkB5YUSkghnNLPLpNc8nWyuT0MfgftIOslpX4zczc0OYtpphp+s83zHpRdEhzmflOUPoS02rQDqfZF+WcfBW4+nboW2V0LC2KfEoKagfVTctJrTMykKKwGeGY+Bn2HZyBJb7c4PHQcydXt0sJumP+5vQ1t/YZQq0sTFXuEfFErXTpj4B2kqFQGEo+HonHjm7FIIfP4bu6f2BEsw8PUqS5QLee1vf8f9dCok9p6f0Dzu/bUtWZafqJSAlfEkZGjSL1jjtt95SvwyiPXZPQl0iU5WujO9OuYM0uXLMdp/M+ieFmnYVHjT9NKFQ+GZ9ygO7bgt8jnIJH1UWAsIvGuX83vi2vcexatKQGSzGJgV9TAuVB3fMToxWrz/zv+5LT7iqqxDKAsOlfCbqJDfCdRMEns8h1AtZVfU7DzlcYDXue55KL1+B3B5nV2CXvkBdoHLj0mfl5Z/tjCbRhKWhUcnJMwj+RQdL6Fn3esWvdz00uRPkhVagDFD4R/G1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(38100700002)(316002)(36756003)(38350700002)(83380400001)(52116002)(66476007)(6666004)(8676002)(5660300002)(66946007)(508600001)(186003)(66556008)(4326008)(7416002)(2906002)(6486002)(86362001)(6512007)(26005)(8936002)(107886003)(2616005)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/3oquNaY1WbwZDaRwlvBBrsPickeWq5T2Fo695g4K6JfsjYIFszKFuYDND0v?=
 =?us-ascii?Q?vPghiWfr5nW3WhAh6DETI3jv03MDn8eGCs8SxNB4bcMMr7bGF+01rsJrUeo0?=
 =?us-ascii?Q?vPOc4IpwaMADDwnSl4B4ikOmMqw/MaWrQj3OMsh+jw6k9VWJRa7ebVgWFCqm?=
 =?us-ascii?Q?ppnTuJrUfxbAuMU3OLtZwrRt2lV0xacvyw0uBWWAttCg4iukwf4O4jeDwroU?=
 =?us-ascii?Q?zEtUZPn77cpPkF+gZJkvP9oTueFlguBQnRVLUM1fE9SPNnuKQnYSYc9mVJ1W?=
 =?us-ascii?Q?zHn3kpu7xeZKZNiGIlkjVUXfCTYfwEWNVL0dt1agDh6e4Fg/KTTq7SnazTou?=
 =?us-ascii?Q?4rKh3/peF2K/nKjLlGp2r4o9LUKQ7mU3RHz9dFD5f+hb2D2KAa5UPsYxjtHs?=
 =?us-ascii?Q?7hf4em0sTr01mEzMS9QbCjSkWAfhOHxRnrl9zu3c3rklYAnjNXZ09rSLOHWi?=
 =?us-ascii?Q?Ybbv9zQi6imXJ0H4sNo7FsWqTxeVPMbaPU/Ciinnz/UwgMRuYN/4gWUACAHU?=
 =?us-ascii?Q?4PhD5BIAAcoNNnjW2pRi9g7bbAA24WV6sXtf5hvCzkHzBbL5r7BVRRYjG6jF?=
 =?us-ascii?Q?YqviId9qS9Oh2tgnC73a5Rtha2fqzauOPRV2RiYA8BbttQ6+RTA1IyPkaDXK?=
 =?us-ascii?Q?yVrnWDfZZmK7wooEl+bE6S7am+nt/8MVFNLV2giS74SpQMWIehjKNTHdcyvt?=
 =?us-ascii?Q?ESbz5RHqhxJpIdAD32S+2S12gdo8Wgk9mM4MSXKQ925QA6UsWyyQhh/eBUFR?=
 =?us-ascii?Q?TEqnUnYHcXmnKO8E9r/3/mNYgJf5Ye47+i8ALuDdZCVAWCV0FBfb+yTmH+MG?=
 =?us-ascii?Q?Cwmd2DDbUcZvU5w08uc6r53wOR2spFqkoqkxsIRSxoUSrGQA0puoaCZjb1XE?=
 =?us-ascii?Q?cO5rHhWLWqfS/L0v8bSbqF5whbo7HeYka9J6PrVRsLaTC7ZpEwAbdJ8654YU?=
 =?us-ascii?Q?7EscmDDqO/iAC0mcmJBrN+nYjpNKKzPswIQxTRh9b3tRNXddvrWrpFujLCXc?=
 =?us-ascii?Q?1AUHS4V6zmulYJML2j4OBQ2oSUrui/n7MO5kXACmaFeE+Cbk3pguSWUq8z05?=
 =?us-ascii?Q?lumm/LmnZquk/uIVW+jd3cr3fLTjbpQCC71PeLVKEczMDVB9GNUzzcmzYlwt?=
 =?us-ascii?Q?uapwobHjr9iTmyZOx8fc5rQNpaKylZgOS96KiIqQlXT5ePZ1PqmEvLp8z7FC?=
 =?us-ascii?Q?3sZ5Yn6d3MQSv/+Evm6xuy2MsHCSUd8DHtcTSoeHNJgMujjD8sch9kZkGWPp?=
 =?us-ascii?Q?geq45PdTTj+833CC459Y6jQiB4UA+PXPAtn2pwb7/qoKa3XqgwDcMIV+pxmN?=
 =?us-ascii?Q?AHZEDblUE7N+d4kIHUVWC6hPsSYI0bbW5eUF0fgXHPMtJ38ZXNUsyaqUp7OP?=
 =?us-ascii?Q?Y7vGH0mhzlc+wdhT6Q0QkwwiO9hl1QBjDlc3Jl2ZVEZhoB5SZ+BqkuDLMBUS?=
 =?us-ascii?Q?xeUNKd7TmFNl+inWotViKYwg4i0b6TnghhrvlNUeFM9F3HMmOAxIT8EFOyMX?=
 =?us-ascii?Q?C66/JDgCfvrzPcrnlLlit8A8f9cNRS0YimTbbIyEEJdl63+GOMLopL7UmW49?=
 =?us-ascii?Q?LCWETfRyE4hZi/LrnrJTPx70eBPXyjTOcxbGKwEPnRl20FR9QYLYOMOFwztM?=
 =?us-ascii?Q?o1AzCwwjnro4msaVcgN5RwGu1etUSxORKPRYGj2boOf4mta8NQIm0Pz2gcrs?=
 =?us-ascii?Q?KqFyqvXGvdjTKbCYEyTbB4rsous5OMaMJMfEBHbphCSOEnDPmVSywIPjrZCL?=
 =?us-ascii?Q?E2IMWiHE5g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e143c4f-c4eb-4a9b-d82d-08da2d0faec6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:40.9185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qji8nKWniK/ck92n59sdhTSjjn+U6Nuw5Gz62/0lPlBSDXLjelQ/BHs/A5Ot7NJwkbvaZ1QpboRqWQMGtvJ2xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2600
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-GUID: 4Zn9MS4LvUB7GFqj24frHNn0UGP0d1q7
X-Proofpoint-ORIG-GUID: 4Zn9MS4LvUB7GFqj24frHNn0UGP0d1q7
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/exec/memory.h           |   3 +
 hw/remote/vfio-user-obj.c       | 190 ++++++++++++++++++++++++++++++++
 softmmu/physmem.c               |   4 +-
 tests/qtest/fuzz/generic_fuzz.c |   9 +-
 hw/remote/trace-events          |   3 +
 5 files changed, 203 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f1c19451bc..a6a0f4d8ad 100644
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
index 736339c74a..f5ca909e68 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -52,6 +52,7 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -330,6 +331,193 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
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
+            memory_region_unref(section_mr);
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
@@ -426,6 +614,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 657841eed0..fb16be57a6 100644
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
index bce8360482..8cd33f6c7e 100644
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52B5546DFA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:04:41 +0200 (CEST)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzks4-0002mt-PF
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkfE-0000Xp-AB
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkfC-0000be-3F
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:24 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhqxQ016294;
 Fri, 10 Jun 2022 19:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=gvk5wPP/GPdxf1Y112oPgycOePUd1nl9QNDGaClKGfg=;
 b=q0ZoQiqQ8VNWRyoVcRrRZ52S60UByGZKM5tvl8s8qtXa8p9jG4iYuwM4X7zjes4vun2n
 b4BSWb+n9UsYfPHZSIQU61mqJ2aOD6EYAeBqfld6xd9TEal4XntGdX2K89sYLv8WbN4/
 oAIbWHXuCwcyfqJp1JE7nx8u4Wh3MOjdqxPKIzliIBuy9/dF/8oTYUlPYPZ39Di3x1uv
 RllwuMDVhNUjZEa21VqiDfwctLxhTM61KwQyojjcfd/6SW7SFS+gf2fseSRhMmhUXYMC
 ourALAb2Uqu9XDU6dTdWyPZyNDqPNoJPIQ6JcwLnNmdGRWU89Gu8rj160+sfE5rKK8Sv aQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ggvxn4fay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:19 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJkjxQ023113; Fri, 10 Jun 2022 19:51:18 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu6egxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKDJHQaj1DROCqe6tgCmd5uC9zg+QkzYWDSLYgV8vbFF8rljDgoBwNWEKLFznbMxrAXPhRXERP28Wo/OQAuH3oAVr5UMRx/b7QQgrs/+8KLuhqKgJ7B5UmHRdKviAWfxoPscLlp+PJPecqPtKr/20P6kmjZ2MZ19p47nE7fGE13028ZcPlvDZ8RnCGpJdWYkY4NQHMBLKiQ+uQZVf1uTPdUH3Ysa5DjETd6DWh0HXc7vTAXn1LO8LbmD3u0mEE8PIGhlHM6ZGRseyvqy2imJ3O6VEIYdtNbiOkFA7lMhSpZl1j0gt/tiCaMR8sIjQkLOuSvk5gY2inlJp6K6dqK55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvk5wPP/GPdxf1Y112oPgycOePUd1nl9QNDGaClKGfg=;
 b=C50vgmBiYFYEhoscrpnUrrxe+lG6MpTK77+eFLE/V2ihZGApzt9fbQXb2pqgOhMgz1tgxA0StbE8URArXe2ePGbs82cpRYX7brf8ocZoNe2whsEVu2w/B5DMB+cw5/Ogcg/4w11SKg9j1X8eeXNDPYBjNv4ONMIz78wkZMUEqKxxxrWbzWax1WN236OI/jdgV7DNBnfxK8SsUd1B22bmAQp2BeU3lHJ9FZzlD8GQwOtudv7oG5VNApneKVp5yAxxb7ai1ho2w3i4gwF+hPxB0igw6jMRLAj4a59O/t5tkXXEk1qPDh6nED/9uNjTvV0boqTxub63FgMQKS4BBx1Kfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvk5wPP/GPdxf1Y112oPgycOePUd1nl9QNDGaClKGfg=;
 b=Ejb6g3biZQy9k48GsrRs8Cn2DwnFQ9tvq8n8CvMhWZVuvKke56u3rj0A4k9C4sSCbirxHslRJlvx1ZHuKlagmfUN12Lyx+IcW/BJSaWExximMqFxteoiTcNNzcjyR7r7R3XTHFHMMM/bIaOGrKNf8x6DNqkrwboix0akJrm0jGw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1915.namprd10.prod.outlook.com (2603:10b6:3:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 19:51:16 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:51:16 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 12/14] vfio-user: handle PCI BAR accesses
Date: Fri, 10 Jun 2022 15:50:39 -0400
Message-Id: <c074a6581ce1b9fa4f91ad46e1200b8ee6614ee5.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c00e8df1-1172-4e28-e06a-08da4b1a94a5
X-MS-TrafficTypeDiagnostic: DM5PR10MB1915:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1915660EC9F16DB4A8BC89B690A69@DM5PR10MB1915.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SSr9agw645w8vpa6F1yl9qDSOowQXklv8oU7BHvwLg4O0N1inAywaAnOTkbK4S6QAMZLbMOaavDr2uCBOb6oPBwUKaNRjXCDMO+RG3rRn0UsUQuxiKwvG7mMTghzDMUmbjXniO4ihWxB98yPTK2OR/3xSIFh8CiaiRvoQwODvhdDtC3UDO7DMni/twrd/GKH93XYkXK3xIsyvdGEIH4qEzIPIUOgIz2ZvtUrmhqPLZmNsgT7QNIc7H6IsfP2oTipmHUAH7h2lH1x3N90cgo0R4vV7f3rH4CalDrHBUyDaoJf+PJsNu6jU+umYypYC11cUfX5KWBUlPIFUydrB6DSaD4IUeWTNJSzzOt2yQHV9HnKG88nKqE1HFHZLDWMSSnEhXtBLhomFGuyvk2lnqOrdb7EWKQqjVLRsGeIlrvtbaJ+TkY4Tgcw4BzixXwuz2VqVsfVZ7eKRCHz/+gx4k3O7d+Zsm8ZZSww7KNNM/AMrXw1EkQ8aOvBw+whXe+g9ssMRg9qTBhISpzA188Nn0pzITjZHoWQfYFxZRsS1SobJz/tpkaRNHbb8/jEpF84SLMpCTCfzAq3llSKfZ8oDN15QRSEsMhEImHImtRbSgpzQZ2D+sREtd5NwpW5LRwmQEg/KohpCgZ0AwaUsGpi/dxEflLIwbWxH6SWKMwuKaErbEeKWUb9jaVwhsP6n+s1sAxtXTnj4wrN02qenohhWP6dAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(6916009)(2906002)(107886003)(38100700002)(38350700002)(6512007)(26005)(8936002)(2616005)(86362001)(52116002)(186003)(36756003)(66556008)(66476007)(7416002)(6666004)(8676002)(508600001)(6486002)(316002)(83380400001)(66946007)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3GUpqyMZpOSSW8kbWcbZoBA2fTqQJkHqdppDfESKi3IioValLXNcg7g3j7BX?=
 =?us-ascii?Q?Y0gtsjKkMVjTfz4lG/jROf32fZFW74q9FKQqbotuNvTt7VTq0L6eo1L685SH?=
 =?us-ascii?Q?NzeQgWQJXMZb+cDzsXKs+XA9pQrGPu7hG4VjeBdmdFax1MixSivcnHMS0NKW?=
 =?us-ascii?Q?cS1x0bMG8XIdbnHLfc0j5LMwTxunH2qqr1opGez3WjgSRa3g7YpVAC1I+D01?=
 =?us-ascii?Q?z7BCJ873ON/pRwrkJxPV0Tya94pr2OpvcQvEXv94P1tV3XZZ6sbXmHFwkhwh?=
 =?us-ascii?Q?9P55L5ChjguxDavXspO51lEihmEzNZJs9L83Wo36yAW0FfdBTyNAt6m8MRQ6?=
 =?us-ascii?Q?9Hmi2Ne7Vk0DcJNFHoGY+XT6WRlksF4NSbePXOuuIVI0yat/xIwCoKg5OoM0?=
 =?us-ascii?Q?UIAifzTjyN4bsuV1XuRPm+KRcmdB6M00annSzUYkNQKJbbWc3Io7UtSYgc9q?=
 =?us-ascii?Q?hXrPDboNxGCg+OoE5Js50SkQ6NcVhNgTYigXNsy9Iw1XiLIGOFimcCV7PSIh?=
 =?us-ascii?Q?0Csz0W5X+I3tYivBb/1agsHWGLSkyc7ce/wylvEAZOkGeKzz2Zg+Dw7ZDYTQ?=
 =?us-ascii?Q?+cWPjIenDmo+PG1nFW+Ynru8i+YJOiqS7rT6oZn+jMPZEyDClel1UQnNHTrl?=
 =?us-ascii?Q?jLgGjvJcJOyK+TSAaBC3seCCIPHyYHFfmeam7F1xV72ygavRnAJsFSLcNglU?=
 =?us-ascii?Q?AMBU4bO4IXQYg4EbFnb9I+9o6Tp/IYDyRQ4kpDcMhh6yw49Ymhtp35rivT65?=
 =?us-ascii?Q?mygGyHVuZzlifWqZUaXb+pZ/NRLvlJAHtwzr0McQL5+7euC00efX8tVQ7X7a?=
 =?us-ascii?Q?HUlQ+VhdGIff6vAL+S7lBcFQaCy5/95Z7Dn4u9V9wYxGPw5vAiuj5tl05cnj?=
 =?us-ascii?Q?QX7hjr8vcWPnLAaprTHfYPGjSg04SYK1saTpzWBFI18YfFbuDAYChd2A2BmW?=
 =?us-ascii?Q?FZgXD8pduYDG7rgIYArmaOBVmwMXeW945W79zZlSQtnzTrj3U72o+9cI+w5K?=
 =?us-ascii?Q?69q7V+zH9+FSAkAZKqi3MPIql73v9VttuGVGJ+q4B6k8I/Hf6aZxOJFH/n8z?=
 =?us-ascii?Q?sIt8i4pHOsZxHsNunrxCYl0JCSoIs0CuXupdz74ZJz78A4+eKDlxpVYTOBG3?=
 =?us-ascii?Q?UNc1+V2treYls1X45Gx8MpjM/WVjeHssWJkRuSjBMT4eTkhO71rhDVsalfN5?=
 =?us-ascii?Q?9Yi0QJ113bg//xsB04pESU+2r2TdIgqinOyHz2DfWHC5PWfpj1Ny2Nx5FHRL?=
 =?us-ascii?Q?blChZrsTFZVjiiVQvmC/PbVJ1k7+bTULkV25tSJ6PcQl5osSq7//isVI6vzU?=
 =?us-ascii?Q?iY2rjBHmMYz4MmHsXNQP7xVOgEXV7L9pjR1sE70ZtrD0vxrAaeTqDin5hkM7?=
 =?us-ascii?Q?oRXCPxRt5lzSOtYCr5zY6jvAUzOxQs0wTifmi/4/tSde8FUQBy5VGvtqE0E6?=
 =?us-ascii?Q?w8fT5XynizQwWMgqL1QIgfWD9ruqcH0wMfXFiAMvGQ30om6uDu8aFGSDgEBn?=
 =?us-ascii?Q?WV4AxI3DvduGihnktE43QCehZGvfgRAc3V97sGKMqiuc7JvJwqMIIDbz7exg?=
 =?us-ascii?Q?PW/slEMfsOaD/Y3ZJad/eoarzPhRhlI2REEPVGldO7mC87m3bRZVs42WvevW?=
 =?us-ascii?Q?R6J0YN+5XiQ9zgSAQMcb//P1f1/0XwDKNcmo4NrD92E6PDXsdlXKGV1monO+?=
 =?us-ascii?Q?DulzLW7F+GzMfm6GKovnjGM2Ym5HGIEd8dfmp9f4Li4Hkn6PMeiu6ZQsDi3H?=
 =?us-ascii?Q?5AeqB5ueQA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00e8df1-1172-4e28-e06a-08da4b1a94a5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:51:16.3821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cz+eEoxc7MDt5QshAbHyC+eMYRetsKeWWp96eHcWdOm2CRIKcyhA/ZdWxEmo2Qun11/YiD5bMHAvVBOuQ6pdHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1915
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-GUID: 7wM_BRr7VMS4ouG2uJIu9B8aUTlBpp6a
X-Proofpoint-ORIG-GUID: 7wM_BRr7VMS4ouG2uJIu9B8aUTlBpp6a
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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
index 7b21f77052..dd760a99e2 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -52,6 +52,7 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -332,6 +333,193 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
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
@@ -442,6 +630,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
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
index 25df19fd5a..447ffe8178 100644
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



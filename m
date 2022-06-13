Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F7A549F0F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:29:51 +0200 (CEST)
Received: from localhost ([::1]:40820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qh4-00026X-3x
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qes-0007Vz-A1
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qeq-0001qa-Ja
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:34 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdXZd027265;
 Mon, 13 Jun 2022 20:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=zRVsJxAoQEV0fbZOo4uOpYPqQk/ibvWVPUxh/EAfj8kTa598J4NEhvj9LGMyXM75NpYk
 +IT9idmeu9m7IuxAcn8Wu8aZXdIfTRC4p0H+H+iI1O0+h7MDUhCd6r5JlhTy3idsa65+
 7rrHT+R+eL7SCuRbI9u1zjNEuj/368eYUc3FB9J123PHv19v3aLUoTxAuHkQ3ryYSBhZ
 q7jD2vNy/KjUC/WZST+ozC5xaHHqba36zRhaK04oDeLa1U3SbqAG/9tau7q/EhyX3e/i
 FL8SjvjocrcBGH08mbi7nL98Vso3gTXBBk0p8dy30nXCyVf4dTwcHLnvX1muHx+cvdMP zg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns42p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:27:06 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DK5VbF037985; Mon, 13 Jun 2022 20:27:05 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpbuggrf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:27:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDCqByA+XNsftd1N0oveMB0jZSDDx8TEdPtFwjJfEQDMDEMXsVU2YW04HtszJInTpHLNi2E5GpW/1Z9QINjrbi67U8iNADC1ycGdwflsAk1pZUiEvW8btjyY1+YPDpf2tqmCLneJxucwic1I2Mmrdp7hD8kjPbxsIBguKi8k7quSdmeq09oj4WO5bYeTD/CksK7wFH5Ca/0nPbejyKLk07ErtHYoEgoOUrPBl9oNDO6vRWUutgokdfPtAIGzNLqwPT2WdWZzCspUP/EFA2M5iFFuS9XqedtffsLU/RpdTS8tVngw+201MvxOKzm4jieCOpbZD39q052XzWivw/nszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=XS1bsvWjUstrnMfVAnpqyExr+Hia+7jlomfPG5D5Fyyq5ZcMw2mYNjNf3n8u0isj8aii3NpBoDeeK04LAN3fgjmi3h7HGxdLlfMaLVeiJCSvDvxXeoLZSiR2gJ2CaXXa4VG7KVZ6+KaK3ynl1AU2ivch7umXtb6WkEAbdcQEbPzeFuwgXAG79AiPp8MqbCZV+/MuT95cprGVnzLz5sDmsnuaz0y236vC+pxihyZDTBs0ppAwImS+3sQ9YSOcB53HV5/Z5XbE95bTFK4Prc++KrxtOqX7aaJZVey37KNutDSAr8tCVDuTDI/uxX8aE6WzSYThLRBhGWhbdkVzv0Es0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEYd92Oj4S4zXZHW4xEXu9y46a7Vp5wnXLld9qaD9Ys=;
 b=b9dNrE/OdelPeWttESCUSA32J3+2w4aKZrgl6Rey/sb//tJSrXAwMCmQWvmrGf0fBOMWQNwWlIkVFtUjaJQPKF7Sz9nVpzxHpHETVcUvF5bjCigGiUYfxpotwiANzB+HHFMaUAh0EgUoTUEckg3xYj2AC4KlYo5F/HtIGoJ3UFU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 20:27:03 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:03 +0000
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
Subject: [PATCH v12 03/14] remote/machine: add vfio-user property
Date: Mon, 13 Jun 2022 16:26:23 -0400
Message-Id: <5d51a152a419cbda35d070b8e49b772b60a7230a.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6895d026-7318-4640-18e5-08da4d7b135f
X-MS-TrafficTypeDiagnostic: PH7PR10MB5723:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB5723E257C72F8CE1062555A990AB9@PH7PR10MB5723.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/pqGD14Y+yXTowPAHu6gBWdJ6oyGX54inBnZ2yeM42kPVyOaLWh5lU/6Fu4UZJnBjKETexerphiwFWUDkH9Xlay/p9Fjy/XyI6ZxFhYvEyKF6sm0aKf69Zln3JIe7m6ho5eg5fzvmzVee4MO7LiDA7hMoQ/x8aEv7GP6uzGdptWFdvimvV1Z/12baIqeYNPqINuIywIc8Pos+9m6xovQ71Az60vVhyoUPX8pV3PczcFahtifFNOl2qdNDbTes7QNmh+zSDi/rqRcSsNK1XJ7zve2MGbPvSfIj+7dZimxA82YjsT3XXJRdYMLViODKx3Y/q03KYvMpfBi9SLIpFEW01ntIcN6BhsyUAOz6hY4hXQonUvX6YlvEi6dd51QsAxAOm0exHpIO40Jn8C903qHOC2Ro13JhbAm4M9Exp3+N1rP7unHswxYbsDrMkekVEzPZ9G02foP4FPPM6kK/EaZiiwBdR8zR2LxpgQwtf/Mqf01DhvLoFEedAcsGnwGj4KonWEMadZ6IF+vMN0vgTNJHnwDY27ouFaaPtDXbg0vfbAXkfiECf6OQlB5HN9+xf/A1MdC41aajgV+y68A5QEZfN8EbxAjmiaAlaGnLV6iG6cU+gqkWd5lbCL2WybPB+FVICOnYTA0ydr5J0IStJDuiHDvNoOMaPeCJ9IHox9DIOpJQyJNe07pTjUqXDTeI/GUwb5tO1xzK0B08Iho/Q6pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(36756003)(6486002)(4326008)(6506007)(6666004)(8936002)(5660300002)(38100700002)(508600001)(86362001)(316002)(7416002)(2906002)(107886003)(2616005)(38350700002)(52116002)(66476007)(6512007)(66946007)(186003)(26005)(66556008)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YyBuSjs89Sp/cOWE7H9aGxpGIvQ5nJy+4Olvir5g/w8nfTQyT8YSET9repJP?=
 =?us-ascii?Q?gk67nsmNGPvk3+Tt/H9P8ANdGjBGjylrvWEO6yyGdIFZrCO9gBfL88rpyC/c?=
 =?us-ascii?Q?Yy/k7xtnZUTEROppacrowYRBMaJZUKmDEnvSpoS1CP413DD1zYzMvIpaXuK8?=
 =?us-ascii?Q?HB1gUX3mTLnUMzluKqq1nYr0wzhjgEYNRX0x7RCkaHM4XbrWNY61KcqBcpv6?=
 =?us-ascii?Q?bPDDSz0/WULEO6EDbu+ksl2WSyok/RROFt45KbgOYiSIT4Ukc26ZtK9kIxeR?=
 =?us-ascii?Q?eVELrN/hVPho0JFzkTUUMQwe/A/DIxbCs2kCfbnsZO1r8b/o4GAWiOIQbEuK?=
 =?us-ascii?Q?JMJZgvfAUW+Wp+VlhnLkbCfwwVTukC9W5lVjQlGSBqO+oY7ECDFnZJAWqmEm?=
 =?us-ascii?Q?3U6HP3Q8HVSHvZIaVrqehqGWfC6RHGt4fqL4ZhC8dqdrsTM3dENF+LBEddJ6?=
 =?us-ascii?Q?nS4o+mzimI6rT5R7K8zjcGhjKa1fIY4zEyLEqp0gp1Qba3bFhHEm7dq4h8vc?=
 =?us-ascii?Q?KolZ2zVEJ0ZVDLLcRK8Gv4F8r/tf7l5P+/sjLDuijVlbGiNNGjxOWCjtQA/s?=
 =?us-ascii?Q?eHCd1XlXdxvzmKRWVvloWezEjv8gUJqXOgP8fqubGE/2Mg19PXDcE2/7ON/j?=
 =?us-ascii?Q?YZdJwsN/vNX/xxmlyvJ/6OKjEQfnr0AkQswSOP8Urgyzu/clmkJLlNLZV/UA?=
 =?us-ascii?Q?DF6tGuThidoPKH5T+OFLbMWyczqHgJ0y3OqaEHKRnUXzUFxvYTPEh0GPdS38?=
 =?us-ascii?Q?NpMx88ueCrPM75SBzhwzPhjJzw0BCZ3m3CePql1z62q81kRJ1kCoC3kKRUSL?=
 =?us-ascii?Q?mZWPmzngewWF4+BmZmyPDqysGGJs5DHjBkeXBTqK/iqh6fujRnHs8VzBlo8I?=
 =?us-ascii?Q?h7VnUSeWXGP33h6OFhfJs9gg9hDif34t+5g6QfOr+dMIjqi2qx/d0DpldKNF?=
 =?us-ascii?Q?q55U3CtVvE7vNRyZyGLUjq57VMqQpyD6E/Ztl+KH92PPcQGwTge+nAS6z883?=
 =?us-ascii?Q?GCZMlp5O+Wl4z10j6y77VmXoJISty8goqWUY3OMUBdK3brMfFw92om/F+XXf?=
 =?us-ascii?Q?xvYTlLSERUxNs4PCYZ8nlDsErPcRPocaB9CIfvp0d0m6Rxa+8Plq2/vIQl65?=
 =?us-ascii?Q?EkHRCpJLI9/m49AHqwCZ+CgJxXSd+v8m4QLoYBxQmvh3D4fV64KRlJPTUCZg?=
 =?us-ascii?Q?VzTH6OXFTsLYgkuwP7sZyivis/qupdZrfTaxdnOsrYec1Q1VV40foCVQpWV3?=
 =?us-ascii?Q?KorhrAlrV59OrLqGUc/yKFkZ5gzEpmT762O3my2oSvzS6KOhpCac4GKD4EhP?=
 =?us-ascii?Q?hg7KnG0vM9jzaokIEsyvIqsPn2UwOfVV8v6wU5kjZxjDHUeU5kOtpzzW+Yjz?=
 =?us-ascii?Q?5QLnna2qDvw08rK6TL6Owig/8rGXxNCpifxudc6RR5+4rTFF2oVyWQEGGGc2?=
 =?us-ascii?Q?OGEfFOO4TlCnEM4h00SaoPWbdoVk+DbPTsi18War+e8Ry4SGLpu05N9hmYBz?=
 =?us-ascii?Q?ysn6xer4/stQ8i3rvZtIu7cg35CsHEZeDelJ+E/TKLz2K86GcIB0bC4Cf0FL?=
 =?us-ascii?Q?ZEyIXFGZcYWPruFLzpVh2EeltiXZjS9fBHLiYQaMxfMHIUcbbf2lqwctziBf?=
 =?us-ascii?Q?HpWROrrgwlBkwQQ5CQHD35ZALVJ9xkV4KswGL1Vbpe7JhX7mDW1SgDLgr1pk?=
 =?us-ascii?Q?ojTjCNp6bn7QWcbfB9Qs6ofaH/YMVyHq5Lk7vBdNfzz4kgQc+AzasgXxZKfV?=
 =?us-ascii?Q?Y0ueB2j66w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6895d026-7318-4640-18e5-08da4d7b135f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:03.0943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUyreUfaQE6aPEwMhjeaUsVH2pGzVqLcxJVk/yuNzRxqrxH1x7uYp+EsabVWUEDOPg1i/60/ltbRU32r7K9o6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-GUID: C-IlOr3Pbvq20XR6Boa_qKEh1ukQ7hV9
X-Proofpoint-ORIG-GUID: C-IlOr3Pbvq20XR6Boa_qKEh1ukQ7hV9
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

Add vfio-user to x-remote machine. It is a boolean, which indicates if
the machine supports vfio-user protocol. The machine configures the bus
differently vfio-user and multiprocess protocols, so this property
informs it on how to configure the bus.

This property should be short lived. Once vfio-user fully replaces
multiprocess, this property could be removed.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/machine.h |  2 ++
 hw/remote/machine.c         | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 2a2a33c4b2..8d0fa98d33 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -22,6 +22,8 @@ struct RemoteMachineState {
 
     RemotePCIHost *host;
     RemoteIOHubState iohub;
+
+    bool vfio_user;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index a97e53e250..9f3cdc55c3 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -58,6 +58,25 @@ static void remote_machine_init(MachineState *machine)
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
+static bool remote_machine_get_vfio_user(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->vfio_user;
+}
+
+static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    if (phase_check(PHASE_MACHINE_CREATED)) {
+        error_setg(errp, "Error enabling vfio-user - machine already created");
+        return;
+    }
+
+    s->vfio_user = value;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -67,6 +86,10 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Experimental remote machine";
 
     hc->unplug = qdev_simple_device_unplug_cb;
+
+    object_class_property_add_bool(oc, "vfio-user",
+                                   remote_machine_get_vfio_user,
+                                   remote_machine_set_vfio_user);
 }
 
 static const TypeInfo remote_machine = {
-- 
2.20.1



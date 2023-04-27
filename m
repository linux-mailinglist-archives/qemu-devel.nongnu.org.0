Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B36F06F9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 16:07:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps2G3-0001gI-Ue; Thu, 27 Apr 2023 10:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1ps2G0-0001fs-AD
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 10:06:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1ps2Fx-0003uh-Nm
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 10:06:00 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RCO9i3006812; Thu, 27 Apr 2023 14:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-03-30;
 bh=LUA09zZaQra3Gita1Y/jIRGr9IGQYI7ITvtivmaVm5o=;
 b=tCGqPG3BjWbf1jbK7iR2D4FB++uB5I3hUeNLl7IcuaiFUl6r/LfDh/unK74SPUHqyXn3
 oBHLRKV7jxgEMRhHP5evXvHk4qdKTD32+HwKgr4cj4VwgYX2eWVWTp55u4kiiQrk918A
 mzQ+BIGCN8tVvRuGGB/SiFVXCIbISLIQvEjKV6BDgfxbCxHdqQk825rSVlAqVTSXLrNO
 5SjZIh1iso98qm+DmmiaQGa+MFNj4EqS5LCi2uXc9UrypnwQmfOwTwgYfxy5lcR5BSAa
 z2Xg8KTjtnHrxza1I8UFxooE2iTQsV/T10JnVOQwklY3tKRZ/6UHqHqp7UrcnEX0aosJ 1w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q460dbxuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Apr 2023 14:05:08 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33RCQLlC032877; Thu, 27 Apr 2023 14:05:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3q4619marp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Apr 2023 14:05:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKkRk47yWByd1+M6m7DSyMUajQrshk3uQlcYZhWmUT6dqk5WnPz1oKNUheijDhcTNtUrgNex4dO1q2n7zcrGxawQpW7abv1iub8PUqRO1CtnJzL52nn2+6JqhKjxwQI5nP09bJhnqstrxSzFGkf1iEgbETiJDbrpVbWMQLGWsQkSc8xWoJFOeA/9jZhRW7QOUSAhdxY0TZHV9EvjzK/QK0NkcW2uy9iY9TyTK1t4rL+TTLVn4old4VcyWyUBIWhutmRV5uvvqPdCWpqtD0Co0fQte0l8zsvFhVh9UJajvRyA/zVTeUcLJWBzSVlYkL35DHHMV4QD+xyrWggxdmQ1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUA09zZaQra3Gita1Y/jIRGr9IGQYI7ITvtivmaVm5o=;
 b=Neuw1x898bhrGkNhXxhH+dDggJ4ylHcdGX3XXR9EFgTxzd3bUXJVfSDwhaDgscRgSJdmumHH09WMA9vyXord8JvDkwMpGdTANg5oiisltp2y2+nP3TUAcoBCkaz6wm+WcL1NfUbFDNj2dQHVIWxcqqzY2I9l94311eBSMOJS7WkJMoKtystzV7zzWUEK/hJGAWOrrotGR6G1b4ZcG0JTCXJPODySAufyVGu0BoOngaao4X5VyVnAKU3ahSFNdrwjauFkUEfH883TfsIkFMXKsVCLXRzItCVqHMTr/lPiReDNHvZN0cbKeFVu2VVp+FD1JQS1RPY4ghy7TzB3/i0zqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUA09zZaQra3Gita1Y/jIRGr9IGQYI7ITvtivmaVm5o=;
 b=fpIVYNpkGG5bMGuTNS1s0SSjbtENVvkiQSuDDuvgNbedDbQFgaPBaXGBxs2Ymx1y9zO/s4tUlHYnZXRpmdirtrsSyIDcszrBHYoFzvjp7uEGjUxBw4sYNjn2xNyNr9p4p6TyuUxTMVxQNECt8iyKiWRgruiLXSYsvqLZIQyC9l8=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4336.namprd10.prod.outlook.com (2603:10b6:208:15f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 14:05:05 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8ed9:9d1:444a:c3d1]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8ed9:9d1:444a:c3d1%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 14:05:05 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] apic: disable reentrancy detection for apic-msi
In-Reply-To: <20230427135233.2973922-1-alxndr@bu.edu>
References: <20230427135233.2973922-1-alxndr@bu.edu>
Date: Thu, 27 Apr 2023 15:05:01 +0100
Message-ID: <m21qk58lpu.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::20) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|MN2PR10MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: b47ae475-a95d-492f-58d0-08db472866fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7OSZtZwoAvoLp/AFaHhLuCAkUAzIMZof3PlUgyItQOkDof1g607NhiYTSysGqsUkJcBciVmPkwnUX01wca3f2whHj5xs29c1T+4uNp/FfyoRPAlZbT+9abm96t6nOoW6QH1u+UhIDsE+MNHLMc5dcDzM5ML/ALYwkhahnsqBJ00qT0b+WJZJi0/0F0RNqWSTegZrVZtejxZGd4zezFl0QscofXmWkhFpK9+NSmRUlxPP4tCaDmMKG+5qSpDF1xJnBpoXkqtSIlDvB9vW5FuYSX+ziKivmbP5uDbOl549Om3u3CNhgkBLTrjCHBT3y9VaaxokC2IRL+y1mlpnzsH4m+1H8fvOQ/raEJE1SbqWu1hLey2JyAFvvPjp2IRMNSca38YQ8PcUH2vxw3VX4AIOf56H1CfNwKbY8RiYobb3p9T6CzPb7LGE1/SKeet9McaxPMF5OtYN2Jiul5KTu1IHY9gEKQ/9hq0y98VzypfVFNllOndGLmi6T2lG7FyfRU4ZTAP2W3lKV53e3RlN0KldcjldIr4hmmdAhgWuyiiQNmJVB8uI5aVvCLYR7zezvsrc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(4326008)(316002)(54906003)(66946007)(66556008)(66476007)(36756003)(186003)(6512007)(6506007)(26005)(38100700002)(2616005)(83380400001)(86362001)(5660300002)(8676002)(8936002)(41300700001)(478600001)(6486002)(6666004)(2906002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5TDdaF9cR/Ya035VmCbJndYH0ft5K4rWAVvAopO5JipBXycm/aPlRJpItiSQ?=
 =?us-ascii?Q?EAkUAACAPERJJkrS6H8ltj4VtYGjbgyHDstaDRSJVk+u1GHYidRZk28NHVel?=
 =?us-ascii?Q?buCoH/80VF6ATIy0Yd/Pps3oxkBaUbhOp7iJr7CeelkuE+bV0h32mVcNgfYN?=
 =?us-ascii?Q?XujbjhnN28oPgYvdaW4Y5EWuKcN9cDU/0aaoK/xPjXxOuD6ZXXEV0PVmtb3W?=
 =?us-ascii?Q?T3s0Oappq+IHXunlkUDcPMe2ch4qNagmYYvyDypq0DOTrqelj/IFpWciZo+H?=
 =?us-ascii?Q?L1m8YK1AV/vWvR+ripmgvqrHUdksaBiukJoCtiUtxiSG8pCyabOeduGCpgUG?=
 =?us-ascii?Q?j6kW2tRC5aVW0TZISEfFrTnrAey5qDRkpS+un46qAWTyVuF6b7ctmUrng/zj?=
 =?us-ascii?Q?aX6NLNAzylXX3ep8oYrAmy4iDXjeTgG94tuMQbWgSdYsWfsgNMr0oYxOf3fi?=
 =?us-ascii?Q?mM3HJjZzZX5nRU/Xh0KpTJ1Pj4k6p81DEXRYq6bVMinwXKUKyPxXFAawmTc/?=
 =?us-ascii?Q?6z18nVR9l6lOHLH8vRun6Q01ITHFmo2oKA20/4+JVeAAYDWPru6fqhU27JBL?=
 =?us-ascii?Q?rQGFe71XUXtG6hrRDRAEClxflE+8QAs/zvnmxNbKvAY7QLBZtWTpGNx1nk/C?=
 =?us-ascii?Q?4DrUy32dip56zGNSFEsvkbSt9zW/Yq9AQ1QcMtRlivgELo8MVNW0YIbkP9+H?=
 =?us-ascii?Q?QG6eUk5ulS9HA8PCKWVt7IspjkRy2jnRW1/jBbMkQ6rPLZ6u71W+CHxNIexF?=
 =?us-ascii?Q?KlMrmCGFXZMJFPnhRkFnPKCwlKsMw46AkNtERYnzh+T/sOsU2UuFi7jlgqjn?=
 =?us-ascii?Q?SXy2U0An1uvLEFUcyrbsYe2lvopmQOCaZ9lG2mkCVz2cnlJmVz6+PdsDSBgQ?=
 =?us-ascii?Q?y4Gqe7AO7fyoMqGZ/evHa0U4POAoQUpkJxy/na9EyNC3fTmBPVfkqUJ+G6bu?=
 =?us-ascii?Q?4rqzSFSpEoXtjAA02gDX5GIPlUwvDuo6Aubd0+A0JUiSw49+k36yVwSP5rqx?=
 =?us-ascii?Q?+pwVJa7YoAfq+f3r5zig/WdSHPMBVS3KwUxZ8tP/gE/zs4nrzoq0+2syvsrJ?=
 =?us-ascii?Q?1rMRwjx1zuDMfVvmrwqjqEaCa9VYVn4lz5BotzAcH21PRQhBw1NAN/RlI7vD?=
 =?us-ascii?Q?XWDU2ViA6yZfYr2fB1x4zm3sJ0BTtjVtHZwOpPlQKUbTPqYDdghbzR4/xLMk?=
 =?us-ascii?Q?SOzv1Lc3kad2OAsnnch8jbNKX0DSYRa+bydGf11UdZkDPcSykMCBoLae5NPD?=
 =?us-ascii?Q?G+Sau4QD4GooJcS5a8uDSXCTwuYE9DOs6ig4pwaauuKgYxSpVVE4Rx/4aZ9x?=
 =?us-ascii?Q?eMYGaGmBMzbGFUGwd7jX3GpM9WPb8iSpRR4Uql2Opd9PrQxXZnzrLUwvDPDF?=
 =?us-ascii?Q?fAWvcxctEOh4i9MhvK3sjgjknkrbd7nh9EK4zqEJ3yk13SQhmyGv97Vz59Bp?=
 =?us-ascii?Q?MnxHJo9obbI88EuZU+T6wpE8Et2sUrDSbXR/Wb2qnuapei+bc+Ku8SKibCv/?=
 =?us-ascii?Q?mSqhhrexELbB5g5GmM3iM5EqbzBYJEWilCEk3wHlxOJdLCke0Y0hFg/s3hTa?=
 =?us-ascii?Q?LFFdvhWX0uChRBdPjtWfUqa9YDJlkI0VgJFawJx/g/SkgDIuNIG3vFRoK/2C?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7G5+ZY1nl2Rg2FUKyMPVMsgyo7rCubGAaRMBLmI0Jzvh/kWxpx2v9PvPpDvraNtG9MiL2KY0QI17UfHXPelbwW6pe6gHaXrxYvfjk6zVv0iLQdW5xx3FTbFk5/2r4Kg8cKWe9ZJ8FmCNCTHuuoSUw+dlZ0ayWNImEV9q5StgJfLrV+Cp8ISRHqIBo+bdF2nWDEFEF38fJFbAyFhH4cXqhYz1g2LH2jCe7cleHF9Vgsa9LuNB2k+FGON4+NFNAUh4Qmy7wS192DDjiU7GYjmLApzqoj0yT6aSZx/smF94KH7LqJPbyX1JumbgRiaeO1MVY+/o8xtsoAgmgjZ6pgoOYlkhCyi+9/4a09dOzw3C95PauxyPMbmpdUMcJWALiLVrfgCLaEO9nlv6ZaVRaee6+dttZcz2FWzfa67xEPLPg/ID7BEG4NCazvnI7bHcimrFLYzNHZGkcxjzgnYSpJHngQ+pr/qS2JCLAQKLc6JeNigNO+xy4JhGgD9d+F/zkkfArXtafwJD++UuVNzLWYTKvKmwWymvIbgE2Aqe5xr9OTo4Dqj5BCSI1XiqMHwjY+2zWBP9lfBZEDLVmuVkUO+y6kEnJbU9106UfFd0WimlsNWXGPHJzQ4pR69p/TPYCJcj/9LDbdUqqK/2ewBzJEjYc2gNJjN8LYt0DLBb+G8Z+5RtkwAAw9Lr5QdsqjR+BMoq+ZgrjtZnl6+Wf+dDua+faVtlVnQ2bXbEvPCRRRPl09zN8f0tJ9H66jjoDEQFZf7GXJ4+zAi+3ObMC+qqVfhzIP7OeE5Ebpq98gvKjgmXfps=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47ae475-a95d-492f-58d0-08db472866fd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 14:05:05.6904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vHJaCY4ddd93+XbUjtVSkSfJBo2SKTjJj/8GWOD7V7d0TMTRfOpQjpWQAQphB0kC/b9h/fjYypjCc37nfbtTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_07,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304270124
X-Proofpoint-GUID: nRNOSL6zWq49ra98IRbtObeiX8y3WMXQ
X-Proofpoint-ORIG-GUID: nRNOSL6zWq49ra98IRbtObeiX8y3WMXQ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, 2023-04-27 at 09:52:33 -04, Alexander Bulekov wrote:
> As the code is designed for re-entrant calls to apic-msi, mark apic-msi
> as reentrancy-safe.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
> Based-on: <20230426161951.2948996-1-alxndr@bu.edu>
>
>  hw/intc/apic.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 20b5a94073..ac3d47d231 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -885,6 +885,13 @@ static void apic_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&s->io_memory, OBJECT(s), &apic_io_ops, s, "apic-msi",
>                            APIC_SPACE_SIZE);
>  
> +    /*
> +     * apic-msi's apic_mem_write can call into ioapic_eoi_broadcast, which can
> +     * write back to apic-msi. As such mark the apic-msi region re-entrancy
> +     * safe.
> +     */
> +    s->io_memory.disable_reentrancy_guard = true;
> +
>      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, apic_timer, s);
>      local_apics[s->id] = s;
>  
> -- 
> 2.39.0


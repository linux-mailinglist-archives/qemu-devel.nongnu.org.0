Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C06E6A3E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:54:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pooZY-0004bL-ES; Tue, 18 Apr 2023 12:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZS-0004aL-Jt; Tue, 18 Apr 2023 12:52:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pooZP-0007At-ME; Tue, 18 Apr 2023 12:52:46 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IEwvtO016686; Tue, 18 Apr 2023 16:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=qw6R7j4TkXhkLNUkJtpFHGzGppxcdz5uw9BtU5pREck=;
 b=BlEQXRkoOdnofgZXCl9rZzIfSxQCzmefUMkMiQxTRwW2r+Og5P/3ojWOSejqH6IonT9a
 nSkGlTNH1ZKyY0wN/FY6z+s70Eqw55mR7jFf/eCmJq4rc0sLlrb7UaakU1q0PvfxUT+N
 SHdj1SCSFhuaKuC0VzheUXlM0SQEXNEXyM/zhq7Vp2u/RtZLRK5N67xPATBKyuGUeyW8
 1SdwdoxgS9CsJ2tK1bhj8AmlT+fMZgkUcen5itPn7TifexncSONUkEAXkQs9tC+ryLmn
 CEnGZwy5VKO70WPOVLzHuPBnEJFlK30LEyK5fCiVcWoOh7QA/VkUsWIaB6P58VRu+2Cx ZA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pyjq468jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:34 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33IFUXLE015688; Tue, 18 Apr 2023 16:52:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjcbtmpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Apr 2023 16:52:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMw/jy3JfL8rMVflHBjoWi9oqKQgnMb0BNPxB1VlXLa7C9M+BrPH0/eOokEZkcdjn5arCrFY43nh+KGBr/QysDNJjNckFSUytk5W9A6suoI8x9L/RLTXmPw3lp6gnmNIZFJc7XXoIwbqlgCcC/VGVNf3MJE+n8HIyKr7Bb4Bq+3/bgFCM6vLPfnyzw9Y6PeBaI47dT3vQ5x8xuBzVXX9YiR7qEGRHt93r+Qw5pQLrvMTPJiP75/EIf9Bagd1FP7gm/AE+k+MTFbIUiX4XKfhuUuV7xQX8JPaWNMSfmUe23l/XwuD1itsUp6AhsZTEj2KssrTfw7hUmDt2l0JdMcPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qw6R7j4TkXhkLNUkJtpFHGzGppxcdz5uw9BtU5pREck=;
 b=iW1uYpvROBOrOlK69IY0I7PGM9DpQR2xeq55ELVADBAilhlr2ibRsYirE2SV20ZXQ7+8JPDPoJg4WUjdsslkBr2E/yE7hCV6dDjspKySrEPotjd11BlvsAfCFy1nCZBnB42KlXbNIqB/HLthvIr6JUsVd+HkrtrNGxUmaXK8DLFma0KSbhhMuh4pdaM/nid1S9nGW9pk1M6NRvxDcMyOUPrUkWrYvahQqex5MspYa5ak4+F8hh1yOh/IeoWexLiZwUU/+LvCOv/8xdTozjQbsmYzjMJ/5WQqYU2p4GDBPqUmztSPKyEN8Kz2TH2jvtksr4GgbZ5/pxDZWTrB2bqbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qw6R7j4TkXhkLNUkJtpFHGzGppxcdz5uw9BtU5pREck=;
 b=bYwUvjn63TgxbLNBCe043CGIhJ0jGm/6IlIlPhGgOrF288Ed0Cmg35fEJepytMATLidlNrG5kGAqYm2ygLJXOER49xPN4gpICrmSHM86o7W8iawEYOEBARiHME5MsAEA1cX+uEtS/s2wnzJycbaIWr7uoTEoEtnmseh0ntIQUvE=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by CY8PR10MB7314.namprd10.prod.outlook.com (2603:10b6:930:7b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 16:52:30 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:52:30 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, eric.devolder@oracle.com
Subject: [PATCH v2 0/4] hw/acpi: bump MADT to revision 5
Date: Tue, 18 Apr 2023 12:52:15 -0400
Message-Id: <20230418165219.2036-1-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::9) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_|CY8PR10MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: a8de9869-612a-4b0b-7440-08db402d4b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VHrwGdMdr4adq0BMVvo7tu8kV/q3f2mZnZYTa+1sADfMJsWd31Td0P3NTxvI9Negd3Y0T8wVgsloZtC3tuGtqrMsLJF8wtv5mHeyHASxyHjxfKxqUx3xrURFMYnREnnOJn6O+yXePUghOOemz37A8RiiK3IRuOW3lW4gvTcnD6yc9hlqGVkqDgDEknIy9GywoOKfvLiBzxGI6zBFbTasH2F+mPHNaaa4x9XZkyMD3Xj1M5bgMgXZAjwz516H5Gfeba+WBvnafYGN84YrLSQgThxnCCTE0N+qUBF5cZ6pcxiBw+vsdMFQSHFdhPdqNMfZ2rt3XZSFgtDz4zQ0CZShwwbJxkYd7BxQu/LBE4IokgtnzTCSvZ02jYQnolFSXiBgcGfAJ/fVa4aQAI0ECz6riizutsFbC11aHNK+LHf4a6A1fHJIxEIsHbr16G5jos8aMqkTMYqrL87Zi0ADtgtuNGDNQDlzqD1DMYfN4vIoXVCJbZnEb/XYabx5DXfxGkFaNl7H5fc0ChF7jaElro3aSQ5QHMEl+XwymRVeL21FpXMxOlKQmqjNJIesUf1s8M2YsTiNGLYqUpax9t5xHNCN80uvQE2dWneqsktyAtzvU0dj96UXmlVuyStXuVqbvIVF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(41300700001)(5660300002)(7416002)(8676002)(8936002)(2906002)(66476007)(66946007)(316002)(66556008)(4326008)(478600001)(966005)(6486002)(107886003)(1076003)(26005)(6506007)(6666004)(6512007)(186003)(30864003)(2616005)(83380400001)(921005)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rq77C+0B+U8tG2zmcFkh38jecRBOTXdmGdNSZz7dp3xEncpN20rd42tOwJ6j?=
 =?us-ascii?Q?le2jPAPR9HXDKWO2XhIwV7axHHnJxG79SuAtM3bqKm6w4j3VxKWzFzH1LXcQ?=
 =?us-ascii?Q?teV/PkG3Ci1N0hiYBUqdVLa+dju/MkMsYGD9Pk7vFDk/hdWWzJl05tUnwoz8?=
 =?us-ascii?Q?3zQB9/XvESnVMjg3l1JmvsE5cS7x4RYoW7KaSwvZcvr3XrR77NkI1sbDm8lB?=
 =?us-ascii?Q?xDGwHTEUPIreo5V8NVHCY9+WvKWXmtodREsUgif1F+zizGawTLMIqBpvSHRZ?=
 =?us-ascii?Q?2BY/37Qg6q45xE0vBzXC8UIjMMbY3ZKujF0Kl2B3krfUbbZbPfgHBTFYMNCi?=
 =?us-ascii?Q?RhcLTGwuREsj19gDXNpw1HIMZ+POViVm9D0OTNS+Ttco2WxdOUGJ0YXN9a8Z?=
 =?us-ascii?Q?GW6SQK9vT642PPhQKNXcrShlr++qQORuBbYtzSW3oT0xyeDyda1o16BYEOEe?=
 =?us-ascii?Q?Sw2XJhxLgZC8N6uDG5R/d8+Gr1/MNL7D5na6SGLWGazFqePIQpmILnlaUB73?=
 =?us-ascii?Q?byWKJGXFTKy3x40AxSF3bg8uNYLJDFVGnCGNoZTnYDIYHfJB35LdwC8miPXQ?=
 =?us-ascii?Q?cDir+2LUFmxM76HPP3iFVSFsCM8f9w+Fen8OREcsWuZ02Qa05S53/OuTPWnV?=
 =?us-ascii?Q?sV3HwoVbrkl/y3P4Fi32SBvnwPVZAXl1s0FqTay85U5mxPdVM+FApuvRNFSQ?=
 =?us-ascii?Q?X7qbH8TsmowaqhxZuBNzfds4djrEloyKTTWAbwFyQDxRu9y7/1w3F8CyP1Jb?=
 =?us-ascii?Q?1pPgsrHCGRf6lrFyKe7SDnQvmzXC8rtwiKTatRfBsRXcrkAjW7kAxnhCIznN?=
 =?us-ascii?Q?nLxHtKS9erxNt0ANjpklsw7Spra86n6JD7pBmN0rikuVvR6JCgDRdjX7pzKS?=
 =?us-ascii?Q?lyfz16ReSS/bzOv13bW1jnh4P0t0PclWs0WvvLfmm5QlWM7ZqE+gpLui8OtL?=
 =?us-ascii?Q?RNkUokVmP7b2sTtAFBq4KYv45yhu70B+/+ATHl8kEbHQaAjnqWWTuPTPIJYr?=
 =?us-ascii?Q?k97VYVUA1WehCq+HZ8ibavWCal833lPAgg9m1uKpXYmuCTNFhbBX7IVZQMEf?=
 =?us-ascii?Q?VwQA1rMK145iaysPjm0rDdn6/hot+WEJQmMbT2Yd3nxkTrXgUmTPUe3GU+it?=
 =?us-ascii?Q?9f/VYEum1V2kJ8iQWilKDvaYvt/e8kywzl80kFMIQLoa+UE/f8ti6jSPd4PT?=
 =?us-ascii?Q?21ax5zq/fMUf+JV2PAaIsFFZ/T8WtANgsFRdqBnoAW+Ii+gTaB6FUxex/EqD?=
 =?us-ascii?Q?QdB1dOYBvlYS7nz4eOvFUgUV15PzO6PfvOXCPAG36weEZpkf3+LZi5kz640Q?=
 =?us-ascii?Q?9pLRcYJgT4bxDCkQq0AAtJ7zXc4LUG9L5TRohwhaMbMoRHzNhhw/c6ujfC03?=
 =?us-ascii?Q?II71ulBOgnCU4sVq1cPivNsptTi83Jn/6RixPyTqko9PyzvN6w1TmoqipqhR?=
 =?us-ascii?Q?hOpz1bdswn2jDjdf5f2cd+QQPTpCWOWhLPeilJfiWxsSkrqQXOeQWSyXe0tH?=
 =?us-ascii?Q?4TaYpQpPozLUaRJ40rkbXyzQ29ZI/NzDfGsa7uuVsnHYeXi9FWgmzcEsJUXd?=
 =?us-ascii?Q?/SX2a995x0vnr85utMus92gCTMf96LrYXCiBNqhizzzxRIMnTBNNNuT32baB?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NSf3SgCg6Tt22kkOoH54uvdB76nKM/W/SsnbQXnjv4YQEQVNrft9SGJu/yeC3QqG4fmBGwaBGx7SLulTZyTh1ZvXiAKnGxNnmjWnJfmc7g/3dLkr7OzbZ0Cz8uPZCYM2cw0vAPTpUqsGxBPOkO3n7VrsotUOg1xTrZkmZfsmH9L4WHBoLOQ/OClcLjdz/mhjrZmxlbB6mhrJ+nVf3DBMeLeYVV8d5FZhILaNRsj1TSN46anov7WVwsafcG+KeGm2ZooS/pmDGt0su6unLQ8+Q7iGZQe70wV638GOyBR6nEIsMQbZeXcK0EuU3tGYybqi488IQIu8sECHxua4UbNekIvg37F9j+85CHhPCDA67PGpBC0NVspJH4UYZFTYGCWFVxcPLbYz/BbF2OjSbLvu46G3qLbl4JSGhLK65EuS0LW5d6c2PNs5chYmDHS5mqCkLN8XjKmhbSOcgxCgdmXqIlRg/PwG/KQZ6ja4QJF78XkcpaJsv67ITfY0rXsm67xZX0gEvesjCRSo/CB6Wyr3pGAWdaxwX5wP73gNrIbHl4kj0LDxZ5vcp6ci+H/fOogBgnajKMpCmNeWCdQDnCKsX/b2MtdVLfg/la/EE/LS/GyPbC9gms28RMvAQzknRCEiPMQ3GGtMRTOhABX/XNIoFsa9smQHHmFbt04Jtt31g2XkwNqPihQ2Tv/x67H2Xwn74GPE9IiCT5MA8J4VZn/Esj++frSGAGDNo121DkhvnD7tSlMc13758BdFhCZYfjxH+ZDhhUKNva9E53RnYk6lgyrptfidOZdZYR3Fa4lAs+NFewCWUGtETl5fCTrG/FD/CFTF1ZWmGL5GsG6FcJf/byLieKm2wc1iL8O6jP0G16G0K9aAWXzaiZomd9nrMP4wMDP6tZhvQjuzHUPAA0tDnA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8de9869-612a-4b0b-7440-08db402d4b34
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 16:52:30.3984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6xQzNcpfuqaMHUatg2gtHaK9vHRE8n0g1BtjE5BoC9lWYgm9QX5MFOTj32VO4GJ3XdxNWN2RT7Xm/Fpjlfc8ZVYoHFEozsgpVuL3zjpY1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7314
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_12,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180141
X-Proofpoint-GUID: r8azMvYembLN8J5u5nx0y5O13CBkxJ2j
X-Proofpoint-ORIG-GUID: r8azMvYembLN8J5u5nx0y5O13CBkxJ2j
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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

The following Linux kernel change broke CPU hotplug for MADT revision
less than 5.

 e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")

Discussion on this topic can be located here:

 https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t

which resulted in the following fixes Linux in 6.3-rc5:

 a74fabfbd1b7: ("x86/ACPI/boot: Use FADT version to check support for online capable")
 fed8d8773b8e: ("x86/acpi/boot: Correct acpi_is_processor_usable() check")

However, as part of the investigation into resolving this breakage, I
learned that i386 QEMU reports revision 1, while technically it
generates revision 3. Aarch64 generates and reports revision 4.

ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
flag that the above Linux patch utilizes to denote hot pluggable CPUs.

So in order to bump MADT to the current revision of 5, need to
validate that all MADT table changes between 1 and 5 are present
in QEMU.

Below is a table summarizing the changes to the MADT. This information
gleamed from the ACPI specs on uefi.org.

ACPI    MADT    What
Version Version
1.0             MADT not present
2.0     1       Section 5.2.10.4
3.0     2       Section 5.2.11.4
                 5.2.11.13 Local SAPIC Structure added two new fields:
                  ACPI Processor UID Value
                  ACPI Processor UID String
                 5.2.10.14 Platform Interrupt Sources Structure:
                  Reserved changed to Platform Interrupt Sources Flags
3.0b    2       Section 5.2.11.4
                 Added a section describing guidelines for the ordering of
                 processors in the MADT to support proper boot processor
                 and multi-threaded logical processor operation.
4.0     3       Section 5.2.12
                 Adds Processor Local x2APIC structure type 9
                 Adds Local x2APIC NMI structure type 0xA
5.0     3       Section 5.2.12
6.0     3       Section 5.2.12
6.0a    4       Section 5.2.12
                 Adds ARM GIC structure types 0xB-0xF
6.2a    45      Section 5.2.12   <--- version 45, is indeed accurate!
6.2b    5       Section 5.2.12
                 GIC ITS last Reserved offset changed to 16 from 20 (typo)
6.3     5       Section 5.2.12
                 Adds Local APIC Flags Online Capable!
                 Adds GICC SPE Overflow Interrupt field
6.4     5       Section 5.2.12
                 Adds Multiprocessor Wakeup Structure type 0x10
                 (change notes says structure previously misplaced?)
6.5     5       Section 5.2.12

For the MADT revision change 1 -> 2, the spec has a change to the
SAPIC structure. In general, QEMU does not generate/support SAPIC.
So the QEMU i386 MADT revision can safely be moved to 2.

For the MADT revision change 2 -> 3, the spec adds Local x2APIC
structures. QEMU has long supported x2apic ACPI structures. A simple
search of x2apic within QEMU source and hw/i386/acpi-common.c
specifically reveals this. So the QEMU i386 MADT revision can safely
be moved to 3.

For the MADT revision change 3 -> 4, the spec adds support for the ARM
GIC structures. QEMU ARM does in fact generate and report revision 4.
As these will not be used by i386 QEMU, so then the QEMU i386 MADT
revision can safely be moved to 4 as well.

Now for the MADT revision change 4 -> 5, the spec adds the Online
Capable flag to the Local APIC structure, and the ARM GICC SPE
Overflow Interrupt field.

For the ARM SPE, an existing 3-byte Reserved field is broken into a 1-
byte Reserved field and a 2-byte SPE field.  The spec says that is SPE
Overflow is not supported, it should be zero.

For the i386 Local APIC flag Online Capable, the spec has certain rules
about this value. And in particuar setting this value now explicitly
indicates a hotpluggable CPU.

So this patch makes the needed changes to move both i386 MADT
to revision 5.

Without these changes, the information below shows "how" CPU hotplug
breaks with the current upstream Linux kernel 6.3.  For example, a Linux
guest started with:

 qemu-system-x86_64 -smp 30,maxcpus=32 ...

and then attempting to hotplug a CPU:

  (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0

fails with the following:

  APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
  ACPI: Unable to map lapic to logical cpu number
  acpi LNXCPU:1e: Enumeration failure

  # dmesg | grep smpboot
  smpboot: Allowing 30 CPUs, 0 hotplug CPUs
  smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
  smpboot: Max logical packages: 1
  smpboot: Total of 30 processors activated (125708.76 BogoMIPS)

  # iasl -d /sys/firmware/tables/acpi/APIC
  [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
  [004h 0004   4]                 Table Length : 00000170
  [008h 0008   1]                     Revision : 01          <=====
  [009h 0009   1]                     Checksum : 9C
  [00Ah 0010   6]                       Oem ID : "BOCHS "
  [010h 0016   8]                 Oem Table ID : "BXPC    "
  [018h 0024   4]                 Oem Revision : 00000001
  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
  [020h 0032   4]        Asl Compiler Revision : 00000001

  ...

  [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
  [115h 0277   1]                       Length : 08
  [116h 0278   1]                 Processor ID : 1D
  [117h 0279   1]                Local Apic ID : 1D
  [118h 0280   4]        Flags (decoded below) : 00000001
                             Processor Enabled : 1          <=====

  [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
  [11Dh 0285   1]                       Length : 08
  [11Eh 0286   1]                 Processor ID : 1E
  [11Fh 0287   1]                Local Apic ID : 1E
  [120h 0288   4]        Flags (decoded below) : 00000000
                             Processor Enabled : 0          <=====

  [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
  [125h 0293   1]                       Length : 08
  [126h 0294   1]                 Processor ID : 1F
  [127h 0295   1]                Local Apic ID : 1F
  [128h 0296   4]        Flags (decoded below) : 00000000
                             Processor Enabled : 0          <=====

The (latest upstream) Linux kernel sees 30 Enabled processors, and
does not consider processors 31 and 32 to be hotpluggable.

With this patch series applied, by bumping MADT to revision 5, the
latest upstream Linux kernel correctly identifies 30 CPUs plus 2
hotpluggable CPUS.

  CPU30 has been hot-added
  smpboot: Booting Node 0 Processor 30 APIC 0x1e
  Will online and init hotplugged CPU: 30

  # dmesg | grep smpboot
  smpboot: Allowing 32 CPUs, 2 hotplug CPUs
  smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
  smpboot: Max logical packages: 2
  smpboot: Total of 30 processors activated (125708.76 BogoMIPS)

  # iasl -d /sys/firmware/tables/acpi/APIC
  [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
  [004h 0004 004h]                Table Length : 00000170
  [008h 0008 001h]                    Revision : 05          <=====
  [009h 0009 001h]                    Checksum : 94
  [00Ah 0010 006h]                      Oem ID : "BOCHS "
  [010h 0016 008h]                Oem Table ID : "BXPC    "
  [018h 0024 004h]                Oem Revision : 00000001
  [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
  [020h 0032 004h]       Asl Compiler Revision : 00000001

  ...

  [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
  [115h 0277 001h]                      Length : 08
  [116h 0278 001h]                Processor ID : 1D
  [117h 0279 001h]               Local Apic ID : 1D
  [118h 0280 004h]       Flags (decoded below) : 00000001
                             Processor Enabled : 1          <=====
                        Runtime Online Capable : 0          <=====

  [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
  [11Dh 0285 001h]                      Length : 08
  [11Eh 0286 001h]                Processor ID : 1E
  [11Fh 0287 001h]               Local Apic ID : 1E
  [120h 0288 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0          <=====
                        Runtime Online Capable : 1          <=====

  [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
  [125h 0293 001h]                      Length : 08
  [126h 0294 001h]                Processor ID : 1F
  [127h 0295 001h]               Local Apic ID : 1F
  [128h 0296 004h]       Flags (decoded below) : 00000002
                             Processor Enabled : 0          <=====
                        Runtime Online Capable : 1          <=====

In terms of testing older operating systems, I did:

- Windows Server 2008.
 By opening Device Manager -> Processors, and watching/counting
 the listed CPUs before and after hot un/plug operations.
 When hot plugging a CPU, the new processor shows in the list;
 one more processor is available after the hotplug.
 When hot unplugging a CPU, Windows refuses, with the message:

  The 'Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz' device is not
  removable and cannot be ejected or unplugged. 

 This is expected as hot unplug did not work in Windows 2008.

- RHEL 6.9
 Kernel 2.6.32-696.el6.x86_64
 Build Feb 21 2017 
 From dmesg:
 ACPI: APIC 000000007ffe32f0 000F0 (v05 BOCHS  BXPC    00000001 BXPC 00000001)
 SMP: Allowing 16 CPUs, 8 hotplug CPUs

 # cat /sys/devices/system/cpu/online
 0-7

 (QEMU) device_add id=cpu8 driver=host-x86_64-cpu socket-id=0 core-id=8 thread-id=0

 CPU 8 got hotplugged
 Booting Node 0 Processor 8 APIC 0x8
 kvm-clock: cpu 8, msr 2830ed00
 Will online and init hotplugged CPU: 8
 microcode: CPU8 sig=0x50663, pf=0x1, revision=0x700001c
 platform microcode: firmware: requesting intel-ucode/06-56-03

 # cat /sys/devices/system/cpu/online
 0-8

 (QEMU) device_del id=cpu8

 Broke affinity for irq 24
 CPU 8 is now offline

 # cat /sys/devices/system/cpu/online
 0-7

 RHEL 6.9
 kernel 2.6.32-696.el6.x86_64
 build Feb 21 2017 

Both of the above 'legacy' operating systems behaved as expected.

Regards,
Eric

---
v2: 18apr2023
 - Code formatting changes per Igor Mammedov
 - Included the steps in bios-tables-test.

v1: 28mar2023
 https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06705.html
 - Initial series for ARM and i386 MADT revision bump to 5.

Eric DeVolder (4):
  ACPI: bios-tables-test.c step 2 (allowed-diff entries)
  hw/acpi: arm: bump MADT to revision 5
  hw/acpi: i386: bump MADT to revision 5
  ACPI: bios-tables-test.c step 5 (updated expected table binaries)

 hw/arm/virt-acpi-build.c                      |   6 ++++--
 hw/i386/acpi-common.c                         |  13 ++++++++++---
 tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
 tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
 tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
 tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
 tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
 tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
 tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
 tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
 tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
 tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
 tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
 tests/data/acpi/virt/APIC                     | Bin 172 -> 172 bytes
 tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 412 -> 412 bytes
 tests/data/acpi/virt/APIC.topology            | Bin 732 -> 732 bytes
 19 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.31.1



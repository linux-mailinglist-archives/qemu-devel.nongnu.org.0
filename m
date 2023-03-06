Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C550B6ACE29
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:34:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGaF-0005E1-M4; Mon, 06 Mar 2023 14:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGZl-0004zc-9Y
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:32:52 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGZi-00089b-Hc
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:32:49 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326HSwZa027012; Mon, 6 Mar 2023 19:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=PN+jEZpmOpXZQIaBhmTEGuUN8iVw0D0dHMwBWDerDmA=;
 b=KwgFRMHgd4nsDF47euM3j6oZtxmFbXaOnLudlrbMNGNyelNO+IZmNETMlDLpWQhePMwA
 BTH0P0IZfcVrvzWyd0A8m8eHc6Zoth4D5PWgcJikip/ijM1BaZzd1ardtRCVjVIsu9Ih
 o3Fej8Z1d4OL/QYgTuaDAjbs2hmeq+zE5nznONdfOb4//1BBMbm8+Ge08/4BAm6kJLFP
 w8GuTK9srSVUARe+Aij1uX1sPorFiy58UdJsa6e2twGY1lo80vYiqIk7UZtZyzNItM8G
 WSERIDxcP9BENnTzbGOcpx+JAcrHntxnrEnIJ4bB+Ago57z/z4nSpdNBf9Gl5LEdttZX cg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168ksf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:32:44 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326JFWjf023251; Mon, 6 Mar 2023 19:32:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u056cxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWkGzdljf335o54N54emdePqCjKzQetXs9Qg4xkGqqM1kLUS2yGI7fLvyBCiJ7qBJN8u09BjHdVUvZpm+3IF+NQxPh45v3iPwCNM9UMZFcN4Bw5AqaTboB6/068ayt/78NphIiPXS2PouDNkkhFWOB5kSvuNlBAwYO3S1E6w5/AhvD7zOjP8Q8VEQBVixX5wpSkxbREN0hgzLOuy6z/5tGalnuSBCkSTYMzTJYrLJy3Ohz+IKwJoMfzMz8ZdLavJ9pQUDLU9Dqs/OM9fjaXg7fwc4eiCt6PPNZk9f2JM9FgzStOhe+c2kCp24ePYkKY8zhR0C2huW3Ebh+gPt6R00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PN+jEZpmOpXZQIaBhmTEGuUN8iVw0D0dHMwBWDerDmA=;
 b=jL6R97U65ICasSvJoxziZ/GSQkBTLp0ej+jGV28gEzEeUuso/E37p7QWXxyVPMXMSLWCNI8tPjlHq6JZ6admH875MkFY/PW9ksf5x6A1BcpDQ/TfLg0ywLhCInA4YyZwAtbmJicYMksed6a8JzCAEKS+dp+HG9Zfeog8I+bJ76iuS1+1LAvyqhG12rsefIzPPRFckcRWY3VVPSeyEKndZkldj+sLmA9TTZVeGyw9EBjpbJP9TCrzpxA0olFIPR/6teSL73JC/cmNrQj7x4gAUcSy1apPNICjiQor6W4z2Ag+4Y8Ipx20G4rsw270g5toZQcOUlt1aG8zYHWiGz5zNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PN+jEZpmOpXZQIaBhmTEGuUN8iVw0D0dHMwBWDerDmA=;
 b=YDo0wunf8j2FtF86zN6vgLF26NMaG68KDfpiugne41FYhldEfJ+jOQD1lPo17cZMg2HoiB5n+DI2WfUXnQ0tPo6h340RzMu/zWK5DD5Pd5f0+4lMWXFWuFVgNNpFwRhd2mrky2yFgAi09pCpblDVmP2BTIOpH+s845w8+J69bYk=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by IA1PR10MB6170.namprd10.prod.outlook.com (2603:10b6:208:3a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:32:41 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 19:32:41 +0000
Message-ID: <cd219149-2f67-8d35-fe3a-95a087d4da53@oracle.com>
Date: Mon, 6 Mar 2023 19:32:34 +0000
Subject: Re: [PATCH v3 07/13] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-8-joao.m.martins@oracle.com>
 <20230306111539.64370071.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230306111539.64370071.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0233.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::22) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|IA1PR10MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 004a6b41-2b31-4378-eba5-08db1e798d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5DiWi+c+TNF4HPOJK4ZHN+AWZlb+lUfe8yCTo9bnepSlmdR0PECVG+HC3/NbbSGmfbz08N/eBH3x2keibRlRh4WJPb7mHz8CN3gfx1Zgqw8KzfEmhi1cAiWE8auMyueQGraADfBinIEME7A6cLAk6+bDMxWewDnYClGPu3IuwlpQCp9ESEd2tgm4Z2OtwQnS2ODj+OQ+7t8nuU73NEhtfne+JDlnJ+jTuVzUmF0BFKKcCsIUl2H06bHbKmMHkm+YSVfiMFqTxXc4QEx225on1/6n8cJsZM56JCK6IzQLGZ89kSQY8nZj16q61W4vxnzSv5QbMcItRGMvINCNt0LvCNsG1PXNHhqZ2ZxuqOI06NrT5UW1WdY7nTPMP3PPaPIlMlgWY4EcL2eRI5JQ18WVcasnXmjdgiLApN4oII9I0M7jMetIHYE9yay/N1mT689p3rbYs8UONlLJvjRT4d8UGUcDIAVx5aHlWvjlFpNDJW2btNU6IwNPKcjl8V366OKSkN1HDDlmtFMZgU3xadmE/oFNZWUV+Hxs3aGm36jDjcLnBwoWezSkheQUtRityohEtWsn6j8PGnk4QgDGOQ/0SuaPV3kumJ932NTOUoBgLI1eULpHabqJ2j51GBvWjw56hTqGYK3gA4Q3HDUkkSRMejduNnCu64tqdMs+b5GLDpY3msYjVYTnEhI1WL3MQEwADCvNv85hswF/yjdjrLv7kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199018)(478600001)(31686004)(6506007)(53546011)(6666004)(6486002)(83380400001)(38100700002)(2616005)(316002)(66946007)(66476007)(66556008)(6512007)(54906003)(26005)(186003)(8676002)(41300700001)(4326008)(6916009)(8936002)(5660300002)(2906002)(31696002)(86362001)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUJGK0hCbVZSMVBCVU0vcXVueXc5QmRzTFV1andRM0dmdldxWWlBU1puZ3I0?=
 =?utf-8?B?ald2VWIvZ3I4d0FtS3VZY2E4Zkp1SWFxWUZuR25UMU9QQ3FWTlB4OUdaNGs1?=
 =?utf-8?B?ZEJBb1VLS0h5MXlSWit2YlpNQzF1NlBBSmFYYStjbVpFNnBIek1LeDZiM3Bl?=
 =?utf-8?B?U21hNGR3Umw0NjVmMHRKdnBMTG9DOFV4QkduRCtSbkZYb0RsRFFQZDlCdlRa?=
 =?utf-8?B?d1ZLMG0rYmk0VmtiTHVVYm0xSVNXNXR1dStFblFEWDVGb0Y5bFVsb3BqS3Vq?=
 =?utf-8?B?U1ZFUUw3dlYvUXlZSlJUbEgxWmNoTUhCUlBpWTlGcDl4SGRwK2hOc0J0c3Jv?=
 =?utf-8?B?WnRIOXlWbUN3ZCtKcUxNQnFWaFFVdTZYR0tTN2lJS1N4dndISWJ6TjF1c3pZ?=
 =?utf-8?B?Qkx3R1paK3RrT1RVMGxBVXBEY0d2TGVqVzNHTk5ZVDJhM1RvSTF1MXYvNzJy?=
 =?utf-8?B?c1VXWlBnWGppaE15TlhuU3I5YklkUW1mOUIyeFNDUUsrNTYwRFpoRFZCSExl?=
 =?utf-8?B?Nnd3ckdwaVArWmpNZDVKRUJEY3cwVUdsSFVnYUdSak5id2VDM3h6WU1tcVNX?=
 =?utf-8?B?Q3BWbFYrUk9GNU1vN1NsM2JVd1NzemZjNnZwSW5wL3UxRkg4a3pvRjU1MGVC?=
 =?utf-8?B?SnlCOTc5dzNUeERuNUNiMm4ra1crclc1UEVCbGlxa2dpWVN2eUErdEtQQXZT?=
 =?utf-8?B?VzlqZzVmeUFHYnA5bHdUOU01WUJSTDlkdS9KaXFUK3JvcG1rYThHeXd4cHd3?=
 =?utf-8?B?eFZIR053cElReFhabE5tdThXMWtXUGhlTHFlMGQ0bFNsbkZhbW9oWUREdU8v?=
 =?utf-8?B?VXN0SjRndE41SnFldDRmVURyQUsrT3FPbjJmNWlJenZJdEJ5NWszQlJ2Qnly?=
 =?utf-8?B?Z3pJN2pGUmxzTnJlRGxkQVVad0RmOXRSUnJkUWFuS3pVVzdtUjE4REEwdXpi?=
 =?utf-8?B?OFBFVzRCWkVtbnBVNld1SXEwRlQ3QTVKL0ZIUkt5QXJwQjFJM01rVVVNd1BQ?=
 =?utf-8?B?a0pKcnlXK1JOakh3SGRZZUhqMTAvN2RmWVE1SklDNTU3Ry9kZHRGNUtCTDkx?=
 =?utf-8?B?NVBZZmJOUHFhYWVGY3hFYTRaRzFNT3JxY05ISG1VeU5XancwdStWbTJ2YkZk?=
 =?utf-8?B?SXQxaXArQnU2akdCN1AzRU4vOUhseXViOUx5cmdCYjRueVlPUXBBcGRrcjdQ?=
 =?utf-8?B?UTVaSUpMenFZeWVSLzBEMzg2T240MmxUVkRXN2V3OFJrSEU1SGN0b0g0SnYw?=
 =?utf-8?B?bjJzZXllTFlNWm9EME1tOFZCUVFPenUxaXBEWk5zbVZYdHJ4TmpnZTV6cVhk?=
 =?utf-8?B?Qkg4c29zZG5wSDVPQS9oSnZKM2ZFcnUzYlMvQksrdVIzUExUUlpyRnlzc0xp?=
 =?utf-8?B?NjIrVTRSOTdDUmNHaTM0VC9YaE9DdjZzcU5RNmp0OVlPR2NJSzIxL0IvQnlU?=
 =?utf-8?B?eXVjc3BCK1BQWDRNMXdMa095dTFWT0NURWNhcGd5VHM5UjlRUUFWMktzbTJa?=
 =?utf-8?B?SUYxZnRGdDFYc3pmK3BCeWxoNFVITjlFbTQ0bFhCWWNaVFcydjZxcjZFa3VZ?=
 =?utf-8?B?Mjl1eXRpbkFNa25QbGViMVEzTmNpbHJEek04VlBQYWNrZVNHOXhsWlJYNXd4?=
 =?utf-8?B?TER2R2ljb1Uvcyt5MURQZ0NIUnhRaXhWejRXYmpYa1BvWktJUkllMVpCVnIx?=
 =?utf-8?B?YjdGdTF3OGN3ZUFXeG1IcDBQSmxLcGQzbUovNHIyNEUrV3dQUXd4V05FdE5J?=
 =?utf-8?B?aHFTM25qY1pRRy91T2tjR1BGWUZFYmV0N0p2VHZDdHE4cmJPMzREdjljckdH?=
 =?utf-8?B?K3Rzd000MUFmNXZzRlAzd3UydTNZRFQwMXFsN1dDYldnVzR4cUJoWGVsK2pS?=
 =?utf-8?B?bGdWWUxUSllYVDhhTXJ5dC9URWlBR3VGMFBEQ0h2eXNjRlFyeGh2NThaYjgv?=
 =?utf-8?B?RzhNV3NMcnV1NWw2T1BuL2g5OUlFU2kzMXp3YWErTFh0TGJ6VmhrWGN5YnBu?=
 =?utf-8?B?d2hnQ1lUNzlDR3Nxd2oyNUc4dnJReTNoeXBEYmQrakZyeWUrZEdVbkZ1dnly?=
 =?utf-8?B?eXdVSkNJWmc4R3hwNW5IU2pBeEtMcHJENGkzRm9XUlFGN1FGZ3cycDEzQWZW?=
 =?utf-8?B?T2ZvdCtOTDVEVFc1N2l6bmlhTTRTME5CTFMva1dPVjNjekZIamNRZHNvbXJD?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rS2vFSmlACfDUA8n5SEyZU+DR0Pu4myrU9sZapRDmblHGUXiLk41gtgbfbdfPWuHZEamk/gRbdzwl8KqTicH7Nop3fpZtGpBsBNsq2VrU+NXSd3SzeBQuUc5JAHCE7eMFbZFfebty4MAC+z2xZqiCDp/Omrgr3yrImTBf7vJ/dzwOlYRmizjhZvZoQteMfzjtTOmouPU6LuTb8D6HbAYbwAck44Lboqzlppr6+Vrslv9diFIcVgHrcVEyEBEgrI525mTWPuR+1tfM7B4pBcjfgjMyfBBSoiapwKZ2sYBcUSrqlblS7SwcCXfBoKrW/1w2T/mWvjzK3uSJ6c+YMAMXiAahKwLN5EaDX5QWklLqYdp0BVey+J9SwGq9eCvedKf0LGz7zwgnLGMDLw8AgP6eXjz2brs+QWBHznZxT91u8P10G4Ft4jlhbEnrKQ+tvSuWS3JDdouqzkCQMda14aNmhJT+fovY5JBq3N0YxDk2psYOrr0iYmSifhXHRz45J4k82B+rZVjgbCOhSBo+Ifde9geUuNwa0th2TbnDhw+R7AiYwBep33s2vLrhnT11KIzI20EePxPMUp8N/S8H463GlwH+lgxTEpTkMJasAc5aLy3c35VFhEaRzRd2HO332YndWhfAN3KuhtS9s9cM1PurU0ph5rxnPgjaWL9dPgbcBKJhNnlUwk5chDUV/C5HPZiUGmLoLbP4FNPsXyv71RyrrlXcR2pN4DpnZb2I/RMVNnNhbmYTHD5GBrJ9cL5CfB8nijy+zC03hnHdV9lD4wzG1ZNojbjJhzy87UV7jMqsKNym+3UmknsrYfhcyQvwGxe
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004a6b41-2b31-4378-eba5-08db1e798d05
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:32:41.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stEvaJeJNCNBjodsUaSYrLdwRX/T18U7zypgkHsJoVfPplwvVO9VGi0KwPkgty0puLUD51wPwhllk5B6AA0BxYW7PGsqJgkhKG04s9axYwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_12,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060171
X-Proofpoint-GUID: Im1y35M1RSxztTPsi2fefGTqvTX0Z2XF
X-Proofpoint-ORIG-GUID: Im1y35M1RSxztTPsi2fefGTqvTX0Z2XF
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/03/2023 18:15, Alex Williamson wrote:
> On Sat,  4 Mar 2023 01:43:37 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> According to the device DMA logging uAPI, IOVA ranges to be logged by
>> the device must be provided all at once upon DMA logging start.
>>
>> As preparation for the following patches which will add device dirty
>> page tracking, keep a record of all DMA mapped IOVA ranges so later they
>> can be used for DMA logging start.
>>
>> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
>> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
> 
> Commit log is outdated for this version.
>
I will remove the paragraph. I can't mention vIOMMU usage blocks migration as I
effectively do that later in the series.

>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/vfio/common.c              | 84 +++++++++++++++++++++++++++++++++++
>>  hw/vfio/trace-events          |  1 +
>>  include/hw/vfio/vfio-common.h | 11 +++++
>>  3 files changed, 96 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index ed908e303dbb..d84e5fd86bb4 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -44,6 +44,7 @@
>>  #include "migration/blocker.h"
>>  #include "migration/qemu-file.h"
>>  #include "sysemu/tpm.h"
>> +#include "qemu/iova-tree.h"
> 
> Unnecessary
> 
True, I had it removed for v4 as Avihai pointed that out to me too offlist.
Same for the other one down below.

>>  
>>  VFIOGroupList vfio_group_list =
>>      QLIST_HEAD_INITIALIZER(vfio_group_list);
>> @@ -1313,11 +1314,94 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
>>      return ret;
>>  }
>>  
>> +/*
>> + * Called for the dirty tracking memory listener to calculate the iova/end
>> + * for a given memory region section. The checks here, replicate the logic
>> + * in vfio_listener_region_{add,del}() used for the same purpose. And thus
>> + * both listener should be kept in sync.
>> + */
>> +static bool vfio_get_section_iova_range(VFIOContainer *container,
>> +                                        MemoryRegionSection *section,
>> +                                        hwaddr *out_iova, hwaddr *out_end)
>> +{
>> +    Int128 llend;
>> +    hwaddr iova;
>> +
>> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>> +    llend = int128_make64(section->offset_within_address_space);
>> +    llend = int128_add(llend, section->size);
>> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
>> +
>> +    if (int128_ge(int128_make64(iova), llend)) {
>> +        return false;
>> +    }
>> +
>> +    *out_iova = iova;
>> +    *out_end = int128_get64(llend) - 1;
>> +    return true;
>> +}
> 
> Not sure why this isn't turned into a helper here to avoid the issue
> noted in the comment. 

The reason I didn't directly reused, as the calculation happens in different
places in the existing listener. But I noticed now that I am confusing with
llsize (in the old checks I have now removed). @end is not used in the check
that preceeds it, so I am moving this calculation into a helper. Presumably I
have a new preceeding patch where I have this vfio_get_section_iova_range()
added. and this patch just uses it.

> Also why do both of the existing listener
> implementations resolve the end address as:
> 
> 	int128_get64(int128_sub(llend, int128_one()));
> 
> While here we use:
> 
> 	int128_get64(llend) - 1;
> 
> We're already out of sync.
> 
True

>> +
>> +static void vfio_dirty_tracking_update(MemoryListener *listener,
>> +                                       MemoryRegionSection *section)
>> +{
>> +    VFIOContainer *container = container_of(listener, VFIOContainer,
>> +                                            tracking_listener);
>> +    VFIODirtyTrackingRange *range = &container->tracking_range;
>> +    hwaddr max32 = (1ULL << 32) - 1ULL;
> 
> UINT32_MAX
> 
/me nods

>> +    hwaddr iova, end;
>> +
>> +    if (!vfio_listener_valid_section(section) ||
>> +        !vfio_get_section_iova_range(container, section, &iova, &end)) {
>> +        return;
>> +    }
>> +
>> +    WITH_QEMU_LOCK_GUARD(&container->tracking_mutex) {
>> +        if (iova < max32 && end <= max32) {
>> +                if (range->min32 > iova) {
>> +                    range->min32 = iova;
>> +                }
>> +                if (range->max32 < end) {
>> +                    range->max32 = end;
>> +                }
>> +                trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                            range->min32, range->max32);
>> +        } else {
>> +                if (!range->min64 || range->min64 > iova) {
>> +                    range->min64 = iova;
>> +                }
> 
> I think this improperly handles a range starting at zero, min64 should
> be UINT64_MAX initially.  For example, if we have ranges 0-8GB and
> 12-16GB, this effectively ignores the first range.  Likewise I think
> range->min32 has a similar problem, it's initialized to zero, it will
> never be updated to match a non-zero lowest range.  It needs to be
> initialized to UINT32_MAX.
> 
Yes, let me switch to that. I'll place the min64/min32 to UINT64_MAX/UINT32_MAX
in the place where we initialize the state for the dma tracking listener.

> A comment describing the purpose of the 32/64 split tracking would be
> useful too.
> 

Yes, definitely e.g.

/*
 * The address space passed to the dirty tracker is reduced to two ranges: one
 * for 32-bit DMA ranges, and another one for 64-bit DMA ranges. The underlying
 * reports of dirty will query a sub-interval of each of these ranges. The
 * purpose of the dual range handling is to handle known cases of big holes in
 * the address space, like the x86 AMD 1T hole. The alternative would be an
 * IOVATree but that has a much bigger runtime overhead and unnecessary
 * complexity.
 */

>> +                if (range->max64 < end) {
>> +                    range->max64 = end;
>> +                }
>> +                trace_vfio_device_dirty_tracking_update(iova, end,
>> +                                            range->min64, range->max64);
>> +        }
>> +    }
>> +    return;
>> +}
>> +
>> +static const MemoryListener vfio_dirty_tracking_listener = {
>> +    .name = "vfio-tracking",
>> +    .region_add = vfio_dirty_tracking_update,
>> +};
>> +
>> +static void vfio_dirty_tracking_init(VFIOContainer *container)
>> +{
>> +    memset(&container->tracking_range, 0, sizeof(container->tracking_range));
>> +    qemu_mutex_init(&container->tracking_mutex);
> 
> As noted in other thread, this mutex seems unnecessary.
> 
Already deleted it for v4.

> The listener needs to be embedded in an object, but it doesn't need to
> be the container.  Couldn't we create:
> 
> typedef struct VFIODirtyRanges {
>     VFIOContainer *container;
>     VFIODirtyTrackingRange ranges;
>     MemoryListener listener;
> } VFIODirectRanges;
> 
> For use here?  Caller could provide VFIODirtyTrackingRange pointer for
> the resulting ranges, which then gets passed to
> vfio_device_feature_dma_logging_start_create()

Oh, that would be so much cleaner, yes. Will switch to that.

> 
>> +    container->tracking_listener = vfio_dirty_tracking_listener;
>> +    memory_listener_register(&container->tracking_listener,
>> +                             container->space->as);
>> +    memory_listener_unregister(&container->tracking_listener);
> 
> It's sufficiently subtle that the listener callback is synchronous and
> we're done with it here for a comment.
> 

Will add a comment e.g.:

 /*
  * The memory listener is synchronous, and used to calculate the range to dirty
  * tracking. Unregister it after we are done as we are not interesting in any
  * follow-up updates.
  */

>> +    qemu_mutex_destroy(&container->tracking_mutex);
>> +}
>> +
>>  static void vfio_listener_log_global_start(MemoryListener *listener)
>>  {
>>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>      int ret;
>>  
>> +    vfio_dirty_tracking_init(container);
>> +
>>      ret = vfio_set_dirty_page_tracking(container, true);
>>      if (ret) {
>>          vfio_set_migration_error(ret);
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 669d9fe07cd9..d97a6de17921 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_wi
>>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>> +vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
>>  vfio_disconnect_container(int fd) "close container->fd=%d"
>>  vfio_put_group(int fd) "close group->fd=%d"
>>  vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 87524c64a443..96791add2719 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -23,6 +23,7 @@
>>  
>>  #include "exec/memory.h"
>>  #include "qemu/queue.h"
>> +#include "qemu/iova-tree.h"
> 
> Unused.
> 
Had it removed already preemptively

>>  #include "qemu/notify.h"
>>  #include "ui/console.h"
>>  #include "hw/display/ramfb.h"
>> @@ -68,6 +69,13 @@ typedef struct VFIOMigration {
>>      size_t data_buffer_size;
>>  } VFIOMigration;
>>  
>> +typedef struct VFIODirtyTrackingRange {
>> +    hwaddr min32;
>> +    hwaddr max32;
>> +    hwaddr min64;
>> +    hwaddr max64;
>> +} VFIODirtyTrackingRange;
>> +
>>  typedef struct VFIOAddressSpace {
>>      AddressSpace *as;
>>      QLIST_HEAD(, VFIOContainer) containers;
>> @@ -89,6 +97,9 @@ typedef struct VFIOContainer {
>>      uint64_t max_dirty_bitmap_size;
>>      unsigned long pgsizes;
>>      unsigned int dma_max_mappings;
>> +    VFIODirtyTrackingRange tracking_range;
>> +    QemuMutex tracking_mutex;
>> +    MemoryListener tracking_listener;
> 
> Let's make this unnecessary too.  Thanks,
> 
Got it.


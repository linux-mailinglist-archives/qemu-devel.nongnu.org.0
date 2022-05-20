Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF352EA83
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 13:09:16 +0200 (CEST)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns0VP-0007gN-6q
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 07:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns0Ld-00047t-Iq
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:59:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns0La-0003XM-8M
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:59:07 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9bR0W017374;
 Fri, 20 May 2022 10:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vaQw4rwzSy4YsBJjGtEbmxXUzCBE1AGvGPCMrDYsQRg=;
 b=I2Tp0j44E+dMlIW7YhlY6p4bjSEwOelBVq4o+HDeVT+FM7YoQ0GCm+TdWzF7AZaRa9rZ
 yeE8ugTfyRDdIO9ihyog5KB8U6M0mLV0XR/YhbRGCmxWPl/E+ymMN1J3HAnipJtLQygC
 0ZXSB+/MKKo8xiXph9xW2th9W5vcWnTtKiUhXB2Xdp2O54enOevAySPxnCZ078Vr8hSX
 Eh4WUMkc9ntoMDvDlhup8uBtEljKQP1aaJ8fAHnQ5l96nxG570PgxqbnMrSQH0gTJQuF
 uyuJeSiAK+35OmxrcJSIDZm6o70XB3QZj5XWK99l+hxHamjYq489nzBHr7w/OgfEanQq sA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g24ytxrre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:59:03 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24KAnurO028992; Fri, 20 May 2022 10:59:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g22v6cggy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:59:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtZQnDecDPF0Y5sT6hTBCL9zlkIyJHUiUuxtkDAdShp3TEATGWbTUH2pJFmNk4c4RDkClGGmwaoGsXOyjgMf571lqW9cx7pAX9MwrMWknHk0sPXbR+nvULHC2H2mMBWhbsCebW0aB1g+QjnnS0Gtw/ThjaIKEsqJLMlBaX52pZt8IQ5tRk4XeRDtojjDBcKJz/4CNLArfnDLLEsVTL1wsqDS5I1Y/lZS2Qrslvb2f9ryBpjVtAAKDOi9xR0TvPcpl/2rtXv4KacWlnXJ7m1ZD5mz95QdNwIGpomuIGzF/OeA15PIMQLGd8TOjiSOr3Kon0ft3BCBN4Q968nj06bw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaQw4rwzSy4YsBJjGtEbmxXUzCBE1AGvGPCMrDYsQRg=;
 b=iZxfkMUVl8Lqj+7U0lNQViFw6H8Mi8gKbhh4Z7kA4f27u/5/lccyFMMg98QEvZfWAmN8lCqBuNY0Oyk6d1UZPRnz6bM9Z4MxdvxWlp+uA6mGPPtilpewdTqFOJuL3KHZWxZUX5h28knTf9RkExz2xPcPIffjjbVKw1bj9Co2E/4gDKMVUbgcda2Nxk3ffy/K7ernjojxmFkKQeEyBs204ayhPaMklSLPAWcQKx7IAXn3bL6+nO5/l4NscnTlOprZ4gXb4rmyyMFpMjGiWN5aUUI+MAfKc9g66dVzcL/UhbYF4GXWBOKF7px+ZfGFcHSJaIRTSiF/kiSWtBksO76a7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaQw4rwzSy4YsBJjGtEbmxXUzCBE1AGvGPCMrDYsQRg=;
 b=KrVCUrn0HGvPaPxU0ULu+Dv6RfcU3XZxxce8kDZfGDRjJAu73NMJEHcz7AycmCVsMYnUlXvBgAjErW6NSnitW2k0nZ+i4Opwj5cJYgX5rKp76PX8uAvU1LklKEiNBOJ3IsBte1Hwz7rN00SDf5STX+zLIOsqDAtcWTGEvsFmFW4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MWHPR10MB1773.namprd10.prod.outlook.com (2603:10b6:301:8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 10:58:59 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 10:58:59 +0000
Message-ID: <49f27f66-33e8-e6ed-c791-fb6e7b7a7938@oracle.com>
Date: Fri, 20 May 2022 11:58:50 +0100
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page tracking
 is not supported
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>, qemu-devel@nongnu.org,
 Jason Gunthorpe <jgg@nvidia.com>, Juan Quintela <quintela@redhat.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220512154320.19697-5-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b66f6b18-96a7-4789-d7d3-08da3a4fbdf4
X-MS-TrafficTypeDiagnostic: MWHPR10MB1773:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1773CF9DC02A9F18BA23D8B2BBD39@MWHPR10MB1773.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqY3F6RS+6P+QedK7fVgonDliGbAenJaUpassr00wO2h1oNn+5Vadyq9FeXzfExfGng2KXxNniuOlwRKF3Wp0hb3SmOr3qayy6Z/T/ERzzCxZaChyEFBOSlXcBW4mhoWTNADqGMRi/JdXdbaHqtekcOJZ2KsLyoGnSZqlNluqaLMQSvKn/8XYMj5KM4j7VRd0UUKGkiweTSblfmKesgVn7oz8QPFENnCTYvhxbZZbmFHp/m/N5x2lkIOAkK/pTBNYBpgP1gfbdxPSfEmtGgIcTh1YyZI4ajZlGfJbriU4L85m/k2p6LreIg34uhZprhug+YGGe7cDh8y+LhBzUTPGaE7UvXP7EOf64N20P4w0sz2Wu8NuDC9tbhQ2HJPg6UTnAJPy0TitOT9hrJoY4lhPWAu3u988G95x+WPbSvC/rYG/k6R/ENKU7xA+E0OltL3as+np01YlQvXMGkK+MwFvInocJrzh9+R2Xx3195hRnP0trD6VsMiPtBLOKQkq3lcxt5IRjrdWoFMUztTWKd9dqbeUTtlDaR4Ku7fZ/BAzAiBrrJm1fxgTJj5eLyBkLA/XJK2BOKcA2bGxaDucEbomYtItICgjnYtoxWo9O0P6aJtqUeOTdRLNBM7xA9tvc5N2X9ggj1je3OVozMsLuHrfs/FkuUXxCdjAMawB+bMbYl+3+5t4rlfKy8xbQh//CZ1ynV5788/pS2EtVQcXPPAa2ryeH4igNRNQN9P+6AaRas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(6512007)(186003)(26005)(66946007)(5660300002)(6506007)(8936002)(2616005)(7416002)(6666004)(4326008)(8676002)(66476007)(66556008)(2906002)(31696002)(86362001)(54906003)(6916009)(508600001)(38100700002)(31686004)(83380400001)(36756003)(6486002)(316002)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG9HNXZDZW1vZ1JPanpzVU9HUk82REpzL2NkL0NvNFRtTGNnK0QyMTlFZGNo?=
 =?utf-8?B?QURUT0pRTkNXOUNUMFR3L1VNdjlocE55Rmc4c1F6R28vZENLdkE0RU1zWUNr?=
 =?utf-8?B?a0dHeEpTa2hxMmJIS21WT1JuOTFSRzlFTWtsTmVKRjYzcFhrdXRwM3ExemV3?=
 =?utf-8?B?QXM3SUxVWXd3UTZZWE5CZ3E5UlFoZHVqcmFaZ2ZCalpRaXNWT3RCZXJIUHZN?=
 =?utf-8?B?WnJtY3F5TEc0K3d2djM3bzBFL2tRQVRjM3I1RVBtcVpDMnJnd2p3a0hzelBl?=
 =?utf-8?B?WTZ6UGp5cTU5aklRbkszaytnSzhEZXhOMDVaZlpiZnlCdWhKQUhJYjBuS0Nh?=
 =?utf-8?B?NitQc29pTXg0ZmN6VW8xblZBSkVKU0g5YXBZaktybC9OMEF5UTJCd0xteXlJ?=
 =?utf-8?B?NGFtRHBmdnluQkEwUSsvRGxNVytUMEQ1QVpvYXhmRWpwNkM0eUx3aXB1OGNs?=
 =?utf-8?B?MkdIVC9JRERQYzNPamMrekt6TjQ0aG9qb3RaODZTMGNrdTV2alc0NG8rOEEz?=
 =?utf-8?B?ZXFwcjNUVDFVT3FuSFEyN01IVEFZNU5la0lhcVg2ZjhIQlg0VERGZTJZbnVt?=
 =?utf-8?B?WWpmTnVrbGFYYXpkK01UYkE2S3h3WjZqZE5BR0lmVUlIUFdManYvRGNkZ1Ra?=
 =?utf-8?B?SXpxVGtNb053WWxSQUZVNGNsYnc5b0dmK211MVJ3UUtnOWhVZzRidWhxVHRi?=
 =?utf-8?B?bC9uOVB4M0NpZ0lKc0YxOFdWU3YxSU0ycGE3MnN6L2xaUW1sZExRNHVTeUpB?=
 =?utf-8?B?U1daTy9iMnhDZDZXT2ZEeGpYd3dNcnhqUy8zSnlyZVVhaTU2cVZ3bkZvRFRH?=
 =?utf-8?B?azFHRVlOVHgzV1NjaEZkUk5TcHZsWmpLTWUwaHZpb2M2TGxTU0N5emV0RW55?=
 =?utf-8?B?eStHSkduRWhDUGkvUFNrYUZpdGpxS1NISG1ET3FnN0drQ3dRQzRiSEdvaThm?=
 =?utf-8?B?YWtxK0p4RmxoeFkwM0FtNC9GNFZBMVhQYWlCbEUzSktramxWNldYTmtvbXRi?=
 =?utf-8?B?a3FYTTdOQkpGUldnWTI1WnVPVHpaa1pETFkzWlcwNEYwRUpjUFFCeUsyY1B6?=
 =?utf-8?B?dER0Q090RXVXTVk1UmpSdnQwK09mcGJJSmNjemVYWllPQmZQRVNobzdjMlVS?=
 =?utf-8?B?dnpSd09RSlJ4bmZRR0x6L2JoOW1oZ3VaTFBmY2g2KzN5WVJZQnFDLzhmbzNE?=
 =?utf-8?B?cEVnYmhYVFhQMmZrYXlENmNnbXRiYzNqeE1mQm1XMG4zckF0MlUzc3VrYmFH?=
 =?utf-8?B?NmVxVG8yOXpGcll2dllXUHpVVWZpeEVkSUxxdGJGS3dYc1hob1FtR0lRL1NW?=
 =?utf-8?B?V3ZTcW1lMm01M0dZNm15R0VxYW1ISzRKU25UL0tBWHpJbXY2bW9zcTlxd1RU?=
 =?utf-8?B?UUZ1VVA5dFlnZVVjMCtyeXVBUlpEVUJ3eGdMcWZoRUMycU10M3pwdndndkxZ?=
 =?utf-8?B?ZmNrdGFOalJtWGg3dExQbG51QXdvSlNrOVhnQ1FaeEZnS3BFcjlLV0pNdTBn?=
 =?utf-8?B?VHhLaFFkdk5DNUJacXBBQTVlTHNoTStxUG9FdzFWUnV5aFFJNStKcVNqNWdh?=
 =?utf-8?B?SU9GKytuNWVKUzgwS2dzWUduK2RoVEdkN3YrQ3lhSWFPeXRlVFJMcVk3MTlD?=
 =?utf-8?B?OHdXM2w1Vk1Ob3FWckZVR3NHTFErdHRUT1RJZVY3eWNuMm96Yi8vMm1PelV5?=
 =?utf-8?B?NW9yYnYrYjVzZVM4QklLZWcvY3N4VkxlSXBuaXpwaXN4TmhYMEpKa3l1UkRz?=
 =?utf-8?B?MHRmK2x0ejljeTJwVzh4MklxdGwrdGV4cWw1TFlnc1Uvb0srUlNzaEswMUds?=
 =?utf-8?B?cWdLVGtyRDhHTERFZWt3SXdkdVJmcHpEb2pYUzdwblNrTlR1cU5mU1AvQmFG?=
 =?utf-8?B?YkJPa1lyY1lGZHlrOVdQQmp6NEtYT0ZsNDNZZnRIc2lKVUFOcm92bXhidmpk?=
 =?utf-8?B?L2dBQk9WYTJNVXZQK1NBK1VPNEpaUEV5NmZzbDBVcU9WaEVVdlM1WU92cnZP?=
 =?utf-8?B?N05pWXNWWWNSL2xRNExmaWUzR0JVWkhBazRZekhUdUI5WkpMSlBPSlVva1VF?=
 =?utf-8?B?MlczcUFrYkxtYVdyTnJidFhDZkU3RFdzamV4YzdXNm1waDF0cWZuNVFjaVQ5?=
 =?utf-8?B?SGE5SUhLeEdQS1g1Q25SaGR5d3dUdm1KUEk4OEw4MVBLWFAxbld6NFIycjJG?=
 =?utf-8?B?MFNwUDZQOHp1NU0rWG9PSDRaNXgzdHBJY2pQYXRsN1ptU3h3Sk56M09oSWEr?=
 =?utf-8?B?d05Ia2k5MEJNbUNzbkRvSFlHSWdVbklwS2dzM1pzV3R4UjZUNWlRelo1eFRX?=
 =?utf-8?B?cHVQWjRGdFliN1BGbUpBZUVwT2V0bVRISFdHcGFKWDRpTktiQ0xZdk9tU3h4?=
 =?utf-8?Q?YapnqyGNYDRPGdr8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66f6b18-96a7-4789-d7d3-08da3a4fbdf4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:58:59.2457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SB3UMroiOAiTrAfgvj4aBAg6ViwmBxaSqq4xzwJ/aCET0Ns7Z4moAdpBsF0zIi/V3WCbUESKaEQ/gX75WSJNL+1TlcQf8WRyTsNmGbRo0zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1773
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-20_03:2022-05-20,
 2022-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=805 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200080
X-Proofpoint-GUID: 5IADzvWn7QCop-ZULOeLqqLG-STRkvRj
X-Proofpoint-ORIG-GUID: 5IADzvWn7QCop-ZULOeLqqLG-STRkvRj
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 5/12/22 16:43, Avihai Horon wrote:
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 21e8f9d4d4..d4b6653026 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -863,10 +863,17 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>      struct vfio_region_info *info = NULL;
>      int ret = -ENOTSUP;
>  
> -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> +    if (!vbasedev->enable_migration) {
>          goto add_blocker;
>      }
>  
> +    if (!container->dirty_pages_supported) {
> +        warn_report(
> +            "%s: IOMMU of the device's VFIO container doesn't support dirty page tracking, migration pre-copy phase will be skipped",
> +            vbasedev->name);

Maybe warn_report_once(...) given that the following N devices would observe the
same thing in theory.

> +        migrate_get_current()->skip_precopy = true;
> +    }
> +

Perhaps it might be easier to reuse the existing knob to disable pre-copy
per device that Kirti added some time ago, rather than changing migration core just
yet (e.g. you might wanna bail of the migration preemptively because the CPU is dirtying
too many pages for example?):

if (!container->dirty_pages_supported) {
    warn_report_once(...)
    pre_copy_dirty_page_tracking = ON_OFF_AUTO_OFF;
}

You might need to tackle the fact you will get when dirty_pages start/stop ioctls
returns you error messages. The errors is just because log_start() and log_stop() simply
fail because the ioctl doesn't exist, but everything else is fine -- at least that's what
I observed at least. Should be noted that it's a problem with the existing
`-device vfio-pci host=XX:YY.ZZ,x-pre-copy-dirty-page-tracking=true` regardless of this patch:

void vfio_listener_log_global_start()
{
	if (vfio_devices_all_dirty_tracking(container)) {
		vfio_set_dirty_page_tracking(container, true);
        }
}

... And same for vfio_listener_log_global_stop() -- maybe a worthwhile predecessor patch.


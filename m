Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2894C8E10
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:44:04 +0100 (CET)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3jP-00014a-8o
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:44:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nP3bW-0000vM-23
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:35:54 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nP3bS-0002vs-C7
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:35:52 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221ECsIO030527; 
 Tue, 1 Mar 2022 14:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=n6cUHiseL0MzFYe/72LZF1ctGWghmyiMCbUN/v+Lbno=;
 b=NcLNOAA/UuPvo8yUefrCo3n50WNtLrZIth8Opfet40FXWWvOdK1gdvcXAflBHOH8ZFLB
 ZMBxsHIIjYCsBLo4q5Qo7CF337k6JPFbGJQYHtkHK9k3Ru0w/AgMDLbpRFT/0g6qMhjV
 xBlth4hMTnN+VSBRp6b4qvYAaq5m4UCiRsUr66Oe897tkvBvIfFFkwPsWffXRqmm++Ev
 WGzfz7uhmzCri/SC3VCiUl7F4N8UcMmBYXs856T+/7FU2RmQlfynDXShlP+rfQ9R81Px
 XfWqMpvScg19Ocx/k40vk0G6kaCUWyFyNx35lq81JbtNpJ5T+IeUdJsHr+g/DXjl8gBU 3Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh1k42w1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Mar 2022 14:35:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 221EFK3q007494;
 Tue, 1 Mar 2022 14:35:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by userp3020.oracle.com with ESMTP id 3efdnmtkqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Mar 2022 14:35:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Byh+3+kdUK5zvEIBYeSQb1VWK8kNGEllvk6XR3OGhsbqzGumL2eAI15NsA4ZU61tNyDhayAUb6b9t5gUa9Sbbk8rjjTvsSXrhgBkqdvXY3aeMvieZpN6ntLjyPn1rlWCfm6E5+tH2HW6VY61gaRiohKWQXiHDv0y7BMBron3R6zd15vh3sDzZL7rumvRVj+zCh5dow6CVwaw2PRwwrlNIbmA2F5PyWMn3Payov9QHqCZUoxnAHqCQ6NaZgK0C/+YvwK7WQV6jIoMNzWLpbUq4/txj/dpl64bxsEac3zVtc1Vg0lPpt8SzU9M15vce0pyhYqtaNY0Ms4N36hdCAf5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6cUHiseL0MzFYe/72LZF1ctGWghmyiMCbUN/v+Lbno=;
 b=g3k/truVfyh7b16wr8Zruzuyl88JLnbfB0SJc2/auTBHQ6ckTCCe89tu1g7jXVYfL9YuOYBCZHKQhPEr15YQ4UKLW4267K9jHIV4AgLAOtrERxAxFQXgXky8ReK5T+tyKKRX+nefdN9DTwLvWMRicu4HNRmtnxc4iyLGDfdpEBa2RYWKpeM8iI0JDW3xyoGzE9z4D7EVFHicSFq7wvhaIznoFFRkiy8laGGVtPAKWg4mDoEzdX+qLcrpqaIAp2xbF/XS5IvZMvnh32CrxJJqEhr1zjfrYdTLXmVmeGuCF9OFFgdu9vUdOVJ/b2duUxCavfBpEXFM56qoLMvX/vLz4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6cUHiseL0MzFYe/72LZF1ctGWghmyiMCbUN/v+Lbno=;
 b=bPgE0VHtruI4VgW69GiOnt1fTMIOPgzQ3FQgfeIaJSsJ7o7nRfu5tVxUuBaS6Ikb2pbP57OMlu3hBG7joMXiorsbAAsu8FuDRtmfqyQLs61ktx78bvBemX/qhhjzqKPQgOM/PClRaBzu141sfbnNaUyCkcoQBP/3DHgec1mDayM=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by CH0PR10MB4956.namprd10.prod.outlook.com (2603:10b6:610:c9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 14:35:41 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::4d07:86d6:8830:347f]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::4d07:86d6:8830:347f%7]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:35:41 +0000
Message-ID: <c95e764d-60b5-c25a-f32c-33f21fa6724c@oracle.com>
Date: Tue, 1 Mar 2022 08:35:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v16] ACPI ERST: specification for ERST support
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
References: <20220207070233.2632953-1-ani@anisinha.ca>
 <20220207070233.2632953-2-ani@anisinha.ca>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220207070233.2632953-2-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR06CA0075.namprd06.prod.outlook.com
 (2603:10b6:5:336::8) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ab5f4ed-5264-4712-1711-08d9fb90c29e
X-MS-TrafficTypeDiagnostic: CH0PR10MB4956:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB495684404F92281120EBA30497029@CH0PR10MB4956.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zORUvWGt0h+u2A2AoajiNxp0c3VEb8n6fFZmRwdZ3Czp3UzTosKBzuTmlM22+9ylL3hBuYfy3+8T41tKXw3CBYCVHdxRQySq2003qj43IBzrh0jCYYOvOZDxZ/rs/+vBZ9BehX6JgdVxYBLCBdPS7AjxVFtrd2NwBFZ6Wn7rDOJ4R9hkAW7HO6lfbuo+r5w5bVUpwxMi0C3GIGI24H8HBcQaRixMzP1HctzeQaZEU+jTOtTS7HonWWBVrzypMMq0GFFn2IQVk+n71wTj8mbAN3F7r2/eTQrOLNSlYRes/eChpFbQr15BbD4eShuv2Fn0rZFTVbiJ3nrLmhNztOilB5cNQoxxNCNZLHKiS3KgqZpIGHPCC2wUUnF7b0gFUm2KMv+fUWASXHhBR9WTCEEFrg3UfZKUdTskPPik9wfhUR0bf3sQJMAqyy65/QYkHwXj5HrOjW9vVMZP+S6YHmes0peC7PA1efA7odzMgcDTxsd8Th2K/BCBeJ8gNksRJbbAYx8Jxe3Xb/9dWv/v4GjNsrMtr8YSiZrAV4t+pEjuCdLIFKbAOaVTLftaukSc5AeKK6mw8uUSlCURnweTDa/KSbLE7Q/6jxoqf8zf8VrFKbbNJSAOonE4JMNIcQTpCs1gfFOfVj46LGRKR4jcHnexx9i8RmPrQ/t8p+GZzC7sNQnuSGP6NliKHnBFADHH7pADoxrkdlxStzQg3C4n6UTeQgGtEJPboMp5uLn2CxVG2sc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(6512007)(5660300002)(31696002)(86362001)(8676002)(66556008)(66476007)(66946007)(4326008)(2906002)(186003)(38100700002)(8936002)(2616005)(53546011)(36756003)(6506007)(45080400002)(6486002)(6666004)(508600001)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1JqcDBDOWlIdW00SE9hSm0wV0VKV2hnZGE0R2pTa3EwS1p4aXNCTmhJQXZD?=
 =?utf-8?B?QmFTc0V5dUpHNkRBV1JxYVN4R1RvT2xFY0tvK3pSUnNtSmF2aEpKbXFkRzNK?=
 =?utf-8?B?d0llUTJrRFF6eUs5ZkE4bGZYRk1nbTNxOWtWU3kzMTdLTzV2SnFIelBSQlBJ?=
 =?utf-8?B?MVp6RkhiQWpQMnJad3BUNHFrQkxFT2xkdDNQdmhhK2xTdCsxM3Q0NHl5aGhZ?=
 =?utf-8?B?bGwrajE4T1JYVjZYQkxwdE1HZ0FVWUgrc3B2UmVvejE0anI5QkViZFFkNmdv?=
 =?utf-8?B?NDcxTFRqMEhuNUVienN2RUppOUNvenp2WDhGWlhqWXRNNmtibkZMTno5eloz?=
 =?utf-8?B?SnZjb2tMQXN6NkZidjg5dDhwRmtiUXV4MFlHU3czbzl0VHpNdTFXUytxYXZE?=
 =?utf-8?B?TXlzUE1hTEhzZEppbXc0Rmkzc2ZsR1gxQVVlandXK0lxMUkvSkpHZ2JsakJQ?=
 =?utf-8?B?U3ZraVl4NTAxYjVWTENia1FtMDQ1aGtPbUp0Z2VPcHp1a0c2R3JUbS9OTDI1?=
 =?utf-8?B?SmpheXhJQVdxVUpOVEZNYjMvbDVPZFI5Zm41VjNYaTFIOTMvb1o5S3hmQzV2?=
 =?utf-8?B?NVZ0a0QwY2w3ZGhER0g3WUE0Znk4N1hxc2FDOGZJUUtFRGJ0T0FONUQyTk05?=
 =?utf-8?B?NjJzUytTK25mUE8yc2RQUmtjZldjUGw5cHlRcmN2OVJYOWNleWNsenpaZEFY?=
 =?utf-8?B?aEVRS0VibWx3dklpaFNxWUVNNHIxZFV3eGppK2NyZ1ovZHRLUS8vdHBnclNo?=
 =?utf-8?B?bVJHUXpwTkpsc2g1azlMK1JNeTdNbEdFOVdadTFWQyt6YWN3RE1OSXE5RWNX?=
 =?utf-8?B?Uzl3NGdQQjk3VVg1d1d0UkdZNVR4dTlFVzZDSjBGdWg1WVBJcWttVXBkWTdv?=
 =?utf-8?B?MjI1RVdUNnpzL3BtTTFTNmZpMmM0QmxHZ29qd3c2aGlnZURKYUNHTXVYTkNP?=
 =?utf-8?B?a0VlVThQMXNONnFYRm52TnFyT1JhcGZydW1WYTgxcmJnVHpvSGN5WE1NdVZY?=
 =?utf-8?B?RndvMHZmUVNETUNmNFFmQ25VeGlReTgwM2RuOWNLWkdWdW5MQVNxdGpGT2cx?=
 =?utf-8?B?emhaa0p3dHlMNDFwc3ZVT0Q5bng5aXZGazFSOHpQUldzajBlckVOVm5SVG5Z?=
 =?utf-8?B?a1IyRUVHYUthVWtiQUQza2ZPcFhHYWpqZlR1b3Y1Y0p6bWRReTJLNXBjcFZk?=
 =?utf-8?B?TzIrc1I3SzZyWFRFV1dqbTNxQkdjTHhWdjNrRHkzREhacjU1Z2prNyt3RmFH?=
 =?utf-8?B?WVlTaFJFOTBuWFROa09DaHNRYmpsYUh6eUQ1U1ZPRUErWERDOUhuTi8xMEMr?=
 =?utf-8?B?ZjhZZE9IOHVNWVI4VDhEM2NETnNKcTRSQXUvdlROaGY1SitHNVlTMVhjUm9i?=
 =?utf-8?B?YzY3akNwVElLTUZ0UzA5TmkvbENsTEloMGVUMmYwMThXZ0wxaDAzTEVoTFI5?=
 =?utf-8?B?YzlkcEZIVXZ4YWN4OEcvT3JGRE5qd1hMU1JDRmdvaUJVZmVuY0VnN1NNR2lY?=
 =?utf-8?B?TXNrbEVtdkxOdzJSNUhhZWJVV2owNnVYK0E0SGR2VDQyazFvdTZ2R0NHVkVH?=
 =?utf-8?B?d1Y2cUJ3aFdGSjRMcUhNVzFYdVZZcEZRNndNeVNXbzhoWEFDVXB0ZFZDS1dN?=
 =?utf-8?B?Z3pmeWNwN3YvQVpVeDdxeXlQeG1rS0N1WjZ2U0N3MDdWejdRYi8rWmVpYlps?=
 =?utf-8?B?RmN6TzA0VWJ5ZkNIbk45T0tFMHk2M2kzOWEra1pMczFibUZ2c0ROVndyTTVZ?=
 =?utf-8?B?MnVldlhrbWNaQU9Sb0JSczUzdjNJMTdEeVhWOFk2YkpPc09Nb0tsMGxCdjdX?=
 =?utf-8?B?LzhnWHQrS0VIRW9oSEJXbzFPaXdrTzJyQjVxOGRyUU5QOS8xU3NRTnpwZDVh?=
 =?utf-8?B?c0Vvc2dtL0JMVU1JZFNEQUtrdnNaTnU2djM3dDRKT2dRSWtYcy9VMTd6bnU2?=
 =?utf-8?B?Zlk1RVNCcmROdGVyRFVjNGk2ZGFDb3h5dTM2c285YUVuR1hCZEhQUi9TVVpI?=
 =?utf-8?B?UzNRQW50cG9RUlExWUJIa21ZUE9QdkdCUXJOUHU2cGQyRmpBMm9KSGRiL0pH?=
 =?utf-8?B?K3laeEwzSldmdFdRTVpKNmxDTENuVGJaWm5ubVMzcFh0WlZnc0s3Y29WTllx?=
 =?utf-8?B?UENPY0hnc1NsYmM3Rmp2Ujk5RG9GUmx6Nnd0YUlKSktZTk15RkNIL3V2Vnho?=
 =?utf-8?B?OTYwM2lXYmhCVUJrd3ZDK1hlUGNiMXRiN3VGYWdSbllqS2NQOFJ3Z29YRGhT?=
 =?utf-8?B?b0VzeVJ4bGNUcVN6c0pnQzNwbk5HVXZJSk40Wk5SMm1MWVB2ZDRnWFdDY0pj?=
 =?utf-8?Q?A4iTGpJXY56FrVt+Ix?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab5f4ed-5264-4712-1711-08d9fb90c29e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:35:41.0812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hk5s+Nr07mZ/iGANhOXFJn9igbFwMjHeXhgixa1p7mILIKVXy83obiVPdedVHWzbd+yhQC+IfSOs03z1sJCcBHZCgXO+ZGQutNFJ298qmuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4956
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=824
 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010079
X-Proofpoint-ORIG-GUID: BKT3GAEJgR47vnKj2kpnIVcAVq95fSMX
X-Proofpoint-GUID: BKT3GAEJgR47vnKj2kpnIVcAVq95fSMX
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, just wondering when this is targeted for merge?
Thanks,
eric

On 2/7/22 01:02, Ani Sinha wrote:
> From: Eric DeVolder <eric.devolder@oracle.com>
> 
> Information on the implementation of the ACPI ERST support.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> Acked-by: Ani Sinha <ani@anisinha.ca>
> ---
>   docs/specs/acpi_erst.rst | 200 +++++++++++++++++++++++++++++++++++++++
>   docs/specs/index.rst     |   1 +
>   2 files changed, 201 insertions(+)
>   create mode 100644 docs/specs/acpi_erst.rst
> 
> diff --git a/docs/specs/acpi_erst.rst b/docs/specs/acpi_erst.rst
> new file mode 100644
> index 0000000000..a8a9d22d25
> --- /dev/null
> +++ b/docs/specs/acpi_erst.rst
> @@ -0,0 +1,200 @@
> +ACPI ERST DEVICE
> +================
> +
> +The ACPI ERST device is utilized to support the ACPI Error Record
> +Serialization Table, ERST, functionality. This feature is designed for
> +storing error records in persistent storage for future reference
> +and/or debugging.
> +
> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> +(APEI)", and specifically subsection "Error Serialization", outlines a
> +method for storing error records into persistent storage.
> +
> +The format of error records is described in the UEFI specification[2],
> +in Appendix N "Common Platform Error Record".
> +
> +While the ACPI specification allows for an NVRAM "mode" (see
> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
> +directly exposed for direct access by the OS/guest, this device
> +implements the non-NVRAM "mode". This non-NVRAM "mode" is what is
> +implemented by most BIOS (since flash memory requires programming
> +operations in order to update its contents). Furthermore, as of the
> +time of this writing, Linux only supports the non-NVRAM "mode".
> +
> +
> +Background/Motivation
> +---------------------
> +
> +Linux uses the persistent storage filesystem, pstore, to record
> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> +independent of, and runs before, kdump.  In certain scenarios (ie.
> +hosts/guests with root filesystems on NFS/iSCSI where networking
> +software and/or hardware fails, and thus kdump fails), pstore may
> +contain information available for post-mortem debugging.
> +
> +Two common storage backends for the pstore filesystem are ACPI ERST
> +and UEFI. Most BIOS implement ACPI ERST. UEFI is not utilized in all
> +guests. With QEMU supporting ACPI ERST, it becomes a viable pstore
> +storage backend for virtual machines (as it is now for bare metal
> +machines).
> +
> +Enabling support for ACPI ERST facilitates a consistent method to
> +capture kernel panic information in a wide range of guests: from
> +resource-constrained microvms to very large guests, and in particular,
> +in direct-boot environments (which would lack UEFI run-time services).
> +
> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
> +crash information, if available[3].
> +
> +
> +Configuration|Usage
> +-------------------
> +
> +To use ACPI ERST, a memory-backend-file object and acpi-erst device
> +can be created, for example:
> +
> + qemu ...
> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,size=0x10000,share=on \
> + -device acpi-erst,memdev=erstnvram
> +
> +For proper operation, the ACPI ERST device needs a memory-backend-file
> +object with the following parameters:
> +
> + - id: The id of the memory-backend-file object is used to associate
> +   this memory with the acpi-erst device.
> + - size: The size of the ACPI ERST backing storage. This parameter is
> +   required.
> + - mem-path: The location of the ACPI ERST backing storage file. This
> +   parameter is also required.
> + - share: The share=on parameter is required so that updates to the
> +   ERST backing store are written to the file.
> +
> +and ERST device:
> +
> + - memdev: Is the object id of the memory-backend-file.
> + - record_size: Specifies the size of the records (or slots) in the
> +   backend storage. Must be a power of two value greater than or
> +   equal to 4096 (PAGE_SIZE).
> +
> +
> +PCI Interface
> +-------------
> +
> +The ERST device is a PCI device with two BARs, one for accessing the
> +programming registers, and the other for accessing the record exchange
> +buffer.
> +
> +BAR0 contains the programming interface consisting of ACTION and VALUE
> +64-bit registers.  All ERST actions/operations/side effects happen on
> +the write to the ACTION, by design. Any data needed by the action must
> +be placed into VALUE prior to writing ACTION.  Reading the VALUE
> +simply returns the register contents, which can be updated by a
> +previous ACTION.
> +
> +BAR1 contains the 8KiB record exchange buffer, which is the
> +implemented maximum record size.
> +
> +
> +Backend Storage Format
> +----------------------
> +
> +The backend storage is divided into fixed size "slots", 8KiB in
> +length, with each slot storing a single record.  Not all slots need to
> +be occupied, and they need not be occupied in a contiguous fashion.
> +The ability to clear/erase specific records allows for the formation
> +of unoccupied slots.
> +
> +Slot 0 contains a backend storage header that identifies the contents
> +as ERST and also facilitates efficient access to the records.
> +Depending upon the size of the backend storage, additional slots will
> +be designated to be a part of the slot 0 header. For example, at 8KiB,
> +the slot 0 header can accomodate 1021 records. Thus a storage size
> +of 8MiB (8KiB * 1024) requires an additional slot for use by the
> +header. In this scenario, slot 0 and slot 1 form the backend storage
> +header, and records can be stored starting at slot 2.
> +
> +Below is an example layout of the backend storage format (for storage
> +size less than 8MiB). The size of the storage is a multiple of 8KiB,
> +and contains N number of slots to store records. The example below
> +shows two records (in CPER format) in the backend storage, while the
> +remaining slots are empty/available.
> +
> +::
> +
> + Slot   Record
> +        <------------------ 8KiB -------------------->
> +        +--------------------------------------------+
> +    0   | storage header                             |
> +        +--------------------------------------------+
> +    1   | empty/available                            |
> +        +--------------------------------------------+
> +    2   | CPER                                       |
> +        +--------------------------------------------+
> +    3   | CPER                                       |
> +        +--------------------------------------------+
> +  ...   |                                            |
> +        +--------------------------------------------+
> +    N   | empty/available                            |
> +        +--------------------------------------------+
> +
> +The storage header consists of some basic information and an array
> +of CPER record_id's to efficiently access records in the backend
> +storage.
> +
> +All fields in the header are stored in little endian format.
> +
> +::
> +
> +  +--------------------------------------------+
> +  | magic                                      | 0x0000
> +  +--------------------------------------------+
> +  | record_offset        | record_size         | 0x0008
> +  +--------------------------------------------+
> +  | record_count         | reserved | version  | 0x0010
> +  +--------------------------------------------+
> +  | record_id[0]                               | 0x0018
> +  +--------------------------------------------+
> +  | record_id[1]                               | 0x0020
> +  +--------------------------------------------+
> +  | record_id[...]                             |
> +  +--------------------------------------------+
> +  | record_id[N]                               | 0x1FF8
> +  +--------------------------------------------+
> +
> +The 'magic' field contains the value 0x524F545354535245.
> +
> +The 'record_size' field contains the value 0x2000, 8KiB.
> +
> +The 'record_offset' field points to the first record_id in the array,
> +0x0018.
> +
> +The 'version' field contains 0x0100, the first version.
> +
> +The 'record_count' field contains the number of valid records in the
> +backend storage.
> +
> +The 'record_id' array fields are the 64-bit record identifiers of the
> +CPER record in the corresponding slot. Stated differently, the
> +location of a CPER record_id in the record_id[] array provides the
> +slot index for the corresponding record in the backend storage.
> +
> +Note that, for example, with a backend storage less than 8MiB, slot 0
> +contains the header, so the record_id[0] will never contain a valid
> +CPER record_id. Instead slot 1 is the first available slot and thus
> +record_id_[1] may contain a CPER.
> +
> +A 'record_id' of all 0s or all 1s indicates an invalid record (ie. the
> +slot is available).
> +
> +
> +References
> +----------
> +
> +[1] "Advanced Configuration and Power Interface Specification",
> +    version 4.0, June 2009.
> +
> +[2] "Unified Extensible Firmware Interface Specification",
> +    version 2.1, October 2008.
> +
> +[3] "Windows Hardware Error Architecture", specfically
> +    "Error Record Persistence Mechanism".
> diff --git a/docs/specs/index.rst b/docs/specs/index.rst
> index ecc43896bb..32863b4aa5 100644
> --- a/docs/specs/index.rst
> +++ b/docs/specs/index.rst
> @@ -18,3 +18,4 @@ guest hardware that is specific to QEMU.
>      acpi_mem_hotplug
>      acpi_pci_hotplug
>      acpi_nvdimm
> +   acpi_erst
> 


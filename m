Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A123F5345B4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:22:34 +0200 (CEST)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntySf-0005vl-Ls
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1ntyQY-00046q-2I
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:20:22 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1ntyQV-00044G-0k
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:20:21 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PKiJOg023314;
 Wed, 25 May 2022 21:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=gcumeotntsHet9KWW2JqBTzimsgCYLHAzddcgJrUW9U=;
 b=YK7ix1ZUQQVpb19PtVKsfvNKc6ivsc54PY0yW/5oe0ua3b5ubkBItiE/y+NYwtcGANUb
 +jNmzK/tHhLL4SEYJJUfR2w4vE7Jb8WK1hmgvuQ+hN6GsDIEHootuqNwgI5SGhmwtckH
 TFIlSSrFgHdWPjmTSTQCXchd5zKzKTcqKhhCY5LSQW8VyqV7swDRcATGwsWd/rDg+3tx
 wjFcBlk+H8+ELVTWJT7qgnv/HOnJtKTgxF09h8j4kn3eywG21RNMVdAnXTqm12Omq7jm
 VDaIZVKqDtF4cmkk223Hr7oY+VvorFjhSxGg56FT2wtwQaF9ydguEwJdjRFkfWGtWxBa sw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g93tbb7r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 21:20:14 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24PLGN3I011653; Wed, 25 May 2022 21:20:13 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g93x64xqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 21:20:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5nZy6Oc++FWXYqKoEiuRRiH5Km6xPv1MrpfAvjrJvvFdhDzPxXnvi+ETjgCK7Xj5HY5f/RXvtcOUZSOh6O2Rqld6iIul/s84hsI2qLbxdqvXoYznT6Nrj/jLEcUS1ExxB9FRaXrx7b3LTjEH5dbN4HhLOj5hth76sL0EggG1U84UxCvcwUrPrxHfGmjVxHLJhW/VVkjQiMZo29wzvqzC3W/FTSswWGGKUgA9kOlrfPgk+ktNFVOSRJNv1703x0H8Zp0V1pOkDkmzwz3n6TESRquStzJ6BF+Yryk2jVMbe1sn26igmtmd6EeeTi5yGsfKOiQ7dcKHxytiH/Aurgznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcumeotntsHet9KWW2JqBTzimsgCYLHAzddcgJrUW9U=;
 b=Lop09yYe37nRTAOffn4XCETNWULND+ryzrObmGLCVYRfps7+lRBrI4jH9+nKNEy/PkisTor9GhWxUHnroKPia83YzI6/CmgrCHzNr69yk3T9MObfVoS31OhqW4DgXpTyULM+Ct+n1oe/GyAIj/G3rtvFzCjUWIezN1kPQn/DmPJGvSdD2UwI3SWGeX/uW4VYHK5XHY3yAhIaDfrwHc49G9avOQztJsE369Ln38lq1iJZOeROdOiYR64A5Tlw6v4AM/5rFeC8OEH5H/jyzZQh0zMYNIR9xZPua5od1SeTLGIwKezHqzc9uYcB4kmJsfkPXsFtvxzGLLbwRq7npBLqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcumeotntsHet9KWW2JqBTzimsgCYLHAzddcgJrUW9U=;
 b=yJD8652ODUZIl/dEKdbY307UOmftCUNOp3y+BLjkkHdv/CxUALUX8WewaTEkqLqFWrBy8I3C1C+TnRulWUlU2SoS1ohKqa0iiTLHXI+zYvyKvQXfx5+4IZlt1jAZCvOaSUPKS0q2N4MaUcLrFeommRaXF1jpcQ64kCUhvi9ccqk=
Received: from SA1PR10MB5866.namprd10.prod.outlook.com (2603:10b6:806:22b::19)
 by BN8PR10MB3217.namprd10.prod.outlook.com (2603:10b6:408:d2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 25 May
 2022 21:20:07 +0000
Received: from SA1PR10MB5866.namprd10.prod.outlook.com
 ([fe80::e1b0:13b9:de93:cc66]) by SA1PR10MB5866.namprd10.prod.outlook.com
 ([fe80::e1b0:13b9:de93:cc66%6]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 21:20:07 +0000
Message-ID: <bceace5d-a468-f2a9-8977-b4410987c401@oracle.com>
Date: Wed, 25 May 2022 17:20:02 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] i386: fixup number of logical CPUs when
 host-cache-info=on
Content-Language: en-US
To: babu.moger@amd.com
Cc: Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20220524151020.2541698-1-imammedo@redhat.com>
 <20220524171949.47508d9b@redhat.com>
 <e4df1ba6-1a11-21e8-e344-f5e24fa49ce8@amd.com>
 <eba71ba0-1a38-0878-46a0-b10886d4447a@oracle.com>
 <0159d16e-b789-25fc-9ea6-adbf5e3218ad@amd.com>
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <0159d16e-b789-25fc-9ea6-adbf5e3218ad@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To SA1PR10MB5866.namprd10.prod.outlook.com
 (2603:10b6:806:22b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6b29bf8-da89-4eee-2594-08da3e9456a7
X-MS-TrafficTypeDiagnostic: BN8PR10MB3217:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3217FBD26152B1E36D3F460CC7D69@BN8PR10MB3217.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wv3h67MSa+f5vEks4musT0k+hLDU5iwdk6fXpA1fWASw81YY3nroGNi19ITFetpbUBs3j8UV7qZMkNFRPFNOS7JAR5QL/6rWOucAulXSDKY6b6lxtQc1fNJ2fdyfNaRNEHyxNg6x5uMq2N4wbyY3ZvF5v11+Anlh7QUS8h19Khx4Dp9Wwxdoh0VHcv+jdW/UYVNRIdg85EblUgz9anWRzXVe28tdaR73H1OTwkT9LmVmyTbNImyBWl1NHDNvWrhwVo4HjmUmHYj9ZJkSsNGMK4ToXMngdxBuGepeFPeaEcW0QDniauquOQrdDcAIxN3w4Yl0W7jmuhZAl7GVfFcAk/A51JAn3wunbqaXqxCVRQyfBfJ//KLNFIV8xj0XbYbLFVZB0+tLn2J6wnvH7+TRzyArwM70pr0Yhl3iby+L19GyXezTttE7B0Sfuq1K9/cWYW2zcogZeuBTae5E/K7oxFIYUibUqDbfTR5p6/vsquHbeG0hxJ+JKuND0L4NKoR1fuomlhtO6kp6pkqkC2msusQUglGDeV9uG5DMrymF2+sqcxghyC77SRWk6Myij9ba5qthJGJP/eMXfafSp4xUkJywsgkGYGWihd87dqlEe+ZbwYaVHd8EArI6C3efnIPeY+ol74sb/i1wSXPSUMPvRRA8r322koHbdSvwS2R/uLI/LnDwzGpxU6ticRAXJbiUxrf3QdUzIjI2poCjwfHtuaYhI689Il+Ir280bvjbjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5866.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(66556008)(6666004)(4326008)(53546011)(36916002)(316002)(86362001)(6506007)(54906003)(6916009)(26005)(66476007)(66946007)(508600001)(6486002)(2906002)(5660300002)(186003)(31696002)(2616005)(83380400001)(36756003)(38100700002)(31686004)(6512007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3NlUWdDNWZsRGhWSUZWRFJCWTA3T2licU1lZ0t4dmtqaFF2Uy9KakNmaGY0?=
 =?utf-8?B?dVNrV3U0TWZHZ1pUaFo0ejExMDZoa1FTSHgyOERFZFk2ZWxEV3Y3eFZRaExa?=
 =?utf-8?B?SWtramVOQnFOeEx6TC9URENnVi9xNlp4NVJMd1I0b05VYnRUOGtVVXhMSDM0?=
 =?utf-8?B?WktkdVh4VWE3ekJnSmV2UDZxb3pqQUgveHBoL2lwOWFJTFpkSktzdXBuVE9n?=
 =?utf-8?B?d0lOOUFQUU1MdWZwbFcycWNIREFFS2JFVURPajRKQ000RTNGNUVObGNTeTFT?=
 =?utf-8?B?aFlFa3FVNGZXcXpLaU9uc1BoN1g5SVlCTEI4M1FwQjVQRGVML3hJeVRrcjVD?=
 =?utf-8?B?aHFyNzJHbEJCWml3NzRZT2R5cXJKNkZaenpXWWErbm9KVGR6Z0l4ME1QYU5u?=
 =?utf-8?B?ZlBudUpBTnErZ09VdmZaWllWa0R5eS8vYWFDN0NFOEgwS2lIOTRTVTJrMmdF?=
 =?utf-8?B?b2lGMnBKRDcrUDJvQy9UMXFHbFdVTTNOMzhZRkF6Y2JtN1hTZ0tPZ1V1SDFR?=
 =?utf-8?B?WUdwSEZZRkxBWWh6dml2endGeU4wZ1FqanVlM2FpYXhmckJzMUZFZGt2L1pG?=
 =?utf-8?B?OWN1VTJGc0hUNDVNbnRtTng1ZEpWQ0toRjlJVjZJbWhJaFgxWkVDY3BLYW1o?=
 =?utf-8?B?SVFteVNLWFZGejA0WHUxYTk5WmRubUFwRWxyYjFNeHZHUlV6SFd6czA0VHRU?=
 =?utf-8?B?OHVWb0VnNUlYNFVmWDB3TmdJOGVVcE9UazRjd3BWdzZiVnp4c20wWGlXWDJN?=
 =?utf-8?B?NU5wRFMzRGozaWlnV00xVGN6VHgvbXd6R1RhTmxTZmZ3bERoemJiYktnVmY2?=
 =?utf-8?B?ZHpaNmxGbVBtc2VJWStsYU9jL1VPSnh0dXorWThpWEpETFFUNXM4QzJVc0NO?=
 =?utf-8?B?aVgyQ2RYamVQM1FTdTFzdmVDYkNha2NsQy9RSTdiVXdPVUYwb3V4aVV5U2FV?=
 =?utf-8?B?NUhPM0E4NUUydG90Z2gvMGFKVWtXREU3S1gwSlNJT1owcmcwZFlLRzg5QlZY?=
 =?utf-8?B?eGk3c0NNeGtVa0VJUkF3NzhDTzlQempncDU0dkVwRzU3c3AyczlGOFk2cHlV?=
 =?utf-8?B?MCtsbzl4RE9aWS9nYUhrcUJGeHJsQkF0S3FuUHdDbFZEUncrTTlNaVZSU3FV?=
 =?utf-8?B?MVJCKzR1S3NsUHAyNytJYUphSHptS2ZTRlI3RjRIWmY0bWRaWVdLWjljZnpu?=
 =?utf-8?B?QWx5cE9FWkFEa0hEcXFyZUprcjF3b3J5VDROdDBGMWNTSHFxb25QSTdaQVc0?=
 =?utf-8?B?c20vYktMRUFNVE9JcXFwNy9YUDhKeDJ4dE5ZVFBqMUZMMnc2ZkdYNjlBdWFO?=
 =?utf-8?B?aS9OMVFzdDR3c3hDUjNhVjlMSXJMcVBPN2NpZTdBamU1UjJBS1FCcDNPa3Bt?=
 =?utf-8?B?TElCRjUyUlRmaGVNY0VYb2xDSzlaNG51WnZORGZMakpmL1BJZzJvL3dOZ3p2?=
 =?utf-8?B?RTVkUGV4aVJxSDl3aXFQVmdHR2tkS2laRkxndmZkWTVNVUlDbkZCd1JVTlVV?=
 =?utf-8?B?akFRK0hqdFdyY3lIaVNNbWFUT2hNckZyUGxoaEVMelJpZGkxTXNQWUc4ZU00?=
 =?utf-8?B?L3oyZk5hdFdTRkM5RmhhS0kwdTljL0diaDFKOGc4aXFyY2x3RTZaVWFnaFlH?=
 =?utf-8?B?WElMWHZLZEMxZW1qN2p4YThZNU82emZMSFJ0aWVOQUNLcytEZWoydGo1emx4?=
 =?utf-8?B?WDdrSVpjQ2xBQ0R2L29vbHo5S0g2dHc5OEtFRGphVDkyOUFHK3lVWnR5R1pR?=
 =?utf-8?B?OHhYdWJnSnp5RmRIRnNhWGdMb0lJN2FHenBHdllyZk1mRGQ0LzBOaUNhWFlr?=
 =?utf-8?B?WjBXTzMwNmpiUUxvdHRaWGUxYXFIUGJFWGtHRGlkb1JwM09mTEcwSGNzbzB5?=
 =?utf-8?B?WGF3N0h2ZjhucUJkN1lPcGNDU0RXZitZL0FVbHVUQzRZVS92MGlFZk9DTnMr?=
 =?utf-8?B?QVBXTHB1bHl1UURRNVIrcmVDQVBIOE1Ib2Jxc2VETGFnMEsyVXpQR2paWjVU?=
 =?utf-8?B?ZHAzZzJJeXY4OG9hcUgzNDFBS1ozWG5GN0QybytaTVlzWm1zMXVUcGRySEZ5?=
 =?utf-8?B?ZnNsVkJNRVV2TzJhc2RSOENibkxUWFFKdjJOUStETG5rMVNVQlVNZWh6RjRK?=
 =?utf-8?B?ZjZXVEdvemdnWWt2bzVBV0pDdGMzWDJ6RFMyVkVGZVpVczQvTDZybk1QY0hq?=
 =?utf-8?B?eFc3bVBBbTR4aktmV0doWGZwR0hXWE5RMXlmbW9JUTBoclpKZXNKUXFaUWpn?=
 =?utf-8?B?QXBva09hNk1VRDJOeU44OVZaZFFoSkVpaFBRUW5mbW8xa011WENNUDRIeU5p?=
 =?utf-8?B?UDgrb01OTCtXVjJsUmhlZmZXNi9jblU0ME80QUxNZC9GKytSN0RaMmgzWWY2?=
 =?utf-8?Q?cVSwPMQ9+U8R4aO4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b29bf8-da89-4eee-2594-08da3e9456a7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5866.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 21:20:07.2009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIHFja1WbhkbzLVsz7dOycu/jMpFHObkC3fFo9ChjYOqV82nek8NibHALn+WwIhjRoCwEQjgSgaoq91Y8PrV6XyVm4yhIHBWlwjOuuaMfWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3217
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-25_06:2022-05-25,
 2022-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205250099
X-Proofpoint-GUID: GTX8Lmg0PRdLCW31GjWi8NmjXPh5imOA
X-Proofpoint-ORIG-GUID: GTX8Lmg0PRdLCW31GjWi8NmjXPh5imOA
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 5/25/2022 3:56 PM, Moger, Babu wrote:
> 
> On 5/24/22 18:23, Alejandro Jimenez wrote:
>> On 5/24/2022 3:48 PM, Moger, Babu wrote:
>>>
>>> On 5/24/22 10:19, Igor Mammedov wrote:
>>>> On Tue, 24 May 2022 11:10:18 -0400
>>>> Igor Mammedov <imammedo@redhat.com> wrote:
>>>>
>>>> CCing AMD folks as that might be of interest to them
>>>
>>> I am trying to recreate the bug on my AMD system here.. Seeing this
>>> message..
>>>
>>> qemu-system-x86_64: -numa node,nodeid=0,memdev=ram-node0: memdev=ram-node0
>>> is ambiguous
>>>
>>> Here is my command line..
>>>
>>> #qemu-system-x86_64 -name rhel8 -m 4096 -hda vdisk.qcow2 -enable-kvm -net
>>> nic  -nographic -machine q35,accel=kvm -cpu
>>> host,host-cache-info=on,l3-cache=off -smp
>>> 20,sockets=2,dies=1,cores=10,threads=1 -numa
>>> node,nodeid=0,memdev=ram-node0 -numa node,nodeid=1,memdev=ram-node1 -numa
>>> cpu,socket-id=0,node-id=0 -numa cpu,socket-id=1,node-id=1
>>>
>>> Am I missing something?
>> Hi Babu,
>>
>> Hopefully this will help you reproduce the issue if you are testing on
>> Milan/Genoa. Joao (CC'd) pointed out this warning to me late last year,
>> while I was working on patches for encoding the topology CPUID leaf in
>> different Zen platforms.
>>
>> What I found from my experiments on Milan, is that the warning will
>> appear whenever the NUMA topology requested in QEMU cmdline assigns a
>> number of CPUs to each node that is smaller than the default # of CPUs
>> sharing a LLC on the host platform. In short, on a Milan host where we
>> have 16 CPUs sharing a CCX:
> 
> Yes. I recreated the issue with this following command line.
> 
> #qemu-system-x86_64 -name rhel8 -m 4096 -hda vdisk.qcow2 -enable-kvm -net
> nic  -nographic -machine q35,accel=kvm -cpu host,+topoext -smp
> 16,sockets=1,dies=1,cores=16,threads=1 -object
> memory-backend-ram,id=ram-node0,size=2G -object
> memory-backend-ram,id=ram-node1,size=2G  -numa
> node,nodeid=0,cpus=0-7,memdev=ram-node0 -numa
> node,nodeid=1,cpus=8-15,memdev=ram-node1
> 
> But solving this will be bit complicated. For AMD, this information comes
> from CPUID 0x8000001d. But, when this cpuid is being populated we don't
> have all the information about numa nodes etc..
> 
> But you can work-around it by modifying the command line by including
> dies(dies=2 in this case) information.  Something like this.
Makes sense; using dies=2 makes it so the cache topology leaf is built 
with 8cores/CCX, matching the # of NUMA nodes so all is well.
> 
> #qemu-system-x86_64 -name rhel8 -m 4096 -hda vdisk.qcow2 -enable-kvm -net
> nic  -nographic -machine q35,accel=kvm -cpu
> host,+topoext,host-cache-info=on -smp
> 16,sockets=1,dies=2,cores=8,threads=1 -object
> memory-backend-ram,id=ram-node0,size=2G -object
> memory-backend-ram,id=ram-node1,size=2G  -numa
> node,nodeid=0,cpus=0-7,memdev=ram-node0 -numa
> node,nodeid=1,cpus=8-15,memdev=ram-node1
> 
> But this may not be acceptable solution in all the cases.
This is not specific to host-cache-info behavior so it is probably 
better to discuss it separately. With that being said...

The idea that I considered was to automatically calculate a value of 
'dies' iff a explicit value was not requested via the '-smp' options, 
instead of just using the current default of dies=1. i.e. automatically 
mimic the host cache topology in the guest so that if we are running on 
Rome, the guest OS sees 4cores/CCX, but when running on Milan it sees 
8cores/CCX. This can be done by querying the host CPUID and using that 
info to build the guest CPUID leaf in QEMU, similar to what Igor is 
doing here but also adjusting the number of dies that is encoded.

I built prototype code that seemed to work correctly, but did not 
consider the complication added by '-numa' options.

I think there is a much larger debate involved about what defaults are 
"sane", so rather than derailing this thread more, I'll send a follow up 
message in the future when I can take another look at the prototype 
patches I have.

Thank you,
Alejandro
> 
>>
>> # cat /sys/devices/system/cpu/cpu0/cache/index3/shared_cpu_list
>> 0-7,128-135
>>
>> If a guest is launched with the following arguments:
>>
>> -cpu host,+topoext \
>> -smp cpus=64,cores=32,threads=2,sockets=1 \
>> -numa node,nodeid=0,cpus=0-7 -numa node,nodeid=1,cpus=8-15 \
>> -numa node,nodeid=2,cpus=16-23 -numa node,nodeid=3,cpus=24-31 \
>> -numa node,nodeid=4,cpus=32-39 -numa node,nodeid=5,cpus=40-47 \
>> -numa node,nodeid=6,cpus=48-55 -numa node,nodeid=7,cpus=56-63 \
>>
>> it assigns 8 cpus to each NUMA node, causing the error above to be
>> displayed.
>>
>> Note that ultimately the guest topology is built based on the NUMA
>> information, so the LLC domains on the guest only end up spanning a
>> single NUMA node. e.g.:
>>
>> # cat /sys/devices/system/cpu/cpu0/cache/index3/shared_cpu_list
>> 0-7
>>
>> Hope that helps,
>> Alejandro
>>>
>>>
>>>>
>>>>> Igor Mammedov (2):
>>>>>     x86: cpu: make sure number of addressable IDs for processor cores
>>>>>       meets the spec
>>>>>     x86: cpu: fixup number of addressable IDs for logical processors
>>>>>       sharing cache
>>>>>
>>>>>    target/i386/cpu.c | 20 ++++++++++++++++----
>>>>>    1 file changed, 16 insertions(+), 4 deletions(-)
>>>>>
>>


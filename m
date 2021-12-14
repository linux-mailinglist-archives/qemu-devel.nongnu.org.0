Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA452474A8B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 19:14:12 +0100 (CET)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxCJX-00008m-Gm
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 13:14:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxCHi-0007WO-7b
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:12:18 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxCHe-0003VM-QN
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:12:17 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BEGYKEx016134; 
 Tue, 14 Dec 2021 18:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=a6ES3GjNe4oFnKWqqPDcqGwVg0zq44r4gF1XOh4x/kA=;
 b=uXgdMvnHkL2MaY2ORvIjlHxX5nOgz9H3zWoOrzJtbcd+F/ZeB08GWzDjkYXpzszryqsU
 C54T32BnsXxmaWnNmN8t0Xgs4iX/ic8oPOJI7wtvO4AvCWwhhIz5EyMORXLgKqNTXm+7
 yksUaU+SbZB71a8PcaXuW6K9ssxyM4vL06lbAitTNTbwNqewmFmkLgr8ufc8rritJr9J
 LDJqnqS/on0xMNDXa16B1MS31sBDL1mikvDCY12LDJr4Xdf6uzwTTcdLzF6Y1gi3gLN8
 x5xcuUxk5x2iGZdlINeQVU3ZEah0jAva0gzzSvZkdFiejGgde/iTMPiyUX04fWS0PM1M 6g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3mrvq02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Dec 2021 18:12:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BEI5a27195664;
 Tue, 14 Dec 2021 18:12:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3030.oracle.com with ESMTP id 3cvh3xs895-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Dec 2021 18:12:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3MpuzGREoVR2YgycN1Sl4FK9RtgrQ0OovMFz9vnLjFxGvXBn8kGJx3RDxg2I1erpPjSB/4U9BV3Ct0b5LkidzxJAH2tRRnxuCOoX9iRJ4kSd0VaNasFoxLOsKVW8O2CAamgWd4qtFr0ZPXItOglbADaxpA9GwbBL0nlts7xE7HNuQgcHnJNU660sD7rVgVH2rVQCzFugYOKFKvckoXCCcmfniGIGIOb6/btIHBv9sVw9yWKgFjuNUff03zebZK3L70vZUHhwIIL238bZbuSRrAHpMrMeKnjR95XFk8sfftHZKDgltCfSicsMarDTSotEdiTnVsmiY37IBxxGfVSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6ES3GjNe4oFnKWqqPDcqGwVg0zq44r4gF1XOh4x/kA=;
 b=hD+f/O0QQ6CfLVp74sN0GwqHYBKnvzzWBPeprLE1rQk6ve4YHrHyuDdFWFBTagLUl2RQ/dIDF0Ojd+d+CSW+TbnXguJxG7u6stv6bz2PYQjPgC5NMj8gxqE2E90RpZcG8n/fMwvP3yVA/Uwc63Aunia3JGeR2AC3+uegi53ufLWZSm3YZvjbrsuTZdQcepNTK6OyHxu6enPnp5V0eBkbb8jU2yzljUlsFfH6MlGlTGYm0+iNXYAsMVHMrsAoM3nLR1f4VFpkSbS45SrdvP6QZXTic3dN8URQ0KHDYJ43Vm5zZpnPsm3K9WPi0aZlxX329jtuyDvjcVnq20+DV/uufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6ES3GjNe4oFnKWqqPDcqGwVg0zq44r4gF1XOh4x/kA=;
 b=zgd/VSu/uHVlJNnWbnusItiWVgpHOIIrLl1DOq/W6N/MPwsz0br62BUham51lSG+InhLR+vPrh40iSnopdSEGaqmZ+0P0msAWQMRTu74alpa51xTlHx8ZuvgCNVKv6NQjH+O2ecVTSMKb+IWxcgH8F/nkK3tmolsfdREBdh/aG0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW5PR10MB5691.namprd10.prod.outlook.com (2603:10b6:303:19c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 18:12:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 18:12:06 +0000
Message-ID: <37b59132-07bc-30ba-c586-989cc09d69ec@oracle.com>
Date: Tue, 14 Dec 2021 12:12:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
 <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
 <CAARzgwxqBfk4jSdH7EDzUHjVPBr7DiLkKSeq7grvFOX_AX3hgQ@mail.gmail.com>
 <45a36fcb-d778-e077-a1ac-522d75e79af8@oracle.com>
 <CAARzgwzrxmArMNHhG32ZFe-ryC2t3YHfsPcFt+tvYnOcOF5v_Q@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwzrxmArMNHhG32ZFe-ryC2t3YHfsPcFt+tvYnOcOF5v_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:806:125::29) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf4ddc3e-6572-42f3-ea0d-08d9bf2d3c88
X-MS-TrafficTypeDiagnostic: MW5PR10MB5691:EE_
X-Microsoft-Antispam-PRVS: <MW5PR10MB5691569242ABD33D56F3814797759@MW5PR10MB5691.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGVrfx81qdDBVGMicnKlXB7dmH6ps/CcGYvb+swW2fIza9FuPr5QRX2MXf88yB7PGynv6RXSeCyP4UFqZ9erQg82KvN7nlDKysrGlcsVJyIZ6gum91VtqLj00+qLmRgmy7tXAwXt+4v2hulfFWISzl6t3vCO51VhaScCv1kPeTPPBINBtlkbyuj25gcCwVCtRcsU5aWpDaeCID8Q/nCrie1yjWwcNrtfGMwX9X2gjTcLwvpW375DovVefcyAwV5qKDJR5U4r6oQdIDohSGnydOwmqepNiTdXOkWs7XSJz8aURynDmC0q3uFqjIVp4yDEpd5G+7v3nEj93ndFvkn3SIU60R8i60RS+nTt293vHdDkyK2W3axVyc2mr5eiEWyCZF+IFdFEVORB8rnhdC3Qt9bCbR/6TGR1uuHclA2pReg7DZtjw/ddoABJLXT8D5PWeYEick1WjMOhoAMV5/RM6SoSJOvDo/VS+vK7EMEhia/KcXIeCy0m7+/U92behZv7ABs8fHIvmIjWte0ms1FpYX3UytcB8osCe7wrfXR+fPVlS1ndgDGn+oQ8uVZjOYaN8pM8PNjjbKUcioTbN2y2uXpaoFVurRk90YXJDHT8NHna0SfdTitsveer2oUEJGGv0vy2PbUDXFkQS79LDQf31XnsV+ntXZ2hKuAqPOqFx7YYibLtUdB6zmFkkhqItEgVT/0H5CMrWxBO6vnkbI5v2ks6F2G4ygElNIe0aalRY9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(36756003)(38100700002)(6916009)(508600001)(8676002)(6512007)(2906002)(316002)(86362001)(53546011)(30864003)(5660300002)(66556008)(66946007)(66476007)(4326008)(2616005)(31696002)(6666004)(6506007)(8936002)(186003)(6486002)(31686004)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3hONzNkKzhSdnFYWFJqbk4yZCtBblo3eStjOENBSVVlb1BzR2lDaVRHUjFG?=
 =?utf-8?B?TEtYY0o4eW0rUU00Q21wUzEvTmlxajJwamVsT09SbUZYT2dWRy9MVVg4Ymky?=
 =?utf-8?B?NHJiUjMvb3hyUWl5eDZMZkZYdHU5N1lQSXlPaUd2M05jdFJOdGRYZXNhYi9X?=
 =?utf-8?B?b1czWHVINkVQT3d6U0RIMVBNY0NOZlJPWnlpNC9wQmRyVVhPRkxkM2dTZlhO?=
 =?utf-8?B?d2Y1OE9xMHZmQVZxOXBQQU5FNHY4UlV3L0xpOU03dStjdVpSOTJLUklZOEtX?=
 =?utf-8?B?bExSQ3RzbnRPc3I2dmw5cmdwRHBWaDZzeGFmV2ZVcjduaVlSQUpseW5mdHRx?=
 =?utf-8?B?L2J4S28wcFQxd1hYcXZ6TlN4YlNocGk2bGdGb1NPN2lJSlQrUEd1dCtmQTFV?=
 =?utf-8?B?Ulh6WUNpc1JKUGd6QmxKcEhld2k3Rm9MSFF1VlVqMmx4VTBJYk5mWTJhRjl2?=
 =?utf-8?B?Ri9IdC92aXVKOXhpbTNnM0YzUll4d0xtdmZsMzJBSXdKVmVNQTVoUzFBNFlL?=
 =?utf-8?B?WlhhK0MzY2ZQUWwwVWxKRERrQ1N1K1JEQTVRNi9UZ21jWnNrdTdzalV5VUdD?=
 =?utf-8?B?RUxXWmdsUFpzQXR3NE40UzZld3F2QVJBOTNkU0NvRUl6VCtWc29SNVQyQXky?=
 =?utf-8?B?SDR0dHAwQ0xRcCtKODR3RHZrZ3lUS3BIckdvbUdNSmFNVGM4OVZUWk5jMnZm?=
 =?utf-8?B?K2FtQUhDeDBuM2xvZXcrSW9VR1F5VndRd0FKelFVb2RtamJzYkJ0ZTZ0U2NO?=
 =?utf-8?B?cDdWMXNBRXd5bEdSK1ZsZzUzSlRxWlUzUEk3OUM3TFpuSUUvaXJQQ1Y5Nmpz?=
 =?utf-8?B?U1FzR3FZeFpyZ2R0TndhM0NWendDUk5RRnp3ZXdGSEFYbWJUUytoUE5XTFBH?=
 =?utf-8?B?SDd5aHF3UExLeWp6OHgyTnNqUzRPNmU0QmY0Qyt1K1hiTE05U3V4MjlUaXgv?=
 =?utf-8?B?b01QekQ4VUJLVUc0NUNSMitCUElvTURLbTQxZ3NCSXFqL3JkeVhiVU5aZWcz?=
 =?utf-8?B?eDZiSEVWdVFqOEVCNllJQ2lMZE1ybnRmWDZndUVXRXdSTTVFbjVXS2JpYmMw?=
 =?utf-8?B?Vno4VzNlM3JDa0R4NTJqMFRPSkM3enZxYnAvMEhHRUhoeGV1dG55RE81Nks3?=
 =?utf-8?B?TCtvMFNDcm5YcnFlb1F6N25TVlRQZDhvSXoxQzVwRCs5eENENnNMdGxUZ0tt?=
 =?utf-8?B?OEZHZUQ1YmxDS01mWEIvNkdnSE5DS1pRSmZBbHNJYlljdzBoZFpNdmg0M1hp?=
 =?utf-8?B?WlhqaGhHRUR3TUs0MnpEZVVyQkVKZWk0TnMwajNxZjBpRjZHVHNKOUYvRWNj?=
 =?utf-8?B?UnVmL3VQQlpyZU5tSTVjeUVXZFRQTVN3N05QdjVOWTJsMmlLNG96L1ZMdlZv?=
 =?utf-8?B?bXVraEk0TjdTTDhIWjkzQ2NPOS8ranVWWXpoY1N3OVd2S0VOTk1RUjlJTVU5?=
 =?utf-8?B?bUQ1VDVkR0Z4UGdnWW5na0pudTZDSEpTaVV1YkxBTnhhMFY2bStHbHVQS0dZ?=
 =?utf-8?B?Nit1YnBvSTJwVTZzTVFQSnhpVERJdTkvVDhJdFgxSFl2V2VOaGQ2dDV3S0RX?=
 =?utf-8?B?Vkd6NHh0WjR0UVhmUS8yR3Z3SnI4bHRvUmFiTmFUSjJKU3JrVGNqTzJ6dUVl?=
 =?utf-8?B?alpGdkx0WWlSUlZ3U1ExcitnYW5GLzlBZGtXS0NlczlMT290RjQydzU4UE5u?=
 =?utf-8?B?b0UrWWVFWE1zRFByVGd1aTJuWkttQmphVm5WclozUGJQSDhMZTlqa0RManpG?=
 =?utf-8?B?eThYTHpqeTdkZWpzZllMQ0ZvNXM1MkpycUpJRFg3dHRhaUZDZmxVRDBuWC8z?=
 =?utf-8?B?MkNaUHdsUjlvc0h6dWxGbUdoclhaa01qelpGdW1CN1J5REJETzh4S2hFSmVZ?=
 =?utf-8?B?cnM5elNDN2VLZjdPVzF5b2ZmOENGWDZaVTRSbEhUMytid3plRU1ZdlhxOXFl?=
 =?utf-8?B?NC9YN0RGbmRWNXNDZFpCSitTbFBxOVRxUFBoM3dDcDdrRGx2WUtnd3FSck1r?=
 =?utf-8?B?cUtJb3hOUmVtY3pJTmlYV29rR2tyQU9rVU9JWGRCUE5semt3eldYTmYxTkY2?=
 =?utf-8?B?SEZXOUJ4SUt0L3FYZldRVmlGREtTUDFBZlZjQ0xpYjJTVmFKTmhvVWV1Y0tv?=
 =?utf-8?B?V241RTJnM1RHRitVc2hTWXA4QzRyU2Q5Z0hld0tzMWR5ZEV0d3RqUThQQUNa?=
 =?utf-8?B?bGpPYzBrTHpqbDh3dGNPRDZIa2FrYzdLY0dNQjZsdHFFVUdwM0JKbnIyZy9O?=
 =?utf-8?B?SWV6N0hYVlZMYXNYMi9SczBNcTc0K081M3FhZmlMZ0VxSkNnS090bUJaajBM?=
 =?utf-8?Q?FPmRtl07ZSMBw732Ej?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4ddc3e-6572-42f3-ea0d-08d9bf2d3c88
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 18:12:06.2018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iy7pz+uP9ccvJ/E+GDp6MLfv4M4s1nSzjzti4L4cCSFwQJ6uTedUSnP73/qAJeE3K81zRuj51K72jUgPnr91w9sCGYakRspNKgkyEOo0YY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5691
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112140098
X-Proofpoint-ORIG-GUID: VbjyFpPyM5ybJznFkuaKeSKKe6mWQbYC
X-Proofpoint-GUID: VbjyFpPyM5ybJznFkuaKeSKKe6mWQbYC
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani, one quick question below.
eric

On 12/13/21 20:58, Ani Sinha wrote:
> On Tue, Dec 14, 2021 at 2:57 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> Hi Ani,
>> inline response below.
>> Eric
>>
>> On 12/12/21 07:43, Ani Sinha wrote:
>>> .
>>>
>>> On Thu, Dec 9, 2021 at 11:28 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>>
>>>> This builds the ACPI ERST table to inform OSPM how to communicate
>>>> with the acpi-erst device.
>>>
>>> This patch starts in the middle of pci device code addition, between
>>> erst_reg_ops and erst_post_load. I do not like this :(
>>
>> Below you suggest moving the contents of this patch to the bottom of erst.c.
>> Before I do that, consider moving the contents to the top of the file instead, I believe that would
>> address the concerns cited here, and it would allow for the last line of the file to be the
>> type_init(), like other files.
>>
>> I'll move it, just let me know if top or bottom.
> 
> Moving to the top is fine.
I've moved this to the top. The question is if you prefer this be integrated into the main erst.c 
patch, or still separated out?
thanks!
eric

> 
>> Thanks!
>> eric
>>
>>
>>>
>>>>
>>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>>> ---
>>>>    hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 241 insertions(+)
>>>>
>>>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>>>> index 81f5435..753425a 100644
>>>> --- a/hw/acpi/erst.c
>>>> +++ b/hw/acpi/erst.c
>>>> @@ -711,6 +711,247 @@ static const MemoryRegionOps erst_reg_ops = {
>>>>        .endianness = DEVICE_NATIVE_ENDIAN,
>>>>    };
>>>>
>>>> +
>>>> +/*******************************************************************/
>>>> +/*******************************************************************/
>>>> +
>>>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>>>> +#define INST_READ_REGISTER                 0x00
>>>> +#define INST_READ_REGISTER_VALUE           0x01
>>>> +#define INST_WRITE_REGISTER                0x02
>>>> +#define INST_WRITE_REGISTER_VALUE          0x03
>>>> +#define INST_NOOP                          0x04
>>>> +#define INST_LOAD_VAR1                     0x05
>>>> +#define INST_LOAD_VAR2                     0x06
>>>> +#define INST_STORE_VAR1                    0x07
>>>> +#define INST_ADD                           0x08
>>>> +#define INST_SUBTRACT                      0x09
>>>> +#define INST_ADD_VALUE                     0x0A
>>>> +#define INST_SUBTRACT_VALUE                0x0B
>>>> +#define INST_STALL                         0x0C
>>>> +#define INST_STALL_WHILE_TRUE              0x0D
>>>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>>>> +#define INST_GOTO                          0x0F
>>>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>>>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>>>> +#define INST_MOVE_DATA                     0x12
>>>
>>> I prefer these definitions to come at the top of the file along with
>>> other definitions.
>>>
>>>> +
>>>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>>>> +static void build_serialization_instruction_entry(GArray *table_data,
>>>
>>> This function and buiild_erst() can come at the end of erst.c. They go
>>> together and are doing a common but different operation from the
>>> operations of the pci device - building the erst table. Hence, ther
>>> code should be separate from pci device code. A new file would be an
>>> overkill at this state IMHO but in the future if erst table generation
>>> code gains more weight, it can be split into two files.
>>>
>>>> +    uint8_t serialization_action,
>>>> +    uint8_t instruction,
>>>> +    uint8_t flags,
>>>> +    uint8_t register_bit_width,
>>>> +    uint64_t register_address,
>>>> +    uint64_t value,
>>>> +    uint64_t mask)
>>>> +{
>>>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>>>> +    struct AcpiGenericAddress gas;
>>>> +
>>>> +    /* Serialization Action */
>>>> +    build_append_int_noprefix(table_data, serialization_action, 1);
>>>> +    /* Instruction */
>>>> +    build_append_int_noprefix(table_data, instruction         , 1);
>>>> +    /* Flags */
>>>> +    build_append_int_noprefix(table_data, flags               , 1);
>>>> +    /* Reserved */
>>>> +    build_append_int_noprefix(table_data, 0                   , 1);
>>>> +    /* Register Region */
>>>> +    gas.space_id = AML_SYSTEM_MEMORY;
>>>> +    gas.bit_width = register_bit_width;
>>>> +    gas.bit_offset = 0;
>>>> +    switch (register_bit_width) {
>>>> +    case 8:
>>>> +        gas.access_width = 1;
>>>> +        break;
>>>> +    case 16:
>>>> +        gas.access_width = 2;
>>>> +        break;
>>>> +    case 32:
>>>> +        gas.access_width = 3;
>>>> +        break;
>>>> +    case 64:
>>>> +        gas.access_width = 4;
>>>> +        break;
>>>> +    default:
>>>> +        gas.access_width = 0;
>>>> +        break;
>>>> +    }
>>>> +    gas.address = register_address;
>>>> +    build_append_gas_from_struct(table_data, &gas);
>>>> +    /* Value */
>>>> +    build_append_int_noprefix(table_data, value  , 8);
>>>> +    /* Mask */
>>>> +    build_append_int_noprefix(table_data, mask   , 8);
>>>> +}
>>>> +
>>>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>>>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>>>> +    const char *oem_id, const char *oem_table_id)
>>>> +{
>>>> +    GArray *table_instruction_data;
>>>> +    unsigned action;
>>>> +    pcibus_t bar0, bar1;
>>>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>>>> +                        .oem_table_id = oem_table_id };
>>>> +
>>>> +    bar0 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>>>> +    trace_acpi_erst_pci_bar_0(bar0);
>>>> +    bar1 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
>>>> +    trace_acpi_erst_pci_bar_1(bar1);
>>>> +
>>>> +#define MASK8  0x00000000000000FFUL
>>>> +#define MASK16 0x000000000000FFFFUL
>>>> +#define MASK32 0x00000000FFFFFFFFUL
>>>> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
>>>> +
>>>> +    /*
>>>> +     * Serialization Action Table
>>>> +     * The serialization action table must be generated first
>>>> +     * so that its size can be known in order to populate the
>>>> +     * Instruction Entry Count field.
>>>> +     */
>>>> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>>>> +
>>>> +    /* Serialization Instruction Entries */
>>>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +
>>>> +    action = ACTION_BEGIN_READ_OPERATION;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +
>>>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +
>>>> +    action = ACTION_END_OPERATION;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +
>>>> +    action = ACTION_SET_RECORD_OFFSET;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER      , 0, 32,
>>>> +        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +
>>>> +    action = ACTION_EXECUTE_OPERATION;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +
>>>> +    action = ACTION_CHECK_BUSY_STATUS;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_READ_REGISTER_VALUE , 0, 32,
>>>> +        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
>>>> +
>>>> +    action = ACTION_GET_COMMAND_STATUS;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_READ_REGISTER       , 0, 32,
>>>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
>>>> +
>>>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_READ_REGISTER       , 0, 64,
>>>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>>>> +
>>>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER      , 0, 64,
>>>> +        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +
>>>> +    action = ACTION_GET_RECORD_COUNT;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_READ_REGISTER       , 0, 32,
>>>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>>>> +
>>>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +
>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_READ_REGISTER       , 0, 64,
>>>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>>>> +
>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_READ_REGISTER       , 0, 64,
>>>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>>>> +
>>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_READ_REGISTER       , 0, 32,
>>>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>>>> +
>>>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>>>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>>>> +    build_serialization_instruction_entry(table_instruction_data,
>>>> +        action, INST_READ_REGISTER       , 0, 64,
>>>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>>>> +
>>>> +    /* Serialization Header */
>>>> +    acpi_table_begin(&table, table_data);
>>>> +
>>>> +    /* Serialization Header Size */
>>>> +    build_append_int_noprefix(table_data, 48, 4);
>>>> +
>>>> +    /* Reserved */
>>>> +    build_append_int_noprefix(table_data,  0, 4);
>>>> +
>>>> +    /*
>>>> +     * Instruction Entry Count
>>>> +     * Each instruction entry is 32 bytes
>>>> +     */
>>>> +    build_append_int_noprefix(table_data,
>>>> +        (table_instruction_data->len / 32), 4);
>>>> +
>>>> +    /* Serialization Instruction Entries */
>>>> +    g_array_append_vals(table_data, table_instruction_data->data,
>>>> +        table_instruction_data->len);
>>>> +    g_array_free(table_instruction_data, TRUE);
>>>> +
>>>> +    acpi_table_end(linker, &table);
>>>> +}
>>>> +
>>>>    /*******************************************************************/
>>>>    /*******************************************************************/
>>>>    static int erst_post_load(void *opaque, int version_id)
>>>> --
>>>> 1.8.3.1
>>>>


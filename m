Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494FC5AAA19
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:33:23 +0200 (CEST)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU277-0004Ya-JQ
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oU1ox-0007WF-D7; Fri, 02 Sep 2022 04:14:35 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oU1ou-00036K-7O; Fri, 02 Sep 2022 04:14:34 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2827m6cK024963;
 Fri, 2 Sep 2022 08:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=OMdPbs8x5NKFwsCJimvzNYHg4JE9JBIpFNtZ4PEX5VI=;
 b=f2eVsNg32O/gLmDJzX0pEcgG5TtaJS5Q5Gl6ksgWLqNVpSZWgWcJC160WJHGz6q8VjaA
 DJZjJ0DRUNY0XR3vpQri+XM7C7ThB0qJpsVjvbeciQ70JQ36SuGLZKuU1c+f6PcJsz8h
 wPmVAarFBQXob7pGC9ayoqdNmhvvs9DLZAGhgiXGUZ5zwztYq8FFLMbfsIFLsMZMGwJ5
 WqdWQ7NpkgBTnZWzfNJxC6AZTpkythU7afyWjm18+g6Ibe9NqojeLnss9zc43KMv6Ybq
 DPN0QpaqNECPqoB3wyDq3lQemSRAS3+LGB5fq9MH2fScQnlRUwPgI0ecNHOMB6Z2DtRj Xw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7avsphsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Sep 2022 08:14:26 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28253omp009112; Fri, 2 Sep 2022 08:14:25 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q73bp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Sep 2022 08:14:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOq5SZVl+H7G32XepKf3DGobZyJdds49E/uDVSkZ0TKk4owiU/Wf6iEOIYCt2qK8V/uEiWdLLHajWVay5/YbnpOliOjVXo+aFOZ+VDLMk7ewYgOkFpb/hPGw3J5sXU1KN5hsodinRy8fC4Ri/lZ7c/1ei/6Mp47O4i4bE6uU6F80dWXw0nuuh3GVlRilQH8nnYPn34KjCOMLvnJ+wGEIG+6bH3qb7tpc02aaxll0vs62i4HBoCeBSnjdpxLHxxeXa6S5G73IcMOPQsNE2PAR4HDO0P+VpE18NIMBa3qL7IIwkxKcfGvOVAYlkCj6pSL/ZZPKw3Na3BebZQJurY+u4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMdPbs8x5NKFwsCJimvzNYHg4JE9JBIpFNtZ4PEX5VI=;
 b=gmAL9IsqfQypZ0nxlGQZhDPrdy0o0iO3r7GMpOdmj6mj0FX3IGTwpmRblFoHEzMU1TJOcJ0yZoG7VdKkPKEI73sId7prXfnPYkFPAezKgCEgirBYO16gB3G7k5eGtlyzpbnSNnVPwQpHGSvE+23miaeAJ4X0Qp7sSIIBkroPfB5INQug61U+MBXWy5QSuoPuA0BLLERuXnx/mqOz7487ONQZPzdKSqgJaJiovquReUZNXyGwqR1SPwi3fouEEPOEkb+r8So5nw5D1wJjOFFeWQFnT5MELd53t5s8uvk2L5JLYlrJ0DIuZUY0KU1dBG7FHtXldX8RcZf/N5BC/vv5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMdPbs8x5NKFwsCJimvzNYHg4JE9JBIpFNtZ4PEX5VI=;
 b=nxxftMguE8dAym96qJCTe99eq+MBRqY167Rm5vLvdLuYyN0efIecREk4eBewlvaNTBa7yq4zBfYs6s7DFRtMhG77nJ9zGG+/IXvT4qUMgCDjEPZp6bdxTt/Tf+Y8cne7tyYScVP+sQbtugnLtPu7iTkg2FA5jOoql09ncYYcFos=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by CH2PR10MB4391.namprd10.prod.outlook.com (2603:10b6:610:7d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:14:23 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d%5]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 08:14:23 +0000
Subject: Re: [PATCH v2 1/1] monitor/hmp: print trace as option in help for log
 command
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, dgilbert@redhat.com,
 joe.jin@oracle.com, Paolo Bonzini <pbonzini@redhat.com>
References: <20220829170316.3053-1-dongli.zhang@oracle.com>
 <87mtbmhu0o.fsf@pond.sub.org>
 <774cddc6-d2d6-a936-0beb-249d3e5877c2@oracle.com>
 <87pmgf4mmr.fsf@pond.sub.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <bc885f57-992c-819f-76ff-08eb27f8455b@oracle.com>
Date: Fri, 2 Sep 2022 01:14:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <87pmgf4mmr.fsf@pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:806:21::19) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b9ce722-579c-4e6c-ecc3-08da8cbb24bf
X-MS-TrafficTypeDiagnostic: CH2PR10MB4391:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yof7p22Z10itslyYGlFxW46bpj+p96N/LzxLTBOdQ+Ssfb2w/9jl6PFyCpLwDlnYIP6M5am7tAHuA8OeGtC5gz9Qn17B2sC4cLwIS5O+lOvk/jp5rZZYKsoSLw3zb6cvEXqTWHOgI3jorN+cuTRjWXy1ONbPalhAUrXwY1XJYgwPm87sd85mQEdJ7gKowkL5DAl+S7iknjC+G1BMVg4BLxX+ZpJLbZAwCP+A04kWvUMtocrILfzTVU/htAR+RbCM/faFMUa6Kdtyf+u6ETgNkf+pJODMR9KBCe1BNbkAnR4wzD2Qs7NCn4N0M0v8nbyEriD4aZrAGM4xW187mHNT9BZukA3MePPjlhn9bkEimqqeD5huhO1+XhT3ZU/bEXsG4ic+tYDj8OHQ86HkAcjhI5Qjv3Ka2OtWp9Q2dqOR0zcJPU1Q6VNMbAV+ZGq9VZyn06RkKjl+PgyA9HxKpZRp7qf9hlkGVJmQG7t/UWil00YFOgNkiqY8BuCA/fhM9WoIDn2bhf2vkHvMzEatFv8WyAAq8T3AEtxcuv5eUjsiHqkpDr/oeR2jzKIK9o+OqOrz4aYCopRLVMH1oznNK0+Reh7EosFoay2rRc6/+6cY0Qb+vBfKQ8J9ntozwONLp7vtVb2yS2yo43x88F63YIe8S6CF6SPl6Psi2lkSGZRbYduaM60EqmT33Xu/V7cTn6VgTwSie1bKLz66IKDgB16ytzSDeNMyl3x1KjRNIZNDXuCGG27TPUKp/f8fK0m7UxYfm8l3gRF14JbaO5JSRv1ihKEMHNR1tyFreaMCUwoEXYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(346002)(376002)(39860400002)(41300700001)(8936002)(316002)(5660300002)(66476007)(8676002)(66556008)(6486002)(4326008)(83380400001)(2616005)(2906002)(6512007)(31696002)(86362001)(66946007)(478600001)(6506007)(44832011)(186003)(38100700002)(53546011)(36756003)(6916009)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWw1UGNXUjFReVBJNUQwTWYwQUxadTNtWUgzRjZ0dWY2UitkdmhDUlo0ME45?=
 =?utf-8?B?enNPRitWamRLYnZrV2FtQXgvSjFKNnJnSVFkVHlOTnhCNzZxNHAxcjl1eFlG?=
 =?utf-8?B?V1pGMnRPRmpNU1dsNStnNGhqVll1K2dOUEhodmtWTldwRjNUYW9GQ1ZuMDNG?=
 =?utf-8?B?K1k5eDYzS3JtUlkveUVXa3pna3dFcE43ZjhBNFV2WnhHek5RT0ZxSFdSZTh2?=
 =?utf-8?B?MWdnNW1PU0ZqdXMwcDVZbmtUVW1lL3BTeHJjQXc3RHVTSEVhejNJL0tIZzg0?=
 =?utf-8?B?aXFLQk9VbTRva1FVaGt4NjI4RzBiUlhBZDFmR2tabHFmNndIZkYwK2R5d20v?=
 =?utf-8?B?eUdhZXMyRHhXKzdIRENadEdRRDlycnEyQkZWMU9BT0FUV2tnWVBKbXB5QWwx?=
 =?utf-8?B?eHNqRGNxWnNXZU9qZ2pDL05RbXM3Uk91UXBPaVd2Y21hb1NJcUluVWs5SGtE?=
 =?utf-8?B?UUxnS0JEc0dtQkQvNHdmVXBlUVdtbExocUpMbTN3VTZOUGZwV2RibUQrNzEz?=
 =?utf-8?B?VHVwY2kyQ2RDYnhWY2g2bTNra1JHS1VVbnNkbThpdDRKTU5qT1JDa3BxaTZZ?=
 =?utf-8?B?Q3F0L1pQTDc2SmRYQW5hR0ViTzY1ZWVOd3RORm5sckxpMGF1R085Z3ErUnNl?=
 =?utf-8?B?ZXlsdEo4dEIvdHV5emhxTkJRN0cvaVNiMXZQZW15NUNLUFduMEgxVGRUeXA0?=
 =?utf-8?B?cm1zTVdFVSt5NGoyWUpSZzl2cm0rWFVwK3g3VjdsaENyVnJ0ZktjOEpsSEcz?=
 =?utf-8?B?YW9salJYUXVTRjBTYTE2TVNHYWZzNmczSWdFZE0vMStZY0Y2OFgwSjFzdkR5?=
 =?utf-8?B?aFRIWmJXNDhtWWhJRnZSa1VZL0N0VG94clZBTHVwNDg0RUd1dUx0aUxDSnVF?=
 =?utf-8?B?ekxaWi9HZEtaQUxONzJac3NJd3hidnYzc01MVm1pbENuaU1Pbm1OSURWV2l3?=
 =?utf-8?B?Z0dhTzdHcmFnK0tFYUtrQWJjOWZVNEhwTUtXaVVRaHRraTRaNXBESFYrUnFv?=
 =?utf-8?B?U1JIeWtlVUFGc0Z6eGhxbkVHOWNaUTNFWDBjeXBDNWJBc3FWQ290WGl4ZVNw?=
 =?utf-8?B?b0FEUzlLMjBxNU9hV2VYcEIrRWJmTWVMZXdOV0FpMWxjRHpST3BDT3FoNWxo?=
 =?utf-8?B?UitBUE9XR1dFOCtMNitvQzczY2l3Nmoyb2o3MktzbS83ZHNNSlVEdmVUZUli?=
 =?utf-8?B?U1dMcGVKL25OTUtnV1UyVnIrRGhiZmViTjRHTVBsVmFHdmlQNUc5K0dQamUy?=
 =?utf-8?B?UWNqWUQ4bjdOYWRGaThmbjBxSmFsN01qTnVCYTREdE5hTlhFaTBFTDhLaVZY?=
 =?utf-8?B?TVVmaDVxMElMMkdwYXo5S3pMWnNGTzdBOVM5WllNWnJCcFkxU1laRVlJd1FO?=
 =?utf-8?B?TjdFakxNMitPdksrVFlFdEYwSkt2Y1FiVEFWNGI2Q3l6T3c1aytKYUhFY2VR?=
 =?utf-8?B?STlTWmVqU1A1TDVOTG0vck1vb2liTytQaDY1ZHVPYU82TC9uZW5GR1dqZXJs?=
 =?utf-8?B?eWpCRlRJWHpHbThwaVpZY0ZTWDBFSHpMdVhya3lySnVQMk1aU2hVSzlJQU5Q?=
 =?utf-8?B?R3p1aUtOVXVHL09KNDEvRXVQTE9mbVhtVUxPY2loejltQjdRUzQ0N2JPZ2xI?=
 =?utf-8?B?aVduVGRaYU5tcnlxNmtCb2hNN2JMQ05CRlZ5Z2ZKSXJZRFZiTll1blFLcW10?=
 =?utf-8?B?emZCYTQ2aS9aa2JrTWMzdktRSFZ5eHFhM1ZNS2RyUVV0UVZDSzJaTHc3Z2la?=
 =?utf-8?B?MWJmVG1DaWtncEpQaHBpdWo4eEZhcVVLRXFzQitOZHM0UGJOQ05lRmhrRzhL?=
 =?utf-8?B?OE5QcDB4aGpzNTBtakNHOEJvenJLTWpIbFJRSVQ5UlcrNmxHMTlaVGJQY1k4?=
 =?utf-8?B?UW9NelNYRTd0eFFlcFRKbVlwa0tUNlZRRFM2bHF3K2Q2TWxRR29yTjQ1NklO?=
 =?utf-8?B?NXVkTkM5c2V2RUt4OVlsUExkV3lud1R3SWtTM2VjVGRPNFZBcjl5dkNJNk9l?=
 =?utf-8?B?UDB5YzhUQXlaKzhXbzZuM1RyWHFJd0QvbUcrbnF5N0dmRHVDdHNNdmo4cEVl?=
 =?utf-8?B?K20zS1lzV3ZmMFpxZ3FaOEd4NmVTNTBKYzZBQVdVK201czlOZGFXS0c3UFAz?=
 =?utf-8?B?Q0o3VmFySWw1ZzR0bWJwUlNIckNBM0lMVHVxL1pJQy9GRmtmRmtwWWtmblB3?=
 =?utf-8?Q?q/zAwn0U9hlkQCCAbSiMgwo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9ce722-579c-4e6c-ecc3-08da8cbb24bf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:14:23.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkZL66PrOGMDB7pB4XUKVR/aNonKwpg/gHvAo+bf8YWbgI+d3xbQVmv8i5CS3EX7FtewxqLW5/nHJPUbu8nL+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4391
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209020038
X-Proofpoint-GUID: MCq2ecB718i-jGWZMGcgayTApiGKVVeF
X-Proofpoint-ORIG-GUID: MCq2ecB718i-jGWZMGcgayTApiGKVVeF
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Hi Markus,

On 8/31/22 11:47 PM, Markus Armbruster wrote:
> Dongli Zhang <dongli.zhang@oracle.com> writes:
> 
>> Hi Markus,
>>
>> On 8/30/22 4:04 AM, Markus Armbruster wrote:
>>> Dongli Zhang <dongli.zhang@oracle.com> writes:
>>>
>>>> The below is printed when printing help information in qemu-system-x86_64
>>>> command line, and when CONFIG_TRACE_LOG is enabled:
>>>>
>>>> $ qemu-system-x86_64 -d help
>>>> ... ...
>>>> trace:PATTERN   enable trace events
>>>>
>>>> Use "-d trace:help" to get a list of trace events.
>>>>
>>>> However, they are not printed in hmp "help log" command.
>>>
>>> This leaves me guessing what exactly the patch tries to do.
>>
>> I will clarify in the commit message.
>>
>>>
>>>> Cc: Joe Jin <joe.jin@oracle.com>
>>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>>> ---
>>>> Changed since v1:
>>>> - change format for "none" as well.
>>>>
>>>>  monitor/hmp.c | 9 +++++++--
>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/monitor/hmp.c b/monitor/hmp.c
>>>> index 15ca047..467fc84 100644
>>>> --- a/monitor/hmp.c
>>>> +++ b/monitor/hmp.c
>>>> @@ -285,10 +285,15 @@ void help_cmd(Monitor *mon, const char *name)
>>>>          if (!strcmp(name, "log")) {
>>>>              const QEMULogItem *item;
>>>>              monitor_printf(mon, "Log items (comma separated):\n");
>>>> -            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
>>>> +            monitor_printf(mon, "%-15s %s\n", "none", "remove all logs");
>>>>              for (item = qemu_log_items; item->mask != 0; item++) {
>>>> -                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
>>>> +                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
>>>>              }
>>>> +#ifdef CONFIG_TRACE_LOG
>>>> +            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
>>>> +            monitor_printf(mon, "\nUse \"info trace-events\" to get a list of "
>>>> +                                "trace events.\n\n");
>>>
>>> Aha: it fixes help to show "log trace:PATTERN".  Was that forgotten in
>>> Paolo's commit c84ea00dc2 'log: add "-d trace:PATTERN"'?
>>
>> I will add the Fixes tag.
>>
>>>
>>> "info trace-events", hmmm... it shows trace events and their state.
>>> "log trace:help" also lists them, less their state, and in opposite
>>> order.  Why do we need both?
> 
> I guess we have both because we want an HMP command to show the state of
> trace events ("info trace-events"), and we want "-d trace" to provide
> help.
> 
> The latter also lets HMP command "log trace" help, which feels less
> important to me, since "info trace-events" exists and is easier to find
> and significantly more usable than "log trace:help": it can filter its
> output, and unfiltered output is too long to be useful without something
> like grep.
> 
> Could the two share more code?

Thank you very much for the suggestion. I will try if they can share the code.

> 
> Hmm, there seems to be something wrong with "log trace:help": I see
> truncated output.  Moreover, output goes to stdout instead of the
> monitor.  That's wrong.  Any help you can also emit from the monitor
> should be printed with qemu_printf().

Currently the "log trace:help" prints via fprintf() to stdout. I will fix this.

169 void trace_list_events(FILE *f)
170 {
171     TraceEventIter iter;
172     TraceEvent *ev;
173     trace_event_iter_init_all(&iter);
174     while ((ev = trace_event_iter_next(&iter)) != NULL) {
175         fprintf(f, "%s\n", trace_event_get_name(ev));
176     }
177 #ifdef CONFIG_TRACE_DTRACE
178     fprintf(f, "This list of names of trace points may be incomplete "
179                "when using the DTrace/SystemTap backends.\n"
180                "Run 'qemu-trace-stap list %s' to print the full list.\n",
181             g_get_prgname());
182 #endif
183 }

> 
>> I will print "log trace:help" in the help output.
>>
>>> What about showing them in alphabetical order?
>>
>> The order is following how they are defined in the qemu_log_items[] array. To
>> re-order them in the array may introduce more conflicts when backporting a
>> util/log patch to QEMU old version.
>>
>> Please let me know if you prefer to re-order. Otherwise, I prefer to avoid that.
> 
> I'm talking about the output of "log trace:help", not the output of "log
> help".

The order is guaranteed by each trace group. To re-order may require some works
with scripts/tracetool when the events from each group/folder are united. I will
have a confirm.

Thank you very much for suggestions!

Dongli Zhang


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15839478054
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 00:12:59 +0100 (CET)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxzvl-0005vG-KS
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 18:12:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mxzto-0005Ci-OP
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 18:10:56 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mxztm-0000Wd-5C
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 18:10:56 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGLE6Ed012926; 
 Thu, 16 Dec 2021 23:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=qc8Fih5B9BKijDx4Ybaj+cRli/fkhFIvqax2EJFBvms=;
 b=GAhucZhEAAthMPePqQq7cVqPUaRguunHTDPbyyTkaLs3h71b6DnQBE6RA1DSZwK3GklU
 QXa8WLf3A35wg7IGAK0iAHplMb6zcFAmKUI416KHVdTHrAj7Cu3BcPBfIOKkqtunWmaZ
 aKgSOenDMZLR+oFqyjXING59cBGl5UJmBdy0+hjz4yX5EmNl5DYHVPB/1v0PTZGIa7en
 2UtcHj2kEHVebo2esssNYG/Ll8x6ZMrcnYWbExT2Uw8zlZhqwgjUPKTsH56+ep7Y0BAv
 0wQ5Fo4/0wjd08pCEykjPnG9IlwRbKeCZdoAGiBJgxN6SdqAR2IH0tfmT3IbhDWEPSyV wg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknrm7fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 23:10:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BGNAEs6088157;
 Thu, 16 Dec 2021 23:10:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by aserp3030.oracle.com with ESMTP id 3cyjuam2j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 23:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VavslQ9puU0HDWmGj/VgkSXP9wNgipKobfxW5/GcKkb8aFrtZD/lqTyfJ2ePP5hW1ro10ZkLqc4z7u8+Ir24c/Q/43EfI+NTP1LzIRg6Db9QA04AliqAjmda/HhSs0wOYanBPWyG+S42Fil2dz4Aj9Y5RNufWgX1GkYmBXDlpN2/4U3/RyN8cCu53BnTyMlMOu8oVMHT4cuh9mFf7GQY7Md6UHc8uWkOxptwhwcE6SbeCcJeHALRMEiNOKqA/8uHcmwlNn2/AId3YjHkv/gb/S1HhHGHetdLCCQKfmnJV5UWY4B2xsYU/fh/gFF/l3klVW3sKXBopHOW+3YKaxCM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc8Fih5B9BKijDx4Ybaj+cRli/fkhFIvqax2EJFBvms=;
 b=ffRRQAVe4tByClk8p78qv7dN5nH7kb09HAtTDVanW0Mg2BtzBaT0SXWfgzmEDqWjW8/PdEIvXeH+JCyAQRvT0RsNLQnupmzZn8ASxQ+5DqTOxaEIG+KtGpec2XzVyox64huuVcMkZRqK84FsxdaRebIjKyO2VMOOXouI9nqpLKeoo7tFC8L7azjnUI1R/efQ+xnQEXggpy4RdbsC3+NPSDvmlgQ3sZ5zPdzp9wrx7GlLXl+u9bZUpESsEUk7fHwILzx+4zTg7qlKMCwOVj7K+4Fe+MGdiMwgw1RXDfI2D6QmfAtYPuaSZAayjYA9PoCETOucCE+/aAh71Jd7G9DFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc8Fih5B9BKijDx4Ybaj+cRli/fkhFIvqax2EJFBvms=;
 b=oXsIluAdPyBCRLSPHYO+gGUBRP2l6S1mb15uX+OpwXOM0k07i77FUiV71EIWHrATeAWYdFEh9QVSDGcBqrDcNSrFZWJuSSF3qC1BBrQHkE+3AWVDw2AUm0X7GiLCmTpOMTrER/BoplegnBFL1FXeE8lGTXQzDWQkctwyRsTh2AQ=
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM6PR10MB4297.namprd10.prod.outlook.com (2603:10b6:5:210::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Thu, 16 Dec 2021 23:10:43 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::99f0:c772:4eda:d1e8]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::99f0:c772:4eda:d1e8%6]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 23:10:43 +0000
Message-ID: <22554a74-3ac4-cce5-e082-d961ee922a1e@oracle.com>
Date: Thu, 16 Dec 2021 18:10:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] pcie: Do not set power state for some hot-plugged
 devices
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20211214215312.944-1-annie.li@oracle.com>
 <20211215060513.kugy3y32nj2te7ui@sirius.home.kraxel.org>
 <1f85fe9e-0753-c35a-668d-3b6779bc703b@oracle.com>
 <20211216061128.vtap3lunpuye36il@sirius.home.kraxel.org>
From: "Annie.li" <annie.li@oracle.com>
In-Reply-To: <20211216061128.vtap3lunpuye36il@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:806:130::8) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 445dd9d4-3475-4fae-7152-08d9c0e948f8
X-MS-TrafficTypeDiagnostic: DM6PR10MB4297:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB429738AD09C8F0EA53C6F09CE5779@DM6PR10MB4297.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oi1MzS8FciYvApvEJhCjlrf2DJM0FzpXV9RGk3ANVuYyk3XQOC3n+UAir2Xy97cASlutcuCCAkm9xc89Efs23LyrD+LrwlBFkvgXSAxeiBpzfHTX0BcUJUIChN2ZTIdyKo6ajnfGbnO/Viau/QiBPnDxPKfe8NEJ87o7JazJy7hMZ/oeicd8lW+p6JhQjZ9f0VbmUj/VsFMnxqtQA3zlfFZn7kawzj2YJbcAW0LycEkCsA2oex/rmbLofJqeYYKSn3ZHDR6MUt5GA+JC7pc1CnrPxYf3NUw4Nh+64MNiZSivmrl/QNUq2VyaD1pAMUNYiHTWZE+3aH2fSXhOobQ5ukgxHN5XV0Bwb/LV0vRnO+go3WP8JTLhAkKQQJfBIG1j1DpbjA0xd0EaWyivtknUVxwsUlrNLIsaWqqi3TVF8MuyxjVPrhCKKuS03J+M8jeas9O2s4yJTOAphwo+Cgomduvi3F/Bd07fqkepLIZHkgIUh+TtpQPWEiTJ/KHxXg3kJE87/iWz73PyzBJv1nVWRafPjVBHvyO52pnDJG7QQUup4pQ6n95XkXen5IXkLvTXS7ripuw93L+/EFipB8IJprVgLGwQz/CwQha++dXygQ0e55PaajMoPHQItDSVkrUXT6y9lIUIPkerV88C5r9mJA5GRGBwoYgLAketE778rMGIe31E5v411Y8bPh3W+jpOxqjpfi8YejA/jEeMaNWzzsKryGf1hhU961eqs6aoRo0V/6tT5m+xWxPdIOvy0isK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(31686004)(6506007)(6916009)(86362001)(66946007)(5660300002)(2906002)(2616005)(4326008)(53546011)(186003)(6512007)(6486002)(31696002)(38100700002)(316002)(66476007)(8936002)(66556008)(36756003)(8676002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly95KzhIcTBkM3VyelhoWU1YZnV0SzRsemt5NXB6Z1NocWdnUWdDQmZPbEZL?=
 =?utf-8?B?b3JCVXNqMmZ5RWZkYXoyRS9KRGlzNG54Ri9mcElZeFliRHNqSUxOYXlzMWpD?=
 =?utf-8?B?VVJXdzFLRnFaMGp0OG1zbTZnWXd2VWc5RytNUUt3TFArbGw1TFpXYmpoMExC?=
 =?utf-8?B?WTZzbWtoS3I4T1dxaUlFZHUvZWJGMW1najRjV2pYNmtCWURQS2t6Z05KV1ZJ?=
 =?utf-8?B?WGt4WTRhSGVXanJLNE9FbjI2Q3hZUkJTQ3BZNjBLRDVrb1ZYYi9uZUtlZ09B?=
 =?utf-8?B?eDdISERtZ2VCUVE5cmhpUUw5ZllaY0JLZEQyNlZHaVc5S3F0N3NvenFxY2s5?=
 =?utf-8?B?TXN3Q0plT2tXdGsyTWZKcVZzbHhsNXRNaVJ1V0RER2R4b2JCYWduSnFCUUdi?=
 =?utf-8?B?a1plb2RYbmt2WmdxdFJWVXhTSGhDRGg4Y0plUHg0SU0vUFdHTFRyRUxreW1j?=
 =?utf-8?B?eFFCbkwydW4zNXdLVGpnTkVvZXArUTVjMEl3TjczWnBBOTM0WmxYdTBSZzl2?=
 =?utf-8?B?QkY1dWZLaTJLYzNySVYrVFhiMUdmKyttcmc0MVpObDdwRWFUT1ZYYVBtNkww?=
 =?utf-8?B?OWloY1lkaWY3MmYyL2V1MG1SS1RiTjJ2MnR6K094TEl3NENkY1NZbzJwcWtQ?=
 =?utf-8?B?UWhtdE9yQTNqazBTMVlLaDUvOHA2RmFncnBmem1xcmloeEcwdGl3VUtvVW9E?=
 =?utf-8?B?amRMRlZnUlVvMllQbDZYSzlBOXc2Zk1sTGt5KzlpTEFja2x3WitSVEVYK1pa?=
 =?utf-8?B?QXNKWlQ0eW1JTUFhcW1TdVRaYk40aUo2YmNNb1VnUGd3UGFOdDZ4UmtLZzFR?=
 =?utf-8?B?L3QxYUhoYlpFdVU2ZUJuM3FzZll6eVhwSjl4aFIrVllsYkVjNk1UVzhYR1lk?=
 =?utf-8?B?WVdaSEg0NGFtdnNwSEZwQlpNZHYyZEpSZXVybm5uaUVxUktoTU4ycVdiSGNx?=
 =?utf-8?B?Y2lVV0FlcmptUUlTc08yTTlkdTBDTUpMZzNIZkRkY2l5MnJyamNsV2s4aXBX?=
 =?utf-8?B?UEIwMGdaYlRaVVhWYkFWeHcwSkVXZGpSMHBZbzJWYXgwN3RLY0tZdDRHOVVY?=
 =?utf-8?B?QkppRkg2Qk80Uk5mM2gva091QnFzVU1EMGlKcTB0QWRjN09hSFNPNXlJWTFR?=
 =?utf-8?B?L1hxREx3Q0IzQ2hGS0I3c0FwVE8zc2o0L1BHZGlCcWd0bUNOaDJqbmZlR1hQ?=
 =?utf-8?B?cC9hWisyRm5HcUlGaCtFQitvT1J6L2FiWTAxcVR5R1lNWHJSRGlZeVliVUla?=
 =?utf-8?B?NEFoazQ2MXlHdENYdWxiVW41dFh4ZzhieTh5VWtveU9sVlovaW4rd0F5WDl2?=
 =?utf-8?B?YzhvV3JFbVhzeHFHSU13aW5TTkdEMUxJN3pCQ2haK3RaQmhTL0RlVk94Yjc3?=
 =?utf-8?B?bGRGdnE4WmU0Wjl5NzMyN1QvZ1JkVWNURGt3anVxbFFMOVhBdm5LclBhSk54?=
 =?utf-8?B?K3RqK2RHR3NkSkdZS2Y5L2F3Q05kazVoUlRrSkJ4UDRPUWhISzBwM2tlTnRD?=
 =?utf-8?B?d2MxUzFpOWhIbk03YVg5ME9BV045Q3p3VExDK0ZxbDVRM0hwTWt4aVZUWnpZ?=
 =?utf-8?B?eUwzMmlaT3FnczNkNFp3Vy9GaEVqbVBFVElPTGhxY3lFWDZsYVVZS3Z6c29B?=
 =?utf-8?B?U01oL1p0MW1sRngzVlNweER1T0V4SUoyTmtzUTRRak1YQ1FtZ2NmVURBS3BE?=
 =?utf-8?B?TEkwL3R0SFpPMXhnZ3R1NSttalNXdnQzZHd3d1cwQllUT0FHNEs0MGlibUlM?=
 =?utf-8?B?YkZPcWpnbXpiU1F2Z3Zuc2VZRHNaM25sMnpUeDQvZGdSSjV1M0xSK0JSR2Ns?=
 =?utf-8?B?RS9XaFJpMlFZaGI2SG9aNzdKd3FNZ2hIUWNhMDRSMGxKa1lpMThyT3FrTSt5?=
 =?utf-8?B?V1dPQng2SHJlVFcvb2pCdW5wVzdnOGRMdkI5eU9wL3JWMnhoZWxVNHE1Tm1T?=
 =?utf-8?B?d2xXVkt6TWRkYVVTT3ltN2ZFY1RyQzk0RVNBakxoT0tBZldueWNEbjRiNEYr?=
 =?utf-8?B?Qkc2c1F1ZUhCTVlzVGdLU1JRM2M1ZktiMm11Y2MvMDdpY1JCMnZ2QVJHanI5?=
 =?utf-8?B?RGVIOTczQ1ZMY3VRSStFUm1USlBqMXNYWHd2MEg5a1QwT0U2MWYyRXZxNmhE?=
 =?utf-8?B?SHFlVkRqdmpjMGMrYzgzVDJObkdUWVJBQTdOUUptL0VnRzNRblUxUlJlaWN5?=
 =?utf-8?Q?xCLNAvoXUfULVOyZIiaiVw4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445dd9d4-3475-4fae-7152-08d9c0e948f8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 23:10:43.5352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wbb+0RVibGEHUmrEb2lz/jTjAI/G9YQAttgHvhlS25HVuSLyoapR2NJeu8RM7rIgTE+VSFWxlOFWjcrEntmrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4297
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160121
X-Proofpoint-ORIG-GUID: bCisR1HWrDOtPrfE4M2Vb_r8NY5TOZhl
X-Proofpoint-GUID: bCisR1HWrDOtPrfE4M2Vb_r8NY5TOZhl
Received-SPF: pass client-ip=205.220.165.32; envelope-from=annie.li@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.034,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Gerd,

On 12/16/2021 1:11 AM, Gerd Hoffmann wrote:
>    Hi,
>
>>> Maybe we should just not set DeviceState->hotplugged = true for devices
>>> added in VM_STATE_PRELAUNCH?  It's not actual hotplug (i.e. device added
>>> while the system is running) after all ...
>> Simply not setting "DeviceState->hotplugged" doesn't work. Devices created
>> in
>> PHASE_MACHINE_READY phase are treated as hot-plugged devices. So I just
>> tried
>> following change for the quick test, the device is still invisible to the
>> firmware with
>> this change.
> Looking again, the difference is probably the reset handling.
> pcie_cap_slot_reset() will turn on power (via PCI_EXP_SLTCTL_PCC) in
> case some device is plugged into the slot.
If the VM is booting from the system disk in the qemu command line(no 
hot-plug),
pcie_cap_slot_reset turns on the power for this device. And this happens 
before
the VM runs into VM_STATE_PRELAUNCH state.(I add '-S' option in this case
for comparison)
>
> So I suspect when plugging devices during VM_STATE_PRELAUNCH they are
> resetted individually (specifically before the device is plugged),
When the device is hot-plugged in VM_STATE_PRELAUNCH state, there is no
reset for the device during this state. Before entering this state,
pcie_cap_slot_reset  does get called for the device(like general VM 
booting).
However, it doesn't turn on the power. I think this is due to that the 
device isn't
hot-plugged yet, and "populated" value is false.
> whereas otherwise they are resetted when all devices are plugged in.
>
> Does resetting devices when leaving RUN_STATE_PRELAUNCH fix this?
I suppose only calling pcie_cap_slot_reset  isn't sufficient? maybe 
rp_reset?
However, the place of state transition is in runstate_set. I don't know
hot to hook this function to trigger the reset yet.
Just thinking of the implementation, if the patch is deployed in this way,
isn't the change is more complicated than the current one? :) Maybe I've
missed something here.

Thanks
Annie
>
> take care,
>    Gerd
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EFC6050C7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 21:52:16 +0200 (CEST)
Received: from localhost ([::1]:59798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olF6s-0001bI-Jo
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 15:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1olF1C-0006E2-2n; Wed, 19 Oct 2022 15:46:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1olF18-0004pn-3s; Wed, 19 Oct 2022 15:46:21 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JIOVXe020656;
 Wed, 19 Oct 2022 19:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=s+ah6N1z6GgcsPlutXhdb4jl+WBhiP0ENn09uqmGQLw=;
 b=v2JFV0fvB8qXLj51Bp6lKGiOVjK+bI0Lx+DrQ09tR3tj15A+QG5XUlGFVW7RxcbqHHO+
 QDiR3LK5ND7b2TUST5zNPSH0q721y6d09fFdi9d4E0taFwkLFDdkZLkLCUxT4vTFBfmF
 ijKpOcog07+91rdqSuGed3thP6DgFijAC5jii4JOFG9cl/CtW0Z/IZkPdWUT9bENKMCj
 mWDJTXqdDOmcwqKdODWLDaXpmPBLVZDEdUCmtBukG1Nq7MJdTiLRHyhLw9JOWM5ekZM9
 L29f+bn/j66ma1TYuO0r7H4IL6Jk3czelGs+YL/M9pgy++yU8P0fDLJ56R1y416uYkXC 8Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k99ntfah0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 19:45:53 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29JHo5Z9017060; Wed, 19 Oct 2022 19:45:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k8hu833uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 19:45:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMQcRP4tCiMq+YgT/bC/9vlgEzLbnXg+5tk915gMunHoKIJBDzAYYS3XxJXRJqb6l8JZFptk01/bRJwoGnvvB2HB7aey2pXkBXjxvEFdTrSev3XiRBS0UXppHC+zyHQGrIUCsfnol7izki6e7GXK19/q0evre3mncChMgwdYBofoopBeiUwJBTEl/J2i/JQdTQ9W0Z0a2po9a9bnqTugqvwePU5cF9nctdWbIOjNw2FoGQ10wNU0uQjT/ObTIitvOLiapLubU90zy4yxpls3gjG5fr3ZNB7IDEjiTNOrWohJ3GHoVcrI7+7DYLdwGv2FuZEw4KSZbZZHCv+/rG5ZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+ah6N1z6GgcsPlutXhdb4jl+WBhiP0ENn09uqmGQLw=;
 b=c3J7d/DVl5hcFWUgc9LIwIrFNpKhLWrveKaWJpGMAK3M0SXDGcQLw97vVhd2sTD2e/Ylni3x9u9EAknHbpYka5cmSINTGBIZBjyexRv08QAiqvFdXGpweSfahj6IGLjGWMMYzdxIsTuDB6CHsOVZ3uP/tj73iUujAnwIcpSn/jwfyyVhTZwdooeJY45tetBNWg/Uc37iM1iKdjQjalqoiJuJaScpY8rnEslRTboLoo/7EioCbSW/wXWxiMvcQjvnI4RV4bB3We+6rFxokYIJATJ+BLUADlUcMMvRPtfdariXGOgCojhrIZ+3zI15XqnkHfcD3009bBtg896LjnuzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+ah6N1z6GgcsPlutXhdb4jl+WBhiP0ENn09uqmGQLw=;
 b=mrV5NiB2WHGVmNo1wqOCmCfMbC+JtJQJwyyDm+bnLvDxvA5dYTBLlrHgqok9trQWmAgFBYJNzBXeMq5VDrntzPRdJkLzkys3+/h2xbgfhmQ0eWLSH46FV6m6mCxUj2jRbV5Dy9v0YRyyamb54k6vCKyslaUlh2OmzaOWsGrJua8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by IA0PR10MB6748.namprd10.prod.outlook.com (2603:10b6:208:43c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 19:45:49 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7%9]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 19:45:47 +0000
Message-ID: <11e4716a-d92d-b46a-c496-ca1fb9258682@oracle.com>
Date: Wed, 19 Oct 2022 14:45:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Christian A. Ehrhardt" <lk@c--e.de>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <20221019191522.1004804-1-lk@c--e.de>
 <e2c7ca79-6730-e9e6-770d-e1513026a294@linaro.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <e2c7ca79-6730-e9e6-770d-e1513026a294@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0050.namprd07.prod.outlook.com
 (2603:10b6:5:74::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|IA0PR10MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f8cd1f-b08c-4c28-5dbb-08dab20a847b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jQc5Eumt8t90WNmceQYkQdqMoninrs96trLxrvEaDtolVY13YUk2h0k8hIwOEtvT4bOZxaozocjLOrGvGUPemACqQqZ1rjD8nh4Aq2lk33NJUjg9qMwP2gv2/cvEvIiX5W+4Rs4+plufMWDefeeeU+cH/H18JT1HgX2PHTMOVXuSRSEgjSXySOJBNqXwv/WLxSPZmMIDROn5qcLo8XPpnxWw2UgYCoONY893vKGSvfzVMOGH0Is50sTDSFnTCDp7v+cXW4fIeIHEV12x7le02hIIX00Z3uyZbiHqJ8ceVFRRxX/3rp52RAfTucNb+vucQ8ENTQnMAT4Rlbx3woiASgRfhkBarXN/od3J21UITGlEGy9+S0+ox9azcOIpt2heDXFMSK7O3qnkYksgbwg6C4r0LMkGG+TactejB1SUo4Ib2HkkQW2JnDOvSN59ux5khDYNARduKKDGHx4ZyPTbCeikhotK0lTQwthZBZzwxCnA67BWuKkD0O2mut8GFEDNiuky3KuAV4WDtx22qWqh36sb1erL4QY3KtzElzIEzY+Diehp12WhbSGHFLb01Y/OUIPqnk/o1eEv7NxssxtEYiJFYxWRufv8UeDFcoZdwugB0f7SUYhO02IJROaGhShK5hUfgEkWmcw1ZUHYumtEV0pTqyhspZ+57oyR/raAEozfDfyYbbesvaeMjROCYBKNkh8lJuXHWaW0yTyYBXuSk2/QZZvdfR+TtDgv/gaFm0tbndaVRX26LXWIn3t9mT2te3Jpr2zNnYNRBELEFQtSw7BiV5qi9VhweTFT7Rkql0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199015)(31686004)(6506007)(2906002)(36756003)(5660300002)(8936002)(53546011)(86362001)(31696002)(4326008)(6512007)(41300700001)(186003)(478600001)(2616005)(6666004)(66946007)(8676002)(6486002)(83380400001)(66476007)(66556008)(38100700002)(54906003)(316002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzU3U1dBTlYwTm11NUZENWlMYVZpRnhOWHgzK0t2am1qSXJjRmRMOEFxUFla?=
 =?utf-8?B?dno1Q2lWTjJOSlNYRURwV1hNWTNLb3VGYkthN1VtajlsekNTVVV5SHY4R29w?=
 =?utf-8?B?NndvczNmanhxc2pBT1pJTDAvMmJQNGY0QnhCY2l2ZElyNGF4ZzBUMmdQNCt2?=
 =?utf-8?B?M1VHTkozUWNEMFhORnVTNjAyQ1pCa05JZmNUSHoyaGt0bzJuZzJIZUVoMm56?=
 =?utf-8?B?RFVndXZoYW9mRjBXb2hQSnh2UmF2aXcreEpORWJnc2N4eGF5S05hTmRrT3dj?=
 =?utf-8?B?YXZwOENES2xVUWh0Y1FUSENDK2t5R2hTcWM2NjdRbW5ndXBSUXBEQVdkaWNE?=
 =?utf-8?B?WDF4cEtxU3ZsTmthNzlpWEdRM2ltREMwOGhiMWxyc1VkcWpDODJoeGp3blBl?=
 =?utf-8?B?L3h1dVlYSEMvcHA5ZVdBODNYNjVjWGRaSmxxeithakdTdzlsb0NQNmF0WTcw?=
 =?utf-8?B?NkJ6RHRVYk1KRHFEa3B4V3BmYmQrY2llaCtQT1J6UE9XdGZXNkdBakx5czBr?=
 =?utf-8?B?N1l4NlFaelFCRHREeHFiR3BpRXQxamswUDZVcWFMRFlEdnhPZDVYdjk5ZTNC?=
 =?utf-8?B?cThOb3ZHZ1ZmeWYxRFVmZlRWU0JpN1ZvQnp4ajc1TDRSUExqcXlacnV3TW50?=
 =?utf-8?B?Ujl0N0N3dDlrdHN2VStuYmxpbC9PZm5xakhBRGhvYnhsTWVYUzh5b2k2S28v?=
 =?utf-8?B?TG5uZkgzeXh2RVp0em03UzBzYkMrbmF4dEFyc0Q5WEZZWTdiTmJTQlk5NzVn?=
 =?utf-8?B?dVVUWko4Zlg4NS9CQVdHQVVjMUZNbWhYMVVYSUwvVHVlQWgwNlB2WnFpT0Jp?=
 =?utf-8?B?aUdCYzB2VDdldDJNcHFJM3NBUVNVbUpPdTVqU2JGNlVVbnc1QTRDYVorcVU1?=
 =?utf-8?B?aUk3ZnhmQmR0SXA5dkRNT3pKc1U4ZkxOcTFDY0x6NmY1c0FSaGQ4UGVCWXBL?=
 =?utf-8?B?ODUrODBza3NsaGFwQ1lLQ0ZzT3IweTlJaTVPWkw4UVJLRWNUcnJPc3VJUUxo?=
 =?utf-8?B?Z0VsbFlSWmY2U25RS0V6b2dxNWhUMm1rRnRZUk14dnlodkhIRXhFdmRxWmRB?=
 =?utf-8?B?Tk9jTGg0ZVgwQ3hrUGJrdC9yWE1RSEJEMU1Ib1ZJejRDWENCUFd1bEh2UzM0?=
 =?utf-8?B?NE1ja3dRbFYwQjZEMnlFNGJDSTFMdE5SNklYamRiYTViY3I1bFFhWENZYnpi?=
 =?utf-8?B?U1Y0bDZxd2dKVVhlb25KOGlRbTFmZnhWNDU5OTVKZnI5Y3lyL1hWOFh6K05Z?=
 =?utf-8?B?M0ZyckZtYmh1WDF1azRMZHNCQ3VPZzdaaVhEQWR6VnpBZHBWUFpiVXJMTTRN?=
 =?utf-8?B?SlUyRGxJRC9Uai9VNjh6anRBQlp1RWd3VnJaODRHcWIxcGZiQTNFVmNYclo5?=
 =?utf-8?B?K09SK1NLbkdzRm5BbXJoZTZ1VFpWcW1kMjBvVEpidjdRYXpjbStZRnU3YU15?=
 =?utf-8?B?SnlxNTQ5YWlReFJZNmo1UTU2b0lZZnJZWHg3L0JxSlRwNUtqUFlRSk1GSzNR?=
 =?utf-8?B?S2NQTmc1dVM2L2ZoZFRFbVBZOXdpbEx0MmNsay9XdWlyOUdmeVJRcGhmWW9S?=
 =?utf-8?B?NEkyWGRwTDQvOW8weFE3MmpMdWpnS0hCV0hxYk5LT09DMGRvL0gxb3JvSGpB?=
 =?utf-8?B?aGQ4d0pYbWluZ0hqS2ZJMWtHZFMyUjlnckZDTGpsVGJOZ1MzN0NPT0ptU0xI?=
 =?utf-8?B?UFFha2p0cXBSdzhnWU1WWXY2TW9wNlFYQW90cEV5R1hNK3VaQUo2WG85NkFG?=
 =?utf-8?B?VkhQWit6T2RNTjYwZ01vc1l5Z0RFRWcvRFl0U280V3g1eTYyMTJTUGRwZmN0?=
 =?utf-8?B?TXZYQ0JQUEx1bm02MmZmZG0wS2NoTnlxRVZ4ZzBYSERFbXlFYmJUMSt6VXh1?=
 =?utf-8?B?VnpZRStuRmdlOVFkVkMwREZLM21wODBabFhuSmhlbDc5ZzZOekxLWDU2blkr?=
 =?utf-8?B?UFpCdGl0bmsxR2VMRXBPaityZ1VyV0dGbWRHUlBaOTFlVE9RRU12Qm8vcHJj?=
 =?utf-8?B?UXdrZDhjSzF3YzV2ZGovWHZ0MzZZeUJSekNSR0tYNi9GUnFPQ0szanU5ZDNZ?=
 =?utf-8?B?dDJ3UHNSc3V4OTdEUThGMGxVWEUwQ1F4eEttcTRmSmFoNUx0TTVnckEzV29R?=
 =?utf-8?B?SDh1emhEb2ppbmRzdDh6VDF2K2tWWXhybHgvTFcyYmx6bmIrU3Y2ZXJTSnpj?=
 =?utf-8?Q?SPjJadu9ofzrQ8yB5wDG7Kk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f8cd1f-b08c-4c28-5dbb-08dab20a847b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 19:45:46.9847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9RFBgZb4iFzzh5v7qNhxBunC3hpdcJm2w09FuDqwbQGryr30g88aReMB230xbMZjqR8jR3UADj4xea56VAgID/d4LkQbsuvKLUAIraIC5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6748
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_11,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190110
X-Proofpoint-ORIG-GUID: iRfgg0zwq2ddaXo9WUVxhvFKqM5WNt1P
X-Proofpoint-GUID: iRfgg0zwq2ddaXo9WUVxhvFKqM5WNt1P
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/19/22 14:37, Philippe Mathieu-Daudé wrote:
> On 19/10/22 21:15, Christian A. Ehrhardt wrote:
>> Fix memset argument order: The second argument is
>> the value, the length goes last.
>>
>> Cc: Eric DeVolder <eric.devolder@oracle.com>
>> Cc: qemu-stable@nongnu.org
>> Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
>> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
>> ---
>>   hw/acpi/erst.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index df856b2669..26391f93ca 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>>       if (nvram) {
>>           /* Write the record into the slot */
>>           memcpy(nvram, exchange, record_length);
>> -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
>> +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
> Ouch
Sheesh, I'd hate to be that guy...

Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEAB490BBC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:49:30 +0100 (CET)
Received: from localhost ([::1]:48842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9UG9-0000aD-GO
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:49:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1n9Tlh-0000Bk-OP
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 10:18:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1n9Tlf-0005Lu-4n
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 10:18:01 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HE1Oa2025449; 
 Mon, 17 Jan 2022 15:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=gp0ngbAreemM8SOlqiMDa8gFew1I7aGMj3+kXgkp7zQ=;
 b=KdJd9lD7n99yHGnSiVGQ4gNVVrRrj+mSqlOmByolyjn2rBrJ3uTHXFCoTZEvdZ+TaYMT
 AzcluwxvF9XVEpJp+4RNiW39asIUruAm7QuIGvxNaNaAGIiKdGMKaUWpXLnyBecCfBwP
 xX6VRCd6oQmpA5AvLcV2t+S+Z3kCCir3b9fpHhaoLM5IvFM09ALMPfHnWvsOD1mKhYg9
 31QB/396+SAszpMuPbIn16pkKqt6/2+LFSlf0xj/pCbYM/4sgWhMz+3VkwI9vE/vN1Do
 vXtPemzD0zQHixjHm4ytxc2+K+YEj7vylPDlUPP2tHUHp6GwM3KreB2umbRWAHvA18uN hw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dkn22upg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 15:17:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20HFGpBV118941;
 Mon, 17 Jan 2022 15:17:56 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by aserp3030.oracle.com with ESMTP id 3dkmaartvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 15:17:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0gkvnVrHm21WAXqWOJ842V2PZhjRRzfPqXuLU2kMFiGY6KTaKwEjhO2v4nHQ4+VTjGeq93zp1BEv6GGp+0t+8Cp4Uj6vG//m+a3e2ag78pBt8yzfxYV/gG/cOPGSv0tuQ2Lin5QRVDXZ6VZ+zCn3/rH340TXLsg4e1JobcuM2Ahqx3TW12b8cJe65idM0y7lAvvKUSB0vMsV6czepkX4Rf2qLey85u4inATKdpEROOCur0sc3rpUIsDi78Izxwtq136yWIriCgACsV7G7nD06RsbQ3nvpjb8CJn3peoeSL8TcSKSYh0IvI44i9UnQX9IgjCwaJis06qMXCDC0EmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp0ngbAreemM8SOlqiMDa8gFew1I7aGMj3+kXgkp7zQ=;
 b=TFy5FVMAiI6wJNw0nKMO8ldfOypp76yZwFi1gd35RKPUxbdQltORUG36ozl3HV6MI2dABxMJskG+fZI4L1YiPtb4JrlUqgKMYvp7+dMYTjt9bc2A8HsGFmA2Y1BnxJr3UOYr+w1TP9U0uuX4JzAZN/6NiHNi8USyi41+kmEh2gc2O5czXrh+if1lzgMx6f+Hd55fme0OFnqs/SFQkm9UuoW6k6UfXn7ReaobsOliZ0pC8BWC7EFSPgiUJ1ut5297RNLamRqnLyQsx4jbpPe0hSOwqy11dPGmCAUraotKbWpO6RhjoyWGAuTwuYJYCF6Wc9sI1HzglzlltHvJlmAvAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gp0ngbAreemM8SOlqiMDa8gFew1I7aGMj3+kXgkp7zQ=;
 b=OtQXLjIWL4aWGSMVVpnrtn2qgsxMWiEp//xEtrGc3+1NEhXQ6YwRoQa8kelnyM8i2RExlDUWJv1AX7/quHRxF+Hu42OiQhYA0DcNwu+RG5Pj6LllUN5R71wHBak8e/PVQaoN+hnw5E6L4sPHI35N4hoHtivzr08AtVh7mRp/9ig=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by SA2PR10MB4778.namprd10.prod.outlook.com (2603:10b6:806:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 15:17:54 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0%7]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 15:17:54 +0000
Message-ID: <5b2f4acf-29fb-34fd-eee0-341eec163da7@oracle.com>
Date: Mon, 17 Jan 2022 09:17:52 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com> <Ya+rLex1djU/1Wc1@redhat.com>
 <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:806:27::8) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fbd8d95-a78e-437d-179a-08d9d9cc890b
X-MS-TrafficTypeDiagnostic: SA2PR10MB4778:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB47783D70DF1FCFE1CC77A2AFF9579@SA2PR10MB4778.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hFsDqgSmhL4/VefcsQtWmsh+2UU6zvn0YEBuVXJnX96Cs+f8gV5FSIDf/dw8iiSnKGhNsj/8OKfWaCVZ35ZI10xkm4NAwes1aTUhsR+nLGSAs94U1EDqUehy7jlkHN/oJHrqoES0V2m19/3DGizl49pFNm1WMWQeBhaml9MgvW5BggcHkIBOTWca3jdJVe9+IdOIqLc2nYvB7Uz4txgz3Yc3CxSyh2Ln7B7YeBzxmuhAvIGrC8ErBhu8X6b/jcL94gekGzXHz7/wy+AM8/bDopgmEZKUe3gO9w7/UN+UBN0CTEq6AXqF5NiGUOaauRPKsANZm1haXnP1mBmhvDRfhrfsm1HLr9r+qeWrlHzyI2pYpsydUDCN3uARlbQ6FX7Xp23rNFtvB8m4anYm7+e+nrkX9n4Toupri1khGEdKGluRZ54vRHKUGxnMLncDwspKtLxUE5BHVUCD5KuHrjtF16QRDiCdO6JUaVAoZ0RB7xEUEbRgvMX6HbYlHikN+DY+5SyfmYJKUtoLxBpezC0I/Y5gaPp0x2QCfAEbDB195ftWoA2iNoyNZu0uhmp4Mpb/fGT/ilCmpgIFVq9mQ4QZtN9+YAVl0jxM2/8iLIDbE141hQEK9VhbYA8EIBEGA7wAdx2BAqrRVzG+Hezudr8+dkCPTc5B/FVOEokazhsiDX7FCfk+krTdJiHJACNse6Z6MPtEEQATdLugBS+LsTBS0aQJXDthOLvaiYMGIMtvd08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(66946007)(110136005)(2616005)(8676002)(8936002)(86362001)(316002)(6486002)(66556008)(66476007)(44832011)(31696002)(4326008)(5660300002)(186003)(6506007)(53546011)(26005)(36756003)(2906002)(83380400001)(508600001)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bCt6ZVQrRmZjaXBhandqZzJQRE5ZaC85Tml1a3VtMTg5UTN1UFdKVXJ3RGN3?=
 =?utf-8?B?Ylc0UncrTXc4L2Jud2hzNWttTWltL2hTVW5UYmp4Q3BnQ1E5emZzWGs2ejBs?=
 =?utf-8?B?Y0FZSFA1cDA1VW4zbzJpampWNDRTekRTSmdCaW5kZ3dXNkJuTUwxbHNsMksz?=
 =?utf-8?B?bzJ2aDZ1L3JvNGMwMzF5QlFtWHFTMHh6c2xneVZ5SGJtVkFLN0V4R0FlWnhE?=
 =?utf-8?B?RDJlVGZqai9YOGhmUXV1Z1o5VzdYWWxpQzJRTzJaNHVwRkMxNEtVUnR6Wksy?=
 =?utf-8?B?ckhJTHBCb04xOWRQcnppTWZyNktUeDVSNUtpczVpcTBKL0wybXdNclM3eW15?=
 =?utf-8?B?R1pIc1REVVRWVVdUc0VCb0o0Wk9vaHFycTBacWFlSG50azJabGllOUpoOU1K?=
 =?utf-8?B?a0g3V0VsMmhUOXFPZXBJS3lpWU03WXMwTXpRQmJOTDd4Y3IxVkZGMnh3cXhv?=
 =?utf-8?B?anFreEhsbVlPT3BMM0hSTG1rOHdjMHN3L0FkVm1NWUNSVmlVS05JZTIvN3BP?=
 =?utf-8?B?VmV6Mm5xNlVNZ0tMc1gxZ0poU3RtTENlVW5PZ0dGOWNLeTYzVWRSZTJwTFNl?=
 =?utf-8?B?VUdUSUx3ei8rSTdFblQzTVR3WlMyb2JEU1RpRk9na0RBRm1XNjJ2bldDNzlT?=
 =?utf-8?B?VDNHUThPYTcycThYcUdEeHZvNHV3b3l3dk0vMVBFMDlOL3V6bjFnL3NDZFRz?=
 =?utf-8?B?aWREVERtSnlUTEVEM1U5b2xqZFcrV04xYjJNVUlFa2N3NmRTQUlmSHdmb3NG?=
 =?utf-8?B?K084UUhMdURlME5sY3R0aU9pNGJWWFRwN1pBMDdvdG9tdWNBdDFRYnhleGFU?=
 =?utf-8?B?YW0zdW5OLzlWa2J5Qk80NWtneHBaR01OdzJoWFV3c3pSUmZRLzVtWUx4SVNB?=
 =?utf-8?B?TEJQelY4a2R5TWxlY0xZb2RvSUVxZndUUkpteHpvczNTZW9yVjRIcHhUaXJw?=
 =?utf-8?B?S0d5amJrbUxNN3p4dHEwNlNndHRUYm5oWWUya0NmdUU4YktYeTFoNGNuODI1?=
 =?utf-8?B?SFFlK3dINnhLMmFuZW95cFJHYTdjZFJZRVgvNVNnT0RuR0wvb09YcktzOWFL?=
 =?utf-8?B?U013dzNiYTJuUUhDSVM0YjZ2dDhpblJxZTJBUE1xYm9HdTdRVWQxWUtZUjhv?=
 =?utf-8?B?cEhIY1FaU0I3VzFrQk5qbEEzMktnYi9SSUZweEtQRGZ3MlVzQ1ZhSTR0Y3Bk?=
 =?utf-8?B?Wk50VzVsaWZaMjkrZEhaZUFtc3lHT0NldjFzY1JHaDRKdUFjK3VsR2VTNmhJ?=
 =?utf-8?B?akowWlRyU1JoY0h3NGJ2eTBQTVIxaDN6WElHRWNtcUJWRmkxc2k0YlpzUFBY?=
 =?utf-8?B?TjRuYnppS1FsaXhkeEpudXFiTWhYVU5nZ0p3a3hnN01FZG82MjcwU1p5U2tU?=
 =?utf-8?B?NSt2WXpvcUNqeFdjUHluYzN4aWNES3dCU0dVV2l3MkJjdWdQOXpyL1ZNQVVT?=
 =?utf-8?B?MnhGYnhQQ25UbzR5a2lKYitYMDNYdkNzQ213ejZCTnF5NHE2NVR6TXpHa3RZ?=
 =?utf-8?B?bUZGQ1VFQmN4dlBTUHRqSmdKNm1vOXllVDJqQlZCZ2U3RC82WmVhRFJ1LzJh?=
 =?utf-8?B?a2crWHRoeGk3aERLMjZQTVdiMm9VNU53RmVGZUloN0RoVFZJY0p5OGFzQmRK?=
 =?utf-8?B?TXlZd2dVY1kxZ2l3M2t6bFlQSE1vdTJuTU5yNndGek5WZXI3dmVJVTdmYjJ0?=
 =?utf-8?B?YVJjeVRaVTE0ajNBemY5RjJEZmVoYUNFNXJZZ0Q1dDRKMXJxbHdWMVdqTnJh?=
 =?utf-8?B?U2VYUmtUY1NGTmpTNkpxQ0xuaHNWSys3L05vQmZCVWhkMjAyRnRLZFhLMnJG?=
 =?utf-8?B?Y05pL1lTYXhRV1dvZzM2QmRFNDFEREdEdlhaazI2aVBWejlHd1B1WkdGdTd2?=
 =?utf-8?B?d3NTREJYU0U4WVp6d2FFaFBpY2lidXJFZ0UwUzlpZ3BQQzlncXFaU2lBamwy?=
 =?utf-8?B?TjFsU3ZJUHV2bXlIZXU1Z0orWk4zU0R6V3dZc00wWG8zWEd1U1d1SUZPTTMz?=
 =?utf-8?B?WnMvVXdiTDVyN0tybTZzK2d6cCtaYnVQamFwT3Z6Vy9aZGluZEQ1SFYyWWxw?=
 =?utf-8?B?ODBtMlZTVDZVUlBIK05aUy9QVzlUd1N2RDVrUkZqMGdEcEt2UXdlTFVocnFJ?=
 =?utf-8?B?RVh6L01BYjk0MEdobWFGaEdiNVdEemx5Mm1mT3Rvd0J6OEJRNW9BTXR3cC85?=
 =?utf-8?Q?m7IxFVRp/xnn6TknGSC+PkM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbd8d95-a78e-437d-179a-08d9d9cc890b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 15:17:54.8209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bw8oe9yjm5vupmluwqgKmnTT/8iJ2cRlIYuq/4p4muQQLOaHTDocpmmpsw4oDpovcNXFvBO6E6zBpy5GHgxffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4778
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10229
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201170098
X-Proofpoint-GUID: BqeTj-yTm07gCo9UY_Hx7eRzLz3dHsEz
X-Proofpoint-ORIG-GUID: BqeTj-yTm07gCo9UY_Hx7eRzLz3dHsEz
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/2022 6:05 AM, Paolo Bonzini wrote:
> On 12/7/21 19:42, Daniel P. Berrangé wrote:
>> Now onto the values being reported. AFAICT from the kernel
>> docs, for all the types of data it currently reports
>> (cumulative, instant, peak, none), there is only ever going
>> to be a single value. I assume the ability to report multiple
>> values is future proofing for a later requirement.
>
> Yes, in fact histogram values have since been added.
>
>> Second, for a given named statistic, AFAICT, the data type,
>> unit, base and exponent are all fixed. I don't see a reason
>> for us to be reporting that information every time we call
>> 'query-stats'. Just report the name + value(s).  Apps that
>> want a specific named stat won't care about the dimensions,
>> because they'll already know what the value means.
>
> I agree on this.
>
>> The 'name' and 'type' are used for filtering I presume. Only allowing
>> a single value for each feels pretty inflexible. I'd say we want to
>> allow mutliple requests at a time for efficiency.
>>
>> Bearing in mind my other suggestions above, I'd think we should have
>> something  more like
>>
>>   { 'enum': 'StatsProvider',
>>     'data': ["kvm", "qemu", "tcg", ....],
>>   }
>>
>>   { 'struct': 'StatsRequest',
>>     'data': {
>>        'provider': 'StatsProvider',
>>        // If omitted, report everything for this provider
>>        '*fields': [ 'str' ]
>
> I think provider should be optional as well.  See below.
>
>>     }
>>   }
>>
>>   { 'struct': 'StatsVCPURequest',
>>     'base': 'StatsRequest',
>>     'data': {
>>       // To request subset of vCPUs e.g.
>>       //  "cpu_set": "0-3"
>>       // Could use ['int'] instead if desired
>>       '*cpu_set': str,
>
> Yes, ['int'] is preferrable.
>
>>     },
>>   }
>>
>>   { 'struct': 'StatsFilter',
>>     'data': {
>>       // If omitted means don't report that group of data
>>       '*vcpu': 'StatsVCPURequest',
>>       '*vm': 'StatsRequest',
>>     },
>>   }
>
> I agree except that I think this and StatsResults should be unions, even if it 
> means running multiple query-stats commands. 

IIUC, making StatsResults a union implies the filter is a required argument 
(currently it is optional - omitting it dumps all VM and VCPU stats). Just to 
confirm - we want the filter to be required?

Thanks/regards,
-Mark

> There should also be an enum ['vcpu', 'vm'] that acts as the discriminator for 
> both StatsFilter and StatsResults:
>
>  { 'enum': 'StatsTarget',
>    'data': [ 'vcpu', 'vm' ] }
>
>  { 'union': 'StatsFilter',
>    'base': { 'target': 'StatsTarget', '*providers': ['StatsProvider'] },
>    'discriminator': 'target',
>    'data': { 'vcpu': ['*cpu-set': ['int']] }
> }
>
>  { 'union': 'StatsResults',
>    'base': { 'target': 'StatsTarget', stats: ['StatsResultsEntry'] },
>    'discriminator': 'target',
>    'data': { 'vcpu': ['id': 'int'] }
> }
>
> Alternatively, the providers should simply be keys in the dictionary
>
> Paolo
>
>>
>>   { 'alternate': 'StatsValue',
>>     'data': { 'scalar': 'int64',
>>               'list': [ 'int64 ' ] }
>>   }
>>
>>   { 'struct': 'StatsResultsEntry',
>>     'data': {
>>       'provider': 'StatsProvider',
>>       'stats': [ 'StatsValue' ]
>>     }
>>   }
>>
>>   { 'struct': 'StatsResults':
>>     'data': {
>>       '*vcpu': [ [ 'StatsResultsEntry' ] ],
>>       '*vm': [ 'StatsResultsEntry' ]
>>     }
>>   }
>>
>>   { 'command': 'query-stats',
>>     'data': { 'filter': '*StatsFilter' },
>>     'returns': 'StatsResults' }



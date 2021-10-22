Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2AA437CA3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 20:36:43 +0200 (CEST)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdzPG-0006Qh-Pd
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 14:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mdzAV-0001Dv-EJ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 14:21:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mdzAQ-0005dc-8v
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 14:21:24 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19MIGC3n007685; 
 Fri, 22 Oct 2021 18:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GzS8sLzt9i2+LjMIW4mRvxW5VDPWJMeUpw68K48NH7o=;
 b=pbGBG8oH4QwAZgo8idF+8AvArqhaBEWzNByqP4pcGi6MbynBu89MVCErJqfrz6jvGRoK
 o+srJra/zhVLD0wm0OMvdyTpO103jypzC7hyKonh7Nvi9fT60UuGkh4xZ86GZ8wd7qiA
 lhidWRk/js0CGjSYL//D9yy4z6Tt6tWdazutawvrK8iob7YGsTyRVBqgd1YiZi4l59+w
 +WM0EtgX08xY82zkNv1QIlWkjUqrARMkdyqKirdzTGT7jvRg/TinuKbvNv2Ri6ZaUPwM
 Y9/gikZuFaaQlAQ1+Hwxppd11IHfkTlHcvhJoiIJzhHDa8FCRFGOJPNmMCsiZ11a9h+F Qw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bunf9bmjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Oct 2021 18:21:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19MI5KdD045999;
 Fri, 22 Oct 2021 18:21:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3020.oracle.com with ESMTP id 3bqpjb0dgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Oct 2021 18:21:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKZjDD3+ZAWQkPJg4kg3xfRpJpT5vSNN21xmnGRSx9tDIizf9T1dGAVap2BxeqGhiufPY784oOcws1FtwkjiqgpvJsv0EMR2fC41lXh76R61D2+BvLr5+99TqR8u7nW16DMV4iZL/eH3z8jSF6UPN3ZoGpMICKwoJQByB7Bpg85K7c2f+gZQWWvaNt/fzsgpBSC1gsTK+Rj7M15cnR5oSGcr0IsWReotcuTm86mdqS1V9A04UGS5qsuw/2JYRLu/e+E321VWTnZ9OU70+gZs82nzzv6QCkzpvcmQUJGk6mD0UvJycBIdXC9YBicvv9DE+wLfxmmLn5xiZvgBevhOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzS8sLzt9i2+LjMIW4mRvxW5VDPWJMeUpw68K48NH7o=;
 b=Fvfav/Wtzj+fJV2zYSDT3jlurLb6X418c+eV33voA46d8UlKReP7w686R67mB5k+VZNuf+ZTfY2aljci7U3hsgEMgJDyJtGn8BA+jxjwr5rbMaqm2Yqc3BNXxEJhI8UM/dHqjQmchZ1tKDvD0jpknLs0x0ZbXn7rBg5IGgb6G3BVUav/9C/ZHLmSh+WcYJQ1SbM9AEZK10otseoxcNAPuBv5C6Z+OoUBhJxuiuRa7RsM3rbvu5OkNb5/JwiZIYB+3VzYfvREKMeWhRQ0iyaLrGNQyaOMKyR9gjQXG80TVULFvjZVxU/RAXBTAjBLvZgE3vaEcP/DP8OjIXwrrcuarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzS8sLzt9i2+LjMIW4mRvxW5VDPWJMeUpw68K48NH7o=;
 b=XgpwAsYtcqsd2bGr2Squri+jjOtj2r7ARSEFjiXgufZszw5t5mmOgL5AdiijdQiVsFUJIaq438nBowZ/PMAxUnUTxIWYC/XEfVEIilzNXO81hhu6+9a+Y2TZzv2s2ujoqp5NGsTMWcdl/UEl3AhWrZ6tDP3PdKy22eWk2I2bWGg=
Authentication-Results: anisinha.ca; dkim=none (message not signed)
 header.d=none;anisinha.ca; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2174.namprd10.prod.outlook.com (2603:10b6:301:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 18:21:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 18:21:14 +0000
Message-ID: <543751f3-b7c0-b039-64ee-cc902d9b1c80@oracle.com>
Date: Fri, 22 Oct 2021 13:21:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
 <1634324580-27120-8-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2110221545440.268000@anisinha-lenovo>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2110221545440.268000@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0201CA0035.namprd02.prod.outlook.com
 (2603:10b6:803:2e::21) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN4PR0201CA0035.namprd02.prod.outlook.com
 (2603:10b6:803:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Fri, 22 Oct 2021 18:21:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a1e2c8a-4265-4074-6416-08d99588bb1e
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2174:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB217456323DB5A0EBDC0DDE5097809@MWHPR1001MB2174.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJRBhl/2yxjnJ2XQ/7pYNvEp4PRZvsf3nAy0n0ub+ECTCvqCeHgquLlChz76Cbp8djlbwd0KxuoYurVADy6AOrihxzNfhcnaKfVuL/lr8iy+SrDlSH2sGQGHyoWEQxaQsWFcmPf4MZx1TlZ83WhPYjkRScYZmMi9oTHQ8HHvf+OINqqhsfDso5NzDvVihdomEujGtsdUGTEOWRPyFmOiSSHfBRh5AXECnC8nxKWfX3Lh3dUZ36fBiKV7T8gQyk2c/glW/XbiNZ5KHDMReflqwt4PJj4eL1udYwJfAiuj3F+WQ8zJCNPG6HefLb9ODZ/DeTjdRRej3UTFaMLtngQRFj+kcT51RzX1uh3recIKUQaxq81lHM6ocTJdd/LBez0I+SO6jNB96Z33u5Vho+dHGBLoM3ts2EYULFAeT3wlmUYUh38KNyFjv4aNjRwxcwtXA5HtmrbehsSptOe2MHDsKhyoE2+EjopPkPWSZ57yfeSV5kCHpWGF7JyRVzMdmb9b/5dTVCF7R/gBLeJbD+MhfcrCluc20AHOqvB+cg4W2iK9rw9Jf1JWtl20s+0FmntL0er/xyTP12tvI1hoJA2o3eLODBzRVIMB/bSagxHRF48mzV/WNUw+EIOUcdBQHOqL2hRKLVxYYyDp58W71olf/QgUlvmbf2ArRAB93SU1SsFf/l1zGmSoU1BXPLpyRKSeV3b9O6zEi7ly73ajy+BhE8BWu0j5cjFPB/fNwrvrsm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(4326008)(8936002)(38100700002)(66556008)(66476007)(6486002)(31696002)(86362001)(5660300002)(53546011)(186003)(36756003)(6916009)(316002)(2616005)(6666004)(31686004)(107886003)(2906002)(508600001)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WURlazJ4dkdBTzNBL1VjcWFKbHNGTHhpOU9SQ2dOK3RLbjVHQmdvb2krMGRE?=
 =?utf-8?B?a0RhaDJmVmV2a00vOXRXckJnYXF6TEtmOG9tcEVVQ0tZNTBKNTZtK0QyWHFN?=
 =?utf-8?B?cldjT09uenMyUjgrKy9HTXpSUHp0QitvbXlOdEVWYm9RMUtaM3UwRGFLWEs1?=
 =?utf-8?B?SmsyVm5tTEM0cmJVdzhMRGU5dUdodmJYdFlmUW1wcGJrbFdqZktONmJqK0lp?=
 =?utf-8?B?aG5FaGlaQUNaNHM0QWJvbHJxVWNIMndZa1pDQi96d3pOM1RWeFBYalg2WGIy?=
 =?utf-8?B?dWthNzlQUGUvcWJmUjRJSFRWb2JqZkhEaXZrNy9pcXpjaGpSRVAxdnhsNnow?=
 =?utf-8?B?OXA3ZlhRM0xyNHdVVnVoQk5IbWJDUk1VNmZMMmdHUXVoZlAxTlFrRFltd2hB?=
 =?utf-8?B?a2lScHQrdHhIekhWSkY1QUxsblRIMUcrY0lJTk01c1M3Q0QyQTVzajV1b3ho?=
 =?utf-8?B?ZHM0bDBMcjlEVjQwR3hyMFdlQysxQTMrWU4wS0lHOFFUKzF2dUUySUxyZjBu?=
 =?utf-8?B?UVRQQVZaRm5KRDEzVzJaY054THVHbDErVGhrTUpnRk9OYmtwK2pMdG9Rb29V?=
 =?utf-8?B?dmVzK2RZNkl0b0gvbjlaUWVQY205NWVuVy9Bay9ycXViencxN2hGc1htQi9M?=
 =?utf-8?B?QVk1Y1dIc3BwUnRETC9sOVZBMEcvUmFQa1hIdDlyUkM2UEJHVG5BMSt0OUpF?=
 =?utf-8?B?dHZtY2NXNFNtNERjMVNJRU1FVk1Jb1NTMXprZDJXb0RIdHFvNEQyZGQ4alo4?=
 =?utf-8?B?RlpwUWoxMVh5UWVLaXJMdGxCdGJicHpQY1pmTXRpTDI0OHZQOTFzU0lTemhL?=
 =?utf-8?B?VVpCNjlWVjFlTVZuZStBcm1PYXV4MEFqc0JSa3pPUWx5RlRBMEtaYWJYeG0v?=
 =?utf-8?B?Nmk3cy9NaUJETU9hanpQdUxFaXAzRmV1VUs4bFVmcllqbVg0N3g0dXFCTkw0?=
 =?utf-8?B?OVdVOWFhaXY4MTdTRzAyZEJrbDBtM1JpQUNEc1RkbmhhM2pka0RNWFFHNUtO?=
 =?utf-8?B?RGZBMmtVblFIR0tyVFR6ckVGV1I3UU1jM3A3M2tGYXZ1cWdNVEtNbFY3dk0x?=
 =?utf-8?B?T2lLcnlXakxBZ0R5NGJlaGpZYXEweTJsT0dqaFM2Wm0vTHZmSGNrclNvUDFk?=
 =?utf-8?B?ZU1SYXYrKzI5VDJKWWNKWXhqM29DRlBhUHF2N3JZZWJFaml2WHFQanpDeCs0?=
 =?utf-8?B?aHBBUUIwNWxUcEJSMjNubDV5M2ZseS9LNC9seHhVSUJjaTFMR2MySmtjSHo4?=
 =?utf-8?B?dVF4VERoSitUOXE1dmhCWjBCZ3hmMHlSWG9YU0pLakxGTy8zSGdaZHY0U2pC?=
 =?utf-8?B?T2gva0dGcUVKdmh5SHVtcFFGT1lVc3hrQ3I0UW9EelBoZGRkZ2xvcjdENi9w?=
 =?utf-8?B?UUZDVkpkZ2M5dyt2cVdsTGwyWmFHUFFQcEFXdTZUUnRqTExsMUJvTDVkcXZx?=
 =?utf-8?B?ekFJcXNYTjFGakNTcTNlR2VZbExwWHZlSUQyTGplQ3BjbWlpM1ZPdmdMOEtY?=
 =?utf-8?B?NTdOekxGYTE3RXBNdU1nbHJnZktBL1dadnd6eGtXQkg2YmVsRWNNR3I0RFNV?=
 =?utf-8?B?QURMNnFNSG12bEVsb2tGTGpsL29MQi9xSEtER3pNQlUyS2ZqR1Y2U2lza3BF?=
 =?utf-8?B?WE5ySE1HOFp6dk5kRTdnRlFSVXhFcGszdlRmdVozVEZSZnRncWFLd1BoRnhZ?=
 =?utf-8?B?TVcwWW5PcFlKeUdjMEJXUU13ajFuM1Y3SFhOelZHRnFFZWFFbGMxaUdaWEdH?=
 =?utf-8?B?MHl5R3lQNWptYWJNL3ZsZWFieFVnSWZOR1Zla05GNVFNZnFqYTREQWpUL2Nx?=
 =?utf-8?B?Lys1cTlIQlVsbWV4YkcwcUFYZDZoZWZFMG9SZ1lLckZCZitNSW8wN1VLODd6?=
 =?utf-8?B?TFBMQyt0dTJmdlhkcUZtTWxoSjNIUCtLWk5vTzhCalNJRStITHlGOFBTSWh3?=
 =?utf-8?B?U1M5R21tUE9GZ1JUdlJwdHJXS1EvMk93eWdoRFBqcC83TFA4b1c5YWExUENw?=
 =?utf-8?B?SGVCNXhwRGpBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1e2c8a-4265-4074-6416-08d99588bb1e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 18:21:13.9317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eric.devolder@oracle.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2174
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10145
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110220105
X-Proofpoint-GUID: 7U0-W2XKnNnem5fEFaeBIAAmZ3vy4PXy
X-Proofpoint-ORIG-GUID: 7U0-W2XKnNnem5fEFaeBIAAmZ3vy4PXy
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.742, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Ani, inline below.
eric

On 10/22/21 05:18, Ani Sinha wrote:
> 
> 
> On Fri, 15 Oct 2021, Eric DeVolder wrote:
> 
>> This change exposes ACPI ERST support for x86 guests.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/i386/acpi-build.c   | 9 +++++++++
>>   hw/i386/acpi-microvm.c | 9 +++++++++
>>   include/hw/acpi/erst.h | 5 +++++
>>   3 files changed, 23 insertions(+)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 81418b7..9c2f9d9 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -43,6 +43,7 @@
>>   #include "sysemu/tpm.h"
>>   #include "hw/acpi/tpm.h"
>>   #include "hw/acpi/vmgenid.h"
>> +#include "hw/acpi/erst.h"
>>   #include "sysemu/tpm_backend.h"
>>   #include "hw/rtc/mc146818rtc_regs.h"
>>   #include "migration/vmstate.h"
>> @@ -2499,6 +2500,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>       GArray *tables_blob = tables->table_data;
>>       AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
>>       Object *vmgenid_dev;
>> +    Object *erst_dev;
>>       char *oem_id;
>>       char *oem_table_id;
>>
>> @@ -2560,6 +2562,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>>                       x86ms->oem_table_id);
>>
>> +    erst_dev = find_erst_dev();
>> +    if (erst_dev) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_erst(tables_blob, tables->linker, erst_dev,
>> +                   x86ms->oem_id, x86ms->oem_table_id);
>> +    }
>> +
> 
> This needs to be ifdef'd between CONFIG_ERST.
ok

> 
> 
>>       vmgenid_dev = find_vmgenid_dev();
>>       if (vmgenid_dev) {
>>           acpi_add_table(table_offsets, tables_blob);
>> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> 
> I do not think we need to include this for microvm machines. They are
> supposed to have minimal ACPUI support. So lets not bloat it unless there
> is a specific requirement to support ERST on microvms as well.
Would it be ok if I ifdef this on CONFIG_ERST also?

> 
> 
>> index 196d318..662c8ad 100644
>> --- a/hw/i386/acpi-microvm.c
>> +++ b/hw/i386/acpi-microvm.c
>> @@ -30,6 +30,7 @@
>>   #include "hw/acpi/bios-linker-loader.h"
>>   #include "hw/acpi/generic_event_device.h"
>>   #include "hw/acpi/utils.h"
>> +#include "hw/acpi/erst.h"
>>   #include "hw/i386/fw_cfg.h"
>>   #include "hw/i386/microvm.h"
>>   #include "hw/pci/pci.h"
>> @@ -158,6 +159,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>>       X86MachineState *x86ms = X86_MACHINE(mms);
>>       GArray *table_offsets;
>>       GArray *tables_blob = tables->table_data;
>> +    Object *erst_dev;
>>       unsigned dsdt, xsdt;
>>       AcpiFadtData pmfadt = {
>>           /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
>> @@ -207,6 +209,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>>                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>>                       x86ms->oem_table_id);
>>
>> +    erst_dev = find_erst_dev();
>> +    if (erst_dev) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_erst(tables_blob, tables->linker, erst_dev,
>> +                   x86ms->oem_id, x86ms->oem_table_id);
>> +    }
>> +
> 
> 
> 
>>       xsdt = tables_blob->len;
>>       build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
>>                  x86ms->oem_table_id);
>> diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
>> index 9d63717..b747fe7 100644
>> --- a/include/hw/acpi/erst.h
>> +++ b/include/hw/acpi/erst.h
>> @@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>>
>>   #define TYPE_ACPI_ERST "acpi-erst"
>>
>> +/* returns NULL unless there is exactly one device */
>> +static inline Object *find_erst_dev(void)
>> +{
>> +    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
>> +}
>>   #endif
>> --
>> 1.8.3.1
>>
>>


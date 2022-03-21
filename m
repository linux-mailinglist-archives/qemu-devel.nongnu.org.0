Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F294E2C04
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:21:32 +0100 (CET)
Received: from localhost ([::1]:50068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJqc-0003y0-Rq
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:21:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWJnb-0002KM-L9
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:18:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWJnX-0001Qy-V0
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:18:22 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LCwOBX001109; 
 Mon, 21 Mar 2022 15:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=/oZlZpCS/pLUvEDsIVdFeRD/AdKhB0jjSLeSDggvzKA=;
 b=oH3Q8GgX9ugkodEAMvacUH6dexk73mxe8AHJx9cL9IxhXaRzO2OAMNhRl/mXsILzG34p
 bysB1vb6hdMDvuYNr8aVV1AAN12rDFWbsUK03kcl1J+VzQskGiZR2Zh99+ts+ejiJ1e5
 tkrbWEgr/CvFp0NpiNsvLZyHtYI8+y20r7qUKBntLjw10Vi4uGP6oQhjeiyw+GX2rKSy
 sg2p2AuZSSLK2ssKD1TrMPkcJ6SKvwHC0qVZ7BGWodJCaXl6XZejVB5WDMSpR+yfTBSi
 xw04oDAp9TYtvnRKOkIcGKO/fBp7UtRlW/MyiLHS1fgNQCd2ZksPFIfCg5yVH7X87zXW gg== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5s0kn74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 15:18:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22LFAvNe132855;
 Mon, 21 Mar 2022 15:18:06 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by aserp3030.oracle.com with ESMTP id 3ew578sn5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 15:18:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEhlX8Damgxas/ypkGmM6LBkGom/05jUeRe1KYICFeozfPluVziTYn9ZT3J+GSUhGOFxaIfMTZBi0baubVoIUf9lJ6jD2cyepqiUHH71l0zGLS6zq10FUH5y/l51rhJ1YzznMWOc1xJwwdFAOp1XJTCsl3yWK0RCjSLS7ikUntGFb5qSk9XdlIIS8FJ+Fav4pg1LzZI6PJ/hprZa1g4PCJD1BkoH1EuGHkv+mwExb0Vx+ZTZJXF+fh1iripmdnD9Me7DfxhQppI99KsU+/qIcPuv63GG+2qTr2X8x9p8LItdRghRio7euLrWkHg0grM4FTU/tGYlNALidtBwmT3K0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oZlZpCS/pLUvEDsIVdFeRD/AdKhB0jjSLeSDggvzKA=;
 b=IwukLu/lqAVhBBisabh6OZjz7209nKrCWe4+x3h1b+Ndv8EMVvz2idYUUsDbFIekeaGaSgr5J6kd8fPxn4Ztm6Z3V6bgv1JfEcaxWVdEBOq95bgnsGZF8JOlYuZSPCmu7MpdbfH/ho66MzYTIX2K7F3jy/7gVXKjsnVvfyGjxb+Qtq48/1mNc4mwdzXavbMpNI9whw9TC7MkGiMaWuRzWU+Ivs13Y1BQA3Ejvuj9cBFKpdyYtP+T0+y8XRRalEcj/m6M6DYxQBxpXrYjKYgQB7z7+44775NCxd3uyYulhlb/uOokstpxNPutbMoYgZr8fbwlEpjkBlThMvaj+6oKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oZlZpCS/pLUvEDsIVdFeRD/AdKhB0jjSLeSDggvzKA=;
 b=jozMPKqjt6MVUCiuunWk7tXtx03YIP7jLpmD7O45D5ZXQYobOSAJpzNkp5xSiL9pGcbwdwqLeepofFDgYjW7NJr51+Fa2Ywxtj1EV1x+Yo6WWk3fObYOSJe3P8XOZetOpvPCKiqBybXOkI1Um8THDeKKWarRLLk5TRWhXYVA600=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by SJ0PR10MB4461.namprd10.prod.outlook.com (2603:10b6:a03:2d8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 15:18:04 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15%5]) with mapi id 15.20.5081.018; Mon, 21 Mar 2022
 15:18:04 +0000
Content-Type: multipart/mixed; boundary="------------oj0Gl5i8M0BLaVbX9AXdZ5cI"
Message-ID: <675ede55-e489-7fef-ef1e-12ae6afcecc8@oracle.com>
Date: Mon, 21 Mar 2022 10:18:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/3] qmp: Support for querying stats
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220215150433.2310711-1-mark.kanda@oracle.com>
 <20220215150433.2310711-2-mark.kanda@oracle.com>
 <87a6dw7i55.fsf@pond.sub.org>
 <efd0b85b-beb1-feeb-6c38-510f8bc36af9@oracle.com>
 <874k3r5s9q.fsf@pond.sub.org>
 <177c8b62-0a12-75d0-6a76-5480e3e12f68@redhat.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <177c8b62-0a12-75d0-6a76-5480e3e12f68@redhat.com>
X-ClientProxiedBy: SN7PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:806:125::32) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86a73a7f-4948-4cda-88d4-08da0b4dff0e
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4461:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB44618A99C241B09AB3B3690EF9169@SJ0PR10MB4461.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VJi6xLixRpFiI/2NL0W91DJnlUMzFshNRCP2gvLgFo+11DTTQgHkHF6ijMmz8qJTsNziD14Ylfu971eYPxUGJEuEnG1tNvbPtic+aIsC7yi2y6i0L6sBwT0pzDc7F+wIh5exKbHDq87wLYASAh4m8KuyvfjfD/EPLdu3oeerCdaBR2beemM61vhNvfwMi1kqdhDxRQN6hTH7EviWex3Fdfvkw7i91YnHxrOyixqy63rNjS/+YvTPH1t/MWZ8EoBLXd1GkMnX3ZI0UrSyUSD14fwVyA+gv1BcvIo0qpDDl/1aebRju5f9NedQ93O0V3BOarBUFfIpZqwmDjHjtCFeS4ukNTiiIhlC2Am+X5IN/Jg74XkSxUjDu2g1PB16Gn+D7Tk6JLn9WadyJbFYZ0G4BlROjrRHPDFbBWkixd1yg01tAGwF1JCvZRlwSm4gGWWQ52jMGaNd67AUrm5VH3Z/Qxhs95t3RMUQ4eUH7hSYZ+jgnqkjM2iSnaxjXwk7iVEv4PL9OwoA+Ob40037Rbl7G8iHL5KvT0M49gVaiyUtK3MVoRddXeZQvQLTrt/H9uYBAEsF3jW+csE/VelOBM4zcLhRKDaLDmPXdEeZ1AKnA6UMhrr6Eh8w69KIQaRazL8nGsdGYv6x1fhdo3ieq0Xdth67a7f+b9eS8mo+HDEteGzxJWDbi98E+7DK7e3GapgQfZasg3bJfcP22VrLkWeLTewB2VmUgn2s+dMuKmjnUV9KmV+fFg9VrX609xRBXyXU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(235185007)(110136005)(44832011)(66556008)(66476007)(66946007)(38100700002)(8676002)(4326008)(86362001)(31696002)(5660300002)(8936002)(316002)(36756003)(83380400001)(33964004)(6486002)(6506007)(26005)(186003)(53546011)(508600001)(2616005)(2906002)(6512007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNhbi9HMUVXRE9HOTNOeTZkcUo5R3BWT1VpZ3J3ZFdHOTZrWDFDellER2Nr?=
 =?utf-8?B?MGRXODgwR2lwMGN0SzhWY2pBeTVCcmlvZTFoUklLZngxc21IYW8xa1JwU3RF?=
 =?utf-8?B?QnRTd0V3WEpaQUJVeTFhUmhMZ244S3lJRGNqL0h5REhOQzhoWWMrT3NNZFFV?=
 =?utf-8?B?T0NSZW16M3B4ZTBRK0h3QzB3MlhVWkVjYkFOU0lxNEpYd3JrNjJwSmE2d0ZR?=
 =?utf-8?B?d3FIVXhrN1A1YlpuWlNUbDd0ZGFRamRtTDdJblFjbGRGWW1vdjRVcVoxNjlC?=
 =?utf-8?B?WDJBU092VTZ2NWdNd1pmUnp6azNsVlJDR1ZuUDhnZ0pObU9XeEJJN3IxSEZY?=
 =?utf-8?B?NUFUcDVtWUdEZmZKZ2E4N3NhVWJvYXRULyt6Q3djUkhUQnhPdG40L1Fzb1ph?=
 =?utf-8?B?aXNqcnpzVGQ0cTJGU3ozZFBKQ01UNTNjRldkUVRYMnM0SE5OZXpGWWFkUlBE?=
 =?utf-8?B?Z2R0eDUwNUkyV1BQQmx6cTZZcERibEhLSFNKQXJML1JqVGFlR29td1g3cVNs?=
 =?utf-8?B?SDZ2eUpPcXZVK2dsNlpJa1FnNmhSckZscFhEK2ZuZXpWMndGcUxLeWVFZFNT?=
 =?utf-8?B?ME04VGYvVkpGeFJFK1Y3NXVKMmtuMTVtOUREandlRnlzaWh5VTRJaVpiL3Bh?=
 =?utf-8?B?OTZVMlhzUk1JS0p6WXJtVXFtRTdFTmN6YUYzRVAxNWhjYlVWQlhQeUhVUDdU?=
 =?utf-8?B?Q0dPa1c5ZDE3KzUwdERFcmpETUxwVFJNR0I3Wnkwa2JIbmVKVDhTOUs5dXA5?=
 =?utf-8?B?cG5PUTQxMnJ3OFg3eE9iQUNsRFVmNVJLTXlwWHR4dGVJeXNOOW45Snc4Z2c2?=
 =?utf-8?B?U0ZrR3laRVFPbkdPUEZsQS91NFFPTFBGOEEvZG85YkxiT0RnK1FZdVJtR0g3?=
 =?utf-8?B?Z3JsVUhYcy9zTDhsTit3RGJhKzdpSnBEMW53Qld5aGM3T3pCWm1sa3F2WHUw?=
 =?utf-8?B?aU1ZeFExU1p0bDg5bHBxSEpkWlUwT2YwZUxVbmxTcUhuaHE2M2hGZFM4RUx4?=
 =?utf-8?B?Smk0c291ekMrZyt5aWUybU9oYnhtUUFzRmpqV3pvaENscWVSMGpFZVVLODJ1?=
 =?utf-8?B?TDB2ZEtuUmk0YWJmSGoyUSsyRC9JRGtHb29OemlTZ2tnMEF2LzFtQWJQd0Fy?=
 =?utf-8?B?aUpPSkg3OUg0ZjR4c3VtSDhha2s4cjZEWjMxWmYyRUUxRTRQdjNKOFNSTlM1?=
 =?utf-8?B?bmw0VjUzOVVIOTQvTTA4TDJJZ2xLVjRLaXhDMDY4dG42U2JYeE9XREpuZ2VU?=
 =?utf-8?B?alR1bnllTHZVV0d4eU1PbmhjRnlJMmRWM1QxUTZ4OEx6OGxMYm85LzBRSlk2?=
 =?utf-8?B?SUY1aEE0L0hZaEF1OGhNRmkvdVBqS0NKR09jc01lbEhXN3FtMW9oTkE0a2ls?=
 =?utf-8?B?M1QxdXpEaDc4c2huN1BiRjVrYW4zZ2RRNTRoeCtPRFhKVHhPdDRBQjVFckhU?=
 =?utf-8?B?UjlTczJLSTM2QjRQV3dYc3BQSDNEUjFuT3pGRW9DT3FJanBrb0VBelZPSGJk?=
 =?utf-8?B?V1N2emhKb2IwcytZbjBiK2dDSWpMRzlWY2lma2hndVg4bUJBV2dhRmZndUw0?=
 =?utf-8?B?cEYwMC9MaFBrNk1YOHRKTFRZeDNiVjlvSy9PVW81NTBtOFZGMWpEYnhTREN1?=
 =?utf-8?B?S01JNndmMHMwM3RrYjhmbnVXVm51eGlGNzVLVGZJdCs2NUcwbHFLbE9JTkR2?=
 =?utf-8?B?QlBVQmZoK3lOSEdyQzZYZ2FST0swSmQwRG9ReTdqUU95QVhTR01XWkJoamtz?=
 =?utf-8?B?WUdoY3BraVJQQ2l1dWpmOG5JRWs2TlR3anUzeDExTzJoTEYzYTJ6eFFqU1d2?=
 =?utf-8?B?bzF0ZzhUazJaR1JjVDlRdFV0NHZqVktUa2xWMlVESG95dUdHVXlqQ21OLzlv?=
 =?utf-8?B?aHN6VnlsL3pMV3hzRlZ2QVRRcUVUOWhrNnlhb0MrVGd2MDJDbUt6SjBZMjQy?=
 =?utf-8?B?cXV6MVhkZjVFckhxZ2E3SnJmcGRLYnNtallZS0FYMXdjeXAxcnFCcXVmSWdV?=
 =?utf-8?B?Wk1EYXB2U0VnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a73a7f-4948-4cda-88d4-08da0b4dff0e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 15:18:04.6657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuEJEV0NTFhh4YCEaOOmOyOcaBTJbk9Az+oBmIZ16axhQcXZHoIw/OfqJPIlTd3zmUyuJBlemba0dZLATHEUxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4461
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10292
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203210097
X-Proofpoint-GUID: HGbewcxsQ2vtXWFBF0aE4c8jTqGEQxva
X-Proofpoint-ORIG-GUID: HGbewcxsQ2vtXWFBF0aE4c8jTqGEQxva
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------oj0Gl5i8M0BLaVbX9AXdZ5cI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/21/2022 9:55 AM, Paolo Bonzini wrote:
> On 3/21/22 14:50, Markus Armbruster wrote:
>> Mark Kanda <mark.kanda@oracle.com> writes:
>>> Thank you Markus.
>>> On 3/11/2022 7:06 AM, Markus Armbruster wrote:
>>>> Are the stats bulky enough to justfify the extra complexity of
>>>> filtering?
>>>
>>> If this was only for KVM, the complexity probably isn't worth it. However, the
>>> framework is intended to support future stats with new providers and targets
>>> (there has also been mention of moving existing stats to this framework).
>>> Without some sort of filtering, I think the payload could become unmanageable.
>>
>> I'm deeply wary of "may need $complexity in the future" when $complexity
>> could be added when we actually need it :)
>
> I think it's better to have the filtering already.  There are several uses for 
> it.
>
> Regarding filtering by provider, consider that a command like "info jit" 
> should be a wrapper over
>
> { "execute": "query-stats", "arguments" : { "target": "vm",
>   "filters": [ { "provider": "tcg" } ] } }
>
> So we have an example of the intended use already within QEMU. Yes, the 
> usefulness depends on actually having >1 provider but I think it's pretty 
> central to the idea of having a statistics *subsystem*.
>
> Regarding filtering by name, query-stats mostly has two usecases. The first is 
> retrieving all stats and publishing them up to the user, for example once per 
> minute per VM.  The second is monitoring a small number and building a 
> relatively continuous plot (e.g. 1-10 times per second per vCPU).  For the 
> latter, not having to return hundreds of values unnecessarily (KVM has almost 
> 60 stats, multiply by the number of vCPUs and the frequency) is worth having 
> even just with the KVM provider.
>
>>>> Can you give a use case for query-stats-schemas?
>>>
>>> 'query-stats-schemas' provide the the type details about each stat; such as the
>>> unit, base, etc. These details are not reported by 'query-stats' (only the stat
>>> name and raw values are returned).
>>
>> Yes, but what is going to use these type details, and for what purpose?
>
> QEMU does not know in advance which stats are provided.  The types, etc. are 
> provided by the kernel and can change by architecture and kernel version.  In 
> the case of KVM, introspection is done through a file descriptor.  QEMU passes 
> these up as QMP and in the future it could/should extend this to other 
> providers (such as TCG) and devices (such as block devices).
>
> See the "info stats" implementation for how it uses the schema:
>
> vcpu (qom path: /machine/unattached/device[2])
>   provider: kvm
>     exits (cumulative): 52369
>     halt_wait_ns (cumulative nanoseconds): 416092704390
>
> Information such as "cumulative nanoseconds" is provided by the schema.
>
>> Have you considered splitting this up into three parts: unfiltered
>> query-stats, filtering, and query-stats-schemas?
>
> Splitting could be an idea, but I think only filtering would be a separate 
> step.  The stats are not really usable without a schema that tells you the 
> units, or whether a number can go down or only up.  (Well, a human export 
> could use them through its intuition, but a HMP-level command could not be 
> provided).
>
>> We could perhaps merge with the current schema, then clean it up on top,
>> both in 7.1, if that's easier for you.
>
> The serialized JSON would change, so that would be a bit worrisome (but it 
> makes me feel a little less bad about this missing 7.0). It seems to be as 
> easy as this, as far as alternates go:
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 3cb389e875..48578e1698 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -554,7 +554,7 @@ def check_alternate(expr: _JSONObject, info: 
> QAPISourceInfo) -> None:
>          check_name_lower(key, info, source)
>          check_keys(value, info, source, ['type'], ['if'])
>          check_if(value, info, source)
> -        check_type(value['type'], info, source)
> +        check_type(value['type'], info, source, allow_array=True)
>
>
>  def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index b7b3fc0ce4..3728340c37 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -243,6 +243,7 @@ def alternate_qtype(self):
>              'number':  'QTYPE_QNUM',
>              'int':     'QTYPE_QNUM',
>              'boolean': 'QTYPE_QBOOL',
> +            'array':   'QTYPE_QLIST',
>              'object':  'QTYPE_QDICT'
>          }
>          return json2qtype.get(self.json_type())
> @@ -1069,6 +1070,9 @@ def _def_struct_type(self, expr, info, doc):
>              None))
>
>      def _make_variant(self, case, typ, ifcond, info):
> +        if isinstance(typ, list):
> +            assert len(typ) == 1
> +            typ = self._make_array_type(typ[0], info)
>          return QAPISchemaVariant(case, info, typ, ifcond)
>
>      def _def_union_type(self, expr, info, doc):
>
>
> I'll try to write some testcases and also cover other uses of
> _make_variant, which will undoubtedly find some issue.
>

Hi Paolo,

FWIW, the attached patch adjusts some tests for alternates with arrays..

Thanks/regards,
-Mark

--------------oj0Gl5i8M0BLaVbX9AXdZ5cI
Content-Type: text/plain; charset=UTF-8;
 name="0001-qapi-Add-support-for-alternates-with-arrays.patch"
Content-Disposition: attachment;
 filename="0001-qapi-Add-support-for-alternates-with-arrays.patch"
Content-Transfer-Encoding: base64

RnJvbSA4ZDAyYjFiM2NiYjBkY2MwODg3NWUzMDcxOTlkMDZjMzk5NWIzY2YyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJrIEthbmRhIDxtYXJrLmthbmRhQG9yYWNsZS5jb20+CkRh
dGU6IFR1ZSwgMTUgTWFyIDIwMjIgMjA6NDI6MDUgLTA1MDAKU3ViamVjdDogW1BBVENIXSBxYXBp
OiBBZGQgc3VwcG9ydCBmb3IgYWx0ZXJuYXRlcyB3aXRoIGFycmF5cwoKU2lnbmVkLW9mZi1ieTog
TWFyayBLYW5kYSA8bWFyay5rYW5kYUBvcmFjbGUuY29tPgotLS0KIHNjcmlwdHMvcWFwaS9leHBy
LnB5ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIHNjcmlwdHMvcWFwaS9zY2hlbWEucHkgICAg
ICAgICAgICAgICAgICB8IDYgKysrKystCiB0ZXN0cy9xYXBpLXNjaGVtYS9hbHRlcm5hdGUtYXJy
YXkuZXJyICAgfCAyIC0tCiB0ZXN0cy9xYXBpLXNjaGVtYS9hbHRlcm5hdGUtYXJyYXkuanNvbiAg
fCA3IC0tLS0tLS0KIHRlc3RzL3FhcGktc2NoZW1hL2FsdGVybmF0ZS1hcnJheS5vdXQgICB8IDAK
IHRlc3RzL3FhcGktc2NoZW1hL21lc29uLmJ1aWxkICAgICAgICAgICB8IDEgLQogdGVzdHMvcWFw
aS1zY2hlbWEvcWFwaS1zY2hlbWEtdGVzdC5qc29uIHwgNiArKysrKysKIHRlc3RzL3FhcGktc2No
ZW1hL3FhcGktc2NoZW1hLXRlc3Qub3V0ICB8IDggKysrKysrKysKIDggZmlsZXMgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgdGVz
dHMvcWFwaS1zY2hlbWEvYWx0ZXJuYXRlLWFycmF5LmVycgogZGVsZXRlIG1vZGUgMTAwNjQ0IHRl
c3RzL3FhcGktc2NoZW1hL2FsdGVybmF0ZS1hcnJheS5qc29uCiBkZWxldGUgbW9kZSAxMDA2NDQg
dGVzdHMvcWFwaS1zY2hlbWEvYWx0ZXJuYXRlLWFycmF5Lm91dAoKZGlmZiAtLWdpdCBhL3Njcmlw
dHMvcWFwaS9leHByLnB5IGIvc2NyaXB0cy9xYXBpL2V4cHIucHkKaW5kZXggM2NiMzg5ZTg3NS4u
NDg1NzhlMTY5OCAxMDA2NDQKLS0tIGEvc2NyaXB0cy9xYXBpL2V4cHIucHkKKysrIGIvc2NyaXB0
cy9xYXBpL2V4cHIucHkKQEAgLTU1NCw3ICs1NTQsNyBAQCBkZWYgY2hlY2tfYWx0ZXJuYXRlKGV4
cHI6IF9KU09OT2JqZWN0LCBpbmZvOiBRQVBJU291cmNlSW5mbykgLT4gTm9uZToKICAgICAgICAg
Y2hlY2tfbmFtZV9sb3dlcihrZXksIGluZm8sIHNvdXJjZSkKICAgICAgICAgY2hlY2tfa2V5cyh2
YWx1ZSwgaW5mbywgc291cmNlLCBbJ3R5cGUnXSwgWydpZiddKQogICAgICAgICBjaGVja19pZih2
YWx1ZSwgaW5mbywgc291cmNlKQotICAgICAgICBjaGVja190eXBlKHZhbHVlWyd0eXBlJ10sIGlu
Zm8sIHNvdXJjZSkKKyAgICAgICAgY2hlY2tfdHlwZSh2YWx1ZVsndHlwZSddLCBpbmZvLCBzb3Vy
Y2UsIGFsbG93X2FycmF5PVRydWUpCiAKIAogZGVmIGNoZWNrX2NvbW1hbmQoZXhwcjogX0pTT05P
YmplY3QsIGluZm86IFFBUElTb3VyY2VJbmZvKSAtPiBOb25lOgpkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9xYXBpL3NjaGVtYS5weSBiL3NjcmlwdHMvcWFwaS9zY2hlbWEucHkKaW5kZXggYjdiM2ZjMGNl
NC4uN2VlZGZhNmNjMiAxMDA2NDQKLS0tIGEvc2NyaXB0cy9xYXBpL3NjaGVtYS5weQorKysgYi9z
Y3JpcHRzL3FhcGkvc2NoZW1hLnB5CkBAIC0yNDMsNyArMjQzLDggQEAgZGVmIGFsdGVybmF0ZV9x
dHlwZShzZWxmKToKICAgICAgICAgICAgICdudW1iZXInOiAgJ1FUWVBFX1FOVU0nLAogICAgICAg
ICAgICAgJ2ludCc6ICAgICAnUVRZUEVfUU5VTScsCiAgICAgICAgICAgICAnYm9vbGVhbic6ICdR
VFlQRV9RQk9PTCcsCi0gICAgICAgICAgICAnb2JqZWN0JzogICdRVFlQRV9RRElDVCcKKyAgICAg
ICAgICAgICdvYmplY3QnOiAgJ1FUWVBFX1FESUNUJywKKyAgICAgICAgICAgICdhcnJheSc6ICAg
J1FUWVBFX1FMSVNUJwogICAgICAgICB9CiAgICAgICAgIHJldHVybiBqc29uMnF0eXBlLmdldChz
ZWxmLmpzb25fdHlwZSgpKQogCkBAIC0xMDY5LDYgKzEwNzAsOSBAQCBkZWYgX2RlZl9zdHJ1Y3Rf
dHlwZShzZWxmLCBleHByLCBpbmZvLCBkb2MpOgogICAgICAgICAgICAgTm9uZSkpCiAKICAgICBk
ZWYgX21ha2VfdmFyaWFudChzZWxmLCBjYXNlLCB0eXAsIGlmY29uZCwgaW5mbyk6CisgICAgICAg
IGlmIGlzaW5zdGFuY2UodHlwLCBsaXN0KToKKyAgICAgICAgICAgIGFzc2VydCBsZW4odHlwKSA9
PSAxCisgICAgICAgICAgICB0eXAgPSBzZWxmLl9tYWtlX2FycmF5X3R5cGUodHlwWzBdLCBpbmZv
KQogICAgICAgICByZXR1cm4gUUFQSVNjaGVtYVZhcmlhbnQoY2FzZSwgaW5mbywgdHlwLCBpZmNv
bmQpCiAKICAgICBkZWYgX2RlZl91bmlvbl90eXBlKHNlbGYsIGV4cHIsIGluZm8sIGRvYyk6CmRp
ZmYgLS1naXQgYS90ZXN0cy9xYXBpLXNjaGVtYS9hbHRlcm5hdGUtYXJyYXkuZXJyIGIvdGVzdHMv
cWFwaS1zY2hlbWEvYWx0ZXJuYXRlLWFycmF5LmVycgpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggYjFhYTFmNGU4ZC4uMDAwMDAwMDAwMAotLS0gYS90ZXN0cy9xYXBpLXNjaGVtYS9hbHRl
cm5hdGUtYXJyYXkuZXJyCisrKyAvZGV2L251bGwKQEAgLTEsMiArMCwwIEBACi1hbHRlcm5hdGUt
YXJyYXkuanNvbjogSW4gYWx0ZXJuYXRlICdBbHQnOgotYWx0ZXJuYXRlLWFycmF5Lmpzb246NTog
J2RhdGEnIG1lbWJlciAndHdvJyBjYW5ub3QgYmUgYW4gYXJyYXkKZGlmZiAtLWdpdCBhL3Rlc3Rz
L3FhcGktc2NoZW1hL2FsdGVybmF0ZS1hcnJheS5qc29uIGIvdGVzdHMvcWFwaS1zY2hlbWEvYWx0
ZXJuYXRlLWFycmF5Lmpzb24KZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGYyNDFhYWMx
MjIuLjAwMDAwMDAwMDAKLS0tIGEvdGVzdHMvcWFwaS1zY2hlbWEvYWx0ZXJuYXRlLWFycmF5Lmpz
b24KKysrIC9kZXYvbnVsbApAQCAtMSw3ICswLDAgQEAKLSMgd2UgZG8gbm90IGFsbG93IGFycmF5
IGJyYW5jaGVzIGluIGFsdGVybmF0ZXMKLSMgVE9ETzogc2hvdWxkIHdlIHN1cHBvcnQgdGhpcz8K
LXsgJ3N0cnVjdCc6ICdPbmUnLAotICAnZGF0YSc6IHsgJ25hbWUnOiAnc3RyJyB9IH0KLXsgJ2Fs
dGVybmF0ZSc6ICdBbHQnLAotICAnZGF0YSc6IHsgJ29uZSc6ICdPbmUnLAotICAgICAgICAgICAg
J3R3byc6IFsgJ2ludCcgXSB9IH0KZGlmZiAtLWdpdCBhL3Rlc3RzL3FhcGktc2NoZW1hL2FsdGVy
bmF0ZS1hcnJheS5vdXQgYi90ZXN0cy9xYXBpLXNjaGVtYS9hbHRlcm5hdGUtYXJyYXkub3V0CmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlNjlkZTI5YmIyLi4wMDAwMDAwMDAwCmRpZmYg
LS1naXQgYS90ZXN0cy9xYXBpLXNjaGVtYS9tZXNvbi5idWlsZCBiL3Rlc3RzL3FhcGktc2NoZW1h
L21lc29uLmJ1aWxkCmluZGV4IGNhZjA3OTFiYTguLjNkYmQ1ZjhiZmIgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL3FhcGktc2NoZW1hL21lc29uLmJ1aWxkCisrKyBiL3Rlc3RzL3FhcGktc2NoZW1hL21lc29u
LmJ1aWxkCkBAIC00LDcgKzQsNiBAQCB0ZXN0X2Vudi5zZXQoJ1BZVEhPTklPRU5DT0RJTkcnLCAn
dXRmLTgnKQogCiBzY2hlbWFzID0gWwogICAnYWx0ZXJuYXRlLWFueS5qc29uJywKLSAgJ2FsdGVy
bmF0ZS1hcnJheS5qc29uJywKICAgJ2FsdGVybmF0ZS1iYXNlLmpzb24nLAogICAnYWx0ZXJuYXRl
LWJyYW5jaC1pZi1pbnZhbGlkLmpzb24nLAogICAnYWx0ZXJuYXRlLWNsYXNoLmpzb24nLApkaWZm
IC0tZ2l0IGEvdGVzdHMvcWFwaS1zY2hlbWEvcWFwaS1zY2hlbWEtdGVzdC5qc29uIGIvdGVzdHMv
cWFwaS1zY2hlbWEvcWFwaS1zY2hlbWEtdGVzdC5qc29uCmluZGV4IDQzYjg2OTcwMDIuLjY0ZGNi
YmJlMmEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3FhcGktc2NoZW1hL3FhcGktc2NoZW1hLXRlc3QuanNv
bgorKysgYi90ZXN0cy9xYXBpLXNjaGVtYS9xYXBpLXNjaGVtYS10ZXN0Lmpzb24KQEAgLTEyMyw2
ICsxMjMsMTIgQEAKICMgZm9yIHRlc3RpbmcgdXNlIG9mICdzdHInIHdpdGhpbiBhbHRlcm5hdGVz
CiB7ICdhbHRlcm5hdGUnOiAnQWx0U3RyT2JqJywgJ2RhdGEnOiB7ICdzJzogJ3N0cicsICdvJzog
J1Rlc3RTdHJ1Y3QnIH0gfQogCisjIGZvciB0ZXN0aW5nIHVzZSBvZiBhbiAnaW50JyBhcnJheSB3
aXRoaW4gYWx0ZXJuYXRlcworeyAnYWx0ZXJuYXRlJzogJ0FsdEludEFycmF5JywgJ2RhdGEnOiB7
ICdhJzogWyAnaW50JyBdLCAnbyc6ICdUZXN0U3RydWN0JyB9IH0KKworIyBmb3IgdGVzdGluZyB1
c2Ugb2YgYW4gJ1Rlc3RTdHJ1Y3QnIGFycmF5IHdpdGhpbiBhbHRlcm5hdGVzCit7ICdhbHRlcm5h
dGUnOiAnQWx0U3RydWN0QXJyYXknLCAnZGF0YSc6IHsgJ2EnOiBbICdUZXN0U3RydWN0JyBdLCAn
byc6ICdUZXN0U3RydWN0JyB9IH0KKwogeyAnc3RydWN0JzogJ0FycmF5U3RydWN0JywKICAgJ2Rh
dGEnOiB7ICdpbnRlZ2VyJzogWydpbnQnXSwKICAgICAgICAgICAgICdzOCc6IFsnaW50OCddLApk
aWZmIC0tZ2l0IGEvdGVzdHMvcWFwaS1zY2hlbWEvcWFwaS1zY2hlbWEtdGVzdC5vdXQgYi90ZXN0
cy9xYXBpLXNjaGVtYS9xYXBpLXNjaGVtYS10ZXN0Lm91dAppbmRleCAxZjk1ODVmYTliLi5iODk5
YzMwMTU4IDEwMDY0NAotLS0gYS90ZXN0cy9xYXBpLXNjaGVtYS9xYXBpLXNjaGVtYS10ZXN0Lm91
dAorKysgYi90ZXN0cy9xYXBpLXNjaGVtYS9xYXBpLXNjaGVtYS10ZXN0Lm91dApAQCAtMTI1LDYg
KzEyNSwxNCBAQCBhbHRlcm5hdGUgQWx0U3RyT2JqCiAgICAgdGFnIHR5cGUKICAgICBjYXNlIHM6
IHN0cgogICAgIGNhc2UgbzogVGVzdFN0cnVjdAorYWx0ZXJuYXRlIEFsdEludEFycmF5CisgICAg
dGFnIHR5cGUKKyAgICBjYXNlIGE6IGludExpc3QKKyAgICBjYXNlIG86IFRlc3RTdHJ1Y3QKK2Fs
dGVybmF0ZSBBbHRTdHJ1Y3RBcnJheQorICAgIHRhZyB0eXBlCisgICAgY2FzZSBhOiBUZXN0U3Ry
dWN0TGlzdAorICAgIGNhc2UgbzogVGVzdFN0cnVjdAogb2JqZWN0IEFycmF5U3RydWN0CiAgICAg
bWVtYmVyIGludGVnZXI6IGludExpc3Qgb3B0aW9uYWw9RmFsc2UKICAgICBtZW1iZXIgczg6IGlu
dDhMaXN0IG9wdGlvbmFsPUZhbHNlCi0tIAoyLjI3LjAKCg==

--------------oj0Gl5i8M0BLaVbX9AXdZ5cI--


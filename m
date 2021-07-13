Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1333C79C3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:37:36 +0200 (CEST)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3R1z-0003Cg-3R
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3QvJ-0008LZ-Kp
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:30:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3QvE-0004PY-Rq
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:30:41 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DMHU0K026474; Tue, 13 Jul 2021 22:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=PnZsgLjAB508uPBsNquDViKS5cGmzOO/76OcSvf5isQ=;
 b=HnCcpQiyXxsN0adcNwYcSYbHwxP7Nz3Tq/+cN7bV5L8npbJOmcwnrBCRC2dmAD8qAuM0
 UEt1rrGrUVaTSrH8dqakjdMUNlDWi5MJDguYJEMRQD1ZI8U2pZzs8wl1xKEmF5GIb9wI
 oPvs2v2nrTMAOCELnHoBMm3QsRdMobvF36LWnNNUAh5bAhF5PrQpxYL+S/gCgPY55xcA
 X9KQJXhv/Hrcw0uXyuG4ycgJr3EfSadDPFgGRL7krPP8zcSkbU5TxDi36fP7dDncTLk9
 7qmClMX15fJuyXRSECvQTujCTFtJfORwWdP2eWMdzU4PpuEE/sr1ATJF8HVoAadFMpZN HQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rnxdknae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 22:30:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16DMExH0034005;
 Tue, 13 Jul 2021 22:30:33 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by aserp3020.oracle.com with ESMTP id 39q3cd0u6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 22:30:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oG5NMNcFlc1lA86bGJQ3crq1ivcbRVG8JpPzU6xOAAzF78Mb7xbNOuDd1gKFNzjJ+RDTrsH7Vo+EmW15l3LJqqk+bjcXmGnkr8VFqFxDOMaU3Xobo7YyGZ8qE8IjV8+bJp2HLbpvV5wEMfo7kKCkiftQ+GVVAFNMl09Ji6ySJ0ByRaV93ouvA218WLu8MljN4Q9B1ChgD46/Eskp5FoQexHBQe26g6dJvq7aDjFFLTvVgxUPqaA2B+j+oRLxfVYZdNZ15ZVG9RtKoM+p5gRAHfG+mL3cfvTS0hlnZ2VOklrN42ogzjb9miOqC1iB+R/SxKW3gPFt9itLb241oY32Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnZsgLjAB508uPBsNquDViKS5cGmzOO/76OcSvf5isQ=;
 b=NWzP3PhUBF/LZJNmisnRPBQA3Xg7GCeXBGndcMg1fdi3rog56RLjgSWpOiHt4iFnQqFJIuDrX3mtMnusUPiuh50FUY+U82pMaU+ND4spDzQPkGUN1ZR04iQnzocGYzbwKoea7+7mjHmCrPhS+o+pkqGZRyEN8UFjWdAa9GpXLKHP5i4iP1CSwQG0oOo9d5Dk7l9WgdOhz5FUBffFa7cXQy76Vc05vHOV3VHp+LBmucUOKSq0vXf64VB8N8IF96lm+xYU/lAUKI2T3Up12ESGD92iL38WUIPKxRGXQvUf3tSC0NdNPVdWAXocDIZMVI+PnWKKwIgQHq/dmwrtrkbl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnZsgLjAB508uPBsNquDViKS5cGmzOO/76OcSvf5isQ=;
 b=gu/vxUsvWOgYhioiNaqZTtF/8+05YjNVbxdBMFogbBhEYQ9ApCEQFwhjQdDm9zTrVmN4MX6BjsLPAZ/+e3CXrvvchGoVxP0A9Xrxcs7Gh5dVkhWLnif0y39r/ekP5INgP0cEedkFlMctRNiarV5g/ur41jUN7O8RZsf1qj+TpJo=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4574.namprd10.prod.outlook.com (2603:10b6:a03:2dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 22:30:32 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 22:30:32 +0000
Subject: Re: [PATCH RESEND v2 0/3] To add HMP interface to dump PCI MSI-X
 table/PBA
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210712235812.19725-1-dongli.zhang@oracle.com>
 <20210713165917-mutt-send-email-mst@kernel.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <0d1a16ca-b4d5-3173-6477-9f6b038052ca@oracle.com>
Date: Tue, 13 Jul 2021 15:30:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210713165917-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::7d72] (2601:646:c303:6700::7d72) by
 SJ0PR03CA0165.namprd03.prod.outlook.com (2603:10b6:a03:338::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 22:30:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af5b24c5-c752-44e3-4ad1-08d9464dd322
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4574DCE66B1BEC8232511A64F0149@SJ0PR10MB4574.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: De9sTBrk76U3i6HriGKAdtWHHwlbrtI72JY1cWVjPq8gI0RizkMp7GCHDeuYm98E1LZa4aQadEXejA5/ASrntxXo/NulY4ryE7VguPhG/BDYjcQTKYnYL4JEFT+Ooxy+Lj7pbgbNw23vNCcFXM9qzsZcE99kIcgupMWJWJ3BdQpEQO78egEje/6xjQPiWKIMoUsE53+7F/IaE6MhwHk7jcmOwFFEZmgrrysP5xykyBe2eWyRKhor0Bq7DTUXksNfKXcRj/pEaEQepU5hTN6BpNVXxld7NYy9ULjOUUUxuSP8uA//Ht+ss4p1LocTy2tJSSxkwizj9iYWV5LlYc+LvTFxRV3Wz5AS+EyplJsuDPKjgRGLPVFRrxiRduk0KUJ9m3nQuKVpzvsW2U2HcxvO58yh0R4fkC56xT3uLV/8Ph9eMSUwFwl2fflBuFHukETubILzLEAcMiPXsBrDAIKH/zCiWKBRJDYuX8SbJkGR6eKhESv9WTZYeGSukiuheD3XXT/i88j7itPHTgzYCvVW8KIBCOqI11nkNg+OhM0yr/+OermfIDSnSGniDsuoOKeFYhSyu/vT2UaEfCh66VnKA+Vp9XPFb6w8x6ScZmP3aa205ccmEF7ZC8V91a1sWeyYp268AX31EjykXRPmTrzraRrUv6qYctA+hatAC3p/371D33FfBM6GtYnKoyrsWH0oPWbsCvwlHDtIrCx9oS30jW5XEW7H8RCy12Nqf120tFeEUJlJHpEUzOVaYplXbS25+SQooHD2r06+qOl9ONuk1L1AoCAVbbHcBSQy3P5HwLGmvbaNBJ253L0sa49TGQFQXGGzKBmHY/xezvjbXGeKk7vGWeBmP5ZOyN2vKK1IZ4M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(376002)(136003)(366004)(6486002)(186003)(478600001)(966005)(5660300002)(44832011)(66476007)(316002)(2616005)(4326008)(8676002)(86362001)(66946007)(2906002)(66556008)(31686004)(38100700002)(53546011)(8936002)(107886003)(31696002)(6916009)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFNSMXpBTmFnU3NHaHQzb3hWT2pjaDBLcG5wNnFQZ25Nd0QyU2kvYm10cmVi?=
 =?utf-8?B?MmUyeGlqWFJUVFcyRXVJWUc5c3ViNm5SLzNiTlBCamxZVUJ2aEJXRm10V2tK?=
 =?utf-8?B?dmdhK0NQZC9CS2xjOStuSm5VZmlUREExUWxoZ040SzU0UTgvUnBuNFlaQ1Fk?=
 =?utf-8?B?VUd3aUpQK3p2WFg2aHdyUGhZbnB4N2hNa1h6SGRjbUxva2FXdkppTktGZ0tG?=
 =?utf-8?B?MlV1N1lwMmhub2JVZndJZ3VrcVNobFp2Rm5lSUZndk12d01yQXh6UGh3WmI0?=
 =?utf-8?B?K1IyQjQwS092RXgybllOUDNuQXNQd00ycTBoZmxpazBIbVRxVG8rYU1LTEpw?=
 =?utf-8?B?UEl1UE5Xb2xOenMxU1ZjNlMvTWxqZVRRYkZMQmlib295ODF0K0J1NXR5ZEZP?=
 =?utf-8?B?U253ZlRsOGJ3L3A5UEpPNTIxUE9WMXBTZmw4ZXJkZEhJV1lkNitBbzNGTXRF?=
 =?utf-8?B?QTF4Z1ZENTlabTB4NGxFSllrZlk2c3hiN01WSUZEc2JFQzFsNUY1cDF1ZlR3?=
 =?utf-8?B?K0prR3B2M0pwWE9KNzkycmRNclF4cy9BNE9XWklqZ1psaDNWV3lSOWRpMnhK?=
 =?utf-8?B?dkZTdG9nMXAzTjYwclVsS2JCVzZtenpSRzIrb0crTWZMb3dJZzh6SlpvS285?=
 =?utf-8?B?RjUxbnllY3pRTmxTZEJLRnl2c0lDRVh5OVdtTGZYSWJzQTE0Z2tRZ1JqaEww?=
 =?utf-8?B?L2ExdVQ4Y3JFVk5tTFUyb2QxV1RaYVIrNXA0M1dPMzMxSmE3RDk4WmRTbFFE?=
 =?utf-8?B?bGh6UkpiYms2aExXYVhRa3pzM3lONklFRk1jTE5IMHdGQk9UdElSMWlEQVFF?=
 =?utf-8?B?cWhTMUZGRDZxekhqRmkvVlhnZWR5dFpaTkRIWHVLY295WUhwMGQwTlEzaDg2?=
 =?utf-8?B?dzBJd0YvaTM1d3V1aFRMQXNjNHd3aDFjSnVZa3I2NkV5NDl1M3VIRTg5YVU4?=
 =?utf-8?B?VzZqMVVuSHVIc0M1d1VUakZqaHpwMUtXUDN1VU43VUZpUkFIQmpNUHBpaTk5?=
 =?utf-8?B?enJ1eFM5RWl3QUUyQXpOa1ZzbC8vQmMzNHRydUJ1SzZlWlBTZjJNaFNwV29l?=
 =?utf-8?B?TkFCUHBkLzJ6Y05sVFgyV3NpeU5Qa2dlelQ3RDNHOHBzRWluVnExVHN2Z2lp?=
 =?utf-8?B?Ny9naXVhRitzWFpoQ0NQZFB3UkZmNG9TR3hUcE12d2VRWUozaUJIRm14cVM4?=
 =?utf-8?B?a3ZMVzNNdHFjamJySzJpWTZWemZzZ0xHYWpuTGI0Q1R5dzZqcHNLR3dIc3Zv?=
 =?utf-8?B?WnZ4b0ZjcXpGRldENFVrWkV3RXlHckhiT1k4aVFCbnAyajBFbEZLMDRVdEdV?=
 =?utf-8?B?bGxuTk5lSi83b2tOY3lTYlZVbVJobjl5UkdIMmZuVUthNjFlVmo3ek9pUjR1?=
 =?utf-8?B?SjB5SE4zdE1RaVdQT1pYRzBBZldoNWt6Mm1RRWZiOEcyUk1NSUxEYzJYQWx3?=
 =?utf-8?B?YmhnSmV5SHd6ZXo1YngwWmVWSTk2UDF4d3BpeDJiNW9xMmQra2lMRXg2S2Uv?=
 =?utf-8?B?SHR0OU80Njc2cW1mU1FJeWExcllMU2ZWYTdpRlVkaEc3WlJZWlFqNXEwZnps?=
 =?utf-8?B?MlNEOHA1S1VsYkVYalEwWFAwemVYeVNXdXpEQzQ4dXUvT3BnZ3R6dXBjWXFi?=
 =?utf-8?B?NHNaUkJtYTZna0dkaFV0bDFXOTBldEJGdHRacW9odDBteTIxM1V1clJPbDRQ?=
 =?utf-8?B?MkpqMGVvVkZ5ckJnbUFPZkU5T1cvSGVZeFV3TXVyZFZSd3pvUytNS2c5R0tP?=
 =?utf-8?B?bVFsNytUUlRrT0Fwd2wxaE5BYm9XTmsrNWg1cFFqVDl6R3B4a0htaWx6Tmpt?=
 =?utf-8?B?NzErOERjYVhYMDNHTWU4UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5b24c5-c752-44e3-4ad1-08d9464dd322
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 22:30:32.0110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62qHDnwjNuLJy21df2DiYiycQZPEmkvBXs1KeqeYQflkl+WFEtTLBtLwXU1YCb0qJcXF2MsQufexqAnuqeBHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4574
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10044
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107130136
X-Proofpoint-GUID: n8P6LlzH9LLse7YmJexM4QDmAqIM_YLM
X-Proofpoint-ORIG-GUID: n8P6LlzH9LLse7YmJexM4QDmAqIM_YLM
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, jasowang@redhat.com,
 joe.jin@oracle.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/13/21 1:59 PM, Michael S. Tsirkin wrote:
> On Mon, Jul 12, 2021 at 04:58:09PM -0700, Dongli Zhang wrote:
>> I have just rebased the v2 patchset on top of most recent qemu to resend.
>>
>> This patch is to introduce the new HMP command to dump the MSI-X table/PBA.
>>
>> Here is the RFC v1:
>>
>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg04673.html__;!!ACWV5N9M2RV99hQ!a_4RXoxWC3ppSNDk4TFH5-UjOMa9DsHfWF3x814Yf6urzW3rxZrwhWCU2zTFVDD57lE$ 
>>
>> The idea was inspired by below discussion:
>>
>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html__;!!ACWV5N9M2RV99hQ!a_4RXoxWC3ppSNDk4TFH5-UjOMa9DsHfWF3x814Yf6urzW3rxZrwhWCU2zTFAnnr09M$ 
> 
> Fails build for microblaze:
> 
> /scm/qemu/build/../softmmu/qdev-monitor.c:1030: undefined reference to `msix_dump_info'
> collect2: error: ld returned 1 exit status
> [2525/8445] Compiling C object libqemu-microblaze-softmmu.fa.p/meson-generated_.._qapi_qapi-visit-misc-target.c.o
> 

I am so sorry for the build error. I will add below to the hw/pci/pci-stub.c.

void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
{
    monitor_printf(mon, "PCI devices not supported\n");
}

I will send out v3.


I should test for all arch instead of only x86_64-softmmu in the future.

Thank you very much!

Dongli Zhang


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9024247BD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 22:10:41 +0200 (CEST)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYDFP-0003Go-GE
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 16:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYDCm-0001ib-7H
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:07:57 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYDCk-00010U-0C
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:07:55 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196K6V6o025522; 
 Wed, 6 Oct 2021 20:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=7NuExPjOeZnIf85HEeMdPCCuN+AMdoCYz2hLYfqZGKA=;
 b=DzXAg3LQm+mbVavW4yHW4ROvi8NO1WCwVeC33vg6uVnjyW6S/1ZUggUbJGFxn9lhiwaS
 udq6fS22ju+EqItioEZMZV/Atp15M43e6ugxPSoOvbB1oHpy/xMhHntoLLS1yjQ+9+xM
 4sUqXMg28t5Z5lJGYIlTHU0erffDQ9alNhi76ksxnonvhu3qYl3TThWUSuOvqXdPSEwO
 06aiuZ0RrgFTxTCcl6Bq3zp+C9KW4QBTuYGArTqiB5XAga4ig8mpTOvaynmfzkJbw1j5
 g4ClVQ2G/P9jz4mcYM8aQqKZuCTHvWhrh77YJLWpLGw3BOtkD2vIFOiAKmzz+VFz1oj1 bA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bh3y5etu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Oct 2021 20:07:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 196K4joY164200;
 Wed, 6 Oct 2021 20:07:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3030.oracle.com with ESMTP id 3bf0s9498s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Oct 2021 20:07:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GacR6/OljqFW2uhUKnQ2lz6dnorhlBZhT0TcM+ouOWVW8pEsRN9KNTaxd5Zp4Fr6BuUyVuBUwRlzKPmJf9APAbiPLwPzBXQ9JYBJy0QqjFJKic2PxUdkRYhjEPNr5cTRdMXV11QVKMT5F5ctUdv1wbfxGo/EDWlrqNtGjvtIg3RI7qgTn7zCgZUvayHR8h527uTbdcHxWHo4kt6nN0AmFcLLb59LQCOQ2gu4dCelv+gHrupQdUUwwgvWi330FbMlg72eUmeo8mDbqPJavEfarUMmY5SSQc6apZ4STbQd2U9Dvx2AJ6eJag480u+LHqY9+gb836qocF7+76VlXkyBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NuExPjOeZnIf85HEeMdPCCuN+AMdoCYz2hLYfqZGKA=;
 b=GgHJzGUBjGPQ2s7jBehPuCH6cq1ZQ+YYwhnd9VqZ8nbauxKwrLD/bfz02D1rbfyFpSweqsPCKfxdyQjfV4byWoYtYlzKZTkK+EzwAXFN/J2JDV8BwZuAMIT9AbrZy2ralV10AINzcOYylrVJTOdJTMEXuTbuLw3qM51fCdFiNQOfKZONT4V32AnBejK+v5W/TTag8rOMB0a2EBzNr5HCJYHOvZvg4YWE0CfB4awr5+Jb6/Yzh1vqWs4Rh0q3g8JxYonuuy/Not6+qD8PfQLcxzSSdK6fmTucCnbqiIbOymDKML5xSAjc8c83YMD05TVmuDXgsqNsBEsEEoKN3b/UHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NuExPjOeZnIf85HEeMdPCCuN+AMdoCYz2hLYfqZGKA=;
 b=zATLhGBn4haLw5Krlg6Mf2/BE4bfp0PCVZQu13uOOC8rVwImq5mMblKxraRwfBIJbIX4zbTjwgdCTLfYpNKGZLaB2xp59dF1lrtEmxjizWFRPlmUSImqeeuS7tRKC/m0cbVmKrwmW5hq0LPey8uQuxFmnNOKTFg2ilYfGmB7Zcs=
Authentication-Results: twiddle.net; dkim=none (message not signed)
 header.d=none;twiddle.net; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2240.namprd10.prod.outlook.com (2603:10b6:301:34::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 20:07:46 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 20:07:46 +0000
Subject: Re: [PATCH] ACPI ERST: specification for ERST support
To: Ani Sinha <ani@anisinha.ca>
References: <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
 <20211006065808.1054102-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2110061229270.820442@anisinha-lenovo>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <abc8898c-9795-83df-3374-78267cfc09bf@oracle.com>
Date: Wed, 6 Oct 2021 15:07:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.22.394.2110061229270.820442@anisinha-lenovo>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend
 Transport; Wed, 6 Oct 2021 20:07:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df9ff59-1c6e-4d83-9085-08d98904f6e4
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2240:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2240A9A929ED1A85FD9FA13597B09@MWHPR1001MB2240.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FLDs0CZtgKE03l54RDMoDRZnxlaRqEgP7TzFASCt/Q3Fq+5TynyR2F6Sr7aqvEpEATPpR8oeEDBE6LOtG+U8vVM3yOpC2cE6i55t0d0Ah5MN+ePcZ+K6xqu3viEP8eJ/Ftf0KAUPyq/+PL3tXIbu2NPCdiXTZkxOAkLJbG757dhUVfJZ/MO6SmUjADtbVSgABvTEHZA+R+04BEAq38mEEk3jZ/QBRkzS9ZB220cIr1eFON08k8YN7BVLJCM+4ibFMNcYRU3hvsNAT6pYz8a4HoBuPigv5dTHR8iZMdRrCw8+uYgCg1Uh8l+7pwcvryK5/8EVTHmID3bJ0tS0PN/rhsgCVCB5KbwtDK4JpSw6Rg3pBBOwQl8hkiO+2G0zNfk4ACof7pn/roepb56ouVzGd/RvomTZAmy8BrS3q5rM2MU86j4Vy/BURaudIKfnKls9NhGoQ7Ccmm2+dXHXB3ez+d0G7QhB+ZlnqTQHelLD5+4/Jr8Geuw+kdUARaeMDHzwcbTLQS8Kp02MqHbijkJnTKkPNLIinSPJ2IM8qDWj9iNWrSc7Jafz+Tesb0cHu0WJaqdqaTAGC0fC6K9Vs7h0+NOzcKGFM9PuHWnMkEwle3boDhfYCx8fWvsPu/KHZNhD/f4rpg2zIYkilsYUfCaFxotK2zCu+Xr5L10s1+pQ8VWzDtP1kHfYXLmy3PBGywUnywnW55gtT2+HfLN0JwVn2nJ2cagSRTtxPq1UjnIZ0ZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(2616005)(5660300002)(508600001)(316002)(8676002)(4744005)(2906002)(38100700002)(6486002)(186003)(31696002)(66946007)(31686004)(66476007)(53546011)(66556008)(6916009)(86362001)(4326008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUFYTU5VVDhtMGtyTGRkcWxVMkhBb1RhTXZCNjA0aVFCcXg5NXhTTEZYd0Zx?=
 =?utf-8?B?R24wRCtsUVYxc0diMVMxTkUvQ2FpNkxmSyt3S1JpMUhQcHFNNVM1UU1Fbkdw?=
 =?utf-8?B?RENhOHFGY3NvdHJGajluSFNYZkRpbnZDVGs3N3ZTc3ZQZGpCSGNoUUVwWVB6?=
 =?utf-8?B?VWZVM0cvaUFqNGoyZ1NEeDVaNUh3dG9hRmxXaFRHVnloQVRuWUJjNHUvZWxW?=
 =?utf-8?B?T2xVS25kQ1gxRitNUnZ2UmdyNHI3RjhyTk12VjRpNURwV096MGh4bUFHOFU1?=
 =?utf-8?B?NHRlN2I1WGlydEJqdHYxQ1NiN1RvSkpYSmYyZ2RKOWR5bFF2Yzh4bHZIOFF6?=
 =?utf-8?B?enNwbFBIb1VqRHFlVHdWbjVQdUl6MFZBbk5uWTlOR01YbHhuUHgxRUNHSy9z?=
 =?utf-8?B?cWovZ2h0TDU5T3c2aXVBd1hhMzM1anpCcWdLV2wrTElzc0U1YXViTHJ5WjAz?=
 =?utf-8?B?b1lGMmU4RHloYjhTSnFUUU4xTnpoWXo5WGhQTXlLdVZxbXVvZ2c2andocXJK?=
 =?utf-8?B?dkYzRHh2OVRPMVlQYjhuK0liUFVRN29vSXpIMHQ2Z2prZHFoTHNZMGlXSnV6?=
 =?utf-8?B?d1FTYzN4TmFDUW15bWMxNGZGaFhUMVZtdktWeTI0ZGhka1l6OXMvclpmTmU2?=
 =?utf-8?B?dzVlTURRcnZ3aWJjS1RYVWIyYi9WVUkvejVKU2padE9ZY0xXZGRnVm1qZEZz?=
 =?utf-8?B?RDJxNlFYRnhVVnBkcVlzSW5GQWJxRGVHYWxTYWRXQVYwaFpXOU83dENxOWFH?=
 =?utf-8?B?eGEyM3pmOFVjS3g3bFhZalA2QXR3OTBIdUtEWjR0Y3JSM29oMXVJMkdnWnZB?=
 =?utf-8?B?L05xWEY2R3IwV1JyZDJ3dEUveTBhbWdqTEJzcXRPbmxkc0x6YTBXazVURHpQ?=
 =?utf-8?B?T08xdERETmIwUkxUV216MzBSZjhYckgrdjh0c3RheHBCd204ZWFEYWZtWTIx?=
 =?utf-8?B?cUhrVkRpRUc2cmhscnhtWGdpSWpSalozbG83c0RvZGMzOS9WaUdnYUVNVzV3?=
 =?utf-8?B?RFBScUNqSkhzdDBZeGphbVg0SDdRS1ZxeXByeTdpZUZtR1dsWitHdXZxdHBV?=
 =?utf-8?B?b3NrSHdqUHBNR2wyWlRXUDkyUlBwZUFVVlRiVmNvTElzUzRzSmxEZS9icEli?=
 =?utf-8?B?WUp1NVNuSjlab2ZyU0ZjOFhXbGduZUF6bnlVZVc0WTc1YTUxMGthaHdLOFZO?=
 =?utf-8?B?Uzd4SWFrblhzME1qQWF4bjJ5WEVPRGliWXRLNjlnVzRtNlV6UHBacTdMKzhJ?=
 =?utf-8?B?dzFmdVo2TmRXbk1rOXl2Nk5MOVB3REZBUlVQQkwzTTcyL1VxcnlTZjFVdjZt?=
 =?utf-8?B?d1pxaDZNQUFBWkY5UFNzcUJ4Wk9qNXhuR0t2QmRMejErMml1Vm55Sk5CSnpq?=
 =?utf-8?B?cjFyTXJUSElDQlZLVVErckVIQ2h3cDlFWHkvSllQMngyNG42TjVvUTQvNnJY?=
 =?utf-8?B?VitvM0lRcS9KMlVUOVhJTEpPU0RvVXBLY0lJeWJ5eEIxU1Y1Y3c5RmNnNmc5?=
 =?utf-8?B?OXZqNHNkQjBYMmZBamFpcVJJd3hyS0FkZG1SKzN3a1ZsQUlkUEZOMmZNUjZY?=
 =?utf-8?B?TEx3ZFRWSzNGUDBPL1dLZm9oS0wwQnN0M2JoVjAvWHpmVnk5NDc5QXdDVVNJ?=
 =?utf-8?B?dFo1Q3ZaeG9aVjdrOUNuUlFiNjNPaE5DaDUyRnFKS1lUVGd5M1p5U2cvM3Nx?=
 =?utf-8?B?dXNXdlVJNE1JSExNTUNTUlN5N1Z2Rm5TbVNBTGRSaEhPYzNRRm5nSmlGM3B2?=
 =?utf-8?B?MUorM3F2U3FzcTVVL05GZTVhMzM4eG11blg3eHEzci9kVDdGU0FlVWRxMXlR?=
 =?utf-8?B?VjQxV2MwSG83T1ExOFA3UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df9ff59-1c6e-4d83-9085-08d98904f6e4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 20:07:46.5949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNc0aRcl3txN7MPjbcVPiauU/4hS3KD/Hvq4SBA64qqlJyDiqXSCCiDpDbEF0ad1GrSdp2HxPXR5ba33+MHBrs/6rljPgwSA5jURskF8t48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2240
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10129
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=924 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110060125
X-Proofpoint-GUID: 78ZH2WoneL5HdSqRmwWpgUNwB4JMgJdo
X-Proofpoint-ORIG-GUID: 78ZH2WoneL5HdSqRmwWpgUNwB4JMgJdo
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/6/21 2:00 AM, Ani Sinha wrote:
> 
> 
> On Wed, 6 Oct 2021, Ani Sinha wrote:
> 
>> From: Eric DeVolder <eric.devolder@oracle.com>
>>
>>> ---
>>> docs/specs/acpi_erst.txt | 147 +++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 147 insertions(+)
>>> create mode 100644 docs/specs/acpi_erst.txt
>>>
> 
> OK it did not come out the way I wanted. But
> 
> Acked-by: Ani Sinha <ani@anisinha.ca>
> 
thank you!
eric


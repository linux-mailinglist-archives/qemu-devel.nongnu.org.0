Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704BF46D8A6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 17:39:28 +0100 (CET)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muzyZ-0001dN-3D
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 11:39:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1muzxO-0000bM-Mj
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:38:14 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1muzxM-00089Z-HJ
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:38:14 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8F9VpS025161; 
 Wed, 8 Dec 2021 16:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=PZoJbiL17UyqmIsz5PnmhToZ/SDrqqIHoUtylFFqnvQ=;
 b=IMZ1bnInn3eL5h0n4uq8Kb7T8Cn47+bAaYqOwVO5fCuG9+SyoKD+Z8kERybyoQgKbBU6
 2eYj2t1QaD9u3B7wUr4JrIlyVxwwtWQh44avoFusq4fPoGgZGYmUXG0d3U5roPQGJlf7
 dWmtc9PPsi7sZknZfhIp+KDALeC/ErBD01j20kSFSW/k0c2hAukUJ4f+Psf5aUrLCMbf
 Nm2JhsYhBnMB8bpyt+bvNokWaiCDK40O2SY0kgdIkVVkzG88j6INAA3fsU4BBim+UBRI
 3TAOfhXeuZDW5nR9LTsErp1poSZtp9JPaUNcFWUlOHMYtfWJE7ltPdVj9ZzIUhKzw2G5 8g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctrj2s8f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Dec 2021 16:38:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B8GLHQb041477;
 Wed, 8 Dec 2021 16:38:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3030.oracle.com with ESMTP id 3cqwf0p1bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Dec 2021 16:38:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hha/YjqEkRaVHCU7H655BwZpnkgliLGuQJvk/NfX7S3lIF34Jfq2dcneVQRzPKEhgcYIUk1U7FAPUS4q8TkbB27pi1GTdERyVAjG20rsjEPsDGsI+UdMARJqUQrrVStVdiELPlYevi54sqTlAH4M6bHywX+5y7Blt9hzxFEInB0IjFj7x7kLoGaw74Pnlule8onK3kuWBxH0o9XnesMXdUGDhBNVoxqp8EEp57aI40a0ZWUBrDaOmp8PvYfchQI8P+KjYeOjhVqrxQqMWsGXdg4o5g21Qc710PYShHmgBFR2Lch0AxhRAXNqSfiQ4KMwjl56i5in+Wh7HyjnqCK68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZoJbiL17UyqmIsz5PnmhToZ/SDrqqIHoUtylFFqnvQ=;
 b=m/Bq2vXVO5CQgKhwKIzbZTRu1WgnH/vtIporkiAeePII7YhUeM0SlNQ1DOVG14yUdmO2ztCVQ3PhrjsAigfFU5+IpDmy75mjcE9BHXuUIQHWHZSTJXP14SxY+wOygA9CTrUw9Bv5++BEVxEf+Tv4tgx2grw/e1gz0s7ZYX7SudNu7+ifuaNPsn1SBZ3gRjYFyxsmxuATli1sS3IHkDKSBW2jXUsfL5VzFd5ZBUDHgF0wJrRt2KW+V8UQ4TpPd7X8ajNtKvqOd/k3AGAfavFJxHsinolTRGokBpXVcTwKp1A2K5/TcX+jgT74mUzA0w4OV8ogr/LeneBj5d41ZET/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZoJbiL17UyqmIsz5PnmhToZ/SDrqqIHoUtylFFqnvQ=;
 b=hReW+9pU5x0qxJ6tFkg6CRw257xZUrKBt99tVGLFHmEYpK2vKK9ZSCobFwoSVSWlC1yke/FNKfx5V8idRhcfpQ4qOyi+tWl+0I+7hOZcQ2ggmRm/oQ6FBcBB1VM+oNM+NJSZ8d3y9jAoqKI8wSfRG9HYSn2WyNZB0uZOO5L0Jg0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1391.namprd10.prod.outlook.com (2603:10b6:300:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 16:38:05 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 16:38:05 +0000
Message-ID: <af8dc304-ec4d-8c0f-696a-b00a72bd1764@oracle.com>
Date: Wed, 8 Dec 2021 10:38:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 05/10] ACPI ERST: support for ACPI ERST feature
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-6-git-send-email-eric.devolder@oracle.com>
 <CAARzgwyrfW8Dy_fow7nOr9nF9XTLazidiTqn9itPmoOZpMxu-Q@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwyrfW8Dy_fow7nOr9nF9XTLazidiTqn9itPmoOZpMxu-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0054.namprd08.prod.outlook.com
 (2603:10b6:a03:117::31) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BYAPR08CA0054.namprd08.prod.outlook.com
 (2603:10b6:a03:117::31) with Microsoft SMTP Server (version=TLS1_2, cipher=)
 via Frontend Transport; Wed, 8 Dec 2021 16:38:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f40631-38ef-41f8-cd72-08d9ba691bbd
X-MS-TrafficTypeDiagnostic: MWHPR10MB1391:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB13918C7F08CAE4B60DC75F5A976F9@MWHPR10MB1391.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3fHout+jp/Usb0rpzY8vUG7ASyoJM8LjkoRh52SshcVRFyqrn31vgXYtha6IwlaAzKaKp+YKtXcUT41p8mQ/SLgE3P/IktcMrI/1Geh6R5ZZiUBvu1VURoM3quFHUXHgWapPg28wXl1sg0otGCLkWYfiNbG6PH2zGGmvRySqqPtZz1mlWPTLWpfogyFeKvbUfGE2+GxtKr/b68en3wxNOlZ3BhlYpBig00fxup1+M80ZzIzzZfI4lmbymxwQXJYoPfdp6uh0hyYYCTIHEiIKh3Tnf7sxGGGOH53FzHdOA8PazP+uXHRH/cZAP+bpqD8tgC1C6Psufp7wkEpNvFcayFcUOv6MlN/KtUVUUh7o1s2Ek6oCFff8AJxtmcBPZl3julG54S2MU3VhjLFe5X3UROle2n0jbLfGZcQdLpUxaAn8UP22amY0LZ/yIjYOJCYvbl1ajquoAhHx13W012Y0wUV6E1/r2n96SLbD7zGfYMbB0szLM7sgLClx/FK1eI/bV8p8nXDNDelfnVGpAdA3hsFsytc1L7uXslLblpTAbvu6qjdPVfzfmS4rORoJx7pEvghepWFI71/wUsRrJtNG0zvi2AcJDsyhegQjzWaEPRbKImcYCOV/bunk3ZEjzU+9ERsTNLqD/ztf/9yNUOE/uEGaOVC0J+WZJceYo/Q5+7hOpKFSZTsGSDb9LUCRAxcomJFaLF6Wjye8UfkCYWr+zhZF6/LDIaO9JKC8vZWgw2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(4326008)(2906002)(316002)(31686004)(186003)(4744005)(86362001)(6916009)(508600001)(6486002)(36756003)(38100700002)(66476007)(31696002)(8676002)(66556008)(5660300002)(8936002)(66946007)(53546011)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW05L1Y5cHJPUmFzMlJlYXhTL3p4WHcxUHU0Z05GdU1PbTR3dFExZjFzcHpX?=
 =?utf-8?B?MkpWT0g3YmpxMURsKytNVlVnS2tCaFJaRzRXVnRZSW9UWG1kaUxSc3AvNU5H?=
 =?utf-8?B?UjBtK25XS01Xb2l5ZXBoSWt0emlJbnFHVnB1NlU0T2haUDdpY1JpZGl3QzBy?=
 =?utf-8?B?dDhYOEJTOGRtQjN0enA5Vm9uL0dSOUQwMDI0Q01CWUEzc0pGVWI4VFowNEl6?=
 =?utf-8?B?OG5QeTc3ZW9jOHBLWVNjTjdGSVdmakMwRWVzMHNjeUJDdUE1ZHlZRFJmMmZY?=
 =?utf-8?B?RGFjZHh4Y0ZsMDJSVkYyUkIvRTgyUHFnSkdSRHZBN3ljSnk1WHJCMFdjYUVs?=
 =?utf-8?B?aTdFZTdlaEl1dmZiSDhjVE1iM0tMcktIVkJYSmJBMG56TmxyeEVjYjFyQWdq?=
 =?utf-8?B?L2dVZEIyQWtXZWpDN0tyQVZVek1mNW5CK0szaFZZVmZhOHlsSk9xamlxTTRO?=
 =?utf-8?B?TC9mT1l1SlpEZHRhUFdXbDVJUW5qQ3lRSis3Q1JXZ1dsdkkrcjJBS0h0S0Js?=
 =?utf-8?B?QmRIbjY2bFJuN1NWcm9pN21SL1pMKzRQQ204S0tSbXFQZDNRcVlFa0M1UFhu?=
 =?utf-8?B?bjY3Yi81ZUI1azZBZTJvQk56Sk1saGNWQ2FZMHU3QWFKRzRmMWd2VzNnS2Jp?=
 =?utf-8?B?SUpZTksrM1NEVEFoU2xWc2tSNERPcHNJR2x0Wk5jNFhFdjU0dzNOelozNGFI?=
 =?utf-8?B?c2lNUjI0ck9PbURCVXpON1l0QW5nUzJFd0lvelozd1d4a2JldE9raVVLQ1JR?=
 =?utf-8?B?SkRybmhFT3dsbEJLaUF1dU11U1lvZ2N2Y2ZXZXlrb0xJeVNSTWpad3JOblBR?=
 =?utf-8?B?N1RJaFo4d0wvenN0SlF0L0p6Z2I5Nk5NVEZRV3ZSYU4zQ08rOWs4bHNTVGZz?=
 =?utf-8?B?dXc0U1p1MnNBWXVobGVGYVZmbDNDRjNFcTNwRGhYQWYyeDNEckVmNmJta0VW?=
 =?utf-8?B?WUpOZ2IrcWRnTjdwcWU5QStPK2hKbFd3ZmVRdVhHNFNyU09CVWJ1VlZhTHFE?=
 =?utf-8?B?cktQb0dYUGU4SWVFSWN0WGszR0pzNkJDTEc3NjZMaTczcWVtQVBHSXphcFlq?=
 =?utf-8?B?TE1XTThLMGhVcmJraUFlbkZHbzhnYThWQ2c1OVVvdyt1S2lLbzE4L3Vzeldi?=
 =?utf-8?B?ZnZPdVliZE11dG1zTVkySkkxbVhrWFBWZ21mVVVVQW9qS1FHcklaQS9vMEdT?=
 =?utf-8?B?M3lycU9aU3pXM0ZJejBjN2FZbWZ4VFZKYURZTTRkbWZMa3AraVhwVE1NbWFm?=
 =?utf-8?B?Q2k0U0o3UFI5MGg5OWE2eHZuZ2drZGxmYUMweHpROFVydFdVendWWFlCVDF6?=
 =?utf-8?B?QWZ6T0Y0RG9jVUJYSU81bXNiMGRkWUptaVZOUTJDRXdpVEVSMEt6aGkxUHli?=
 =?utf-8?B?OFVvYnR0VVhOS2ZscTJXNEFDN3YzTEprUVhieUJCNUpFM3JoWGFyU2FaUy81?=
 =?utf-8?B?bUVzYWhOY2h0UHlKTjJxa2l5OVJBRmpMZGhwS050RHlBVlJXOHl0VW5Tc29q?=
 =?utf-8?B?ZUFDck9TYnRsS3Q1QW1IcEZoOS8yNXFpaXppSHRscWdnaTZqa2JXdTdkbU1t?=
 =?utf-8?B?N3RLbTR3RzhhVFA2b2tUY1VGWFNkclNwZE5tb3dUOW9OelhaM1Z1RjVKNlFX?=
 =?utf-8?B?UmNEM1lMdXBKbEpFUTd3MWRwaFpXU2NQdDB5UVRtMVkwZ1NyRzdjeFo1c3lG?=
 =?utf-8?B?ZEM4Mk9rdGdWUFFabWx3bGw1a3lIZzZ1RTlLTSsrdDdSMGtTTFpQdVhrazFs?=
 =?utf-8?B?a1ZxZEZjNHU1YnJmZnBFSzdUVnQ5RzE3Z05OSEx2dlNGb3JxajRZc2RyUS9R?=
 =?utf-8?B?TERERk9XTlh5eXNQakRSOVVjY3N3NVFXbE9Dd0h4UTY4amlEU09lZXNqdTQ4?=
 =?utf-8?B?ejBuaXgvRFVFRGtYbTVZSm9zaXBsL1hCRkd2UTBMYzBsRlJQMWJVY3Yyb1B6?=
 =?utf-8?B?L2g5N3N6QXJDYnFEVEJVMWsyMVVBcG1MdFVTNkVZQmRiVFJHTVN0SlhCV3g5?=
 =?utf-8?B?S2traGpHQm5rOHRzL3M0QUVwNERQUjNpWFJRVDRlZjZYbFg2T3JaZXRQUEdS?=
 =?utf-8?B?aFlPNjVtMlJnWkxSaXZtcHdvMXFIKy9yVm5nelBMZ1dkQlpHU0tyT2Njc1lV?=
 =?utf-8?B?Q2hJdjFFbDR0UUt1RFhkMW80ajh6OU93MHFwc1djSXprVldOSTNsaGt6NFhW?=
 =?utf-8?B?RHQ2azhOeHdWQStaeXd3QlE1Z203UU5Wd01pUFFGSEtrak8wSzBQVnZxeitO?=
 =?utf-8?B?SStsbHJadFdhcmNBY1kwMEVhQjdLNzF6NUNubktlNEJHODFzcVdKMWFPaGlx?=
 =?utf-8?Q?8rUQvVM3825VYS3irS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f40631-38ef-41f8-cd72-08d9ba691bbd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 16:38:05.2828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bq7o2Q8IkXUbsjkflKkLmkQ/LtYgAscfiPu3AEiBoD9r8eqQCKff5hh4QQE0wiDxUJk/2bDzOq12knEUInGzDikFqLfn2ku+VkNYj2tiBpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1391
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10192
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080097
X-Proofpoint-ORIG-GUID: ZMfVJ5O5ML_R62E8TPCutooAJO1KgGKK
X-Proofpoint-GUID: ZMfVJ5O5ML_R62E8TPCutooAJO1KgGKK
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/6/21 02:14, Ani Sinha wrote:
> On Fri, Dec 3, 2021 at 12:39 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> This implements a PCI device for ACPI ERST. This implements the
>> non-NVRAM "mode" of operation for ERST as it is supported by
>> Linux and Windows.
> 
> OK sent some more comments. It will take another pass for me to fully
> review this.
> 

Hi Ani, thank you for reviewing. I have incorporated your feedback thus far.
I have v10 ready to go but not sure if your review of v9 is completed yet?
Thanks!
eric


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BD568E29F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:06:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPV8n-00087T-PV; Tue, 07 Feb 2023 16:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPV8l-00087H-MR
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:04:35 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPV8j-0000yx-LP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:04:35 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317KSXEc010223; Tue, 7 Feb 2023 21:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=GMAkum25A/1fMw8TiAolscjmd80YfB4WOJxP80S8lMY=;
 b=HZRAWTmuHpN833/RXd6UdiPs09aGXXWdPlzEggnPNSMHirv1Abagpnyhq3WVTpEygn+6
 cu/ElktOrXh9vzPX9IIYi+6eRwhxKXgsMf1suleHW5CQPBtvNfDwa3y+0fk/vmdC3/3Z
 PaL4Zp9X/vXA/6h1Qc/8FKZmeMkO7K4bGahl8D89ZPnKeq7UxhWUg+e5vRkspmVsWjCQ
 uxaGDk/H2b064F0biX5qFvsSNBv+sQfoGHmjYiASjArEmVQPADZaWnw63Wnwx0Bu03jd
 B6qxkGgte8F2HPcFDdYpXX2ZSqs8RTuQcx5IGXn9vHVZHpxXliXMCCqC+v9uUvO9crUr jw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhe53eqcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 21:04:31 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317JYbJx028686; Tue, 7 Feb 2023 21:04:30 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtd9hhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 21:04:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4/zU9Ab/4dLlS7RvjQihFOZBH4Y9L96ODbGcXQ6yrYGRgIpLZQj16EWgWt9ixGnIyUKSjcRJesNhT04XqfciD+QHrtn/rE43pMakHNLtJmDcDl8SGw5l7jvM4ru3hPzFXseeLxzzs7VDgYQQU/CIdmE2+sQmAhp3ZT8imFtU09A4MFk12SBFdAK5REf4M73MbW3mcojhfCYkMLDU44W7DPm5r02dccwvajxDOtaeoRE3IuCF5XRHYwsHbnk21Rfp1w0UwkXTGbw/VttbrWbOuq1S3AeN7z0ggr2dzdc4BW+cE0cD4PqJs97VPGFeqUpPducsu0adTO1PPk+mcnEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMAkum25A/1fMw8TiAolscjmd80YfB4WOJxP80S8lMY=;
 b=JQthwfDcEeU/1yZrR2YPpLDRPyTT1XvkE9R/ba59cF48BI4iCdvN2++ruH3f9DGA5IVimuasp7zmPxFCzuzJYrl83Fu4AzOTI44MDzUhO7c1oIXPxcTqWJtlLGCdAbCa9iOVJDOj/9Iv9KRDJx3fV0oZIjcYt9gnT/I9bej4DB4nTomvyHWVeORHRuBSXhcfpJqen/Zp9ckQmQUb7s8hCySIBiXclvCtMHTZrkOq25tZs4T0iVWPtr2Szc3x7HB7X61/dKxosMZ4OyQAKamAMsl7KI3sHXAtSheec2kHV/mlXpCwZa9Ts8Kfv0E/JtruuBvF02wSr0P8pFlrVBVfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMAkum25A/1fMw8TiAolscjmd80YfB4WOJxP80S8lMY=;
 b=G8OzL5lD3ZrSlYUup7Rj9A2kJC4YrGVvqO0dRAT34GkEzkzvSGs54PtKjMw8lnY0vs5uKnuYciwMh5WbeC58sSSpaHiX64NJGsKgM5O/h36F0NiDjDajo/UTOACWnxN2GCO+b15dm7vR+ed+80gBYlX81a1CVtgOYm/wNzFOJZk=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by BY5PR10MB4178.namprd10.prod.outlook.com (2603:10b6:a03:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.15; Tue, 7 Feb
 2023 21:04:28 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.016; Tue, 7 Feb 2023
 21:04:28 +0000
Message-ID: <020941fe-f01f-ed97-6fd1-9ad217c698eb@oracle.com>
Date: Tue, 7 Feb 2023 16:04:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2] python/machine: QEMUMachine reopen_qmp_connection
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org
References: <1675796605-235646-1-git-send-email-steven.sistare@oracle.com>
 <CAFn=p-ZCA42VAMEkg8xQeTQBTMqn1AA7RjptkWD72uwBX+iKPA@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAFn=p-ZCA42VAMEkg8xQeTQBTMqn1AA7RjptkWD72uwBX+iKPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::28) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|BY5PR10MB4178:EE_
X-MS-Office365-Filtering-Correlation-Id: a34b9277-f45a-40a2-1f04-08db094ee693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bRWccSpKaokgYxKqn1VI4asbVYks+DaXCSxQyMoNeh+3psTmbRBADXsQj1shZClo0dBMCuXyu7aXbSfJq60zScXRDAJwh7TyYmeVwIo3spXFAi50kC7ppTQrhidH3gSLxDKpapgNsSwzvrHaku5OxL56EpQdqawQrWj0aoXrPtOIQ4ZKXxkPfHJBM3FzaHzfzSfj/cn1SuUMMHh30XXtmRiPUY+fzBTxCbaBK8Rd6tUWaVvoDVGkvRQaqIcxr9FbpXjYH1oOsxV5EdlLH9zfSJnLE1R8mscdYFUmfErhJ/kVaC2cnBaCCC5h/JNgJbXF1E+KNUDwCRg65pKezawRwX0S/9hSX1ACyz9TR/xjfPXqxbALsZWdWnaUCbhmxqEze5gcwJeL4XjwvOeBgt1iaj+dqw7Db+QZs/jtQSZPxLgIBeAnJ9k9KZXIeJiFlhzFJnsMM5vS2MG/iyqEXwVIcNXgXOsfeZ1MvYfZhEwg6WvP43NqT4aqbMXOOasXWdPeyoYtrbq7NES93l534KeaX9xzN1AXv/ld31pO/YvqPbDL5MEDev8iPIDSAHgdjO7muR3RF38bnSsTqatCj7OxYHaA/uEZt01jBbePxkc2He7U+S9n8m1ISgGI9o4yexwPmWJu0hBg8JwJQ97LaYGaM5jnGeHg6wHIKAaVswwDgTKxsX6W6QLiCjhIPx+aEzRopv3TMdujtQUwzpkoWP5uh26O6YMY3jMlyot584FBBqkEekBN7nHATh07jtaXypGDgkuQ2WAaXXG8W+JR7MPAOuoYkmBTag0jnxWwY60850U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199018)(36756003)(38100700002)(31696002)(86362001)(66476007)(66946007)(5660300002)(66556008)(8936002)(4326008)(8676002)(41300700001)(6916009)(316002)(2906002)(6486002)(44832011)(83380400001)(478600001)(2616005)(53546011)(26005)(6512007)(36916002)(6506007)(186003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEhDRVFjeXlENjRBcnZtR0ZkTVZscHBVdGc2VjNNYlMwRFZSTDVQSWpFcmox?=
 =?utf-8?B?dUhlekVDd0dXT2VuVHBxL0RmKzd4OFNLdkRjRzlldmhTRE05eVdPRGErNXo1?=
 =?utf-8?B?dk96S3VMU2FZbmM5Y1FtOGdhRFozUUc4ZWhvR1VDSVpCVWdDc2ZYemlhc0sw?=
 =?utf-8?B?YjhFL0gzcHE0R0crdHRlUlVuM01Nbm5VTHVTemIxOFpjTCtiUmJITUdPWHpa?=
 =?utf-8?B?dmVmaVc2K0crQmN4aTNrVFZmZ1B1cTFSZlpGeVIwY3NIclhBZFFGdGQ1c0FY?=
 =?utf-8?B?dGk4YkdoVHpMeG56NWFzcVNYYno5ajFyODlQWTlzNlFmdUE3a2xVVTFrWHpE?=
 =?utf-8?B?RjYzSUFkS1M2ZTI5YWU5aGd0KzZrbTgxMW5pak9zQXNKVmdDRXdjMC9WMElx?=
 =?utf-8?B?cG0xVDNWbGpnUkpPTnd6b3VpZmtjcDBHb3F1ZDBnRFBZYnlQTlBLSk5LeEph?=
 =?utf-8?B?SzBKRnZETGF4dzBiWTRnSEdkdTJaa05oaE0rbTZxdWd4MFMzN1BiYW91bjNo?=
 =?utf-8?B?MmRNQnVlLzdTLzdwYmM4VU1EelQ1dm9RaVJ0SUNhOEx2RksvNi96NVFnZHFl?=
 =?utf-8?B?QjVsKzlVMXFiT2QrTjN0ZCtWSU1aQjhFRXJhTUVBS2lLMmFkNzRsdDBlMjhu?=
 =?utf-8?B?S21TdGxnWUIvYUJ3SVVvdmloNmxqRE9GV1BQRmI4TmJITjlnbnV5TXBzaVVF?=
 =?utf-8?B?S2VBMFB4VnNiMkxOZzBOVWVIRFVDSzY3ZHdCejBEU0Z5WUNNQTV1bnU4d2RT?=
 =?utf-8?B?YXFmeWZiZnB6NitNSGRWS1E0aHk3NWZzWXZnSGVoeVlHc0YrM1J1Qjk3UjhK?=
 =?utf-8?B?NldXRnNoSGd5eHdYVzdaT0Q0bTVuT0k1OUU5Q2taRG13RVlOVWJXbzJ0WE9M?=
 =?utf-8?B?eVZZcjlaemdBeUhhYVR3VC93OG53NkNQamtDKzZtV0RzbGQvVUp2UG9NVVlv?=
 =?utf-8?B?dWZzL0FhWkM4dU44bXZ5bDlDbzhiM1MybU1nYXF3WVVPUjZSZkxRcU5RbWFp?=
 =?utf-8?B?cnNIUUJvbzYwL0JQRXdVaW1OYUhnN284Rjg2QVBndElVNmpKYlRmU0ppcURG?=
 =?utf-8?B?cTlYVDg3NDZyNzhYS0pISnNQaGJkeGowUGtGSFlJQXBraWlSdWdaU2JkQjdZ?=
 =?utf-8?B?dHI5NHVDTHpiZkErcmZtYmxQcEF0Zlk4RGxiL2VmNFFob080V1kwcHc0K1VL?=
 =?utf-8?B?bWpGelg5R0JaSDN3SEV6MC90RCtraXBCQVNMNUVDV1VyM2tZQWxYT0lWTGxt?=
 =?utf-8?B?L2pmMWt0ZnY4bXpEKzk1TVJxcTRZOXMyMFFZcG9IbHNUZHZNYVRFQStJaVFE?=
 =?utf-8?B?UkZiWHJwMEE3bEQ5cWxEYXovMmg4ek9yVkhoMktjbi9uSFR0KzhFQjRKNENi?=
 =?utf-8?B?U2s4bGphdno1RmZXWmhNWk8zUHhyZFRqNU1Jb1RhTjdRbXAwdUIxL2dqOEFC?=
 =?utf-8?B?cFQxV1R4MVJDWUUyZHJzckJVM05XdzZ3cmw2RTZuR1ZlMHV1NlpwdDFkWVFv?=
 =?utf-8?B?NkRRQlRLWVFPN0NhRkJlWWFSR1YyVDlPUjhBeVE3T2dwczdEMWV3dUN3Vloy?=
 =?utf-8?B?dUJTRkJ4OEJZZCtETUlhd2NnbWduWEZWMDM5NFhXcU1RZmlmL1ovUUdYc3B4?=
 =?utf-8?B?SVlVZitWcEZEQjlMK3duR21RYUIrTThsSTdmUTFvUEV4cFNpRFM3L0Zjdm9U?=
 =?utf-8?B?S3h1ZDlTcUNBd3RndnNXV21MZEJIdHlJSTJ2czJsZDk4WWdkeVNLUlF5c1Vo?=
 =?utf-8?B?djhFVSs0dGE2bnJzaWJqNkRFK0FZOHBRSDhyc01tcEF4Sjdobzc1V0lQREdy?=
 =?utf-8?B?K3ZxMmE4dWFuWDY4L1RIL3FpdGh6SDBUaEZZaFhCa2IyUjZ0R0JvTzdNZXVH?=
 =?utf-8?B?b2JtNkhLUkxRcXYvYWozMGhwRk80QmJVMjNIRXVOQlhmT0RPVC9zTEpIdHpT?=
 =?utf-8?B?eHFhdnlnN3dXUHdFTWwvNmExcGd1S2s2K29ndThrVndYTG1aT1d1ajNSZjlk?=
 =?utf-8?B?UlFaVGhTWmx5c3VVM3F3Ni93VnFxWjE2eENxZlhVT3ozOVNoNGc3cFdmRWtO?=
 =?utf-8?B?VENsd2pkVzFKVktlWFkxR3IvMTY5ZjBoYUoyZHFLNDlUUFZKYktZY016c085?=
 =?utf-8?B?di8xUFhPVTdlZ0J0K3d5YS9HWGNWeVFSTHRLQkZmUlMrRlVRS1RPUmJValRU?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: SBFMAgE/i2zRpy07XyaG6Dxh7OGId69G04onXwLownozW5bWkgdD1EF+z0Mchqh5678qVaui7q/wQKg3/R7CovDNv2FB1vwh5h3rVmuppD6y6DIe5HImGubBC0v6EQ03ALKg2zTWZaUyLQLO/Om9b8IwUCXthkUr7TaNamsB7O11JtR9BBa+3EFQF6eOEV7bCi9cM2y6pZvcoYUlU9Q+Mt990ZNKQgdctFFEqSsvhwJszGh3P6RyIzHLpfXhaQbZWg1NA9hcrbQJC5RoLPGtYlvqLsZWA06/kSp3F4v4ZfXEr7VZInvBAYelMGlzxfVa7JDDilkMzsRhR4LtDZsEzPjhpeKjINfNYagn6xrloOsyyxqMkMEwZQGwjFKq2yJO1i1cn9Ogz0N1tLJ38MCOwbJAFSgJJm1G17o5EVMBDH4gH5zeGCVYzYq15hPTbPc6Vh6yZQhs2kkM3yIur4B3s/HsB6GNOAi24S6sgpWborkgfbbNrmY7UBedU12EIRjlVgP5rkUg2ge0kotr8q2y4rKdypYkEHVpE3xkSS5muq1ihCYlrmrd1LY5rKUdr2cO9QJ0j/qD2kIl4juaNv9VdKYIGeRpJ/b3K60MX+LpP7GkPgtfYV432xCTJoVSMFahV5TMrKWfAsC7lJohIQe3oZ3zJ1AwRTtjefbkVAzcSMQh12vEJNbx+48cmGTla/dLRFF67Tre596X8WDz/yiX2dX30jMNCXSJswcb0t0yJeRP9IzGkZHa7alBeMtCogabJqJEmjdsRstzrXXXvFhPdg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34b9277-f45a-40a2-1f04-08db094ee693
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 21:04:28.4963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qG06/g1a+w5Zds2MAyU6dNCFUWHBJT3hO+x/LDg0194I3DHnYcuLSrayi9qIiBTBKUj2aQ2ZouPW4O4EFh/L1NYhFKfq92Mhexuhn34m8yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_13,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070182
X-Proofpoint-ORIG-GUID: fSHyBRP7d_Ebp6VoyJ2I5B9p07jLNsYR
X-Proofpoint-GUID: fSHyBRP7d_Ebp6VoyJ2I5B9p07jLNsYR
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/7/2023 3:28 PM, John Snow wrote:
> On Tue, Feb 7, 2023 at 2:03 PM Steve Sistare <steven.sistare@oracle.com> wrote:
>>
>> Provide reopen_qmp_connection() to reopen a closed monitor connection.
>> This will be needed by cpr, because qemu exec closes the monitor socket.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> Reviewed-by: John Snow <jsnow@redhat.com>
>> ---
>>  python/qemu/machine/machine.py | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
>> index ef94dcf..557209a 100644
>> --- a/python/qemu/machine/machine.py
>> +++ b/python/qemu/machine/machine.py
>> @@ -501,6 +501,16 @@ def _close_qmp_connection(self) -> None:
>>          finally:
>>              self._qmp_connection = None
>>
>> +    def reopen_qmp_connection(self) -> None:
>> +        """Close and re-open the QMP connection."""
>> +        self._close_qmp_connection()
>> +        self._qmp_connection = QEMUMonitorProtocol(
>> +            self._monitor_address,
>> +            server=True,
>> +            nickname=self._name
>> +        )
>> +        self._qmp.accept(self._qmp_timer)
>> +
>>      def _early_cleanup(self) -> None:
>>          """
>>          Perform any cleanup that needs to happen before the VM exits.
>> --
>> 1.8.3.1
>>
> 
> This code is still mechanically fine as far as I can tell, but I lost
> the plot on why it's needed - Can you please elaborate for me on what
> you mean by "qemu exec will close the socket"?
> 
> (R-B still stands, but since I am rewriting machine.py to be natively
> async, I should be aware of your new use case.)

Sure, thanks for asking.

During cpr (aka live update), the old qemu process directly execv's the new
qemu binary.  The monitor socket fd is marked cloexec, so the kernel closes it
during execv.

- Steve


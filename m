Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB796FE140
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:11:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlRK-0004Yk-Jn; Wed, 10 May 2023 11:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pwlRE-0004PU-66; Wed, 10 May 2023 11:09:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pwlRA-0001sr-Sf; Wed, 10 May 2023 11:09:07 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34ADwvJY016215; Wed, 10 May 2023 15:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=3ZefwL3Febft5uu0BywFTlk0V3xz0Umc+JUo0NwWSRQ=;
 b=Ebjmi6x7nGR1e4NKrTnJ0QIS7V5KLnUDA+AUv9ob4jDcLoqFkQOZxxPpkqfgtbc94X8S
 EVSA7EYGM7oLSIgCem0pmof6vlLvNSBV6HlgjBK9rEtRnbupNBcGWtxV7L+iMdRAU90B
 pDX8QHIYra7mZUi7leZivwreE+FaRBmGB+juDdDxwJjppfIIDRcUxVyBO8YYosT+UgFI
 qVlziSEb7ys8IUTNDygI2h3s4Xepl7hCzCv0vkmJcOFSCewH/JVQyBo11RAtA6XX3hnB
 yWAakIfWpiJLxrzKEEXzfOeUhOATIRE7LsKXMBkD/nRnjFArLvpy997uoy0A206q6TP0 +g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qf7774vr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 15:08:57 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 34AEwaxu024174; Wed, 10 May 2023 15:08:57 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3qf7y5eh9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 15:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaYRxNUoC+qk4v0XGtTfKJRL21uxm5PghHB6ssDZn/nL3EL7tBeUwdhhKFkkEkNilRzx83BqCR8y6cci4anzsDpynRDJTApcBVRQ00f2044zSU9/4XYCjJSp00zv4eXA4y9ewEchgNvrTQ9MICH2QkKypy1g8EKitJeaZj7ZnPccBDLwPAVwipGcpwSGN9ZSCiMdc17iM01AS8YynHFPp/jFeoKxMaxnpligepT1E9QY44AQAn+ZPW8nvPgVxgf85shhvsAVDc0liJB08RJT0oBUI9Ko6D/rs3PhiqNUhYAO4wcS37Ln3SV2sTde75DdSKEsMLfwICIGwRFCuWqzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZefwL3Febft5uu0BywFTlk0V3xz0Umc+JUo0NwWSRQ=;
 b=LL9/QtT2CdMzMpac9+eGim4hJEgVQ1N6gkp9R3BrHmuUds4FW5FcdrzGKZGJQmjdAMwUaoWW0ffjr9tQXUEQlWBrnkLoQo0Ifg8jzaoesQlzfsDrCgESRwvPz8/B8t9GQR1Ye6aBYinSZvv+k3cV+mNtQv/bRL2cVpFc+VKsm5ZXDB3SVYQQ6M0FMlU1DPgKpr6/FvM/A3cSaxj7S76X3nUSvqVJlIoUQS1zke/OCHgHdZ/JRB4T0HoC4Z4CsdRppelBmHq7YCa/VvKlSyD13M+BvtY4eihcPlPOzUdaGM9SIDwhREHOt888gWgLqckE3DSaIyRrghJr51TL6q+NwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZefwL3Febft5uu0BywFTlk0V3xz0Umc+JUo0NwWSRQ=;
 b=mY+i/MOTeCVzbKZT8rXcx7rKodVnIa4yp2gbepQSa/jhj5imZqbQcRgQhSkCtf2ByBZY8nIY7XVCYUyL7T2tm0J1pLeORsIlgnKP3baSQctTUn7gs/GcNFOx/1TBJG7NNoZDyXYn+MNL9Yys1iRpFOVnyoAzQcR+nlCAIeYjzi0=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BLAPR10MB5155.namprd10.prod.outlook.com (2603:10b6:208:320::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 15:08:53 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::ad42:b11a:662:9466%3]) with mapi id 15.20.6387.020; Wed, 10 May 2023
 15:08:53 +0000
Message-ID: <d6262e92-9f2e-10f3-6fff-1bc376f98cc5@oracle.com>
Date: Wed, 10 May 2023 10:08:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/3] ACPI: i386: bump MADT to revision 5
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com, miguel.luis@oracle.com
References: <20230421214901.2053-1-eric.devolder@oracle.com>
 <67265b8f-10ff-d276-bdda-b6c66666e36a@oracle.com>
 <20230510101408.03e6684f@imammedo.users.ipa.redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230510101408.03e6684f@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0163.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::22) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_|BLAPR10MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf298e1-ee78-49a6-d49a-08db516877f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6GPQVzpIAuXrB9F2JA2hSDD2hXwXQKMrbNyKwrTTUsaJ3GyCIF7l8DgsRvL3qhxkBMz1zRdxVzSJ4N8WcJxiO+eUcGX54dy2eBGfLFbEFJVWWx1U1kG32L2C717y+G93kXN3VIAkGFbKn6OQyL9a0jwpbPH7sTXpzVV7/9TuW9amVYWQHoXehVGpiA6/ki8Occb8Ot871P7uLhLNCDGFXytk07JAjTd4xMvLmZfugwQUAQf08ur/EbrQVVyMEgirkzt7uAb8FI5+j+1xcA77QXbyBYgoRgYzhJXa4Vh2ldtL4WGYMvoXHRawto5BltPbLqASAi1vUCScsxyipZiFsaL4LApdSXVgjjJiSUKkQ3ikl24nscjW9czU9YOosMTpWZg3bA7G3wIK4G60x3rrdnwYKD1DiRi+T6YLcVcRDMRLUC/QRsmFDT1cm2YAQakuyW9buM7gP3Pb8FjteTG0Q2fjolrnR2AwFdZdyAeEv+GvVdddLGl5oBL3Gu5SSG+YAAA4jN13U4pbnTDYrFkC0TMQbbcYTVxY20suxuwjLWQ8pIGtok67+tTTi/lB68cE+yTcfh1oBC7iyMhF3QiKKd0vHgnNl3bAFQZUIGgr+RFfSpeEtQ8FWIhds0dwv6c/dsBk1tbR9TnKqtLQMqgzxeMcdkcwMAJpeCqWkVwdQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199021)(478600001)(31686004)(7416002)(8676002)(86362001)(6486002)(966005)(66946007)(4326008)(31696002)(6916009)(316002)(66476007)(66556008)(83380400001)(2616005)(36756003)(41300700001)(38100700002)(8936002)(2906002)(30864003)(186003)(26005)(6506007)(5660300002)(6512007)(107886003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUp0K2FVVVNVTU9qb0hyeDFTMUhvdDQzNUFKYWw1SmVXdnRJMWYyYnFBSjNQ?=
 =?utf-8?B?M0ZVdndkUjljVU5SbFZ5aGlDeHJUdVAxV3NKK2h6cXRVT2dmNStCdHNOSnNC?=
 =?utf-8?B?OExyV1BIbXJaNzNsTTY2dUl2MHFra2hlV2dxQ0NEanBGVWtUeEc2TU5aZHpU?=
 =?utf-8?B?bVI0UWhMN29EcXVXRk5IejN2VEJRLzRxTFBSSGxCak9DMEw4Ty9VNC9haEty?=
 =?utf-8?B?L0Z5VUFuNG9KOUo2bFR0YS9uTE0yQmpEQmI1b2RsQ3pyOEdzMGRxT1lDYmVX?=
 =?utf-8?B?dTlqVGZNUktsS0FPb2NEdGtiZ0htU2MvLzJKZGN3WW16bDJhK25oTFZuK1pZ?=
 =?utf-8?B?MUlaTkhZaFZYYUIrMDd4TC9hUUFNVzN6WS9KTGcvOVRMMzBTcWd3VUh5VlZ0?=
 =?utf-8?B?OGlibGJNc3B4WEVrRStLZ3FVUkVZUk9WVkFCWVp3c0s3VkVNbm9Dc2J0Wnpt?=
 =?utf-8?B?Wk1UaG1VTU50ZHpIb25XZERlSXpvNlhIV0RLQ2twUHo4VUpnR0NlbUExUmVa?=
 =?utf-8?B?ZUlVN2hPVEtOanN3Sk1zM01FMUZBOXZwWWh6SC9kZ3hGdC9maE0wUUEzSmhQ?=
 =?utf-8?B?K1NDTlM1cndPY003aU93eUpDem5pVk03ajJ6bnBpdkxNdUZkTWRpUFBzNXZD?=
 =?utf-8?B?SlVIcG5YUUpoSmdRTmY1cHRCaC9iWU4zRk9KZnJva0YrTjNueGJ0RnRrMzBs?=
 =?utf-8?B?dXp6cTNaaWYzcElYYzJtdmNyS2ozU1lRRjlQcXBpSG9CakdOM0ZaSHBCeW9D?=
 =?utf-8?B?eGxJQmlvblBONlBOM3g5UVdhNEIxaWpIRGFVUUdtVWJpU00vbEFnbElQTWln?=
 =?utf-8?B?emlHSnlsZEwrcTZWK2Rod21YMGhZTE84MVJMeDRMRGVRL0doVjFhNFJVU0xx?=
 =?utf-8?B?R2pRZ0QvMlBCRHphSmdNVXJSSFdRcjVRcXc4ZFJ1TllVNERHbk9pUDNaMnBn?=
 =?utf-8?B?MExnMG1TZkxiRmtlUVNFQnhWTTRya0xJSk1LYVRiMFhwU2NpWWJIMmh1Qkpx?=
 =?utf-8?B?RTc4RU5XOHFUWXdsZ0lWL2pKMTVHaE8zL253UUwrajVhREg2RHBXOVF5ODIx?=
 =?utf-8?B?MkNxNEpBWHdINEdUb1VBaTFKejhHcDZmYTdGSmVvNi9MY1JmUTRKRkcydU9K?=
 =?utf-8?B?MFkrdlY2elRDN2VHaHlnc0grdHNGUVphYnM5RW9hdFA1SjdNR2oxQVNZWmJI?=
 =?utf-8?B?eXc3SlF0elkveUt4TG5yZ0hQVVNaUHl0aXFHUG1kSCtUVko4cFJsVlRUMnJs?=
 =?utf-8?B?bTlydW8rOWdET2VJOWpXUWVrWjltZmVJeWFidk5XVkJPV3ltUEdaTk5YeXQv?=
 =?utf-8?B?THdHS1hsdWlVcTZ6MjFNNkt6L3VwWmd6MXJoL1lQNkdySHo1YnlqVmcwNjdq?=
 =?utf-8?B?WC9XV1c5UzJQekkrVVk4dTBxa0o3cnh5VjZsakFKSWIzeXRKd1F5N1I3UVJH?=
 =?utf-8?B?Zi9IVC8ybGNRZGsyWkd4WVd4L1NQNW9qeXlwbzkxb0VUaTQxRWVTU1RzQ3Vl?=
 =?utf-8?B?SnRWaFQ2TEdWY2VOYk80d1BCTVhHV0lRcTBnRnllUW8zbHEzUWI0N1lEYURI?=
 =?utf-8?B?YVJ4WGg0MGN2QWpPQUVrNnBBWXlCMGkvRFJ1dUJTVVlnSnZHWjV3dThWRkFl?=
 =?utf-8?B?MzVlQTVJc2E3ZHFkZHJ5cU5IOTZ5QWdDMmRYT0FDMDhzVDg4ZVFKb1ZkTEUr?=
 =?utf-8?B?ZHJJck1PS2dNUlFWdHZ5Vm9SUjJaUXVCMUMwRDdVRmNlT2JHUFdJUngxM2ZF?=
 =?utf-8?B?S21IcXBEMXBpNDlzKzM0UVpSb1J6eWtWMzVMcXBTQlZ5T0dnMGo0MlRieUJH?=
 =?utf-8?B?M1RmTmJNbXp1RkU2SUhRdHlYczZoZUVHOGtlQjRxTDRRUVRsOGJmSGUvZlhW?=
 =?utf-8?B?Z1FUQkN2UWY5Mm5ua0tIdUFOMTJCSzI4NkUrRDF0S2RjN3FNSWhnM1BNcklN?=
 =?utf-8?B?MC9zM0l6bFNjaGRsdFE3UEZTWkdIT3F2dFY0aTNOQmxEV0p2VGcrU2REdGtS?=
 =?utf-8?B?bE9ya2NpbllHWW5YR25yZkdsRk5mNHNYL2xmWGJWejFtRTlUNC84OUhldHpX?=
 =?utf-8?B?ZFkyV2NLQmlGMHBNMGxrOHJ5T28reW1rR0tkeXhRSUJQaTNUOG84UmNjb3BF?=
 =?utf-8?B?dGNPWnphMUYrREVqMVdQSk5VaHVFclBqRTBqSGZpUVJQNXFhZDJmaXppK2w0?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 91j7+hrAygW/ajGM35++Hhzb/4xK/jFmLAmwRK3EJcm0PYfJgpSI2Ydt5xmql6akaqpnLGH0NdtViWchqJMF9NMTwwPlpCCaKtkGP/lzHuiD82M1YuxDsfySHkjmb1e6Tt1CqbxkZ9kgdXeIllPtbrksbZJpiB3ZphcR5y8FFPKD1bEnmARRovWGSVOvBRaD7HUMkP9uLEw6lKSlVfouD7kKk9J82ajfSkuENlwMkDStw/a2IfE08WxuklWbDXVFcoPGAejWJbUp6Mvt7kjrssogUx8bcjZvkjZRuS/Ky2+QfOK+Lww0bo31+OtdmL8cCjMj6AVEsc2FldVz++CxmjHW72/E7WoSnVWJ59WwyN3eRNb79XYQOK9mePSEOpZbKM49ZC/Ah561ds4aQaESg09t4ML6LkxtKHK5SeW5symXFJgG2b4z04bQv4ARlLu7/rx1A+urfvCsBkg/hdxIUZR+fuFmMWhjBmaI3hppnsDgQ0lHoIkyIs1H1jwecvE5zZgcJu0vNZg23aQb5wNg2/gYbkb0JpGqkt2g0Uqd5Ryn/NOLD8te70AQ/f3ERuW7QzAkuZGrvDZDIVggfKyxfUsuX/E+gDFelbEZaxQwgfi/1vXzZZ5AQv6ZKI+W1sAjcMIIcsPwr+Qiq4QXgZ+TpqewiFk02ds/ZT94I366VE44fgMD10yrR8S1RQ32JRG88N6Ittls+U+paw/0P/l8y49lPruXNW2Kd4SaDMgcECKvL3iIZN2Nw1CLhFV6i1ocvqb55G1HeojVyDHK6/TUxZMNe10iRpw/OVZrfbR18kJ4OGwQktGH5UNYSUKDxOwDeBW9u+Tp8UQvT0M0u++cryIYqDqhYlIV2BXr6bb050Pugi8oEoO4mzk+swnJaIFGi2mOY4BJOZpqrKt5yIo7iQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf298e1-ee78-49a6-d49a-08db516877f2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 15:08:53.6269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/56MNqxil+E3b0F7McvykVaqkjvfgt+IB1goC5wGR9WcsqeqCVprJ64JD+/AlaQ+oz0u8Q4XrmhDpmNFIu57pFe+Vc6zpMLDLKMZvLxx2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100123
X-Proofpoint-GUID: ddGltL-ijdmQWKTsM14zwRduLZFTGlZ5
X-Proofpoint-ORIG-GUID: ddGltL-ijdmQWKTsM14zwRduLZFTGlZ5
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 5/10/23 03:14, Igor Mammedov wrote:
> On Fri, 5 May 2023 16:53:22 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> Thoughts?
> 
> I still don't think we need to bump x86 to rev 5 in QEMU.

Linux v6.3 has the fix merged (so crisis averted 8).
The investigation allowed me to opportunistically provide this patch.
I think this should receive serious consideration for merging,
more so because generating MADT .revision 3 and reporting .revision 1
seems wrong to me.

This patch seems really straight forward, and low risk, now.

> 
>> eric
>>
>> On 4/21/23 16:48, Eric DeVolder wrote:
>>> The following Linux kernel change broke CPU hotplug for MADT revision
>>> less than 5.
>>>
>>>    e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
>>>
>>> Discussion on this topic can be located here:
>>>
>>>    https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> 
> have your kernel fix landed up upstream?
> 
Yes, merged and available in v6.3.

>>>
>>> which resulted in the following fixes Linux in 6.3-rc5:
>>>
>>>    a74fabfbd1b7: ("x86/ACPI/boot: Use FADT version to check support for online capable")
>>>    fed8d8773b8e: ("x86/acpi/boot: Correct acpi_is_processor_usable() check")
>>>
>>> However, as part of the investigation into resolving this breakage, I
>>> learned that i386 QEMU reports revision 1, while technically it
>>> generates revision 3. Aarch64 generates and reports revision 4.
>>>
>>> ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
>>> flag that the above Linux patch utilizes to denote hot pluggable CPUs.
>>>
>>> So in order to bump MADT to the current revision of 5, need to
>>> validate that all MADT table changes between 1 and 5 are present
>>> in QEMU.
>>>
>>> Below is a table summarizing the changes to the MADT. This information
>>> gleamed from the ACPI specs on uefi.org.
>>>
>>> ACPI    MADT    What
>>> Version Version
>>> 1.0             MADT not present
>>> 2.0     1       Section 5.2.10.4
>>> 3.0     2       Section 5.2.11.4
>>>                    5.2.11.13 Local SAPIC Structure added two new fields:
>>>                     ACPI Processor UID Value
>>>                     ACPI Processor UID String
>>>                    5.2.10.14 Platform Interrupt Sources Structure:
>>>                     Reserved changed to Platform Interrupt Sources Flags
>>> 3.0b    2       Section 5.2.11.4
>>>                    Added a section describing guidelines for the ordering of
>>>                    processors in the MADT to support proper boot processor
>>>                    and multi-threaded logical processor operation.
>>> 4.0     3       Section 5.2.12
>>>                    Adds Processor Local x2APIC structure type 9
>>>                    Adds Local x2APIC NMI structure type 0xA
>>> 5.0     3       Section 5.2.12
>>> 6.0     3       Section 5.2.12
>>> 6.0a    4       Section 5.2.12
>>>                    Adds ARM GIC structure types 0xB-0xF
>>> 6.2a    45      Section 5.2.12   <--- version 45, is indeed accurate!
>>> 6.2b    5       Section 5.2.12
>>>                    GIC ITS last Reserved offset changed to 16 from 20 (typo)
>>> 6.3     5       Section 5.2.12
>>>                    Adds Local APIC Flags Online Capable!
>>>                    Adds GICC SPE Overflow Interrupt field
>>> 6.4     5       Section 5.2.12
>>>                    Adds Multiprocessor Wakeup Structure type 0x10
>>>                    (change notes says structure previously misplaced?)
>>> 6.5     5       Section 5.2.12
>>>
>>> For the MADT revision change 1 -> 2, the spec has a change to the
>>> SAPIC structure. In general, QEMU does not generate/support SAPIC.
>>> So the QEMU i386 MADT revision can safely be moved to 2.
>>>
>>> For the MADT revision change 2 -> 3, the spec adds Local x2APIC
>>> structures. QEMU has long supported x2apic ACPI structures. A simple
>>> search of x2apic within QEMU source and hw/i386/acpi-common.c
>>> specifically reveals this. So the QEMU i386 MADT revision can safely
>>> be moved to 3.
>>>
>>> For the MADT revision change 3 -> 4, the spec adds support for the ARM
>>> GIC structures. QEMU ARM does in fact generate and report revision 4.
>>> As these will not be used by i386 QEMU, so then the QEMU i386 MADT
>>> revision can safely be moved to 4 as well.
>>>
>>> Now for the MADT revision change 4 -> 5, the spec adds the Online
>>> Capable flag to the Local APIC structure, and the ARM GICC SPE
>>> Overflow Interrupt field.
> 
> All ARM stuff is irrelevant in x86 patch
> 
sure

>>> For i386, the ARM SPE is not applicable.
>>>
>>> For the i386 Local APIC flag Online Capable, the spec has certain rules
>>> about this value. And in particuar setting this value now explicitly
>>> indicates a hotpluggable CPU.
>>>
>>> So this patch makes the needed changes to move i386 MADT to
>>> revision 5.
>>>
>>> Without these changes, the information below shows "how" CPU hotplug
>>> breaks with the current upstream Linux kernel 6.3.  For example, a Linux
>>> guest started with:
> 
> what's the status wrt current upstream kernel?
>   
qemu cpu hotplug works with upstream kernel ( >= v6.3) but only because the
kernel fix allows the legacy fallback assumption that the non Enabled
cpus specified in MADT are online capable.

with this patch applied to qemu, the kernel honors the Online Capable bit
for cpus not Enabled at boot.


>>>    qemu-system-x86_64 -smp 30,maxcpus=32 ...
>>>
>>> and then attempting to hotplug a CPU:
>>>
>>>     (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
>>>
>>> fails with the following:
>>>
>>>     APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
>>>     ACPI: Unable to map lapic to logical cpu number
>>>     acpi LNXCPU:1e: Enumeration failure
>>>
>>>     # dmesg | grep smpboot
>>>     smpboot: Allowing 30 CPUs, 0 hotplug CPUs
>>>     smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
>>>     smpboot: Max logical packages: 1
>>>     smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
>>>
>>>     # iasl -d /sys/firmware/tables/acpi/APIC
>>>     [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
>>>     [004h 0004   4]                 Table Length : 00000170
>>>     [008h 0008   1]                     Revision : 01          <=====
>>>     [009h 0009   1]                     Checksum : 9C
>>>     [00Ah 0010   6]                       Oem ID : "BOCHS "
>>>     [010h 0016   8]                 Oem Table ID : "BXPC    "
>>>     [018h 0024   4]                 Oem Revision : 00000001
>>>     [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>>>     [020h 0032   4]        Asl Compiler Revision : 00000001
>>>
>>>     ...
>>>
>>>     [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
>>>     [115h 0277   1]                       Length : 08
>>>     [116h 0278   1]                 Processor ID : 1D
>>>     [117h 0279   1]                Local Apic ID : 1D
>>>     [118h 0280   4]        Flags (decoded below) : 00000001
>>>                                Processor Enabled : 1          <=====
>>>
>>>     [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
>>>     [11Dh 0285   1]                       Length : 08
>>>     [11Eh 0286   1]                 Processor ID : 1E
>>>     [11Fh 0287   1]                Local Apic ID : 1E
>>>     [120h 0288   4]        Flags (decoded below) : 00000000
>>>                                Processor Enabled : 0          <=====
>>>
>>>     [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
>>>     [125h 0293   1]                       Length : 08
>>>     [126h 0294   1]                 Processor ID : 1F
>>>     [127h 0295   1]                Local Apic ID : 1F
>>>     [128h 0296   4]        Flags (decoded below) : 00000000
>>>                                Processor Enabled : 0          <=====
>>>
>>> The (latest upstream) Linux kernel sees 30 Enabled processors, and
>>> does not consider processors 31 and 32 to be hotpluggable.
>>>
>>> With this patch series applied, by bumping MADT to revision 5, the
>>> latest upstream Linux kernel correctly identifies 30 CPUs plus 2
>>> hotpluggable CPUS.
>>>
>>>     CPU30 has been hot-added
>>>     smpboot: Booting Node 0 Processor 30 APIC 0x1e
>>>     Will online and init hotplugged CPU: 30
>>>
>>>     # dmesg | grep smpboot
>>>     smpboot: Allowing 32 CPUs, 2 hotplug CPUs
>>>     smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
>>>     smpboot: Max logical packages: 2
>>>     smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
>>>
>>>     # iasl -d /sys/firmware/tables/acpi/APIC
>>>     [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
>>>     [004h 0004 004h]                Table Length : 00000170
>>>     [008h 0008 001h]                    Revision : 05          <=====
>>>     [009h 0009 001h]                    Checksum : 94
>>>     [00Ah 0010 006h]                      Oem ID : "BOCHS "
>>>     [010h 0016 008h]                Oem Table ID : "BXPC    "
>>>     [018h 0024 004h]                Oem Revision : 00000001
>>>     [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>>>     [020h 0032 004h]       Asl Compiler Revision : 00000001
>>>
>>>     ...
>>>
>>>     [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
>>>     [115h 0277 001h]                      Length : 08
>>>     [116h 0278 001h]                Processor ID : 1D
>>>     [117h 0279 001h]               Local Apic ID : 1D
>>>     [118h 0280 004h]       Flags (decoded below) : 00000001
>>>                                Processor Enabled : 1          <=====
>>>                           Runtime Online Capable : 0          <=====
>>>
>>>     [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
>>>     [11Dh 0285 001h]                      Length : 08
>>>     [11Eh 0286 001h]                Processor ID : 1E
>>>     [11Fh 0287 001h]               Local Apic ID : 1E
>>>     [120h 0288 004h]       Flags (decoded below) : 00000002
>>>                                Processor Enabled : 0          <=====
>>>                           Runtime Online Capable : 1          <=====
>>>
>>>     [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
>>>     [125h 0293 001h]                      Length : 08
>>>     [126h 0294 001h]                Processor ID : 1F
>>>     [127h 0295 001h]               Local Apic ID : 1F
>>>     [128h 0296 004h]       Flags (decoded below) : 00000002
>>>                                Processor Enabled : 0          <=====
>>>                           Runtime Online Capable : 1          <=====
>>>
>>> In terms of testing older operating systems, I did:
>>>
>>> - Windows Server 2008.
>>>    By opening Device Manager -> Processors, and watching/counting
>>>    the listed CPUs before and after hot un/plug operations.
>>>    When hot plugging a CPU, the new processor shows in the list;
>>>    one more processor is available after the hotplug.
>>>    When hot unplugging a CPU, Windows refuses, with the message:
>>>
>>>     The 'Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz' device is not
>>>     removable and cannot be ejected or unplugged.
>>>
>>>    This is expected as hot unplug did not work in Windows 2008.
>>>
>>> - RHEL 6.9
>>>    Kernel 2.6.32-696.el6.x86_64
>>>    Build Feb 21 2017
>>>    From dmesg:
>>>    ACPI: APIC 000000007ffe32f0 000F0 (v05 BOCHS  BXPC    00000001 BXPC 00000001)
>>>    SMP: Allowing 16 CPUs, 8 hotplug CPUs
>>>
>>>    # cat /sys/devices/system/cpu/online
>>>    0-7
>>>
>>>    (QEMU) device_add id=cpu8 driver=host-x86_64-cpu socket-id=0 core-id=8 thread-id=0
>>>
>>>    CPU 8 got hotplugged
>>>    Booting Node 0 Processor 8 APIC 0x8
>>>    kvm-clock: cpu 8, msr 2830ed00
>>>    Will online and init hotplugged CPU: 8
>>>    microcode: CPU8 sig=0x50663, pf=0x1, revision=0x700001c
>>>    platform microcode: firmware: requesting intel-ucode/06-56-03
>>>
>>>    # cat /sys/devices/system/cpu/online
>>>    0-8
>>>
>>>    (QEMU) device_del id=cpu8
>>>
>>>    Broke affinity for irq 24
>>>    CPU 8 is now offline
>>>
>>>    # cat /sys/devices/system/cpu/online
>>>    0-7
>>>
>>>    RHEL 6.9
>>>    kernel 2.6.32-696.el6.x86_64
>>>    build Feb 21 2017
>>>
>>> Both of the above 'legacy' operating systems behaved as expected.
>>>
>>> Regards,
>>> Eric
>>>
>>> ---
>>> v3: 21apr2023
>>>    - Dropped ARM patch as there is no compelling need to move to
>>>      MADT revision 5, per Michael Tsirkin.
>>>    - Recoded the flags to be simpler, per Michael, Ani Sinha and
>>>      Miguel Luis.
>>>    - Regenerated the binary tables, as per bios-tables-test.c
>>>      instructions.
>>>
>>> v2: 18apr2023
>>>    https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg02576.html
>>>    - Code formatting changes per Igor Mammedov
>>>    - Included the steps in bios-tables-test.
>>>
>>> v1: 28mar2023
>>>    https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06705.html
>>>    - Initial series for ARM and i386 MADT revision bump to 5.
>>> Eric DeVolder (3):
>>>     ACPI: bios-tables-test.c step 2 (allowed-diff entries)
>>>     hw/acpi: i386: bump MADT to revision 5
>>>     ACPI: bios-tables-test.c step 5 (updated expected table binaries)
>>>
>>>    hw/i386/acpi-common.c                         |   4 ++--
>>>    tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
>>>    tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
>>>    tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
>>>    tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
>>>    tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
>>>    tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
>>>    tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
>>>    tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
>>>    tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
>>>    tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
>>>    tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
>>>    tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
>>>    tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
>>>    tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
>>>    15 files changed, 2 insertions(+), 2 deletions(-)
>>>    
>>
> 


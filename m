Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC6687502
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:22:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNS2B-0000Dm-Eb; Thu, 02 Feb 2023 00:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNS29-0000D3-KO
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:21:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNS28-0003jA-4N
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:21:17 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124i0gA006579; Thu, 2 Feb 2023 05:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=mjcgoQ9tbQd0jHBdsfl00/Tc3xf08UX5EMNlWQpyN7g=;
 b=eB6gNuV+9s+FAPBflSHBpi57d1U8IeHJ2/lKDRbPQChUIOtYtAI2JzsMpO8yDKyNkOl8
 nakLn8xjDOz1MnGZrp3FI9Aw1mH+l8BdRG6lcN7jTAKhWDBhaRextplx0Xou8uNqylMN
 GPx7JKb6Ex3R9RvcpqMQo+spvSS2impLGQ7sSJKsZiuMUeeruBuQGVmE/VrNjVtZt5HP
 OMktY8UWWrOAlEw0ZAvL54fZCgOayPgWal4b9xkqRIK2Pw9KDtWygsbA5GNaFHcA5T0O
 /Y85qvZvWx6PKlj122RhmereQyOs2/QdbUJTxeaz4x9ACBeA0pqLQqcSfYzAfYfqTs6N +A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkfe2dkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:21:13 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31259QNN031622; Thu, 2 Feb 2023 05:21:13 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f46tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNgWoXwL18OFTHRTC+BfVRDbOAlERBKgFZLEzaqYm0acVWhzQkwNpsA2Ntt6Q+4iOP2mEZex/nH0tkv8kPrux1slEBoyKoMs701Ru+ElPiJYVU2F6Gt7mg2xuvN7BcqeK+zTKuEjHhyHsLnd6m3R9MwIzXml4fd3Dl5uY+o+ae2P5r8yUppdG/HZRWarHBptx8GD6gxAvDq/4HEc7vLup/B4ppPLbunVit9yO9nWsIH/ssLUJBbUSnzX4oxbvs5o9E5kZsELPGkjLfrtJo7K6bbkkOSRZFyfYqRWpJeh3yTc8b68fYJrj8aIgAg1F2jgOTEt8AHnD2eJJ7Pw5eLUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjcgoQ9tbQd0jHBdsfl00/Tc3xf08UX5EMNlWQpyN7g=;
 b=kt7RsbTQwQ8sMaQOq33DojIBRzTNWp3Z0uoMWkSbvQutcJYvARhXy5Tmhqbbj23aqJjDz8o/pVPpdueIf9aJOWm7q1/3V0vmc6rgnJlk4Oj7ThpJl6CiW8tEolPDZftTkZ548aKTSZ09VfhkgtTC4pXtiQNd0P+Ni4WmPdURLGP0CHpHXcHakBFD6wS1avx40z56PlsgjLieM3zhAQdgS0IVdvTmj1cGK49MnnkLG9WzWvV1WRgBqZXYhljpeUTUjFhEJWvdNH4m3liGKwY/w2s4GbhMjNHFFqvDFc8Y7yiWUv7HQofsUsucYOW3isuPR3Gg9UVXbrQWIAA+FPBAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjcgoQ9tbQd0jHBdsfl00/Tc3xf08UX5EMNlWQpyN7g=;
 b=ELPiBnhmFPp48HpVpWfxJAMhhrpvxo/gF7eZgez096LNViISnIJxdqgdNhWI7fesiRG3EwWnauSWRoPiGIhkvY3ZbtJJ3CEYUtiSPdH6/vitoW6G62Vl1sRxrjgarwjbzG52xrMDNdEweVwRvs9CPl5TRiNsYMpZJrcpYaDTWSk=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7; Thu, 2 Feb
 2023 05:21:11 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730%3]) with mapi id 15.20.6043.016; Thu, 2 Feb 2023
 05:21:11 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 14/24] vfio-user: get and set IRQs
Thread-Topic: [PATCH v1 14/24] vfio-user: get and set IRQs
Thread-Index: AQHY86IbZmOj4+Y5z0Gyi+NUEacgdK5sO8SAgE9pSQA=
Date: Thu, 2 Feb 2023 05:21:11 +0000
Message-ID: <FE5B2B2D-5A64-4904-A30C-DA462282489C@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <5532e8b1721cdf68d8932c747dc6b5f42738e139.1667542066.git.john.g.johnson@oracle.com>
 <9fb35cf6-53bf-1309-c27e-de3bece7fbe1@redhat.com>
In-Reply-To: <9fb35cf6-53bf-1309-c27e-de3bece7fbe1@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|CO1PR10MB4531:EE_
x-ms-office365-filtering-correlation-id: 3ee20f70-f6b6-4549-5548-08db04dd4c1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sciZNF3cIS1mZbxOlFX6xlSQqMfeK1xrJ64xh3nZ4GQ/uTs0ZhDK/sUTqSoM6OhMaFRBqnCyCdvY5dGIZ0yOTfM9FFfRoPBvYCJctRwxH9wHm7e9mxRaowUQODQLr7DFABijZeoF6UcvzSSwWVearTbfrlBogauwXZIxoo3e6XZrcZbRlplJCnlQEoyG1dNVCxIMgcFVF9Z3Di7xIPMStayCAqDisTtG1X7tpZvxggS71LVFIfcBpAwO+l51akUweVVeh3edCwqKOq2cuRUByzsLjd0LLrOvv/B2I2FfJxeIjP/l3cSs7E5bwp4wg8matGRcyPoPgnOdQdIqy1kfjtOY/EOc6ZoZJJryL1JA3xJTcltxV1Z+PN8aU88b/cZiZx8/+IsEi+nYCpYx3z31BkeDdnCVxidTozSDqR9AyaiyEpis6DpIPKrq1RPjtzUUMlyWTGXi5Pc24OYT/dBNhveXmoB63dKANAiKt5KOzA5HCUBFOa9IyiwODusJqvsAtnGmeDIFXe3Vgk5nKZtlMkdCFn/YRM99vBaRdhMSwVdoDdfasq4+SXQsiA/7b5MSHZDL4tUc1urmQKlaazqtAVfeIWzGWQdFYwciJgAMTiFQFt6ZTkO7CKyrgBmt+g5g0o8EA2fWqjwSgsZYroX7wed8OpRBEDgIoP2Av26dUzN1mifmUV5Hv2nM5e3oSyj2nAiO1jq9UwIhv4sowk+9aTflxHa8vM/FovQimxAnZpE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199018)(36756003)(76116006)(66446008)(66556008)(66946007)(66476007)(38100700002)(4326008)(6916009)(64756008)(8676002)(122000001)(316002)(6506007)(53546011)(26005)(186003)(6512007)(4744005)(33656002)(6486002)(5660300002)(478600001)(66574015)(86362001)(41300700001)(38070700005)(2616005)(71200400001)(8936002)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVhPdEhiYWVTUnE2ZEliUXRIQVNGY1Y3cThSUUtva1M2ajJUREpoZUp5M1k3?=
 =?utf-8?B?cUc4VTNrU1hzVy81Vi80VENsWk00dUtWS0xiSlF5cWZJdk5PUnhBZGlkdk12?=
 =?utf-8?B?WlErTjhCcERZYmtERncxTkVQSitDUWE3ck9oUW9jWnJ1NzRFNXRQZk1PdFRZ?=
 =?utf-8?B?MWlNakdBVlJXWVVDZTl4eHo4ajVEWHpxM3ZyeU5JWnprUjlKeDhaemdTVnZq?=
 =?utf-8?B?S3hqVWFER3RHck8zTzZZWnV5SHhseXFsR3RHbDZKWG9UZ0dESi9QTDZzZ1NW?=
 =?utf-8?B?ZU1LZHBsWjBIMkJrT2tzUHNBS3NLYVo1TGNGMk9iU3pyOGloTmNQZk9YVWdD?=
 =?utf-8?B?M0t4L09YdTZMaXFTeFdlT28zMWVkVWVONm1jbmluR25ibkpwMnBRS0V4VVlJ?=
 =?utf-8?B?OSs5Sjd4T3RTQWsrY0VRYzVMb1AvK0Z3QnFEd0xMU0lGOW1kb2p6U2s4YTdw?=
 =?utf-8?B?NFh5RzJlb0tJeWt6RHdLMGY5OHhLSGNrUmxxczlncGp2TThlblZJMHpDdDBW?=
 =?utf-8?B?NUc3WlZIaWkxT0poQjlwNGZ3WUtxa0VRY0pKaUFsMTJZVDNDN0J4NEtCQWtz?=
 =?utf-8?B?QkJtRUI0MWMzV2ROcmhhTEJ3NmMrWkNVWWNpWUl0bXBaOW1hS2dIT2Ivalln?=
 =?utf-8?B?Rk1SQ2lZclhNUG5KOVJhSnc4VWlpRzkveGl2MkFRRFYvS0V1c0V2NXZ4UVZB?=
 =?utf-8?B?cG1oU1dOUWZUdXdKNFdjYTNtSzVmSm14VCtkYlBBNCtlZ2YxMzQrRi9kR3dY?=
 =?utf-8?B?M0pPdnNNYUVneU9IOWwwM3diWDBiWHFONFV4Q0JSaXRoM0xwRFpRbTVnYW5U?=
 =?utf-8?B?dmZNdTVUc2pKak9ndndqbGg3blZqKzBzb09Cc3Zlb2U0N2JxNkJoVVRaV1gr?=
 =?utf-8?B?NHJqWFZJSEFzdUQwZVF5Y0owNzRZREVFZkhWZm1zRlR2YXlFanBLTC8wMWxF?=
 =?utf-8?B?aHUvd1pLaGZDdDdhakJDNUh3ZEVqOW8zeU5hbFRwQnQxMUlUUnhvVDFNUnFI?=
 =?utf-8?B?TVNxTENCZFlvd0dMS05tQ0pUalF0bVJGenlTQ1o2VE1SVERNOWZRTUg5WkFT?=
 =?utf-8?B?L2wra2lpeXREU1U0MTNSaVdNdzNzYUcxd24veEhYQ0dOOVZYbDJrL2tQdzdm?=
 =?utf-8?B?dWxHc2xwRHFDdTMxM0M5VmpwVUNHcmx5ekppU05mUXp1U3lkeHVybHczaTdV?=
 =?utf-8?B?WXpBMlVMSndtbldJQ0lpaG9WZzJEbExUNVNHUWpaUzNHSEhhZWtFYk1NQmti?=
 =?utf-8?B?Ukp3S2xFWnRFNTdOV20raDltUytsaFNub01lbnNCNng3eVQ0cVVtYytCTXNV?=
 =?utf-8?B?OHR1NmRBTDdqK01uemFUNTRlalhmM0cvNkl1S042dEZTcW80b3NHZEFJb1Zp?=
 =?utf-8?B?eDJSZTJ2bDVmcVdPekZOR2tIS2wyYUtuVjFnOGhNSU5hNk1UR0p1alZNSCt2?=
 =?utf-8?B?UkVqRWQ4SG5SSjhONUFqYUVUODd5cEYwaWQ5ZzF0Y3N6ZXNYRFZCOGJKK3gx?=
 =?utf-8?B?ZXpIdjhpaVpxRlJ0T2Z3Q0JpM0hQRmM0M3MvL25tYytjaVhwcHh0ZytuWXV3?=
 =?utf-8?B?ckQ5VjlGcW9pYzZxVFFxSDdQSWhWN2gzM3Z6SUo4c0xscFZYbmJXWEdGQWI1?=
 =?utf-8?B?ZjkyM3V5VkZ1M1htR3hWWTNhQy9nTnFDTU9TbXRhamxVcERJM3BTQzFxMGdx?=
 =?utf-8?B?b2FobG9URExYdUtjUWFmQVRCK3cwUzdBK2l2VEoyRTh6SGwyelR2bXdZb0RY?=
 =?utf-8?B?TVpLUHZXL0IrSk5nd2lqc05qNjBLMWpUTm10MlExTTNNUDNDaXJKQ01XTU4x?=
 =?utf-8?B?amtKaGsyRHUyUUV3bXhRKzlPTkdJMEJnN2lIZDRJVEVKTHU1WWJQZkJMbUdp?=
 =?utf-8?B?c2g1alhFalkvblE5U3RMOVpBUmV2L3RCb0pvR2N3ZnMyRmdReEdEYXNlQU9D?=
 =?utf-8?B?RWpBSUxFT3YvdjhLalFhUXpoZVNrQ1ZVQVBrNUtCYTltRk5wTGc3SjM4cnda?=
 =?utf-8?B?K09ZNERLSlNILy96MHBXTFFITGdBaVp5MjFPV3F3dTlhSzliWTYzQkMwNUo2?=
 =?utf-8?B?enM3LzROczlPcFV1TE9zV2VxTFZmY3R2em1UcU8zN24yZXFFa1kyWTFJWDBr?=
 =?utf-8?B?R0xYUUNmdHNXcUlmRVBlWlhyY0k0RUFpNEZ1SWsvaGRnTjBkaXNlMlFQaFFO?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FB5B0A9D7973048B12DD6B45D6EF5D3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fwrJADVLymOFIQMYUWcjuQb3B20XP+23Kr0fin/Gd+Elwho7usj0+NsAuAdrELs0SohEAJJpllFfzSjNu5GvVdEm61eFx58AbXbuv4tFZMdrZ1li13uBfnjOTS+Wx0foWCoYHWXrkgkNGqS1WWNw7JRUZt47h19xyKiYzcyxKmMwlV1xFtinsYWRrQFhW/2tjkudxTWblWo3wR/5q6U11jpHu7fPKsVJXa/Rik/sSO3mDwb1FvLlEDb5Afl0/8zp4odNlWmhh/b825xaEuZxYskOWkhpgsU0Yb53sWV0jiKrK0dQ+vDpBg0higXhY5UoU/UjuMmUto7Y0AAS67VE99q6fFH3/O6ZhRE0wLEmBpq9WSU0DS/B8qk/ztFsw74Q03xBx+1GbPWoZqZYOGw9GGn7iScej8Yz7+SUp7/8S0kUzu+AEFW8pwmbuKDQYXbPHQ9zYfjNKkWraLFjTSZ2PgDQOz4XKCZr6zXD7J86IJiAWGIz+wk7PhWdTzz5mwE9T3A2bbMzGvcRjwcJvHBw4+yJ3IiBvzBY5KK/r0V1AWPN87K0gwWrafoxQ+hFxZY48zo+iRADyU/FQ8RpfUrMbHdf1FT0jimiDOBo+pxfzKxQP4fyjaIvh3whn/yCF7tzLRcQCNHjsaUQWGu7nsnub5Lerari5HpedW+T4Yk1foJz5tzOnISDqm1AYKXX26RfaPsz6lvwKVOjQMs5larOmwrDx8ODgSryxXTshjWg4/cuLi9Yc750T3w81nw69HkCB3OsTrm26QcJIaSuJXUv8w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee20f70-f6b6-4549-5548-08db04dd4c1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 05:21:11.3797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHr9TRAYCbrhUSDfUAp7aPeTqft1VSKit1w+c7ZEmwcVHJTsWzyXm8U6uMyBjz7Gsk41OOFw3X6kdeQ7RvPczQrF/cIjJ3ZujgDyEKLX1dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4531
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020048
X-Proofpoint-GUID: VW3YyJs6BdAjEEvT2sUymrfOrOigEJkB
X-Proofpoint-ORIG-GUID: VW3YyJs6BdAjEEvT2sUymrfOrOigEJkB
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

DQoNCj4gT24gRGVjIDEzLCAyMDIyLCBhdCA4OjM5IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gMTEvOS8yMiAwMDoxMywgSm9obiBKb2huc29u
IHdyb3RlOg0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9wY2kuYyBiL2h3L3ZmaW8vcGNp
LmMNCj4+IGluZGV4IDdhYmU0NGUuLmJlMzlhNGUgMTAwNjQ0DQo+PiAtLS0gYS9ody92ZmlvL3Bj
aS5jDQo+PiArKysgYi9ody92ZmlvL3BjaS5jDQo+PiBAQCAtNzEzLDcgKzcxMyw4IEBAIHJldHJ5
Og0KPj4gICAgICByZXQgPSB2ZmlvX2VuYWJsZV92ZWN0b3JzKHZkZXYsIGZhbHNlKTsNCj4+ICAg
ICAgaWYgKHJldCkgew0KPj4gICAgICAgICAgaWYgKHJldCA8IDApIHsNCj4+IC0gICAgICAgICAg
ICBlcnJvcl9yZXBvcnQoInZmaW86IEVycm9yOiBGYWlsZWQgdG8gc2V0dXAgTVNJIGZkczogJW0i
KTsNCj4+ICsgICAgICAgICAgICBlcnJvcl9yZXBvcnQoInZmaW86IEVycm9yOiBGYWlsZWQgdG8g
c2V0dXAgTVNJIGZkczogJXMiLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBzdHJlcnJv
cigtcmV0KSk7DQo+IA0KPiBUaGlzIGNoYW5nZSBiZWxvbmdzIHRvIGFub3RoZXIgcGF0Y2guDQo+
IA0KDQoJVGhpcyBpcyB0aGUgcGF0Y2ggd2hlcmUgZXJybm8gbWF5IG5vdCBiZSBzZXQgYmVjYXVz
ZQ0KdmZpb19lbmFibGVfdmVjdG9ycygpIGRpZG7igJl0IG1ha2UgYSBzeXNjYWxsLg0KDQoJCQkJ
CQkJSkoNCg0KDQo=


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DF04BF6E5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 12:03:42 +0100 (CET)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMSxJ-0006ff-OA
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 06:03:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMSuz-0005qp-LG
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:01:18 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMSuw-0003EL-4N
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:01:16 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21M9kl4f032176; 
 Tue, 22 Feb 2022 11:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=x6jtIJ3fHb3iD13hVK7PxmDabtZIsldNkGvT7W+uYx0=;
 b=oTVPAVAlc7yobBP5kg6hTma1G/6GT0GsAIJO/F23HAot9A2J6JBaNgSxp594xf2g55iW
 fQHt5or9y28oJmJNor2fW2GoPO06vxngOCV8BmFpPmnjUBVqzBESuIKtdhHLINm6lDjw
 lc3XwiQz7K8J2HGf1O/Q0yKy3G+nPLJxb7pzZARNJkJIVsp4N7eDIGeYPmfCMIlxh+CB
 FZhi8M8qk11X6sK4rTQeEmx/cGBAD0K6yGJJw99VS2BiOvN5GBPEegahrzoM8k3mjQ69
 mPEWO8n14kFoEsNKnn5NEd/9DLu4OwMUkzw1AV9MK3oFgtvmFnrbkRnEKXhxG61/v6rC Yw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecv6ergdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 11:01:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21MB0qqp184770;
 Tue, 22 Feb 2022 11:01:05 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by aserp3030.oracle.com with ESMTP id 3eapkfqrgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 11:01:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWpfNtg4oR/bIdg9ZHgjeksxDwcnLDvrI5z/x3WAI0bpC264CbiYgGZs8jz1SIYfBKUZUS6Jfzw4poz5HFMwBkP3eNmDddA4RPs/fy7v1eRgV+sbdhr/HQoo3pnrszniUyHzkasbgWy8OSb2tGCBSucyqRwtE0P3dgvGTEgQfGhH8UKVcfhLDk+obnnO+SAM43Zjs3zD9GgYOwtNhUMNRecuLUg6ygZBimEGeInTZcqJrJd7HtkcteuE/9oVJ8v6pxm6iHXAVWGwCYca5IH9RtPa9AUFCUrYdl995aPKRav2RfUI72AZUOXCGAzXn1uyRFd/h8nv825OBd9U0dELEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6jtIJ3fHb3iD13hVK7PxmDabtZIsldNkGvT7W+uYx0=;
 b=IHnlJX4FqTCnZLuQPuFzuAR4YszlpjZwfpNMp5EP9apdeMQOLi5I2VSaWMG/kYgSR3nTNfUDBZPxTCP7XwUup4/EsSq8M3naiZkxHeIh0lJFqSKjBf7HKDfrQ44AGKtqV5ODEf+C5+jODR1WpGBwWXW5O+tJYWZNQu9TKZWKewwF4I0UzQJekS5H38rv7pCGyA01L+2o1fdQjXbVbA8YkiOotDUMxh1CLwgzDaiwMjF4xXPLAToFT5W0TEELwsYGf31jqKTJQvAf2fRH9k3CV5VLSOAZINBsyISi3yHoT2jGDtPCayLP7PAmoAG8aikR5Hs4IrU/cRwLY+WH+jKHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6jtIJ3fHb3iD13hVK7PxmDabtZIsldNkGvT7W+uYx0=;
 b=cEWwQV+cRt8A3lzWTZXTiFDZasJGkFwH6jN59DRNM2Rf2uIXREtz9g3fm3ORdHcT80Wj8kYHW0jl8Y4HYut6XtL+XIEv15Cm2weeBl/SWgpHBzm00XkgFHCaB58AZVu5v381XlZE1pEtyowoe4JwwuSrmnXuRdZP3cSLAVzBDOI=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CO1PR10MB4721.namprd10.prod.outlook.com (2603:10b6:303:9b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 11:01:03 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 11:01:03 +0000
Message-ID: <173b44b9-c4cb-e5d9-6f05-47e91a53f852@oracle.com>
Date: Tue, 22 Feb 2022 11:00:55 +0000
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <53b94f7a-a90b-3e9c-2e86-5d77410c46d2@oracle.com>
 <20220221075807.7415884a@redhat.com>
 <57e85450-e248-874e-78a0-06b74f8d3617@oracle.com>
In-Reply-To: <57e85450-e248-874e-78a0-06b74f8d3617@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::22) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d24363b-012f-4564-8078-08d9f5f29def
X-MS-TrafficTypeDiagnostic: CO1PR10MB4721:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4721011C7AFD466D54C7DF0CBB3B9@CO1PR10MB4721.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4I68WXXwkCKZUFlXCtedHo+FiFamVDNy7fCaQj+sKQuqMLinivTtt0shb3tghG069yIMWHNIqKhBNVhx3R1CpX9zxA7egmpnEUeqoFAN7kvFW/m94Q6QoelAsdX3C46OiHwC31+gns/6GP7l1AvMnRlL81/d1/PYCz++AWcJih7viq2an+TsKrzcXp9jPMxR0QgHhb7ehCJeUj3O0g+1qzI9imP1ZtC4ih0m+Drh5AmHqbUYRExOi8KKGB2PqPQU06LfoY96xUQ2fikVpk/HhTbG3VF7AfNK+5WPzzv+HpPziTYM1lxnts99tMAgdUBI8RGgNZFULKwX5Js4fIB7t9AqMP4OfImNsebo8gua+kV+BPkbSgr0xdrtmR9/FTGpvNm6ltnx+qmkksLCaA3ZNEhyI+69q2bmgoXg9jy+/mG2r/1hQUrDyxc7JcKeiQAX62lj8rTx4qlBJ64yY9Y0vZGfarl3jmotReHYzWmVuOb4uJJFjGkuizS7XLaGjorW77+kNRTvtwVlAryPLQ0AaG8p08wk/TdPng9fcmoZZX5QFQjwkMTMO/CicPAYEdK4cdoDPJ4RNPG3e3g92VaQJI0DejCRqxuJSOFEcTGllB85KC0B3lD7GN0deqI0BzF4rH0Uk/unGRNLyEeY34dKwwzR4OlERYBr/dNOeshncv25EVxQ5QG8B/FS1bIxfk6hxHTkFNcZD96exo3TFPgqqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(6916009)(316002)(6512007)(6506007)(6666004)(6486002)(53546011)(508600001)(8676002)(2906002)(4326008)(66946007)(66556008)(66476007)(7416002)(5660300002)(8936002)(83380400001)(31686004)(31696002)(36756003)(38100700002)(186003)(26005)(2616005)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elo3dnVQaUxXOXdtZnp2NDJ4M0R5MW5BakhJMktmMTl6RGFNdU9wODRTODBP?=
 =?utf-8?B?NjZmMDArd2Uyd0tMUG1Ud25QQVREUnV2VTE1Q05SQ1hQWE53Qlp3NXdobW9k?=
 =?utf-8?B?NGF0ZCtjdElKL2hCWWxodksvV05adFB1TzJMTzFWNGxIbzlPcFN6WGZNVVoy?=
 =?utf-8?B?UDNJbWpkdDY0bmFaTHZYYmRTQ3lWRWdoclJZV2t5blRiVjlySlc5YlVZcnBC?=
 =?utf-8?B?dVkwU2JzWnY2UzhVeUlzcGR2UHBtbTJPc1ZnK2FhNWltemQ5NExpNVNaYzlN?=
 =?utf-8?B?akNhSmFJVnJiYmxoclRoSjRNYmw2aFNYZ09YZkpXTHBvWGQ3Wjl3WFAzeGhN?=
 =?utf-8?B?RW05MHJJZmhHalRZS3gvT2JueXpJNk14UGRTQy9CZGFiU3oyd3doLzN2S3NF?=
 =?utf-8?B?Y1lyZkdhSHdDRk5ETUpON3orY0o1SlFaL0ttZmxlM2FrcVRBSjdNdkExOEFs?=
 =?utf-8?B?dWkrclJmcTJrRTAwZEx5V2pFL0JYNlk4cXVQYTRkWTMrcUY1elczWUt4aFNh?=
 =?utf-8?B?bnhabEdvQ3Z1NmhiWDZBOG81UjVaemZWNHdjSTUvbFRrdEgzdlVuSW1VM0dO?=
 =?utf-8?B?czVEL2kvb2w2bmZPUUZDRHFGdnMxajFPdE9KV0liV3dReEV0cXh1UHQvMHV0?=
 =?utf-8?B?VERzcHJWTDZjZkJ2cStseFFMdHJKMlNHNUJiODFlWUExNU1pMHlGQ2xLUEtX?=
 =?utf-8?B?ckNUYkpBeEdXcVh3S3pCRVJxdE1pSEgxM3VnNnpMdThXbjdYN1l1WW1YcjJp?=
 =?utf-8?B?QkttbDdJNjk0N3orMXVQSFU2K2pHcXJhSFZjd3FkU0tGcjVqNkcrT3RyRis5?=
 =?utf-8?B?WVNKaGVtVncyYnI1QitDQklUS2VIMGZBTGl3MXBTY0JtMWRaMm43cmsrTndn?=
 =?utf-8?B?WFNqMHR4YndBYWtmRXRQZzBsNFYralhpWDVyVWpBaDdPbFBkdlN0VGh0UXZn?=
 =?utf-8?B?WTh6NVN6a1EySEVtMFR4ZzBLZTJYWVVydDF0QXNyeUsxZTd1LzRMNmZKcWNm?=
 =?utf-8?B?S3lJd0V6eHY5VlhsNmdrRC82VnBEZkxBMEJhVDVHWSsyc3M2bDJ3ZEpWQmp6?=
 =?utf-8?B?V3hNYWZZS1c4R2gyemt2blIwK0tqNXc5V2NNV3F5TjFRNDhpOVVEOW1tSVZE?=
 =?utf-8?B?WU1xYlZ0enFUSEwyQmFHL3lQcmhFWkhmYlRpamZLYTlaSkdlRXN0RjFBT1do?=
 =?utf-8?B?cUpiKzUycTlBQmlKK3Y2M0h1S3lMaDJ4Q3FaK0dhOTdhVHJoOWZ4bU5WOGpF?=
 =?utf-8?B?dkdPMk9ZQ2pQZTA3YjJRSUdvOUpyVGdDMEtRRmYyNUlFa2JleUJSb2NsTGZ4?=
 =?utf-8?B?a3BBNmRxRnBWSUZTVER3ZzIwbVpDSU0ra2NMdXUwbUpEUDdjTExhUkErcEFu?=
 =?utf-8?B?Y2hIMlVacUw0MTh4U2xLcTMvc0h6c1M1bUJVRy9EUDRid0xDVkxGdXZEWWhB?=
 =?utf-8?B?R1kyTnJpSUxRbVpad1NNaVhxNVJCb2lrMDc5aVhlZ2tjOGp4UXNCdkd4U3pD?=
 =?utf-8?B?VjA1NFNhaHgyVnVYUlY0cHVjNTRNdUZNZE5STE5tQWJzQTBXMDVLYzFNOUtH?=
 =?utf-8?B?VXc0SEZ3WkN2bGVVUFozOFZMRHRBOGtSaG9kOVUyT0hSeHpIVENVYStlNGM5?=
 =?utf-8?B?Q2x4VXhDR1M4R29iN2VMQUtIaVdNYW9wZGhPODdqUWFoaDVsNW9IdDB5blpo?=
 =?utf-8?B?Zy9uSXVEQTMvQnYxWTNCUlA2dW9mVDRySkliSHduRGU5SGlqbG1PTTg5dE9l?=
 =?utf-8?B?M2VuZnFmcHpXWTB3M0hwLzRESXNmSERKcitGYWpOY2U5Z0k4QmVFMUZmdEp5?=
 =?utf-8?B?d2JhbTQvb0p3UW0zdy9KL0c0TU1uc0RDMGpmNThmc2ptekx0N0tRZS9VdS9l?=
 =?utf-8?B?bjBsdlNFSFVBQ0s5aHZpMDllcU5lK1F5dmtNTERWT0V1bTg5TWU1dGZOUWxD?=
 =?utf-8?B?N1NINUdpbU8rYW5XTGRERVo1QjlyVm9xOHhZd2YwQnVPZ3hBV3NmZ1dWYkwy?=
 =?utf-8?B?NFZLY1Zwd0Y3L3ZaTFlDZUVyR3hrcFptNk9GSTZmVXdlMEFNMitQQUM5cGVn?=
 =?utf-8?B?V050RnRrWStRTXgveHBGa3d0UDBkVHEwQ1lSS2hwK2t4enBLK0dabUFtY24r?=
 =?utf-8?B?L3Zkd1lnN213bTJSVnorV2tSY0tNV25RcjlNZTBqbDhVVmpVSnkwMDVwQzh4?=
 =?utf-8?B?SEVSQWRtTjBRNHQ2SFRxUG85eWJ1NFFXOVBmTURDWHFSUUVoNkR4bFU1M0RY?=
 =?utf-8?B?WXNDajVJRWdaWkVndEJTSDBhSEhRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d24363b-012f-4564-8078-08d9f5f29def
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 11:01:03.2745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JrN9kTA3PsbwieH48XWRp2LVtPs3wu1ZgJZ2/E06sXpOLz6A5O4aotK6xRG+05RYm0xrqKmcX0Vh7Wb0eQWxOMx4MUwvdja8ad8J4XSX/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4721
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10265
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202220065
X-Proofpoint-GUID: iacmjA8Cz8RsJZrBQnAb_5qOdtElgSD1
X-Proofpoint-ORIG-GUID: iacmjA8Cz8RsJZrBQnAb_5qOdtElgSD1
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 15:28, Joao Martins wrote:
> On 2/21/22 06:58, Igor Mammedov wrote:
>> On Fri, 18 Feb 2022 17:12:21 +0000
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>
>>> On 2/14/22 15:31, Igor Mammedov wrote:
>>>> On Mon, 14 Feb 2022 15:05:00 +0000
>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>> On 2/14/22 14:53, Igor Mammedov wrote:  
>>>>>> On Mon,  7 Feb 2022 20:24:20 +0000
>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>>>> +{
>>>>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>> +    ram_addr_t device_mem_size = 0;
>>>>>>> +    uint32_t eax, vendor[3];
>>>>>>> +
>>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (pcmc->has_reserved_memory &&
>>>>>>> +       (machine->ram_size < machine->maxram_size)) {
>>>>>>> +        device_mem_size = machine->maxram_size - machine->ram_size;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if ((x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
>>>>>>> +         device_mem_size) < AMD_HT_START) {    
>>>>>>     
>>>>> And I was at two minds on this one, whether to advertise *always*
>>>>> the 1T hole, regardless of relocation. Or account the size
>>>>> we advertise for the pci64 hole and make that part of the equation
>>>>> above. Although that has the flaw that the firmware at admin request
>>>>> may pick some ludricous number (limited by maxphysaddr).  
>>>>
>>>> it this point we have only pci64 hole size (machine property),
>>>> so I'd include that in equation to make firmware assign
>>>> pci64 aperture above HT range.
>>>>
>>>> as for checking maxphysaddr, we can only check 'default' PCI hole
>>>> range at this stage (i.e. 1Gb aligned hole size after all possible RAM)
>>>> and hard error on it.
>>>>   
>>>
>>> Igor, in the context of your comment above, I'll be introducing another
>>> preparatory patch that adds up pci_hole64_size to pc_memory_init() such
>>> that all used/max physaddr space checks are consolidated in pc_memory_init().
>>>
>>> To that end, the changes involve mainly moves the the pcihost qdev creation
>>> to be before pc_memory_init(). Q35 just needs a 2-line order change. i440fx
>>> needs slightly more of a dance to extract that from i440fx_init() and also
>>> because most i440fx state is private (hence the new helper for size). But
>>> the actual initialization of I440fx/q35 pci host is still after pc_memory_init(),
>>> it is just to extra pci_hole64_size from the object + user passed args (-global etc).
>>
>> Shuffling init order is looks too intrusive and in practice
>> quite risky.
> 
> Yeah, it is an intrusive change sadly. Although, why would you consider it
> risky (curious)? We are "only" moving this:
> 
> 	qdev_new(host_type);
> 
> ... located at the very top of i440fx_init() and called at the top of q35_host
> initilization to be instead before pc_memory_init(). And that means that an instance of an
> object gets made and its properties initialized i.e. @instance_init of q35 and i440fx and
> its properties. I don't see a particular dependence in PC code to tell that this
> would affect its surroundings parts.
> 
> The actual pcihost-related initialization is still kept entirely unchanged.
> 
>> How about moving maxphysaddr check to pc_machine_done() instead?
>> (this way you won't have to move pcihost around)
>>
> I can move it. But be there will be a slight disconnect between what pc_memory_init()
> checks against "max used address"  between ... dictating if the 4G mem start should change
> to 1T or not ...  and when the phys-bits check is actually made which includes the pci hole64.
> 
> For example, we create a guest with maxram 1009G (which 4G mem start would get at
> unchanged) and then the pci_hole64 goes likely assigned across the rest until 1023G (i.e.
> across the HT region). Here it would need an extra check and fail if pci_hole64 crosses
> the HT region. Whereby if it was added in pc_memory_init() then we could just relocate to
> 1T and the guest creation would still proceed.
> 
Actually, on a second thought, not having the pci_hole64_size
to pc_memory_init() to instead introduce it in pc_machine_done() to
include pci_hole64_size looks like a half-step :( because otherwise the user
needs to play games on how much it should include as -m|-object-memory*
number to force it to relocate to 1T and avoid the guest creation
failure.

So either we:

1) consider pci_hole64_size in pc_memory_init() and move default
pci-hole64-size (sort of what I was proposing in this last exchange)

2) keep the maxphysaddr check as is (but generic in pc_memory_init()
and disregarding pci-hole64-size) and advertise the actual 1T reserved hole
(regardless of above-4G relocation) letting BIOS consider reserved regions
when picking hole64-start.



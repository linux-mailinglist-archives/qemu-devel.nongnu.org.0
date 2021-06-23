Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C23B17A2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:01:34 +0200 (CEST)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzhL-0002as-QR
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvzfW-0001mn-8V
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:59:38 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvzfT-0008Mx-NR
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:59:38 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N9kJug017355; Wed, 23 Jun 2021 09:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Uaf3dOLxGcBtsGCoc1UbDPW5b8KKd3MQ6hZFdQmWWY8=;
 b=nSicah2W8TYnsGejX1Ni43xduuUO4oC5Zz0yJMQrJ2blrQrSnXmL6wIM2JprsMjvs+aM
 4RsImOmosKASStVwvKLWRIQl8XHqzqs19yLNoPV/1P7MelCgzZkcMxAuNTT6B69LxBiy
 Sl/i3f9mNRlIWYHlwyFezfFipp2O6oI6BrgEAK8awjdhS4X9qGaYtlpDtYkYi2WSWCve
 e97X4NL6Mev5gp4uwUFGJBqFhZga9owPja+njTubtJMDhUVqoqfN9g/PNpfzasaBhW6j
 r+O1Y/SsdHvNVS1i+ExI3ZFqmh7SDzwaYo7zzHcoWYc+KwQQLmuO4jxLhROfBwvnoyvf HQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39b98vbcuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:59:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15N9jtZE111114;
 Wed, 23 Jun 2021 09:59:31 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by userp3020.oracle.com with ESMTP id 399tbu9d4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:59:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGtSIJs/LmW3HBdy5tBvjj/R3KUn9vUkEGoI+JjcZhOjT0/Piu6eL46dObn9U7GnGHF9B+26N7ylBErbkt6YX+c1yuv4bi7Ba7Us9lh9a6mYXKOX2bIlQuN9T8TWbg61/kcg0Pgh7ORv/BQWy6kPbj4HmJYsH6cS6MHkfRO9I1aQ43A+LJrh6yVldWeuSjJQsDp7ri851gxhyheJlfR8Hd7wnU765kVBeAbSeT49FyiDgyR9ps6YYuTqC3hGsWN8uGTfECn8ihFEZdfeI0KeMLDgm3ok311Uy+8wgdil2gbZmxj2dcvi+VFz48lqAILE+1xPordB5Do7y2OrFiTGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uaf3dOLxGcBtsGCoc1UbDPW5b8KKd3MQ6hZFdQmWWY8=;
 b=kQNyrEr1PQgPQMzVYN9114iOIg7u9hPzVMHn6vzmo/3/uuuPxDdoJT/DhBcR8wYGyqTHsH27D3K4Tx4i6s16T/HYLtWP18rwpkN4jdPjWYNNwwqiBj3AoS4N/c50psZnVSreAiPFq/8vPF0tkEbn0BzjIl+ol34PHHZ2IZPAeghCB4SktC0aYcJIQWk2qJEYqsYEZYo+Pm2Yvuko6DLoGd7JO+BVVdmWl3cMIld+/zDNbJfS9UsvYh1WnUiWujSXa0oCXvOp1sjK1gOu2Jijz1WjSCTTrrtBN9sa3KQqQsbWoJZJN6m0xXVH2igfOmXARtDmTdZVhzyZB3zeE1aedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uaf3dOLxGcBtsGCoc1UbDPW5b8KKd3MQ6hZFdQmWWY8=;
 b=i/XiJ9Brl0kTgTSe9rB8Zk2zioFkVWHsIM53gu9kzkGaHJdiAa0aHVrSSHwcLUjtsvb0AP+LjKDfamHr652Wy4byOefDqqhkz//OpxgW6lOVx2RKc9ahpcfp+hUekP9Kov34mozNnTHgyKu5da0FovYMUjN64nC+h7PuhmGsuqI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB3919.namprd10.prod.outlook.com (2603:10b6:208:1be::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 09:59:28 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.018; Wed, 23 Jun 2021
 09:59:28 +0000
Subject: Re: [PATCH RFC 6/6] i386/pc: Add a machine property for AMD-only
 enforcing of valid IOVAs
To: Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-7-joao.m.martins@oracle.com>
 <20210623111858.6aaa3763@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <663f0e12-53f3-fbc8-bbfe-53960d1c52dc@oracle.com>
Date: Wed, 23 Jun 2021 10:59:22 +0100
In-Reply-To: <20210623111858.6aaa3763@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: AM0PR02CA0223.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 AM0PR02CA0223.eurprd02.prod.outlook.com (2603:10a6:20b:28f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Wed, 23 Jun 2021 09:59:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9d0185c-9aab-45a3-e725-08d9362d9719
X-MS-TrafficTypeDiagnostic: MN2PR10MB3919:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3919B24CD68428A882E4357FBB089@MN2PR10MB3919.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XFfN00WIzPo6tkvEt2v4N++mT7wAkcjYkCXa5ZnUQKSty/9J0uCXTgDtgh8YWgl/Hfv81Us6ID/UPGzpws+c9aezmlyzQ0mwhN6ikXCxvkL6f53MZ3FnGpsQ0hvbYBlB+hko9+BhBZdJPEALagb2TeQwPy7A90HxqmUXOk+sGB7fyeTfGFvgB5wPHcbdH4p/vk8qjcB9mZjFVa9EiiVnJ8kKl/bRDAO/PmT81ZsDLoD6ZuDyDl+fQDi6pGEMvGVpBUb0tPYRn5d/5EfgRjF6LBFE0eKVutPEP2Rb+S5kZ4OuCFC/5xsq88xURFOKiWN1wTvon7mgp0qz4ud0HG7NMPLytk2hRLFxKokHWQaddINeTOcvse+pQOkqEnsh8hbuCK+wPSog+/wYTx34H1SvTYzkeO/d66/0qwnEnpxVyc4CG+raoOd0aF91DXrc67AObVcEyeRFZ3NTQHOvL8ZECVcJWehdyd6REaUQPCHm9zjZTqB96N2AXUsayH0rem2UjQnbdt+I8uIVOsIuQEHAJ1Rvn3m6/RPdAk9PfddWX7GzbShtZlGaOYwkejefOegnQXMvFJsvT5sNfoT9H4Fh6WJtrVR+dLXMlmRnGPSo1x/O2fnw42WZ2FBCNgI1BXZwwkl9rP7goK3pmbNuo15zs79DqL6jfl9PLLwlbyGgpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(39860400002)(396003)(16526019)(2906002)(316002)(16576012)(26005)(186003)(8936002)(8676002)(31686004)(478600001)(66476007)(66556008)(956004)(2616005)(66946007)(4326008)(54906003)(53546011)(83380400001)(36756003)(5660300002)(31696002)(86362001)(6916009)(6666004)(6486002)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDJuUVh0ZW12WGQ5cWxLS2FvakRRUnUwOXQwV0FXdDVodkJBeG5NVTNBMmdQ?=
 =?utf-8?B?V05XcGRVVnhKZ28wUHhtd2FONEYydytlT2JDTFF1WGowRkEzZHlZQ0dFcTRF?=
 =?utf-8?B?cExDSmZRQUZMWnhZemo4dmVtcHBTalYyQnhFVm5nV2JxRWZ2b0VqaHlZdkdL?=
 =?utf-8?B?Y2l4dkREdVlDQ2Nvb2VTM0dnZnZSRVo0RklQeTNjOFFsSWRLcWJMaHJ6WjFZ?=
 =?utf-8?B?ZXpJaE5CUTFLeE1DTVpjRnJYenh1VjdmOFI4TjBETS9ldmxxSVhJalRkWExz?=
 =?utf-8?B?VEh2aU9WRC9mbitERC92Q1o0T2pCbWl0bHdmak1SbWIzb04zb0NiaWVDTlQz?=
 =?utf-8?B?bVFtcDd6K0ppQjI0NFprKzR0N2ptYS9VSXFVTDA4OVd4N095UUc2RjcrYjNI?=
 =?utf-8?B?MkphK3NKOGdSU290QWZ5dFRRaTRXNmVJRXlxTDV0TlpYQXgxWWl1dEtKS2xt?=
 =?utf-8?B?TVFXWmVzU20zalBkVmd3R0Q2OTFCZFdXcU1lVERBSVZQRWFhRDZVbFFsNFFY?=
 =?utf-8?B?cUhHZ0ZXNUNYa2JmVHRYNWt4VC9IbktWc2VhWGhmNU9SdzNFbEc5WHlvcG81?=
 =?utf-8?B?L3VwUnIxajJrY045REkxV2lWMmw4cThleWdvZEwreWxOTDFqMy9yUTZiMTgz?=
 =?utf-8?B?aHlGK2hjcDBYd3htTUVNT2VjeFhGWlJNaGlsZlFTQnZQNVQ1UWJzc3M2d3hi?=
 =?utf-8?B?RmU4ODErbW5iQ084RU5HcTVYd2dvS3ZTOFdkMEZ0S2xxeStldzZuMGE3T0tC?=
 =?utf-8?B?SzMrWmNMalZpUnNiM3JKZ2hYZDZVUUJ5YmFaVzZrTlI1UEJqVng4bHpweGlJ?=
 =?utf-8?B?T1pQSnZWUVZoOUJxZUNhbTlaTDdhR0VGRlJodWp4cWd3QUdPbTZMczNnQjhT?=
 =?utf-8?B?VHJmRVppTDRWaXNhN2FyNTFGVThjcC9tdFM2MzdMVzg1OFA5Y2ZJRVBqMFRa?=
 =?utf-8?B?NlpZQmJoM1NuL3dCWS9nMzZ3ZWJacE5FbEpGZjJ0YVRNVTVQL2JZaThTV3hq?=
 =?utf-8?B?MDE2cmNwdDhzTTd5NlBTNWswNkxmcE05TlJNY1B5Z2ROc1U1TWdnVGllMDNn?=
 =?utf-8?B?ODZYKzgxMm84UlVSeDJzdkoxeWUxb1dMUUtkZ0FFQjFaMmdzTmlEbTNQaW9Q?=
 =?utf-8?B?ckpvTGFnWEl2VU0zOURQeWdvckxmUzlqT21uVE9pQjl5cWUwSzFreXp6Q3cr?=
 =?utf-8?B?RlJNZ3JSVDVJbE1Yc21kY09kZ0wxaFZDN0lic0pqWElkd21TYlRKbHZ6a0xt?=
 =?utf-8?B?cFMzQnErOWppeDBvelgyMXpRNkVrMkpkTGRoWUlBYnpWajZYQ1BGbWZXeEk0?=
 =?utf-8?B?ZHZ5NVNOZTZ5OS9hQ2ZPbi9vdlpUS2wvbFNMMUJhUXpKd1ZQZSs1eGRaSUhJ?=
 =?utf-8?B?b0NuL1BkcWZuakJjaFlSWmVSNGpESURkMlhrN1ZCS2IwSmJtTTkzK2NBbHJh?=
 =?utf-8?B?OTVsbVVwbHhGUEhZc1NxV0g2aE15bWMvK2lJeXdLY25zdVNzUlE5NFpoREZ4?=
 =?utf-8?B?c04zQkdpS0FWZnlWZzBGZDNtS3VVd0NBODR5czFZc3NYR25rTHRIcHIvaStz?=
 =?utf-8?B?eGJkVk1nYWVPSXkwd2IvRkJSWXRqVEI3Z2xZbmZuc0NGZFNQV044ZUU0REdy?=
 =?utf-8?B?TzJBVk9KMXZacDNhdTU1MzRoTS9vSGp5QUxEYjI5Q3hJaEFWNlZJUVhrK0xn?=
 =?utf-8?B?K3VBT2ovTnhjcWd5WXJhZmU1SHhiUm5lSXFYOGxpQ3l6YW0veGRuVkpMVHJP?=
 =?utf-8?Q?M9IEXTJIcTQEucQPybxZuiKmwl6P4U2PhWpipP0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d0185c-9aab-45a3-e725-08d9362d9719
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 09:59:28.7564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bE3xU26vO7GcA9ohdk6Ci5SoHfa6TERb4an2NXj7NLEwMh+z/crhoPxozOBWQFd709rdUAOfFjQu3P/gKWDVJKRd2+luxQP4nJgoC1SzizM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3919
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230057
X-Proofpoint-ORIG-GUID: qt9DpPmEjyEpj8UfnOq3UAUmlWUIBLPX
X-Proofpoint-GUID: qt9DpPmEjyEpj8UfnOq3UAUmlWUIBLPX
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/23/21 10:18 AM, Igor Mammedov wrote:
> On Tue, 22 Jun 2021 16:49:05 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> The added enforcing is only relevant in the case of AMD where the range
>> right before the 1TB is restricted and cannot be DMA mapped by the
>> kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST or possibly
>> other kinds of IOMMU events in the AMD IOMMU.
>>
>> Although, there's a case where it may make sense to disable the IOVA
>> relocation/validation when migrating from a non-valid-IOVA-aware qemu to
>> one that supports it.
> 
> we can keep old machines broken, that's what you are doing in
>  *_machine_options() but for new machine it can be unconditionally
> enforced.

Yeap.

> So I miss the point of having user visible knob to disable that.
> (it's not like one would be able to find a new machine type that
> do not support new memory layout)
> I'd drop user visible property and keep only hunks need for
> *_machine_options().
>  OK, I'll remove it.

This was aimed at just not changing gABI for older machine types, thinking
in migration.

>> Relocating RAM regions to after the 1Tb hole has consequences for guest
>> ABI because we are changing the memory mapping, and thus it may make
>> sense to allow admin to disable the validation (e.g. upon migration) to
>> either 1) Fail early when the VFIO DMA_MAP ioctl fails thus preventing
>> the migration to happen 'gracefully' or 2) allow booting a guest
>> unchanged from source host without risking changing the PCI mmio hole64
>> or other things we consider in the valid IOVA range changing underneath
>> the guest.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c         | 29 +++++++++++++++++++++++++++--
>>  hw/i386/pc_piix.c    |  2 ++
>>  hw/i386/pc_q35.c     |  2 ++
>>  include/hw/i386/pc.h |  2 ++
>>  4 files changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 65885cc16037..eb08a6d1a2b9 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -902,10 +902,14 @@ struct GPARange usable_iova_ranges[] = {
>>  
>>   uint32_t nb_iova_ranges = DEFAULT_NR_USABLE_IOVAS;
>>  
>> -static void init_usable_iova_ranges(void)
>> +static void init_usable_iova_ranges(PCMachineClass *pcmc)
>>  {
>>      uint32_t eax, vendor[3];
>>  
>> +    if (!pcmc->enforce_valid_iova) {
>> +        return;
>> +    }
>> +
>>      host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>      if (IS_AMD_VENDOR(vendor)) {
>>          usable_iova_ranges[0].end = AMD_MAX_PHYSADDR_BELOW_1TB;
>> @@ -1000,7 +1004,7 @@ void pc_memory_init(PCMachineState *pcms,
>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>                                  x86ms->above_4g_mem_size);
>>  
>> -    init_usable_iova_ranges();
>> +    init_usable_iova_ranges(pcmc);
>>  
>>      linux_boot = (machine->kernel_filename != NULL);
>>  
>> @@ -1685,6 +1689,23 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
>>      pcms->hpet_enabled = value;
>>  }
>>  
>> +static bool pc_machine_get_enforce_valid_iova(Object *obj, Error **errp)
>> +{
>> +    PCMachineState *pcms = PC_MACHINE(obj);
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +
>> +    return pcmc->enforce_valid_iova;
>> +}
>> +
>> +static void pc_machine_set_enforce_valid_iova(Object *obj, bool value,
>> +                                                  Error **errp)
>> +{
>> +    PCMachineState *pcms = PC_MACHINE(obj);
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +
>> +    pcmc->enforce_valid_iova = value;
>> +}
>> +
>>  static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
>>                                              const char *name, void *opaque,
>>                                              Error **errp)
>> @@ -1851,6 +1872,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>>      pcmc->has_reserved_memory = true;
>>      pcmc->kvmclock_enabled = true;
>>      pcmc->enforce_aligned_dimm = true;
>> +    pcmc->enforce_valid_iova = true;
>>      /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
>>       * to be used at the moment, 32K should be enough for a while.  */
>>      pcmc->acpi_data_size = 0x20000 + 0x8000;
>> @@ -1913,6 +1935,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>>          NULL, NULL);
>>      object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
>>          "Maximum combined firmware size");
>> +
>> +    object_class_property_add_bool(oc, PC_MACHINE_ENFORCE_VALID_IOVA,
>> +        pc_machine_get_enforce_valid_iova, pc_machine_set_enforce_valid_iova);
>>  }
>>  
>>  static const TypeInfo pc_machine_info = {
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 30b8bd6ea92d..21a08e2f6a4c 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -427,11 +427,13 @@ DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
>>  
>>  static void pc_i440fx_6_0_machine_options(MachineClass *m)
>>  {
>> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>      pc_i440fx_6_1_machine_options(m);
>>      m->alias = NULL;
>>      m->is_default = false;
>>      compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
>>      compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
>> +    pcmc->enforce_valid_iova = false;
>>  }
>>  
>>  DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 46a0f196f413..80bb89a9bae1 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -357,10 +357,12 @@ DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
>>  
>>  static void pc_q35_6_0_machine_options(MachineClass *m)
>>  {
>> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>      pc_q35_6_1_machine_options(m);
>>      m->alias = NULL;
>>      compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
>>      compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
>> +    pcmc->enforce_valid_iova = false;
>>  }
>>  
>>  DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index b924aef3a218..7337f6f2d014 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -63,6 +63,7 @@ typedef struct PCMachineState {
>>  #define PC_MACHINE_SATA             "sata"
>>  #define PC_MACHINE_PIT              "pit"
>>  #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
>> +#define PC_MACHINE_ENFORCE_VALID_IOVA  "enforce-valid-iova"
>>  /**
>>   * PCMachineClass:
>>   *
>> @@ -113,6 +114,7 @@ struct PCMachineClass {
>>      bool has_reserved_memory;
>>      bool enforce_aligned_dimm;
>>      bool broken_reserved_end;
>> +    bool enforce_valid_iova;
>>  
>>      /* generate legacy CPU hotplug AML */
>>      bool legacy_cpu_hotplug;
> 


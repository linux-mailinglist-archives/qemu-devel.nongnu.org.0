Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220D6ADBBC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:22:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUSv-0008FB-HH; Tue, 07 Mar 2023 05:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUSt-0008Eh-6X
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:22:39 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUSr-0003NZ-Ha
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:22:38 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327841Od017159; Tue, 7 Mar 2023 10:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=/8IhNoQg5wI1J8146EQ0iVD+k/z0QARWQ5E0/5gnnWE=;
 b=zNd15+Kac0NH5D94g0Otk2GoXcspzcizNQcURpUQghxn6skI8GIG3oXiNhcaGwPHSp+N
 8J86CDcDXVAT4WYx71lzLHZAGITXlKlfD1O9GQUvM+6b8bkeH4Zg1ckhDDaIT4LVklWv
 +ZMfkEJtE2jULFFnc602t4pxgqmYWg//XRrKt5rDRyuzH3PgJ0D6Fgodt0uMWED0ympx
 CnDDkUMr14nSBPQdmicOcyrf/lWantZI3oMmmAWHZMBWoOquZ27p8TfdShU2cCnmv3Oi
 DHiFf8VzGRSN24ZyKyG9RC7FLVJ749f51FG37RPcCJXPBEKrC8WbfeCq3tSwK24fEouc ww== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cd5jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:22:35 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327AA7Jn026620; Tue, 7 Mar 2023 10:22:35 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1et85b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:22:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEm1m+15KVcnEgVKAzgH2HEz8ht87pqPyO4xxnQ5RxGihh7Gqyr6G4UOYVt4wvCTabJIvxbQpj3fIGFAjvmqTnTmspjjc63ZHDKsqUMtiP+bMNbpLpWWsc2isidxAQVLE7ml6FhEJag+FnOeBSAip9m2lPvXgaIFjz+agjTRw4wu2R/ctVKaEiJclVWAcfAJagu7XlqPzQn2qDmIDY36xsAWMpd+WdsjBPyN6SmKwPYDIBLuhjeIg33usQrv6MOyey4K4f06CrIWGluJEnBoRlaBeTBywpFKBmtlUosCx9cIWFrpz2ZBm3/4BXJJsuuoL2nO0ONdnXnWamVbEvNC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8IhNoQg5wI1J8146EQ0iVD+k/z0QARWQ5E0/5gnnWE=;
 b=g9bjLdWqjDwvrJ3SvWRGXlkgbtlXrUnvjt4dpZb4p0uxuCXcdZZoDHrja6Jt7+zmLl8/BeKBx6Lo/lwNgCvYLbgCu5twG5Qa297oEG9Sgf4MH/aAFyrcn7+O+rbjiNC+p3VTfdfq28I8WzwNHk8moRMTungUA0CMY20RL65CiKcsnnVBhWCWFdbBOypZv3vKgmUwVifW969tDqmdjmBhnKCS6hz0AxwoWqp1cyQagDnOK1TJVlT8SQ+Wn2TKrN5xWSKylPhoeT8c6PcmqDpWw8hgWifcSIHqHhzBcVdZDFwtZLvWNGZveb5UBguwXLrGX992TfK8TWOkS8R/seS24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8IhNoQg5wI1J8146EQ0iVD+k/z0QARWQ5E0/5gnnWE=;
 b=Oy0h8H6d6dVoq54P25FsGSBq19k4AeRerZRQX78f+w9AXY8xKTlJO9z2adM4lToWKxDaaVQ02unHPpI+Cb0wMnSiu9c0LWAjNOr3pm/xOCkideVa0TJo65RsEZaO7MP15ox9gyhMFoCcyQBLti7MnW2i1m5aZ/KNku7FvptjTvw=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY8PR10MB6515.namprd10.prod.outlook.com (2603:10b6:930:5d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Tue, 7 Mar
 2023 10:22:33 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:22:33 +0000
Message-ID: <4c6fad10-a71f-7b8f-87d5-09c57b0cfc70@oracle.com>
Date: Tue, 7 Mar 2023 10:22:27 +0000
Subject: Re: [PATCH v4 06/14] vfio/common: Consolidate skip/invalid section
 into helper
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-7-joao.m.martins@oracle.com>
 <8ef23f46-a5c7-2723-42e3-6f5efa7f993d@nvidia.com>
 <e9773720-77e5-4e93-3b24-e01dbbefc817@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <e9773720-77e5-4e93-3b24-e01dbbefc817@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CY8PR10MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d703d03-9bff-4e43-76e2-08db1ef5dd60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DPhVAbFB/H8nr5NYNe+CWyQrNcpNqSq7D3pMAyv9GmWuVlL9FjgM+Iwk93MovAdIICz3rppcEGBTwGiTKGu561VMbYsZPYyO9jikUpz4dnnHPxd7LmqdEummDDKUzY92/KFHLsEEFxaWsBADd99QAiLXTR1kbp38DxxcBF+2YoMx2fBy/75ZAOu8F8s6+tnkZ3xUaPLg0hXZbbigWvrYsRv8H8b8JBWrJE2nnJryZ/K4biBeU+yzJeIFDz9n2FOjszSr+CJY947qr7bwTm0w6vhfgWr1p4v8eVEH+DvXyo9zJC/6iKhtepy6rIVDR9I5C8mE2PbcKGZIgwP/pa7SIrlzNWmPUSw57D+wLFqG6CyRnQVzgCY5Rr0CBKippHHJTaqbQvaO27c0LJkzXUXa7HiOS7xZR3Jsy1IJ/NjeliG7nveT60g00TFc3XlKanEDwCTtRqUaiHp/m8XkLXY2aRwR5wF/9A3U1wXC+yIYXPF5kNPFQaTeNPObsxeTqklEyHDtL2NVWBtCGHO0BMjI+PUQ0FsHIJpYMtOi4h2r0xIGApHDzYV2tsxyLOzagjQJGZ1G9GAGNl8H5YWzxc2tPM6fN+9ud0fJbvFIFnAkysNExwxKE87glCPjBvtyZOAdaTAEUeDWGzb0YfsnZvram3WBP74eipH3ty17iNzt5F8qSru25W8lrIUbv71qj8ddqpvFNlulPfwPtPIwUhyFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199018)(38100700002)(36756003)(86362001)(31696002)(4326008)(66476007)(2906002)(8936002)(41300700001)(8676002)(5660300002)(66946007)(66556008)(26005)(478600001)(66574015)(2616005)(83380400001)(54906003)(6486002)(316002)(186003)(110136005)(6666004)(6512007)(6506007)(53546011)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU5lZnZoOHhUamNXSENYeDV5RWhMQys3amNJcXpmRUprOEhZU00vUjI0ZjFl?=
 =?utf-8?B?Z2g0eVJiaDU4SWF4R2lPOHhqT2xRZER3bnlWcUNZbmpFQ2x1YzlZaDFKaTI2?=
 =?utf-8?B?Y3g4T0JLOU8zOTV3WFJjREVNNnRTOWFSU1paTnZRRHp2dW1LR1pMOGl4ZnRs?=
 =?utf-8?B?ajhvT0J4VThsWHp5WjAweVJwT3QreVpZVUUycm50R3E2eU5NY2VOZDhJYnpk?=
 =?utf-8?B?WGZ6cXljUmdaVGc1Z2pzZnBqam9QODlyMW9kNUZDOGJYY09qU0NxNWROWmNh?=
 =?utf-8?B?bUZTa2RRampQTlpzbUlZVnl3WHdYZDUrMi9zN09LbnRTQzdEWWtHRTl3VEwx?=
 =?utf-8?B?VDVkLzk3VXMyK0ZjOXV3MGVCME40RGVZUGp3YU9Ta3FheTF3M2ZLcHlBSm9S?=
 =?utf-8?B?RVRIOFNFZFNjWGN1SG5KQXRNM0NSRGxXK05UYXJRcEljUTIzMWVrelhydDI5?=
 =?utf-8?B?dFd2Qlc1cFIxWWRIZW9ucXEyTzVxYldvVWV1Y1V4L0lhYi92US84SmNWRk9z?=
 =?utf-8?B?bncyR2hmSFozQ21OZkhFam0wUlZsSWt1OThjcG5scHIySzJBbFZlN0pSd0hN?=
 =?utf-8?B?OE16bHprSVd6RVFyZk1RRmdEYkZYRURBaDVtNkRobVQxd1hKK3JUTmNWNTRs?=
 =?utf-8?B?SzQ1OHdBczNkbldsdFg5cnRFQ0o2bWUvcGEzR0g1dEN5ZVM0RzVwcTVXZjU1?=
 =?utf-8?B?aXFnRUdXQTlZa2VjbnNLWHlUZXVXYlYrVksveFVVc2x1K05Rb1F0SFNGb1Y1?=
 =?utf-8?B?bEhrM2Z6RGVsSVpnMFhkK1A5bzMxYytmYTM3cEJENkRmZWYwdWtMeEUvVHhF?=
 =?utf-8?B?KzIyL3VXdHk1ak4vTmR2VzVoUTlCeGk2bnhwOHlkWUZ4WDF0M0lHL1huSWxn?=
 =?utf-8?B?bjFmR2Z6cFh0T3IrNkVvbXNGRlRoblN1YVdjdlpSTXMrYXk4bm54dGd2Witn?=
 =?utf-8?B?VnRLRDhucE5kT2ptbXI1ZmxZcEtiZEg4RHNlK0F5T2V2RmZoYjZGbG9kNjdY?=
 =?utf-8?B?TGVGRUhpdFRUc2FKWDAyK29oUnBsbzdISUhPaGg1SkNLdDBpbzFRbzE4b0E3?=
 =?utf-8?B?a0lTQnJpOGdpcGExdHBaUFAwc1NMZlR5YW5nWEVLV1k1Sk8zeEx2Qjlsd09l?=
 =?utf-8?B?dGU0V3UxSWU5eWtYREJPUXBOYkpCcUU2dHl0QVMvQVZ6S2R6dkZTOXh6QURP?=
 =?utf-8?B?UkJQN0JHRXZwRVJOTTlwL2pmOFNSSzc0eTk2SjA2SW5HdFNOSkZDT3NxV1Bh?=
 =?utf-8?B?WDBKc3p6UkthNEF6aGk1a2REUitqUnkxcE9mSVhsTlpCTTNPNkZmS1kwMk1J?=
 =?utf-8?B?MjZsdGVUV0UvblBHM0N3MUxyNUJFR0U1aE43NVF4QW9uS0FWUjVrdUZiRngv?=
 =?utf-8?B?d29kRml3VktCQlJTbWpYUFpNaXlkWWVZUklpM3dNa3lPSTVOV0thRFhpV2JH?=
 =?utf-8?B?N2FOZThLQUdKb2tpUDhVdzBSbXlDcHoyUDNtb082NVhwblM3UHJtZStDZHpJ?=
 =?utf-8?B?SUJwK2UxcXdTNXlWVitWMVRHbHJxSExabHd5dExxZUpuQWNVSldmTC8vdlJ2?=
 =?utf-8?B?bFZiZEtNZVJWM0ZhZFFFeHRFMHVnQzBHZDFnYkdSTDZyRlJva3BqTURjeTR0?=
 =?utf-8?B?SnZzZlVOT2xBM3VaMThIdStTVUs5QnFzVVJDOFZzaU9BbXdYcnR4TTVrUkhM?=
 =?utf-8?B?VXlURzlvRDhTK0VqbXpJQkJjSmg4L3Z5TVoxbXFMN0lpSDVzVFdzVnJjSHZN?=
 =?utf-8?B?S3FxK0ZLdUlHRzJ6OGhaUmhHV1VjUGlkUk1WRjJ0VW5rU1NaMWtPaFo3cHRG?=
 =?utf-8?B?bjNKK20xNWhoUk1FY1RNRHlTb1R0WG5iUnJZNFhaY09CYW9CSnp5L2xiNlpG?=
 =?utf-8?B?cGV1YU14OHQzeTJWZ2VUd3F6NURaN04vSSsxNWUvQUxTOVBkWmNodk01ZFhi?=
 =?utf-8?B?NzVZOGo2eklESlJWSjhqaGtJbGNiWE5DMHFlckFZRlk1Y3d1cjdkTFBOelJ4?=
 =?utf-8?B?VVZGbWVSa213V2hLQXRsYmJhQUxINzk4MjF2b2wzdWtrUVlTcEhzSEdMRi9H?=
 =?utf-8?B?SjV3akI5RE5nbDdMZk5saGluV0JINnFLZGdkK1lBNzVxRURObWgzNXhwcDkz?=
 =?utf-8?B?Y1NidlpsQXNjT0haU0IrQ1QzVDdObDJpeFU4eWhZSE83SVU1NTRsV3JpbTdY?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: HRmmtR2JmmfVgzAzZHf9yKWuPMnF1oEvuqqzNOuN2o/ZLNnhMOI+k8a0TvJWaKUpZtCzidQ4zRbCOf7atBoQ9bUmcUupYjy6zyX4cCF4BA7PsWELXi78Z48LTW8JpiCZqYjaiMM/8+u17DWgw8m8onVQwpttnow2d0lCwpEILKQ8wzm7Fq70cPOM6FoOpZi+7v22+RSJf/DAhzGCo5K0K6kziOdGL7u7mSjSfbE4HQ5UehHWjJ4TA4W3cqZjj0AMU3fH/lHaoEudb6JFvvRnmbKGk5DsHUkVMExOIVh/6+aWeuPXEeyB5MqhhmZMrEIgONYvUbZz2MApt5lsECvqAM+HBx2cKhBhjYt1ywzLJI+Zy4xXoQibdXSHZto8IeO937OJRV/BWI5x603Z2cq9EzryX+nG5cOwpcfKalffpKD9GCApnIHrWlAUhkHNIUDDL6WcIk/F/uWCHDwwn9ACOHoo6x9S5XcPVAe+vLoIPo7JYfQLsURohsZ0Ap20iCYpoo0goVQ4GYPAqUYe6RcmBSsRsAuyoorgewvN3OujeTNN5bQ0VWSX0uJ2/3868kCT3BAJkY3YsnU9mAHAoWrY7zyDoU0NeZ5/3H71PtSXOkfdHkcx8oRjdpVRVxxIszd40kPD0Y1ku1WMrAd5nrxGZTmU7hrQg4Mpa5rMf2GH6HibmV3NTjblh/a79TK+FAIM9N5rUG9lzJr0uaKBA1/mm6OKn0bSr+Qui2ciilPnppJDpWSmP9aUZS1F+1Z29Cq7gbWQld6JxbJtyURL/HB4Ju+MotPi7bgRVWMTol2C7mOi4Cf/igPDZCfY+LYx0OB8
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d703d03-9bff-4e43-76e2-08db1ef5dd60
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:22:33.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJmxQP3UoeF8XZ9yqDss8QfpOgT3Zq9uAOo3ZYgiljABh1RPHsVtqy91lqqZMu5/8wwYxmQD9vx9gaXDB/p+WhP5wxLQrHRpUS6UX4FD8Y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6515
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=827 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070093
X-Proofpoint-GUID: OXP1jgiLWr28QtBeEuxSTgmsAv9qahew
X-Proofpoint-ORIG-GUID: OXP1jgiLWr28QtBeEuxSTgmsAv9qahew
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 07/03/2023 09:47, Cédric Le Goater wrote:
> On 3/7/23 10:13, Avihai Horon wrote:
>> On 07/03/2023 4:02, Joao Martins wrote:
>>> External email: Use caution opening links or attachments
>>>
>>> The checks are replicated against region_add and region_del
>>> and will be soon added in another memory listener dedicated
>>> for dirty tracking.
>>>
>>> Move these into a new helper for avoid duplication.
>>>
>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>   hw/vfio/common.c | 52 +++++++++++++++++++-----------------------------
>>>   1 file changed, 21 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>> index 99acb998eb14..54b4a4fc7daf 100644
>>> --- a/hw/vfio/common.c
>>> +++ b/hw/vfio/common.c
>>> @@ -933,23 +933,14 @@ static bool
>>> vfio_known_safe_misalignment(MemoryRegionSection *section)
>>>       return true;
>>>   }
>>>
>>> -static void vfio_listener_region_add(MemoryListener *listener,
>>> -                                     MemoryRegionSection *section)
>>> +static bool vfio_listener_valid_section(MemoryRegionSection *section)
>>>   {
>>> -    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>> -    hwaddr iova, end;
>>> -    Int128 llend, llsize;
>>> -    void *vaddr;
>>> -    int ret;
>>> -    VFIOHostDMAWindow *hostwin;
>>> -    Error *err = NULL;
>>> -
>>>       if (vfio_listener_skipped_section(section)) {
>>>           trace_vfio_listener_region_add_skip(
>>>                   section->offset_within_address_space,
>>>                   section->offset_within_address_space +
>>>                   int128_get64(int128_sub(section->size, int128_one())));
>>
>> The original code uses two different traces depending on add or del --
>> trace_vfio_listener_region_{add,del}_skip.
>> Should we combine the two traces into a single trace? If the distinction is
>> important then maybe pass a flag or the caller name to indicate whether it's
>> add, del or dirty tracking update?
> 
> I think introducing a new trace event 'trace_vfio_listener_region_skip'
> to replace 'trace_vfio_listener_region_add_skip' above should be enough.
> 
OK, I'll introduce a predecessor patch to change the name.

> Thanks,
> 
> C.
> 
>>
>> But other than that:
>>
>> Reviewed-by: Avihai Horon <avihaih@nvidia.com>
>>
>> Thanks.
>>
>>> -        return;
>>> +        return false;
>>>       }
>>>
>>>       if (unlikely((section->offset_within_address_space &
>>> @@ -964,6 +955,24 @@ static void vfio_listener_region_add(MemoryListener
>>> *listener,
>>>                            section->offset_within_region,
>>>                            qemu_real_host_page_size());
>>>           }
>>> +        return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static void vfio_listener_region_add(MemoryListener *listener,
>>> +                                     MemoryRegionSection *section)
>>> +{
>>> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>> +    hwaddr iova, end;
>>> +    Int128 llend, llsize;
>>> +    void *vaddr;
>>> +    int ret;
>>> +    VFIOHostDMAWindow *hostwin;
>>> +    Error *err = NULL;
>>> +
>>> +    if (!vfio_listener_valid_section(section)) {
>>>           return;
>>>       }
>>>
>>> @@ -1182,26 +1191,7 @@ static void vfio_listener_region_del(MemoryListener
>>> *listener,
>>>       int ret;
>>>       bool try_unmap = true;
>>>
>>> -    if (vfio_listener_skipped_section(section)) {
>>> -        trace_vfio_listener_region_del_skip(
>>> -                section->offset_within_address_space,
>>> -                section->offset_within_address_space +
>>> -                int128_get64(int128_sub(section->size, int128_one())));
>>> -        return;
>>> -    }
>>> -
>>> -    if (unlikely((section->offset_within_address_space &
>>> -                  ~qemu_real_host_page_mask()) !=
>>> -                 (section->offset_within_region &
>>> ~qemu_real_host_page_mask()))) {
>>> -        if (!vfio_known_safe_misalignment(section)) {
>>> -            error_report("%s received unaligned region %s iova=0x%"PRIx64
>>> -                         " offset_within_region=0x%"PRIx64
>>> -                         " qemu_real_host_page_size=0x%"PRIxPTR,
>>> -                         __func__, memory_region_name(section->mr),
>>> -                         section->offset_within_address_space,
>>> -                         section->offset_within_region,
>>> -                         qemu_real_host_page_size());
>>> -        }
>>> +    if (!vfio_listener_valid_section(section)) {
>>>           return;
>>>       }
>>>
>>> -- 
>>> 2.17.2
>>>
>>
> 


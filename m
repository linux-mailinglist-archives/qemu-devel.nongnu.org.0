Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2385F569119
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:51:14 +0200 (CEST)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o99BB-0003UR-0D
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o9970-0007rC-Bf
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:46:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:4408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o996w-000633-R2
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:46:54 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266GPZ9v010478;
 Wed, 6 Jul 2022 17:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=dxhC9QM92J+a5LUDZ8W8yOszie+dvzC5hz7TN5XDMSc=;
 b=fx5t+LMoi8cQvYHw+t1fJcNnhiAZluaQxJ06Bz5WgYs7BKPFtv/AnmyV+MxsWRP6hnJx
 Z8h4u/lgFs05KuTNmwiEYjwyLgO56/GquvvD2OYDsi0W7PRPxehGDcYtIH6cM6LDumsB
 PiOeY5t0eIIYiS5xPgeAR8fsqlXJvpH72UN28hAN8jFwNy1QpVYMWBIXzhfp2lQYXB9w
 nGubMvCIF36gsZeFIVFDuhAFSCu5WPJSPk5acqbDnUHTgiRNAqT6k7QWmB8PmvWtIhzY
 vkRDZ6twNPdAIgxG0+2v+6dAyJ8VibC67sAKtKxgQG5dwYj5V5giczAj16c3Y+lXfpCs iQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyaqqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 17:46:37 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 266HfIJ0016387; Wed, 6 Jul 2022 17:46:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud60r0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 17:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLnc06UAKl1KwYhNr1sCmszFbem0dJAnZfatKbsYK7U/5V9gp20I+VnpB3JQpHjCLdQEkUuMgPRc3AO6kFI6HDvwIU10aqR6Ywd/u6UyGYDTjCiDnsnfeFWihBsrkqdcA89hyNrY7QlknaBSe7OWKIl8VgJ/jM93h9cR9QPY9wnNGEi9dMchgaSLyHcwB1NEu2d5b9p45po1603HJLoOfDB8cDqSKZFCVlJrJCuR+Pu/N+tGLdjh5x3B2RG9DDEomkU1dfb1TO8uRZNuxljSXkVfAfdjJzV14kWyD6jNbu/lHKlEFEfGCv6v7TW8lYsDNjWpoIrRHchSoukSI8mJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxhC9QM92J+a5LUDZ8W8yOszie+dvzC5hz7TN5XDMSc=;
 b=oT/9qiJmL9RJR1X169U9ID3YWui8reAqi89Vt3RvLIVf8aMyZ++kWQdUOCDAD6VZJgDpSBWpbMXeDW2sGTGBW560YxSFBmQGyy9wls4ix0N+VZSKpxbTs5VedjF4xg5aqCOLlqVe7TQeoh95mZBMylwgFiblhxHMpSuFepKa37joqw0xtmWCS7Nux3cRdOEpojnhLLos9AKYaG4cxbITfY3R5qYjfVuT14tVz6+fNycjTn8j9PIp0AONEePsa5ENdXJ9TmDFgu0WqaQI7Ii253oLd0JbdDn65U7ofkkt7/GIzoL+dOvdI7LqdCQUYOZf0bakJKDYghly6pMGJ4TlgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxhC9QM92J+a5LUDZ8W8yOszie+dvzC5hz7TN5XDMSc=;
 b=jZbHG1PDQtjZfRXqJPEQ9NyVPU8uxmUFvlkm9cb2JQXv64m7elkR3uBUPQ94R6Y5wnYa81OgruiTylBcNygqWCGq1f2o0W01VnzwvkvR0qV7UXatNy6CNOOcBvp7fLyAQrvUpFxKuR4s6j/uISxbwAcgjZi+TumXxuzsT0mpDeE=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SN6PR10MB2671.namprd10.prod.outlook.com (2603:10b6:805:46::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 17:46:00 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 17:46:00 +0000
Message-ID: <1a3d55fd-8736-97ff-06bf-824965ea77a8@oracle.com>
Date: Wed, 6 Jul 2022 13:45:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 27/39] vfio-pci: cpr part 1 (fd and dma)
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-28-git-send-email-steven.sistare@oracle.com>
 <20220629131455.3aeabae8.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220629131455.3aeabae8.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::44) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7fc0461-232e-4fde-641f-08da5f7762dd
X-MS-TrafficTypeDiagnostic: SN6PR10MB2671:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUxq+YrWVFCwOCyXD9gaIyoosJTQCZyQ4Pbeu+jEW+y4OovWGPM7hmN9JDT4l6cYaEOnTd87sPo0LCO0u0L6+4EVlMyOrUaswS21EInN2Nx02DcnYuXKEcQ/O7sy3s9CZq03gECTxA47J6tbLfeceQgcGAuDL9VadlwcPUWXR9+y/BtLtCXbDqEDXOhD5vXMKWW6emID09QnLElsqzgWEOVdp/6aQg3N/F5eBQEN7p9zKMpaGG/zwtuebYVlp2txWA7E4oHoaO+Ta0PEeGp7F0ITYQ0My8TCGUh1DnW2KSqgzyaXAV9tQn9Qm5/yeO9tH0tGk6Jb25AaRUgsCOc1ItvurAV1E8T0rma96cgAZDxyxtGhjbZD+4kdacbK0F2KfuWaq31chGdy3/MPC3wPLLkM8ehLLHExFo1onVYIvoOrug8xRAFDa9L7Y5gqTWx5BzyKEmKBQDviMsBm3aoYIEiEgSmJ2O26aJVm6s3S6raTjB0SKwrPk0APSR6t075KSVgPwdiUd0GMtmTQ0CErI3UfZzdD5hZ4W9WOpcpWoZ1RwtTg3+Fry9MDSbepN+P6OcAISJof6lrCXnkQTRgpf/PcauiKbJCfq5mChYcf6HsGYTAqzx8jkAzgyIpgKXlLxjvNgPHBdQ0V2+v36ADRRVsUKZbuU9S9m/tCfBYz4Pe05ezWDXUO7CaTEOmCMAL0IASUgNEVPGtxK36eIUntLS3aKRUWsav91d2wlF6zl92Wlx03k34m3F02J7xIFH584/z+q2slxl2GvHdYX5cJU1OfjH02HZq72lNh/duzsyd4PgV6D6urZin7UpJsrWBCfCa3O9Ru8U/cvby8ZrjkSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(346002)(136003)(366004)(2616005)(6512007)(7416002)(86362001)(44832011)(8936002)(38100700002)(54906003)(6916009)(26005)(31696002)(31686004)(83380400001)(36756003)(41300700001)(2906002)(66476007)(53546011)(8676002)(66556008)(66946007)(5660300002)(6666004)(6486002)(316002)(478600001)(36916002)(30864003)(6506007)(4326008)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3d5Tyt4VGdxV1RONTk2TkUzSHg1VDNiNFpCLytMWU1GVFJCWjhKZUZJS2hi?=
 =?utf-8?B?am1PeEVjUU5XSmdrbmFjdVRQcVJOVjBsbm9oQTdxWWFzNGpQMDB4eERrbDVT?=
 =?utf-8?B?WXJyL0lkVWRaZzBqc0g4YVBMYVVsVTEzLzNyVXcvZnJZbEwvZzJpaHptRXB3?=
 =?utf-8?B?SVhhY1c5Z3diWUp5TTRQYk43Ry9GUkdVdG1INzhJRGNFQnFaNDl4VDdCWVlX?=
 =?utf-8?B?Q3k3NUU0SldPM2poUEFESzIrMUZIZHlpZ1RKc1F1SWwzUDJKV2VKNmV5djZq?=
 =?utf-8?B?V3N1ZW1GaXJPd252WS9zSDRKQ0FILzJ6ckQzeVRPNTFJNlZsYVQ3UzlXWnVq?=
 =?utf-8?B?S3R6MGErU1JBTkhrYmN2TlVUaFNuL1RhdytQRDQ0alI1L3lyQVNrLzlBU0Fl?=
 =?utf-8?B?d3pkMytPYzhpSzl6SVRDcFBzS05kSUZCMHFFZHJTZEJqRm5IeUZNdWkxZ3RX?=
 =?utf-8?B?d3UvODVzQUo3TWZuR0dKczROZTZQWDQ2aksyKzBYOXZaOFkvalUwWnFTaHhh?=
 =?utf-8?B?RkR0dnZNVEtPQjMwLys2MHFFcVg1bCtPOWhqL2xrNHk1LzNodjBoeGRzVmg2?=
 =?utf-8?B?ZDg1SU94TDlzNERPY1pWWkxsVDdLd1dMUzhubUVQdUs2V2dXUEtGNnJFUmky?=
 =?utf-8?B?Qk13S01HeDNkN1h0M1hySThUU0dhdnltTlhZejB2djV0NGlQR2RMY2t1UHMr?=
 =?utf-8?B?MUZQMUZwa1pYekp2eFNHc0h4K3J0MnpVeVJiSFpqWVpLME0yNHAzcWhIeXRu?=
 =?utf-8?B?YlFMc0d6OFhUUTZVZGRqd1lGaTBzbTl3TFpnUVh2UWRMc2RPVER1NW4wbkx4?=
 =?utf-8?B?b3F5NkxjZ3pNcE83anNTcWhDMzJqc0pOUnZsbW5YeVpWYWtGZDhkZnZDUzlr?=
 =?utf-8?B?U214M3JTeXdtM1ZFS3BzenpvNU93S3hCeWVLdnZYS3VQS0liWWV1YkdaZldO?=
 =?utf-8?B?RDJtSFNaN2xIbHgrYlVyTHIrenBpSGJieUF6WVRKU29BMWEycG9Fam1wZ3pZ?=
 =?utf-8?B?WWpjdW1IcDlzK3duWlp1cG5abHh6RWJIak0wb2NBUXdkdHIzSkgxRGwxc1VX?=
 =?utf-8?B?blhpZUxrVGFUdXRCa0wwRktPL1VJVWRIYVFqWTNJalZvUE96cUd6RkRlQlls?=
 =?utf-8?B?cjdYMkh3THdFbkRDQm9vTFJSM2JCOTdYc212NVJlU0NxMnhOQ1RtbVdxaVh0?=
 =?utf-8?B?MHNMRFV0eFBEcXFKN3dDMEVxZVJEYlh3UlNUS0NHTjhGOVNkMzJvKzFvN0Zw?=
 =?utf-8?B?MGNGakZvWWs5bmkydXg2WENKY2paTVpzdUpvVG0yY3NUeWt6SlNGU00zZmMv?=
 =?utf-8?B?SlJycmo0TGVXZU1oRkdRYWlmelJPRmtHSGV1QVM3N3c1VC9KSFZ0aXZGUGZT?=
 =?utf-8?B?YmJIUHZNSXdxWVhOa2JNL3Buc1dTeVdZT2tkK3BCa1Y3dHB5aU9sc0I5VVZl?=
 =?utf-8?B?R3hIRjBzRkgvamtCbUpwdEQvMWRTMVhITmlwWGNEdk1UQnN1TW5WM2pSODBh?=
 =?utf-8?B?RXN3S21OcUFML1VYLytHeG5hSG9ybWV2dTRwdzBjSUttcDhEVTFxZ1FOUDlM?=
 =?utf-8?B?ZU13a1N6OFIwMTd6WVBFK2NVSlZ4YUVKc0VKbVNwOGQ1SDdHWEpWVkhic0pM?=
 =?utf-8?B?blpPWGtzaGVQcXpzaGhUbGp1QWJZOUY0L2h3R3kyaDRGY3BqQTRLQzJEMnZw?=
 =?utf-8?B?bE9uYkVWbVA0ZkoxVUcvSDg3Y1c3bjVyOGNPTDljeXg1L09XRGtpZWcrV0Fw?=
 =?utf-8?B?Sm92MzlLUFdMS3Z6RldIbXNSVjhxaVBDVEpiMUJ3TGhyQzN0R04wOE5haFph?=
 =?utf-8?B?bFpVUUF5YkZUbWM1cnkyblN1Y0ovdXUxcmlEVkhGVlpBbXdUemREak9qbktY?=
 =?utf-8?B?TVk3NlNrS0ROaTVMMUdBdnprTHd0ckN1RHZiR0w0ZUJNa1pSd3FIcmVmUVNn?=
 =?utf-8?B?ZENoRVRGK3daMEkxbXFra3Q2RnNWeTBjc0F4cFYrV3F4RXBCeC9sQ2ZSamln?=
 =?utf-8?B?cjVLZjY0US9Xa1hYMkI1ZVVvV0RqOFFyYUtJOHRFZUZ0L3BTbmI2RU4zZWln?=
 =?utf-8?B?UWIvRXRQbjRaelRQTllCNHNRdUd2SUNaUng5cGQzMVd3d05OMjdsRDh4OFVE?=
 =?utf-8?B?ZHUweCsrc2l4QU5SWllQVDJQckc1MXVJVWg1RDRZQUZQT2FFcFJvb3Y1MXJ1?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fc0461-232e-4fde-641f-08da5f7762dd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:45:59.8581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtgfDbyavQ9d+OLGyakxMJi0Y6ABzwQOUhjqEDYiQwIxGrrXlxMLAZ1kETOAWxKy+N39Pct/1Ej3Hg1NCTfSxm6R9RuLAwajYE9m3U6c1OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2671
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_09:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060071
X-Proofpoint-GUID: 5SY-FhhLK4JY4xoOPV8viXyU6zhVvrSh
X-Proofpoint-ORIG-GUID: 5SY-FhhLK4JY4xoOPV8viXyU6zhVvrSh
Received-SPF: permerror client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/2022 3:14 PM, Alex Williamson wrote:
> On Wed, 15 Jun 2022 07:52:14 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Enable vfio-pci devices to be saved and restored across an exec restart
>> of qemu.
>>
>> At vfio creation time, save the value of vfio container, group, and device
>> descriptors in cpr state.
>>
>> In the container pre_save handler, suspend the use of virtual addresses in
>> DMA mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be
>> remapped at a different VA after exec.  DMA to already-mapped pages
>> continues.  Save the msi message area as part of vfio-pci vmstate, save the
>> interrupt and notifier eventfd's in cpr state, and clear the close-on-exec
>> flag for the vfio descriptors.  The flag is not cleared earlier because the
>> descriptors should not persist across miscellaneous fork and exec calls
>> that may be performed during normal operation.
>>
>> On qemu restart, vfio_realize() finds the saved descriptors, uses
>> the descriptors, and notes that the device is being reused.  Device and
>> iommu state is already configured, so operations in vfio_realize that
>> would modify the configuration are skipped for a reused device, including
>> vfio ioctl's and writes to PCI configuration space.  Vfio PCI device reset
>> is also suppressed. The result is that vfio_realize constructs qemu data
>> structures that reflect the current state of the device.  However, the
>> reconstruction is not complete until cpr-load is called. cpr-load loads the
>> msi data.  The vfio post_load handler finds eventfds in cpr state, rebuilds
>> vector data structures, and attaches the interrupts to the new KVM instance.
>> The container post_load handler then invokes the main vfio listener
>> callback, which walks the flattened ranges of the vfio address space and
>> calls VFIO_DMA_MAP_FLAG_VADDR to inform the kernel of the new VA's.  Lastly,
>> cpr-load starts the VM.
>>
>> This functionality is delivered by 3 patches for clarity.  Part 1 handles
>> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
>> support.  Part 3 adds INTX support.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  MAINTAINERS                   |   1 +
>>  hw/pci/pci.c                  |  12 ++++
>>  hw/vfio/common.c              | 151 +++++++++++++++++++++++++++++++++++-------
>>  hw/vfio/cpr.c                 | 119 +++++++++++++++++++++++++++++++++
>>  hw/vfio/meson.build           |   1 +
>>  hw/vfio/pci.c                 |  44 ++++++++++++
>>  hw/vfio/trace-events          |   1 +
>>  include/hw/vfio/vfio-common.h |  11 +++
>>  include/migration/vmstate.h   |   1 +
>>  9 files changed, 317 insertions(+), 24 deletions(-)
>>  create mode 100644 hw/vfio/cpr.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 74a43e6..864aec6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3156,6 +3156,7 @@ CPR
>>  M: Steve Sistare <steven.sistare@oracle.com>
>>  M: Mark Kanda <mark.kanda@oracle.com>
>>  S: Maintained
>> +F: hw/vfio/cpr.c
>>  F: include/migration/cpr.h
>>  F: migration/cpr.c
>>  F: qapi/cpr.json
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 6e70153..a3b19eb 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -32,6 +32,7 @@
>>  #include "hw/pci/pci_host.h"
>>  #include "hw/qdev-properties.h"
>>  #include "hw/qdev-properties-system.h"
>> +#include "migration/cpr.h"
>>  #include "migration/qemu-file-types.h"
>>  #include "migration/vmstate.h"
>>  #include "monitor/monitor.h"
>> @@ -341,6 +342,17 @@ static void pci_reset_regions(PCIDevice *dev)
>>  
>>  static void pci_do_device_reset(PCIDevice *dev)
>>  {
>> +    /*
>> +     * A PCI device that is resuming for cpr is already configured, so do
>> +     * not reset it here when we are called from qemu_system_reset prior to
>> +     * cpr-load, else interrupts may be lost for vfio-pci devices.  It is
>> +     * safe to skip this reset for all PCI devices, because cpr-load will set
>> +     * all fields that would have been set here.
>> +     */
>> +    if (cpr_get_mode() == CPR_MODE_RESTART) {
>> +        return;
>> +    }
>> +
>>      pci_device_deassert_intx(dev);
>>      assert(dev->irq_state == 0);
>>  
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index ace9562..c7d73b6 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -31,6 +31,7 @@
>>  #include "exec/memory.h"
>>  #include "exec/ram_addr.h"
>>  #include "hw/hw.h"
>> +#include "migration/cpr.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/range.h"
>> @@ -460,6 +461,8 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>          .size = size,
>>      };
>>  
>> +    assert(!container->reused);
>> +
>>      if (iotlb && container->dirty_pages_supported &&
>>          vfio_devices_all_running_and_saving(container)) {
>>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>> @@ -496,12 +499,24 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>  {
>>      struct vfio_iommu_type1_dma_map map = {
>>          .argsz = sizeof(map),
>> -        .flags = VFIO_DMA_MAP_FLAG_READ,
>>          .vaddr = (__u64)(uintptr_t)vaddr,
>>          .iova = iova,
>>          .size = size,
>>      };
>>  
>> +    /*
>> +     * Set the new vaddr for any mappings registered during cpr-load.
>> +     * Reused is cleared thereafter.
>> +     */
>> +    if (container->reused) {
>> +        map.flags = VFIO_DMA_MAP_FLAG_VADDR;
>> +        if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
>> +            goto fail;
>> +        }
>> +        return 0;
>> +    }
>> +
>> +    map.flags = VFIO_DMA_MAP_FLAG_READ;
>>      if (!readonly) {
>>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>>      }
>> @@ -517,7 +532,9 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>          return 0;
>>      }
>>  
>> -    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
>> +fail:
>> +    error_report("vfio_dma_map %s (iova %lu, size %ld, va %p): %s",
>> +        (container->reused ? "VADDR" : ""), iova, size, vaddr, strerror(errno));
>>      return -errno;
>>  }
>>  
>> @@ -882,6 +899,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>                                       MemoryRegionSection *section)
>>  {
>>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> +    vfio_container_region_add(container, section);
>> +}
>> +
>> +void vfio_container_region_add(VFIOContainer *container,
>> +                               MemoryRegionSection *section)
>> +{
>>      hwaddr iova, end;
>>      Int128 llend, llsize;
>>      void *vaddr;
>> @@ -1492,6 +1515,12 @@ static void vfio_listener_release(VFIOContainer *container)
>>      }
>>  }
>>  
>> +void vfio_listener_register(VFIOContainer *container)
>> +{
>> +    container->listener = vfio_memory_listener;
>> +    memory_listener_register(&container->listener, container->space->as);
>> +}
>> +
>>  static struct vfio_info_cap_header *
>>  vfio_get_cap(void *ptr, uint32_t cap_offset, uint16_t id)
>>  {
>> @@ -1910,6 +1939,22 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>>  {
>>      int iommu_type, ret;
>>  
>> +    /*
>> +     * If container is reused, just set its type and skip the ioctls, as the
>> +     * container and group are already configured in the kernel.
>> +     * VFIO_TYPE1v2_IOMMU is the only type that supports reuse/cpr.
>> +     */
>> +    if (container->reused) {
>> +        if (ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
>> +            container->iommu_type = VFIO_TYPE1v2_IOMMU;
>> +            return 0;
>> +        } else {
>> +            error_setg(errp, "container was reused but VFIO_TYPE1v2_IOMMU "
>> +                             "is not supported");
>> +            return -errno;
>> +        }
>> +    }
>> +
>>      iommu_type = vfio_get_iommu_type(container, errp);
>>      if (iommu_type < 0) {
>>          return iommu_type;
>> @@ -2014,9 +2059,12 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>  {
>>      VFIOContainer *container;
>>      int ret, fd;
>> +    bool reused;
>>      VFIOAddressSpace *space;
>>  
>>      space = vfio_get_address_space(as);
>> +    fd = cpr_find_fd("vfio_container_for_group", group->groupid);
>> +    reused = (fd > 0);
>>  
>>      /*
>>       * VFIO is currently incompatible with discarding of RAM insofar as the
>> @@ -2049,27 +2097,47 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>       * details once we know which type of IOMMU we are using.
>>       */
>>  
>> +    /*
>> +     * If the container is reused, then the group is already attached in the
>> +     * kernel.  If a container with matching fd is found, then update the
>> +     * userland group list and return.  If not, then after the loop, create
>> +     * the container struct and group list.
>> +     */
>> +
>>      QLIST_FOREACH(container, &space->containers, next) {
>> -        if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
>> -            ret = vfio_ram_block_discard_disable(container, true);
>> -            if (ret) {
>> -                error_setg_errno(errp, -ret,
>> -                                 "Cannot set discarding of RAM broken");
>> -                if (ioctl(group->fd, VFIO_GROUP_UNSET_CONTAINER,
>> -                          &container->fd)) {
>> -                    error_report("vfio: error disconnecting group %d from"
>> -                                 " container", group->groupid);
>> -                }
>> -                return ret;
>> +        if (reused) {
>> +            if (container->fd != fd) {
>> +                continue;
>>              }
>> -            group->container = container;
>> -            QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>> +        } else if (ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
>> +            continue;
>> +        }
>> +
>> +        ret = vfio_ram_block_discard_disable(container, true);
>> +        if (ret) {
>> +            error_setg_errno(errp, -ret,
>> +                             "Cannot set discarding of RAM broken");
>> +            if (ioctl(group->fd, VFIO_GROUP_UNSET_CONTAINER,
>> +                      &container->fd)) {
>> +                error_report("vfio: error disconnecting group %d from"
>> +                             " container", group->groupid);
>> +            }
>> +            return ret;
>> +        }
>> +        group->container = container;
>> +        QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>> +        if (!reused) {
>>              vfio_kvm_device_add_group(group);
>> -            return 0;
>> +            cpr_save_fd("vfio_container_for_group", group->groupid,
>> +                        container->fd);
>>          }
>> +        return 0;
>> +    }
>> +
>> +    if (!reused) {
>> +        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
>>      }
>>  
>> -    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
>>      if (fd < 0) {
>>          error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
>>          ret = -errno;
>> @@ -2087,6 +2155,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      container = g_malloc0(sizeof(*container));
>>      container->space = space;
>>      container->fd = fd;
>> +    container->reused = reused;
>>      container->error = NULL;
>>      container->dirty_pages_supported = false;
>>      container->dma_max_mappings = 0;
>> @@ -2099,6 +2168,11 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>          goto free_container_exit;
>>      }
>>  
>> +    ret = vfio_cpr_register_container(container, errp);
>> +    if (ret) {
>> +        goto free_container_exit;
>> +    }
>> +
>>      ret = vfio_ram_block_discard_disable(container, true);
>>      if (ret) {
>>          error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
>> @@ -2213,9 +2287,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      group->container = container;
>>      QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>>  
>> -    container->listener = vfio_memory_listener;
>> -
>> -    memory_listener_register(&container->listener, container->space->as);
>> +    /*
>> +     * If reused, register the listener later, after all state that may
>> +     * affect regions and mapping boundaries has been cpr-load'ed.  Later,
>> +     * the listener will invoke its callback on each flat section and call
>> +     * vfio_dma_map to supply the new vaddr, and the calls will match the
>> +     * mappings remembered by the kernel.
>> +     */
>> +    if (!reused) {
>> +        vfio_listener_register(container);
>> +    }
>>  
>>      if (container->error) {
>>          ret = -1;
>> @@ -2225,8 +2306,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      }
>>  
>>      container->initialized = true;
>> +    ret = cpr_resave_fd("vfio_container_for_group", group->groupid, fd, errp);
>>  
>> -    return 0;
>> +    return ret;
> 
> 
> This needs to fall through to unwind if that resave fails> 
> There also needs to be vfio_cpr_unregister_container() and
> cpr_delete_fd() calls in the unwind below, right?

Will do, thanks.

>>  listener_release_exit:
>>      QLIST_REMOVE(group, container_next);
>>      QLIST_REMOVE(container, next);
>> @@ -2254,6 +2336,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>>  
>>      QLIST_REMOVE(group, container_next);
>>      group->container = NULL;
>> +    cpr_delete_fd("vfio_container_for_group", group->groupid);
>>  
>>      /*
>>       * Explicitly release the listener first before unset container,
>> @@ -2290,6 +2373,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>>          }
>>  
>>          trace_vfio_disconnect_container(container->fd);
>> +        vfio_cpr_unregister_container(container);
>>          close(container->fd);
>>          g_free(container);
>>  
>> @@ -2319,7 +2403,12 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>>      group = g_malloc0(sizeof(*group));
>>  
>>      snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
>> -    group->fd = qemu_open_old(path, O_RDWR);
>> +
>> +    group->fd = cpr_find_fd("vfio_group", groupid);
>> +    if (group->fd < 0) {
>> +        group->fd = qemu_open_old(path, O_RDWR);
>> +    }
>> +
>>      if (group->fd < 0) {
>>          error_setg_errno(errp, errno, "failed to open %s", path);
>>          goto free_group_exit;
>> @@ -2353,6 +2442,10 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>>  
>>      QLIST_INSERT_HEAD(&vfio_group_list, group, next);
>>  
>> +    if (cpr_resave_fd("vfio_group", groupid, group->fd, errp)) {
>> +        goto close_fd_exit;
>> +    }
>> +
>>      return group;
>>  
>>  close_fd_exit:
>> @@ -2377,6 +2470,7 @@ void vfio_put_group(VFIOGroup *group)
>>      vfio_disconnect_container(group);
>>      QLIST_REMOVE(group, next);
>>      trace_vfio_put_group(group->fd);
>> +    cpr_delete_fd("vfio_group", group->groupid);
>>      close(group->fd);
>>      g_free(group);
>>  
>> @@ -2390,8 +2484,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>>  {
>>      struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
>>      int ret, fd;
>> +    bool reused;
>> +
>> +    fd = cpr_find_fd(name, 0);
>> +    reused = (fd >= 0);
>> +    if (!reused) {
>> +        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
>> +    }
>>  
>> -    fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
>>      if (fd < 0) {
>>          error_setg_errno(errp, errno, "error getting device from group %d",
>>                           group->groupid);
>> @@ -2436,12 +2536,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>>      vbasedev->num_irqs = dev_info.num_irqs;
>>      vbasedev->num_regions = dev_info.num_regions;
>>      vbasedev->flags = dev_info.flags;
>> +    vbasedev->reused = reused;
>>  
>>      trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
>>                            dev_info.num_irqs);
>>  
>>      vbasedev->reset_works = !!(dev_info.flags & VFIO_DEVICE_FLAGS_RESET);
>> -    return 0;
>> +    ret = cpr_resave_fd(name, 0, fd, errp);
>> +    return ret;
> 
> 
> This requires new unwind code.

Yeah, the introduction of cpr_resave_fd with an error return value in V8 makes
this messier.  cpr_resave_fd only fails if the fd was already saved with a different
value.  That is a qemu coding bug, either in the cpr state code, or in life cycle
mgmt for an object.  I propose to change this to an assertion inside cpr_resave_fd
and return void, so callers can always assume it succeeds.  Hence no unwind.

Sound OK?

>>  void vfio_put_base_device(VFIODevice *vbasedev)
>> @@ -2452,6 +2554,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
>>      QLIST_REMOVE(vbasedev, next);
>>      vbasedev->group = NULL;
>>      trace_vfio_put_base_device(vbasedev->fd);
>> +    cpr_delete_fd(vbasedev->name, 0);
>>      close(vbasedev->fd);
>>  }
>>  
>> diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
>> new file mode 100644
>> index 0000000..a227d5e
>> --- /dev/null
>> +++ b/hw/vfio/cpr.c
>> @@ -0,0 +1,119 @@
>> +/*
>> + * Copyright (c) 2021, 2022 Oracle and/or its affiliates.
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include <sys/ioctl.h>
>> +#include <linux/vfio.h>
>> +#include "hw/vfio/vfio-common.h"
>> +#include "sysemu/kvm.h"
>> +#include "qapi/error.h"
>> +#include "migration/cpr.h"
>> +#include "migration/vmstate.h"
>> +#include "trace.h"
>> +
>> +static int
>> +vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
>> +{
>> +    struct vfio_iommu_type1_dma_unmap unmap = {
>> +        .argsz = sizeof(unmap),
>> +        .flags = VFIO_DMA_UNMAP_FLAG_VADDR | VFIO_DMA_UNMAP_FLAG_ALL,
>> +        .iova = 0,
>> +        .size = 0,
>> +    };
>> +    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>> +        error_setg_errno(errp, errno, "vfio_dma_unmap_vaddr_all");
>> +        return -errno;
>> +    }
>> +    container->vaddr_unmapped = true;
>> +    return 0;
>> +}
>> +
>> +static bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
>> +{
>> +    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
>> +        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
>> +        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
>> +                         "or VFIO_UNMAP_ALL");
>> +        return false;
>> +    } else {
>> +        return true;
>> +    }
>> +}
>> +
>> +static bool vfio_vmstate_needed(void *opaque)
>> +{
>> +    return cpr_get_mode() == CPR_MODE_RESTART;
>> +}
>> +
>> +static int vfio_container_pre_save(void *opaque)
>> +{
>> +    VFIOContainer *container = (VFIOContainer *)opaque;
>> +    Error *err;
>> +
>> +    if (!vfio_is_cpr_capable(container, &err) ||
>> +        vfio_dma_unmap_vaddr_all(container, &err)) {
>> +        error_report_err(err);
>> +        return -1;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int vfio_container_post_load(void *opaque, int version_id)
>> +{
>> +    VFIOContainer *container = (VFIOContainer *)opaque;
>> +    VFIOGroup *group;
>> +    Error *err;
>> +    VFIODevice *vbasedev;
>> +
>> +    if (!vfio_is_cpr_capable(container, &err)) {
>> +        error_report_err(err);
>> +        return -1;
>> +    }
>> +
>> +    vfio_listener_register(container);
>> +    container->reused = false;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            vbasedev->reused = false;
>> +        }
>> +    }
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription vfio_container_vmstate = {
>> +    .name = "vfio-container",
>> +    .unmigratable = 1,
> 
> 
> How does this work with vfio devices supporting migration?  This needs
> to be coordinated with efforts to enable migration of vfio devices.

This is a mistake which needs to be deleted, which I found with more testing 
after posting. After deletion, it will not block migration, and will not be used 
in migration, because vfio_vmstate_needed only returns true for cpr.

>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .pre_save = vfio_container_pre_save,
>> +    .post_load = vfio_container_post_load,
>> +    .needed = vfio_vmstate_needed,
> 
> 
> I don't see that .needed is evaluated relative to .unmigratable above
> in determining if migration is blocked.
> 
> 
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
>> +{
>> +    container->cpr_blocker = NULL;
>> +    if (!vfio_is_cpr_capable(container, &container->cpr_blocker)) {
>> +        return cpr_add_blocker(&container->cpr_blocker, errp,
>> +                               CPR_MODE_RESTART, 0);
>> +    }
>> +
>> +    vmstate_register(NULL, -1, &vfio_container_vmstate, container);
>> +
>> +    return 0;
>> +}
>> +
>> +void vfio_cpr_unregister_container(VFIOContainer *container)
>> +{
>> +    cpr_del_blocker(&container->cpr_blocker);
>> +
>> +    vmstate_unregister(NULL, &vfio_container_vmstate, container);
>> +}
>> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
>> index da9af29..e247b2b 100644
>> --- a/hw/vfio/meson.build
>> +++ b/hw/vfio/meson.build
>> @@ -5,6 +5,7 @@ vfio_ss.add(files(
>>    'migration.c',
>>  ))
>>  vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
>> +  'cpr.c',
>>    'display.c',
>>    'pci-quirks.c',
>>    'pci.c',
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 0143c9a..237231b 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -30,6 +30,7 @@
>>  #include "hw/qdev-properties-system.h"
>>  #include "migration/vmstate.h"
>>  #include "qapi/qmp/qdict.h"
>> +#include "migration/cpr.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/module.h"
>> @@ -2514,6 +2515,7 @@ const VMStateDescription vmstate_vfio_pci_config = {
>>      .name = "VFIOPCIDevice",
>>      .version_id = 1,
>>      .minimum_version_id = 1,
>> +    .priority = MIG_PRI_VFIO_PCI,   /* * must load before container */
>>      .fields = (VMStateField[]) {
>>          VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
>>          VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
>> @@ -3243,6 +3245,11 @@ static void vfio_pci_reset(DeviceState *dev)
>>  {
>>      VFIOPCIDevice *vdev = VFIO_PCI(dev);
>>  
>> +    /* Do not reset the device during qemu_system_reset prior to cpr-load */
>> +    if (vdev->vbasedev.reused) {
>> +        return;
>> +    }
>> +
>>      trace_vfio_pci_reset(vdev->vbasedev.name);
>>  
>>      vfio_pci_pre_reset(vdev);
>> @@ -3350,6 +3357,42 @@ static Property vfio_pci_dev_properties[] = {
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> +/*
>> + * The kernel may change non-emulated config bits.  Exclude them from the
>> + * changed-bits check in get_pci_config_device.
>> + */
>> +static int vfio_pci_pre_load(void *opaque)
>> +{
>> +    VFIOPCIDevice *vdev = opaque;
>> +    PCIDevice *pdev = &vdev->pdev;
>> +    int size = MIN(pci_config_size(pdev), vdev->config_size);
>> +    int i;
>> +
>> +    for (i = 0; i < size; i++) {
>> +        pdev->cmask[i] &= vdev->emulated_config_bits[i];
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static bool vfio_pci_needed(void *opaque)
>> +{
>> +    return cpr_get_mode() == CPR_MODE_RESTART;
>> +}
>> +
>> +static const VMStateDescription vfio_pci_vmstate = {
>> +    .name = "vfio-pci",
>> +    .unmigratable = 1,
> 
> 
> Same question here.

Same, I will delete it.

>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .priority = MIG_PRI_VFIO_PCI,       /* must load before container */
>> +    .pre_load = vfio_pci_pre_load,
>> +    .needed = vfio_pci_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -3357,6 +3400,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>>  
>>      dc->reset = vfio_pci_reset;
>>      device_class_set_props(dc, vfio_pci_dev_properties);
>> +    dc->vmsd = &vfio_pci_vmstate;
>>      dc->desc = "VFIO-based PCI device assignment";
>>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>      pdc->realize = vfio_realize;
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 73dffe9..a6d0034 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -119,6 +119,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
>>  vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
>>  vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
>>  vfio_dma_unmap_overflow_workaround(void) ""
>> +vfio_region_remap(const char *name, int fd, uint64_t iova_start, uint64_t iova_end, void *vaddr) "%s fd %d 0x%"PRIx64" - 0x%"PRIx64" [%p]"
>>  
>>  # platform.c
>>  vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index e573f5a..17ad9ba 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -81,10 +81,14 @@ typedef struct VFIOContainer {
>>      int fd; /* /dev/vfio/vfio, empowered by the attached groups */
>>      MemoryListener listener;
>>      MemoryListener prereg_listener;
>> +    Notifier cpr_notifier;
>> +    Error *cpr_blocker;
>>      unsigned iommu_type;
>>      Error *error;
>>      bool initialized;
>>      bool dirty_pages_supported;
>> +    bool reused;
>> +    bool vaddr_unmapped;
>>      uint64_t dirty_pgsizes;
>>      uint64_t max_dirty_bitmap_size;
>>      unsigned long pgsizes;
>> @@ -136,6 +140,7 @@ typedef struct VFIODevice {
>>      bool no_mmap;
>>      bool ram_block_discard_allowed;
>>      bool enable_migration;
>> +    bool reused;
>>      VFIODeviceOps *ops;
>>      unsigned int num_irqs;
>>      unsigned int num_regions;
>> @@ -213,6 +218,9 @@ void vfio_put_group(VFIOGroup *group);
>>  int vfio_get_device(VFIOGroup *group, const char *name,
>>                      VFIODevice *vbasedev, Error **errp);
>>  
>> +int vfio_cpr_register_container(VFIOContainer *container, Error **errp);
>> +void vfio_cpr_unregister_container(VFIOContainer *container);
>> +
>>  extern const MemoryRegionOps vfio_region_ops;
>>  typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>>  extern VFIOGroupList vfio_group_list;
>> @@ -234,6 +242,9 @@ struct vfio_info_cap_header *
>>  vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
>>  #endif
>>  extern const MemoryListener vfio_prereg_listener;
>> +void vfio_listener_register(VFIOContainer *container);
>> +void vfio_container_region_add(VFIOContainer *container,
>> +                               MemoryRegionSection *section);
>>  
>>  int vfio_spapr_create_window(VFIOContainer *container,
>>                               MemoryRegionSection *section,
>> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
>> index ad24aa1..19f1538 100644
>> --- a/include/migration/vmstate.h
>> +++ b/include/migration/vmstate.h
>> @@ -157,6 +157,7 @@ typedef enum {
>>      MIG_PRI_GICV3_ITS,          /* Must happen before PCI devices */
>>      MIG_PRI_GICV3,              /* Must happen before the ITS */
>>      MIG_PRI_MAX,
>> +    MIG_PRI_VFIO_PCI = MIG_PRI_IOMMU,
> 
> 
> Based on the current contents of this enum, why are we aliasing a
> existing priority vs defining a new one?  Thanks,

Sharing a priority is slightly more efficient because migration iterates over
a list of lists of vmstate handlers indexed by priority, and it is more maintainable
because it expresses the minimal ordering requiremment and reduces the likelihood
of priority ordering conflicts later.

The mininimal ordering requirement for the vfio handlers is that they come 
before the vfio container handler at MIG_PRI_DEFAULT = 0.  Thus the minimal
priority is 1 which matches MIG_PRI_IOMMU.  I should have expressed that more
clearly like so:

  MIG_PRI_VFIO_PCI = MIG_PRI_DEFAULT + 1,    /* Must happen before vfio containers */

- Steve



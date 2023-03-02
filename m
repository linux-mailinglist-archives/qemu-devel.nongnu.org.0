Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D26A784C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 01:15:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXWa4-0003ev-RH; Wed, 01 Mar 2023 19:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXWa2-0003ek-WA
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 19:13:55 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXWZy-0006SS-QX
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 19:13:54 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321NBQ5A011770; Thu, 2 Mar 2023 00:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=iZ5GnosRLjGixRBm4bdFz8whHTJZ2rh+wacSJoXslcg=;
 b=NFA84MJeuDS+6Cx1H01tJyZHm0y+/qSRExeqX3BS+7xDpO65wzPLLrCCV0t1oyq2lEp/
 6IH30TXhinx1uAzQHO8/S7AYvGtKkRX3MjeCT/xIyGpOxBbuYHuE8uqfmMmuYppO879d
 IGNHc1xzFgWjopcK0BjTc34s1+PXoFkaYET4WfwgojLt1vdA8ayoDkCY2C9K2BmWTvkP
 nMhYE/CElsWQwiepBPBGRuqHVgXmbNJwgf5rFZUFFfaMZ3JROhiVStHkV8FG9n4GtsbC
 yVlO1bk+Ydp9/Ts3XEUsDn3u8nzxDhnqcXR4045HlmY+SGZjYb6Yj9+PqDgNMNE3aomg uw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb7wte1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 00:13:45 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 321NOpaS015949; Thu, 2 Mar 2023 00:13:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s9knq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 00:13:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofkcyiksEjf3N7SxqYnyMEkDFk1+Mw/F+rPWRd2lxeiPJ/CnWWLIjmCWtGYTPdhFTCwyClCKi4yM8CWrJAnSQX2g/HXqWUWCBYfGKeWitt1l4v6rX0EBpFMmoXng0ie1RASNFGT3NgzAAw/mOtc3Ri+Hm2n4YCnIBM5Tr1Px+RoOvvyGMZeNwVsVdfFYNR23CjbqMT7R5iXZO9S1HVMxVDbAUxIz239klJwAhe37JI/4hYq5T6OAyyOlqpGrFRFxCVM+7viwe4x8g0DkkXpzT1L6JLSQfJ6Qalbjp5/jsIgNVDMuRvN59+wOgBGrmP6o5pURb/wXrohBoMeTIEV1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZ5GnosRLjGixRBm4bdFz8whHTJZ2rh+wacSJoXslcg=;
 b=DnQKDXHmRNnYe/r0z8bHPb6KgQe2YzJ0hb8EUjGpxQjLiLjAebrZ+3FyEAkn17yAnM39BPj5bY1SgpXpF0nEpDkF6YCFBcZddPGwXTDDL/J9+IlTeECK445g+4/fd0tNWdVg8jf7oeY25bJT86EKabr6+0Hb4+sn6lrUcD/RA78Q4a34SkJWT7qDfKudlU/jtVVzC+H3FcGsAwPm6IqIJ+LQCs6yOXVsHkvkIBZYgJXx3eG2SHVqT/0T2WZxhv6Q4POuCLhX8oZFEtGtGZn6gLMz4ur9nNtvjO0sQIzjrA8OUV36NP/ijkvyLNX+l11jRgYa7x8b30bUtDro4T7cGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZ5GnosRLjGixRBm4bdFz8whHTJZ2rh+wacSJoXslcg=;
 b=W9IiZ1ZPIIUTffkL63p7szZBFenHzxQqG04lDKtcrPrGItdCH6Bj7+MhPdWCCe1Y1jOI1WDCyo2LiGI3tGpCIiK608yRtqwKvhQG41yCgFnrou9h+K37TijhH90nqXgXwJ0vJycKxzXaZ0Zn+VDK6GEObirJDhI59BNBgLpt+90=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MW4PR10MB5882.namprd10.prod.outlook.com (2603:10b6:303:18f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 00:13:41 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 00:13:41 +0000
Message-ID: <41cfc314-cbdb-6191-6433-d23e3d5a5523@oracle.com>
Date: Thu, 2 Mar 2023 00:13:31 +0000
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
 <20230223140527.096dc42b.alex.williamson@redhat.com>
 <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
 <20230223145018.3c46a966.alex.williamson@redhat.com>
 <617b396a-d5e2-8c10-9717-1cc6fc9d43dd@oracle.com>
 <20230228133653.2f911490.alex.williamson@redhat.com>
 <114233e8-bdb8-21f5-ade9-0163658feb84@oracle.com>
In-Reply-To: <114233e8-bdb8-21f5-ade9-0163658feb84@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0187.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::31) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|MW4PR10MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: eb3c3624-c60a-4465-d832-08db1ab2fa3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYMY1TzAF5QKuG18FwDET1H0mg+kxe71N6b+3bGwb+hHjTUvnpgqREjGXuMfxW1ns21xJw9FoJy2hI/ygUlcJ+B2esqDmBExTzS9pb24UlPnjPPrTOPS1cM8DU0u1PiS8L/GduE67G+OfYMco40VSBA9RRjNkVGkn/e3JLlULLuHOSpvzUI03dxbq+VRax/AUG8REoFwz2+l96+IrQES2O7/ARbZ4DtObcX43qKiqq9q5upFyI0Z28RYhqI7BM7IUlpzFl9wjt+GCPjE7qY39pVNPv2hq+bBvPbxRaUnIQt46odu9Hc2AoizgVvp7s4MCG4tTyS6lluhSlxMgoa+LIL9RWYfzBbATISB9FXqOPT/twpwhBxJo8yL35l+s9vEJea2H2/qnI23wZtTmM4z3hVUE9WxLtcHCNl9MX/p+LALd6DYOHT1bPMASoELK+/Tcysm1yLa5vbVTMIlqXjA5o6goUV7iVxU8JlNVJOC+E7HkMzJc3zCntuaHBU6cMx5dEX5BDUBk0BMJr/5KLbzKiAQGYG1VDjmc9Tw0EavPWUttaA03hNJMCCGFZQb9PwLNcftXCRzi0se4o4La1WBjuF6fR59OL49XF1YCLj0eYQB+PWj1yIFhLflm1H/D+H/mq3pRqS7n/bvEkRRroEwyWDf7n2sczPWdlzFizvrDzyz3EIZvAKwd8LkH9RAyC8PFhqDq8NQM4KKggNUgPXSKzh0At9+iKoVDtW+HVHum4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199018)(38100700002)(8936002)(31696002)(36756003)(86362001)(66556008)(2906002)(41300700001)(66476007)(66946007)(7416002)(4326008)(8676002)(5660300002)(6916009)(2616005)(6506007)(53546011)(186003)(6512007)(83380400001)(26005)(478600001)(316002)(6486002)(966005)(31686004)(30864003)(6666004)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjVTb3lySU9ZOGdNay8rQmdHU0wyVUJYa0NpMDdrRmd1UG1FN2ZBdnZLUmNv?=
 =?utf-8?B?NXo4bnd2a2d3MSszSVFWL1NlYS9TdmJmdWNEbHltaFYwb25yZWZzUkdiYVEy?=
 =?utf-8?B?MGppMEhSMFNXdzAvOGpweWVESGYvdTNkZUcxUXpjZnAvQmRYT0VweE5HQ1Vp?=
 =?utf-8?B?S3VyaTBEWFV3UGFlZTZVQ2xHdlRpcVJ3bEdldkhhQlcxMURoQ0lMU2x2NmxH?=
 =?utf-8?B?WVhNaTI0VVdrUEJsaTZjVVZxdkpMRkpva1dMczVtWTl0K2dNMlAzNnpBeFNU?=
 =?utf-8?B?TzhwQzhLeVJhRFovcTlLMWhPek5paU93M0lLaXlwaHFEcHBnVyswM1FBK0Vr?=
 =?utf-8?B?WUUvalEyVHdXOU1aZWpuWWtwdWRlTXQ0MU5BYkQ2RVBmWUFsZ2IyMlpqbTN6?=
 =?utf-8?B?WUR6cHRIbjRGZzhncmV2dXJXTExpVm9semZQWVJvdWxvbVk2cW9FUmVyMGlr?=
 =?utf-8?B?OHhYeWRTNE5HYzM2SG96bDdiWWFmbG04RXA5N1BybTRtckxJN0I5TlV6RWpY?=
 =?utf-8?B?bEpVd1l2QmIyaEJMdmlBVnB6aUVQWkJTdDdrTE1WbldOSGtFYjF1YXhpUWVy?=
 =?utf-8?B?MXc5UmF4S0FEaEhMeGtLUlJxc0lZd3kwQjNkSkplQVBEVXRBRjUwN1lEVnRC?=
 =?utf-8?B?NEpqSmFrTjU0aU01WWwyWW9pVWR3U3JqRStTN3lScm9ZV1BWZnNmS1JXNGVN?=
 =?utf-8?B?aHJzYU8wM2trSGxtMWwvRkJyNzMwU2ltOHdFMWxobm9LS0hwME1OaWVqcVdC?=
 =?utf-8?B?ZEMyOVNtVE00dXFXVDRrZzZtdkk3T2ZsdWJXWDQyNHVuczhaNkRUNlFPbjFN?=
 =?utf-8?B?OHp2WklQQkxIRXZxZTJSREw4aUdmRmgxVGtrVnQvVTMyZVlFOHg3OXJzT3Uy?=
 =?utf-8?B?NjIxOUxWb1YxM1EvSzB2RGpYcUIreWYweC9CRy9EUTVwRUljTGtKUnloeXE1?=
 =?utf-8?B?Z3NzR2tTU0Z3S0piRmsyT25QYjdMdkhJSzFmbmtrNVJsQ0liQXhsU0x4emNo?=
 =?utf-8?B?ZFZ5aEtsbm1uV2tYbFlEYW5iM0dRNkJMUGMzR01SdlFjR1B1SVRDc05rczVK?=
 =?utf-8?B?bUpFVEpzSXRORFU4VXB4NmdQWHpYZG1taEZCNTEwQlV4ZzV5NGVIRWNTOWFC?=
 =?utf-8?B?amQ2QW1rWkZGempNcm9KTXYxV1BUdmlYdWZ3SHpBUjZkN1VQVjhMeWF3cWZt?=
 =?utf-8?B?NkEzUUt2K25xL1NCeXVzSnhNNFBRRkdFdEZ0SHAxRXo4WndNMkEzUy9qTnVM?=
 =?utf-8?B?OWVwVzJLOHRJWDRyQ1lPL3Z2N3BzVDVlMkw1cHRLSVd1SWczbUNBK21vMWpX?=
 =?utf-8?B?bXZremQvTzlSY1c0bEFiNytwYnVPQmpiVGlKNityMFV6VUZ0MGdzWWcwTnU3?=
 =?utf-8?B?ZFJtTHFxU25tVCtyUWZXbVMzY2l2ci9NN0Z5eVdqamNwQzNvOTVHV053Ympi?=
 =?utf-8?B?alVEVW9DSWp4cXVyWlJybWNVMGc1N2EvV3E1MUp3TFdiNkFzUkxFZHVnVXdY?=
 =?utf-8?B?b25sbzluWUVUMkxtU0FtUUhkQitVZkdoZUdMaVlkRzJiQ3Y1L241ZkNHZUlZ?=
 =?utf-8?B?dW4wci9QUDZFMkpDR0VDNGRrbkVJejJDQmIzOGNYTHBpZVVOTnM4eUlxOXRI?=
 =?utf-8?B?aEZPN1cyNmUzMVRlN2YzQmVNMlRNR1I2K0hLOWRkS2lISGtvUG5hMitzMWsr?=
 =?utf-8?B?d0pOK25Lazl5RjlqMjhLenloNHpMdXJnbURJUVdqV0hiSEdkOHI4WlViazBh?=
 =?utf-8?B?NmJaQi94TG5XblJBelM0VVZpNUgvdlpHU3ZITks0SzVsMWpMU1dPRmFXRTNF?=
 =?utf-8?B?U3hmSG9sZExCZ1JTSnhGMnBZc2Z1SC9CVGdIOGZMY3liaVUyYWlYV2lLSUMy?=
 =?utf-8?B?MTNEdU1qRGtPbisxU0Z0S1pVZVA0TkpjSE1GQXk5TDUzS1NtdENHVC9EelBD?=
 =?utf-8?B?bjducUxVWGRRS214d09tbENSYXBoczBMbkFXSE5EWnJNWkZIUXExcklJQ3hp?=
 =?utf-8?B?WUpzYTY2OWlIdzl1OGFMY1g5bW9YRXQ5eUlqd1ZVSmg3d2tqbFdiZ1N4TXZ6?=
 =?utf-8?B?YUQyZis2eG54MW1rcEthMnV2STF6U1g5a1hwb2w1MVd2MG1DcWF6bzdEVGJH?=
 =?utf-8?B?dDBYYUJNYnpPWVMyWDlRRGZWL3VYVkRxeVBsVnY1aGpxcW1XS01YRWc5TTRK?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: p4kesvlZ+KTSqcgcrmCcku3tra9z2zbBWAAaf1grXjEz3JcDFrDG4sa3QSXhjspt4dUNlzinEiHBAZ44zB9lesHDsyISkvVSQW2+FNOmWchlRJm9ZrZFrjGoNLguuFWvrTGGrAc7pehqrxfNULWvE+e6Nk7PETqzLb6a4yzAZi9VEtuBT9fBEVd5c98nUfL1Qg51JtxO8oe9FtTPiGHT+KUYiTTaAvgL1y5q+pW71Vr5hiZ3Fb1OUrzTA+91cDpDC+X5wPVMcefxqJlr8fuqREykTJbTgITe78RYDMGosWeA8i69RlbMYIj6D1JPKKSnSXOVIpkzhUuA0g04g4Kb0Fudq3GavE85WeJLpj3hnmEeGP1/Z0IRAt187mtTEn7M95v8rwtscUjrdksYHxCDWEns2SC/FdLtrgb0lelTpZJMOA+6ABCzf3RB62xvhXyBRYbxI3YWruM+tb4gGp0GX7uyieGcq2D/gZVhHZpKHIhyk59pIegmAGY/Zy3/cti/gXCQ/jX9MMlKXXKliy/m2KI8AFnu3qFnpNMKdNrRg+ySlTkXPOtmt4R8YI8j/5D4fzyVrHgB3Z5swppID9xUo08V0Qp2e2r6qp33vTcurMNG1Zg2TbRu+VthOIsaMK7hgIDXWxARAvwlh/xfIb6db7hlKL6jeXNfg9rMGa9ggZvtMxyMhIKfkAH6NRYMx9dRlpyiXLh/s0BNgc+V0RGvY5QBWnqh1olBptSnyb6x7I9ucEI3iqSQR+PU2QRWtQZEUZe3WLjg9md/ZVBcH47dauQeraOgL9fhZ0snaejaYbNHpa1oF/ah4IB3hYKRoAj9RP8hK6pKoMujLzS0VGw5Xl/wjlFY5tJQY+iah/gdIfbU/YFaEfjOcXY3lTpsgk4D1gTqEKQ98DDVjofI4+aqJA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3c3624-c60a-4465-d832-08db1ab2fa3c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 00:13:40.9724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NponvVqU+oO6B+rG33prw9N/+A7UYBz6KtreHcPkBk9Lh7N0IOYLQspVVv7ct1Th4fd5CEPYfxIScleuV5tiDSE8VkJHrdx8Mqw9DFZxNuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5882
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_16,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020000
X-Proofpoint-GUID: XTyPT-Imxj0xZJ16XR1daUAN7u1p_J80
X-Proofpoint-ORIG-GUID: XTyPT-Imxj0xZJ16XR1daUAN7u1p_J80
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 02/03/2023 00:07, Joao Martins wrote:
> On 28/02/2023 20:36, Alex Williamson wrote:

[...]

>> Can we make the same argument that the overhead is negligible if a VM
>> makes use of 10s of GB of virtio-mem with 2MB block size?
>>
>> But then on a 4KB host we're limited to 256 tracking entries, so
>> wasting all that time and space on a runtime IOVATree is even more
>> dubious.
>>
>> In fact, it doesn't really matter that vfio_listener_region_add and
>> this potentially new listener come to the same result, as long as the
>> new listener is a superset of the existing listener. 
> 
> I am trying to put this in a way that's not too ugly to reuse the most between
> vfio_listener_region_add() and the vfio_migration_mapping_add().
> 
> For you to have an idea, here's so far how it looks thus far:
> 
> https://github.com/jpemartins/qemu/commits/vfio-dirty-tracking
> 
> Particularly this one:
> 
> https://github.com/jpemartins/qemu/commit/3b11fa0e4faa0f9c0f42689a7367284a25d1b585
> 
> vfio_get_section_iova_range() is where most of these checks are that are sort of
> a subset of the ones in vfio_listener_region_add().
> 
>> So I think we can
>> simplify out a lot of the places we'd see duplication and bugs.  I'm
>> not even really sure why we wouldn't simplify things further and only
>> record a single range covering the low and high memory marks for a
>> non-vIOMMU VMs, or potentially an approximation removing gaps of 1GB or
>> more, for example.  Thanks,
> 
> Yes, for Qemu, to have one single artificial range with a computed min IOVA and
> max IOVA is the simplest to get it implemented. It would avoid us maintaining an
> IOVATree as you would only track min/max pair (maybe max_below).
> 
> My concern with a reduced single range is 1) big holes in address space leading
> to asking more than you need[*] and then 2) device dirty tracking limits e.g.
> hardware may have upper limits, so you may prematurely exercise those. So giving
> more choice to the vfio drivers to decide how to cope with the mapped address
> space description looks to have a bit more longevity.
> 
> Anyway the temptation with having a single range is that this can all go away if
> the vfio_listener_region_add() tracks just min/max IOVA pair.
> 
> Below scissors mark it's how this patch is looking like in the commit above
> while being a full list of mappings. It's also stored here:
> 
> https://github.com/jpemartins/qemu/commits/vfio-dirty-tracking
> 
> I'll respond here with a patch on what it looks like with the range watermark
> approach.
> 

... Which is here:

https://github.com/jpemartins/qemu/commits/vfio-dirty-tracking-range

And below scissors mark at the end this patch in the series. Smaller, most of
the churn is the new checks. I need to adjust commit messages, depending on
which way the group decides to go. So take those with a grain of salt.

> 
> [0] AMD 1T boundary is what comes to mind, which on Qemu relocates memory above
> 4G into after 1T.

---------------->8-----------------

From: Joao Martins <joao.m.martins@oracle.com>
Date: Wed, 22 Feb 2023 19:49:05 +0200
Subject: [PATCH wip 7/12] vfio/common: Record DMA mapped IOVA ranges

According to the device DMA logging uAPI, IOVA ranges to be logged by
the device must be provided all at once upon DMA logging start.

As preparation for the following patches which will add device dirty
page tracking, keep a record of all DMA mapped IOVA ranges so later they
can be used for DMA logging start.

Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c              | 110 ++++++++++++++++++++++++++++++++--
 hw/vfio/trace-events          |   1 +
 include/hw/vfio/vfio-common.h |   5 ++
 3 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 655e8dbb74d4..ff4a2aa0e14b 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -44,6 +44,7 @@
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
 #include "sysemu/tpm.h"
+#include "qemu/iova-tree.h"

 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }

+static bool vfio_have_giommu(VFIOContainer *container)
+{
+    return !QLIST_EMPTY(&container->giommu_list);
+}
+
 static void vfio_set_migration_error(int err)
 {
     MigrationState *ms = migrate_get_current();
@@ -610,6 +616,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .iova = iova,
         .size = size,
     };
+    int ret;

     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
@@ -626,8 +633,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         return 0;
     }

+    ret = -errno;
     error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
-    return -errno;
+
+    return ret;
 }

 static void vfio_host_win_add(VFIOContainer *container,
@@ -1326,11 +1335,93 @@ static int vfio_set_dirty_page_tracking(VFIOContainer
*container, bool start)
     return ret;
 }

+static bool vfio_get_section_iova_range(VFIOContainer *container,
+                                        MemoryRegionSection *section,
+                                        hwaddr *out_iova, hwaddr *out_end)
+{
+    Int128 llend, llsize;
+    hwaddr iova, end;
+
+    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
+    llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
+
+    if (int128_ge(int128_make64(iova), llend)) {
+        return false;
+    }
+    end = int128_get64(int128_sub(llend, int128_one()));
+
+    if (memory_region_is_iommu(section->mr) ||
+        memory_region_has_ram_discard_manager(section->mr)) {
+        return false;
+    }
+
+    llsize = int128_sub(llend, int128_make64(iova));
+
+    if (memory_region_is_ram_device(section->mr)) {
+        VFIOHostDMAWindow *hostwin;
+        hwaddr pgmask;
+
+        hostwin = vfio_find_hostwin(container, iova, end);
+        if (!hostwin) {
+            return false;
+        }
+
+        pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
+        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
+            return false;
+        }
+    }
+
+    *out_iova = iova;
+    *out_end = int128_get64(llend);
+    return true;
+}
+
+static void vfio_dma_tracking_update(MemoryListener *listener,
+                                     MemoryRegionSection *section)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer,
mappings_listener);
+    hwaddr iova, end;
+
+    if (vfio_have_giommu(container)) {
+        vfio_set_migration_error(-EOPNOTSUPP);
+        return;
+    }
+
+    if (!vfio_listener_valid_section(section) ||
+        !vfio_get_section_iova_range(container, section, &iova, &end)) {
+        return;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
+        if (container->min_tracking_iova > iova) {
+            container->min_tracking_iova = iova;
+        }
+        if (container->max_tracking_iova < end) {
+            container->max_tracking_iova = end;
+        }
+    }
+
+    trace_vfio_dma_tracking_update(iova, end,
+                                   container->min_tracking_iova,
+                                   container->max_tracking_iova);
+    return;
+}
+
+static const MemoryListener vfio_dirty_tracking_listener = {
+    .name = "vfio-tracking",
+    .region_add = vfio_dma_tracking_update,
+};
+
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
     int ret;

+    memory_listener_register(&container->mappings_listener, container->space->as);
+
     ret = vfio_set_dirty_page_tracking(container, true);
     if (ret) {
         vfio_set_migration_error(ret);
@@ -1346,6 +1437,13 @@ static void vfio_listener_log_global_stop(MemoryListener
*listener)
     if (ret) {
         vfio_set_migration_error(ret);
     }
+
+    memory_listener_unregister(&container->mappings_listener);
+
+    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
+        container->min_tracking_iova = 0;
+        container->max_tracking_iova = 0;
+    }
 }

 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
@@ -2172,16 +2270,18 @@ static int vfio_connect_container(VFIOGroup *group,
AddressSpace *as,
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
+    qemu_mutex_init(&container->mappings_mutex);
+    container->mappings_listener = vfio_dirty_tracking_listener;

     ret = vfio_init_container(container, group->fd, errp);
     if (ret) {
-        goto free_container_exit;
+        goto destroy_mappings_exit;
     }

     ret = vfio_ram_block_discard_disable(container, true);
     if (ret) {
         error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
-        goto free_container_exit;
+        goto destroy_mappings_exit;
     }

     switch (container->iommu_type) {
@@ -2317,7 +2417,8 @@ listener_release_exit:
 enable_discards_exit:
     vfio_ram_block_discard_disable(container, false);

-free_container_exit:
+destroy_mappings_exit:
+    qemu_mutex_destroy(&container->mappings_mutex);
     g_free(container);

 close_fd_exit:
@@ -2371,6 +2472,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
         }

         trace_vfio_disconnect_container(container->fd);
+        qemu_mutex_destroy(&container->mappings_mutex);
         close(container->fd);
         g_free(container);

diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 669d9fe07cd9..8591f660595b 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t
iova, uint64_t offset_wi
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t
size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not
aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING
region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64"
- 0x%"PRIx64
+vfio_dma_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t
max) "tracking_update 0x%"PRIx64" - 0x%"PRIx64" -> [0x%"PRIx64" - 0x%"PRIx64"]"
 vfio_disconnect_container(int fd) "close container->fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int
num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 87524c64a443..bb54f204ab8b 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -23,6 +23,7 @@

 #include "exec/memory.h"
 #include "qemu/queue.h"
+#include "qemu/iova-tree.h"
 #include "qemu/notify.h"
 #include "ui/console.h"
 #include "hw/display/ramfb.h"
@@ -81,6 +82,7 @@ typedef struct VFIOContainer {
     int fd; /* /dev/vfio/vfio, empowered by the attached groups */
     MemoryListener listener;
     MemoryListener prereg_listener;
+    MemoryListener mappings_listener;
     unsigned iommu_type;
     Error *error;
     bool initialized;
@@ -89,6 +91,9 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    hwaddr min_tracking_iova;
+    hwaddr max_tracking_iova;
+    QemuMutex mappings_mutex;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
--
2.17.2



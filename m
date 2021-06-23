Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0553B1ABF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:08:41 +0200 (CEST)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2cS-0000IO-IU
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lw2bX-00082a-W4
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:07:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lw2bV-0003Ic-Vz
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:07:43 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ND76xq002798; Wed, 23 Jun 2021 13:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=zfsxSzt145HOvFxWZb2F3M8DLvepDfWP8KSUTyPO/tk=;
 b=L1JYpDNDEMaKbXa9FhPZ5QgRux6HHSSWZDq1UZMMee3IVfip7VjjJDks/qRryXu0uUas
 xmKP14Sq4uwvhUvMGYAMGCkS6zJtYBrzjydVak8oVI7wHZ7KxblIqRdC2XrHZsqxd06+
 zjnvt+jE+JKtyHc7+FGBGyoxQTyeRP7JiAQz4gDzRA+UAc02wUJgPBGif7uQrq52kfA2
 XqNAcHacuCsq++rThVGAogPO9iMGnzpvgG8X7pm/a7J58d2niXsuT/rCO/jfPFiSZ1CZ
 8vgn20Gp7D6lbRcBzJCdn/HBrApi7tUNPP47648ZK1SzqPTy4deRXlUb15RKvUZhvW6f pA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39c2wngb72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 13:07:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15ND5XBn161191;
 Wed, 23 Jun 2021 13:07:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by aserp3020.oracle.com with ESMTP id 3998d936br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 13:07:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbCKnix+ExZCyBwexkXs9Zw4YjCQpnn0PpQIAj+6n3sWPAjLMCkqR3U5cIvX7lhm+WKMSxN/p3gKCzHujGllqOzwNhpBPq4feLxeSDegJeQJNMLQnNr5hGVrYD1iHBuAlvLi27Y2eAcHpLS8Qlj/6nPtn3pXZZJMLTl+Bg6C2KE/1VdG9VToO8pxRSZr15QC2Rv4uFlAPmHQxuORsRprqWqV8Vfpq/NkMwMm6+kT9+/x71fM310J88uoRs/mDnzS1tmx0JAE8w+An18WD5Pk8XP0jfAirq6lSzD2sJQja8FXGxVEXK/f9PziT9WTf6/24q/MWKpdoC+aOVYJrxmpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfsxSzt145HOvFxWZb2F3M8DLvepDfWP8KSUTyPO/tk=;
 b=MNMiC9hXYx2PBmzbIIWND3eq5bGEum1WmHweyq2U085DQIMjcVxUALxH2kCJyJMEC66GrySrf6jk3Y+jDwFYjpD3seoitX9uK5EtgonnSTQvjMLP2yxEROouWwh1sgkhQIrnDSBe7IIvfaI7+P4+o3rbSM6rcAZNPe1FKd+YMsd3Bcxza7C/jk9WP3CuQB4N6wr3RAXBuoDijxILDYX4W3yfbyYprHfM/e6HHH9DVZLDJb/9dlaIEzqNzllr/hUTdNOjPci3nkaC00gc+LcSCoMLe4/2SdZ1Wq8GTHylU2U3cRf5wCs73FY8VRFFTLwQGwsSOk5/TjQfoOcKh8S+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfsxSzt145HOvFxWZb2F3M8DLvepDfWP8KSUTyPO/tk=;
 b=xHhw3I1X9bq8CKnlZrtPERGI5mhuSZ8a8Not9BjLqVFQJUuBUrrMURZauIpKKlWJeKLu+Va6ch2h3YlcDv2cvKVLgJYSYJozNheV/858AaYXmaXz73A+ataEmvSBgnQ8KNz9waZ204XaJFQtvClhGxZ549OZmFNS4+gZvM0VBhw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5043.namprd10.prod.outlook.com (2603:10b6:208:332::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 13:07:35 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.018; Wed, 23 Jun 2021
 13:07:35 +0000
Subject: Re: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
To: Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-2-joao.m.martins@oracle.com>
 <20210623110341.0ceca1b4@redhat.com>
 <21f86eb7-e9db-b7ac-9014-2baa9fd44741@oracle.com>
 <20210623140922.404b280b@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <fabd186e-bfb4-3aaa-e207-72dc67ba4214@oracle.com>
Date: Wed, 23 Jun 2021 14:07:29 +0100
In-Reply-To: <20210623140922.404b280b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:189::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Wed, 23 Jun 2021 13:07:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07d13aa3-7a0d-409f-514f-08d93647de4d
X-MS-TrafficTypeDiagnostic: BLAPR10MB5043:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB5043C435E7C89CA140FB8A89BB089@BLAPR10MB5043.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +yGa0OstDXCIejeS3/xyAEs95yYmFIdFBVBTlt52EzvikFmRDUg1JHU/vvTMf7XFpDwoTTNR9gytLpPJrUXxemsAwd62VKZYLsg8sscrvE/zlBvYEotNVhEJzgQ67Jel+bERG+HUlMR35sBd0JeyhZCmfLvFqBL+iMdrlOklLqBieRea+6ZTjH5oK8J6kOU4U2YT+lReco6Gb8BqlHDK3Y44qjGjEMFQ9+pvQRkdOtXKj7P1sNNGv41ZTvHXaGnW6tDACQKRhTNvo/md7db/e6jSUr+1h/Qe7oSD2Ed4mCc9nqB+Hn3eWLeb8x1RBPMuKrDRZxbaVLo2v5mHZbfqnYSclXIEHNAdRY1Hytl7QZH82tQi7IjuzWJagCkGRypQPD1+E0V+NHtqURYuRdUIokx9UnpjfZWPvTKSaYaY1z1WNUXpYhYPgeelwb09bNihXCLSYq48TMwpGE2VQbNjhgGXBQpg6cje7FT4hYwxKoUjsZJplkbvPDgsKHgoXnNOH266fm827AqtT/W230d5RC4c1Qao6J+KKyv+RwXAde+UGGOKG7Kl+DC90AZ475T4KM9l81dWHx3JauVu74QbXvMPh6LYQuvYcH09MUDTuLGXCMUoh+GAcmS8yRj+qPmji249NaYsk3k4Rb+h7w1fp871kbBKltyznb1A3KJ/gd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(396003)(39860400002)(376002)(86362001)(6486002)(8936002)(15650500001)(5660300002)(31696002)(16576012)(316002)(66556008)(66476007)(8676002)(53546011)(54906003)(956004)(2616005)(83380400001)(4326008)(16526019)(66946007)(31686004)(26005)(186003)(6666004)(2906002)(38100700002)(36756003)(6916009)(478600001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lsUFh6VlFkSXdUSnA5UmU3Z2UxeVRaU1NySkdTYm53OU0yTUs3RnduSm9D?=
 =?utf-8?B?RGU5SWRDOUJtd1ZDTUp0VElucGkvbjM1Wi9hQ2ljVUNMSGdSdFQ5QWUzMWto?=
 =?utf-8?B?S0ZTcVJ4STJUVVNqbFQ4d0dERGRidHBoRE5CL1RVTUV2bm41YXQ1c1BJQlox?=
 =?utf-8?B?bVJZV1lkNnlHd2xaVHNIUkNJbFdPZkUwSlVXeG5xRHNid3dHSUwvcWFmUnNU?=
 =?utf-8?B?b2ZIcHBiM3R6NEJOT3dzbzFMTVdkSURHUEphRnE4NDVCSU5yYWs0eUt3YUY0?=
 =?utf-8?B?QzNlL0hDY1ZvSlQ1cDRVWDlpNThFMmFIdVRqaTdJZHhHaUtYeVlnZnNqYVp6?=
 =?utf-8?B?bXJnOU1udFJCVlMrdjhhcWw2S3VydW0rS2tiVXdncTNMYVpEcFBYL240b3hY?=
 =?utf-8?B?Q2dKWEpqU1dTazJRTEhVTjdjU2pmeHJLT0xVTkMvYXA1elQzUjRMYkZpR2lH?=
 =?utf-8?B?eWtkcm9MNHVwRVhGV1pSR3RFRis5RVl2RWtSeXh4Mk1XaStKdmdiYXpqZnJ4?=
 =?utf-8?B?YXNrL1F5cHQ1aytGNFEwN2YwNUJaZjVRQkswVFRhMW5UQkh1VThqQTFIUFVT?=
 =?utf-8?B?Tit3OVZKa1dHM1VoQ3RnK2cybmJlRGxVd0lHK3M0NVhTN2VqNVJOajRSTDFo?=
 =?utf-8?B?NnpGcmkrLzg2eFVlOHQrcUppZDBDMkJwQ3dSbGZsNHhWZlMwdVdLREpvSnht?=
 =?utf-8?B?QnE1TWJGWVdCVm5VZTRYanVwZlQ1V1E1ZDFvNUx2ekR6TGRnU0ZtZDlrMzlS?=
 =?utf-8?B?azd5TzRqeDRkSWk0czVyUUcyam40VFJ2eGlKYjFnRmpqdGh5Z1lmSlNDcjF2?=
 =?utf-8?B?VDJoMm43MEEycld3L3ZMTURnWVY0SENlWVRQcFBwQWR6UEp3cFF6Zjc1SWFP?=
 =?utf-8?B?TWVUUW81by9xNlc3Qzh6dW15R3c2L205WkxHajYxU2pPbUZDTmFaZGFmV21K?=
 =?utf-8?B?V25RSnk1QmtydXdvdjMzTGpEeUhvNGc1ak9Uemk3RGlQdzBmQkkybjV4TWto?=
 =?utf-8?B?YjhuWjhDaEdMVi9wVlFkTi9udnhaR1F2dmxhbHd4WE1EV1hod2NRa05meE80?=
 =?utf-8?B?ZFhwT0JBc0x4WTdEU2JSZDBDQmdtYWQ4ZzFuNlZveXZvbnBNTllObHFlaXFD?=
 =?utf-8?B?Y1JIOWRQYTRGZUdsNTJRVTNYbnlnbEY4YVJxZHlHQllyUkxZQTg5cVEyakEw?=
 =?utf-8?B?WXpNZ2wxdDRsZjhnUlY3WkI0NmRDTjN3K1pkTy9uWFIvNmJtZFowY3JHejRo?=
 =?utf-8?B?TkVhd1J0cGhabGMwWDBBbC9LY00vb1dwc3FpM0lpS1VNWE5MSkFkRzJTRHZw?=
 =?utf-8?B?UFNEd1VHMHBpVkRrdnpQTlNuUjhBeEhMd2taNWtDUVVqbDlsOXlmVlJ2WEVz?=
 =?utf-8?B?MVdkVTFZQU5PQjlaNzhrWVRnUTE0YXJvUDNZMVdLVnJZcEdhQm5oSW5VUHJQ?=
 =?utf-8?B?VXdsTkcwaUlya21veFVlQUJhR0RmRFNERHMyK3JFSGRWMERBYmgyTU9oRWZ3?=
 =?utf-8?B?K3kvOUlhakdKcVpySjk5d2xzRENsNWl4bHhLbjJKb3pOTk5RK3lWa01pWVk4?=
 =?utf-8?B?Z0RHN09NMzdncWhDNnJPazNtYTZVRE5BTDUyZnZoVWZhekwwQmN2MmZiVDl5?=
 =?utf-8?B?STBSbnhKZHd5V0JwQTdQL3pPMGN1VVZYNWNOM3ZnOStHMUI2ZSt3M24zQmRU?=
 =?utf-8?B?MGx1Y0wrRWpIUkJrTlc4MUpaejBEVVBrZW5yWm9sR0pkTHR1bnFGMWJORlB3?=
 =?utf-8?Q?vXXdH51gOnLfIRLtnMgsUaGehIJrESXj4ELj950?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d13aa3-7a0d-409f-514f-08d93647de4d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 13:07:35.1017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEC3k/ZB1dAjDOHNVgGV7TNnWpDQz4R/FZNasgz64NsJKPaAyGAm0b79+AMoeVTnT88aUsV7MtcVdXRdtail5R4y092XJEDrkSnW+kseIF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5043
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230076
X-Proofpoint-GUID: doHtqePn9F9obhtfSAUsu4aZkcaRRD-4
X-Proofpoint-ORIG-GUID: doHtqePn9F9obhtfSAUsu4aZkcaRRD-4
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/23/21 1:09 PM, Igor Mammedov wrote:
> On Wed, 23 Jun 2021 10:51:59 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 6/23/21 10:03 AM, Igor Mammedov wrote:
>>> On Tue, 22 Jun 2021 16:49:00 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> It is assumed that the whole GPA space is available to be
>>>> DMA addressable, within a given address space limit. Since
>>>> v5.4 based that is not true, and VFIO will validate whether
>>>> the selected IOVA is indeed valid i.e. not reserved by IOMMU
>>>> on behalf of some specific devices or platform-defined.
>>>>
>>>> AMD systems with an IOMMU are examples of such platforms and
>>>> particularly may export only these ranges as allowed:
>>>>
>>>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>>>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>>>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb)
>>>>
>>>> We already know of accounting for the 4G hole, albeit if the
>>>> guest is big enough we will fail to allocate a >1010G given
>>>> the ~12G hole at the 1Tb boundary, reserved for HyperTransport.
>>>>
>>>> When creating the region above 4G, take into account what
>>>> IOVAs are allowed by defining the known allowed ranges
>>>> and search for the next free IOVA ranges. When finding a
>>>> invalid IOVA we mark them as reserved and proceed to the
>>>> next allowed IOVA region.
>>>>
>>>> After accounting for the 1Tb hole on AMD hosts, mtree should
>>>> look like:
>>>>
>>>> 0000000100000000-000000fcffffffff (prio 0, i/o):
>>>> 	alias ram-above-4g @pc.ram 0000000080000000-000000fc7fffffff
>>>> 0000010000000000-000001037fffffff (prio 0, i/o):
>>>> 	alias ram-above-1t @pc.ram 000000fc80000000-000000ffffffffff  
>>>
>>> You are talking here about GPA which is guest specific thing
>>> and then somehow it becomes tied to host. For bystanders it's
>>> not clear from above commit message how both are related.
>>> I'd add here an explicit explanation how AMD host is related GPAs
>>> and clarify where you are talking about guest/host side.
>>>   
>> OK, makes sense.
>>
>> Perhaps using IOVA makes it easier to understand. I said GPA because
>> there's an 1:1 mapping between GPA and IOVA (if you're not using vIOMMU).
> 
> IOVA may be a too broad term, maybe explain it in terms of GPA and HPA
> and why it does matter on each side (host/guest)
> 

I used the term IOVA specially because that is applicable to Host IOVA or
Guest IOVA (same rules apply as this is not special cased for VMs). So,
regardless of whether we have guest mode page tables, or just host
iommu page tables, this address range should be reserved and not used.

> 
>>> also what about usecases:
>>>  * start QEMU with Intel cpu model on AMD host with intel's iommu  
>>
>> In principle it would be less likely to occur. But you would still need
>> to mark the same range as reserved. The limitation is on DMA occuring
>> on those IOVAs (host or guest) coinciding with that range, so you would
>> want to inform the guest that at least those should be avoided.
>>
>>>  * start QEMU with AMD cpu model and AMD's iommu on Intel host  
>>
>> Here you would probably only mark the range, solely for honoring how hardware
>> is usually represented. But really, on Intel, nothing stops you from exposing the
>> aforementioned range as RAM.
>>
>>>  * start QEMU in TCG mode on AMD host (mostly form qtest point ot view)
>>>   
>> This one is tricky. Because you can hotplug a VFIO device later on,
>> I opted for always marking the reserved range. If you don't use VFIO you're good, but
>> otherwise you would still need reserved. But I am not sure how qtest is used
>> today for testing huge guests.
> I do not know if there are VFIO tests in qtest (probably nope, since that
> could require a host configured for that), but we can add a test
> for his memory quirk (assuming phys-bits won't get in the way)
> 

	Joao


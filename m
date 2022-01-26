Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA849C349
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 06:33:21 +0100 (CET)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCavo-0004F3-Bg
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 00:33:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCaqS-0003Nw-Bh
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 00:27:48 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCaqP-0000NJ-5J
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 00:27:47 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q51Kh6009994; 
 Wed, 26 Jan 2022 05:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=5pbUDIN5lpSju0AUH6rhgFsKhqSyPbkYRz9uKJRVfzY=;
 b=R2kO+ZN8ugvOjnybzWWFwN1WOQNVyzxyk6exmL9qqeY1u3rhNJJBue7h63iUcMEsgh+N
 uHfYBvepCKfhWNitdegHI2pA7wd7lI3bVMvIcL2Jw+7ubdxqfiibFRoLAxcfeSdnPUWl
 4N1+zvevmHX/vElCarcTi/vchRaI99WyoWW/1kEu+aBIHEMIsr30jUHj9ng5H/AsErat
 obVKQynQI3yTfJu82xRTKtK2vN87angNoHnESu1VKq1eYRNu6zhIqPfp9QbbOBYT/oYM
 9doR+9Gp1H5b8MKRXFu8xYkbDrZwpXJnDAKpGw7nCEtlIF+yR3KjnjnrrARxLQHMqhVx ew== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxvfn104-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 05:27:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20Q5Kmmt084070;
 Wed, 26 Jan 2022 05:27:36 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by aserp3020.oracle.com with ESMTP id 3dtax7sbmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 05:27:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6O7oPTAHbrCY5iC36SzG8W5gI2/CHBeW4hpRwt9unX3eA+QY5rIXmZgJ+MqkIvu+E/S8uQsx7S3YBCZylHTImdxYl1NJb4tcZ7+ctKx0z4wQEzFms7iKppGOsQPR8l27C785QqtxA0LlJMjVh6YWGU7RORGn39vtFtSMMZWWh9+Sw9SoO5RwcQrdmbxpXVCoo5gICxUoSvh1JpdTUzhN2mAFAP2HYHJU2dIvA3UrkZFu0Y32UgDE2+V3KW4waGaL//RhpVyH5EMgH3bnEslPcBFk4h0E/Jor9p5ePRpBeKftK+9DPFuuoltIX1JF/9bgshOE27a2XQRxPh35RCx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pbUDIN5lpSju0AUH6rhgFsKhqSyPbkYRz9uKJRVfzY=;
 b=fD/i8N4EbitWxJ3HVw5uclROsxVQr52wgpky+gGpFwyj83mpesxknFWzkNHeUlI8OSrav7ZyasTCG6nwiXcAoVkG1GhfYBxJ7ATaE1kpprcVD5i7sYkjmnA3iTAkklPjVPBhWFuyRqbthm4yvuUBPHC0znBRMpTdDBoEnm9cXo4HPfs59zmuZDDcsX4Stk05c6Ox4VYsxtdWQve2jHvYDsJVAgBDIw7i49e4SoP2Ozi28r1ajCv8LhPhlRubJ9QwRIfDHBb62c/oJ0zquMjPUxyqPE+fJ3tX45UEUR18W1g/PcgfjLmXh6zd1KHAyY/fWUySzDj8slvcTJi/cB5tnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pbUDIN5lpSju0AUH6rhgFsKhqSyPbkYRz9uKJRVfzY=;
 b=Lawn4ahb5tcBECsOUOweaCdZWGrcG7F8/70ElqSjniWNTOf0X5tbCYSe/MknpUI69/LkBW+jOkYL8tpHqjX1ezakwP+7Ng8k6ZwEOFPdhGA7hcuqeFRmkQqeCcJChNggm/fwFFpbxUzrNYqGeHww79GLA8XDv8KNRW9BIRM+8Q8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH0PR10MB4437.namprd10.prod.outlook.com (2603:10b6:510:3a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Wed, 26 Jan
 2022 05:27:33 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 05:27:32 +0000
From: Jag Raman <jag.raman@oracle.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Topic: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Index: AQHYDX1z2h/nyOzV1UqlYAx4HMB2U6xrCcSAgAD94YCACBLhAIAAtVOA
Date: Wed, 26 Jan 2022 05:27:32 +0000
Message-ID: <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com> <YfBDqMuO/l/gWzL8@work-vm>
In-Reply-To: <YfBDqMuO/l/gWzL8@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4a13b02-f99e-4b7e-e19a-08d9e08c8dd6
x-ms-traffictypediagnostic: PH0PR10MB4437:EE_
x-microsoft-antispam-prvs: <PH0PR10MB4437BA599E90E7B3F820313090209@PH0PR10MB4437.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8/wf+p1xWo+gBwdXBNAuB0KyNWlyFgFGvWlRg2OGVZLeLJhRN0sf6gBedEWCTw0KGxi/6TIx5pems5tWt1+LRaqf5771AVSRtUVuZUyysK7q+LmceobOVtS+tqNVfpxtEn/MPC0dWg5GWjdzxH2uiGZtj1LiOqWmT2Pb5CV9chSbb4TBBnTiKH7WHhXEpv3AUYI0kAw2F1Wv9OQEz4bVVv5CEl22Be3yPD0kivI5F4k2+su3iRzYJloA0AOGFVyUZvWOQw9PxaDvRJyqxk/K5cqi57/7LcWdq4olCTvNjjzdFWh5M+a5Hh81hdeQCv8E6BbFzMTp0m9JVxmgDJ9X2sYTuefcD7CacBMBGl+6dK/pZnzktyAYKo3NwY/jBYtu8oYR2BodEkeiihdzNrJ/kwORIQUBDFc5hz/pHvsbjPYxlGj154mbG39khI3JNGO/N4AaNOyJVS2Ez8Q5LrEfP1mgkcEGkLecLUA8hYb9BjaVfGNMGu+vDcHNSOvRWOUQeVZzlMFqmQ7ogVUmQXd9SGUlmkjU7VyaNuO1AdjKSjmeoVM9c4Zal2Wq7vRrq0NAVJB+V3z8TzR6JvZoIaX78ITf/oZyeGemBNgCexkoSzoQFoDN99gz6ZylxzI67B+p4sF3G+Y59XXNkoOHPibO8sqncxWXd33EROFkzUJ1HPfwu15P2LIGFw/xKctSxJQnQp0roivsN5bWLSv6xwmQQzKybJJbF0b5/WZbzx0zTNq3JWkuXmKqStKjQDZbdv3vo5FFie4F+yd9DML5kVhVBh+SmzZa3lcM+y2KuTTGZmb78Y1PeZESAHLaemTAhLLX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(6486002)(966005)(71200400001)(38100700002)(8936002)(186003)(83380400001)(4326008)(2906002)(66946007)(66556008)(44832011)(7416002)(316002)(508600001)(6506007)(107886003)(122000001)(6916009)(6512007)(91956017)(5660300002)(64756008)(2616005)(38070700005)(8676002)(36756003)(54906003)(33656002)(53546011)(66446008)(76116006)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3VEcVFoVTc3c3hNWWpNbkhWdVMvM1FJL0hhdHJmNVo1bTJZa2lvdnI2VUVP?=
 =?utf-8?B?ZkxLbm01ZmRGcmF3WUtzS2l4dnhPZlE5d0hNRURabXNZTGgvM3AxMmN2ZXlR?=
 =?utf-8?B?NWFZQ1NxdThaYm9GcGxoWVN3N1lBcmVTUXA4alJRc1MyRE5ZOUF2bmU4bTZY?=
 =?utf-8?B?UzZ2TytudVRGYjdrTDV2N01PaG11bFJZMHJrU3pXSnlYQzZFc1UxMTdmTkV0?=
 =?utf-8?B?ZmRHZE5rZmw0eWRlVlliTFZQZ1Bqb0F1TitWZTNHeXdNOHA2WkQ2VkRMRlNw?=
 =?utf-8?B?d1VjWGQ1NGdtTm5kRnp4dWFZaGI4bWRpK2xSbkVwaTZ1blhoYWIvdmJpRDRy?=
 =?utf-8?B?c25mQW1tVS9JWlphU2VxclJrcTBBdGhzYk9EeXA1T3QwanUzbG1MaE9QbXE4?=
 =?utf-8?B?cE90Uko5L1J0VGtjdFpBTEpZNHl4M2dDU3VUMlZVK3k1UjJSN3lEMVBUdURn?=
 =?utf-8?B?UTkzOHVHR2d6NGt0ZDF6aGh6dkR2bHBhNUl5QmJKMTBzUkYvZ1JyYjlJc0Ro?=
 =?utf-8?B?SzJ6bEp6b1E3VGJUMTZBMWdyRUVuc29uTm4xdEhENjJjNHovYVlDYll6ZGV4?=
 =?utf-8?B?OVNkKzhIcmhtOWVlYUdNUGJNTEE1RDFuTUFxV285VWJmcWxzZHk5bTczeW13?=
 =?utf-8?B?Rm5MZDNpT0dyaitpVWFZU2U2WlN2SHJrZGFpUmJSTHUyeDBLRlkxMEczWW5R?=
 =?utf-8?B?UnZUWWNuUjBJNTd5MUN1UGRqcVUvbjhSeTRmVzBHWmsyT0RQR2s3TmFubDZp?=
 =?utf-8?B?RTlxR1pCQWF4SG5qVUlGcis2ZG9NbVAwOVpOeTF0NVB0VXZkYkhxc0xjaG9z?=
 =?utf-8?B?QlltdDMvUVcvMG8wMGRlWjdqZytwanZPY0FGeHVlbFVCOEZDNXRleEFTUUxz?=
 =?utf-8?B?K1RsVEY2cmZGOWkyY3BGRklXZ3NsV0MrSVdvbkpBeEVnWFI1bkd5WlJocG0r?=
 =?utf-8?B?NFdEVzl4a0s2RENUOWtxVjQyZDdNcEd4L2VIeFpMM2h5K2RpR0RyemxxRVZO?=
 =?utf-8?B?M1RKWW81YnN5QjhOa2VMcjJkZllSWmVGUUF1QW8vT2duS0UzU25OdENXVDlO?=
 =?utf-8?B?dDdVQVd4bGZDVnhTa3JaRVN1Rml4dmEzajdRbzNaNkVpODhJelBnemppTHpi?=
 =?utf-8?B?dmo4NUp5QWtZdDc1eldaMC9XSXBkODlTa04wbzAyTVplNlhvZGZlRWRlNE1h?=
 =?utf-8?B?S0dJc0dxR0c5MzJ6eWVrSENkdVpTVnBycHBHblJSL3p0bHpONjJvYllnMzF4?=
 =?utf-8?B?bmMrVVpKQ1BoaGMrVGZWQVFVMUdFQTFqaHVRbGFvTUc0RUwxY3Jxa21hOWNr?=
 =?utf-8?B?MGIxSFkxTUhSeGF4UGRaanNQMFpZRisxRVBtUlFpMElwaERid3RkaUhLVVFM?=
 =?utf-8?B?cEdFWkw3azduNXo3MFBLdFhOQkhZQWtjQ0F6OE45N1JFSXRoelRaUjJMbHI0?=
 =?utf-8?B?SWYzd0FiUmtCTXJLNUx6V2lJTXc3bzkzVUxVYk5CS3JVU0NEUmhObElxMGFV?=
 =?utf-8?B?Y3FMR1VKOFlhMy94L0RrMFF2RWM5WU5LTDUvOHVFbE55R3cvN3JWaDlYdDZ5?=
 =?utf-8?B?N1hKZTg0c09TbXFuRHplVzVzQ096UVFraEJOdisyM05VSk9WcGlNSHlGeDlT?=
 =?utf-8?B?QUxxbmlwQmJIejFJWFJmZEtuTzBuM1hidkc4V3o4K1g1bE4vZ2VtaEZ6NXN1?=
 =?utf-8?B?eXVxUWFBRW1NUnlmMVFaRnhvNTNyM1pZZThqZ0Uwb1VzZlozejcrRVdCRCty?=
 =?utf-8?B?WjZXVUdscnErUEcyWklzZ29sVUZJM3NoMnhEK25DOHlJZEw0cVNBOW13K2Ro?=
 =?utf-8?B?UzhhT01GRktScmx5SVlJSnhsYW9ON3BSSzBWcjkwR2Z1MDY4STV2RlFmVWlC?=
 =?utf-8?B?bWduM3ZrWFdhUktqMWdpL0lvcUVyQ2xJQmx1RmUyNnZSVTVjbjE0R3l4STVO?=
 =?utf-8?B?YzRzTEJwdHl5MDZRN3FtMXdBYjRaVFlsQTJJeEF4SFd4RmVJa3hjbEloSlcw?=
 =?utf-8?B?SFNWaDRoQW5BcUNPSUk5ZGRQMUovSjQ1UDFKVzd1TDg0eWJ4NEFyZUl5Myt0?=
 =?utf-8?B?eXowYlFLQWk1YkVldUQwZjd1QnlTN2UxWUVFdGxwbzIvT1VRQTUwSEJwUkQr?=
 =?utf-8?B?YUZEWDJiK1c1ZzRFVFlPR0krRWdBamVjUWtQak1RUnptR2Q0UXMzOVlqcmxL?=
 =?utf-8?B?SzUyUWZIcldqVnB1bTY3aExwK09KOHNZV2lQaFhCaTZDZzdkRC9XcUlQbHZG?=
 =?utf-8?B?OU9uWnVTUithN2NjdUN1U3dVaFRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23AB283B1DA0D04097943D51EC411187@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a13b02-f99e-4b7e-e19a-08d9e08c8dd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 05:27:32.7942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GEGQukt8neFIGRHoXbjTioAfR8HP29T4dq5wiyJOk5IWa3FfHXk1mQFYFuNfdLcEw0Zmoj40k5+YIH1cvZ4TAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4437
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260029
X-Proofpoint-GUID: 7iGFXjcUwZKRnxvIFoX3gXFEYC-dfO8m
X-Proofpoint-ORIG-GUID: 7iGFXjcUwZKRnxvIFoX3gXFEYC-dfO8m
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI1LCAyMDIyLCBhdCAxOjM4IFBNLCBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0
IDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+ICogSmFnIFJhbWFuIChqYWcucmFt
YW5Ab3JhY2xlLmNvbSkgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIEphbiAxOSwgMjAyMiwgYXQg
NzoxMiBQTSwgTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4gd3JvdGU6DQo+Pj4g
DQo+Pj4gT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMDQ6NDE6NTJQTSAtMDUwMCwgSmFnYW5uYXRo
YW4gUmFtYW4gd3JvdGU6DQo+Pj4+IEFsbG93IFBDSSBidXNlcyB0byBiZSBwYXJ0IG9mIGlzb2xh
dGVkIENQVSBhZGRyZXNzIHNwYWNlcy4gVGhpcyBoYXMgYQ0KPj4+PiBuaWNoZSB1c2FnZS4NCj4+
Pj4gDQo+Pj4+IFRZUEVfUkVNT1RFX01BQ0hJTkUgYWxsb3dzIG11bHRpcGxlIFZNcyB0byBob3Vz
ZSB0aGVpciBQQ0kgZGV2aWNlcyBpbg0KPj4+PiB0aGUgc2FtZSBtYWNoaW5lL3NlcnZlci4gVGhp
cyB3b3VsZCBjYXVzZSBhZGRyZXNzIHNwYWNlIGNvbGxpc2lvbiBhcw0KPj4+PiB3ZWxsIGFzIGJl
IGEgc2VjdXJpdHkgdnVsbmVyYWJpbGl0eS4gSGF2aW5nIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2Vz
IGZvcg0KPj4+PiBlYWNoIFBDSSBidXMgd291bGQgc29sdmUgdGhpcyBwcm9ibGVtLg0KPj4+IA0K
Pj4+IEZhc2NpbmF0aW5nLCBidXQgSSBhbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQuIGFueSBleGFt
cGxlcz8NCj4+IA0KPj4gSGkgTWljaGFlbCENCj4+IA0KPj4gbXVsdGlwcm9jZXNzIFFFTVUgYW5k
IHZmaW8tdXNlciBpbXBsZW1lbnQgYSBjbGllbnQtc2VydmVyIG1vZGVsIHRvIGFsbG93DQo+PiBv
dXQtb2YtcHJvY2VzcyBlbXVsYXRpb24gb2YgZGV2aWNlcy4gVGhlIGNsaWVudCBRRU1VLCB3aGlj
aCBtYWtlcyBpb2N0bHMNCj4+IHRvIHRoZSBrZXJuZWwgYW5kIHJ1bnMgVkNQVXMsIGNvdWxkIGF0
dGFjaCBkZXZpY2VzIHJ1bm5pbmcgaW4gYSBzZXJ2ZXINCj4+IFFFTVUuIFRoZSBzZXJ2ZXIgUUVN
VSBuZWVkcyBhY2Nlc3MgdG8gcGFydHMgb2YgdGhlIGNsaWVudOKAmXMgUkFNIHRvDQo+PiBwZXJm
b3JtIERNQS4NCj4gDQo+IERvIHlvdSBldmVyIGhhdmUgdGhlIG9wcG9zaXRlIHByb2JsZW0/IGku
ZS4gd2hlbiBhbiBlbXVsYXRlZCBQQ0kgZGV2aWNlDQoNClRoYXTigJlzIGFuIGludGVyZXN0aW5n
IHF1ZXN0aW9uLg0KDQo+IGV4cG9zZXMgYSBjaHVuayBvZiBSQU0tbGlrZSBzcGFjZSAoZnJhbWUg
YnVmZmVyLCBvciBtYXliZSBhIG1hcHBlZCBmaWxlKQ0KPiB0aGF0IHRoZSBjbGllbnQgY2FuIHNl
ZS4gIFdoYXQgaGFwcGVucyBpZiB0d28gZW11bGF0ZWQgZGV2aWNlcyBuZWVkIHRvDQo+IGFjY2Vz
cyBlYWNoIG90aGVycyBlbXVsYXRlZCBhZGRyZXNzIHNwYWNlPw0KDQpJbiB0aGlzIGNhc2UsIHRo
ZSBrZXJuZWwgZHJpdmVyIHdvdWxkIG1hcCB0aGUgZGVzdGluYXRpb27igJlzIGNodW5rIG9mIGlu
dGVybmFsIFJBTSBpbnRvDQp0aGUgRE1BIHNwYWNlIG9mIHRoZSBzb3VyY2UgZGV2aWNlLiBUaGVu
IHRoZSBzb3VyY2UgZGV2aWNlIGNvdWxkIHdyaXRlIHRvIHRoYXQNCm1hcHBlZCBhZGRyZXNzIHJh
bmdlLCBhbmQgdGhlIElPTU1VIHNob3VsZCBkaXJlY3QgdGhvc2Ugd3JpdGVzIHRvIHRoZQ0KZGVz
dGluYXRpb24gZGV2aWNlLg0KDQpJIHdvdWxkIGxpa2UgdG8gdGFrZSBhIGNsb3NlciBsb29rIGF0
IHRoZSBJT01NVSBpbXBsZW1lbnRhdGlvbiBvbiBob3cgdG8gYWNoaWV2ZQ0KdGhpcywgYW5kIGdl
dCBiYWNrIHRvIHlvdS4gSSB0aGluayB0aGUgSU9NTVUgd291bGQgaGFuZGxlIHRoaXMuIENvdWxk
IHlvdSBwbGVhc2UNCnBvaW50IG1lIHRvIHRoZSBJT01NVSBpbXBsZW1lbnRhdGlvbiB5b3UgaGF2
ZSBpbiBtaW5kPw0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoNCj4gDQo+IERhdmUNCj4gDQo+PiBJ
biB0aGUgY2FzZSB3aGVyZSBtdWx0aXBsZSBjbGllbnRzIGF0dGFjaCBkZXZpY2VzIHRoYXQgYXJl
IHJ1bm5pbmcgb24gdGhlDQo+PiBzYW1lIHNlcnZlciwgd2UgbmVlZCB0byBlbnN1cmUgdGhhdCBl
YWNoIGRldmljZXMgaGFzIGlzb2xhdGVkIG1lbW9yeQ0KPj4gcmFuZ2VzLiBUaGlzIGVuc3VyZXMg
dGhhdCB0aGUgbWVtb3J5IHNwYWNlIG9mIG9uZSBkZXZpY2UgaXMgbm90IHZpc2libGUNCj4+IHRv
IG90aGVyIGRldmljZXMgaW4gdGhlIHNhbWUgc2VydmVyLg0KPj4gDQo+Pj4gDQo+Pj4gSSBhbHNv
IHdvbmRlciB3aGV0aGVyIHRoaXMgc3BlY2lhbCB0eXBlIGNvdWxkIGJlIG1vZGVsbGVkIGxpa2Ug
YSBzcGVjaWFsDQo+Pj4ga2luZCBvZiBpb21tdSBpbnRlcm5hbGx5Lg0KPj4gDQo+PiBDb3VsZCB5
b3UgcGxlYXNlIHByb3ZpZGUgc29tZSBtb3JlIGRldGFpbHMgb24gdGhlIGRlc2lnbj8NCj4+IA0K
Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2
YUBvcmFjbGUuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5n
LmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFt
YW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4+PiAtLS0NCj4+Pj4gaW5jbHVkZS9ody9wY2kv
cGNpLmggICAgIHwgIDIgKysNCj4+Pj4gaW5jbHVkZS9ody9wY2kvcGNpX2J1cy5oIHwgMTcgKysr
KysrKysrKysrKysrKysNCj4+Pj4gaHcvcGNpL3BjaS5jICAgICAgICAgICAgIHwgMTcgKysrKysr
KysrKysrKysrKysNCj4+Pj4gaHcvcGNpL3BjaV9icmlkZ2UuYyAgICAgIHwgIDUgKysrKysNCj4+
Pj4gNCBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+Pj4+IA0KPj4+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9ody9wY2kvcGNpLmggYi9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4+PiBp
bmRleCAwMjNhYmMwZjc5Li45YmI0NDcyYWJjIDEwMDY0NA0KPj4+PiAtLS0gYS9pbmNsdWRlL2h3
L3BjaS9wY2kuaA0KPj4+PiArKysgYi9pbmNsdWRlL2h3L3BjaS9wY2kuaA0KPj4+PiBAQCAtMzg3
LDYgKzM4Nyw4IEBAIHZvaWQgcGNpX2RldmljZV9zYXZlKFBDSURldmljZSAqcywgUUVNVUZpbGUg
KmYpOw0KPj4+PiBpbnQgcGNpX2RldmljZV9sb2FkKFBDSURldmljZSAqcywgUUVNVUZpbGUgKmYp
Ow0KPj4+PiBNZW1vcnlSZWdpb24gKnBjaV9hZGRyZXNzX3NwYWNlKFBDSURldmljZSAqZGV2KTsN
Cj4+Pj4gTWVtb3J5UmVnaW9uICpwY2lfYWRkcmVzc19zcGFjZV9pbyhQQ0lEZXZpY2UgKmRldik7
DQo+Pj4+ICtBZGRyZXNzU3BhY2UgKnBjaV9pc29sX2FzX21lbShQQ0lEZXZpY2UgKmRldik7DQo+
Pj4+ICtBZGRyZXNzU3BhY2UgKnBjaV9pc29sX2FzX2lvKFBDSURldmljZSAqZGV2KTsNCj4+Pj4g
DQo+Pj4+IC8qDQo+Pj4+ICogU2hvdWxkIG5vdCBub3JtYWxseSBiZSB1c2VkIGJ5IGRldmljZXMu
IEZvciB1c2UgYnkgc1BBUFIgdGFyZ2V0DQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3Bj
aS9wY2lfYnVzLmggYi9pbmNsdWRlL2h3L3BjaS9wY2lfYnVzLmgNCj4+Pj4gaW5kZXggMzQ3NDQw
ZDQyYy4uZDc4MjU4ZTc5ZSAxMDA2NDQNCj4+Pj4gLS0tIGEvaW5jbHVkZS9ody9wY2kvcGNpX2J1
cy5oDQo+Pj4+ICsrKyBiL2luY2x1ZGUvaHcvcGNpL3BjaV9idXMuaA0KPj4+PiBAQCAtMzksOSAr
MzksMjYgQEAgc3RydWN0IFBDSUJ1cyB7DQo+Pj4+ICAgIHZvaWQgKmlycV9vcGFxdWU7DQo+Pj4+
ICAgIFBDSURldmljZSAqZGV2aWNlc1tQQ0lfU0xPVF9NQVggKiBQQ0lfRlVOQ19NQVhdOw0KPj4+
PiAgICBQQ0lEZXZpY2UgKnBhcmVudF9kZXY7DQo+Pj4+ICsNCj4+Pj4gICAgTWVtb3J5UmVnaW9u
ICphZGRyZXNzX3NwYWNlX21lbTsNCj4+Pj4gICAgTWVtb3J5UmVnaW9uICphZGRyZXNzX3NwYWNl
X2lvOw0KPj4+PiANCj4+Pj4gKyAgICAvKioNCj4+Pj4gKyAgICAgKiBJc29sYXRlZCBhZGRyZXNz
IHNwYWNlcyAtIHRoZXNlIGFsbG93IHRoZSBQQ0kgYnVzIHRvIGJlIHBhcnQNCj4+Pj4gKyAgICAg
KiBvZiBhbiBpc29sYXRlZCBhZGRyZXNzIHNwYWNlIGFzIG9wcG9zZWQgdG8gdGhlIGdsb2JhbA0K
Pj4+PiArICAgICAqIGFkZHJlc3Nfc3BhY2VfbWVtb3J5ICYgYWRkcmVzc19zcGFjZV9pby4NCj4+
PiANCj4+PiBBcmUgeW91IHN1cmUgYWRkcmVzc19zcGFjZV9tZW1vcnkgJiBhZGRyZXNzX3NwYWNl
X2lvIGFyZQ0KPj4+IGFsd2F5cyBnbG9iYWw/IGV2ZW4gaW4gdGhlIGNhc2Ugb2YgYW4gaW9tbXU/
DQo+PiANCj4+IE9uIHRoZSBDUFUgc2lkZSBvZiB0aGUgUm9vdCBDb21wbGV4LCBJIGJlbGlldmUg
YWRkcmVzc19zcGFjZV9tZW1vcnkNCj4+ICYgYWRkcmVzc19zcGFjZV9pbyBhcmUgZ2xvYmFsLg0K
Pj4gDQo+PiBJbiB0aGUgdmZpby11c2VyIGNhc2UsIGRldmljZXMgb24gdGhlIHNhbWUgbWFjaGlu
ZSAoVFlQRV9SRU1PVEVfTUFDSElORSkNCj4+IGNvdWxkIGJlIGF0dGFjaGVkIHRvIGRpZmZlcmVu
dCBjbGllbnRzIFZNcy4gRWFjaCBjbGllbnQgd291bGQgaGF2ZSB0aGVpciBvd24gYWRkcmVzcw0K
Pj4gc3BhY2UgZm9yIHRoZWlyIENQVXMuIFdpdGggaXNvbGF0ZWQgYWRkcmVzcyBzcGFjZXMsIHdl
IGVuc3VyZSB0aGF0IHRoZSBkZXZpY2VzDQo+PiBzZWUgdGhlIGFkZHJlc3Mgc3BhY2Ugb2YgdGhl
IENQVXMgdGhleeKAmXJlIGF0dGFjaGVkIHRvLg0KPj4gDQo+PiBOb3Qgc3VyZSBpZiBpdOKAmXMg
T0sgdG8gc2hhcmUgd2VibGlua3MgaW4gdGhpcyBtYWlsaW5nIGxpc3QsIHBsZWFzZSBsZXQgbWUg
a25vdyBpZiB0aGF04oCZcw0KPj4gbm90IHByZWZlcnJlZC4gQnV0IEnigJltIHJlZmVycmluZyB0
byB0aGUgdGVybWlub2xvZ3kgdXNlZCBpbiB0aGUgZm9sbG93aW5nIGJsb2NrIGRpYWdyYW06DQo+
PiBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9Sb290X2NvbXBsZXgjL21lZGlhL0ZpbGU6
RXhhbXBsZV9QQ0lfRXhwcmVzc19Ub3BvbG9neS5zdmcNCj4+IA0KPj4+IA0KPj4+PiBUaGlzIGFs
bG93cyB0aGUNCj4+Pj4gKyAgICAgKiBidXMgdG8gYmUgYXR0YWNoZWQgdG8gQ1BVcyBmcm9tIGRp
ZmZlcmVudCBtYWNoaW5lcy4gVGhlDQo+Pj4+ICsgICAgICogZm9sbG93aW5nIGlzIG5vdCB1c2Vk
IHVzZWQgY29tbW9ubHkuDQo+Pj4+ICsgICAgICoNCj4+Pj4gKyAgICAgKiBUWVBFX1JFTU9URV9N
QUNISU5FIGFsbG93cyBlbXVsYXRpbmcgZGV2aWNlcyBmcm9tIG11bHRpcGxlDQo+Pj4+ICsgICAg
ICogVk0gY2xpZW50cywNCj4+PiANCj4+PiB3aGF0IGFyZSBWTSBjbGllbnRzPw0KPj4gDQo+PiBJ
dOKAmXMgdGhlIGNsaWVudCBpbiB0aGUgY2xpZW50IC0gc2VydmVyIG1vZGVsIGV4cGxhaW5lZCBh
Ym92ZS4NCj4+IA0KPj4gVGhhbmsgeW91IQ0KPj4gLS0NCj4+IEphZw0KPj4gDQo+Pj4gDQo+Pj4+
IGFzIHN1Y2ggaXQgbmVlZHMgdGhlIFBDSSBidXNlcyBpbiB0aGUgc2FtZSBtYWNoaW5lDQo+Pj4+
ICsgICAgICogdG8gYmUgcGFydCBvZiBkaWZmZXJlbnQgQ1BVIGFkZHJlc3Mgc3BhY2VzLiBUaGUg
Zm9sbG93aW5nIGlzDQo+Pj4+ICsgICAgICogdXNlZnVsIGluIHRoYXQgc2NlbmFyaW8uDQo+Pj4+
ICsgICAgICoNCj4+Pj4gKyAgICAgKi8NCj4+Pj4gKyAgICBBZGRyZXNzU3BhY2UgKmlzb2xfYXNf
bWVtOw0KPj4+PiArICAgIEFkZHJlc3NTcGFjZSAqaXNvbF9hc19pbzsNCj4+Pj4gKw0KPj4+PiAg
ICBRTElTVF9IRUFEKCwgUENJQnVzKSBjaGlsZDsgLyogdGhpcyB3aWxsIGJlIHJlcGxhY2VkIGJ5
IHFkZXYgbGF0ZXIgKi8NCj4+Pj4gICAgUUxJU1RfRU5UUlkoUENJQnVzKSBzaWJsaW5nOy8qIHRo
aXMgd2lsbCBiZSByZXBsYWNlZCBieSBxZGV2IGxhdGVyICovDQo+Pj4+IA0KPj4+PiBkaWZmIC0t
Z2l0IGEvaHcvcGNpL3BjaS5jIGIvaHcvcGNpL3BjaS5jDQo+Pj4+IGluZGV4IDVkMzBmOWNhNjAu
LmQ1ZjFjNmM0MjEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2h3L3BjaS9wY2kuYw0KPj4+PiArKysgYi9o
dy9wY2kvcGNpLmMNCj4+Pj4gQEAgLTQ0Miw2ICs0NDIsOCBAQCBzdGF0aWMgdm9pZCBwY2lfcm9v
dF9idXNfaW50ZXJuYWxfaW5pdChQQ0lCdXMgKmJ1cywgRGV2aWNlU3RhdGUgKnBhcmVudCwNCj4+
Pj4gICAgYnVzLT5zbG90X3Jlc2VydmVkX21hc2sgPSAweDA7DQo+Pj4+ICAgIGJ1cy0+YWRkcmVz
c19zcGFjZV9tZW0gPSBhZGRyZXNzX3NwYWNlX21lbTsNCj4+Pj4gICAgYnVzLT5hZGRyZXNzX3Nw
YWNlX2lvID0gYWRkcmVzc19zcGFjZV9pbzsNCj4+Pj4gKyAgICBidXMtPmlzb2xfYXNfbWVtID0g
TlVMTDsNCj4+Pj4gKyAgICBidXMtPmlzb2xfYXNfaW8gPSBOVUxMOw0KPj4+PiAgICBidXMtPmZs
YWdzIHw9IFBDSV9CVVNfSVNfUk9PVDsNCj4+Pj4gDQo+Pj4+ICAgIC8qIGhvc3QgYnJpZGdlICov
DQo+Pj4+IEBAIC0yNjc2LDYgKzI2NzgsMTYgQEAgTWVtb3J5UmVnaW9uICpwY2lfYWRkcmVzc19z
cGFjZV9pbyhQQ0lEZXZpY2UgKmRldikNCj4+Pj4gICAgcmV0dXJuIHBjaV9nZXRfYnVzKGRldikt
PmFkZHJlc3Nfc3BhY2VfaW87DQo+Pj4+IH0NCj4+Pj4gDQo+Pj4+ICtBZGRyZXNzU3BhY2UgKnBj
aV9pc29sX2FzX21lbShQQ0lEZXZpY2UgKmRldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICByZXR1cm4g
cGNpX2dldF9idXMoZGV2KS0+aXNvbF9hc19tZW07DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gK0Fk
ZHJlc3NTcGFjZSAqcGNpX2lzb2xfYXNfaW8oUENJRGV2aWNlICpkZXYpDQo+Pj4+ICt7DQo+Pj4+
ICsgICAgcmV0dXJuIHBjaV9nZXRfYnVzKGRldiktPmlzb2xfYXNfaW87DQo+Pj4+ICt9DQo+Pj4+
ICsNCj4+Pj4gc3RhdGljIHZvaWQgcGNpX2RldmljZV9jbGFzc19pbml0KE9iamVjdENsYXNzICpr
bGFzcywgdm9pZCAqZGF0YSkNCj4+Pj4gew0KPj4+PiAgICBEZXZpY2VDbGFzcyAqayA9IERFVklD
RV9DTEFTUyhrbGFzcyk7DQo+Pj4+IEBAIC0yNjk5LDYgKzI3MTEsNyBAQCBzdGF0aWMgdm9pZCBw
Y2lfZGV2aWNlX2NsYXNzX2Jhc2VfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQgKmRhdGEp
DQo+Pj4+IA0KPj4+PiBBZGRyZXNzU3BhY2UgKnBjaV9kZXZpY2VfaW9tbXVfYWRkcmVzc19zcGFj
ZShQQ0lEZXZpY2UgKmRldikNCj4+Pj4gew0KPj4+PiArICAgIEFkZHJlc3NTcGFjZSAqaW9tbXVf
YXMgPSBOVUxMOw0KPj4+PiAgICBQQ0lCdXMgKmJ1cyA9IHBjaV9nZXRfYnVzKGRldik7DQo+Pj4+
ICAgIFBDSUJ1cyAqaW9tbXVfYnVzID0gYnVzOw0KPj4+PiAgICB1aW50OF90IGRldmZuID0gZGV2
LT5kZXZmbjsNCj4+Pj4gQEAgLTI3NDUsNiArMjc1OCwxMCBAQCBBZGRyZXNzU3BhY2UgKnBjaV9k
ZXZpY2VfaW9tbXVfYWRkcmVzc19zcGFjZShQQ0lEZXZpY2UgKmRldikNCj4+Pj4gICAgaWYgKCFw
Y2lfYnVzX2J5cGFzc19pb21tdShidXMpICYmIGlvbW11X2J1cyAmJiBpb21tdV9idXMtPmlvbW11
X2ZuKSB7DQo+Pj4+ICAgICAgICByZXR1cm4gaW9tbXVfYnVzLT5pb21tdV9mbihidXMsIGlvbW11
X2J1cy0+aW9tbXVfb3BhcXVlLCBkZXZmbik7DQo+Pj4+ICAgIH0NCj4+Pj4gKyAgICBpb21tdV9h
cyA9IHBjaV9pc29sX2FzX21lbShkZXYpOw0KPj4+PiArICAgIGlmIChpb21tdV9hcykgew0KPj4+
PiArICAgICAgICByZXR1cm4gaW9tbXVfYXM7DQo+Pj4+ICsgICAgfQ0KPj4+PiAgICByZXR1cm4g
JmFkZHJlc3Nfc3BhY2VfbWVtb3J5Ow0KPj4+PiB9DQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEv
aHcvcGNpL3BjaV9icmlkZ2UuYyBiL2h3L3BjaS9wY2lfYnJpZGdlLmMNCj4+Pj4gaW5kZXggZGEz
NGM4ZWJjZC4uOTgzNjY3NjhkMiAxMDA2NDQNCj4+Pj4gLS0tIGEvaHcvcGNpL3BjaV9icmlkZ2Uu
Yw0KPj4+PiArKysgYi9ody9wY2kvcGNpX2JyaWRnZS5jDQo+Pj4+IEBAIC0zODMsNiArMzgzLDEx
IEBAIHZvaWQgcGNpX2JyaWRnZV9pbml0Zm4oUENJRGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKnR5
cGVuYW1lKQ0KPj4+PiAgICBzZWNfYnVzLT5hZGRyZXNzX3NwYWNlX2lvID0gJmJyLT5hZGRyZXNz
X3NwYWNlX2lvOw0KPj4+PiAgICBtZW1vcnlfcmVnaW9uX2luaXQoJmJyLT5hZGRyZXNzX3NwYWNl
X2lvLCBPQkpFQ1QoYnIpLCAicGNpX2JyaWRnZV9pbyIsDQo+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICA0ICogR2lCKTsNCj4+Pj4gKw0KPj4+PiArICAgIC8qIFRoaXMgUENJIGJyaWRnZSBwdXRz
IHRoZSBzZWNfYnVzIGluIGl0cyBwYXJlbnQncyBhZGRyZXNzIHNwYWNlICovDQo+Pj4+ICsgICAg
c2VjX2J1cy0+aXNvbF9hc19tZW0gPSBwY2lfaXNvbF9hc19tZW0oZGV2KTsNCj4+Pj4gKyAgICBz
ZWNfYnVzLT5pc29sX2FzX2lvID0gcGNpX2lzb2xfYXNfaW8oZGV2KTsNCj4+Pj4gKw0KPj4+PiAg
ICBici0+d2luZG93cyA9IHBjaV9icmlkZ2VfcmVnaW9uX2luaXQoYnIpOw0KPj4+PiAgICBRTElT
VF9JTklUKCZzZWNfYnVzLT5jaGlsZCk7DQo+Pj4+ICAgIFFMSVNUX0lOU0VSVF9IRUFEKCZwYXJl
bnQtPmNoaWxkLCBzZWNfYnVzLCBzaWJsaW5nKTsNCj4+Pj4gLS0gDQo+Pj4+IDIuMjAuMQ0KPj4g
DQo+IC0tIA0KPiBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IC8gZGdpbGJlcnRAcmVkaGF0LmNvbSAv
IE1hbmNoZXN0ZXIsIFVLDQo+IA0KDQo=


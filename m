Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6713B16EE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:31:58 +0200 (CEST)
Received: from localhost ([::1]:59318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzEj-000078-Fz
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvzDd-0007jG-2h
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:30:49 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvzDZ-0006HD-M5
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:30:48 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N9BoQf020314; Wed, 23 Jun 2021 09:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=T5/KkwMqenjT3Djm7oOdw6uPcKdj1tll70rnSmLKUJ0=;
 b=bNBjuBtXDwWwg1V3/HNttuXi+kujD4xpqkYkmHTPID6XSbXhaa2FFkiB7JESnex5/VS1
 x3sYLpotZmRvuA9rb4q1+00IhipTVc+TligIlIcGwrMTNZMnrOTiKIMSEUVB2kzPSz8A
 n/L6lv14GSNY/8qPxByQUVRDzhyKlIA9Nhj9ET5h4jhagGNAUArV08ugerc3N4M1rqok
 8hj4xOtNRzBiSpTcD3sISD9EbvA9sdS2b0VtFFMZ4Mbkk1o3hSsadS3BQ0ep/6lCvqrm
 bxqdGGaTPmxtafuKcd4DvHy2N12u54nNArkUxaJuGs123jlhTDh3YRs55oDcWgF+vGXu wQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39byjygdku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:30:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15N9FuiI021152;
 Wed, 23 Jun 2021 09:30:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by userp3020.oracle.com with ESMTP id 399tbu8enh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:30:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ogxo5x7S1vP1oWEHcd0Wq0QY5nUnrVhVBRPQ/IGYK5J9Szpxs0+U434xbJTodaQ+dBKFdPTZ9TNqQrzFunKudwKz0vHZzCQLqO8UJwyhlmeZUoas5J5ae2Pr913YoJDhIOnB4Pv9Xo0cMxNLwP+eXDRdxdbXdxSVKw3bjTRJr+Dv/dKg41TCkJSzPwPXtafwjSkVGUNPjjCceRhUXq2p7GPe0Sh2ZCij5/JPsnFcR4I8vTAyPtFdgv3DCpvuULtrcq5AZkqXvEPZ65QMHww9I6A9C2BpRNpxK99CFaLpED67f+XURh6Zte7Iv6ZnP7ZFIsEFPjmuJOlEBBNp0RP2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5/KkwMqenjT3Djm7oOdw6uPcKdj1tll70rnSmLKUJ0=;
 b=g4v5QfjYExPuZgnvho0/Upa5qpXgiKwEi/baWeZnGYZPG5punQ7QutjcGLtzW/MlH1gwJDhZOgzT0xjFbnHlHcisGx3MczCtJewlBKaIxFR9xGpVLoclHDkiBrHIaqduh+9XYxmNiZzEdHgbX7xF/5zDQlgbcV2qeqHuQiZezdWaiMANn08LiuD/3AAQEipA5HNoBTFKoHUGLaM7QbmnvlDrZKoh1OlzChDCBF36+PaasFtPjkGEK9xwiYHKk5GU/2hPpSrLAjRayEDHrATRCQ2yIMyanQecbKgrX4ykeIdoZIzbZFJU8a/7UF/lAF2bozRS4fiwZdr7FdLaXCiIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5/KkwMqenjT3Djm7oOdw6uPcKdj1tll70rnSmLKUJ0=;
 b=0VRWs6OU85BKV+wswPjY+06C1B6+HyQouiG3byyWFdkYw0DT/rkkbf/3IVtdAqc5ZZmBOhrBUWBVIaGHTawgV3G40I5BrFc62lh8ZvR343rLVRi4ASTYNo+tPW7hXTfnnFLQXfjIYlZ4b6camIj+7nbz6HXiVPJs5Lqu4ORANwY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5139.namprd10.prod.outlook.com (2603:10b6:208:307::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 23 Jun
 2021 09:30:36 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.018; Wed, 23 Jun 2021
 09:30:36 +0000
Subject: Re: [PATCH RFC 0/6] i386/pc: Fix creation of >= 1Tb guests on AMD
 systems with IOMMU
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622151629.6c75427c.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <23cff9d2-cc9b-07ba-1c21-9798854e14d9@oracle.com>
Date: Wed, 23 Jun 2021 10:30:29 +0100
In-Reply-To: <20210622151629.6c75427c.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LO2P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 LO2P265CA0056.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21 via Frontend Transport; Wed, 23 Jun 2021 09:30:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4d89009-a11f-4cac-39e0-08d936298e06
X-MS-TrafficTypeDiagnostic: BLAPR10MB5139:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB513920A54C78F9FD2C8171E8BB089@BLAPR10MB5139.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G85LuznVhmKm5G1HMGS7kO+0bWOxxl8SFRmspYRgk/+5p5YFE5YJCHY/vCvYxhpK6/K9PhlGZre4ard2IdGZYpdXkeTz7FmK3PU8XyHvdoSzrLaxTYiI+vYDnS++AHwA87Wwpj6XFk59fkn6M6i0e7KJbe24TDVb6mv5nM8kvRS+9HF0dl5DQV8A2ywPIVeIE+1HDcamqa3GG8n54s3oEuRhJf3BDHjrOtxJBjWeGmXwHaTUDz4vM/Lx+3EzIUd+m4oQtd/YLoDuNJ1mAsotLwmRAvZdMGlG9QmLcAvlrdXKpdgTOh/GL7xS69+ZHiW6pTGNcC0ofA4dYweBjRGsrlWCct+4xBo7n3rdlJVVQVU1GaZG8J6fl1tTnWYrAQ36F/YEQQRUa8/O/u9nZfNVCkkaiO53rWtF69gZTnvK1iVfG5RFEXkSG3dWbCAkZTnxCz/KVc5cmgZGwXNr0hoBgh4NaAqjmV0YPHT2BgUgF58OzKiFmmDuv9cQEoMv0pqN8HvIQ5G2+X531FVvDohiC2v1lH7pUaMefz95sYLaSKsmfMShlh9O2OFt0dqAonrUgOp7eTbaQalf7ckFgghZzTrJm7G6QiA1oKjrUKHT3F07MXX6SC28r9hRdi2xZ9U1/lX3p/QQ2LRtlbTrbgLESv7MD5+VTi2bujrhXrs1kUyI2JAt/g6ci3Xwoj7Oss+1jpgaD4WOyTWVWx97pfX7FLulDjYnOxbM3hogrRnOMGjmCFeCGXNzsH5tEC1l+TI25etJtPSfXW3/YgScfo710CdRLkCSy65LZoWMGOniE7dPR2v+6FAWay+/69/3sjoI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(366004)(346002)(956004)(86362001)(6666004)(54906003)(31696002)(31686004)(6916009)(16576012)(8676002)(316002)(5660300002)(4326008)(2616005)(36756003)(2906002)(16526019)(966005)(8936002)(478600001)(53546011)(66946007)(26005)(66556008)(66476007)(186003)(83380400001)(38100700002)(6486002)(43620500001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZEZjlFVXpxVEtIcFdOWEZrRHREYnJaSnArVGllQXI0TXRLYlo2Z3E1eUsr?=
 =?utf-8?B?azliclllRk1XdUpScThHang1OWZibERNbU1YeS9MKzgxQkVQN1dkSVpvWlQ3?=
 =?utf-8?B?NkdGQ2ttNjhWUmtnWlhnVVNablp6MmdkVHVqMUFrUXFydWFHcEdCdGZEd1NK?=
 =?utf-8?B?Q1RhUnZjWjN0d0plSkc4VGN3Y1JCYSt3elhyOFZ4L0tuNXBQUFN0N0JlcytP?=
 =?utf-8?B?ZktIc0hBSjZpdEdETS9lVHkvNTE5SWEwR0wxS0Y0ZXNGL05pNnZjcmJ3Q1JJ?=
 =?utf-8?B?VVZOSmR5ZXlCTFIwakJlL21uRXBaUUJDMGE3QTVnNmIwaWMzNHhoSmh4aGFC?=
 =?utf-8?B?Q0VyLzYwN0F2bjE1SHBMNTJqMW1oNk5sN1lQNkdnanF1OWU5dTNNT0RDYy9H?=
 =?utf-8?B?bU5hSE9DRTM0enJxdGJJMGNta2F6SmZLMlovOFRSQ0hvZGhYdWh4WHlnWmMv?=
 =?utf-8?B?U0xnZ3R6SEY3b3liM1V3RkhQWlZoTXRWemxqNzlZalo4d3ZUTVZYRDVWektL?=
 =?utf-8?B?aEdtZnRveDNzK2FLRXZTVXNBVUZGc1NFdmRBeGIwQ3BrWjJXNm0rS0d3Rita?=
 =?utf-8?B?N3AzenBiUHFzd2tHTGFJRThzWjh3R0p2bHU2RVVCUjhuWU5uNTBXUzJpN0ZY?=
 =?utf-8?B?c0FuSlAzTkpjMnM1amQ4RHFHa29jVCtwRzJPbzMySk1XUTk1U2IweEZzYnlJ?=
 =?utf-8?B?emh4R3ZaWVdXTkhVdllURkZ3d0h3RmZWMFRrRXp6RWVoelp5M29iemI2SGVq?=
 =?utf-8?B?bVNPc1JKYXNqTG1TQ1R1QXZ5QkkvNEsxajBFamVyenZjK2NXc0crTkUrRm0r?=
 =?utf-8?B?SHVtdEJtVTc1MWxCdWN4eEZpUi9Ga2hOWkVPR3BENHgvRHVmclNBU1JUMWQ2?=
 =?utf-8?B?VHpLYnBnNmYwUVRLMGs3TEZQWFo0QlBnYUdEVHQ3WStpSUlvN2R1b3p2UnpV?=
 =?utf-8?B?MStla1BhMkp0ek9VTnpMZnB1TE9rVjJoVUgzNUVjVmVtcGZ1c21JLzJIaUxs?=
 =?utf-8?B?UW04SHRydU8xTmdOdXhpa0RkWnB4ZWE1NkRpTmNERjBwMVNuTER4alpXVlNk?=
 =?utf-8?B?dzBKRjFGOUZIcTVkenVGR3VmazljVlN2WFA5VFJQK2F2YUswMy9YNjR5VnVo?=
 =?utf-8?B?NzJGQmFZWWNIWlFscFBielFpdkxJYzFaeTlPSnRCL2dVcVVRMXpzQ25SeE15?=
 =?utf-8?B?bFBRVlp5ckY3R1FTRXlSSWhQdVByaWUrT0RjeDBHYnByUm9Fb2ZHejgvN2h0?=
 =?utf-8?B?dTV0dXBFUHpTWDhNQWZZWEg2dkRYRS8yREx5TjdiUjNyM2I3b1pjMDJsK1dk?=
 =?utf-8?B?NDBiTkZnWjd4TVFhTnJ3WkdvVFIvbnFmUDlqK0owcGdYeDh5UWlHa0c4UkpW?=
 =?utf-8?B?Tk9Xd2taRzRaeFV0czY2M1Btc2Vxc1d6RzFMR0JxdklCK01EUFZUbE5mZmho?=
 =?utf-8?B?c0FnaXhKaEt4bGducGxISTNDbzdsdDVDTFAzcjlKM0E5bnpJVk1xeUFva1Ey?=
 =?utf-8?B?bmNYWmJsUXQwcEoxREVPbjJ1OVoyZFU0WVAvRHRtbVltdHpHVFZvd2ZpeGMw?=
 =?utf-8?B?OGZuTUtRQmFpcmc3d2hUT3FYWHdQbXY1MWJHUjN1U1lybDBVVGMrZDdnRUZm?=
 =?utf-8?B?L0VCVVVuR1o5VEppbUlZc3EwN29YWERucDAzRUY0aXVXWU1GMFBHdENZbDFj?=
 =?utf-8?B?WWpxcEdVZWdDVGIrbXZFeC9IbjloRndmeXZXV1gwUXJuWHBjbGlZam8vR3Iy?=
 =?utf-8?Q?xzsj+C+LdPI9VUtW3M99B5cxxrEx59r6su+xeoQ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d89009-a11f-4cac-39e0-08d936298e06
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 09:30:36.0907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsV8yu0drTbqvT/7+LG3Sj7ofr1Vg8RU8XrPzdIuZvqzQmIV49WnlRaaEVQ9AeUEjnbmsOvgaVtQGzwoAamJk5GN11Q/VAvTOrqg9+7gkvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5139
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230055
X-Proofpoint-GUID: _LoyIaALWWVy_vYnwJDP5lBYLep-_JEy
X-Proofpoint-ORIG-GUID: _LoyIaALWWVy_vYnwJDP5lBYLep-_JEy
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
 Auger Eric <eric.auger@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 10:16 PM, Alex Williamson wrote:
> On Tue, 22 Jun 2021 16:48:59 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Hey,
>>
>> This series lets Qemu properly spawn i386 guests with >= 1Tb with VFIO, particularly
>> when running on AMD systems with an IOMMU.
>>
>> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
>> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
>> affected by this extra validation. But AMD systems with IOMMU have a hole in
>> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
>> here  FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
>> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
>>
>> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
>>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
>> of the failure:
>>
>> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
>> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
>> 	failed to setup container for group 258: memory listener initialization failed:
>> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
>>
>> Prior to v5.4, we could map using these IOVAs *but* that's still not the right thing
>> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
>> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
>> as documented on the links down below.
>>
>> This series tries to address that by dealing with this AMD-specific 1Tb hole,
>> similarly to how we deal with the 4G hole today in x86 in general. It is splitted
>> as following:
>>
>> * patch 1: initialize the valid IOVA ranges above 4G, adding an iterator
>>            which gets used too in other parts of pc/acpi besides MR creation. The
>> 	   allowed IOVA *only* changes if it's an AMD host, so no change for
>> 	   Intel. We walk the allowed ranges for memory above 4G, and
>> 	   add a E820_RESERVED type everytime we find a hole (which is at the
>> 	   1TB boundary).
>> 	   
>> 	   NOTE: For purposes of this RFC, I rely on cpuid in hw/i386/pc.c but I
>> 	   understand that it doesn't cover the non-x86 host case running TCG.
>>
>> 	   Additionally, an alternative to hardcoded ranges as we do today,
>> 	   VFIO could advertise the platform valid IOVA ranges without necessarily
>> 	   requiring to have a PCI device added in the vfio container. That would
>> 	   fetching the valid IOVA ranges from VFIO, rather than hardcoded IOVA
>> 	   ranges as we do today. But sadly, wouldn't work for older hypervisors.
> 
> 
> $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u
> 0x00000000fee00000 0x00000000feefffff msi
> 0x000000fd00000000 0x000000ffffffffff reserved
> 
Yeap, I am aware.

The VFIO advertising extension was just because we already advertise the above info,
although behind a non-empty vfio container e.g. we seem to use that for example in
collect_usable_iova_ranges().

> Ideally we might take that into account on all hosts, but of course
> then we run into massive compatibility issues when we consider
> migration.  We run into similar problems when people try to assign
> devices to non-x86 TCG hosts, where the arch doesn't have a natural
> memory hole overlapping the msi range.
> 
> The issue here is similar to trying to find a set of supported CPU
> flags across hosts, QEMU only has visibility to the host where it runs,
> an upper level tool needs to be able to pass through information about
> compatibility to all possible migration targets.

I agree with your generic sentiment (and idea) but are we sure this is really something as
dynamic/needing-denominator like CPU Features? The memory map looks to be deeply embedded
in the devices (ARM) or machine model (x86) that we pass in and doesn't change very often.
pc/q35 is one very good example, because this hasn't changed since it's inception [a
decade?] (and this limitation is there only for any multi-socket AMD machine with IOMMU
with more than 1Tb). Additionally, there might be architectural impositions like on x86
e.g. CMOS seems to tie in with memory above certain boundaries. Unless by a migration
targets, you mean to also cover you migrate between Intel and AMD hosts (which may need to
keep the reserved range nonetheless in the common denominator)

> Towards that end, we
> should probably have command line options that either allow to specify
> specific usable or reserved GPA address ranges.  For example something
> like:
> 	--reserved-mem-ranges=host
> 
> Or explicitly:
> 
> 	--reserved-mem-ranges=13G@1010G,1M@4078M
> 
I like the added option, particularly because it lets everyone workaround similar issues.
I remember a series before that had similar issues on ARM (but can't remember now what it
was).

>> * patch 2 - 5: cover the remaining parts of the surrounding the mem map, particularly
>> 	       ACPI SRAT ranges, CMOS, hotplug as well as the PCI 64-bit hole.
>>
>> * patch 6: Add a machine property which is disabled for older machine types (<=6.0)
>> 	   to keep things as is.
>>
>> The 'consequence' of this approach is that we may need more than the default
>> phys-bits e.g. a guest with 1024G, will have ~13G be put after the 1TB
>> address, consequently needing 41 phys-bits as opposed to the default of 40.
>> I can't figure a reasonable way to establish the required phys-bits we
>> need for the memory map in a dynamic way, especially considering that
>> today there's already a precedent to depend on the user to pick the right value
>> of phys-bits (regardless of this series).
>>
>> Additionally, the reserved region is always added regardless of whether we have
>> VFIO devices to cover the VFIO device hotplug case.
> 
> Various migration issues as you note later in the series.
> 
/me nods

>> Other options considered:
>>
>> a) Consider the reserved range part of RAM, and just marking it as
>> E820_RESERVED without SPA allocated for it. So a -m 1024G guest would
>> only allocate 1010G of RAM and the remaining would be marked reserved.
>> This is not how what we do today for the 4G hole i.e. the RAM
>> actually allocated is the value specified by the user and thus RAM available
>> to the guest (IIUC).
>>
>> b) Avoid VFIO DMA_MAP ioctl() calls to the reserved range. Similar to a) but done at a
>> later stage when RAM mrs are already allocated at the invalid GPAs. Albeit that
>> alone wouldn't fix the way MRs are laid out which is where fundamentally the
>> problem is.
> 
> Data corruption with b) should the guest ever use memory within this
> range as a DMA target.  Thanks,
> 
Yeap.

> Alex
>  
>> The proposed approach in this series works regardless of the kernel, and
>> relevant for old and new Qemu.
>>
>> Open to alternatives/comments/suggestions that I should pursue instead.
>>
>> 	Joao
>>
>> [1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
>> [2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
>>
>> Joao Martins (6):
>>   i386/pc: Account IOVA reserved ranges above 4G boundary
>>   i386/pc: Round up the hotpluggable memory within valid IOVA ranges
>>   pc/cmos: Adjust CMOS above 4G memory size according to 1Tb boundary
>>   i386/pc: Keep PCI 64-bit hole within usable IOVA space
>>   i386/acpi: Fix SRAT ranges in accordance to usable IOVA
>>   i386/pc: Add a machine property for AMD-only enforcing of valid IOVAs
>>
>>  hw/i386/acpi-build.c  |  22 ++++-
>>  hw/i386/pc.c          | 206 +++++++++++++++++++++++++++++++++++++++---
>>  hw/i386/pc_piix.c     |   2 +
>>  hw/i386/pc_q35.c      |   2 +
>>  hw/pci-host/i440fx.c  |   4 +-
>>  hw/pci-host/q35.c     |   4 +-
>>  include/hw/i386/pc.h  |  62 ++++++++++++-
>>  include/hw/i386/x86.h |   4 +
>>  target/i386/cpu.h     |   3 +
>>  9 files changed, 288 insertions(+), 21 deletions(-)
>>
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C56AA635
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 01:24:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYFh7-0002Rc-KE; Fri, 03 Mar 2023 19:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYFh0-0002QV-1y
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 19:24:07 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYFgx-0003f4-9C
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 19:24:04 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323LXo0v023921; Sat, 4 Mar 2023 00:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=SxIfsqXJBjuHPixr98mRlGixjeCFhpEo/WXbNl/yApE=;
 b=DfaIA4D/T8ua3l8cHc2i9ZHDgHVb5TnWf2ZCM3klMZxQV4a5LMMNBVwDgAYSi2YA+oIP
 6P2sJAGK7Bqx4Phv4AaVfTTW2rbKI8ne1Qoqfkjc77o2hJ/oJKhTuD/nEtyK0jVC55EI
 1YK16sg3IdQDmbJZg2bg4adXZYIJ7KT/D+1cis6xf2h3z+ynHC5m3aSWqk44XKhIw+xk
 Iwls7X3/oPE1m/h4RGiP95bSNohufLvSad9TsCd71smE/NR7otr4tZLxa+qkUm02PxUQ
 ggNbsZ+kAMqnnAjJDzYjHBxvR6XRcU9F0Ja2rTc2RDjgeFsV7EYhXicvCjdVw4iWNjOw ZQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb72rfjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 00:24:00 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 323NtGUw033089; Sat, 4 Mar 2023 00:23:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sc6577-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 00:23:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3HRipz0MhrX5FEQV+dO+UveOpsfz6XHf0BD3tdH7yfe2TqqI+eBBzDrommygRuuaZTFP7n4nG/iOnWT/IcgQwHu7uMsd/bvozPVspqjZkHVOk9dc7Ju0H9bRdAztG08HwAPnT0WxrljGmBaAS9tcQUcRd3eZb5F2s/CTeEAK3zGGWTxrkQRy271Hinf/noFb1hTmHKHtrmT5EiuGpjkT3SGEd9tg15ZOvOBDF7oEIS2LBqxNL2sRNUGkr+qkGGOAJZShxjCnSJ7n/ltKBJGoXybhC0Im6oXvEpLYF1O5ZP2tJBXiwBp5o3uE5Iu6N1PlDna4apR5z0ARTcJjqOzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxIfsqXJBjuHPixr98mRlGixjeCFhpEo/WXbNl/yApE=;
 b=W7mzbv2uWUBfJBnNSwo09XhnLQwO4E8F8xQwNO9mnZzrad386DvXcQxyCTK2VVmzoLrmGFa1T04lILZQrlHXev2sTSjYp4WaIa0xxXSvc4UVUq7CsGQqpP45byR+pu3GqfO4jfjN9uT6KEbDpZ+JUgLootBQykmBPAEpIVNhPyV2+HwntpxhD/HWkZ9g8m2VQVJ9PkxgzrqX+GxkRPbw6xCie70fyo+riMo+vFWkMqSJ63WftanvhbjOxjMVYXo/UwF69GPhUFDpyYPEWuk07Lr/fzg7aJITDPhskWnDe9pHNQCBZ/ZGmQj015l/9bwXEvawOGiJxaMCIk/qFS2h3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxIfsqXJBjuHPixr98mRlGixjeCFhpEo/WXbNl/yApE=;
 b=wqntUXwxT0Wv0XaKWsUI9a/Xe/8MyCjZG6IrhQUhK+DTG6yUup7ha3FEcTE2R/SxqI8n/JSQ2HuYQYR4Wkng2oA/XF2zCZ9QJxfC3sAsKgX1zOLg4EeMh5dALU9H6o0ST25tyQFLusus5tmlo2pqWd8kKyModG7M+WFrnbDXeh8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MW4PR10MB5680.namprd10.prod.outlook.com (2603:10b6:303:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Sat, 4 Mar
 2023 00:23:55 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.022; Sat, 4 Mar 2023
 00:23:49 +0000
Message-ID: <83a7c91d-a156-cd7f-c655-8487234e68c1@oracle.com>
Date: Sat, 4 Mar 2023 00:23:41 +0000
Subject: Re: [PATCH v2 07/20] vfio/common: Add VFIOBitmap and (de)alloc
 functions
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
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
 <20230222174915.5647-8-avihaih@nvidia.com>
 <55b623e9-3f5a-1353-280c-e6012b5924e6@redhat.com>
 <8b8e68bb-7c22-e782-f2eb-4c423ae5d3b5@oracle.com>
 <306ae516-54cd-6b63-4bdc-6cac17148c62@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <306ae516-54cd-6b63-4bdc-6cac17148c62@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|MW4PR10MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f9857f-88b8-46ca-9cea-08db1c46b98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vn+8cqvdchGSBsNVbvJZ7iZuwA+KXRrfHXUBNLsIY4mQhbW91sgK5rmhnUrSfII2lol3ffN/CuohBLnV39u2BUokYz7DTgPXrikNto8pLQLg5URA2KC7dh+W0PsMwxGjOYfCqnM5DiMF+dkZg4w+revquuxNTZn4HCdk0su/znDSS//UUoTkCYB3XYyKHC0+754Ab7Li/JEa4jT6uZEo0TCBzE8wOI+u5x3YgXn1/tSTCky0wz+0a5JIkxnDFYMiZAEMTHo3T2BXAQuhi6w4gYNw9jHULV2BpYj20Avz5fFDidKfpgN+zs92RFj/07oJ1smp7aHeaeUfjyvskTf3IIqLMTsV8PRH/QK3mPSdMx6fF0tVbeu+n79q/mu2Y0Aip00hsS+YrspyemEJqFgsJwcujQdgRZMbAD92YJWMtf94YmyFekHBgFkIZ/4qj/KmFW22Jk+maa7H0a2ewmm9iuQPuhVo4i2S0mp28USuE7PNNyie4POgJ0AVzbHzEBgMBc806f7rKtakAxKahoyGWCX0QT5gHUIEoQOBqoFlh11EEhe5u4t73BUrXMPsm4fZWzUaAXTFTD20f5xW65h1KcFyb4KV0wNS0+I5qlUD5cpWTSoMR50jKh/MAckLqnZ9U5XVQEQh7Gedrz7d1VFo6d+XRwbJZTAvlYwc8tw1CCGcSvNbEM0EpxSZJFTCeVZXlDMr2SQEIhCKUrnZ2fsICQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199018)(38100700002)(31686004)(2906002)(110136005)(54906003)(66574015)(6486002)(8936002)(66899018)(316002)(86362001)(478600001)(7416002)(31696002)(5660300002)(36756003)(53546011)(6666004)(6506007)(41300700001)(4326008)(2616005)(186003)(8676002)(66946007)(66556008)(66476007)(83380400001)(6512007)(26005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0VlR1pvZVJoNG5GWTU3QnRpSDQxMTZUaVhrY0lXRDZIU2tPWTNUTE1ZRUlY?=
 =?utf-8?B?WmwwcThXOUZoMUUvMnYyZU83U2lWWjMySldxKzlXSWsyZVllSHdkcWNHODF0?=
 =?utf-8?B?QXVWSVVhSmZFdWIvd2k0cTgxdW1UT0t2TGN3UDVSVU1JWWc2L0Z1NW92UWNF?=
 =?utf-8?B?andZaXFMaXF1ekk0bm1iWFQ1RmcwbTdIeGdaU1BJZGFVL01aU2FqdnZKWGFE?=
 =?utf-8?B?MmhpRFdRelpYdFp1YW9qOEl1ZHIxWGJ4NUtUVzcyUmlBWnhiNHlHR2xwQjFG?=
 =?utf-8?B?d0trTVc2dklnMHFkS3NOOFZFSzZxYnZpMW9URkI1YUFyRGJoRGNRQUNtZGhC?=
 =?utf-8?B?WFYxRGs3TFlWL3crUUJpcDBVRGxTSWkyanIwNjhmVTc2TVpvY2x6MktvMWlh?=
 =?utf-8?B?V3Fpb0JaUS9YbzdwOGY2aWVIUnc4dW16K29OWW9yRCtzb21PaGt0ZmRQN002?=
 =?utf-8?B?Q00yRUUxT2JSbzJPTU43cVpTV2g3Y2J3endCdXJTR3Q0S1AxeTB5emhRY0E3?=
 =?utf-8?B?alJISTBLaWU2RzU3T3U4eGQ3Znoxc0QyNzgwNEdLRjRTdDdKVWIyVVFmV0Yy?=
 =?utf-8?B?VW1qeDVhUnNUa3NFOTg5Ti9xdUFrT0hpM3h0cExnZ3hGRC9UQkRONEljdEhN?=
 =?utf-8?B?bXpzRDV5STNGSlQrL1pMU2sySld3aXJpcDlUdjk1RUZIRVRKNmlHSmgvbjUz?=
 =?utf-8?B?d0crbktESFM3d0o5UklMRFhGNE5LcFRHYW43QW85ZnVDT0xoSXdjUnVndzVV?=
 =?utf-8?B?NDdZeXQ0akxDY2Z5c2hIU1hhcndJbTdpK3lWZmYwWXFERHUvQy9DN29pT2tT?=
 =?utf-8?B?amYrOVhRc2pWdlZjRnY0d0xGSUtiRVpTV25YYW1JWkZuTmJrVnZnblNUYzJq?=
 =?utf-8?B?YXVuam82SkttVHcxdXdhaDFKTmhNeWREdEpVTmhJQlhkRndONWZlZmhJcHd3?=
 =?utf-8?B?amx4WE1SaURwaW9sdUVNVE5ybGxYQy9pQjRtTUc2ZVBBQUNuczhnOGZmKzd4?=
 =?utf-8?B?KzJKeUw2ZjFsWGdUeHBVeW4zVGZKR1pBdlpjOHFrb01rYUhoL3puYUgvemxu?=
 =?utf-8?B?aHJJOHJZcHdTRzVmWDJCdGpkdHI4elR5VHFzbjBJMFRUaloxTEUxN3ZzWi9a?=
 =?utf-8?B?Uk1kRHJGT3JORjVGbHFsTjJackJNRVFKNXorSUdnTUpMUnJIOXB5aFdnbWdZ?=
 =?utf-8?B?YmpmV2dGWlRjT2FZRHNkbm1OakdYZENHclJBMnBPNkRrakhZNTVQa3IyNDBm?=
 =?utf-8?B?bFdNNkJIczZNNG14RDhCSHhhSWZod01FSlhGTG9UeDZHVjdsalhpdzZmd2c2?=
 =?utf-8?B?bklJSjhFbDlVNjlCZzZrbTBwUkdQTEkveFNzdXk3dFEvTHRJVVIwL1ZRQVZr?=
 =?utf-8?B?RVhMcUxSTWRBMUJTVGlWNmJoaDFGemdwZExyMUk4S01CM25oclZhLzZ6K3B4?=
 =?utf-8?B?UEg2Q0E1eFlNenJ6bnl5bEMwR3c5Y2ZMYzJCVmYxT1g2bGJ4TWFZMG0vSHpF?=
 =?utf-8?B?Y2pObmhOeFFNVVFFYkY2UFpKZFVNU0gyWkNDUE9ROTNZV1U3azhGS3FRWkQv?=
 =?utf-8?B?d0M0b1VNVDZPNGIyM05aR1FjWnRUa0tnWFh2VTRLOU9paDI1dEJDQlRkYVVj?=
 =?utf-8?B?VE5UWk1UdzFscEs1cTRiOFVwaTg1UzRLRWsxRVREdDZKd2d5Zkluemp6OWdT?=
 =?utf-8?B?ZGhCbEkxaWxNMlVPNTRqM2dmR3RzWjNtOXpTdkZYbnZvTEl1a3NxKzZQcVhH?=
 =?utf-8?B?RFJsdURLc3lYZUY4VVJQR0tFc2MxSGxLSTFlTTJxbHFQYm5PalNhVkx4ZEVM?=
 =?utf-8?B?MXZnL0lYcDRDWm5yUmF5RTNjVHRZeUlFa2k3Q1Z2SWlrR1Z5V0RmVkEram5E?=
 =?utf-8?B?OVNrLzU1UG5GRllYTHhYZmZoQ2dDa29IckRmMjZXQnQ4QnVmaWhldUFST3JT?=
 =?utf-8?B?RWtqMzlWK3k3ZEpQTFh1SmdVUTRva3d4eG8rUU82N1R5QjdicHpxWmVvSkth?=
 =?utf-8?B?MlN2SkpNbEFlNjFEU2M1dU85NnhaOHBWd0ZOQ04zYmx5M1EvTEYyajh4dTJO?=
 =?utf-8?B?NEdzVWZqRVNXWUNXa2U3VG9pMXVYTlZKajRSU0FobUlZSE16Ui9nL0Z2RE5R?=
 =?utf-8?B?MXlCK1FBTDBGYkhxcCtwSjkrY0xINk91U3M3QkNRY2VjVkl5dHRWMkswOVJB?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IAVcPvvR/q44OX/B6dt4m1R/VyuGeWDzJRgTkBqnCuoSRv6iKu/ux8dGa25q50qz/N+TOAX73Pp7PLmnuNh0o9PmzZAKJZvqXsra7FboZOPDlnp92b75Ug5/3vw85B15YnzuHbuE9Zx3VvYUTYUhMiNtUmsB96ETcYxkYuEWeGwgnSJbj4m3w6CquaRisdJpJ6X0spEbI5LjVqKGCEnwHAs5ui8kW8VwH+xvZ4cSBL+P8YT/s+rc+hnWooClJ/uLUNzYxeyz5tU6we3kF5CGwLVr9QIfsNKr9c+012nFhrrzYwYyl9RR1OPU53QvTQDe1qfX14uuEC+Qn08Ib8wnFx61D57cH7oD1ZQRWCEJnj/sUxFhE23NCNVJuno8sudeweH8TznVWvqi8M6fBbqxgmkqrTZnsRgLQHbaxNndeNzhEPgh/5MkVKHlVwbNXQrt2HT3RHBT/6IxTcDIcXX5908EJn2gxqXRYqTVRTfhTYT+40rF/kIgqDr7Mq3072BP/1hDdKCxdE2Sxs0YkbzYtRXw5ulCyOIz9nwJAtLASMKw65Hz0+XvEvrfZSyYlw1+5ahJMgEAKmxo+yUhW5V3i578Q2Icn4DidoTV3qPsS+znjwaRuxzIrBvpVhQuj6es1jaD7u6F4uGGnyd/vXEJS26m+mqcnrIIXrzPQDJ4NAb1RU91V6GBlL8PwlgGTmwMvJ7J3hp3nI9rAJw9Mu8/MZQytmO+HZTifc5tG3cmjSOcgeesgcdOMaw/MxTtZ0WVz7UUdd4vQD+1rvDdAHnvb36uliMOE6AG8hOZdLZngjGPFJLI+Ch1aOUR+mjW0dwO0JGxpVsZzlKCPPRmjK8+pl3pkIWECLu/xVm2FGpieHiI8umfSZ1y0pHYAhTt+UfW3DgljYxDTrYAbWAFKOHE1w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f9857f-88b8-46ca-9cea-08db1c46b98f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2023 00:23:49.2823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQgxUrV/0sSWmkxf3UYI9K88aC+5jKxR6NOI9sWsmewTya/Sc1QL4UAcPyGr99iqfMjhll19nIlwKtRHNo2IzUAjqogeur3TM3W0R+F8HhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_07,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303040000
X-Proofpoint-ORIG-GUID: j3imgOmw9N0bCC78ZVlwfCOa8qWHB7ns
X-Proofpoint-GUID: j3imgOmw9N0bCC78ZVlwfCOa8qWHB7ns
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

On 02/03/2023 14:52, Cédric Le Goater wrote:
> Hello Joao,
> 
> On 3/2/23 14:24, Joao Martins wrote:
>> On 27/02/2023 14:09, Cédric Le Goater wrote:
>>> On 2/22/23 18:49, Avihai Horon wrote:
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -320,6 +320,41 @@ const MemoryRegionOps vfio_region_ops = {
>>>>     * Device state interfaces
>>>>     */
>>>>    +typedef struct {
>>>> +    unsigned long *bitmap;
>>>> +    hwaddr size;
>>>> +    hwaddr pages;
>>>> +} VFIOBitmap;
>>>> +
>>>> +static VFIOBitmap *vfio_bitmap_alloc(hwaddr size)
>>>> +{
>>>> +    VFIOBitmap *vbmap = g_try_new0(VFIOBitmap, 1);
>>>
>>> I think using g_malloc0() for the VFIOBitmap should be fine. If QEMU can
>>> not allocate a couple of bytes, we are in trouble anyway.
>>>
>>
>> OOM situations are rather unpredictable, and switching to g_malloc0 means we
>> will exit ungracefully in the middle of fetching dirty bitmaps. And this
>> function (vfio_bitmap_alloc) overall will be allocating megabytes for terabyte
>> guests.
>>
>> It would be ok if we are initializing, but this is at runtime when we do
>> migration. I think we should stick with g_try_new0. exit on failure should be
>> reserved to failure to switch the kernel migration state whereby we are likely
>> to be dealing with a hardware failure and thus requires something more drastic.
> 
> I agree for large allocation :
> 
>     vbmap->bitmap = g_try_malloc0(vbmap->size);
> 
> but not for the smaller ones, like VFIOBitmap. You would have to
> convert some other g_malloc0() calls, like the one allocating 'unmap'
> in vfio_dma_unmap_bitmap(), to be consistent.
> 
> Given the size of VFIOBitmap, I think it could live on the stack in
> routine vfio_dma_unmap_bitmap() and routine vfio_get_dirty_bitmap()
> since the reference is not kept.
> 
> The 'vbmap' attribute of vfio_giommu_dirty_notifier does not need
> to be a pointer either.
> 
> vfio_bitmap_alloc(hwaddr size) could then become
> vfio_bitmap_init(VFIOBitmap *vbmap, hwaddr size).
> 
> Anyhow, this is minor. It would simplify a bit the exit path
> and error handling.
>

FWIW, I've addressed this on v3, following your suggestion.

	Joao


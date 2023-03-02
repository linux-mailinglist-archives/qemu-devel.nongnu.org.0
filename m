Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298396A8664
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlpq-0005uC-Kp; Thu, 02 Mar 2023 11:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXlpn-0005hL-A7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:31:11 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXlpg-0006Xy-BV
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:31:10 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322FCkIA005003; Thu, 2 Mar 2023 16:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=p+QqoPyChxhIkpq6Xy5jUCYHjE6phFlqgGGfJquSrUQ=;
 b=k5uGC+SqRZooURI8GuC6G8/C8kTEMvlYfI3229vHjzsQBxDERUp6Hmg/Mdsjr4aMN59q
 1UBvBBfJeU0Ht0iHuiGe1/g0UNi993sCjmcWE3TuXTL76/RCKDY0wzE9/Hk97ltoLUgP
 AjxM1XgXqYrIBaZyH8hBvMYjELLByjvQY8XZpFQr8KCQBhk+sEA8QZ+XiKPbMxJOitKR
 +WPKt5VqQ+1XGd//LcNOb2baeoowOywrLqv4UvCfl96thIwJMR3fx0+6vY7E9xz3iJBl
 IZcf3ObcwKQv45tK2huaW6aHXEskcVuzkw1eNkG9gBlKHwnB0z1HSt4dMl8jmMuwOjEv ow== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyba7m8y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 16:30:58 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 322FVhdm033104; Thu, 2 Mar 2023 16:30:57 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sa9dgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 16:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhUkW9scvFIaAYi56KGM3j4y2iWnXyUyP3bWcnFRWgvMCWIcXnn2EIq0dN6XqdoD8LRYdHatQSCcM54kaVtjwrODecrf7qQjJz3qhD/l9r6aU/qLxENJeC/0aLa7/GeL5l7EWGgbwC9bc51dkGtZKwP/UStpiODby9mzwUyiTymMt1rq3GjfgSB4eLsIZNmXQfea8uwvL12jg++OeB+QrI13uxx0j5BVzHl+mAKrFrcwC8PfnS3Y1C5GhYFDKyF5xnZk0koLBxBJLWOjkYCGKk4rOC7Ckqnesgwlv9s3jpSvsMwCnpcNf8t+tRJVOs7zCmRqUlVAap3ARDq9xiKmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+QqoPyChxhIkpq6Xy5jUCYHjE6phFlqgGGfJquSrUQ=;
 b=Ox1HfnZPQqo37Gdh27bA2rfZfLrEDJ6iayul8GFIWFSzdfzAQcpp62NUeGL4KKEHg78cLSboOoWZoTPD2ENxL1ygexUOpx4nQAEeN27coWQxnCb+hD/xo+ZnsEVrEl5odb8iLmHitx08n99CI7rb8evIvqByIUK/bFgzezzJ8kBQ5faa81ztOtlWBUTZFcDgrX2kRDb5+reGLvpEIuGD9dBpu8hAVaTkb+Vasaoma3Q0lQM/fVni1kNceOexXiP6EYsW0Wp0rN4veNdaePTBt3nA0j1h+7nl4cbVPQ2pwekgyk2GWRyK/WvlcfpTZfJamtqB5ptmzFfX9lIFPM/9kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+QqoPyChxhIkpq6Xy5jUCYHjE6phFlqgGGfJquSrUQ=;
 b=IbdDws1Vvb0z5TUm8MC6j7lhCSGpadY3lJrAMQm0MPdxQc8doQNsIowatEtO+3+YUTFwQENoh0SBAzQEYr7QhxOm2+9oH+td8aaUKK0cw45dQT8NQYYODXQH5i5LhJ5pSMk06XEaVKxz3pIL2p3BT9o+0EgQdjjnvMx5atSKzlc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DS0PR10MB6750.namprd10.prod.outlook.com (2603:10b6:8:133::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.16; Thu, 2 Mar
 2023 16:30:54 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 16:30:54 +0000
Message-ID: <1aaf506c-67a1-10a9-9b93-413dd3ed2300@oracle.com>
Date: Thu, 2 Mar 2023 16:30:46 +0000
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
X-ClientProxiedBy: LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::34) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|DS0PR10MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7f425f-836f-46e8-e086-08db1b3b7e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VG+TmrtdWdRacbUnKZQ36Qcqh63N+EjztN7YiNy5b/ZgHT5YC0D1ddhyJSTWPhwtimpF4Bw2bHybOWVXkWBe2BOlK+I7VQ7Fvq1MCnKKKRhgRp3nHAs+rEjrC077uJm4ZgHwBdKX9Ic5FtGY+075dHHJgbAO5oH5IcLON76P1HjNNJOBI+wgrP4w5hz6SB7C666SxI0AFVK5Fc0fA1HcF5UA9SW5Z9oHVQJBGIJQuCzClrrCfCrC6Wfb4Zhg4gFk1vpUxrovbnxmcHsIq0iUJUHLhXasAq+CYd3btzNOQcytA8/oPLEOzKyfMK7o9qZDZZ3RvDXturex5hVzrI422b5LGVuxDlZLxrjSkdB+u7b1hqajRf0HDKFTmoWe4sGkLEgoisj+zBSRmLUw8tkrJKq7tufWR1TcCDpVOQedRE/e3E21a/kqoFldUMG4R2Deylv+yKKYAIYuQrJ27RU0z6r+GRIGmOOstzCWYomA5GIWLRuiOksAjimkpBC7d4CijBlN1JWcjhI1jxSBdgvqu01ilDxVEFWC9a0Z81+T4+VbR7I/Oc4R2S4LINdfhQDg75sfHJ28vFowXoYCk8I/IVakLQUf6W7LrO10tGGAf0WzBr5Qi7DJrUBIir+5KeWSgLjrxYdnAp7ds7QVjepohN88gGsF+KwG2Ikx0qYtK8NXt8HlgDZ57AYS3Qdw4A9NdTbNYvl77jb+4pj+vIiNPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199018)(36756003)(31696002)(66574015)(6666004)(53546011)(6486002)(6512007)(6506007)(186003)(26005)(2616005)(316002)(41300700001)(110136005)(54906003)(4326008)(66556008)(2906002)(8676002)(66476007)(5660300002)(478600001)(7416002)(8936002)(38100700002)(86362001)(66946007)(83380400001)(66899018)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elk4MnhDT3BxVEpteUJJSVdKMVVpbHFDWUxzckFJaHJIR0dSYzdpdDkrTGds?=
 =?utf-8?B?UnJ1VkxQZm8yZE5KQkxxSXVROHVHbnZTaDNUeUlOTnAreStjN2Z2ajNpNVFF?=
 =?utf-8?B?Z1g3OGd2ZzhtM1RWaGkxNmZTUmJleTNQdkxsQzVjTUVhOEZoTkl4UE1ySk9C?=
 =?utf-8?B?Q3RjdlJtMmMvZEc0ZzRVOHFWVkNjWjZUNEhpUWNVcDVaVHFaS0E4bXJhZXZE?=
 =?utf-8?B?R0FYV1Z6eHRQRFdOV2FKNEVrS3U0dXo3RStHZy9nLzNVMGM4WWFmWE81cUhG?=
 =?utf-8?B?NGVEelhWbmVLcVNMVE1MY2NIME9CelJnV0x3bGNnM2lLTTQ2dWpoa3lqc0RL?=
 =?utf-8?B?UjlLQ3JWUStOK2ZERzBjZjI1c1c3Z0lqRkx5cDU1SUsxVzJuNmJtRzVrRkRm?=
 =?utf-8?B?bHAzSkhQRHhkcjJIVzJ2VWNKWkpUYzVOSHRyRmpyNENVMEM5dnJDK2lheTht?=
 =?utf-8?B?aWJGMFExcnZPQWhaaFd3eXg4aU1MT1VhSkl3U0xPcTk0ZXh1WEFSakllbXY2?=
 =?utf-8?B?TE1FcnVtSHpUU0V5YUxxSVp0cHRBTmFOQTlJb0RDenI2UkhtMzZHUlBiOXpU?=
 =?utf-8?B?eC80Ym1sZEVmV3hwa0JaM0RSVW1DcC84V2dJdnRRa0FXTjZkdEZsTHQzWlVj?=
 =?utf-8?B?N2tlYXJpQkc2VitwSWxMdzE1blNGc0ZUOFIrVlVPUlAxQ3dHdnp6azJyNlE4?=
 =?utf-8?B?YnVVRlJnd1RZR2NzamtjRlFCWjNpVWNCUjQ5UFhOOWtWcDE1Zld0R3RSdzZJ?=
 =?utf-8?B?ZExjUkV0bzlGSnJRY2Uzbnplak1rSjNkdnkraVhjby81bXNsb0k2bFprNUNQ?=
 =?utf-8?B?REs4aFU3VlVSZ1JYTjBQcUNyY3pTbVl6MzQ5SjNrdkhiSXBhVklQUjFUZVB4?=
 =?utf-8?B?bUJwM1ZGT3JiZHpkRjhrcUxySnhkNDV2NFdHWlQ3UloxOEpkSGR2KzQ4RVlP?=
 =?utf-8?B?RzliT0N0OVB0MmpSNkFSUGJaeHU4QWlpYzFvWmJrZE1JeU1aTzZiNFN1bjJw?=
 =?utf-8?B?QzFSb0w0dy8zOHA0bnZhNEdVek5mbzZWUnk5TnNZTWVtZ3hmVFYzQWpaTjdu?=
 =?utf-8?B?cWVJVDEyQW9oNzhNNHdzM1RxMk1UWUVEaWQrM2c3aXNxeGpFZmlwaFNXUG82?=
 =?utf-8?B?bkN3ZGJDYVlib2tER0poZElVYlFuTXB3c3NiSXJGUjhNd0Rna2JlRDlhV3Vt?=
 =?utf-8?B?YXFiTDJqa0ZRMXRwNk5iWjlGblhBSW9OTTh6Z3BkMFR3dXErZER0UmpSUUxR?=
 =?utf-8?B?RHRRcHhjb29KQ1lGUDYzQTArbitWNkRPSDBzMXZJR3NrdS81YmMzbWtZN2R0?=
 =?utf-8?B?Tys5dDY3cTRObG9DTG9XL1Y3M1dwbVJTZWFvUmt4UmJ5MHJieUIyaHN2MXE4?=
 =?utf-8?B?aFJ1SVE3SWs0b3dzSjJ2RHZvTVhSUlBuei9zM2IybUdBWjRnTFN3Y0RPQ0M0?=
 =?utf-8?B?K1JiTFRxck52S3l2UytYWGFDSEtQY3pCbHhTRnhrSTA2VFZvclJTZXVRU3VE?=
 =?utf-8?B?aVZDenhVcXVwTlFTS2lQaERKbERTanU2MHppbkthbExBOGc5cFI4L21zZ1Ax?=
 =?utf-8?B?TUZBTTB0aldtKzJPejhPZ3hFdlJzbEdMeWlQczMzajFNMkhITWYvV2hlbXNC?=
 =?utf-8?B?TDR5Z2svRUlKWXBWMHk4RWFIVm44aVFEenJsNkE2N1VZcnR5bHVSNmdzMlNo?=
 =?utf-8?B?K2pac3lGS1NvbXhNU1RPNEY3NW9hS09mYVYvVzgrQ2JtTDR3TURPTzFyMWlN?=
 =?utf-8?B?aWZBYjFtTzZ2QVdoVDJOdzRZOG1mRjRMaGZvTFFVdlZzOC82OGxUZkpvQko2?=
 =?utf-8?B?UTR2a2h1QVZQc2d6RE5Wck0wTXVBNVhmMnZiMlRqckwvZkkwQjdWdWptTFVE?=
 =?utf-8?B?MlZpeHliR1pya3U1NHVtTFRXT084OEY2QVhFZ0FVV1ZNd3VsSFEyekUrUkFh?=
 =?utf-8?B?TjBVQ2I4dDFBblYzemhHN3lzQmJqa3hPTnMrVlovd0pMM1orTGNkdWluZ01U?=
 =?utf-8?B?SU93STY4QlhsZHJ5MUNxbEZzWHZucjRKWGdSRE9XQmNYais4THhJQVpKRW52?=
 =?utf-8?B?YnJUV2toSm9GZlBQd3UvOUZDTjZyS1NDRkptY09PMlNlMVRBSWUzUkM2ODAv?=
 =?utf-8?B?WUlJK3VPRGNsK2pCclRCQlg4REJPb25hQmhWRUpvbjZZYk5rZXNJL21NRVNN?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: crheFR35KHjS4jERhY/7nk3HJ0Q7r5Rd67VHZH+f5VOH0cPW3027XrjlWujvuvq54mJol2tZvuyvmCx52b7Z3SN5ZaTxLDwyVn2s4jgHzro22F2vHu5ghuQprnxN5+7STbB4Ci0p6RHXfggpM5ZZXNwKYTAxUFCINpUFS6OD27VduyCAxtx9riHJbUd7eWEjjTiE+V6Hh+6Ysw+U9IPNcResdNaTJAurthFJXf5YUPVNC9hL4SozXl453gvwmzUPqhJ3sdacdzo8SEdgOgEY5dNlZ+ahQ7c6gj8N90GDN2ZJ1M99hJDJ0yCin//zrvF4guWWOQ7n7oFPB4pfG4Riw0tG8TghPpkhS6PxQgQT6tJqfRQDJr2oNiyVR+0P28cXV0/JV/aJLOMb1R/U4vAY/001uDOBACDVZrrfSkG7Y6N3vWuwtfoip9WCLQ5E3QDAn+YolTv2tgZa9ovSwuyWGIQKjc5Et+L2t5zcKqJP/80H5j/KYZpxHh4MreHbmPYtYOKYOH2naqYp6grQFNNY1LO6KzWCqHXs8gnSJHB3cqg8wLKtbGJ6Kyut8cNhrYkT8A6kCldONqLsd9CcgIAMCXyfFxa5eWAGtsiUbBLL7ewLPSvcaNPL9dHki++ciYtWCTOOwraWTmPAegMcGlD8D4AF6PWtGxHjplVdVdlJbRVo7zXIBuiluDxsico4UAI8ZrWry7OvkpARVcDyDO3m3zY9Dfd8uXOI4WCkmhQKpgJMMHvzPVUOR7k8I9ZKzv82rqKe8v4IPFDCAzuqwoP7rvbcrH9upLgRCsh9tiAWaWuPTAwT0FHR27NxcIbihmN1245uBiBbni9xjUBtFa7N3BeBDVsMPtWMWZacSTlzbxoICJjaSX75zcvfrDt5dURH+6c96dnITKjwEz8XyMW/Ew==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7f425f-836f-46e8-e086-08db1b3b7e90
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 16:30:54.7094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/G5SuF1nt2i0DJ246iMSr2F8ZtLgxjic6VY91le/WAgS7UJ+xlcai9EKBi/EJ0tUMzsJctyPKFMtwsgNJzbAiM4vB/aDA9oXngSVp5/0TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6750
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_10,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020143
X-Proofpoint-ORIG-GUID: khz392-oUdQAiz2lxJF6-2H988GdXNVX
X-Proofpoint-GUID: khz392-oUdQAiz2lxJF6-2H988GdXNVX
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

On 02/03/2023 14:52, Cédric Le Goater wrote:
> Hello Joao,
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

Both good points. Specially the g_malloc0 ones, though the dma unmap wouldn't be
in use for a device that supports dirty tracking. But there's one where we add
by mistake and that's the one vfio_device_feature_dma_logging_start_create(). It
shouldn't be g_malloc0 there too. The rest, except dma_unmap and type1-iommu
get_dirty_Bitmap functions, the others would argue that only happen in the
initialization.

> The 'vbmap' attribute of vfio_giommu_dirty_notifier does not need
> to be a pointer either.
> 
> vfio_bitmap_alloc(hwaddr size) could then become
> vfio_bitmap_init(VFIOBitmap *vbmap, hwaddr size).
> 
> Anyhow, this is minor. It would simplify a bit the exit path
> and error handling.
> 
By simplify presumably it's because vfio_bitmap_free() would be a single line
and thus avoiding the new helper and instead we would just live with the
vfio_bitmap_alloc(). I am at two minds with alloc vs init, considering we are
still allocating the actual bitmap. Still lingering more over staying with alloc
than init.


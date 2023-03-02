Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD86A8378
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXivD-00019A-Rf; Thu, 02 Mar 2023 08:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXivA-00013F-T5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:24:33 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXiv8-0003vZ-Mj
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:24:32 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322DNhPn027156; Thu, 2 Mar 2023 13:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ps3lH+46DZ33Mc5Fp0AR+sEbbE150pKvnxNkTFEBh5M=;
 b=2Ie0miM+w1a8Tj4+UmzGzMYIdO3rxQTRdG6PFwzUFV+jjl0v+JBj7kvAVMcd+Sei/gul
 XEXHQ7HNKHfXBOME01pC3ACbMN541X28dyzwKx3k6oxoKhufGP9m9kzo5YnXNeRzXaBk
 9x5CW1ss3zDX+VDdplC5rUB+awtdTWETN/ethD+JDEr0NK5ITlY1A/2CMEDRZyvvSj+l
 g8uY8KS3RyG1TxbDyibRy0Wvyi2hsujVqhF0ejuijtgLlvG8TRxfDv485aXHSeO75o2s
 LJbvKrM6rItFyFNc3YJ8A2h1YTLasMHCjloQP+BqQs+OnBGcxKKnFBftodI2s4IMk3mU kA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nybakuw5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 13:24:26 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 322BrXSS032956; Thu, 2 Mar 2023 13:24:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sa1qdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 13:24:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXld1TNw1EQdL7yUYx1QfKuDz2837O0/fUY4hcVObsSwFRsA5/DyAmXsKNf+GVLj6ld3EHRoz5xrjpBCiogXOh98NCofgwkKhR1+7AnhHVaFJ0A6EL33FtGjzxrMcEMsrvas6bu/JCwp65O1KGNjDOgQ8ra/qVjEdOmnU8jQADRzMtcEjHYg4jNl8jLHtx6yH43jXaX2jKBcFyvzGKRC8VMXAvYRA19dawjs2nH5OP2IiZjmwVJ4lZJsNya96xv7Q3fM3nCLqU3rQmgUK2lmesev+bKj3lRxIbZG87PL6/YBMBDPsUFF9Bmptq8hI/EhzatOt+hwwRa1t6TZdsFFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps3lH+46DZ33Mc5Fp0AR+sEbbE150pKvnxNkTFEBh5M=;
 b=S5GSZlQID7ZU/0WRZYRrW9T5CFDHBXJVBiYUKAWDoJviQdZXPEC2RHrMWar3svQwwy6yoEuPMLOmAYjX09IjYgV7AC0rw5oOugtMxZAOfU58CP9oEizm/2XWXq08duWaYvUlvb6b4b8A5YYkVjIrdvJK53k3Hos+yxesQAvnBHrNkIclq6zVhP02Hc+phpslCpkm0zqFI1YbundveBSieJRjhxRvUdACiacde1Lb5zJ1RKB3LIGQoIkSCWH0upFZWtzcJYRa09A+Btb4VvsvDJlmAKt4Px9YPlUWmO9Mg7T2nNjO3mwfuSnetvPOcmHvPqFMP4v362BSL+YCpW2KmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps3lH+46DZ33Mc5Fp0AR+sEbbE150pKvnxNkTFEBh5M=;
 b=Y3HSzgELewfO5kG1jN2+Qz+u+wipmzMpB/ROObCDfN7jjsmhdQU67LtMLN5MCwpFyhNTZZFNK/VIEI19+yexkv2rIol0PKjgV/fL/QgMpuOspl1UNqgZvhEDLR+qJa9vLkLyZJh/VoX9WfuI305hSXSQpdo2ZaCOdncYuuwCl2U=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MW4PR10MB6348.namprd10.prod.outlook.com (2603:10b6:303:1ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 13:24:22 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 13:24:22 +0000
Message-ID: <8b8e68bb-7c22-e782-f2eb-4c423ae5d3b5@oracle.com>
Date: Thu, 2 Mar 2023 13:24:14 +0000
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
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <55b623e9-3f5a-1353-280c-e6012b5924e6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR07CA0123.eurprd07.prod.outlook.com
 (2603:10a6:207:7::33) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|MW4PR10MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 0238dd76-b0cd-4233-f9e7-08db1b216f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1gkfJx3T31YLvdF72m+Gui1eIuUHzK+ZrMe3BXW7S50+HPMjFNqI0nqukLti+inGAe8DOh7d4niViKJaW61R7NLU4AkQyZD/Bv41q5rZVavCra9p87df2OmSSqw0PPzSvjJ1V5byhiPQ0zKHK7a7MzFvTCi8mnwhj0x2vZ8ZdrNxHwdycjfWsrphcWCt4Ap57bevD0YCQgZ+k/whLs8mFrA9JJt2vxFKa+Kx05xdCrKlYkqs5P8SQBkTOMnmLv91IaV5GNmp47PPM6Ok+ie8bVMLO3/Po1nsuZyxLJKhPzaSYo3+EzHb2WwG56Y34kLDfzimV8jnbfsxVqftPkPWGJfpoPh7ZOt4xPOMaXqrRKqKMOGRIF9tmqxNBhwbxxYcwzXZb7eT+lomOyg+V57bq/MFA3rY6rf/I2nh3MIpHdj8ELNVIQ5mksYOppxwDGSrLLsk97VsLq09uHFZiLkkJ9fnHfhbu3aQ223yRTtCsqpmtIfAfjJuyIpS6brFAgliVYtMVVrzOAyLH9JLh/NhTWD1GAHoXHdDj3ePBZ/ia4ZeH/VFO5PYoBookyOfOev4dzt/yrYHF26sOXnmUXef4mEfwtMbmMpOLcgQFHpFp1FWaGd9+B7AlzMgk9Xn76GtDngdPH5aIQNfQkW0jpl8s9umenXEFaLDaDS13DTsJBUmHDhWuPDCKXb2aZxEyasguUAuRvkV7FSHyZpGhQvRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(83380400001)(66476007)(66899018)(66574015)(31686004)(6666004)(36756003)(38100700002)(5660300002)(478600001)(8936002)(7416002)(86362001)(31696002)(2616005)(6506007)(26005)(6486002)(53546011)(6512007)(186003)(66946007)(2906002)(4326008)(8676002)(316002)(41300700001)(66556008)(110136005)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3A5V0loK3hqRGU0d2tSMCtPMmtFVG5qc0ZaeS9xTVhEMHg5cHBtSHNUSUIr?=
 =?utf-8?B?a0ZWcjZCa3pqQitaOWo5TkY3SEx6dENsRzNTL1Y1UkJXck50VUdZTHA3NG9B?=
 =?utf-8?B?ZVZmUDhyNWRFSW9VaFBBcUw5a1RZaFBwbDlDd0RCVFNLeElNZzUxTHdxdTRW?=
 =?utf-8?B?LzdjTjBsMUNNY3d2U3BBZUoyY1gzdGZHVElhR1ZFQ0FvdlBtSzhWbHlKazA0?=
 =?utf-8?B?UDJQaVEwd0FoWHdNTlpSRmx3bGt3OG1mL0ttS1B5RS9hb3A0MU9GR3VkaG5w?=
 =?utf-8?B?L0VZd2EvUlV6cXBiNXlSL2tyUzlscVFpa291MVZRdDRWUVBRbXRRa2ZqR3Bo?=
 =?utf-8?B?UWJBZDBNQVhQOHZENG5GTVJoSG14UFRZVWZSY0ZlUVFCaHdXTGRGRmV3UENn?=
 =?utf-8?B?bHFCQ3RNaHNCOG5KVkxyTVd6cGxScmpqZklKTHVvZ2RDWkRSRzJiKzkzMzBp?=
 =?utf-8?B?aWZCTTZFdEw3enFXNU1CcHo2V3A3YXJEMzYxdXp1RkU4d0JyRGh6M0lTeVFZ?=
 =?utf-8?B?NmZuWFNSanpHZWdBbjVBMVh1RVdvL1hHekhySnQzeUMyVGUwam5KZ1U5eFVB?=
 =?utf-8?B?UHFobkMxc2ZWZjZ0SjExVkF5eWVudjd5Z2hrMXlxU0JuWVZMODhBeDZrS0R3?=
 =?utf-8?B?eXZQNzZTeEhKYXVPaXhPZWdFQjJjdWlVWWtOU1BpdEZ4YmdhRU94azA5eTVs?=
 =?utf-8?B?SDVaL0tLVG1FRGF0bFV1OC9hNTRHcit4ZmZGTGJsRkx5SUpGVHJQdTVnK1ll?=
 =?utf-8?B?VmFuODRSdmdHVDFBYSt4UWtnczhrY3p4YmgydzBVd1JLTmZCR05Xd1Mzb1do?=
 =?utf-8?B?b3RHeXdLcE91cWRNU3NpV1FTbEVLckQzMHp0M0ZiVFhMM0oxNEljUTdSR283?=
 =?utf-8?B?blQrdUZDK2pZWmxUeXFacCtzWjBVRDJhVU9FcjlSMFRvRlFSdStEYmxqNlht?=
 =?utf-8?B?c3pnNDdBWHE0cksxUkFUTW5qZVpWdEZlQmU5U0h3TFBRMk40QUtpVTdXOHpH?=
 =?utf-8?B?MVBONGhINjErQ3ZNME5wdVFIdVcxa0dZTkxmYWRIRmtvREVYYXFXSm9HQ294?=
 =?utf-8?B?V3pWTWJkY1JNMkQrbTgrYzd3SlpnQ1lnQUhHZGkwL3JWYkZBN2x4NWxNYVMx?=
 =?utf-8?B?azBFSjBVMnFWRFl4clVnM25TcVZDZUU1WWtRM2FvOENzejY4Wmh5OVhyZUlE?=
 =?utf-8?B?QXhvOHdVaGUvOHVMWVZ6dGNCaXRrOG9DT3dIMmkvbEJWOGx1MEgvZFZEdER3?=
 =?utf-8?B?VHY2QnBXYzA2QXBRK1NyNGhtRXZ2dkt3dXdndGpVTjFlalRtN0dTUCt2Wklh?=
 =?utf-8?B?RE5QK0Zjbnc4SFB3MUVFNjN6cHQ3eHJtNDBkR1R3U0p1N25rbmFGQ25RY0xv?=
 =?utf-8?B?U0FncCtsdVRTYTI2cXFXMWZrekJzcnppS3pybFVaVk8rMFZhcWMra1JEZWM3?=
 =?utf-8?B?NmRITkdjUzJ4b1RsbU9rTEtHdk1pSTR6STRxczBCOVlvcWduRGpnWXMyeU1r?=
 =?utf-8?B?RHlXTWUvaDRZYTRzVkNOWGVMc0xjMXExblRIU1RpQmh4b0ZjRFpUTUNpOXBz?=
 =?utf-8?B?aGNYMXZ2UHp4OE9uTGpTMm1KaUpYUHN2bjZxcG5GdlZNM2xEZCtiRElXNm0v?=
 =?utf-8?B?bjN2eXM0WWo1QXpBMUxORUo2STZsUFVEZVFnL3BwOW80Vld6V0FHWDV4S2N1?=
 =?utf-8?B?YTRqQTJ6WGt5cnFBaWNLZFUyVDlMSEVkMS91d1l6MVdESU5CZXdMVkFpTDNm?=
 =?utf-8?B?RHdKRFhtbStSV3FKTXlkV3d3TDV4emRTVzFBcmphUG5jZDR4ajU4YXdQYklG?=
 =?utf-8?B?a1pYdlRnQklJS1VtUk55UEhVTFd0OUpQZkhFZlQ1ekkwSFVRZXFrNTRTQ04r?=
 =?utf-8?B?L2I4bTBCWHNaN3VJc1VQMXplRDE1c0tKV2h1VGZOQ1ZXZGJlalRsd1gvMlBS?=
 =?utf-8?B?NzUwcTQ3eFc1TXNIRGxwLzY2NXdmbkN4dWdUd2pNdEdDVStUUEtXTGZwbWVr?=
 =?utf-8?B?NTBYTWdFd1ExUFRyTUtCOFBjbkRQdC9YMHFVQ2p6MEUrdmNTNDlVcERvdUhW?=
 =?utf-8?B?Q205R3dlZzFXeEhSeUhjTFNxYTBKTWQyUEhqWGV2R2JHL2QrRit1QlBBejZV?=
 =?utf-8?B?Z1JPSllSOUJxUk4yVFRBS1NtS1NrZ0NXdlBldHNUYkhJTGlJZUdSZEtVWFZR?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: y70/JZ4Fo8osK+EPHo6jFo2dldFIQ5IZzbvfx53HsHhOQcnBYN3X17oXGkmhk5odVewnzyd1qXZZuba5l6vaYpLLyxmN/G757nuWX2MwKPxfrvwfLZCqb7Tv7s5wub1/e01scz7XIr0f1kktTE5mxcUqUVNJwKK3Y18RCLbDKmiT4xkrTwVtnQXXZSFTSRnBRKp8gKQDk8yfTHru/wjO4C+nOyClaS8dr+dw2Q6FXQz9jw9FxRrA4ZS2zN81gHnsqp1CRzqpP44vRyDagm9tUyumadwU/uLqV5XTh7exWlfzvulW5jAS6/jzsoMJI9sr1Wg8zvgWE8IQdrNAyFr/2nVnHplBmI6ZCKm33UkhpbKIS2tpoEHDRjUm/nGpnHOy0WhHuPdVWpcdZiyBU6x2Q+jR6i+WNAirtOiNgp75vsyJhLxv5B9sikk1j6wSaT0boRgC2ULX+JJvx3fdN5oM5JuOD+KnIpSt1/fGhr8wd7nSvfCD1IiUwyB6fPVFR3TdTv2axV/t8/aqIlt9r2XWObdU3n+yOccelGW+oB8X8toSh5wprIV2AZYuvlN5/KfmD6nxTT5h+7T3wkubQcnkDNGpwFkthfj/DFb/gE8Qsg/8kfBtYi7USGH22QndYpglbdR/cSgPZIeoAsOO+tGitJIB+yOIwkverGsyL7gtzTJ/1ZvJ+nY27cqj/jE2QEl/shvv6AjM+Acbeb6NewYlVje6uGbMcHWS8Vkqs+JBVnrwbfNFpyz8jI8cQs+XxCVoqfCRcijNchxGyGiMrJ46ho6lO4SNTQQVRJzBYId0Yl1e511c2JzF90Q7pGX0hQ7pj6N1FiMrk88BcLPWDl1WXuXmPz7g7joB2cLC9OA6qs0hPUVK3G8gYfjcfzkikwR5BwKy3QiVmPdgQ/1oRX7HjA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0238dd76-b0cd-4233-f9e7-08db1b216f85
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 13:24:22.3832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAf6WGYV/aYBK2tdtVF3qPVo4MHAkR8XeRyiPsXQahinApRw3rCAwErR/Fcysf5GLu50O/UI7+XAbHKpixh6u88d/8WBOagveaYTv8IblBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6348
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_06,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020116
X-Proofpoint-GUID: MZhsOVET_rXuo2p98Mo4G5Z_me1if5q2
X-Proofpoint-ORIG-GUID: MZhsOVET_rXuo2p98Mo4G5Z_me1if5q2
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

On 27/02/2023 14:09, Cédric Le Goater wrote:
> On 2/22/23 18:49, Avihai Horon wrote:
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -320,6 +320,41 @@ const MemoryRegionOps vfio_region_ops = {
>>    * Device state interfaces
>>    */
>>   +typedef struct {
>> +    unsigned long *bitmap;
>> +    hwaddr size;
>> +    hwaddr pages;
>> +} VFIOBitmap;
>> +
>> +static VFIOBitmap *vfio_bitmap_alloc(hwaddr size)
>> +{
>> +    VFIOBitmap *vbmap = g_try_new0(VFIOBitmap, 1);
> 
> I think using g_malloc0() for the VFIOBitmap should be fine. If QEMU can
> not allocate a couple of bytes, we are in trouble anyway.
> 

OOM situations are rather unpredictable, and switching to g_malloc0 means we
will exit ungracefully in the middle of fetching dirty bitmaps. And this
function (vfio_bitmap_alloc) overall will be allocating megabytes for terabyte
guests.

It would be ok if we are initializing, but this is at runtime when we do
migration. I think we should stick with g_try_new0. exit on failure should be
reserved to failure to switch the kernel migration state whereby we are likely
to be dealing with a hardware failure and thus requires something more drastic.

	Joao


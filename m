Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0896A8DCF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 01:21:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXt9q-0001P1-Mr; Thu, 02 Mar 2023 19:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXt9o-0001Oq-IG
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:20:20 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXt9k-0006cJ-L1
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:20:20 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322K42IS013550; Fri, 3 Mar 2023 00:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=hSjqqpe3QgUKOL35EGkyu771tUUNI3RdbXgIZR7Pd6M=;
 b=fcqITFPY7L7P9NOnLWNwx3a88B0msHH9p49rn2YAJcQYq69sL80Gkw8LlJEmBFmWMbyl
 rv0ktZo+EH1Hr5FCa2JSKn/IqN82JeMNy0+x269gRjTz0fdlVk1SVhHuoP8geeQX1qbH
 mL0OKX0ocM+M8pcyF2jcIQ6Z1H9lgWtD2ss8HQnia54vYuAzZI47c4RbqLlzxZ+LhvIv
 PwMAV0UyqImP/ygXVAOn/FePvuG0H1eXpCfHhjYw8vKg2UfQ+m1a8Q3uueWtTjdqhrk1
 j9IANR62AQglEVWLiaLvDeRDXQ9MJ9RyT0bZC3ccepR9kjul9RvNPF1spjgm1A3nrdbE YQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb6en77a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 00:20:11 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 322MVhK4005082; Fri, 3 Mar 2023 00:20:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sb4km9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 00:20:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/RPKKkslS9GreTeqKdVKNXTGHRpv5PaFOqXSiR0WmbbLlMBVja0r1cRZv75UBlFTKL03XARkbRh76oxIi9MtIaoGl0KvBgkyHxGo37aQY9cr2FKY5zfPFXQnMmi608OBgivnDyZiHe6o34cJ4hZRIHQjkhyuzy4g9Lb0LYxJmKtS7RWpeDqAlZYwnoskxDV4niY2ZKZn9vH24AgZRTvYvrxlFPNOReeQows7VLlviPqyUwY+A9p/vUBBx7VJ1wbVaiHOXd6jkVhxI06ly6ljbVBcNCZHeEYOErhQHjrTGYgXFYdlTsWdmzlmzUbGS7pr2po8WNib6p1rVTwfiUBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSjqqpe3QgUKOL35EGkyu771tUUNI3RdbXgIZR7Pd6M=;
 b=LdcBzaMPpB8GJ/z11K9VfZ/ewba49DXLqO/TjU6r6xD93SL2OqaQfN+bWC2srIaMPvci1equXPYLr8kn3z5p4uo8SZlTUQLwgjdij3Tj85OERAaMXRLl1xFUEunqIqIHAnRSp4tbrDTJZKh4+w4i8UZeBGu1YlfHtwzbPLoHExMcMa7teT1UuiL6MQrXSKiJ5QKy660ZpsdJtQdCj1NJV/ZaZfn4nST2lb79QC8LQAeZ1udVQfWqgwI5E7aKmrUIQRrtj3gm0h+poOcZJ60kLYhFNM8wh7mj4Q4EsrPHOm0IM5u/hVJeNEeuyLx+MImlxwXYnz1eHvY8A31X1CY19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSjqqpe3QgUKOL35EGkyu771tUUNI3RdbXgIZR7Pd6M=;
 b=YR5bzLTYJPjjVYQODG6tXSO9ugpSp2CnvdySwN0iQm59XwN3MUv+YQ2TX6eNsxn92B93W1rrHgauu3EAOWYHn3PS407UIaN9TLFqd+OpnI2VJiU4EaH61McZJa265j8UXMW8DSJB004Is/clMJ0XxdwWv3/CK88p+ixbas0xYXQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SA1PR10MB6592.namprd10.prod.outlook.com (2603:10b6:806:2be::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Fri, 3 Mar
 2023 00:20:07 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 00:20:07 +0000
Message-ID: <c1e5fa47-7028-5e24-2158-2e64aa44006a@oracle.com>
Date: Fri, 3 Mar 2023 00:19:59 +0000
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
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
 <20230302114248.41b6c21b.alex.williamson@redhat.com>
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230302114248.41b6c21b.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0246.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::17) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SA1PR10MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b39c789-85c2-4e02-2bd9-08db1b7d0ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62jyO/OSLQP92r8FxF/4xwpe0+PUUexkRGf/CAkAlAdclc2uIy4uLqabSQcaVxQYmuZrkAIPngpjKnExqGCTnhRhJuzJ9x93qZvMUkgVckfEToBsxpD7+8oDQ/n91vXf5pjd4uJZsZ8BT5Iw6wuPnRgf6eGa5U4Z8DEQzgGTHTfWJU243QB7atqucLfEWXH6XN2J8IFnEZIPDizM80egJzlPF0log714V/NBeVZi/WHxWiD8DYZ0xC/oLgauHdFwATFT1aH6kz/CrvUgzFHEhOeXdF0xrRThsj3GhwQ5swz4D5SQjrHBdhCsvm/PQqwFy/I3+rRPot7I2Aw6ngk1qKKZH7FDwdLLIc4vZDav5LjBfiYPNdQsWshT6XwE77yNTBGnicD6ccRXVZtMG7LRe/H0Gg392ECb7p6uMdjLVsLMltno88QtJQFHUBa21JcfV0CnSUabL2jSZ+RasHpxDi/ps0iSDilPHRRHL064pYhL/NaZvHlghT5lwVZXJWStJYCkn6yWUe3lq8KXUXgFX1I9wFO0Yt/BR/9YH1kFEcQYm+YtyWUA6KwpAZbS9de13OPS1iTtEb5RnSdRKZFELjeUrfuKU2A9iyEeZCI7K6sRiOTZsHWdTwEVnly8Dsx2lRU68UfuT7w9/+7j8/9z4U1yvWnS0XJZa8IW4v273RxZPXl5U5Yn79jyohQSaMGJ5t4A9bUKH7MuUQfPuEhYlm0HlXD1b3qQ0eC6rdsFKKY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199018)(6916009)(8676002)(36756003)(41300700001)(31686004)(4326008)(83380400001)(66899018)(66476007)(66556008)(66946007)(316002)(54906003)(8936002)(5660300002)(7416002)(6506007)(53546011)(30864003)(478600001)(2906002)(31696002)(86362001)(6486002)(38100700002)(2616005)(6666004)(966005)(6512007)(26005)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjlsVElBaFoxcjlKWTFUV0xZRHlNT3Q0aXZBV1NZVDQ3NTZlL1ZKZGlBS1RJ?=
 =?utf-8?B?UU91Y1hkNmFBT0poZUxtS3VPTmMvTVJVdUtST1FQU1o1dm12OUxPbE1TNWEr?=
 =?utf-8?B?dTc5NUh6MDZZUEF3Q0xML0l6NldCZFpwS3Q4TmJvS0ZJUTNYV0FBN3kvaHkr?=
 =?utf-8?B?bFNHVWhzMUdWc1h5WkhLcHhoeTl1MVBwbkNhYU1jRHA4NGl5ei85aTdYK0hL?=
 =?utf-8?B?bEt0ZDk4RUhXSDRodXl3ZDlXVEpsSjlDQVJ5Z3VWRDUxUjJOMzIvNW03dWZT?=
 =?utf-8?B?YUtqN1FnTkdZZ0cxRXJzNkVlSmw3Y1VweVhEZjBkbFBIdTF6QWRna2oxVTM2?=
 =?utf-8?B?WmVZaG4xK2VIbHpKcW1XbysvUExRWVN6Z2R4d0poa2hHR2ZrVDBrY1NhQkFz?=
 =?utf-8?B?R3VtamwvSWFMamVqNlNhbUFyUHlNVTZuUnVkQTFEVU8ralhyRmNvdW92STQ3?=
 =?utf-8?B?cDJ5eHJXSm5xTEdnWkN1bHJCMzdocjUvRXArVlU1bWdvcUVMS203MVhBbGF6?=
 =?utf-8?B?WUxMbWFCRWJiV2VINXdpaStGVVdyZTBNZFMySmY0MnZPUmFMbnMyVlJnWnVC?=
 =?utf-8?B?TmtPMXlKZis5QVpYSnRUMVhCTTZ6dmx3OGtmTGJ2U0ZrUmtmN1pyTGJSTzU1?=
 =?utf-8?B?cWRmZFBFK1ZIVkV1TjlETUpJOWJNMTFESThITklHVHdTZFR3SnRHQ0g4TUc2?=
 =?utf-8?B?N3pxTU40MjZBZVk5QlhLdER1bUpvQVRyMHdjS2xvVE5CaTUwclZwSzNlNnJD?=
 =?utf-8?B?OUk2K1c1c3B1bE9BWjJDc0RBbXp3OGQ1THJVK0swWmFFeFVmRzl5SjNubTNL?=
 =?utf-8?B?Qk1ZcUhKZXFBL3Q5WmY4Y0lyQlZHbVh4YmY3dGZEWWR5blRGSUxhZHlzZkpT?=
 =?utf-8?B?VUs0UEdOamtaMGNWWnZNdEdsaXRQQ29jejRiTURHOFVNc3ExRG1vRzltS2t1?=
 =?utf-8?B?OFQwZGd4SGRONU9MUUV4SDdKRGthTW9HVXdVbkozRGVWME5RNllMdGwxTGFr?=
 =?utf-8?B?SWtVdHJUbzk1WmxJRXV6SDVvZmhBUnRzZTZSTVFLWkVPOXJ5K3FlL1JVaGR0?=
 =?utf-8?B?UnNpajFpYkFsLyswRlRidnRTMXY4SU54RHo4Sk5VSlI4ZnhvOE1Cb005S1JW?=
 =?utf-8?B?Mi9jWHBzSEd3Y3VpK25aVVI2VGk3aXhYQXRpc0RJaStVWFJlZ2ZrbjZWWUNG?=
 =?utf-8?B?Z3A4SmVhdDU4cmppc1lmMXQrL3o0VWlxRm5OdnoxKzhHRFByclE4dVpVWjBk?=
 =?utf-8?B?ZTdxNzRCTkJxTW5iL1NDVnFnMXdBNjN5L3dpbVhBRTJkS1VEOEtUODJTT0Fi?=
 =?utf-8?B?cWxpUVFoM0xlazhEMFFpMlFBOGJoZzZucTN6VXZLcUkySmx6czFqUXQ2elpN?=
 =?utf-8?B?RjEyQXlFNThPUGhCcFJqR0I1QnZabE00dDhSYVhSbzlUTVQ0UmM4d0h3ZE16?=
 =?utf-8?B?WS9OVkJ1K3JWd3hISWFqSmZHMW05S1I5NTcraUl4VXBMYk5vYU5NZjdLMjV3?=
 =?utf-8?B?SlhJckhlUFZ3OGZyT25BKytXaEhJVEtxMVN5TDFjUGdISG9uTzBtZlhCT3hx?=
 =?utf-8?B?M1FVWEh0OUhhRU4wM3hUK3JVZjlkNFJKSVdoY0pCSGFWSlVhMkw5NmcyQUp1?=
 =?utf-8?B?K3M5eWF5NVpjUW1SNjF3bVVxcDE1aktuQ0Z3Q1JoTGtEYUtKTVdRNUJ5RFBz?=
 =?utf-8?B?bzFKaW9mWTVSa1l2V3BNN003VUhlazY4ZTcxTDV2OXpaM0pLME5FWSt1S2l6?=
 =?utf-8?B?emI1TU9VTlhkVTZPc1NoL1ovMSs4WGRoSHZ4QzlKSGZleThBdlhSaEt0VnVz?=
 =?utf-8?B?a0ZSYnQ5Y2JvZGVuQjMxeHlLNG1iaG9PSUZvbTBldWVZRENSdFBwYmwweGJJ?=
 =?utf-8?B?Z3VuQlp4aUVGeURDaWZrSlY1Y0RLNUR5cHh1aThqSXYyc05nRTQ4cU1tQUZq?=
 =?utf-8?B?RVFSdmlLN0FIOC94V3lnUFhYRTFuQVlWREI4ek9IZ0Z1NFd2VWF2YXZtQnEz?=
 =?utf-8?B?cUNkOEkxZ2NkRzJLbTNqZXZGRm85VWZ1dDlKVmR1Q2VCOEdCY1BHVGZoQldi?=
 =?utf-8?B?RVc5ZUdtRi9aTzhoakFFV002UWpQd1hvS3VkK2h0YzRkVHkxTjNkMm5GbjVa?=
 =?utf-8?B?VlBPRlRxN0cxZ0JCSUE4cjJLRnA4bGtzeFE5VU93U21BY1hpdzFPeW9sTmZU?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4/t9Iz8vRHiBGp66OVfkTYgXo52MjPbM1e9CX+dLUM0CAypOdxixMhlQjSudDcTyqQldf3IXIFdyatQmgVqTryRKDV3X/Soc1DxmlQ8xKdtBl+A6FrK8ysNO2LrKRxNSpa77NgnTgQk0dxfFToAAwyu3lwE/U0d+l3P7Vjb4L+9rYbcNFdfwUYEXhyuPwEIjPefVmTRc6HlhXwKk5w8zy1dejKmOx3srR5QAtehEPrZo6J7IO5JedDX6luSS6hu9r+6lyZzoyqmJK0uvITRyYJdRDyT2qpri4tNkZRov9dPaVTZAlMD1Zi3NHjuWoWLwXPpuFHzAeRBYJggkSDRacDjbgM8wpfQDzKnf8BxlNxSS8dkp5EVx3MWl3Jw90iqk6rbkSIx9f4PZQ7jgM3iO8hvkOwEn4d9zQ81Qh/8tkfHzKyR77dZpyKtsFg5yeWQ8VIygTGD/OH1ZopleUoyBYqMHGoEYbtfmUeq8PsxjcMgL6gF70l0u3RDqqfPMJoz9Zvge8AfzfrNYRL43ozvJXo1+AidpBMBDFvX+4H14agYTopnnBKKABCG3eHeDd9kN2AWbJ7LfbPNs8VkhmWV2YB2Z2DCtBm67j5kBxPEb1namcDKFZQcFOvqL+NphDSdcDj2fcu3mSwY72TaqJZCEtEf1quiIoW3C2vLw8/s+++0p+KrZJpF+jG562q0RpdqJFoRbzt3v8J7cT9uc/4goxRZOCDnaWWdTzdGx1jUgrIll7muZj+53oMzkEzSpdRhULF2Yh040o2IQ5WF4zkb/l5b9xr1TaxjyxDhX4d2tB5xq1uLb+7mwKYDk8VZ+2aueCfAXv9UfiU877qdQqCeoYjSWSZSg5jyDVlcjhRNiO+avuj5CeuB3N85A3kcT3EpZxRC1IvQZvIMvsrGLlPWdQw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b39c789-85c2-4e02-2bd9-08db1b7d0ab4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 00:20:07.0467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wo/S2MFDgzDj5pWZQH2Tc2eE5CadCjQJPz0ewbW8d+Av+oJqGOCZ8Ei+I9ArHQLLRroa9du+lpHfFlwX9bDEXMCOcn8kT+WfXzjfjpoLsS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_15,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303030001
X-Proofpoint-ORIG-GUID: VU-zPUpvs8CnhR_LMn6I_X5rco--tO0v
X-Proofpoint-GUID: VU-zPUpvs8CnhR_LMn6I_X5rco--tO0v
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

On 02/03/2023 18:42, Alex Williamson wrote:
> On Thu, 2 Mar 2023 00:07:35 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 28/02/2023 20:36, Alex Williamson wrote:
>>> On Tue, 28 Feb 2023 12:11:06 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>> On 23/02/2023 21:50, Alex Williamson wrote:  
>>>>> On Thu, 23 Feb 2023 21:19:12 +0000
>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
>>>>>> On 23/02/2023 21:05, Alex Williamson wrote:    
>>>>>>> On Thu, 23 Feb 2023 10:37:10 +0000
>>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:      
>>>>>>>> On 22/02/2023 22:10, Alex Williamson wrote:      
>>>>>>>>> On Wed, 22 Feb 2023 19:49:05 +0200
>>>>>>>>> Avihai Horon <avihaih@nvidia.com> wrote:        
>>>>>>>>>> From: Joao Martins <joao.m.martins@oracle.com>
>>>>>>>>>> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>>>>>>>>>          .iova = iova,
>>>>>>>>>>          .size = size,
>>>>>>>>>>      };
>>>>>>>>>> +    int ret;
>>>>>>>>>> +
>>>>>>>>>> +    ret = vfio_record_mapping(container, iova, size, readonly);
>>>>>>>>>> +    if (ret) {
>>>>>>>>>> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
>>>>>>>>>> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
>>>>>>>>>> +                     iova, size, ret, strerror(-ret));
>>>>>>>>>> +
>>>>>>>>>> +        return ret;
>>>>>>>>>> +    }        
>>>>>>>>>
>>>>>>>>> Is there no way to replay the mappings when a migration is started?
>>>>>>>>> This seems like a horrible latency and bloat trade-off for the
>>>>>>>>> possibility that the VM might migrate and the device might support
>>>>>>>>> these features.  Our performance with vIOMMU is already terrible, I
>>>>>>>>> can't help but believe this makes it worse.  Thanks,
>>>>>>>>>         
>>>>>>>>
>>>>>>>> It is a nop if the vIOMMU is being used (entries in container->giommu_list) as
>>>>>>>> that uses a max-iova based IOVA range. So this is really for iommu identity
>>>>>>>> mapping and no-VIOMMU.      
>>>>>>>
>>>>>>> Ok, yes, there are no mappings recorded for any containers that have a
>>>>>>> non-empty giommu_list.
>>>>>>>       
>>>>>>>> We could replay them if they were tracked/stored anywhere.      
>>>>>>>
>>>>>>> Rather than piggybacking on vfio_memory_listener, why not simply
>>>>>>> register a new MemoryListener when migration is started?  That will
>>>>>>> replay all the existing ranges and allow tracking to happen separate
>>>>>>> from mapping, and only when needed.  
>>>>>>
>>>>>> The problem with that is that *starting* dirty tracking needs to have all the
>>>>>> range, we aren't supposed to start each range separately. So on a memory
>>>>>> listener callback you don't have introspection when you are dealing with the
>>>>>> last range, do we?    
>>>>>
>>>>> As soon as memory_listener_register() returns, all your callbacks to
>>>>> build the IOVATree have been called and you can act on the result the
>>>>> same as if you were relying on the vfio mapping MemoryListener.  I'm
>>>>> not seeing the problem.  Thanks,
>>>>>     
>>>>
>>>> While doing these changes, the nice thing of the current patch is that whatever
>>>> changes apply to vfio_listener_region_add() will be reflected in the mappings
>>>> tree that stores what we will dirty track. If we move the mappings calculation
>>>> necessary for dirty tracking only when we start, we will have to duplicate the
>>>> same checks, and open for bugs where we ask things to be dirty track-ed that
>>>> haven't been DMA mapped. These two aren't necessarily tied, but felt like I
>>>> should raise the potentially duplication of the checks (and the same thing
>>>> applies for handling virtio-mem and what not).
>>>>
>>>> I understand that if we were going to store *a lot* of mappings that this would
>>>> add up in space requirements. But for no-vIOMMU (or iommu=pt) case this is only
>>>> about 12ranges or so, it is much simpler to piggyback the existing listener.
>>>> Would you still want to move this to its own dedicated memory listener?  
>>>
>>> Code duplication and bugs are good points, but while typically we're
>>> only seeing a few handfuls of ranges, doesn't virtio-mem in particular
>>> allow that we could be seeing quite a lot more?
>>>   
>> Ugh yes, it could be.
>>
>>> We used to be limited to a fairly small number of KVM memory slots,
>>> which effectively bounded non-vIOMMU DMA mappings, but that value is
>>> now 2^15, so we need to anticipate that we could see many more than a
>>> dozen mappings.
>>>   
>>
>> Even with 32k memory slots today we are still reduced on a handful. hv-balloon
>> and virtio-mem approaches though are the ones that may stress such limit IIUC
>> prior to starting migration.
>>
>>> Can we make the same argument that the overhead is negligible if a VM
>>> makes use of 10s of GB of virtio-mem with 2MB block size?
>>>
>>> But then on a 4KB host we're limited to 256 tracking entries, so
>>> wasting all that time and space on a runtime IOVATree is even more
>>> dubious.
>>>
>>> In fact, it doesn't really matter that vfio_listener_region_add and
>>> this potentially new listener come to the same result, as long as the
>>> new listener is a superset of the existing listener.   
>>
>> I am trying to put this in a way that's not too ugly to reuse the most between
>> vfio_listener_region_add() and the vfio_migration_mapping_add().
>>
>> For you to have an idea, here's so far how it looks thus far:
>>
>> https://github.com/jpemartins/qemu/commits/vfio-dirty-tracking
>>
>> Particularly this one:
>>
>> https://github.com/jpemartins/qemu/commit/3b11fa0e4faa0f9c0f42689a7367284a25d1b585
>>
>> vfio_get_section_iova_range() is where most of these checks are that are sort of
>> a subset of the ones in vfio_listener_region_add().
>>
>>> So I think we can
>>> simplify out a lot of the places we'd see duplication and bugs.  I'm
>>> not even really sure why we wouldn't simplify things further and only
>>> record a single range covering the low and high memory marks for a
>>> non-vIOMMU VMs, or potentially an approximation removing gaps of 1GB or
>>> more, for example.  Thanks,  
>>
>> Yes, for Qemu, to have one single artificial range with a computed min IOVA and
>> max IOVA is the simplest to get it implemented. It would avoid us maintaining an
>> IOVATree as you would only track min/max pair (maybe max_below).
>>
>> My concern with a reduced single range is 1) big holes in address space leading
>> to asking more than you need[*] and then 2) device dirty tracking limits e.g.
>> hardware may have upper limits, so you may prematurely exercise those. So giving
>> more choice to the vfio drivers to decide how to cope with the mapped address
>> space description looks to have a bit more longevity.
> 
> The fact that we don't know anything about the device dirty tracking
> limits worries me.  If QEMU reports the VM is migratable, ie. lacking
> migration blockers, then we really shouldn't have non-extraordinary
> things like the VM actually having a bigger address space than the
> device can support, or enabling a vIOMMU, suddenly make the VM
> non-migratable.
> 
Makes sense.

> If we only needed to worry about scenarios like the AMD hypertransport
> memory relocation, 

So far that's my major concern, considering it's still a 1T gap.

> then tracking ranges for 32-bit and 64-bit RAM
> separately would be an easy solution, we always have 1-2 ranges for the
> device to track.  That's still a big simplification from tracking every
> DMA mappings.
> 
I was too stuck on the naming on PC code that I thought it would be too x86
specific. But in reality we would be just covering 32-bit and 64-bit limits, so
it should cover everybody without being specific on a target.

The kernel (and device) will ultimately grab that info and adjust into its own
limits if needs to be split, as long as it can track what's requested.

That should work, and greatly simplify things here as you say. And later on for
vIOMMU we can expand the max limit to cover the 39-bit/48-bit intel max (or any
other IOMMU equivalent defined max).

> AIUI, we really can't even rely on the device supporting a full host
> page size worth of mappings, the uAPI only stipulates that the core
> kernel code will support such a request. 

Yes. Limited to LOG_MAX_RANGES, which is 256 ranges IIRC.

> So it seems prudent that
> userspace should conserve entries wherever it can.

Indeed.

> For the
> alternative, to provide ranges that closely match actual mappings, I
> think we'd need to be able to collapse IOVATree entries with the
> smallest gap when we reach the limit, and continue to collapse each time
> the driver rejects the number of ranges provided.  That's obviously
> much more complicated and I'd prefer to avoid it if there are easier
> approximations.
>

I think I start to like on the min/max {32,64} range limit approach given the
much less runtime overhead and complexity to maintain [while supporting the same
things].

>> Anyway the temptation with having a single range is that this can all go away if
>> the vfio_listener_region_add() tracks just min/max IOVA pair.
>>
>> Below scissors mark it's how this patch is looking like in the commit above
>> while being a full list of mappings. It's also stored here:
>>
>> https://github.com/jpemartins/qemu/commits/vfio-dirty-tracking
>>
>> I'll respond here with a patch on what it looks like with the range watermark
>> approach.
>>
>> 	Joao
>>
>> [0] AMD 1T boundary is what comes to mind, which on Qemu relocates memory above
>> 4G into after 1T.
>>
>> ------------------>8--------------------  
>>
>> From: Joao Martins <joao.m.martins@oracle.com>
>> Date: Wed, 22 Feb 2023 19:49:05 +0200
>> Subject: [PATCH wip 7/12] vfio/common: Record DMA mapped IOVA ranges
>>
>> According to the device DMA logging uAPI, IOVA ranges to be logged by
>> the device must be provided all at once upon DMA logging start.
>>
>> As preparation for the following patches which will add device dirty
>> page tracking, keep a record of all DMA mapped IOVA ranges so later they
>> can be used for DMA logging start.
>>
>> Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
>> This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>  hw/vfio/common.c              | 147 +++++++++++++++++++++++++++++++++-
>>  hw/vfio/trace-events          |   2 +
>>  include/hw/vfio/vfio-common.h |   4 +
>>  3 files changed, 150 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 655e8dbb74d4..17971e6dbaeb 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -44,6 +44,7 @@
>>  #include "migration/blocker.h"
>>  #include "migration/qemu-file.h"
>>  #include "sysemu/tpm.h"
>> +#include "qemu/iova-tree.h"
>>
>>  VFIOGroupList vfio_group_list =
>>      QLIST_HEAD_INITIALIZER(vfio_group_list);
>> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
>>      multiple_devices_migration_blocker = NULL;
>>  }
>>
>> +static bool vfio_have_giommu(VFIOContainer *container)
>> +{
>> +    return !QLIST_EMPTY(&container->giommu_list);
>> +}
> 
> I think it's the case, but can you confirm we build the giommu_list
> regardless of whether the vIOMMU is actually enabled?
> 
I think that is only non-empty when we have the first IOVA mappings e.g. on
IOMMU passthrough mode *I think* it's empty. Let me confirm.

Otherwise I'll have to find a TYPE_IOMMU_MEMORY_REGION object to determine if
the VM was configured with a vIOMMU or not. That is to create the LM blocker.

>> +
>>  static void vfio_set_migration_error(int err)
>>  {
>>      MigrationState *ms = migrate_get_current();
>> @@ -610,6 +616,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>          .iova = iova,
>>          .size = size,
>>      };
>> +    int ret;
>>
>>      if (!readonly) {
>>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>> @@ -626,8 +633,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>          return 0;
>>      }
>>
>> +    ret = -errno;
>>      error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
>> -    return -errno;
>> +
>> +    return ret;
>>  }
>>
>>  static void vfio_host_win_add(VFIOContainer *container,
>> @@ -1326,11 +1335,127 @@ static int vfio_set_dirty_page_tracking(VFIOContainer
>> *container, bool start)
>>      return ret;
>>  }
>>
>> +static bool vfio_get_section_iova_range(VFIOContainer *container,
>> +                                        MemoryRegionSection *section,
>> +                                        hwaddr *out_iova, hwaddr *out_end)
>> +{
>> +    Int128 llend, llsize;
>> +    hwaddr iova, end;
>> +
>> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>> +    llend = int128_make64(section->offset_within_address_space);
>> +    llend = int128_add(llend, section->size);
>> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
>> +
>> +    if (int128_ge(int128_make64(iova), llend)) {
>> +        return false;
>> +    }
>> +    end = int128_get64(int128_sub(llend, int128_one()));
>> +
>> +    if (memory_region_is_iommu(section->mr) ||
> 
> Shouldn't there already be a migration blocker in place preventing this
> from being possible?
> 
Yes. From my previous comment I am still working it out.

>> +        memory_region_has_ram_discard_manager(section->mr)) {
> 
> Are we claiming not to support virtio-mem VMs as well? 

That was not the intention. From explanation below I likely misunderstood the
unpopulated parts handling and included that check.

> The current
> comment in vfio/common.c that states we only want to map actually
> populated parts seems like it doesn't apply here, we'd want dirty
> tracking ranges to include these regardless.  Unless there's some
> reason virtio-mem changes are blocked during pre-copy.
> 
As far as I am aware, virtio-mem is deemed busy when !migration_is_idle(), hence
plug and unplug requests are blocked throughout migration (devices add/del are
also blocked during migration, so hotplug of memory/cpus/devices are also blocked).

Anyways your point still holds regardless, I'll drop the check.

>> +	return false;
>> +    }
>> +
>> +    llsize = int128_sub(llend, int128_make64(iova));
>> +
>> +    if (memory_region_is_ram_device(section->mr)) {
>> +        VFIOHostDMAWindow *hostwin;
>> +        hwaddr pgmask;
>> +
>> +        hostwin = vfio_find_hostwin(container, iova, end);
>> +        if (!hostwin) {
>> +            return false;
>> +        }
>> +
>> +	pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
>> +        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
>> +            return false;
>> +        }
>> +    }
> 
> ram_device is intended to be an address range on another device, so do
> we really need it in DMA dirty tracking?

I don't think so.

> ex. we don't include device
> BARs in the dirty bitmap, we expect modified device state to be
> reported by the device, so it seems like there's no case where we'd
> include this in the device dirty tracking ranges.
> 
/me nods

>> +
>> +    *out_iova = iova;
>> +    *out_end = int128_get64(llend);
>> +    return true;
>> +}
>> +
>> +static void vfio_migration_add_mapping(MemoryListener *listener,
>> +                                       MemoryRegionSection *section)
>> +{
>> +    VFIOContainer *container = container_of(listener, VFIOContainer,
>> mappings_listener);
>> +    hwaddr end = 0;
>> +    DMAMap map;
>> +    int ret;
>> +
>> +    if (vfio_have_giommu(container)) {
>> +        vfio_set_migration_error(-EOPNOTSUPP);
> 
> There should be a migration blocker that prevents this from ever being
> called in this case.
> 
Correct.

>> +        return;
>> +    }
>> +
>> +    if (!vfio_listener_valid_section(section) ||
>> +        !vfio_get_section_iova_range(container, section, &map.iova, &end)) {
>> +        return;
>> +    }
>> +
>> +    map.size = end - map.iova - 1; // IOVATree is inclusive, so subtract 1 from
>> size
>> +    map.perm = section->readonly ? IOMMU_RO : IOMMU_RW;
>> +
>> +    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
>> +        ret = iova_tree_insert(container->mappings, &map);
>> +        if (ret) {
>> +            if (ret == IOVA_ERR_INVALID) {
>> +                ret = -EINVAL;
>> +            } else if (ret == IOVA_ERR_OVERLAP) {
>> +                ret = -EEXIST;
>> +            }
>> +        }
>> +    }
>> +
>> +    trace_vfio_migration_mapping_add(map.iova, map.iova + map.size, ret);
>> +
>> +    if (ret)
>> +        vfio_set_migration_error(ret);
>> +    return;
>> +}
>> +
>> +static void vfio_migration_remove_mapping(MemoryListener *listener,
>> +                                          MemoryRegionSection *section)
>> +{
>> +    VFIOContainer *container = container_of(listener, VFIOContainer,
>> mappings_listener);
>> +    hwaddr end = 0;
>> +    DMAMap map;
>> +
>> +    if (vfio_have_giommu(container)) {
>> +        vfio_set_migration_error(-EOPNOTSUPP);
>> +        return;
>> +    }
>> +
>> +    if (!vfio_listener_valid_section(section) ||
>> +        !vfio_get_section_iova_range(container, section, &map.iova, &end)) {
>> +        return;
>> +    }
>> +
>> +    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
>> +        iova_tree_remove(container->mappings, map);
>> +    }
>> +
>> +    trace_vfio_migration_mapping_del(map.iova, map.iova + map.size);
>> +}
> 
> Why do we need a region_del callback?  We don't support modifying the
> dirty tracking ranges we've provided to the device.
> 

My intention with a region_del callback was for the simple case where migration
fails, or is cancelled and you want to try again later on, which could likely
mean a different min/max depending on setup on each retry. Given most operations
that change address space are blocked, this would work.

In the range alternative I was only clearing the min/max to zeroes.

>> +
>> +
>> +static const MemoryListener vfio_dirty_tracking_listener = {
>> +    .name = "vfio-migration",
>> +    .region_add = vfio_migration_add_mapping,
>> +    .region_del = vfio_migration_remove_mapping,
>> +};
>> +
>>  static void vfio_listener_log_global_start(MemoryListener *listener)
>>  {
>>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>      int ret;
>>
>> +    memory_listener_register(&container->mappings_listener, container->space->as);
>> +
>>      ret = vfio_set_dirty_page_tracking(container, true);
>>      if (ret) {
>>          vfio_set_migration_error(ret);
>> @@ -1346,6 +1471,8 @@ static void vfio_listener_log_global_stop(MemoryListener
>> *listener)
>>      if (ret) {
>>          vfio_set_migration_error(ret);
>>      }
>> +
>> +    memory_listener_unregister(&container->mappings_listener);
> 
> We don't have a way to update dirty tracking ranges for a device once
> dirty tracking is enabled, so what's the point of this listener running
> in more than a one-shot mode? 

See above.

> The only purpose of a listener
> continuing to run seems like it would be to generate an error for
> untracked ranges and either generate a migration error or mark them
> perpetually dirty.
> 
True for vIOMMU. But my intention was for "migration failure and later retry"
case. I am not sure we should be outright deleting what we requested tracking.
But we shouldn't be changing it for sure, yes.

I can delete the region_del callback, and on migration (re)start I clear/destroy
mapping tracking info if there was one there already.

>>  }
>>
>>  static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>> @@ -2172,16 +2299,24 @@ static int vfio_connect_container(VFIOGroup *group,
>> AddressSpace *as,
>>      QLIST_INIT(&container->giommu_list);
>>      QLIST_INIT(&container->hostwin_list);
>>      QLIST_INIT(&container->vrdl_list);
>> +    container->mappings = iova_tree_new();
>> +    if (!container->mappings) {
>> +        error_setg(errp, "Cannot allocate DMA mappings tree");
>> +        ret = -ENOMEM;
>> +        goto free_container_exit;
>> +    }
>> +    qemu_mutex_init(&container->mappings_mutex);
>> +    container->mappings_listener = vfio_dirty_tracking_listener;
> 
> This all seems like code that would only be necessary before starting
> the listener.
> 
I can move it there.

>>
>>      ret = vfio_init_container(container, group->fd, errp);
>>      if (ret) {
>> -        goto free_container_exit;
>> +        goto destroy_mappings_exit;
>>      }
>>
>>      ret = vfio_ram_block_discard_disable(container, true);
>>      if (ret) {
>>          error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
>> -        goto free_container_exit;
>> +        goto destroy_mappings_exit;
>>      }
>>
>>      switch (container->iommu_type) {
>> @@ -2317,6 +2452,10 @@ listener_release_exit:
>>  enable_discards_exit:
>>      vfio_ram_block_discard_disable(container, false);
>>
>> +destroy_mappings_exit:
>> +    qemu_mutex_destroy(&container->mappings_mutex);
>> +    iova_tree_destroy(container->mappings);
>> +
>>  free_container_exit:
>>      g_free(container);
>>
>> @@ -2371,6 +2510,8 @@ static void vfio_disconnect_container(VFIOGroup *group)
>>          }
>>
>>          trace_vfio_disconnect_container(container->fd);
>> +        qemu_mutex_destroy(&container->mappings_mutex);
>> +        iova_tree_destroy(container->mappings);
> 
> The IOVATree should be destroyed as soon as we're done processing the
> result upon starting logging.  It serves no purpose to keep it around.
> 
OK

> Comparing with the follow-up, setting {min,max}_tracking_iova, many of
> the same comments apply.

/me nods

> Both of these are only preparing for the
> question of what do we actually do with this data.  In the IOVATree
> approach, we have more fine grained information, but we can also exceed
> what the device supports and we need to be able to handle that.  If our
> fallback is to simply identify the min and max based on the IOVATree,
> and we expect that to work better than the more granular approach, why
> not start with just min/max?  If we expect there's value to the more
> granular approach, then when not proceed to collapse the IOVATree until
> we find a set of ranges the device can support?  Thanks,
> 

Your proposed solution for the HT address space gap handles my bigger concern.
I think it makes more sense to adopt a simplistic approach. Specially as we also
know it's applicable to the vIOMMU case too that a later series will handle, and
 less fragile against a limited number of ranges UAPI. On a second
consideration, while a two-range watermark isn't faithful to the real guest
address space it still lets the VFIO driver pick and split it to accomodate to
its own requirements. The range approach also doesn't affect how we ask the
logging reports, which are still honoring the real address space (hence no
different in runtime bitmap sizes).

With the tree approach, I fear that collapsing the tree is adding too much
complexity already to accomodate the reduced number of ranges we can pass, in
addition to the runtime overhead that it implies (specially for virtio-mem like
cases). I am happy to ressurect that approach again, should it be deemed required.

Unless there's objections, we should be able to send v3 of this series with all
the comments above (and those already given in this series) with the min/max
range approach, *I hope* no later than tomorrow.

> Alex
> 
>>          close(container->fd);
>>          g_free(container);
>>
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 669d9fe07cd9..c92eaadcc7c4 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -104,6 +104,8 @@ vfio_known_safe_misalignment(const char *name, uint64_t
>> iova, uint64_t offset_wi
>>  vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t
>> size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not
>> aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING
>> region_del 0x%"PRIx64" - 0x%"PRIx64
>>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64"
>> - 0x%"PRIx64
>> +vfio_migration_mapping_add(uint64_t start, uint64_t end, int err) "mapping_add
>> 0x%"PRIx64" - 0x%"PRIx64" err=%d"
>> +vfio_migration_mapping_del(uint64_t start, uint64_t end) "mapping_del
>> 0x%"PRIx64" - 0x%"PRIx64
>>  vfio_disconnect_container(int fd) "close container->fd=%d"
>>  vfio_put_group(int fd) "close group->fd=%d"
>>  vfio_get_device(const char * name, unsigned int flags, unsigned int
>> num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 87524c64a443..48951da11ab4 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -23,6 +23,7 @@
>>
>>  #include "exec/memory.h"
>>  #include "qemu/queue.h"
>> +#include "qemu/iova-tree.h"
>>  #include "qemu/notify.h"
>>  #include "ui/console.h"
>>  #include "hw/display/ramfb.h"
>> @@ -81,6 +82,7 @@ typedef struct VFIOContainer {
>>      int fd; /* /dev/vfio/vfio, empowered by the attached groups */
>>      MemoryListener listener;
>>      MemoryListener prereg_listener;
>> +    MemoryListener mappings_listener;
>>      unsigned iommu_type;
>>      Error *error;
>>      bool initialized;
>> @@ -89,6 +91,8 @@ typedef struct VFIOContainer {
>>      uint64_t max_dirty_bitmap_size;
>>      unsigned long pgsizes;
>>      unsigned int dma_max_mappings;
>> +    IOVATree *mappings;
>> +    QemuMutex mappings_mutex;
>>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>>      QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
>>      QLIST_HEAD(, VFIOGroup) group_list;
>> --
>> 2.17.2
>>
> 


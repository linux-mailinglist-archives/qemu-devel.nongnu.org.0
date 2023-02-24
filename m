Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81166A2252
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:28:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdj3-0000st-PY; Fri, 24 Feb 2023 14:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVdj2-0000sh-5f
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:27:24 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVdj0-0006d7-2O
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:27:23 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31OHiQvR003590; Fri, 24 Feb 2023 19:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=syf89hWq69QydrctC1MYyi+7QuPpcnJ69LcE89MOj/U=;
 b=BaNyUxvmyq7DBuwI9amM/dJ3uJy8hGBQ5Lyq2moIP/b1W2F95rPzULPxxV1EL71+JNab
 B9jZg/YRqnsYffvmjaQTYsu6xxpQAAmFouweD42cyxU+4yJWauG39fsoc5LRJnqB//71
 JwIbcmvdInmR61jXoiHMJDLbSuaJeVVpTKTQcf/n+XWour8OQrYOlTbx3/OUP8Ku7sZl
 xAd344Uiut5kCHXyg5ewakNk8LMRlyg09YZComYJmthJN1nVEFSnZ+DI6vqavvc+73Lh
 csiuEHeJlRQyr2x9J0l9sOTGsoB3XxMyhJURF2cHhLJAX2KUwrMZoHdumNcHH5WLpxPI 4w== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntn90wxe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 19:27:16 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31OJ1LDA017953; Fri, 24 Feb 2023 19:27:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn4a5r9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 19:27:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TB01rGDv7NJSCJmcOyNiNIIuXpwt95P+YNyTP8yOsy7df3Pl9IA11jD8ti1tmY5YFrHZV0WUQVxWdgxSl3a7cJgADAVSyJyW7KG7MeBjuZutA9gTbFHFrZgSU5yh/UFWf5wX/lxWAeYBPMGSyw2YDNrDnuD8mrJH4QKIx87at4Hy//+5ER5ciDnxEfCtO9sZi8UPexacNhdDgG4zHF0RxYWIe1IchtD79A5vJc8S93Mb6j4B1fvIQwupsdT7kSPX+Ooxtz0ItPmHVhJH70GmGwrsYkqEDwWKHVjr1rgg8YORa6tYD1sRhHto9/fq9oQTIbF7fat0ZdvHmr9GgFBVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syf89hWq69QydrctC1MYyi+7QuPpcnJ69LcE89MOj/U=;
 b=OC9HOMgw5DfaKLRQRzsa0RmiiJtoDXMocWKhdHTbuHDKquRakyEf1HVU0NPculyFdSu+3DeZHyq3Jd1WlcE3x7LYTDVzdBGaZFv6cjPXIlsicPmf7UwpmhYFJfBjYApWrSLCjPektMTbgilgbQ5llGNSqO4zM2w6/9hNgsYtXJWPVM81PaXaVXrAIMLnV0N3ome7/PiIR4CDVy/Ui63vtRkgs9C4pML8TibuDZFBLBJ9zuT/qdYDgonWNcry7SletBiraDIRqSKTtAm/DYqE74Im7dLOe7CkCfEMSu3kjyi557yn7BelnpTomwJb7EYA2dVZHISxy16IgWS0SGbYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syf89hWq69QydrctC1MYyi+7QuPpcnJ69LcE89MOj/U=;
 b=RC1vtEwOjHdN2ZeYaQgyenNbrgmlIQw7MNJJQDRRhmAyroCilLA+oEZgJAvnJF18TkFudry9yfdKCDOK+Z66pM0VPU/lAwnsK/EQaGoSo1MjOPX/OrgmabXDYRmMYiCA39RmSU66kltYyc7NE8H0S1GEBnB5RNcJgasktNfTef4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SN4PR10MB5639.namprd10.prod.outlook.com (2603:10b6:806:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.11; Fri, 24 Feb
 2023 19:27:13 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.011; Fri, 24 Feb 2023
 19:27:13 +0000
Message-ID: <7db50fd1-014e-6ee1-b224-5677a98093ce@oracle.com>
Date: Fri, 24 Feb 2023 19:26:53 +0000
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
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
 <20230222135512.51b62650.alex.williamson@redhat.com>
 <79b05864-3feb-8e3c-ab03-7c656027741c@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <79b05864-3feb-8e3c-ab03-7c656027741c@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SN4PR10MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: ca635edb-a88b-4472-e65b-08db169d2194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SnRsN+wnpFMTC24TE2lt24QSWu2ag3Rhktvs6ZJQj9fz419zyZGKTuxJd5xHcJ1p32kJ3bbel+NTdh4m1H3wm8Dlm5EDbx0URemMWmBsNkejApvEWHrFD0KhzDfHWdwaEwFbk6cUqye76df2PfNu8sy6dUDWhYrQLP+OyifdUL3KhlAzrIDqEq5UDeED1WvK0CrolGswPcYZZcFIhposkMlav9HUITF4QQSXI5Kgzyg3VOzihNc6uUwoGezM3WrHKkvQwgGN23lMXCrel4CjEKrItX12B/xoKjw7GlZiLWyemCsUxE2iSl4RzPKDaeWXE36AuJjuZ+qvT/kYhQcYPh5ll38W+cdbUE2ZeieRYGDsCAcXdqGJgaEgank3DinZFT8AjkQryhR4KLRxYzmDXiYKkqB6HkV+HtgRcjMXMFbOv/6rJwXmPMJW8WmCRZBUiNF2Knj9FmDSudP8NfvBIVhOfD3RKSK005P+ErCRTLR3sMuksbasMvI4WzUTI0n/YxbuvcnggnLaJm/jJ0+QYhGhnOIVHe4v5eASmkDtd0WctMYRrJUeyccBmdSEx5By8sf/oJf+0mK75H94A9G2rAZxsnIlgOF+zZgO2nR1VKI7tK7TPTC/BXixoAjH8Ou966ejFy/TiiT25KFQZXl8cB14gTyIul4mG2lGLv8tEbZL2TqAo+IE3Ld0PK+ScbXIHSeJM0FkMxiYQgJNj3TM4VbFgf8ELMu7j5OI/m66DoLesyaE3uN/wyPnZ1Kq486
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(83380400001)(36756003)(7416002)(31686004)(2906002)(53546011)(6666004)(6512007)(86362001)(6506007)(54906003)(31696002)(478600001)(110136005)(8936002)(41300700001)(6486002)(966005)(186003)(26005)(2616005)(66556008)(5660300002)(4326008)(8676002)(66476007)(316002)(66946007)(38100700002)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG5zbVBla2ZUMlFCOTY2bHhYZFhjRXpyMVlkd2VIeWhhRlVEcUJZRUNUM1RQ?=
 =?utf-8?B?RFEvVlVYclhsbWRZWEtQR0VuSUNNVyt0ZWNFS1EyRXFCUFBibXhKUGd0Ujcz?=
 =?utf-8?B?RTAvYTJVTzFCSVorbHRjUlZCSVdoVVpFU21LUFM2V0dCM0FrKzBDdU1UY1J4?=
 =?utf-8?B?M3g1NjEwNTRFM0pVVkhmTDBrUG5keEluNVFSckZteEc5MG9XVkxWcVByNVN2?=
 =?utf-8?B?OWRVU3lyb3hzNElZZTIxekJ5Z2wxWFQ0Q3l2dXBHQitFQzZJZEEzWVFkU2pn?=
 =?utf-8?B?b0VKak91V2dFSkxZM2E1czI2YnZ0Nko5Uk1jUDh4bTM0RVR2dUJBU1lrQUdk?=
 =?utf-8?B?QUloQlhqVENBUHptUnhlVFlLUWtoQk9vRXZxTEIxSEU1MzVaZkY2NFJ3c0sw?=
 =?utf-8?B?anpuUHB3L3I0dFNIVndRdEsvT2hyTnlyd1d5cTlhakthaWE1bFZpM3BvclBa?=
 =?utf-8?B?S01sdGtwa0lqYjJtaHRWTEdoajVoVHliVXJ5ZFVrQVdkaXFYdmFiWkN6OUFC?=
 =?utf-8?B?VkhzUGhVdHBBKzdzVy92aSt3WUkraGt3a2VPa1o1cXhiclQ3N0RrZWlHRE51?=
 =?utf-8?B?dlQ1OTFPNVpFMURTYnJzREczQi9qL0JDV00rS0hPZGh4VWQ1a0RYZEJ0UEs1?=
 =?utf-8?B?enFrUXVOUmpsdkRpTTB2YTdyT3RtMW9nRkwzTHF2Yit0N2NUdlF2ZmNhdjFB?=
 =?utf-8?B?RUYyREZRT01NOFUvUUIreGpEWmdpdjJIQll4S3FSYXVaTitEY0xha0lqTUF5?=
 =?utf-8?B?aWR3am1HOEVwcjRCdUxTempaTGgvMVVtSjJPYWpRY3d6UllqUGMydHRYUFg5?=
 =?utf-8?B?b3I5ZnE4T1JFaEZBOFV3VzdWay9GMEM4SXkxa25udTZaeXF2ZTIySHVGR2h6?=
 =?utf-8?B?T2Z5QUFpYmorcWFwSFF5NHpwYjQ2K3NBcSt6c2lzaW5qc0ttUFRQSnRkZTlh?=
 =?utf-8?B?WUU5eENNTHlDNGRwN1lSS0NpZnlSU2NsL0JPeDFGQVFzTzN1MVRjUkZZVUM1?=
 =?utf-8?B?Sjg0ODg0TGZ6WHh2aGd0MmhnV2xzUlpuWlA2TlB4Z2FSSVZYOEUwVmxFZ3Jx?=
 =?utf-8?B?WTdST1U4N3BaL0FsdVpLN0VkMmw0Vktydkl3SkZiTkpzZHJvN0tpZ254ajR1?=
 =?utf-8?B?bEJuRDRDdDJITUpWTk5UaFN1NitVdHlxYlpwR1ZZenhkVXN3WFJoK1gxU3lQ?=
 =?utf-8?B?TGJHdXRGdERDUGhEb0JWZHkzd1J0dVJxNG1NSjhsVFdZWFhtTFQ4NjloaWRI?=
 =?utf-8?B?TWZ5MHUvcUpxV3hZVVh1SUp4UmVWNUx6ZVRlSlloVnpwQWNxazJkd0FWVStS?=
 =?utf-8?B?SW1ha1FtM0RVQUszc2JSMXJsc2RFeFIrWGJxamVBV1JadlFUNmFmV2dMN2ti?=
 =?utf-8?B?NDh6QzhtRDVxYm5sNWlxZkNwYWxjYlVwNWI0RTcrU2hzK3RvczhERCtCTkV2?=
 =?utf-8?B?WElLWURTVzlXUzd2T0JhczRPUVJEYmluaC9PS09jdlMwUVZ1OSs0QVU0eUt5?=
 =?utf-8?B?R05veTNyYW5BdFJ6aGVmV3Y5aEUram1BNFBUYy9aa3VmbGFnMHpQa2JWZzlh?=
 =?utf-8?B?bDk5YklwNFdXQWdXRFpGS3l6QjFnVk9Na3l2OWJmRVROdUw4ZUFuUjE3dzFF?=
 =?utf-8?B?bG5DOThSQnc5UXJObEQzdGhHSVBhK2dBc1JrWGM3SVBzVXhONm8rQmE3T2dR?=
 =?utf-8?B?dGF1OVkwQlZ2MDRWVTBHR2tjUVN1VnZFeWlBaUNyb3JzbkY1MTlPNFEyL0N2?=
 =?utf-8?B?OTQzOGpTclJzNjBsZlhhKzRSQnFzNGFrSGZVWmJtSDZWNEFuS0ZhbTV3amJJ?=
 =?utf-8?B?aGZ4blpjT01GaG5UclE5NGUwbElET1hPTm1EWW9KcWt5ajZLZUxTdHhGYkVi?=
 =?utf-8?B?Y3BQTUc3WnBlWTZJaFRoUXREV2tKZklFTVEwNjBVMzM2SVBDeDMrbG5QZnlE?=
 =?utf-8?B?dHJPaDIwYXhHMGZObHM3ODlRT05BT2lPOHpIOWRPeWhuVkszWGkvaUdia2xF?=
 =?utf-8?B?cGl4Rm4xY00wS3pNTTFBbmxKZjZ3RURQKzdrM0FkZVd4YXVhVlFvbS9oSjBz?=
 =?utf-8?B?VW1NSGQ4OGhxbVZpT0ZhWkc4Nk1pbjRUcTcvZnFEdTZoKzRoaEM5Y0llc01D?=
 =?utf-8?B?eDlLNUtBVEQ3ZktxQ2lENThST0pVV0toL2pha3ZlOHRpVHJvNFVKVDFnY0Fw?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: M9DtSFoeyPcUPXLUIldNXYc6vfolPHrCp5sSnjsyf4p+3yNbYRM8fXkcsx7m7oSYOjqhmu5beUrHDCtoYz+ABOGGXhNvIMg9g8DrVEW0RIlSZeDTnFAWL31zAQQAuVuGKPd8bdzWxda5K71Q40+0BXC7jY5bA9zfmIDYe4MPUF+UM3k8QbxTYwg5PsHRcDPY+wU1ThUrHl10MJ8VGZUzZ0VgWKEzAs7tGSLNh0GBskeQVhmKf3x0imQhegUPpKvl7ZFJkhMC9QywQfQnfky5gQiPyuG0saszrWIvWMz1osKNv4zyBttcQiGvgJNnfOeapRlYUO4c+S5rN9Z3YS82A/JWX9DH4Z8YG011jxvb1WEJrWjII78ssHcTDkYKmwojGK0eRwltA4g0pkE5itrUOIsO92BMZyo+kMpfqlcwl5xxzzaH89OOcjWrnPAZLzQRQmGHYnGRrgSAahM9wu1F0YK3gR4+tFrRtmu9ni8iRkUHdDMUR8oS61WJaiSLF2W4pKVDRAXjpHP/N6LdmdSx+l8Kthpcemlr6rbCtp+hzL7t6dKBguWZo89MlQv0v+M+ahS0hlut4Wzmkskn/irnguREkx8mqPbFx2Tn2fd2EpwBh8tCpusVsS47CaueQN6iApoiinIiAhYYHe/W8cRh/uSiZcmdssq+EKwG0CTUrbSGIT4kYyDCPMIipRqPgazDi/Zqh69nzdkwRmNNGiUOMARJhVST9slm1hv/TNgVtAq5WfwAJ9f3gtIFL6oRUcn6EuJDi25QC8mdV/JLwA1wZ2Pn8so/+5i7UWq1W9DHS0RNBdVDhTsU2qNxN89DXRNAbma5yAzVh1izuLvSozYZhIPVHwIjrWHo5XyrN0pgQdOgmPwT2RneeoZerGtD6jUatyqBwUQmHvogqbEOdaI8QA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca635edb-a88b-4472-e65b-08db169d2194
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 19:27:13.6046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFHfhfqjzCOL19PPDBw2hoFcigVihJZ79UfO3rkULH7AwUSB2KXN7CbzyrZYgLeVgPoxvtKCAgzehtAD7cGAIhighQdEyiQY/NLEhEGX/nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5639
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240153
X-Proofpoint-ORIG-GUID: ckZq6iS2U7wwGJVs0VqAoxsHeQk7Zr44
X-Proofpoint-GUID: ckZq6iS2U7wwGJVs0VqAoxsHeQk7Zr44
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



On 23/02/2023 14:56, Avihai Horon wrote:
> On 22/02/2023 22:55, Alex Williamson wrote:
>> There are various errors running this through the CI on gitlab.
>>
>> This one seems bogus but needs to be resolved regardless:
>>
>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940731
>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>> 2786s390x-linux-gnu-gcc -m64 -Ilibqemu-aarch64-softmmu.fa.p -I. -I..
>> -Itarget/arm -I../target/arm -Iqapi -Itrace -Iui -Iui/shader
>> -I/usr/include/pixman-1 -I/usr/include/capstone -I/usr/include/glib-2.0
>> -I/usr/lib/s390x-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -Wall
>> -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
>> /builds/alex.williamson/qemu/linux-headers -isystem linux-headers -iquote .
>> -iquote /builds/alex.williamson/qemu -iquote
>> /builds/alex.williamson/qemu/include -iquote
>> /builds/alex.williamson/qemu/tcg/s390x -pthread -U_FORTIFY_SOURCE
>> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
>> -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings
>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>> -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security
>> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
>> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
>> -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-value
>> -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers
>> -isystemlinux-headers -DNEED_CPU_H
>> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF
>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o
>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c ../hw/vfio/common.c
>> 2787../hw/vfio/common.c: In function ‘vfio_listener_log_global_start’:
>> 2788../hw/vfio/common.c:1772:8: error: ‘ret’ may be used uninitialized in this
>> function [-Werror=maybe-uninitialized]
>> 2789 1772 |     if (ret) {
>> 2790      |        ^
>>
>> 32-bit builds have some actual errors though:
>>
>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940719
>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>> 2601cc -m32 -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. -Itarget/arm
>> -I../target/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1
>> -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/sysprof-4
>> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
>> -isystem /builds/alex.williamson/qemu/linux-headers -isystem linux-headers
>> -iquote . -iquote /builds/alex.williamson/qemu -iquote
>> /builds/alex.williamson/qemu/include -iquote
>> /builds/alex.williamson/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
>> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
>> -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings
>> -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
>> -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security
>> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
>> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
>> -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-value
>> -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers
>> -isystemlinux-headers -DNEED_CPU_H
>> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF
>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o
>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c ../hw/vfio/common.c
>> 2602../hw/vfio/common.c: In function
>> 'vfio_device_feature_dma_logging_start_create':
>> 2603../hw/vfio/common.c:1572:27: error: cast from pointer to integer of
>> different size [-Werror=pointer-to-int-cast]
>> 2604 1572 |         control->ranges = (uint64_t)ranges;
>> 2605      |                           ^
>> 2606../hw/vfio/common.c:1596:23: error: cast from pointer to integer of
>> different size [-Werror=pointer-to-int-cast]
>> 2607 1596 |     control->ranges = (uint64_t)ranges;
>> 2608      |                       ^
>> 2609../hw/vfio/common.c: In function
>> 'vfio_device_feature_dma_logging_start_destroy':
>> 2610../hw/vfio/common.c:1620:9: error: cast to pointer from integer of
>> different size [-Werror=int-to-pointer-cast]
>> 2611 1620 |         (struct vfio_device_feature_dma_logging_range
>> *)control->ranges;
>> 2612      |         ^
>> 2613../hw/vfio/common.c: In function 'vfio_device_dma_logging_report':
>> 2614../hw/vfio/common.c:1810:22: error: cast from pointer to integer of
>> different size [-Werror=pointer-to-int-cast]
>> 2615 1810 |     report->bitmap = (uint64_t)bitmap;
>> 2616      |                      ^
> 
> Sure, I will fix these errors.

Just a thought: should the pre-copy series be moved towards the end of this
series, given that it's more of an improvement of downtime than a must-have like
dirty tracking?

	Joao


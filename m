Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58816A7837
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 01:09:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXWUT-0001EF-F1; Wed, 01 Mar 2023 19:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXWUO-0001Dw-R2
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 19:08:05 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pXWUH-0003xF-OJ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 19:08:04 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321MrSJK030590; Thu, 2 Mar 2023 00:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=d6AjIsEmH2JhwAd4hZTQLV9amOcM4m20ClqRvDDVo4Q=;
 b=DDXVu41IA/2F8I1kNppqXAPiHJmAUepmH4CORy2gw3QYO2fHCGOzoNUjFeHViTS4P05G
 ON2f3vUkPJj1Z4UHQqGnVOgW+ucz5O+WLeATE9pnyYT13ebSmx10qTeig35TepYksaJk
 6flTKHAF7HaUBaJ7eb1QulO3OadzFgM6pW+xHlwgieQaZX4AnchgIeSN1CLekNQ69BHk
 Y+pf0XJzZJmJZVRJ67cx1vtDNx9NIaaS7CnnmymG+RkvZtFZg5GcJQ2IrSogO5wwfyRY
 zFrzEaSVfgQA16lCa8K1VWC3Ln2rF5kiDdACuj7/1UdQkfKTf7EqL+ABnmG3yQ8oozRG Yg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb9ajbx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 00:07:49 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 321M21qL028718; Thu, 2 Mar 2023 00:07:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sfc2hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 00:07:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q37Q4+/8Va1X942OZseXawq7fK7DMVk/lXvaF1Eg+zPi5vn2uaXMOCfP0KMuLJiKSrxVHY6qp1F87amSQLWRMgYHFF9nLGr+UVUHxzc/PQidr3ZlXt9lxK4Bo2XWqRP+IOtKM6us7tsViyWHNi86f1sU/FQPVCIHOz5fzM5Qj9OZmWMhs61FiUa7ZPYhlVUHVRlgYRGBk8924+/bfIgadWgCY7R+IqjICdm4+c9I1JhTPKwfL9vcr8jlvqEGupQ7U5SuIHsZ0SiN0pmPY5wwtrpwDiuC0NWMODND/YPJ54DdH3G5fIxqCednQmRURuf+qOFHE7H4EjXh7h4LFcBXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6AjIsEmH2JhwAd4hZTQLV9amOcM4m20ClqRvDDVo4Q=;
 b=LPeoLg7Xz3yBfFWyENI98oyLVlTW3547kEd9Vv+vShkeD6DrMFKa9ABAhKBY2XYAv3tTrbb6o7y+rG8y+uw58EYA12hlEy7WEoF92a8aWtrI80l/FiBFRRfStucRlPpcBTmYJPsqW7/vGyPY6cMmhsGh2u6gkdgpFC+qoPqXC/0KFFkh8IdTcRJNkWKf4+fKu2Qze9UyFAOo/GDwoGziLkgk3pXD5HWQHJCsJf7OIZU7kgsGBBxMpntbhWYOFtRO13HS6cYJK0rsJ4B506dyIgY3B5oFvlsESOoKyeGdY89Z5d+ncjuODR6O+BY1mnzEqqiD8W2wTAIKQzRP4iyp3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6AjIsEmH2JhwAd4hZTQLV9amOcM4m20ClqRvDDVo4Q=;
 b=Ko/4wNcY6l/u1XCzwKvl3KZKNpc83LOkKXKChGfLVmiHxUbha1ACwHylUqCutdA5YitYKoSSTts8YuRH3+XpCt2M8y0i0k1tp+OrEw9qg9oGacMg+j5M9efYg5UiTnivJGJi/AYRbmrs5cu+emleYwwcfWEbiCCbzo965oBee2E=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SN7PR10MB6593.namprd10.prod.outlook.com (2603:10b6:806:2a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 00:07:45 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 00:07:45 +0000
Message-ID: <114233e8-bdb8-21f5-ade9-0163658feb84@oracle.com>
Date: Thu, 2 Mar 2023 00:07:35 +0000
From: Joao Martins <joao.m.martins@oracle.com>
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
Content-Language: en-US
In-Reply-To: <20230228133653.2f911490.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18)
 To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SN7PR10MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f0a7a6-94e9-4b81-74f6-08db1ab22667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rNqwfXnFFfiLfTRG62xqTzpf7HmuJUdf6NHXpTwWV+vvSZD+U7lk/nuDzgPgI6pbjksFv//bs8BYib2EFfvbRyudEQx98p+IXg3n7Kmrg4R1J+HIg0BGfjwSTw+xwWSvkKKrpaVHg4syU57hUrLv6akGW+Q9Ux60+qW+SFAiCya5dcVA90EkaHKH1tHKFjHEVPk9yFmK3BR+jeN76+ZkbpT35/DIpwDN7RwEodijIsIR9lkaEvQq3Sp8smry921cGwG8ekAGQHEdYjbud9SRKoR3CcWWwmpmzB03HNzhEmGLgB7yR1oVxTYoTZsad5ogMRRyFbAM53YJgqSyjgylgs9WHwBvJ3B0/ZdQzZhsLp6ewthXJMordb42UTdRx3sh37qmEIpyZ3bfbQc15OH384fAL+E7jNBiAZdnedKm4DaGa/xlwuaggkL7KMcm85A5+CyiF7+jehq32w3vkcM/Hxsgp94dtpJnTzLSZpkFnTWuect16fgayryIyIsHh4caoylPEKTOrYitxP2TPuBTA+PZjlper034sQC4k56uclCOgxNomZ7Ppzr6N8e/t4RFbo9/9kepAkHBAAI59hplQVd2AMLMJxArn/qdqWJIryS4NGKJEAsIQEBWKkahiTbEVTyzQJEYTuqVnDvYP0LYQSOW2FM4qZJXTcR+ZGWSR7ShfH6o9CP7IDXrMG5FPbktWHjNjpvnN02DwomNf6JYU3o0fNG7j/sh9hT6IzdhMIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199018)(66899018)(31686004)(66476007)(36756003)(8676002)(6916009)(41300700001)(8936002)(66946007)(66556008)(5660300002)(30864003)(2906002)(4326008)(7416002)(38100700002)(31696002)(86362001)(6486002)(966005)(316002)(478600001)(6666004)(54906003)(83380400001)(186003)(6512007)(2616005)(53546011)(26005)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STRVbXBHVG5qbEdCeDZjZndxSnVjYTU3c1d4RXhxODFYa05mUzFjM2VjRitQ?=
 =?utf-8?B?dVV2SXloSnd3NEYxcEdHVzRsU2lTY0c2RGVSdWV1eUFpRVFmSDVBVk4vanht?=
 =?utf-8?B?TDNZSUFRU2tlUndvaU82ZE5MTVNsOHZuS2Mrb2gvSHNzQnFNWTQ2TnRHT2xk?=
 =?utf-8?B?N3krYVczYUs4bzNPRTNIa1dzS0JSZ0lhYnNnWXJ5WlpRMlRFNTVzMVZhWEp3?=
 =?utf-8?B?bWJFN215V0JRMnpCWGkwalV0c1kxcTMxeDdMeUQzc0NBNG1RbStybG9hMjNx?=
 =?utf-8?B?ZmpwbUpDUmZ3ZTJsUUhxNklLWG1vSHRRLzZSWTRUd3ZSd3B0REw5Rk15VE1i?=
 =?utf-8?B?WFBOalc4bDdydVpQaG9icTdTQkROUHRXdlJqbzQ2enA1ZmJHdFR1TS94V2hT?=
 =?utf-8?B?Ykd1N0xGMnVqelpWNDBGUjdOTGxjRTg3TEQxUEE4RWlRU3owU2p1RGpQRU4w?=
 =?utf-8?B?bXFCQnh3M3lEM0l2SXowQmVHWnlSM3E5eER5ZVBSNTBUbExKRUI1bGVicGpp?=
 =?utf-8?B?S0psLy9pcG5mRVZIdkk2bVFPMEV4cEdyaW1LTnNGbHVVN2t2b1pZN0t0Uk80?=
 =?utf-8?B?TFlsbGFjNW5wM2R4dURzdURDNjNPRlpocXo5NS9sVG1KVi9yZmM0NmFNakFS?=
 =?utf-8?B?TnlnMUlFQ3RRdVl1eEloWnAwWEZFSVNYZ3hEL0JWb3kxbDIzQXVBbmxqSlV5?=
 =?utf-8?B?NXhDL2ZkYlYwc0VFM29xY0FydUhuL1ZFaTJ4REhQSmFQQzNjMFVwNnJTTzd2?=
 =?utf-8?B?aGVSK2Y3ZzhRR2gzQ0ZSVnFBSERMNFpuYVByL2sxZi9Mc0Z0K0tWRy9EQk5Q?=
 =?utf-8?B?N2VMRXFLa1cwZndUUGZaZjh6MGpJZVhFbW44UHpZUHZxYVVRVzV1cDVGVGNW?=
 =?utf-8?B?eTU4b2JpTDFWUUROMUs0RGR0S2dyOGFnYjQ5R0J1L0thZmFCVWNUU2xQc2M1?=
 =?utf-8?B?MjhFcWgwZ0xRejNZSHRyZ1FtTVN5anVCajZtTTJSVEpvMzNXMTFac05xdnda?=
 =?utf-8?B?eGFWa2VVL3lWOVB4NXlmVmszRjFDYWt6dHcrcTc1NUF1cThRWnN3V0FGdVZi?=
 =?utf-8?B?aXpUbVdINno3bGZQM2Y2THlqNlR2WGxGV28zTEdPM0wwL2pWU2xWMEdzYlY4?=
 =?utf-8?B?TWNkZ0pZbDVMU0xacEQ4QkJCRlZCamxVby9nVGdUZFlBZVc3ZmlvSlVDVDBt?=
 =?utf-8?B?bTlOYVk2UEdhZlpYU1hkVmphYnN4cElhSkhIdTVjTlNLOStIbGZ1YnZrbmNB?=
 =?utf-8?B?NjRGWGNyUTlnUEJjNTkyYmZ5anVpN2F1K1ZVM3RaR01yTFBhbjlZRlpZRHpm?=
 =?utf-8?B?S2RjZDFFVGFXWFpWaHNSaVJPWnc0MnBLamxRbU1FLzVxZnQzaVlFK1pvQlZR?=
 =?utf-8?B?SW5CVzZjSUZWdTNCQStlcU4rS2xtb25IZGNISnRmZkJPWjhIL0JpZHd4WTRT?=
 =?utf-8?B?Q3BrbU5uZVlmdEpwdVBHUUtkc0xDNHlkSWZwQkh0Y25seGtOWmx3VFEySUx5?=
 =?utf-8?B?ZFdZNXBQTkJIazR2QTdZNVBvTmdzS1VoSEJNMEV1ekdGR01DWXUxRlkzT2FJ?=
 =?utf-8?B?ZDhpWTQ0QnhjVHhncmpXZFVGSTFScS8vQkhlUVQ1UG9tRGRiNjIyVnZwS1JY?=
 =?utf-8?B?Vy82bFprYXhwdldzWWNkc01FSXhOYkZOdnE1V251T3kycmJDQlBXOFlLUHJi?=
 =?utf-8?B?UGVYOHluc1lVQkN5MnpMMXIxMUJKb0I4Z29pZU05QnZ4UnVCWjk0VU5oRDlK?=
 =?utf-8?B?ZE5tT0R6TUozVWE4RWk3KzdYZU9aclBIUVMrbFdZV2xEcmtnUmhFNnlyZElD?=
 =?utf-8?B?YmRKZjN6UUdPUEV1K2ZOL1JsazFJeWV0bk01MFpXV0liRTBRelZRZnNhaFd3?=
 =?utf-8?B?bk1lNGJzUU5zMWpJY3kzZkw5Rk9HWkY5RU83R1E0Rml3THUrVnlrVDh1cGVU?=
 =?utf-8?B?bVd4Ym1mby96aStzNVpVWjFHZTd3aHdtUTlTcXN1TDYwWGNHUndRV09pcFY0?=
 =?utf-8?B?Uy8zRVo3aXA4Z1htbVZWZzRhWm1HZnJINEtPU2FCeTRGNkR6UmRPQXdtSEEz?=
 =?utf-8?B?ZkxYVUdPQmJtWXNlcDhKV3RQVFZybnRRR3lualhXdHQ1am1FT3VaZ0ZIeVl0?=
 =?utf-8?B?YXp6d1VwZ01aemw4bnMrMjNERHVaUnVEWXB0cTRKWERPYWc0U1N6blVyZE5N?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7BDCh7C2PJsCy3J6VqLzofGuJG3qZj7vKr3oQOP1NE4tsJyyWXso6L/NoqH1Ywd1hAn0YDcjkfW9dyMGUw5y7ABL7HdK39ciH/F7l1sEzpA58N6C2bTwO/VHBg/763U9sVLmKm62z3kdp8QlOfCw/tvOM00N+yYJgd7r8umagCD99xCARO13gDPYrGbW00YFHrIBDjKeypfh0NSiqkaKPYoqnwQBZmxrCo5kHJQHTm+LPUw4iZqG4YbB1WME3w7Kq8UHKI/LYkvFEzTwJZpkX4WtA8hmacg50iPmpsyD0rQcoyNZQCPH2VlicPK9wLq0hPEnwjGJEmO1Q817xVfXqcBh6O0Fv4QMOsjdtlYNHWwLcs34Wl97XP9JzAEmUE6bMicD75kprIk7ulnG1mM/zCP79uPCaF8ZjfjNN+G/7qhEp1FfBbvswUjvWV92RdHIicUBAazrRarJdNc3QnI7pige+TC5+opiRNHGpt4WmO8E+8OUp9sYytJmUtkuXMFk17otAk/GDOeGuZJm5O/5YHi3baIorq/PerSAUL32SOjQxSpUeIboqA8/xaPQPBOtNdXY6ftFfHDD4S9bA8bQcwpeC5xn8yA1TSXMJDp6Na+sp1DTFWXdYnldXt9F+hc2aAd+Zs4gHsB6KaxhvjnUpGtvwuo19Tthfh2gSYEcfW2UwMBK8f3dEpETEH8vWVWEidTIjEi+JCS7AIdxBm9WGCy6sqa60JtKU9zZpWoxSYYoWxZ3rtlwMWDjCK3lBdgXxDOkx7S8zVM39eeb8b3i6bugOrwT3P9vdIeJ5iTEfTR7lGTUK30+BaqWlzk3MYmxdWDcwiXuP+a8T2K0+3qnJEUNK7OKWLoUB02Upg5u52QyqcAEyc0WAh5fbWbxSfyw+M51+XCcsWCnGU/Nz9YbDg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f0a7a6-94e9-4b81-74f6-08db1ab22667
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 00:07:45.6370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/+EFDHK5JrZQZS/BbQVEH1JvOMAqXwn0ma3xWhUdZx/oydKtOG5TBjzA8pF5qRtH1Qewk+EfYyf6ls/XgExwI53tIL8rM6zGAQF5iOZlSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6593
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_16,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010193
X-Proofpoint-GUID: MeJCP6qGycE1KPchc63ZTPUUguzwR_Ea
X-Proofpoint-ORIG-GUID: MeJCP6qGycE1KPchc63ZTPUUguzwR_Ea
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

On 28/02/2023 20:36, Alex Williamson wrote:
> On Tue, 28 Feb 2023 12:11:06 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 23/02/2023 21:50, Alex Williamson wrote:
>>> On Thu, 23 Feb 2023 21:19:12 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>> On 23/02/2023 21:05, Alex Williamson wrote:  
>>>>> On Thu, 23 Feb 2023 10:37:10 +0000
>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
>>>>>> On 22/02/2023 22:10, Alex Williamson wrote:    
>>>>>>> On Wed, 22 Feb 2023 19:49:05 +0200
>>>>>>> Avihai Horon <avihaih@nvidia.com> wrote:      
>>>>>>>> From: Joao Martins <joao.m.martins@oracle.com>
>>>>>>>> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>>>>>>>          .iova = iova,
>>>>>>>>          .size = size,
>>>>>>>>      };
>>>>>>>> +    int ret;
>>>>>>>> +
>>>>>>>> +    ret = vfio_record_mapping(container, iova, size, readonly);
>>>>>>>> +    if (ret) {
>>>>>>>> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
>>>>>>>> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
>>>>>>>> +                     iova, size, ret, strerror(-ret));
>>>>>>>> +
>>>>>>>> +        return ret;
>>>>>>>> +    }      
>>>>>>>
>>>>>>> Is there no way to replay the mappings when a migration is started?
>>>>>>> This seems like a horrible latency and bloat trade-off for the
>>>>>>> possibility that the VM might migrate and the device might support
>>>>>>> these features.  Our performance with vIOMMU is already terrible, I
>>>>>>> can't help but believe this makes it worse.  Thanks,
>>>>>>>       
>>>>>>
>>>>>> It is a nop if the vIOMMU is being used (entries in container->giommu_list) as
>>>>>> that uses a max-iova based IOVA range. So this is really for iommu identity
>>>>>> mapping and no-VIOMMU.    
>>>>>
>>>>> Ok, yes, there are no mappings recorded for any containers that have a
>>>>> non-empty giommu_list.
>>>>>     
>>>>>> We could replay them if they were tracked/stored anywhere.    
>>>>>
>>>>> Rather than piggybacking on vfio_memory_listener, why not simply
>>>>> register a new MemoryListener when migration is started?  That will
>>>>> replay all the existing ranges and allow tracking to happen separate
>>>>> from mapping, and only when needed.
>>>>
>>>> The problem with that is that *starting* dirty tracking needs to have all the
>>>> range, we aren't supposed to start each range separately. So on a memory
>>>> listener callback you don't have introspection when you are dealing with the
>>>> last range, do we?  
>>>
>>> As soon as memory_listener_register() returns, all your callbacks to
>>> build the IOVATree have been called and you can act on the result the
>>> same as if you were relying on the vfio mapping MemoryListener.  I'm
>>> not seeing the problem.  Thanks,
>>>   
>>
>> While doing these changes, the nice thing of the current patch is that whatever
>> changes apply to vfio_listener_region_add() will be reflected in the mappings
>> tree that stores what we will dirty track. If we move the mappings calculation
>> necessary for dirty tracking only when we start, we will have to duplicate the
>> same checks, and open for bugs where we ask things to be dirty track-ed that
>> haven't been DMA mapped. These two aren't necessarily tied, but felt like I
>> should raise the potentially duplication of the checks (and the same thing
>> applies for handling virtio-mem and what not).
>>
>> I understand that if we were going to store *a lot* of mappings that this would
>> add up in space requirements. But for no-vIOMMU (or iommu=pt) case this is only
>> about 12ranges or so, it is much simpler to piggyback the existing listener.
>> Would you still want to move this to its own dedicated memory listener?
> 
> Code duplication and bugs are good points, but while typically we're
> only seeing a few handfuls of ranges, doesn't virtio-mem in particular
> allow that we could be seeing quite a lot more?
> 
Ugh yes, it could be.

> We used to be limited to a fairly small number of KVM memory slots,
> which effectively bounded non-vIOMMU DMA mappings, but that value is
> now 2^15, so we need to anticipate that we could see many more than a
> dozen mappings.
> 

Even with 32k memory slots today we are still reduced on a handful. hv-balloon
and virtio-mem approaches though are the ones that may stress such limit IIUC
prior to starting migration.

> Can we make the same argument that the overhead is negligible if a VM
> makes use of 10s of GB of virtio-mem with 2MB block size?
> 
> But then on a 4KB host we're limited to 256 tracking entries, so
> wasting all that time and space on a runtime IOVATree is even more
> dubious.
>
> In fact, it doesn't really matter that vfio_listener_region_add and
> this potentially new listener come to the same result, as long as the
> new listener is a superset of the existing listener. 

I am trying to put this in a way that's not too ugly to reuse the most between
vfio_listener_region_add() and the vfio_migration_mapping_add().

For you to have an idea, here's so far how it looks thus far:

https://github.com/jpemartins/qemu/commits/vfio-dirty-tracking

Particularly this one:

https://github.com/jpemartins/qemu/commit/3b11fa0e4faa0f9c0f42689a7367284a25d1b585

vfio_get_section_iova_range() is where most of these checks are that are sort of
a subset of the ones in vfio_listener_region_add().

> So I think we can
> simplify out a lot of the places we'd see duplication and bugs.  I'm
> not even really sure why we wouldn't simplify things further and only
> record a single range covering the low and high memory marks for a
> non-vIOMMU VMs, or potentially an approximation removing gaps of 1GB or
> more, for example.  Thanks,

Yes, for Qemu, to have one single artificial range with a computed min IOVA and
max IOVA is the simplest to get it implemented. It would avoid us maintaining an
IOVATree as you would only track min/max pair (maybe max_below).

My concern with a reduced single range is 1) big holes in address space leading
to asking more than you need[*] and then 2) device dirty tracking limits e.g.
hardware may have upper limits, so you may prematurely exercise those. So giving
more choice to the vfio drivers to decide how to cope with the mapped address
space description looks to have a bit more longevity.

Anyway the temptation with having a single range is that this can all go away if
the vfio_listener_region_add() tracks just min/max IOVA pair.

Below scissors mark it's how this patch is looking like in the commit above
while being a full list of mappings. It's also stored here:

https://github.com/jpemartins/qemu/commits/vfio-dirty-tracking

I'll respond here with a patch on what it looks like with the range watermark
approach.

	Joao

[0] AMD 1T boundary is what comes to mind, which on Qemu relocates memory above
4G into after 1T.

------------------>8--------------------

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
 hw/vfio/common.c              | 147 +++++++++++++++++++++++++++++++++-
 hw/vfio/trace-events          |   2 +
 include/hw/vfio/vfio-common.h |   4 +
 3 files changed, 150 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 655e8dbb74d4..17971e6dbaeb 100644
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
@@ -1326,11 +1335,127 @@ static int vfio_set_dirty_page_tracking(VFIOContainer
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
+	return false;
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
+	pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
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
+static void vfio_migration_add_mapping(MemoryListener *listener,
+                                       MemoryRegionSection *section)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer,
mappings_listener);
+    hwaddr end = 0;
+    DMAMap map;
+    int ret;
+
+    if (vfio_have_giommu(container)) {
+        vfio_set_migration_error(-EOPNOTSUPP);
+        return;
+    }
+
+    if (!vfio_listener_valid_section(section) ||
+        !vfio_get_section_iova_range(container, section, &map.iova, &end)) {
+        return;
+    }
+
+    map.size = end - map.iova - 1; // IOVATree is inclusive, so subtract 1 from
size
+    map.perm = section->readonly ? IOMMU_RO : IOMMU_RW;
+
+    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
+        ret = iova_tree_insert(container->mappings, &map);
+        if (ret) {
+            if (ret == IOVA_ERR_INVALID) {
+                ret = -EINVAL;
+            } else if (ret == IOVA_ERR_OVERLAP) {
+                ret = -EEXIST;
+            }
+        }
+    }
+
+    trace_vfio_migration_mapping_add(map.iova, map.iova + map.size, ret);
+
+    if (ret)
+        vfio_set_migration_error(ret);
+    return;
+}
+
+static void vfio_migration_remove_mapping(MemoryListener *listener,
+                                          MemoryRegionSection *section)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer,
mappings_listener);
+    hwaddr end = 0;
+    DMAMap map;
+
+    if (vfio_have_giommu(container)) {
+        vfio_set_migration_error(-EOPNOTSUPP);
+        return;
+    }
+
+    if (!vfio_listener_valid_section(section) ||
+        !vfio_get_section_iova_range(container, section, &map.iova, &end)) {
+        return;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
+        iova_tree_remove(container->mappings, map);
+    }
+
+    trace_vfio_migration_mapping_del(map.iova, map.iova + map.size);
+}
+
+
+static const MemoryListener vfio_dirty_tracking_listener = {
+    .name = "vfio-migration",
+    .region_add = vfio_migration_add_mapping,
+    .region_del = vfio_migration_remove_mapping,
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
@@ -1346,6 +1471,8 @@ static void vfio_listener_log_global_stop(MemoryListener
*listener)
     if (ret) {
         vfio_set_migration_error(ret);
     }
+
+    memory_listener_unregister(&container->mappings_listener);
 }

 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
@@ -2172,16 +2299,24 @@ static int vfio_connect_container(VFIOGroup *group,
AddressSpace *as,
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
+    container->mappings = iova_tree_new();
+    if (!container->mappings) {
+        error_setg(errp, "Cannot allocate DMA mappings tree");
+        ret = -ENOMEM;
+        goto free_container_exit;
+    }
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
@@ -2317,6 +2452,10 @@ listener_release_exit:
 enable_discards_exit:
     vfio_ram_block_discard_disable(container, false);

+destroy_mappings_exit:
+    qemu_mutex_destroy(&container->mappings_mutex);
+    iova_tree_destroy(container->mappings);
+
 free_container_exit:
     g_free(container);

@@ -2371,6 +2510,8 @@ static void vfio_disconnect_container(VFIOGroup *group)
         }

         trace_vfio_disconnect_container(container->fd);
+        qemu_mutex_destroy(&container->mappings_mutex);
+        iova_tree_destroy(container->mappings);
         close(container->fd);
         g_free(container);

diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 669d9fe07cd9..c92eaadcc7c4 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -104,6 +104,8 @@ vfio_known_safe_misalignment(const char *name, uint64_t
iova, uint64_t offset_wi
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t
size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not
aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING
region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64"
- 0x%"PRIx64
+vfio_migration_mapping_add(uint64_t start, uint64_t end, int err) "mapping_add
0x%"PRIx64" - 0x%"PRIx64" err=%d"
+vfio_migration_mapping_del(uint64_t start, uint64_t end) "mapping_del
0x%"PRIx64" - 0x%"PRIx64
 vfio_disconnect_container(int fd) "close container->fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int
num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 87524c64a443..48951da11ab4 100644
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
@@ -89,6 +91,8 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    IOVATree *mappings;
+    QemuMutex mappings_mutex;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
--
2.17.2


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0C68E06D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:47:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSyK-000068-SZ; Tue, 07 Feb 2023 13:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPSxt-0008T5-HN
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:45:13 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPSxp-0000T7-Ju
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:45:13 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317Go2En026752; Tue, 7 Feb 2023 18:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=vr1Z9UL3PtqlKnz7v75Tn230/WGRC5KuKkPwqfUwnsc=;
 b=a2CoBvYK6Q3ZSSd8jfM5QRBjMlIpGBYI/jXzvPH98iXIdfmzwPBbdtPY3fptQaGYi1Fu
 Yghf8jvPzJtXNuYtxryTk18UTqJQEJ8s1iRfcqg0MOij6G48JgyvmLlFFzmvQWMdwyMd
 xbClalT9EnJcm488MlaJoBKhSwtA6w/k8bELmkEvf3MTawqd/mddGbQ1nJE5BFkDihTF
 UtC5y5Z7AlpImL3HOv0pHbPvfdSKjGwDKaV85LdnBaJTscuJ2ipSgud2Mc6M7REAqLO+
 3Mt+lYZEBymuaIG+IfldxyJ6bgDLHa+lkB5LLPLnESJ0FyKIxIpw0QyL+i+k0vbAeCt9 Yg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfwu692t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:44:49 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317HsOfu012642; Tue, 7 Feb 2023 18:44:48 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtck68w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1pthXo5/0Y66WrYr//TO/E4bOfB0Jf6jVoo9Q1hxBLwk6IFRGz+q1Ctwe+1ZjFy34dTd00cpcbGf9JarpxDf3cpeXuNu8gWSexY79SGE2Hkhrqvqt5C1nW2sVqcxFoOuyNwMm9vjdpOh1nr6oUvebrPUooeawJWA9wo2yOoXVyLzBWLw72L3VzfWs2e/y+zIDr54YKX6tE/qYEHRGrIhm/RsFBCfo4K1pTNRvigsjuNm0C79cts60A2TVLoZN79Ng6Qdf9mFf55PFkIgGgg85z1u8fpm/AUF1qzcof05b0vaANz8DrBJko6u/Ufs0rdsRrYuUthL3LCvIhWMEDhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vr1Z9UL3PtqlKnz7v75Tn230/WGRC5KuKkPwqfUwnsc=;
 b=TYI/yKGax3MAbSwjB5h1hqCITfSk2obZ9+fM+W9BHWx6Wa3Ow7pkxzLENay37rGnRzIe6zWAT2bTnb8sx+3QXwfgI8Rz7OKwFUNSdiWK23iDs/038vuN7U7JVj5D8VZadg4UCRn+S7UfWAy1QBe6H0ZImR8vHfVTbznWtyFLNZLhgusaHjdyEuU+e2qDbr/yF5YMu7bK6EUnqwbvmfg1KwsUzCUvUQrizGa2bGj9HQtXvT7zHHE94YQc/Kqk9A1BvfNuATNlExHrb6vu/i2+Z0HmVY2BXEmJDjRPt5ZBR+7Yks9DHZNDYrjb97UAcrlyVTn8kOBs0tKivHKjxNusqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr1Z9UL3PtqlKnz7v75Tn230/WGRC5KuKkPwqfUwnsc=;
 b=TW0A2af6TM8jqh3kaTY9i2cBL/Xaruf+xaVA/ci0Orc7sv7L6is0oAYlcYRqBXBUSwjhRj02dSHb1yB4yiXZbPZA/UC45MfEV8mHTFrpjIocblhM7qLwqAo2Rwg6+Q4a5IBAaWYfSMGoX+yCbn4I/Zh4Bn+7UQOflTZuzj/5xzs=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by DS0PR10MB6127.namprd10.prod.outlook.com (2603:10b6:8:c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.10; Tue, 7 Feb
 2023 18:44:40 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.016; Tue, 7 Feb 2023
 18:44:40 +0000
Message-ID: <d0a2df99-5935-9b06-cc42-fd93488b59f5@oracle.com>
Date: Tue, 7 Feb 2023 13:44:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V9 00/46] Live Update
Content-Language: en-US
From: Steven Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan
 <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
 <53075574-9e73-f773-ccb1-cca42a719801@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <53075574-9e73-f773-ccb1-cca42a719801@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:805:ca::22) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|DS0PR10MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: a605ef36-bfa0-4e7b-295f-08db093b5e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X45ohJBgIOuDTjkYcYR4dt5Vtxw9C9MESEbfUVB+FlqruXuuN/y8Ecp3tB6pF0zSIZL4n7GSq3/2Xt4G4l92ir598F//FO/VWWquk18yXrXin6qnKKTVhrb7pxgB8GPiOYuUb4vLVaXfT5fK2b6xefvVc65WNzf0m4OBBSg2qRMALe0zrli4aNnMIpXm0Fnzi6H3X9LtjTW+ejUSnPpx+ODraKPTTtJW6cnfZfXr16Hy31FNaUdwv+Vy9ak/lTArCAvJExKtJwVLcgSUSmB/bTEqgRDSHu9rtmpC0au89o6l9SABHHwTRu/7ocGa4EA9pCkiOe1NxIWt10j3c497P46L8Mambph45nUToF8cWehylc6cWD9X1m86gMD/TEgs4JzgvJ0Ww4//0nuc6Yuoxg/DkLoEKhktCX2X8BHE/9J+Fl9e5hKyu6fnZy6d9SxjmioCnt/NdRcw3uMv43CFAf/idnkEPkHHVx+buxo/x8W73awGNRFmM7pvATptTiUnXD1w3Oha1DET7PYu38xU/UPIDvSC1gRoPYEciKqubiHRjtcrslUBovK/DRB3Xp+zKA2krou6B32tm96sMgC1fVzYFiwGjMjoXuTxitjvfxkTc617m2vP35QHScMHNxZ/UlowXxWKLHkSNjgkJK5airwzn3W/W1XO4FQvpjd5Vg+XWWlVTMvkpuKsJWPVJKW2CkXL/KHYJ+9EYHT0gm+Oy6ZOmq9k6ByFgjjbG1eqr6WCX+B0hOeKQKuGPSxPJYtze7sMjpxJoHZl1lYlZod0+Xepg8Lg3IMo4wsFfYj0zUFEGmb4PFwsK0drEhg7mQfisONdRUv1OdMKrUbzIPY3Ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199018)(66899018)(31686004)(2616005)(38100700002)(30864003)(316002)(7416002)(5660300002)(15650500001)(36756003)(6506007)(83380400001)(31696002)(8676002)(110136005)(86362001)(921005)(2906002)(26005)(478600001)(6512007)(186003)(36916002)(6486002)(44832011)(66556008)(66946007)(8936002)(966005)(53546011)(66476007)(6666004)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEszU05xNkxIbmFnendTRSsrN3lqdW5jRWpLVlkrNit0dnBIUUNNd0N0ZEk4?=
 =?utf-8?B?VEFqc09sZVVNNE5LekhwblR0OFVuRndmSUVOenpCeEMyM25IbE96WE9LSFNp?=
 =?utf-8?B?ZHFMRjdGb29yQkltdWdrdy92RTN4TmJRV0MwNGE5RkRyR2oxNFh3ejVyMVM0?=
 =?utf-8?B?MHowVDNudVFvZzlWeFdGYWFVWnVranN6UGovcUlLblh2eUhDa2taUFlUZTBw?=
 =?utf-8?B?bHRlUDN3bmRpUnJ4NWYzMVFYaGtvMDRRM1JhWVZtb0NiaFhTNWpPTjlsU3Jm?=
 =?utf-8?B?dGFtYW5QdmJUTkdDbnJGTndlVWpBUHRJMi9Md0srNk1hSzBvT0hLVXVxb2dP?=
 =?utf-8?B?ajByalVLc2cvR09uR3VKTURuTmZmWllqaXVobjFhVVp1SWlFdWJQblp4L1Zq?=
 =?utf-8?B?TThiTXBYdEs3S0ZSSytlL01ZTkM5dWF0MGJhVmExNGEwUU00TWxEUTFqWWV1?=
 =?utf-8?B?RUwxeUhIK2xORXhpUVdPbEVEM2M4NzdhaWZZb3JQdUh4YVllbVpCQXdXSmlM?=
 =?utf-8?B?VlNlTStaZG1QUE5mSURuMlo3ZUk2WUtwYzB1YUlrMG9pdzZaa0V3dGdCWjdk?=
 =?utf-8?B?QVdiMnNYY0VLbEZ1emROZS8rU3M2OUx5b3A1MnN6cCsrKyt5NkQwUGhtVjFm?=
 =?utf-8?B?UnQ2MDlqVzZCVGpseEhTclBQZmFMTnQ4N1BRVFlqazcxcWl1cjJxcDFYY3ly?=
 =?utf-8?B?VFFRRnZ4YitSM3FyYkZyckZ1ajJTWTU0YTVUNVFQdE1BVFd2ZVNTMHEvbFlh?=
 =?utf-8?B?ZktHUkthalRrRyttVWQrSlo3cTloTUZNL2RrUEhVc2U0Z2xvcVVuanBWa1pY?=
 =?utf-8?B?VW1kOGdIczVQcDBqTHdQNXRNMytFY1RLWm93K3NTZndDdDUyaWxESlQ5Ny82?=
 =?utf-8?B?a1UrQXRpU2lVcW02UGk0cW9CRnllQnZFeEtEWnhQUTZDNnpudzg5T0JjRXln?=
 =?utf-8?B?cHNrZU04NEtvaytXRWZJcUtCSExtcnpFNEN5Z2RrMFBzSzdTK3kxemhlWk1v?=
 =?utf-8?B?TVNQekNiQkJLQVdmaVFxbG5nS1l0TS9CN2ZuZklmLzRKeUl1Vkl3aWluUHBP?=
 =?utf-8?B?VUhBcGZPMWdoVmhHd1RxdEVZdEtRNVdPanV6ejV4dkF6d1BuYXRYQkYzdmx5?=
 =?utf-8?B?R3dMbHJHcTFoTmdSeUdVNTBKZlJVRWRsZ0ZoL0dKWmo2ZXBEdDlXUjZvOXRU?=
 =?utf-8?B?Rm9CUStqYXVlbmxCdGx3YnBxUzNHdDVjUW5xN2lyeUtRMXZhenJCL1hFaWo3?=
 =?utf-8?B?ZWc2d0w1Y255NFl4Yk93c2NtTzM4VCtERmFyR2pVWllYeFIrUTNCamVoQlUz?=
 =?utf-8?B?Sm5vdXZNdjVQSmVJTzRqMjI2dVVqMzJxcjV6ajM3dmNKY0NWbHF0bFFnemox?=
 =?utf-8?B?WUp5cDlUUTYxKzM3Z3NoWTZLSFlzdnA3N3BWNy93Ynh6QWlhYUdhdk93Zm9m?=
 =?utf-8?B?QThyODRpQ1BUb2c2bUdtaTlhcEdWNHFmZjZlc0JyMDVEQWVvR3N5YnFyVmJs?=
 =?utf-8?B?dlU5U0cvZkQ2OUhnNmlneWowOGhtOU16dHZyUjRRWWtPdEluRkNneU8wSXRi?=
 =?utf-8?B?TjYyY3YzSHFGcFU3d2tQWi9QMUJmamdGejl2YTFjS0U2LzdQWWZnWU1USDBB?=
 =?utf-8?B?U2N6QVRtRTBsOVErWDZmbDQ3NG1MamMzbFlpdENNY3pwV0R1cGVxOVk2MUlh?=
 =?utf-8?B?UzBZRWlHNnVIMjMwQkJyMjhQc3NCcG1PWEpaTXBITmtDeXNyamJIY2l4Vjl5?=
 =?utf-8?B?Q1JZVjBnamUxbUM4ZzRFdWU1TjlhK3cvWHYyckc3cVlVM0taWTl1bjlGWnVL?=
 =?utf-8?B?Sk1JRG1qNzhTNXpVK2FIakN6SFlrRUJGd2hxcGlGUmJ2S1pIdnRxeVZ3aXZk?=
 =?utf-8?B?eVdiR0ttVXFJYmZUVnVQSXJaaGVRNWZkWUxiVXRFR1A0dmVwcnFEUWMzSytR?=
 =?utf-8?B?b0h4eUFjaFZ3NWFsNDJBRlNYc0xQSkhMUlMzNUJlWXIzck9WY2JoSldqcXFh?=
 =?utf-8?B?ajhKbGhsRU5IRC9RQnBnZG13OVZUY0pBYUVPcHpyZk9DWVRrL3pQWTQ2b0tX?=
 =?utf-8?B?azRMbDNNZ2lpWjVORTJQSE9tNmlUWTVyV1dQRzE5VW9aUGtKVmduajJWTFdE?=
 =?utf-8?B?TURmdU5sMWF3YmFaRm5ORkFqMWJTUHp4cS9ZZ3EzVjFsdS9ybjVMa3NnMWxB?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?b29DM0c4aDFuYXdnNVBDczdkVVlLd2FGN1MvMXk2eU5aa0tlaHBEbTJoOEZN?=
 =?utf-8?B?YW1yWVc0Q0lVQWgvOUFoNXJ1NWo4TjhLUEpjeXNLczdEUUx0TjJsbEFnQkdn?=
 =?utf-8?B?UGEwMjdEWkZTODlTcE9xMWlLd3J4Q3dxVUlXYXZDVmg2ZG1XK2hYbVpXWUFY?=
 =?utf-8?B?VUFMdEQ1R09lQjR2Y00xdSs0bXBqVGtrTmg0c2hSMUdCaVRZZFczc0xPbmdG?=
 =?utf-8?B?bEtlMnhISWZyaitwd3pKSDQxTHNjMW0yZ1hpQzFTWWxzL29QakpMRDNjZzJX?=
 =?utf-8?B?ZjAzWkRJL1VGUDdMbmpySXJYaVNOUXJ0ekVQRi96SmhjV0k1KzB2MWp0SGdm?=
 =?utf-8?B?UnZISmdhSm9ZT1FpanYwTDJsOWVaa1V2a2Nkb0dlQkM5VGQ4Q3pYczI2c1ZY?=
 =?utf-8?B?NmtJcWtxd3pDMFZxSmd1NFRQc0ZzUFowWG9pdHJkVHlqRldlR0phcjFEOWNO?=
 =?utf-8?B?RXVOTi9sTVpoOGRFcFlsYlhZN1pEK0wvcnl1YmQ3azlyK2ZjMUJXYWljVCtj?=
 =?utf-8?B?M3ZUZXdFZ3htcmpoM3RBcmFWd3U1RkQ5Yy9ac3R2dm5UTVlCekRqN0dUWmJr?=
 =?utf-8?B?aXg2UW52ZElMK1QvRm9yZUJuRDQ3U0d2U2VNR1F3MXlVNmhyU1orT0dHd2pl?=
 =?utf-8?B?L0hqek0rNzFVQTZsTGQ3UkZoT0dadm5jcjhzamtqcW5Gelc5ZTlwdndXcksz?=
 =?utf-8?B?bngzV251UTVNckpYSXlUYXBrMWZQUGhsb1A1WVVTS28zVEV5MHVBTFVDcGVo?=
 =?utf-8?B?SnYyTWZQZmh2UDZYYzdNb0dnc1pEeGYyNGk5b0w2RTFrY2xMVjk0eWwxZnd1?=
 =?utf-8?B?OGthQjRHa1ZOOURoZkRaa3JEYVdacFNVT09tU0VFY0xTSE9QT09zMTFQNG1i?=
 =?utf-8?B?YmRJby90dzJCeGp5ZVJJS0ZOZUVDcVhHN2YyWi90UU4rbi82bmhyb1pkMXZE?=
 =?utf-8?B?Zkt5ZFZYV29vT21JR1RtK2pnWUd1NXZsS09pTC9JY0ZGQTlLSjN1R001bktr?=
 =?utf-8?B?dnhZcUxYZXEzSXBxcXI0aWFWSC9ieEJaQWZFZ1ZkRU9XcFUwc25RK21QbThC?=
 =?utf-8?B?b3ZkdEl6clBtSWtVazhHUjY1Z09Td0hZQk81UnM3TGdaaVZtVFhhZ3RYNzVC?=
 =?utf-8?B?Q0F2MjZNRjZJSnEzN05TVkNGVXRXRFZZZTdjY0JJZ3VWWmJvRVpuNFRQT2FG?=
 =?utf-8?B?S3dxMDhCeEJOb2tScFpKcWhSWndVa1Nxa2s4SUJVNDZxZzM1VHdGWmF6aURF?=
 =?utf-8?Q?5lTMbWnq+8r4htk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a605ef36-bfa0-4e7b-295f-08db093b5e83
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 18:44:40.0493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6vgtTlxZXxth9lpQHnxq28k1cHRlvn/wAn1etpMRdr6qtxZyLDBp4JF0f3AAhmnR6rXHavX5oikXKx6QOP6QgDpc+gZOT2tuyoOECPCNmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6127
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_10,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070167
X-Proofpoint-GUID: 13JSP2dvXDJm3DxhhyUvBfXr-Ro--ZhA
X-Proofpoint-ORIG-GUID: 13JSP2dvXDJm3DxhhyUvBfXr-Ro--ZhA
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

To make forward progress on this series and reduce its size, I will be posting
those of its patches that can be independently integrated and have some value
on their own, to a reduced distribution of reviewers for each.  This is what
I plan to break out:

migration: fix populate_vfio_info

memory: RAM_NAMED_FILE flag

memory: flat section iterator

oslib: qemu_clear_cloexec

migration: simplify blockers

migration: simplify notifiers

python/machine: QEMUMachine full_args

python/machine: QEMUMachine reopen_qmp_connection

qapi: strList_from_string
qapi: QAPI_LIST_LENGTH
qapi: strv_from_strList
qapi: strList unit tests

- Steve

On 12/7/2022 10:48 AM, Steven Sistare wrote:
> This series desperately needs review in its intersection with live migration.
> The code in other areas has been reviewed and revised multiple times -- thank you!
> 
> David, Juan, can you spare some time to review this?  I have done my best to order 
> the patches logically (see the labelled groups in this email), and to provide 
> complete and clear cover letter and commit messages. Can I do anything to facilitate,
> like doing a code walk through via zoom?
> 
> And of course, I welcome anyone's feedback.
> 
> Here is the original posting.
> 
> https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
> 
> - Steve
> 
> On 7/26/2022 12:09 PM, Steve Sistare wrote:
>> This version of the live update patch series integrates live update into the
>> live migration framework.  The new interfaces are:
>>   * mode (migration parameter)
>>   * cpr-exec-args (migration parameter)
>>   * file (migration URI)
>>   * migrate-mode-enable (command-line argument)
>>   * only-cpr-capable (command-line argument)
>>
>> Provide the cpr-exec and cpr-reboot migration modes for live update.  These
>> save and restore VM state, with minimal guest pause time, so that qemu may be
>> updated to a new version in between.  The caller sets the mode parameter
>> before invoking the migrate or migrate-incoming commands.
>>
>> In cpr-reboot mode, the migrate command saves state to a file, allowing
>> one to quit qemu, reboot to an updated kernel, start an updated version of
>> qemu, and resume via the migrate-incoming command.  The caller must specify
>> a migration URI that writes to and reads from a file.  Unlike normal mode,
>> the use of certain local storage options does not block the migration, but
>> the caller must not modify guest block devices between the quit and restart.
>> The guest RAM memory-backend must be shared, and the @x-ignore-shared
>> migration capability must be set, to avoid saving it to the file.  Guest RAM
>> must be non-volatile across reboot, which can be achieved by backing it with
>> a dax device, or /dev/shm PKRAM as proposed in
>> https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com
>> but this is not enforced.  The restarted qemu arguments must match those used
>> to initially start qemu, plus the -incoming option.
>>
>> The reboot mode supports vfio devices if the caller first suspends the guest,
>> such as by issuing guest-suspend-ram to the qemu guest agent.  The guest
>> drivers' suspend methods flush outstanding requests and re-initialize the
>> devices, and thus there is no device state to save and restore.  After
>> issuing migrate-incoming, the caller must issue a system_wakeup command to
>> resume.
>>
>> In cpr-exec mode, the migrate command saves state to a file and directly
>> exec's a new version of qemu on the same host, replacing the original process
>> while retaining its PID.  The caller must specify a migration URI that writes
>> to and reads from a file, and resumes execution via the migrate-incoming
>> command.  Arguments for the new qemu process are taken from the cpr-exec-args
>> migration parameter, and must include the -incoming option.
>>
>> Guest RAM must be backed by a memory backend with share=on, but cannot be
>> memory-backend-ram.  The memory is re-mmap'd in the updated process, so guest
>> ram is efficiently preserved in place, albeit with new virtual addresses.
>> In addition, the '-migrate-mode-enable cpr-exec' option is required.  This
>> causes secondary guest ram blocks (those not specified on the command line)
>> to be allocated by mmap'ing a memfd.  The memfds are kept open across exec,
>> their values are saved in special cpr state which is retrieved after exec,
>> and they are re-mmap'd.  Since guest RAM is not copied, and storage blocks
>> are not migrated, the caller must disable all capabilities related to page
>> and block copy.  The implementation ignores all related parameters.
>>
>> The exec mode supports vfio devices by preserving the vfio container, group,
>> device, and event descriptors across the qemu re-exec, and by updating DMA
>> mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
>> VFIO_DMA_MAP_FLAG_VADDR as defined in
>>   https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com
>> and integrated in Linux kernel 5.12.
>>
>> Here is an example of updating qemu from v7.0.50 to v7.0.51 using exec mode.
>> The software update is performed while the guest is running to minimize
>> downtime.
>>
>> window 1                                        | window 2
>>                                                 |
>> # qemu-system-$arch ...                         |
>>   -migrate-mode-enable cpr-exec                 |
>> QEMU 7.0.50 monitor - type 'help' ...           |
>> (qemu) info status                              |
>> VM status: running                              |
>>                                                 | # yum update qemu
>> (qemu) migrate_set_parameter mode cpr-exec      |
>> (qemu) migrate_set_parameter cpr-exec-args      |
>>   qemu-system-$arch ... -incoming defer         |
>> (qemu) migrate -d file:/tmp/qemu.sav            |
>> QEMU 7.0.51 monitor - type 'help' ...           |
>> (qemu) info status                              |
>> VM status: paused (inmigrate)                   |
>> (qemu) migrate_incoming file:/tmp/qemu.sav      |
>> (qemu) info status                              |
>> VM status: running                              |
>>
>>
>> Here is an example of updating the host kernel using reboot mode.
>>
>> window 1                                        | window 2
>>                                                 |
>> # qemu-system-$arch ... mem-path=/dev/dax0.0    |
>>   -migrate-mode-enable cpr-reboot               |
>> QEMU 7.0.50 monitor - type 'help' ...           |
>> (qemu) info status                              |
>> VM status: running                              |
>>                                                 | # yum update kernel-uek
>> (qemu) migrate_set_parameter mode cpr-reboot    |
>> (qemu) migrate -d file:/tmp/qemu.sav            |
>> (qemu) quit                                     |
>>                                                 |
>> # systemctl kexec                               |
>> kexec_core: Starting new kernel                 |
>> ...                                             |
>>                                                 |
>> # qemu-system-$arch mem-path=/dev/dax0.0 ...    |
>>   -incoming defer                               |
>> QEMU 7.0.51 monitor - type 'help' ...           |
>> (qemu) info status                              |
>> VM status: paused (inmigrate)                   |
>> (qemu) migrate_incoming file:/tmp/qemu.sav      |
>> (qemu) info status                              |
>> VM status: running                              |
>>
>> Changes from V8 to V9:
>>   vfio:
>>     - free all cpr state during unwind in vfio_connect_container
>>     - change cpr_resave_fd to return void, and avoid new unwind cases
>>     - delete incorrect .unmigratable=1 in vmstate handlers
>>     - add route batching in vfio_claim_vectors
>>     - simplified vfio intx cpr code
>>     - fix commit message for 'recover from unmap-all-vaddr failure'
>>     - verify suspended runstate for cpr-reboot mode
>>   Other:
>>     - delete cpr-save, cpr-exec, cpr-load
>>     - delete ram block vmstate handlers that were added in V8
>>     - rename cpr-enable option to migrate-mode-enable
>>     - add file URI for migration
>>     - add mode and cpr-exec-args migration parameters
>>     - add per-mode migration blockers
>>     - add mode checks in migration notifiers
>>     - fix suspended runstate during migration
>>     - replace RAM_ANON flag with RAM_NAMED_FILE
>>     - support memory-backend-epc
>>
>> Steve Sistare (44):
>>   migration: fix populate_vfio_info                  ---  reboot mode  ---
>>   memory: RAM_NAMED_FILE flag
>>   migration: file URI
>>   migration: mode parameter
>>   migration: migrate-enable-mode option
>>   migration: simplify blockers
>>   migration: per-mode blockers
>>   cpr: relax some blockers
>>   cpr: reboot mode
>>
>>   qdev-properties: strList                           ---  exec mode ---
>>   qapi: strList_from_string
>>   qapi: QAPI_LIST_LENGTH
>>   qapi: strv_from_strList
>>   qapi: strList unit tests
>>   migration: cpr-exec-args parameter
>>   migration: simplify notifiers
>>   migration: check mode in notifiers
>>   memory: flat section iterator
>>   oslib: qemu_clear_cloexec
>>   vl: helper to request re-exec
>>   cpr: preserve extra state
>>   cpr: exec mode
>>   cpr: add exec-mode blockers
>>   cpr: ram block blockers
>>   cpr: only-cpr-capable
>>   cpr: Mismatched GPAs fix
>>   hostmem-memfd: cpr support
>>   hostmem-epc: cpr support
>>
>>   pci: export msix_is_pending                       --- vfio for exec ---
>>   vfio-pci: refactor for cpr
>>   vfio-pci: cpr part 1 (fd and dma)
>>   vfio-pci: cpr part 2 (msi)
>>   vfio-pci: cpr part 3 (intx)
>>   vfio-pci: recover from unmap-all-vaddr failure
>>
>>   chardev: cpr framework                            --- misc for exec ---
>>   chardev: cpr for simple devices
>>   chardev: cpr for pty
>>   python/machine: QEMUMachine full_args
>>   python/machine: QEMUMachine reopen_qmp_connection
>>   tests/avocado: add cpr regression test
>>
>>   vl: start on wakeup request                       --- vfio for reboot ---
>>   migration: fix suspended runstate
>>   migration: notifier error reporting
>>   vfio: allow cpr-reboot migration if suspended
>>
>> Mark Kanda, Steve Sistare (2):
>>   vhost: reset vhost devices for cpr
>>   chardev: cpr for sockets
>>
>>  MAINTAINERS                         |  14 ++
>>  accel/xen/xen-all.c                 |   3 +
>>  backends/hostmem-epc.c              |  18 +-
>>  backends/hostmem-file.c             |   1 +
>>  backends/hostmem-memfd.c            |  22 ++-
>>  backends/tpm/tpm_emulator.c         |  11 +-
>>  block/parallels.c                   |   7 +-
>>  block/qcow.c                        |   7 +-
>>  block/vdi.c                         |   7 +-
>>  block/vhdx.c                        |   7 +-
>>  block/vmdk.c                        |   7 +-
>>  block/vpc.c                         |   7 +-
>>  block/vvfat.c                       |   7 +-
>>  chardev/char-mux.c                  |   1 +
>>  chardev/char-null.c                 |   1 +
>>  chardev/char-pty.c                  |  16 +-
>>  chardev/char-serial.c               |   1 +
>>  chardev/char-socket.c               |  48 +++++
>>  chardev/char-stdio.c                |  31 +++
>>  chardev/char.c                      |  49 ++++-
>>  dump/dump.c                         |   4 +-
>>  gdbstub.c                           |   1 +
>>  hmp-commands.hx                     |   2 +-
>>  hw/9pfs/9p.c                        |  11 +-
>>  hw/core/qdev-properties-system.c    |  12 ++
>>  hw/core/qdev-properties.c           |  44 +++++
>>  hw/display/virtio-gpu-base.c        |   8 +-
>>  hw/intc/arm_gic_kvm.c               |   3 +-
>>  hw/intc/arm_gicv3_its_kvm.c         |   3 +-
>>  hw/intc/arm_gicv3_kvm.c             |   3 +-
>>  hw/misc/ivshmem.c                   |   8 +-
>>  hw/net/virtio-net.c                 |  10 +-
>>  hw/pci/msix.c                       |   2 +-
>>  hw/pci/pci.c                        |  12 ++
>>  hw/ppc/pef.c                        |   2 +-
>>  hw/ppc/spapr.c                      |   2 +-
>>  hw/ppc/spapr_events.c               |   2 +-
>>  hw/ppc/spapr_rtas.c                 |   2 +-
>>  hw/remote/proxy.c                   |   7 +-
>>  hw/s390x/s390-virtio-ccw.c          |   9 +-
>>  hw/scsi/vhost-scsi.c                |   9 +-
>>  hw/vfio/common.c                    | 235 +++++++++++++++++++----
>>  hw/vfio/cpr.c                       | 177 ++++++++++++++++++
>>  hw/vfio/meson.build                 |   1 +
>>  hw/vfio/migration.c                 |  23 +--
>>  hw/vfio/pci.c                       | 336 ++++++++++++++++++++++++++++-----
>>  hw/vfio/trace-events                |   1 +
>>  hw/virtio/vhost-vdpa.c              |   6 +-
>>  hw/virtio/vhost.c                   |  32 +++-
>>  include/chardev/char-socket.h       |   1 +
>>  include/chardev/char.h              |   5 +
>>  include/exec/memory.h               |  48 +++++
>>  include/exec/ram_addr.h             |   1 +
>>  include/exec/ramblock.h             |   1 +
>>  include/hw/pci/msix.h               |   1 +
>>  include/hw/qdev-properties-system.h |   4 +
>>  include/hw/qdev-properties.h        |   3 +
>>  include/hw/vfio/vfio-common.h       |  12 ++
>>  include/hw/virtio/vhost.h           |   1 +
>>  include/migration/blocker.h         |  69 ++++++-
>>  include/migration/cpr-state.h       |  30 +++
>>  include/migration/cpr.h             |  20 ++
>>  include/migration/misc.h            |  13 +-
>>  include/migration/vmstate.h         |   2 +
>>  include/qapi/util.h                 |  28 +++
>>  include/qemu/osdep.h                |   9 +
>>  include/sysemu/runstate.h           |   2 +
>>  migration/cpr-state.c               | 362 ++++++++++++++++++++++++++++++++++++
>>  migration/cpr.c                     |  85 +++++++++
>>  migration/file.c                    |  62 ++++++
>>  migration/file.h                    |  14 ++
>>  migration/meson.build               |   3 +
>>  migration/migration.c               | 268 +++++++++++++++++++++++---
>>  migration/ram.c                     |  24 ++-
>>  migration/target.c                  |   1 +
>>  migration/trace-events              |  12 ++
>>  monitor/hmp-cmds.c                  |  59 +++---
>>  monitor/hmp.c                       |   3 +
>>  monitor/qmp.c                       |   4 +
>>  python/qemu/machine/machine.py      |  14 ++
>>  qapi/char.json                      |   7 +-
>>  qapi/migration.json                 |  68 ++++++-
>>  qapi/qapi-util.c                    |  37 ++++
>>  qemu-options.hx                     |  50 ++++-
>>  replay/replay.c                     |   4 +
>>  softmmu/memory.c                    |  31 ++-
>>  softmmu/physmem.c                   | 100 +++++++++-
>>  softmmu/runstate.c                  |  42 ++++-
>>  softmmu/vl.c                        |  10 +
>>  stubs/cpr-state.c                   |  26 +++
>>  stubs/meson.build                   |   2 +
>>  stubs/migr-blocker.c                |   9 +-
>>  stubs/migration.c                   |  33 ++++
>>  target/i386/kvm/kvm.c               |   8 +-
>>  target/i386/nvmm/nvmm-all.c         |   4 +-
>>  target/i386/sev.c                   |   2 +-
>>  target/i386/whpx/whpx-all.c         |   3 +-
>>  tests/avocado/cpr.py                | 176 ++++++++++++++++++
>>  tests/unit/meson.build              |   1 +
>>  tests/unit/test-strlist.c           |  81 ++++++++
>>  trace-events                        |   1 +
>>  ui/spice-core.c                     |   5 +-
>>  ui/vdagent.c                        |   5 +-
>>  util/oslib-posix.c                  |   9 +
>>  util/oslib-win32.c                  |   4 +
>>  105 files changed, 2781 insertions(+), 330 deletions(-)
>>  create mode 100644 hw/vfio/cpr.c
>>  create mode 100644 include/migration/cpr-state.h
>>  create mode 100644 include/migration/cpr.h
>>  create mode 100644 migration/cpr-state.c
>>  create mode 100644 migration/cpr.c
>>  create mode 100644 migration/file.c
>>  create mode 100644 migration/file.h
>>  create mode 100644 stubs/cpr-state.c
>>  create mode 100644 stubs/migration.c
>>  create mode 100644 tests/avocado/cpr.py
>>  create mode 100644 tests/unit/test-strlist.c
>>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F636E7D87
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 17:00:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp9Hg-0007iT-C4; Wed, 19 Apr 2023 10:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pp9Hc-0007hb-TQ; Wed, 19 Apr 2023 10:59:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pp9Ha-0002z0-Bl; Wed, 19 Apr 2023 10:59:44 -0400
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33JETQnZ010800; Wed, 19 Apr 2023 14:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=kMZQNVN1uY1j5csmVP0hwczadg5lSje4xKeyt4/RTwM=;
 b=DFtW0C5hI7bMYB194r8/Y8K0ah2WsG05XPgBuZdtL+HzFR9bBV4EGzG/7lrO4hg+ng3m
 uO5evdO7oM67IzTzZNbH2NsmaGsdMU+OTJXrNOQ5faJli+JmqR/B2xUCJDKFJ7PtXHzn
 k18zLECZu4v6kJ+8NJKt/JrxrxmAc0oju+C6UUwQdlzkbJZqn/Rxj3awf88+PbkUIzoh
 CMuyMNMp7xv3zn8kz2VRxv5K5BzLtqv9DtkOt8spoRl/LY1Wx5OSmKY8Q4n1MGz830we
 Eqn2pWsCA1wT46nVmLI9/jvIYEDeyWUuF9BIq4wzV4Uh8t5bD0IITXu2pLcT8aJTbtcC ng== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pyjuc8na2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Apr 2023 14:59:36 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33JE0rUb037233; Wed, 19 Apr 2023 14:59:34 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjcd2kgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Apr 2023 14:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxKjCTZZIIdPnEMQO8GXSmx18T46Jld1UDPVxnVicLD2/cC4PTjQ/XG4YvP2RIbzHhyNk3W8Ar9DYH0XT2o4ooYi/qtXI6lsT2dQ1mipCpijcVesimJk4MA6Sr7hfAZuYSvPGjGiBE46rUeMALA6NbAzA1rw60ByJSdSfOIduRV6a9iBd7cGC9n4zTn+8RViHBQlpVMIb9XFIBxdK/kKLx8g5isue1xX48TAmj7QVxcoXrPRz2++QwgOX74JEGAwUTA/WVyKr5LjE9jC1tyF2Lao6qRwJVRyg1PKo5lwRlNWk23IuqorFrEZg262825At6jIXAVLYCN+XPRhK9dGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMZQNVN1uY1j5csmVP0hwczadg5lSje4xKeyt4/RTwM=;
 b=XqAW7bL4cjRVYE//GsNrdn+rakoe6Et+8eq79m3uQh6gBVMcMYKyr40taZvPTKlrViGKptMJr9wsQkCoRQmkbtafjgI1zIBtwkr+uuSEbzprwlyrmf6Vu58aHo10w2Rj1ruBbiYn4A2CgIyFSRsKB76Yq3KgWcqr/FYffHFShUV2HjMwjbydg5vgbxt+8kQJ2kuEITe6VQjYpVlrqAeDe6eeThjdDJm/Bv0Pfnbu1zkBZpE+CTQKtCj0TMTu46Qimg04/Rb1IqcHWzlradGbYLc6QwPUYfLxwxI4CKWN6oxTSgRdjHy1d3Y8BdjPsK329pd8oCvji0f4czfoeSi42Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMZQNVN1uY1j5csmVP0hwczadg5lSje4xKeyt4/RTwM=;
 b=Kst4jV1pihC2jPoPgE4iZUZm7h1pWkaXEFHXeXCC36aGe5q40oqwzGIDHISRVPHPS4d12JlIECV1VR5E3C0jI3+OlXkR4q+qVjiA8Gu2zCmaAaJu4AoRYkwbqgCoTLqgiM+mBYCRiWxp4hcgSukgCWuN31IaLLJlC1EPeFQm3os=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW5PR10MB5763.namprd10.prod.outlook.com (2603:10b6:303:19c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 14:59:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 14:59:14 +0000
Message-ID: <21662d4a-bceb-c10c-9772-98c2e61a21f3@oracle.com>
Date: Wed, 19 Apr 2023 09:59:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 3/4] hw/acpi: i386: bump MADT to revision 5
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-4-eric.devolder@oracle.com>
 <20230419105515-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230419105515-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:5:134::26) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW5PR10MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: b58ef6a8-69cd-4674-8273-08db40e6a3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h+jh7cT167Q5OQ9v2oHjqDE2sQp8z3/NmvfmzJd2MAA+whWJ5XH1jEgdbYaDXpeDY60ZcqIIWPj/NkPFHQauyQBzpr1V03tqGNwkIWfUd56V2darJiBeUCuKLtpEU88ivbLXr08hv/W9T1z5kElOAu5fhuvug+yEmil2XsFzdq16xdr49SM7r8k28st+ioIvVqNlkorDvnt9nRGutR9AG3PFThfdu48nJlDchcn1HeYmuO1vFVdss2HQ5pqhzf59TAuW9UE0I03i3Au0Wqx531VJy01DpNiGEcro+WqO6qLRRmJdabTvxRkljPsuWDjrpDq81dkr/MhbYm83ghXIE3raqNMdlcxQryWdjZgEgtBmJEfgrsluf98Uvf5PKCg+nTe5/b2M/5zz2sblChOd1s7K6xG3zVndc5mrWoegYTnvpbKt9rhTTBfYwo7psEOD62qtTwO3gN1jsevT6GNG/16ssNXDRFSe29isUy09XP0BFGzJYMeMnGLXbRYX/FnJZeU524vMbTjztCqO00mXrC8uPKvaybKCuRtw8rSGj3q7zDglcsSe1KrPeJQeGaYT7/WAw0Xx/jMTaeQY4D0MIe6ZTpHbTFC/XFfsoBiersPp2ka5PjRr/mRNX6B1Sr8aZy2YSqnKWmxZoU+lX+d0Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(66476007)(478600001)(6666004)(38100700002)(8936002)(8676002)(316002)(41300700001)(6916009)(4326008)(66946007)(66556008)(186003)(107886003)(2906002)(53546011)(6512007)(36756003)(83380400001)(6506007)(86362001)(31696002)(2616005)(31686004)(5660300002)(966005)(6486002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3VCVVJLTE5ndVFaYkFaeVB6SFFOS05DUmw4Q2s5Wm1yQTdUMGQwSFBBY3U5?=
 =?utf-8?B?R0pETTZNL0tiTzUrTU1BZklueVM4Zm5EZHRScjkvMjNrZnBmRFFwUG9EeVlH?=
 =?utf-8?B?cTB1THNLNzFYYkx3cEtyYUFxQXN1cVFUVzBFb0RwQWZtZG40bmVvWWJtQlZw?=
 =?utf-8?B?RlZYVDRGVG0wZWhFQXRoM3VpRDF0VFV0Q1FhWUZXcFY0UWIzSllWWEFUa1RK?=
 =?utf-8?B?dk9YcVZJTlo1QU9MN3dUMTh6ME1QN0pmYXVuMXBSMTkxdjc3VjZ0RzRERDBG?=
 =?utf-8?B?T1F6YWxEWVUwMTZadk5DZkFtUEIvbXVoNHZ4cFVSN0VaYW1SQ2hLeTd6aXEz?=
 =?utf-8?B?N014Nm96U2xaYi9PSk9tN2MxRjI2Q2Z1TUhYeDA1dU9xcUduRjZnV1kvTVln?=
 =?utf-8?B?WDk0Q2RTSElTWkJpb0o5T2o0RFlXZ1NGdDhZZXpSTHNiWEZDVzl3emJVc1U3?=
 =?utf-8?B?VURoRGpBVUxWS3hZTEtMbEFINmpIWk1mZUJSWGNqa0M3Z1ppS3NTd056ak04?=
 =?utf-8?B?VjF6Z08rYXdTQ0pBeTNtN2Fnc2Q3SURYSG81Qy84dUlad2VkVlhQdFhaSlBj?=
 =?utf-8?B?V0NyMEsrS0dNbGFiSUhueUg0SjNJNkRqbE9CaE9PeERZdHc5aldIR1dpOFJV?=
 =?utf-8?B?RkpRN1lOc3pYeVgvTW9vd1dnamR5VFJJUkNCN1ZubG54YXlGV0FLVGxSRUl0?=
 =?utf-8?B?aUl5R0JYMkRWbVppL0hNanlnSWZhVzZXT2daeWdTS2RVN1pWWnlCakJuUEh3?=
 =?utf-8?B?cTFhOHgrZ3h5UVNPaWJtcUFmc2FyQUIrQk9sVnlhSGh3Zjd3UzVyMDVnU2Rs?=
 =?utf-8?B?ZUhVYnh5OTgwM1F6d0NOQ1V0bHVqV3poQzVxYzJhVmk3QUx2Y050RXdXbTQy?=
 =?utf-8?B?cER5TUQ2NFkyZkFoZHZDdlpVcExuUnpNOGxrYVU2NnUyVVBUTXNxMzdtOVdT?=
 =?utf-8?B?ZmZabTdoSVpvRUEyUDErVy80emRrT2RKYm5kbjk5d0lTVzk5UUZzaXo3YXJQ?=
 =?utf-8?B?ZVZJdzA3bmxPdDlXYitlYS9vSlZSTTh0dTRNZTIxNEc1RkE1cTUrcnBRdmU1?=
 =?utf-8?B?Rlc1SUIrU0ZvOU40bUhRUG1LWEZhRm9qVDNPb3lnc3Rld2EzSFlVMVE5b2ZP?=
 =?utf-8?B?cUFhTHZ0RWZlcmsvZlRMbGZmdFNzZWd4VWhRaC9kakYwOXBtRlpkR1ZFczNa?=
 =?utf-8?B?K3lOMUpZYVBRRUJJUFBtRGJ6MWJhR01sUkZCN1Bnelg0aTBHeVRsSFVFQndW?=
 =?utf-8?B?NHloRlFUOVQ1Qm43NkdheGVudXpXODVNLzY1T3h6b2R4U0hpRTdLVWlVM3c1?=
 =?utf-8?B?Z1VNTGxmdTl5L0N4SEVQV1JVNGZaNVUwcWtsZ0g0cnV4RDRmRDI3b2wrUGw1?=
 =?utf-8?B?RWM3alFXNzJSczVOdjBRQkU3aXJuTktTV09KdEJHN2hEeGFkUlRSWEZFTXpz?=
 =?utf-8?B?RkNoNHRDekVaNUNOblhUaXJFUnhwYjRBbDlyb1oyMlV4M3o4TkhMSlhHR0hr?=
 =?utf-8?B?N0lCcmVBUWFwbTZIVmFNR1lyMjF5clViTTdHRGtrdzdnWmV1L3diMDYwQ09N?=
 =?utf-8?B?T0dlcVQ5dEN6L3JLeUE3VXFzN2x6M3RCOEFsL1cxSzdldjNzUDFVSWwxbGEv?=
 =?utf-8?B?bHVmWFZQc0xsRGdIMk5Wc0FTQjV0L1NCK0UwR2dEOHRVaWRpczNjc0N0VEVK?=
 =?utf-8?B?MHRwM3dnRjNBR1p0eDVERUpCYnJXenVKNm93V3JYVFJ2aHBLUUg2Qlltc1Fl?=
 =?utf-8?B?QktPa09DVlZQNDFTL3VBOHNLOTdTRXhGenVLTVZTNlVZYjRTZVpTM3p1ZzZH?=
 =?utf-8?B?TDhUSkRrZ0liWWR0Mk1PQzBwcTdjNWdMUGhFd1RLZkRlcW5ZaGpxQXM1V2Vz?=
 =?utf-8?B?QWx1RG85czZ6SGh1bUlId09zVWF5Nmx1YVpPMjVvM1FCbVI2ZXVFZktuaGtD?=
 =?utf-8?B?Q0EyNjFQS1dyNFlBQXI5cEtkazVDS0VBd2hscDhHNWJRbXdyNk52NG5Kdm5h?=
 =?utf-8?B?VEF6Zi9XdW1aZkN4NmJRVUFBYnRreGRSaHRFZzZpY3pLQkEzdWh5azVZQTl1?=
 =?utf-8?B?c1RCVlhFbjNxVlFqMTBYNTl1UnFKNFpJLzh3WUpkSUk2T3hIUjAwQW9HcE41?=
 =?utf-8?B?anoyMFdCbStWYnBOYWhjR3BLcGJiUStCdkhYdytaVDRPUnVwc0E5c0J4b2cw?=
 =?utf-8?Q?z/PgAu4JrWmENNUkfJPBFo4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gBEoN72NFMX6WT6Ohc72076cTj4NTxRszMv+4dZDCVPzT8ZP3YOzhRZ+UkrBUJHOFUVIrTkNTKvpfb20NcYYY5YsZpDTdyX07cCnkVUgb5c2KAJ8kg8xAscby5Cz5EqyN7ccgM7Cpmi7d+Iga0XBC3ISamKoYGoIK0po82LET6gie5e5Ek8UZz+FX+KG+pPVh1ZsXRT1f7NXcJCkO2LLis0pZJfXxnQTUSKGvxd/7HgD7wPzSHxUC83lSSR7cTyFNuAe75DMt3X+WbIvProA3rIpwraGGdnIy7E4Gg69zyk+C9cvEGk3wqeWUjTeMdzWpMVTu+QQBmT0ppq7YgTeqKY4CuCAnNTX34oyzbJqCQVoeSGdJbi8poW+yJVkOKvO57Tl0zS7mhGuIg+n0Q7dw7xohNDES0DeP63FNSkD7ddt1+lIEsUDs1l8XJyIxShZJv1+Fo8QwJXvF3doffkrP1KsV9i+TVeh3LwZfKgAV8WjkCKwYBboqhn7ZqvOWp+qpCRzs4ERYVnzk4Hb2Bz2Dme2uTfxQNBIYA/y3++iNilSi2b9k8PyiXmXcEdFnXAmEAaTtKj/iisKBYsHAB1NUpaMOmrRWAgs0dyVSJ3HKYDGj1Z+ldiXDTW1Li6yxlsuGx5P1HNCHsHXP+uMQ5VWMufY8qmtHDxCpF8rhdI6hy0D4ze+jO0i7VBwXCZBXj0jRYVwkL1goIMhwT4zutjL/h7ufspCcXHfSB7RMu1ztjaVuBAMVybNOBrpcVUjMeeef7xchtUlYCOzlOcfvSInqBVZRVCqMe3PmVxH9jGQ0UAroyUuKqJXyVypy38jmkBkGXiZoAr58HXfTyPsBOVb8AmflTUFJW+LvZVoTNTSaxBPtBCHIyrzFC5kw6Chg73VIsNR/FTFCccOjyWXLjGo9Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58ef6a8-69cd-4674-8273-08db40e6a3f9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:59:14.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaXscGLgA03IwPcRlEzJt8nITIefIq+AD+IGpeB/jkwj4W2KSjNSxQvTGWOPQI7lSb4FI2cFi+WolgQcVdpUInMIQy0XvS+N/+vX5zmk28k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_10,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304190135
X-Proofpoint-GUID: 69hyp6lq33J_zyx0FsxMO4LpnSUTz3ja
X-Proofpoint-ORIG-GUID: 69hyp6lq33J_zyx0FsxMO4LpnSUTz3ja
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 4/19/23 09:56, Michael S. Tsirkin wrote:
> On Tue, Apr 18, 2023 at 12:52:18PM -0400, Eric DeVolder wrote:
>> Currently i386 QEMU generates MADT revision 3, and reports
>> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
>>
>> For MADT revision 4, that introduces ARM GIC structures, which do
>> not apply to i386.
>>
>> For MADT revision 5, the Local APIC flags introduces the Online
>> Capable bitfield.
>>
>> Making MADT generate and report revision 5 will solve problems with
>> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
>>
>> Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/i386/acpi-common.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
>> index 52e5c1439a..286c1c5c32 100644
>> --- a/hw/i386/acpi-common.c
>> +++ b/hw/i386/acpi-common.c
>> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>>   {
>>       uint32_t apic_id = apic_ids->cpus[uid].arch_id;
>>       /* Flags – Local APIC Flags */
>> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>> -                     1 /* Enabled */ : 0;
>> +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>> +                     true : false;
>> +    /*
>> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
>> +     * if Enabled is set.
>> +     */
>> +    bool onlinecapable = enabled ? false : true;
> 
> Pls write this as onlinecapable = !enabled or just open-code on the next
> line - does not look like this variable adds  a lot of value.
> 
Will do!

>> +    uint32_t flags = onlinecapable ? 0x2 : 0x0 | /* Online Capable */
>> +                     enabled ? 0x1 : 0x0; /* Enabled */
>>   
>>       /* ACPI spec says that LAPIC entry for non present
>>        * CPU may be omitted from MADT or it must be marked
>> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>>       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>>       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>>       AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
>> -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
>> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
>>                           .oem_table_id = oem_table_id };
>>   
>>       acpi_table_begin(&table, table_data);
>> -- 
>> 2.31.1
> 


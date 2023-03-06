Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128636AD2AD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 00:12:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZK0P-0007Z2-0b; Mon, 06 Mar 2023 18:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZK0N-0007YM-J8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:12:31 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZK0L-0002z7-O2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:12:31 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326L9rnN024395; Mon, 6 Mar 2023 23:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=9h65tIoQJV75suGWKHbrC5mtX/hveKq1cmtKQALJ0pg=;
 b=pK9lk36UVJOUZRpbDuHrrcbj+cPovwNOndQeqQt2MhkHRpdEsHczne5pmELAjANy9zYK
 8vmsGGvZeVX+QY5dGhi8fFdRJI2VmI72gAME64ntaWy8yABojONLNuSYR+HcK2yHylu+
 TjUZRzDtU2Z/qI0rxXeOkWUvQ5hoZSD5WSv6TRjGHeZri+C8QKXuQUNuVYiAOUNn30u0
 E86f15th4zpUQ2BOqNuRQAsqye0C6CIupBBRS9GZaLdeisC+L65yT2wWB8lOqS+yrypo
 hIkJ/pNcaybRz30PGRT3jIf55Lw0kbbwKdKTdp1zyqWU5T0dBeWkVjKZ3NScOT0zESDo Zw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4180v6tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 23:12:28 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326MU8U0037537; Mon, 6 Mar 2023 23:12:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txdp5gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 23:12:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4oLC+wZzOZggrnNDanywz+to0PoBTytgAmyoFkCaAZTNV0q6qQmB4xktoEiHMHI5ujERajtrHrLzrgqFnHDAlHyiHqGf3RdwQUilfFX/57OBpt2s7rcjBAmCMFEz75Mt18GioDcZ0gto2k1o3bOAKxkxkA8Zc4VS+YgQb90vhRQYR/4aNDibaJzfboc/NyQHYU3o1Xop+JkB9fvRJgMxUGOTmZ7mX9CDzksNDqqEkU8SU0j47EgYq9ULNAs+TkWcfsc5E9SML9nD8zbBbZRbENk7341dl3THBIl2o3OIZrQM5q3mjEh0cmSVbkIXkWZdNQsxUGGEQPC/DbZTCk9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h65tIoQJV75suGWKHbrC5mtX/hveKq1cmtKQALJ0pg=;
 b=SkX4y0A3aZ1CjfoleqfM+EttZAozmc2yvYzAA2Z7p9YN9EUJOTpgzHyu8J8EhKM7z16jJkrHdMWhvypZBScyDoWyYXEsnHVkmHK77n+SHcOrh+ZH0u+BgiDtrCq4BCyQocllhw4idVTmCs0T3P9wlQuBabZhyIVf60UOIeLedTGKbo1a4WdCiohDbwLoUOLqRcOtRixedGVHd3NCcSKfEGM0/otTODdYGR6H1VHKlO9zNK64SpcFLxBHxTWTq49420ISIkI1TKVUzfOHiPQjmh50l1K3epF3Vp3g1kH9I2DsxX/sZTuu55o5b2X/WpOdHSAK1oTynniTgkGzH9KN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9h65tIoQJV75suGWKHbrC5mtX/hveKq1cmtKQALJ0pg=;
 b=dy0YdLbt7HeOdtl1jVxWdX6YYyBwGlkjKleHKBRMAjn6D62uTJPFL7DwTUneX/EiAcML/xRic/nJjmkO1F7XyrvEEoMFMX1H85zQJBqHRx4mUywyl5k5RR0T4x1g6sLecJncTt90GVAbwGFbxFXOdfE8XYaMnDWnUM8V/rFDZHg=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB7006.namprd10.prod.outlook.com (2603:10b6:510:285::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 23:12:24 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:12:24 +0000
Message-ID: <f3a9bbe5-21fa-b92f-9817-4214477e18b4@oracle.com>
Date: Mon, 6 Mar 2023 23:12:18 +0000
Subject: Re: [PATCH v3 08/13] vfio/common: Add device dirty page tracking
 start/stop
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-9-joao.m.martins@oracle.com>
 <20230306114228.722419ea.alex.williamson@redhat.com>
 <6b716cb6-2b75-bf6e-bb8b-907fd17e8040@oracle.com>
 <20230306130025.4a7ea606.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230306130025.4a7ea606.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::22) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH0PR10MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: b01c0242-7e0b-48fa-ed66-08db1e983ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: je0yO0G2mBwtmZjk4kd8p+S4bIYjPI2NB3jNY8/2pl4ichO3jMdPToFQU8hPsMylGatR0jkgr24ZefmtEgEqUrTQpoihQLl74135d2MrS/hbvbHxBzKNfLSttxA3jiCip+O/gHyHV/KMKQ9uboStlpW2lPbsuWcl2UpTFzRmTN1bmEjQukmlCRVD1RABAqDds3dXiu1YbdPc66X7lWCsy2EhK0ziax9nJnqoKt86ACIkqn1SfOfxzZsvNd9wxvUJX9bM44Ue3c4TwtlbU2MuTUsJJuLuJ4Z0NRkly/GjM+CKZ2UUzhZQINXkZ1clfRj3wcQJ9zJgjeTVeIM3ZxetOEIR2RdoN3AffFymRThjVTogSp8YokQHDACBKITdjH/W5A6cXrxyaeVugqouAOGY9gYHOSqM/CPvBZL04548/z6PC3ZAxPYzhJTp6lnXLXCMF0gv1221HDybAjdq5Z7pvXhWQD12ffntIMwdHD02PUNxlPHg2eKcX7q8JZM/AaW8fjgjY0WRBqw+JONUeuDaA+xwm53kJE4aOBGVsyrZF1kJ4Xv6ZE3kE9Yhc9pMTFbLKyERGkSZBGo2ba3OhYQfgg19A5mCiFNyhF693pPpx30rTkcjFLKmfkm6pe7Cb4TGffVJw9PtuPh/m/JwYXxVttdW59wez2mxlTfqiWltLmm33d4q4qhQKy1TtfLIJr2dBEUqv7rjCHhqWuQoTSdikM2QswzIkdxfGUR1nYNMVail4ipaGrhndtOj9DAlc0sS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199018)(36756003)(83380400001)(53546011)(6666004)(6512007)(6506007)(41300700001)(186003)(26005)(2616005)(6486002)(5660300002)(6916009)(8936002)(66946007)(2906002)(31696002)(86362001)(4326008)(8676002)(66556008)(30864003)(66476007)(316002)(38100700002)(478600001)(54906003)(31686004)(14143004)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkNoMUlRNFZEOEdlc2JnZTZzZllxQ1QycjlDVEcyUEh2alN0VFkvTDNEKzJE?=
 =?utf-8?B?SHJ1ZWw3NkZySG12UE03OEtUS0p0RnJIQkJLZmpDSFowbDJpdCtNSU9kUzBp?=
 =?utf-8?B?czMwYVhuT1JuSUtRcUJWby9BeW5zVWUyWlJ5WGJ2a2krcW1BNXpjR3RvTG44?=
 =?utf-8?B?bXZhYmlpVTFYYnEzQ3o5MFRHdUhQSjF2cUJwMlA3Y2F6Y2lMK1hiQTJQcFFa?=
 =?utf-8?B?VUI5UzdFZGZaV3Zwd0daYmNHNjBiMTFMSkN6UjdCVjV0elhrZUxNREh2SkZz?=
 =?utf-8?B?eU5qb3BLQVdrS3lvRTlxVzlDczZtS0hUbXlING9wQkZwZG1nbVBXVFVZdURG?=
 =?utf-8?B?MzJIZk9CVGNPcjRERzBOaVYraXNIMkNVSmpWWm9KdllWMmhEQUhlQyt3V245?=
 =?utf-8?B?bHhQcW5BZDFIUHFZR1FPenk5RXpodnJsRTlFUm1qWkMvRGcwN0E0eDJnOTBm?=
 =?utf-8?B?UFZnY3Zpa29Ham5UZFAxWmREU3h5bTh0MzM2anNDNzlTNXZQZUJjeEFmY0Yx?=
 =?utf-8?B?YVVmRUgyNGhwU3R1YVZteUFyVnlRVGJYVGt4V0xuNHFwb0NPTVFNNCtpT25p?=
 =?utf-8?B?emx1Z3h6c2RWNUFPZmVpSHdielJBZEtScXBYOUdhZ1RmSmJ6YzV1ZU5iMnhx?=
 =?utf-8?B?YXdqVHBqQXluc2tKZ2VBSEJpanludzNpWksvRWFlalphVGRVMjJzMXNEZ2FQ?=
 =?utf-8?B?NUN5bnJYZUNGNGhSV1doUXRzeGt2TktYZ3A0aGlraDJodzlxMGVkWm9MaU1M?=
 =?utf-8?B?NVdYYmZCOVZ3Y2pqQ2xuUzVtT1pXOXhGME5HS1JLOU05a2tHa3hCOFpQMkhH?=
 =?utf-8?B?cllFWDhVeVBZOVBKMW05aGZmUTFpZVV1VDByTmJlbHJiMHprVFIvSWFndnhG?=
 =?utf-8?B?OVk5OEZ1cWUrQmVveUcxK0RhbVo5STgzUjdYYzFMeEpoTDV1ekZZRnlSUUZ4?=
 =?utf-8?B?cEtDVzgwM3NtcENta0hnanFyR2ZMUVRvQ2x1bWt4NTYxVGVMMXR5dzErL2xQ?=
 =?utf-8?B?Y2dKbnFRdVNBSEtrK1o5Mk5wNUluZHdaZEp0eno2clhRUFkvSjc5THNNK3VU?=
 =?utf-8?B?ZU0rOG5VbzdHTEVHb00weDgrWXVDVWwxSW1wNXlKWTNwbDQzMCtPZkpUY2Vt?=
 =?utf-8?B?MXprOWhKeS9pc3E1U0FqU2VqNkNCc0V3KzNkblAwTWRJV1UvOGN0eWJubldS?=
 =?utf-8?B?cEJPVDhKZ2JHZHUwdFdTSFdOdW9XRFg3WldEMW0wb1psSlhuMUFnbGNDS0pv?=
 =?utf-8?B?V05VT1JVb0grN01EekowcnR6cXROS0pNblNSMUg2MXNTUzBSMlJRT0RKQnIv?=
 =?utf-8?B?bURjdnlMUGlMa2lZUUQ3V2tXbkZxbEpFT1RjMEpuVDU4MXlRbGlIZ1dWcklR?=
 =?utf-8?B?aTdEVWlmQXlDa0lseVNGUWw0elRTaW5nMi9CenZKOGR5VXR1bzRmWVJ3ait1?=
 =?utf-8?B?Tm9ZdHNEaTVtVXJBUzd6dVlzUFY5alB2TGo5amtFNldCenVkM0hBWVlSOGtZ?=
 =?utf-8?B?WnRvV0c5M3VTd3B3dTl2cDdkVVAvcklDQkU5YzkyYzBZSnhoOGNvVnBFcHND?=
 =?utf-8?B?cCtWSVo1S0dHVUJTbXlXQmF2dFpjbU1HU2o0OXpwTys5ZEYwMENoaXNUbTFR?=
 =?utf-8?B?Vklqc2ZmRWhRWU9XVzVXT0RDdGtMeWlUYUQ1aUZualhHcDVDTmR4anU0Mmdv?=
 =?utf-8?B?YTA0S3FNWWwyOVpRVThXcGkzYndtNWkrQVZ3b1lvd01kWHRoNW5JOFoyd3Fw?=
 =?utf-8?B?cUtXMnpsUFpKT0JaM0I2MyszaXlHanVmMzJ0aEJKT3FHeU9wTmFMdjhPVDZD?=
 =?utf-8?B?Y0Vkc0ttTGV0UXdVTW9DOFp1YlBjeFR1NTRaNG1MaDdDQUNYMlZUYzRFdVAx?=
 =?utf-8?B?Qmdoc05jSUdYZHd3czVVQTlkbDMyMUlXU29PVlRna0xOTHQ5ZFJpb1JMNWhD?=
 =?utf-8?B?WTFZRWUzbThPQWZtOStBYmVMTTlxN0s2R2NlZ3QrNTRQZnd0YUVGbjZvSkJ4?=
 =?utf-8?B?YVh4NjJmMFp4OVVuNy9TZS9JVytGUDVWWkpKT3oxNkdKYmRUd2cwbEVkNVNw?=
 =?utf-8?B?ckVPSkZWRVkrNEMzTXFqN2RVcVZMeFVWa0JyZU9WaTJMVWdpbTBVaEVIU1do?=
 =?utf-8?B?QlRJRFhJS2R2VlVKK1NwL2hNNGFqdDhxdzE2YnpHS0dHbFQ5SGJod1VBdFow?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: st0IszHd+9nKd+qkWIVohlcB4WXKdwdrBuem9vod9CpLBhxosTX2wtIsSPGZmwbR4gz4K6lN39jvE/3kE8OBUXXd74J5v+8ZV/XypzWghqZhHLAfJTi9tcHw/nBR0CmQmezb1L67vDWp7yT/T0y/+8Wekp9PyRdXzsM1EEbIY+9RsmkMHWvrLgmK8s1x4D+hU4V94js9hwWjTV8CzMods1HppKptCrn2uIMXg8CN85Rc8a8TwbPuNhoV0qkvSihLKBdSYz+nOWb70w9eNQOkE3AUJv4j9Xbpq7a7acdUM1kDgHw4yVXIKzTVlf+XNqiCh12XsP70kuQJCisMWR/5+d+V3WkjcDDkT5wwXeTaP1UygGqyGR18n8YfIBz2yBeXlqU4tGZHOyNyY1tP8sx1Ec1BE9Oj47owUrT5KBhc5WK0noug+c98PpS+2dq52baUs6KZXA8rRBUZKd/guQX9i1u6ZmRW9xRwCzbqZ8tkXHRcIYMgCxcVR62+lqUxlbz19MWJXPIcbxd1MJ/bZSleIS0PdSE7K9HtyRYFrECFFkPUwWbjYySP1StBIkxeF8R++nI8wPp0QJTwgTsoN4gla2mAiGYYL7aVn/q1wZPRm2nqrmdV6k5OfNtuxEK1Xk6jnFYkwX5RKNfsbR1eyjloLDrJaShT2CJTKWZgsNMWWVkNs6LPUnWGdrTF9Zc0u9EcbmNHRwXOkU1kTvuQj9iLvgX0w8qDQ49aEdGOZ/bCwl9q6ovWCxeW0DDYYYFoIIqraaNEQbUZgSpDMk9bNhApx48vKNkTbBM2mZhSEDHLqjnjLAq6jOBW41QO/PasCJUN
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01c0242-7e0b-48fa-ed66-08db1e983ea9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:12:24.0430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUzta05274Gwe1hnomaFqkNul2uBL7mFwg+RLtu0vQjX2Cj5BB1XsUkPAyNFZnNgafiMvTjXXVFn5p8N6P0hmNvze/DXeIcxvDD2GXZQWpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7006
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060201
X-Proofpoint-ORIG-GUID: uCZLXP77JZpC35-eJryRrwgseE78ZrFU
X-Proofpoint-GUID: uCZLXP77JZpC35-eJryRrwgseE78ZrFU
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



On 06/03/2023 20:00, Alex Williamson wrote:
> On Mon, 6 Mar 2023 19:39:15 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 06/03/2023 18:42, Alex Williamson wrote:
>>> On Sat,  4 Mar 2023 01:43:38 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> Add device dirty page tracking start/stop functionality. This uses the
>>>> device DMA logging uAPI to start and stop dirty page tracking by device.
>>>>
>>>> Device dirty page tracking is used only if all devices within a
>>>> container support device dirty page tracking.
>>>>
>>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>>> ---
>>>>  hw/vfio/common.c              | 166 +++++++++++++++++++++++++++++++++-
>>>>  hw/vfio/trace-events          |   1 +
>>>>  include/hw/vfio/vfio-common.h |   2 +
>>>>  3 files changed, 166 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index d84e5fd86bb4..aa0df0604704 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -453,6 +453,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>>>      return true;
>>>>  }
>>>>  
>>>> +static bool vfio_devices_all_device_dirty_tracking(VFIOContainer *container)
>>>> +{
>>>> +    VFIOGroup *group;
>>>> +    VFIODevice *vbasedev;
>>>> +
>>>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>>>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>>>> +            if (!vbasedev->dirty_pages_supported) {
>>>> +                return false;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>>  /*
>>>>   * Check if all VFIO devices are running and migration is active, which is
>>>>   * essentially equivalent to the migration being in pre-copy phase.
>>>> @@ -1395,15 +1411,152 @@ static void vfio_dirty_tracking_init(VFIOContainer *container)
>>>>      qemu_mutex_destroy(&container->tracking_mutex);
>>>>  }
>>>>  
>>>> +static int vfio_devices_dma_logging_set(VFIOContainer *container,
>>>> +                                        struct vfio_device_feature *feature)
>>>> +{
>>>> +    bool status = (feature->flags & VFIO_DEVICE_FEATURE_MASK) ==
>>>> +                  VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
>>>> +    VFIODevice *vbasedev;
>>>> +    VFIOGroup *group;
>>>> +    int ret = 0;
>>>> +
>>>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>>>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>>>> +            if (vbasedev->dirty_tracking == status) {
>>>> +                continue;
>>>> +            }
>>>> +
>>>> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
>>>> +            if (ret) {
>>>> +                ret = -errno;
>>>> +                error_report("%s: Failed to set DMA logging %s, err %d (%s)",
>>>> +                             vbasedev->name, status ? "start" : "stop", ret,
>>>> +                             strerror(errno));
>>>> +                goto out;
>>>> +            }  
>>>
>>> Exiting and returning an error on the first failure when starting dirty
>>> tracking makes sense.  Does that behavior still make sense for the stop
>>> path?  Maybe since we only support a single device it doesn't really
>>> matter, but this needs to be revisited for multiple devices.  Thanks,
>>>   
>>
>> How about I test for @status and exit earlier based on that?
>> (maybe variable should be renamed too) e.g.
>>
>> if (ret) {
>>   ret = -errno;
>>   error_report("%s: Failed to set DMA logging %s, err %d (%s)",
>>                vbasedev->name, status ? "start" : "stop", ret,
>>                strerror(errno))
>>   if (status) {
>>       goto out;
>>   }
>> }
> 
> Yep, exit on first error enabling, continue on disabling makes more
> sense, but then we need to look at what return code makes sense for the
> teardown.  TBH, a teardown function would typically return void, so
> it's possible we'd be better off not using this for both.  Thanks,
> 
Agreed. I can unroll set into _start and _stop and turn _stop into a void function.

> Alex
> 
> PS - no further original comments on v3 from me.
> 
OK

>>>> +            vbasedev->dirty_tracking = status;
>>>> +        }
>>>> +    }
>>>> +
>>>> +out:
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int vfio_devices_dma_logging_stop(VFIOContainer *container)
>>>> +{
>>>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
>>>> +                              sizeof(uint64_t))] = {};
>>>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>>>> +
>>>> +    feature->argsz = sizeof(buf);
>>>> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
>>>> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
>>>> +
>>>> +    return vfio_devices_dma_logging_set(container, feature);
>>>> +}
>>>> +
>>>> +static struct vfio_device_feature *
>>>> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
>>>> +{
>>>> +    struct vfio_device_feature *feature;
>>>> +    size_t feature_size;
>>>> +    struct vfio_device_feature_dma_logging_control *control;
>>>> +    struct vfio_device_feature_dma_logging_range *ranges;
>>>> +    VFIODirtyTrackingRange *tracking = &container->tracking_range;
>>>> +
>>>> +    feature_size = sizeof(struct vfio_device_feature) +
>>>> +                   sizeof(struct vfio_device_feature_dma_logging_control);
>>>> +    feature = g_try_malloc0(feature_size);
>>>> +    if (!feature) {
>>>> +        errno = ENOMEM;
>>>> +        return NULL;
>>>> +    }
>>>> +    feature->argsz = feature_size;
>>>> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
>>>> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
>>>> +
>>>> +    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
>>>> +    control->page_size = qemu_real_host_page_size();
>>>> +
>>>> +    /*
>>>> +     * DMA logging uAPI guarantees to support at least a number of ranges that
>>>> +     * fits into a single host kernel base page.
>>>> +     */
>>>> +    control->num_ranges = !!tracking->max32 + !!tracking->max64;
>>>> +    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
>>>> +                        control->num_ranges);
>>>> +    if (!ranges) {
>>>> +        g_free(feature);
>>>> +        errno = ENOMEM;
>>>> +
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    control->ranges = (__aligned_u64)ranges;
>>>> +    if (tracking->max32) {
>>>> +        ranges->iova = tracking->min32;
>>>> +        ranges->length = (tracking->max32 - tracking->min32) + 1;
>>>> +        ranges++;
>>>> +    }
>>>> +    if (tracking->max64) {
>>>> +        ranges->iova = tracking->min64;
>>>> +        ranges->length = (tracking->max64 - tracking->min64) + 1;
>>>> +    }
>>>> +
>>>> +    trace_vfio_device_dirty_tracking_start(control->num_ranges,
>>>> +                                           tracking->min32, tracking->max32,
>>>> +                                           tracking->min64, tracking->max64);
>>>> +
>>>> +    return feature;
>>>> +}
>>>> +
>>>> +static void vfio_device_feature_dma_logging_start_destroy(
>>>> +    struct vfio_device_feature *feature)
>>>> +{
>>>> +    struct vfio_device_feature_dma_logging_control *control =
>>>> +        (struct vfio_device_feature_dma_logging_control *)feature->data;
>>>> +    struct vfio_device_feature_dma_logging_range *ranges =
>>>> +        (struct vfio_device_feature_dma_logging_range *)control->ranges;
>>>> +
>>>> +    g_free(ranges);
>>>> +    g_free(feature);
>>>> +}
>>>> +
>>>> +static int vfio_devices_dma_logging_start(VFIOContainer *container)
>>>> +{
>>>> +    struct vfio_device_feature *feature;
>>>> +    int ret = 0;
>>>> +
>>>> +    vfio_dirty_tracking_init(container);
>>>> +    feature = vfio_device_feature_dma_logging_start_create(container);
>>>> +    if (!feature) {
>>>> +        return -errno;
>>>> +    }
>>>> +
>>>> +    ret = vfio_devices_dma_logging_set(container, feature);
>>>> +    if (ret) {
>>>> +        vfio_devices_dma_logging_stop(container);
>>>> +    }
>>>> +
>>>> +    vfio_device_feature_dma_logging_start_destroy(feature);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>>  static void vfio_listener_log_global_start(MemoryListener *listener)
>>>>  {
>>>>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>>>      int ret;
>>>>  
>>>> -    vfio_dirty_tracking_init(container);
>>>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>>>> +        ret = vfio_devices_dma_logging_start(container);
>>>> +    } else {
>>>> +        ret = vfio_set_dirty_page_tracking(container, true);
>>>> +    }
>>>>  
>>>> -    ret = vfio_set_dirty_page_tracking(container, true);
>>>>      if (ret) {
>>>> +        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
>>>> +                     ret, strerror(-ret));
>>>>          vfio_set_migration_error(ret);
>>>>      }
>>>>  }
>>>> @@ -1413,8 +1566,15 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>>>>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>>>      int ret;
>>>>  
>>>> -    ret = vfio_set_dirty_page_tracking(container, false);
>>>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>>>> +        ret = vfio_devices_dma_logging_stop(container);
>>>> +    } else {
>>>> +        ret = vfio_set_dirty_page_tracking(container, false);
>>>> +    }
>>>> +
>>>>      if (ret) {
>>>> +        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
>>>> +                     ret, strerror(-ret));
>>>>          vfio_set_migration_error(ret);
>>>>      }
>>>>  }
>>>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>>>> index d97a6de17921..7a7e0cfe5b23 100644
>>>> --- a/hw/vfio/trace-events
>>>> +++ b/hw/vfio/trace-events
>>>> @@ -105,6 +105,7 @@ vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t si
>>>>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>>>>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>>>>  vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
>>>> +vfio_device_dirty_tracking_start(int nr_ranges, uint64_t min32, uint64_t max32, uint64_t min64, uint64_t max64) "nr_ranges %d 32:[0x%"PRIx64" - 0x%"PRIx64"], 64:[0x%"PRIx64" - 0x%"PRIx64"]"
>>>>  vfio_disconnect_container(int fd) "close container->fd=%d"
>>>>  vfio_put_group(int fd) "close group->fd=%d"
>>>>  vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>>>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>>>> index 96791add2719..1cbbccd91e11 100644
>>>> --- a/include/hw/vfio/vfio-common.h
>>>> +++ b/include/hw/vfio/vfio-common.h
>>>> @@ -154,6 +154,8 @@ typedef struct VFIODevice {
>>>>      VFIOMigration *migration;
>>>>      Error *migration_blocker;
>>>>      OnOffAuto pre_copy_dirty_page_tracking;
>>>> +    bool dirty_pages_supported;
>>>> +    bool dirty_tracking;
>>>>  } VFIODevice;
>>>>  
>>>>  struct VFIODeviceOps {  
>>>   
>>
> 


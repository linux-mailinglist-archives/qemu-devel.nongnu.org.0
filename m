Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816E6ADB82
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:12:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUII-0005Ff-FO; Tue, 07 Mar 2023 05:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUIF-0005FT-Q0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:11:39 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUID-0001dg-RU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:11:39 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783uGb007683; Tue, 7 Mar 2023 10:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=KSxkTRiMoa4KF0XB9oyfczEZU0IsfBMGh7PKWwMEa60=;
 b=kbXmaoNVH2sO28IS7tUHu0rhaDqeYwHDxDyU7wNDPH1Oo+ZJ1s2Bu0VnXx7M9mUs9RXk
 WEJ2iOCDqL0h932a5RdOkVp6h7SA0tHNmTpeadtsU5T6zJ2QbnVP2f1r/0auNab9dTn6
 OTQAk2TPM+VFl6jN/HAYVP5PfdMyYCyIFZblO+x0SnlWHq4lU0RguLkbmOXecBsG3Acd
 166kIh37HVxZLXqzc94BM/WcoPImiRfD7Gemr4lJvNU6E/a/C1IpoHF5SiTnH1MRXWCl
 qzhXIwlcqjPHgBgbkboLvWvBsl+wfWuF0uObtR/gtwrp7En0gMQ5qgSfcU3g39jKk0LP 0g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn91ex5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:11:34 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32787Ymv024268; Tue, 7 Mar 2023 10:11:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u06142n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:11:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1/yxkiM5gV4QHEQTaGXNj6JCtPdfLzJo+wRDW76MUuPPhQifCsn+IpgiPOoj1eONSjIrlyzkkhVlQYyReAEsiAwqlzVa7DzW3yz7fM7bV81dieIMwnqkeHkvmRw6j8CMSn1M5vlzIm6hQRc+QYcjXu1X0dYpFB+xM+XosCH+N/ms+VCBlolLnxr8pkUiFPvTDihE+f+7WNlS0qi6oUvYa54VZlMEK0naBjXfcvmBKjbJ24VFwXJ2Abepgd+aXuHGxCtCy/Sq38fwE83ZXyMIcyw9aGbAnVQvs1Wo8mEpNQ/nDw4K5jEIRjQtNqCgY4+sOBkfftNN9jqFi+0MP5dDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSxkTRiMoa4KF0XB9oyfczEZU0IsfBMGh7PKWwMEa60=;
 b=OIm3kfkjJdq9PBkqrJQvL9ELTbpuXycFl/oFx2N8hU2qHhZukL+ByNnk+U2RkyDbmMRA1EQqh7HiWq9gBHbL5W+OBX6/KJelIiEuCsVWxSqeinXniDil7ixACl9QJf+DEpKWgV7sJhJ41m0KWnrvTC7gHB6SoItv95uxt+vmOoizr5L1Gz6s3Ue6TReSZNiOw9Xt/tCrcDtkFjiFX/GE8mh9ACJa/CfZfgDhUpBI37HsqJMcAiQuRvAxOxXiUVbYlJVU543wlkc/df5vV09OWLHjnG7lzyhWVVsCjKdXUKmxM84Sm7JykDaG4L9Bh8YIF5TrNUoqXdJBGCdn88o0Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSxkTRiMoa4KF0XB9oyfczEZU0IsfBMGh7PKWwMEa60=;
 b=VZ7EZ/bPr9QtxC8Sa7fa7bpIv0ygRkCIV0Pp9qdTG91s+shhFon/OfMGV43xzsQxlNU5pb6lams83xfeOsJo0y/4v05ZBe7zQQPx1vy4Pz4wtj/6kYEFy43ObDzyi0orzQXMr8xs03SNgfSLkWFxrelPXrpKXggLFOKDBCdeyP4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DS0PR10MB7067.namprd10.prod.outlook.com (2603:10b6:8:145::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:11:31 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:11:30 +0000
Message-ID: <659cac8f-bce5-9d0f-2a7d-2765429ad49a@oracle.com>
Date: Tue, 7 Mar 2023 10:11:25 +0000
Subject: Re: [PATCH v4 07/14] vfio/common: Add helper to consolidate iova/end
 calculation
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-8-joao.m.martins@oracle.com>
 <20230306194053.36cbfe12.alex.williamson@redhat.com>
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230306194053.36cbfe12.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::16) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|DS0PR10MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1016e4-d0c4-4929-6cb1-08db1ef45268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X108ApXUzHWmvvf3DHMcTzUHmljo5t6xU3n8DhvKOKBSZ5hF9ZwouLfzAfqfPqB4CN5DzWc98Jr4tznmaIEIo15aHvpTcisYLpmy62n6Mn75E+lgNncv2H843Wl+VB+OvKLljAHg70Jb3kzDqCz+72RAQalKjHd/3RYJlZu6ee0AWi33MZuRKH2t6l9JjaP87p7KZomhrAHkU3nJCo1cE6QPrqqktGqLPfKRkVG4zu2uwoXaUn7mMOqyHH2Tw/0H0wYCAum0H3BsEjpm7Z2ZVnPQHSR1BMO+huRqroTzKDVsCWFMuvtmVIq/zVlyyg5TOIJrQFbhPBxLb9dse4XM1X6MFm1t1xlfOLAzdU+Jz2Vz/4adh0qlQAzBwpfAqBs7Z47+RWXIzXtNWCI4wZUPkwZEHT7SaWSiRJ0NcXAibFTyshkJcP4irKqKlDaGbpokxcBXUJeHTEbB1V8vp78eP7z0X2P/so0TujcjDO+DSQGILKx8o/uaXc83PYyTAxA5oLhEw5lSHZSmv+k9xOWt6m8pF6N4t0gaqobVWQsUhu6rgSp78QMMd5IwFbfos2iv7qKO0nbhLIWcrIeU2AN5cTauUIqaBAzpThAIXfOEZ9GH6HqjxpNjwkB+KJEx1bRiW0hjN9hq6e8zI5r+MQvUNiJvNstEnRbPKXK3u/XQgCyWPp2EOdAw55SmQ8vyxpZUwf0AE35ERdVfAQMqVzuM2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199018)(31686004)(5660300002)(8936002)(2906002)(41300700001)(4326008)(66946007)(6916009)(66556008)(83380400001)(66476007)(8676002)(316002)(53546011)(54906003)(6666004)(478600001)(6486002)(6512007)(6506007)(86362001)(186003)(31696002)(38100700002)(26005)(36756003)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHN1VUFwNjZSVmpSTzhvUmpSNXUwMngwYVdPVXJMeHJwbm9HalVZZ2RxcHhq?=
 =?utf-8?B?VW4zMnBoZ0FTd29GTjF6TnhVL0lGRTFIb0ZxL2lsd1IxSERwV21iamZnWU1D?=
 =?utf-8?B?ZEgvM0RrTnA0eE5GSVc2ejAxRUVQYkpJMEc4aSttdnJqcllaZUwxek9WVEFz?=
 =?utf-8?B?VkVlOHpRWm12R2hxeGUxb0J0dWM0OHBTQ21ETHNIZVpKR0cvVSs1RkdQVGpI?=
 =?utf-8?B?akZTNlZGVUJXZWF1R085TytIMERaY2FGbmFleDZ4WGNWMGk0SURCd3E3NVVV?=
 =?utf-8?B?S2VKNVI0SXU3UTducmtGMGs3eUNEL25ObDN1cUVPRzBFTFNtUWpBdGVvd3Zo?=
 =?utf-8?B?K21ZRy9LSjhlcXNIN2hVYVlFWlhKOHhLR1YvZTdrTTd6N3dNZnRFQ0hSMlZH?=
 =?utf-8?B?TFhMd1d4Uk1FZmNaU1VDcWN4dmdTeHkrV3dNKzJpT2hDaXhvL3VLTjljejBl?=
 =?utf-8?B?d1pDMWxrYk94NzFlOUZ6QmJiTDA0MHQvR2tGZ3pVYkFVM3U3TzBnOHdwV3Fo?=
 =?utf-8?B?RHd1NjNKcUxzd0Y3OGtVMS8zWHByMktrOWdReTM0dW9ma3grbGFSd1BVZ0JL?=
 =?utf-8?B?cFNjb2xjakxLU1ZOUjMrSG9mYUtoS2VtdFBEQUx2SXFOay84QTBvcEcxa2VK?=
 =?utf-8?B?VXFwZjhGSytkeW1mSy9wSlFGKzZKU2pxNUpqaFp5UGJJd0pIZGl5a01ITmtu?=
 =?utf-8?B?WkYvRTFaSjc0a3NaRGZBa3pjZVZ0dkhBTHV5ZnBTVVpwdUNXMGxyU2tzaVFH?=
 =?utf-8?B?VHdGR0wxczNzVlZRSUJwakN5L3FkaTZsS1dQKzRYRHIxcmtuT3pLNGhOVldi?=
 =?utf-8?B?TS9zR1ZiYkRSSjRhbjNDajdNZjY0NjBlN2JMTmZMUThoNUZ2Szd6VEFvZktI?=
 =?utf-8?B?blRRMjlxSDdoMUJLdmhHK0JaUG5SbWJSc3hucURVQ3RabkhDdUFHZFBlM1Zl?=
 =?utf-8?B?aURUa0J4YXk2NVBBM2NBbzVEaWd6L3VhOHRwNXB4c3ZhZ0MwQXV0Ylpnclg3?=
 =?utf-8?B?YjQyemVlK2dDb2VUOXZDRHBLaU9yVWcwRTd4NEttUWVBWjhCYngwY1hTajhy?=
 =?utf-8?B?VXVRekZmQkgrWFNzdHpNQUo4OGFTVW4vYmw4ODBvZkh5Yy95Rlc0MFBiZjRN?=
 =?utf-8?B?QlM2L1RGZEhNc043aFhVcldWNC94MFZHUnpaTTFSSmQvUHl5Yk4vZm0xV3Uz?=
 =?utf-8?B?TVI2TTNQc05WbHo4RjRHa3JnRFFObHZ2TmxJVkd1MlNRc2FzbmJ5V3FSZmFR?=
 =?utf-8?B?cU0zaE55bHpFTU03TWNaYkVxOWVqWjRpTDRGWWZ5VEF5RE9aNGg3RGhiQzUw?=
 =?utf-8?B?QWVqanl0cUNaUlVNN3ZoZ3RRRUI2ZUd0akhkQjBvancwNGdyVHJaMXo4NVRM?=
 =?utf-8?B?S1piYkgzdTByTUV3SW5PRWc0RFJEZHk4d0FBWUhJV0JxcXZXZFpNQWRHbXA5?=
 =?utf-8?B?eldGczdVdWhIeXdMNldBTTZFQnNtbTlUVnhyMTFDTUpES3BkMjhlMFpaREFX?=
 =?utf-8?B?VFd0K00wd1FkVC83cndPZHJ4c1F1dUh5TndHSjFOYjRBTllmYTNSajQvNE5L?=
 =?utf-8?B?SmJkcTlCV2JCNEdrSFFlbGRyQzkwakJuK20yRnRndE00T3VFNDY3ZnBFUDdx?=
 =?utf-8?B?dEM0d1BZWkN2SnJSa3NwaVFrekY3NXFjYkJPa1Joem9KV1dES3ZKNi93NVFz?=
 =?utf-8?B?dE1rc3l0d0tSSmpqUTdqaFl2YjVQZ2RyMmoxRmMxTnNyMFNPQ1J4UlhrejNv?=
 =?utf-8?B?S2duWEpTbE5vT0tGUFRINzJtdi83Wnl4RU55UEd2VDVRT2lpWXpUSmJxY0tB?=
 =?utf-8?B?SkxFN0c1Z1lRMzMxSGV2NVlDTTFSQ2ZXb2psZW5ubmNmUHV1UklwYjRnamFG?=
 =?utf-8?B?cWNqL29sNHhhSU1QUEFQclprVDFyTktCREZvNzhZaXR3cWxCT1NadXJTbkJx?=
 =?utf-8?B?WWpMUHZudTMxSFI5Ry9YVFZxOGNsOVpKZGJsYy8zVzAyVjVnaEpZeWxnQTJv?=
 =?utf-8?B?N3Z0VWhGbURDSGp3NEt3b1BmbzFPUi9uK1FZSjNhU1p6eUtNYVpxQ0FtWEFU?=
 =?utf-8?B?VWNGcStURG53U2ZnZGhXN253RjZQOTZCaWF2RzV6eVdKblc1Rk4xQjZyRGE3?=
 =?utf-8?B?VHZMQ0QxSUJ3dFZuY3FQdktzQkFTY2xJTndpZ3VSMkg3YWVVS25adUt3TzZW?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Ub1DkvGTpHDhC9ja3hLgANJSJAJ5Bi0zSgYl1/iVMNcZwSiHgLPEool9Rxvnku7RcVFv4tfnOcjGYdbFaVNeZMwoFwK3152EyprUd9ycI1x4+iosdPdWyzqJ8B0Zzk4NUuFEZl6O2VC2ItUArNcC0XelZOrFYjSNO8v50atFPxE5tkYH6pnZadgbtdNRS3URYz4M24eoA1RmHSySXPb0fZE+8s90IRjnLsXdyaVXmbfOprlQ+aHU/aX4XLMk7FV1KZoNahIUswaMf/NJFrNIKUyOa2MQRaX2I3aMzb6EW27T0IzsmbR1kRX+XPlepKVZhEPYVunG9PaRPLckcL7viI4Ditoawj6gIOK2AGPi4whhnFZWUQVkNgqvhkKVNL9wPUQC++pUCI7SpY7OzQdxwyHycJ0fA4ovHozXbtO0zqQ7dFCl2e80vd+7qal+2BpDNOCG9xm2JTZVRaDv6ptELBG+8FI3sutta0joYIEMrgJyALSzKDTvmOsVFq+XNqsVAb/bWZMl5LYBNLJq4KeOmSHHt0SunVukAnYjahN78BsHVf3/HAVx6A815I0C+aPAtva0TDSxTP2PQB/Xbm9+BI8LvRVHl+pMfzqZRqgStn0DagdFfTJy+6JY9HAqKBOssGEGaVLh+Ffi/Ff5OLJS+cR+ueQkzirv+ejzE2CXVCnWZDtEDx/QdG7UBXNSU/5wiHNRoOgLErF1pE8yHeNMXD1b01HTS93oN70a0GzFVhx39kyjziNtOhWnDU+Gl121cl1St89OpuwsYy/shoekOFwKogvqz3xg9txbJW2Xb5Fp2gWnBnSO/y5w/K+eiLZA
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1016e4-d0c4-4929-6cb1-08db1ef45268
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:11:30.8673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtP1UlcRCstnvfuVrbD90FTCasEp6VVVyJPjFIoTCw9cVZTxk4N+QENaGRi2dJwNRlm8xJ2Oiwq/CrRSGxoPekb452vHFMvW1Ta2eCK8GxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7067
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070092
X-Proofpoint-GUID: cXR2ZCqaEC09mbMAMJZNQwirpQE4fvJU
X-Proofpoint-ORIG-GUID: cXR2ZCqaEC09mbMAMJZNQwirpQE4fvJU
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

On 07/03/2023 02:40, Alex Williamson wrote:
> On Tue,  7 Mar 2023 02:02:51 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> In preparation to be used in device dirty tracking, move the code that
>> calculates a iova/end range from the container/section.  This avoids
>> duplication on the common checks across listener callbacks.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/vfio/common.c | 37 ++++++++++++++++++++++++++++++-------
>>  1 file changed, 30 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 54b4a4fc7daf..3a6491dbc523 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -961,6 +961,35 @@ static bool vfio_listener_valid_section(MemoryRegionSection *section)
>>      return true;
>>  }
>>  
>> +/*
>> + * Called for the dirty tracking memory listener to calculate the iova/end
>> + * for a given memory region section.
>> + */
>> +static bool vfio_get_section_iova_range(VFIOContainer *container,
>> +                                        MemoryRegionSection *section,
>> +                                        hwaddr *out_iova, hwaddr *out_end,
>> +                                        Int128 *out_llend)
>> +{
>> +    Int128 llend;
>> +    hwaddr iova;
>> +
>> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>> +    llend = int128_make64(section->offset_within_address_space);
>> +    llend = int128_add(llend, section->size);
>> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
>> +
>> +    if (int128_ge(int128_make64(iova), llend)) {
>> +        return false;
>> +    }
>> +
>> +    *out_iova = iova;
>> +    *out_end = int128_get64(int128_sub(llend, int128_one()));
>> +    if (out_llend) {
>> +        *out_llend = llend;
>> +    }
>> +    return true;
>> +}
>> +
>>  static void vfio_listener_region_add(MemoryListener *listener,
>>                                       MemoryRegionSection *section)
>>  {
>> @@ -976,12 +1005,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>          return;
>>      }
>>  
>> -    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
>> -    llend = int128_make64(section->offset_within_address_space);
>> -    llend = int128_add(llend, section->size);
>> -    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
>> -
>> -    if (int128_ge(int128_make64(iova), llend)) {
>> +    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
>>          if (memory_region_is_ram_device(section->mr)) {
>>              trace_vfio_listener_region_add_no_dma_map(
>>                  memory_region_name(section->mr),
>> @@ -991,7 +1015,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>          }
>>          return;
>>      }
>> -    end = int128_get64(int128_sub(llend, int128_one()));
>>  
>>      if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
>>          hwaddr pgsize = 0;
> 
> Shouldn't this convert vfio_listener_region_del() too?  Thanks,

Yeap.


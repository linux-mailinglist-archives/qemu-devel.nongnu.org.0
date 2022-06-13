Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989D85485BE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 16:46:54 +0200 (CEST)
Received: from localhost ([::1]:45828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0lLB-0000GV-7j
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 10:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1o0lJC-0006ej-Te; Mon, 13 Jun 2022 10:44:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1o0lJ5-00010Y-LU; Mon, 13 Jun 2022 10:44:50 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DDYtRS014806;
 Mon, 13 Jun 2022 14:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=fplOaIKGeXI7b6TLT10f+yp7eEhJ2tdVnZiAvPJOgWI=;
 b=MReEhmOcq/9m+AW5BJPMH324uZF3WDpQZGk7pLxZMnYvFmmrgV80U+To7SBbaogeZtL6
 ZGoKBsZlZd7WqvIT5nOfqI5wQi6LFSrd8jnwJvl1zCbVahju7x+62dAruh14NHTZec0y
 5vVcu7qVWy+hcLyoij8pj1A1w3Qmb6D4url14TxQUTG3TKmmlwqFak8N3r6+o1uJa/yG
 0Z7fchExmEEDy4R75/70Ij9chfvAnk52P2K3lxIbANMnkHuy6eycl9rn882jlCD7m8No
 FN+08hTnZ9gsrq15U3shOitSIvaHTDtHLQDQRHKW8GfntfALyqEoa2kLZ/FlHoKINC61 hw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns38ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 14:44:13 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DEe68x018857; Mon, 13 Jun 2022 14:44:13 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gp73fg9db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 14:44:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5C0uM006ENodWbRIeA92NOme2HKqF6DHJ0Be6y9X7pBDyzUozp6aOj8wCDyUYGxMc4hDH4GbfagSWAixKnbNx5MXYv4SADeo7mINdeOEy99Et1tA+DGCTSZluqBhbs2TsFZ2UwsaZ/KX+wI+zO5WLtsIxluqhL3yLFzXoGYvFQ/CippWIQqfdxVuQePHZ05POFC/XpciToyhR43YQGQIlQNdV6dB/a6l1OCOWMDsfyxQ1SrIYfl4bPRK8k7lo7GcOjwR7tiBSjctRjiXdRHluK7ntQNmrS9sQ2SIpJPDU7c/n6LiHp8yMp7u8cn3APLt2yZKVF6XeAHvaRuQecJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fplOaIKGeXI7b6TLT10f+yp7eEhJ2tdVnZiAvPJOgWI=;
 b=PTtngIrBwMtBV+olBipej68SLkXehVuQb2AmoUkmxwBS2ESFhnjfY5Okx0IVT+R4SSNzgTzUKAHTHA6H1u0heQfO2VK5GensZzVov9EJvhHQZVQ5W3JV1iZrFzEkSsm1HGiVDoxYMaydgjD4sAZXcqU3UVcSjvn0z6j/Px6wH1sVQvct8wLp7YfUhvP8xwQdMqI5NPBO5lzyjRApzru9sqpNu4fnybeX3LcNOihst/NE1nbIAqwbZJ1lFBAuMJoICPmcKd4FErJesmeMXfL4megYtZNBQBZp+1GPnRWpunAM34YRb8laoB+ERK1wV/04feWwxBnIoL9n1m7goYF3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fplOaIKGeXI7b6TLT10f+yp7eEhJ2tdVnZiAvPJOgWI=;
 b=lJRoecjCfxOoyChZJSknb0fLIRFcynW6/F58zRVNEgoGsgmQG3oldgIF0mb50pdQvHqg7xZat574gA6XAd/CsNOK43+0mYz/BqwI6lAfnrT6V3wGVXv4q8qG1SPjbupB2LLDhyqBnuE/gfnw5GICh3cQCXMB/l3i+npYFO6L1Wg=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by BL3PR10MB6187.namprd10.prod.outlook.com (2603:10b6:208:3be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Mon, 13 Jun
 2022 14:43:38 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::ecde:ba93:a32:8a3f]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::ecde:ba93:a32:8a3f%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 14:43:38 +0000
Content-Type: multipart/alternative;
 boundary="------------y07pbsyqFqanUqfWn6dOqqOG"
Message-ID: <0456cadb-eb33-48c4-96b8-edfb1fe073da@oracle.com>
Date: Mon, 13 Jun 2022 10:43:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v14 5/8] qmp: decode feature & status bits in virtio-status
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, boris.ostrovsky@oracle.com, si-wei.liu@oracle.com, 
 joao.m.martins@oracle.com, qemu-block@nongnu.org, groug@kaod.org,
 qemu_oss@crudebyte.com, stefanha@redhat.com, lvivier@redhat.com,
 mathieu.poirier@linaro.org, arei.gonglei@huawei.com,
 eric.auger@redhat.com, kraxel@redhat.com, dgilbert@redhat.com,
 david@redhat.com, marcandre.lureau@redhat.com, armbru@redhat.com,
 michael.roth@amd.com, eblake@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, kwolf@redhat.com, raphael.norwitz@nutanix.com
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
 <1648819405-25696-6-git-send-email-jonah.palmer@oracle.com>
 <20220516161200-mutt-send-email-mst@kernel.org>
 <3e273430-762e-af04-21fa-d92a879ca28f@oracle.com>
 <20220610014053-mutt-send-email-mst@kernel.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <20220610014053-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: SN4PR0501CA0098.namprd05.prod.outlook.com
 (2603:10b6:803:42::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0cdf0ca-42c2-454a-afba-08da4d4b19c9
X-MS-TrafficTypeDiagnostic: BL3PR10MB6187:EE_
X-Microsoft-Antispam-PRVS: <BL3PR10MB6187736B760DC543E1E169ACE8AB9@BL3PR10MB6187.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/dwIEVsJqZFRIvSRyLwxv9+suO1s7d6GIWTwijt3eIJVH43AfoRBVZu0C40HD9Mzg5ionT7Dcn7vrqfivMRw0hBg1b0jL7ePWxhsRLn44alvaKHKWKu/XtfMBW0Z8Rl97JcD9iocTGUxWGchFNjE0QhvmRqM8soFVs4TFosRX9PUj6rprqloZu//IVjAqq6BpYgGUpntc/eAz88yZc172b1GkWV3UlThCTYpvg9DdLu0Fx4mw6Qg1hVuJD1sD2vVIM6czTtL19BW6HrGZWOY/S+qTtlshgFcxcOXF7URrmRPGjILdduY0UytdSztWnyQ8vu/1XMAa5xbpoea6w/iPL8wg+dyuQ7fzizsC12Feomi+bRxNwCIyUDInBuiMcoEZweK1jqXLZo27HORIsbYrmJy5abdWaMrsIWGjGvX1yBQ+NhTauBjFC/UMlxWTOjKtWs0ubXEBk9tOQLs5C+UcY6htdoIRpA/JaGIyNBZcWmfaszNzO4O/NW6ZEr6zt6krB0iWfcb9REGtkydw9S7gZX90fuii+f5eaBcCNnDmpzqhajYdlxAkXEJqr9rPHYkMEcd2yOnkkyuamfnOl8TV3vO6ttyWPpKZ+y/BgXa0lJYyIRbiNUNPaj0cww45+W9kUpF0x/vcqygj+29olgL7eL5ocnsl1AiEmDLg2n/Gkz8zkYgf/TimsZXXxEWhYlVPRkNGMGp5A1vx0DDPkI3f5baO32ZgONXW4ZnsoLJAP3ZD/We6WpDJUMrOH12cDi8d/5HGmxf2lPzuTHDYk/YPmhuauZpY7J34hhGNiKYAn+SLMFEpJUu8Do8aKBuYtlSHV8dZ6y2sv5IlBcD/FNbC6FO8NNoR/UapIMIS4OhXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(4326008)(31686004)(36756003)(44832011)(66556008)(8936002)(66476007)(5660300002)(66946007)(316002)(31696002)(83380400001)(6666004)(508600001)(6506007)(2906002)(30864003)(7416002)(6916009)(33964004)(6486002)(966005)(26005)(6512007)(166002)(38100700002)(86362001)(186003)(53546011)(2616005)(45980500001)(43740500002)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHd2Q2JkNVlwOENuRnhXa21hY3B0c2Nienh1dE1BT0QwQ0dsVnhPWlYvbE05?=
 =?utf-8?B?U3ZjeUpBRmFLdGZ2NjN4c0lhY3ZZd2swV2M3bVRyZWdXaEVmQ0pXR2RnMisv?=
 =?utf-8?B?VWtKSzVkWnMySTdDbEltMkJveWVFUThNS1Y5T29Pb3JFVFB4SkRyaGt2YWdQ?=
 =?utf-8?B?djdBbTZHWEY3UFVyN2JWVVJvbm14dGJFeU1mekxDNnh3TXhmeWtFajh0clR3?=
 =?utf-8?B?alJmYVh6cmtOaWxsQXpXOTU2cVZZWVNyRnlDUUprMEd4K2tvSDkvZGhxQWdL?=
 =?utf-8?B?WHAyZy9pcE5BUWtUZVgzTlk2TERvd3JnVUR6dVhjZm8vRWZpc1I3NytuU0Vp?=
 =?utf-8?B?VVVSNG54TEJHRUJxMHBlZ3FKUmRUeUxuei9GaDZvb3h1aDF3ak9kZnduQjNO?=
 =?utf-8?B?QlBCUVJUVTNudGF2eDFsZjN3ZFVmWTJxTHRHOGhaU0hDSktkQmIrQ21OazBu?=
 =?utf-8?B?QTMyQjRwSDdBL3plSTRXbVJRSkt4dFhrMkZ1dThZdTBMdTRyLzBNeFVEbmlt?=
 =?utf-8?B?ZkxiVVlSVTgydndTOHkxbUIxbGFYR01Nc0YremdDaG1NWi83RDhseWZDc3Fl?=
 =?utf-8?B?ZTJTYVdJeG81TXhUblF1eGZXZCtLem1xUlpKOHFxWlBlS1FQTEpZa3VaTzNk?=
 =?utf-8?B?dVd4MitacHorUFZoeFliYWpuWTlHbVJGU2Y5RE5XMWZHRzlQai9PVDRQSFpN?=
 =?utf-8?B?bVRzTGhxOVBJNEl0akg4aEdRYmxjZVZOU2NMS0d4NkpNbUk3VDZxQmlaamky?=
 =?utf-8?B?OXpzbXBjYlBKUjFQZFhHODNadmh0dnUrUlFUNStkK0hTckk2ZHNiSFcyVUxG?=
 =?utf-8?B?TEc0RG1OQ0Ztb1FHSUdOY08ydHNrK0VnS3JYckJIQm1MdXcvL21icG80YUJC?=
 =?utf-8?B?cG5nOUtuMTd4Q3hZcVVpMGZjdU15Z1pGcEFMd1E4anFRMlNCVkN6bDVhbWQr?=
 =?utf-8?B?dVhzWENNa0JoNjZDc1BxMWUwcTU5NG5Pb0E2bk9oZU1PQnlQRGdVdWlyd1dw?=
 =?utf-8?B?S29kNVdWV2ZVeWpxbmtIZVlqVHM5d2lpL1BQcnZpdXlRUG1VaEN3bldTeEpY?=
 =?utf-8?B?S0tZQ2diV1kzeFI2MEY0Z2Y4ZzVJdmNpWDhYeXUxc01FajZobGJJUzZCaEl0?=
 =?utf-8?B?OG9QTThTbWNiRGVQZ1dwK1JVd2JOcEJhTDRVcFNmOUxkRlJCbm95L2oyMHhq?=
 =?utf-8?B?eDExRkpwNXdOMTA4bWtZNVRNYVhoUWhVUHZQYUtoaFR5V0ZTU0VGWXZEa3Uz?=
 =?utf-8?B?dGloL3JxQU5nbitlbVc5U1hLcDBmTy9UQXhBdDdHSzdXcnVaVDdxaU5EODVF?=
 =?utf-8?B?bWhmZEtKM2FmS1JnS3R3bi9vSEFSTzBEUGsvUEtvYk53bEpyUTdmVVFUVG9K?=
 =?utf-8?B?TE9zb3lKTlZJVnhQQ3lPMUlINmM5SkJ0Q0t2QnJNczBHQ3ZqSkNuaUFpS1RI?=
 =?utf-8?B?NldIQ3NVeFVENFkrNFhUM2JMSmRhZXNqS3ZpL3ZsWGRndWhTVXc0TUhodlNQ?=
 =?utf-8?B?TDZSUXByK0F2TDNoTUJONGdwVVJMZVdTYU5xMWM1U09SNUM0STRXM3dZbmR3?=
 =?utf-8?B?cmNQdXNZaStsbFFHMW9pZkkrOWUycUcyQXVTd3AyQWFBTXRUU0htb0FzNWVN?=
 =?utf-8?B?ODgzRFNJM3I2YkJrY2MwdGY4bmxZVzM2QXhJcXFYUDJLRVFoZ3BMUW5Ma0dF?=
 =?utf-8?B?VDhPSjh0UXRPYzdNOGtVTGpqOGowTFRWemVYbExhbk0xS3VxUU5yU0NkbVRP?=
 =?utf-8?B?Ump1eDF0c09iV0daakg3b2xYdk9pcU5RYldoc3FFUnoyNTFDNXNGS1JmL2RR?=
 =?utf-8?B?ZlZ1dWlsR2NNTWhHR2pYVkNmTnMyNVZYTVRuMnhiTVcxYnhCUFROendOSWRE?=
 =?utf-8?B?TGNmYkppcis4a29ySU5kb1Mxc3hiWWpIc2NQT1lTclNiS1E5K3BSZHBWNkF1?=
 =?utf-8?B?MllkUHE3UlBmYXJhdVBkVllVMXpzYjBIcmJPV3h3M0FSczBvTlJYQ3RtRTlM?=
 =?utf-8?B?WklCS2RFRk1kN1pnWFVFYzlvRytsdUZMNVgxYnk5Mm12NVBicFVMMDFWZWlE?=
 =?utf-8?B?QTljREZKdDI0MEQ1MUpTWmp3YkVWeUc4RjMyTEhxdXU1ckw2QUE1MDhuNVhE?=
 =?utf-8?B?U2NTRWFQTlExcU9MTUc5S3R5b1U2T3Y5THhoQUNjZUxUMjBRTGhtd1V0aE1R?=
 =?utf-8?B?SExIZFdTbHZiZUV4S1lMQ0JoRUxOaVkrRTVGSmY4eTRvNFc4MTRsZjhaWmx3?=
 =?utf-8?B?WVgyV0ROUzVXQlRUK2wyaEFzRkhRMTJwTFF3VHdjWDZFTFBBZENRN2x4anFN?=
 =?utf-8?B?STU3eXVzWHJLRzYzQ1F4QUR1ZHUyaURJZ1g3bUZITWl6YUlSV2hpUjBIVzVR?=
 =?utf-8?Q?QEkpGVkSvJKnnyxA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cdf0ca-42c2-454a-afba-08da4d4b19c9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 14:43:38.1098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pW9RMbPOfRTEsyKkcXO0wq4DRFq9gvXxNvSl+D+y82H6goZi/gXqgOo5er37HwmKK/JMwcQqmJMCZqHnv9Kgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6187
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_06:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130066
X-Proofpoint-GUID: fnqG79hWmQG9t0kR3PtHIi6wGmObtZ8u
X-Proofpoint-ORIG-GUID: fnqG79hWmQG9t0kR3PtHIi6wGmObtZ8u
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------y07pbsyqFqanUqfWn6dOqqOG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/22 01:41, Michael S. Tsirkin wrote:
> On Thu, May 19, 2022 at 02:30:43AM -0400, Jonah Palmer wrote:
>> On 5/16/22 16:26, Michael S. Tsirkin wrote:
>>
>>      On Fri, Apr 01, 2022 at 09:23:22AM -0400, Jonah Palmer wrote:
>>
>>          From: Laurent Vivier<lvivier@redhat.com>
>>
>>          Display feature names instead of bitmaps for host, guest, and
>>          backend for VirtIODevices.
>>
>>          Display status names instead of bitmaps for VirtIODevices.
>>
>>          Display feature names instead of bitmaps for backend, protocol,
>>          acked, and features (hdev->features) for vhost devices.
>>
>>          Decode features according to device ID. Decode statuses
>>          according to configuration status bitmap (config_status_map).
>>          Decode vhost user protocol features according to vhost user
>>          protocol bitmap (vhost_user_protocol_map).
>>
>>          Transport features are on the first line. Undecoded bits (if
>>          any) are stored in a separate field.
>>
>>          Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>>
>>
>>      So this has several problems that I missed previously.
>>      First, sign off from poster is missing.
>>
>> My apologies, will add missing Laurent's SOB in correct order for
>> patches 3-8.
>
> Were you going to repost?

Yes, and sorry for the delay. Trying to get these out ASAP.

Jonah

>
>>
>>
>>
>>          ---
>>           hw/block/virtio-blk.c          |  29 ++++
>>           hw/char/virtio-serial-bus.c    |  11 ++
>>           hw/display/virtio-gpu.c        |  18 ++
>>           hw/input/virtio-input.c        |  10 ++
>>           hw/net/virtio-net.c            |  47 +++++
>>           hw/scsi/virtio-scsi.c          |  17 ++
>>           hw/virtio/vhost-user-fs.c      |  10 ++
>>           hw/virtio/vhost-user-i2c.c     |  14 ++
>>           hw/virtio/vhost-vsock-common.c |  10 ++
>>           hw/virtio/virtio-balloon.c     |  14 ++
>>           hw/virtio/virtio-crypto.c      |  10 ++
>>           hw/virtio/virtio-iommu.c       |  14 ++
>>           hw/virtio/virtio-mem.c         |  11 ++
>>           hw/virtio/virtio.c             | 302 ++++++++++++++++++++++++++++++++-
>>           include/hw/virtio/vhost.h      |   3 +
>>           include/hw/virtio/virtio.h     |  19 +++
>>           qapi/virtio.json               | 156 ++++++++++++++---
>>           17 files changed, 667 insertions(+), 28 deletions(-)
>>
>>          diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
>>          index 27c71ad316..f104603040 100644
>>          --- a/hw/block/virtio-blk.c
>>          +++ b/hw/block/virtio-blk.c
>>          @@ -13,6 +13,7 @@
>>
>>           #include "qemu/osdep.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "qemu/iov.h"
>>           #include "qemu/module.h"
>>           #include "qemu/error-report.h"
>>          @@ -33,10 +34,38 @@
>>           #include "migration/qemu-file-types.h"
>>           #include "hw/virtio/virtio-access.h"
>>           #include "qemu/coroutine.h"
>>          +#include "standard-headers/linux/vhost_types.h"
>>
>>           /* Config size before the discard support (hide associated config fields) */
>>           #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
>>                                                max_discard_sectors)
>>          +
>>          +qmp_virtio_feature_map_t blk_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_BLK_F_##name, #name }
>>          +    FEATURE_ENTRY(SIZE_MAX),
>>          +    FEATURE_ENTRY(SEG_MAX),
>>          +    FEATURE_ENTRY(GEOMETRY),
>>          +    FEATURE_ENTRY(RO),
>>          +    FEATURE_ENTRY(BLK_SIZE),
>>          +    FEATURE_ENTRY(TOPOLOGY),
>>          +    FEATURE_ENTRY(MQ),
>>          +    FEATURE_ENTRY(DISCARD),
>>          +    FEATURE_ENTRY(WRITE_ZEROES),
>>          +#ifndef VIRTIO_BLK_NO_LEGACY
>>          +    FEATURE_ENTRY(BARRIER),
>>          +    FEATURE_ENTRY(SCSI),
>>          +    FEATURE_ENTRY(FLUSH),
>>          +    FEATURE_ENTRY(CONFIG_WCE),
>>          +#endif /* !VIRTIO_BLK_NO_LEGACY */
>>          +#undef FEATURE_ENTRY
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_F_##name, #name }
>>          +    FEATURE_ENTRY(LOG_ALL),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           /*
>>            * Starting from the discard feature, we can use this array to properly
>>            * set the config size depending on the features enabled.
>>          diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
>>          index 7d4601cb5d..fbb31a2b16 100644
>>          --- a/hw/char/virtio-serial-bus.c
>>          +++ b/hw/char/virtio-serial-bus.c
>>          @@ -20,6 +20,7 @@
>>
>>           #include "qemu/osdep.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "qemu/iov.h"
>>           #include "qemu/main-loop.h"
>>           #include "qemu/module.h"
>>          @@ -32,6 +33,16 @@
>>           #include "hw/virtio/virtio-serial.h"
>>           #include "hw/virtio/virtio-access.h"
>>
>>          +qmp_virtio_feature_map_t serial_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_CONSOLE_F_##name, #name }
>>          +    FEATURE_ENTRY(SIZE),
>>          +    FEATURE_ENTRY(MULTIPORT),
>>          +    FEATURE_ENTRY(EMERG_WRITE),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           static struct VirtIOSerialDevices {
>>               QLIST_HEAD(, VirtIOSerial) devices;
>>           } vserdevices;
>>          diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>>          index 529b5246b2..0bd5dc6232 100644
>>          --- a/hw/display/virtio-gpu.c
>>          +++ b/hw/display/virtio-gpu.c
>>          @@ -29,10 +29,28 @@
>>           #include "qemu/log.h"
>>           #include "qemu/module.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "qemu/error-report.h"
>>          +#include "standard-headers/linux/vhost_types.h"
>>
>>           #define VIRTIO_GPU_VM_VERSION 1
>>
>>          +qmp_virtio_feature_map_t gpu_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_GPU_F_##name, #name }
>>          +    FEATURE_ENTRY(VIRGL),
>>          +    FEATURE_ENTRY(EDID),
>>          +    FEATURE_ENTRY(RESOURCE_UUID),
>>          +    FEATURE_ENTRY(RESOURCE_BLOB),
>>          +    FEATURE_ENTRY(CONTEXT_INIT),
>>          +#undef FEATURE_ENTRY
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_F_##name, #name }
>>          +    FEATURE_ENTRY(LOG_ALL),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>
>>
>>      Now I had some experience with this, the trick makes it
>>      harder to find where is a given macro used, and at the same
>>      time saves very little. Also should a macro name change, we
>>      do not want the name to change.
>>      Let's just keep it simple please.
>>      Plain array of macros and strings with no tricks.
>>
>> Sure thing. Should I define the macro outside of the map
>> definition? E.g:
>>
>> #define FEATURE_ENTRY(name) { ##name, #name }
>> qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
>>      FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL),
>>      FEATURE_ENTRY(VIRTIO_GPU_F_EDID),
>>      ...
>>      { -1, "" }
>> };
>>
>> Also, is that what you were thinking as a "plain array of macros
>> and strings"? Or was there something more simple you had in mind?
>>
>>
>>
>>
>>           static struct virtio_gpu_simple_resource*
>>           virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
>>           static struct virtio_gpu_simple_resource *
>>          diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
>>          index 5b5398b3ca..fe0ed6d5b4 100644
>>          --- a/hw/input/virtio-input.c
>>          +++ b/hw/input/virtio-input.c
>>          @@ -6,6 +6,7 @@
>>
>>           #include "qemu/osdep.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "qemu/iov.h"
>>           #include "qemu/module.h"
>>           #include "trace.h"
>>          @@ -14,10 +15,19 @@
>>           #include "hw/qdev-properties.h"
>>           #include "hw/virtio/virtio-input.h"
>>
>>          +#include "standard-headers/linux/vhost_types.h"
>>           #include "standard-headers/linux/input.h"
>>
>>           #define VIRTIO_INPUT_VM_VERSION 1
>>
>>          +qmp_virtio_feature_map_t input_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_F_##name, #name }
>>          +    FEATURE_ENTRY(LOG_ALL),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           /* ----------------------------------------------------------------- */
>>
>>           void virtio_input_send(VirtIOInput *vinput, virtio_input_event *event)
>>          diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>          index 027ce40c6f..9356958fb6 100644
>>          --- a/hw/net/virtio-net.c
>>          +++ b/hw/net/virtio-net.c
>>          @@ -35,9 +35,11 @@
>>           #include "hw/qdev-properties.h"
>>           #include "qapi/qapi-types-migration.h"
>>           #include "qapi/qapi-events-migration.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "hw/virtio/virtio-access.h"
>>           #include "migration/misc.h"
>>           #include "standard-headers/linux/ethtool.h"
>>          +#include "standard-headers/linux/vhost_types.h"
>>           #include "sysemu/sysemu.h"
>>           #include "trace.h"
>>           #include "monitor/qdev.h"
>>          @@ -90,6 +92,51 @@
>>                                                    VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
>>                                                    VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
>>
>>          +qmp_virtio_feature_map_t net_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_NET_F_##name, #name }
>>          +    FEATURE_ENTRY(CSUM),
>>          +    FEATURE_ENTRY(GUEST_CSUM),
>>          +    FEATURE_ENTRY(CTRL_GUEST_OFFLOADS),
>>          +    FEATURE_ENTRY(MTU),
>>          +    FEATURE_ENTRY(MAC),
>>          +    FEATURE_ENTRY(GUEST_TSO4),
>>          +    FEATURE_ENTRY(GUEST_TSO6),
>>          +    FEATURE_ENTRY(GUEST_ECN),
>>          +    FEATURE_ENTRY(GUEST_UFO),
>>          +    FEATURE_ENTRY(HOST_TSO4),
>>          +    FEATURE_ENTRY(HOST_TSO6),
>>          +    FEATURE_ENTRY(HOST_ECN),
>>          +    FEATURE_ENTRY(HOST_UFO),
>>          +    FEATURE_ENTRY(MRG_RXBUF),
>>          +    FEATURE_ENTRY(STATUS),
>>          +    FEATURE_ENTRY(CTRL_VQ),
>>          +    FEATURE_ENTRY(CTRL_RX),
>>          +    FEATURE_ENTRY(CTRL_VLAN),
>>          +    FEATURE_ENTRY(CTRL_RX_EXTRA),
>>          +    FEATURE_ENTRY(GUEST_ANNOUNCE),
>>          +    FEATURE_ENTRY(MQ),
>>          +    FEATURE_ENTRY(CTRL_MAC_ADDR),
>>          +    FEATURE_ENTRY(HASH_REPORT),
>>          +    FEATURE_ENTRY(RSS),
>>          +    FEATURE_ENTRY(RSC_EXT),
>>          +    FEATURE_ENTRY(STANDBY),
>>          +    FEATURE_ENTRY(SPEED_DUPLEX),
>>          +#ifndef VIRTIO_NET_NO_LEGACY
>>          +    FEATURE_ENTRY(GSO),
>>          +#endif /* VIRTIO_NET_NO_LEGACY */
>>          +#undef FEATURE_ENTRY
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_NET_F_##name, #name }
>>          +    FEATURE_ENTRY(VIRTIO_NET_HDR),
>>          +#undef FEATURE_ENTRY
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_F_##name, #name }
>>          +    FEATURE_ENTRY(LOG_ALL),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           static const VirtIOFeature feature_sizes[] = {
>>               {.flags = 1ULL << VIRTIO_NET_F_MAC,
>>                .end = endof(struct virtio_net_config, mac)},
>>          diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
>>          index 2a6141d081..9ca8faa40e 100644
>>          --- a/hw/scsi/virtio-scsi.c
>>          +++ b/hw/scsi/virtio-scsi.c
>>          @@ -15,7 +15,9 @@
>>
>>           #include "qemu/osdep.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "standard-headers/linux/virtio_ids.h"
>>          +#include "standard-headers/linux/vhost_types.h"
>>           #include "hw/virtio/virtio-scsi.h"
>>           #include "migration/qemu-file-types.h"
>>           #include "qemu/error-report.h"
>>          @@ -29,6 +31,21 @@
>>           #include "hw/virtio/virtio-access.h"
>>           #include "trace.h"
>>
>>          +qmp_virtio_feature_map_t scsi_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_SCSI_F_##name, #name }
>>          +    FEATURE_ENTRY(INOUT),
>>          +    FEATURE_ENTRY(HOTPLUG),
>>          +    FEATURE_ENTRY(CHANGE),
>>          +    FEATURE_ENTRY(T10_PI),
>>          +#undef FEATURE_ENTRY
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_F_##name, #name }
>>          +    FEATURE_ENTRY(LOG_ALL),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           static inline int virtio_scsi_get_lun(uint8_t *lun)
>>           {
>>               return ((lun[2] << 8) | lun[3]) & 0x3FFF;
>>          diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>>          index e513e4fdda..096cc07c44 100644
>>          --- a/hw/virtio/vhost-user-fs.c
>>          +++ b/hw/virtio/vhost-user-fs.c
>>          @@ -15,6 +15,7 @@
>>           #include <sys/ioctl.h>
>>           #include "standard-headers/linux/virtio_fs.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "hw/qdev-properties.h"
>>           #include "hw/qdev-properties-system.h"
>>           #include "hw/virtio/virtio-bus.h"
>>          @@ -23,6 +24,15 @@
>>           #include "hw/virtio/vhost-user-fs.h"
>>           #include "monitor/monitor.h"
>>           #include "sysemu/sysemu.h"
>>          +#include "standard-headers/linux/vhost_types.h"
>>          +
>>          +qmp_virtio_feature_map_t fs_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_F_##name, #name }
>>          +    FEATURE_ENTRY(LOG_ALL),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>
>>           static const int user_feature_bits[] = {
>>               VIRTIO_F_VERSION_1,
>>          diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
>>          index 6020eee093..931ec9836c 100644
>>          --- a/hw/virtio/vhost-user-i2c.c
>>          +++ b/hw/virtio/vhost-user-i2c.c
>>          @@ -8,11 +8,25 @@
>>
>>           #include "qemu/osdep.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "hw/qdev-properties.h"
>>           #include "hw/virtio/virtio-bus.h"
>>           #include "hw/virtio/vhost-user-i2c.h"
>>           #include "qemu/error-report.h"
>>           #include "standard-headers/linux/virtio_ids.h"
>>          +#include "standard-headers/linux/vhost_types.h"
>>          +
>>          +qmp_virtio_feature_map_t i2c_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_F_##name, #name }
>>          +    FEATURE_ENTRY(LOG_ALL),
>>          +#undef FEATURE_ENTRY
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_I2C_F_##name, #name }
>>          +    FEATURE_ENTRY(ZERO_LENGTH_REQUEST),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>
>>           static const int feature_bits[] = {
>>               VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
>>          diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>>          index 7394818e00..b03f94d8f8 100644
>>          --- a/hw/virtio/vhost-vsock-common.c
>>          +++ b/hw/virtio/vhost-vsock-common.c
>>          @@ -11,12 +11,22 @@
>>           #include "qemu/osdep.h"
>>           #include "standard-headers/linux/virtio_vsock.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "hw/virtio/virtio-access.h"
>>           #include "qemu/error-report.h"
>>           #include "hw/qdev-properties.h"
>>           #include "hw/virtio/vhost-vsock.h"
>>           #include "qemu/iov.h"
>>           #include "monitor/monitor.h"
>>          +#include "standard-headers/linux/vhost_types.h"
>>          +
>>          +qmp_virtio_feature_map_t vsock_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_F_##name, #name }
>>          +    FEATURE_ENTRY(LOG_ALL),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>
>>           const int feature_bits[] = {
>>               VIRTIO_VSOCK_F_SEQPACKET,
>>          diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>>          index 193ff5261c..b2ae0a4d8c 100644
>>          --- a/hw/virtio/virtio-balloon.c
>>          +++ b/hw/virtio/virtio-balloon.c
>>          @@ -28,6 +28,7 @@
>>           #include "qapi/error.h"
>>           #include "qapi/qapi-events-machine.h"
>>           #include "qapi/visitor.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "trace.h"
>>           #include "qemu/error-report.h"
>>           #include "migration/misc.h"
>>          @@ -38,6 +39,19 @@
>>
>>           #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
>>
>>          +qmp_virtio_feature_map_t balloon_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_BALLOON_F_##name, #name }
>>          +    FEATURE_ENTRY(MUST_TELL_HOST),
>>          +    FEATURE_ENTRY(STATS_VQ),
>>          +    FEATURE_ENTRY(DEFLATE_ON_OOM),
>>          +    FEATURE_ENTRY(FREE_PAGE_HINT),
>>          +    FEATURE_ENTRY(PAGE_POISON),
>>          +    FEATURE_ENTRY(REPORTING),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           typedef struct PartiallyBalloonedPage {
>>               ram_addr_t base_gpa;
>>               unsigned long *bitmap;
>>          diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
>>          index 947a11c3af..5c9a3d045d 100644
>>          --- a/hw/virtio/virtio-crypto.c
>>          +++ b/hw/virtio/virtio-crypto.c
>>          @@ -16,6 +16,7 @@
>>           #include "qemu/main-loop.h"
>>           #include "qemu/module.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "qemu/error-report.h"
>>
>>           #include "hw/virtio/virtio.h"
>>          @@ -23,10 +24,19 @@
>>           #include "hw/qdev-properties.h"
>>           #include "hw/virtio/virtio-access.h"
>>           #include "standard-headers/linux/virtio_ids.h"
>>          +#include "standard-headers/linux/vhost_types.h"
>>           #include "sysemu/cryptodev-vhost.h"
>>
>>           #define VIRTIO_CRYPTO_VM_VERSION 1
>>
>>          +qmp_virtio_feature_map_t crypto_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_F_##name, #name }
>>          +    FEATURE_ENTRY(LOG_ALL),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           /*
>>            * Transfer virtqueue index to crypto queue index.
>>            * The control virtqueue is after the data virtqueues
>>          diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>>          index 4ed5bb16ba..d993106d10 100644
>>          --- a/hw/virtio/virtio-iommu.c
>>          +++ b/hw/virtio/virtio-iommu.c
>>          @@ -26,6 +26,7 @@
>>           #include "sysemu/kvm.h"
>>           #include "sysemu/reset.h"
>>           #include "qapi/error.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "qemu/error-report.h"
>>           #include "trace.h"
>>
>>          @@ -41,6 +42,19 @@
>>           #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>>           #define VIOMMU_PROBE_SIZE 512
>>
>>          +qmp_virtio_feature_map_t iommu_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_IOMMU_F_##name, #name }
>>          +    FEATURE_ENTRY(INPUT_RANGE),
>>          +    FEATURE_ENTRY(DOMAIN_RANGE),
>>          +    FEATURE_ENTRY(MAP_UNMAP),
>>          +    FEATURE_ENTRY(BYPASS),
>>          +    FEATURE_ENTRY(PROBE),
>>          +    FEATURE_ENTRY(MMIO),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           typedef struct VirtIOIOMMUDomain {
>>               uint32_t id;
>>               bool bypass;
>>          diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
>>          index 465a996214..31e7af834e 100644
>>          --- a/hw/virtio/virtio-mem.c
>>          +++ b/hw/virtio/virtio-mem.c
>>          @@ -25,6 +25,7 @@
>>           #include "hw/virtio/virtio-mem.h"
>>           #include "qapi/error.h"
>>           #include "qapi/visitor.h"
>>          +#include "qapi/qapi-visit-virtio.h"
>>           #include "exec/ram_addr.h"
>>           #include "migration/misc.h"
>>           #include "hw/boards.h"
>>          @@ -32,6 +33,16 @@
>>           #include CONFIG_DEVICES
>>           #include "trace.h"
>>
>>          +qmp_virtio_feature_map_t mem_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_MEM_F_##name, #name }
>>          +#ifndef CONFIG_ACPI
>>          +    FEATURE_ENTRY(ACPI_PXM),
>>          +#endif /* CONFIG_ACPI */
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           /*
>>            * We only had legacy x86 guests that did not support
>>            * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE. Other targets don't have legacy guests.
>>          diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>          index 7f8eb29ced..af376be933 100644
>>          --- a/hw/virtio/virtio.c
>>          +++ b/hw/virtio/virtio.c
>>          @@ -34,10 +34,99 @@
>>           #include "sysemu/dma.h"
>>           #include "sysemu/runstate.h"
>>           #include "standard-headers/linux/virtio_ids.h"
>>          +#include "standard-headers/linux/vhost_types.h"
>>          +#include CONFIG_DEVICES
>>
>>           /* QAPI list of realized VirtIODevices */
>>           static QTAILQ_HEAD(, VirtIODevice) virtio_list;
>>
>>          +/*
>>          + * Maximum size of virtio device config space
>>          + */
>>          +#define VHOST_USER_MAX_CONFIG_SIZE 256
>>          +
>>          +enum VhostUserProtocolFeature {
>>          +    VHOST_USER_PROTOCOL_F_MQ = 0,
>>          +    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
>>          +    VHOST_USER_PROTOCOL_F_RARP = 2,
>>          +    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
>>          +    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
>>          +    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
>>          +    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
>>          +    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
>>          +    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
>>          +    VHOST_USER_PROTOCOL_F_CONFIG = 9,
>>          +    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
>>          +    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
>>          +    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
>>          +    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
>>          +    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
>>          +    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
>>          +    VHOST_USER_PROTOCOL_F_MAX
>>          +};
>>          +
>>          +static qmp_virtio_feature_map_t transport_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_F_##name, #name }
>>          +#ifndef VIRTIO_CONFIG_NO_LEGACY
>>          +    FEATURE_ENTRY(NOTIFY_ON_EMPTY),
>>          +    FEATURE_ENTRY(ANY_LAYOUT),
>>          +#endif /* VIRTIO_CONFIG_NO_LEGACY */
>>          +    FEATURE_ENTRY(VERSION_1),
>>          +    FEATURE_ENTRY(IOMMU_PLATFORM),
>>          +    FEATURE_ENTRY(RING_PACKED),
>>          +    FEATURE_ENTRY(ORDER_PLATFORM),
>>          +    FEATURE_ENTRY(SR_IOV),
>>          +#undef FEATURE_ENTRY
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VIRTIO_RING_F_##name, #name }
>>          +    FEATURE_ENTRY(INDIRECT_DESC),
>>          +    FEATURE_ENTRY(EVENT_IDX),
>>          +#undef FEATURE_ENTRY
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_USER_F_##name, #name }
>>          +    FEATURE_ENTRY(PROTOCOL_FEATURES),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>          +static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
>>          +#define FEATURE_ENTRY(name) \
>>          +    { VHOST_USER_PROTOCOL_F_##name, #name }
>>          +    FEATURE_ENTRY(MQ),
>>          +    FEATURE_ENTRY(LOG_SHMFD),
>>          +    FEATURE_ENTRY(RARP),
>>          +    FEATURE_ENTRY(REPLY_ACK),
>>          +    FEATURE_ENTRY(NET_MTU),
>>          +    FEATURE_ENTRY(SLAVE_REQ),
>>          +    FEATURE_ENTRY(CROSS_ENDIAN),
>>          +    FEATURE_ENTRY(CRYPTO_SESSION),
>>          +    FEATURE_ENTRY(PAGEFAULT),
>>          +    FEATURE_ENTRY(CONFIG),
>>          +    FEATURE_ENTRY(SLAVE_SEND_FD),
>>          +    FEATURE_ENTRY(HOST_NOTIFIER),
>>          +    FEATURE_ENTRY(INFLIGHT_SHMFD),
>>          +    FEATURE_ENTRY(RESET_DEVICE),
>>          +    FEATURE_ENTRY(INBAND_NOTIFICATIONS),
>>          +    FEATURE_ENTRY(CONFIGURE_MEM_SLOTS),
>>          +#undef FEATURE_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>          +/* virtio device configuration statuses */
>>          +static qmp_virtio_feature_map_t config_status_map[] = {
>>          +#define STATUS_ENTRY(name) \
>>          +    { VIRTIO_CONFIG_S_##name, #name }
>>          +    STATUS_ENTRY(DRIVER_OK),
>>          +    STATUS_ENTRY(FEATURES_OK),
>>          +    STATUS_ENTRY(DRIVER),
>>          +    STATUS_ENTRY(NEEDS_RESET),
>>          +    STATUS_ENTRY(FAILED),
>>          +    STATUS_ENTRY(ACKNOWLEDGE),
>>          +#undef STATUS_ENTRY
>>          +    { -1, "" }
>>          +};
>>          +
>>           /*
>>            * The alignment to use between consumer and producer parts of vring.
>>            * x86 pagesize again. This is the default, used by transports like PCI
>>          @@ -3962,6 +4051,196 @@ static VirtIODevice *virtio_device_find(const char *path)
>>               return NULL;
>>           }
>>
>>          +#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
>>          +    ({                                                   \
>>          +        type *list = NULL;                               \
>>          +        type *node;                                      \
>>          +        for (i = 0; map[i].virtio_bit != -1; i++) {      \
>>          +            if (is_status) {                             \
>>          +                bit = map[i].virtio_bit;                 \
>>          +            }                                            \
>>          +            else {                                       \
>>          +                bit = 1ULL << map[i].virtio_bit;         \
>>          +            }                                            \
>>          +            if ((bitmap & bit) == 0) {                   \
>>          +                continue;                                \
>>          +            }                                            \
>>          +            node = g_new0(type, 1);                      \
>>          +            node->value = g_strdup(map[i].feature_name); \
>>          +            node->next = list;                           \
>>          +            list = node;                                 \
>>          +            bitmap ^= bit;                               \
>>          +        }                                                \
>>          +        list;                                            \
>>          +    })
>>          +
>>          +static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
>>          +{
>>          +    VirtioDeviceStatus *status;
>>          +    uint8_t bit;
>>          +    int i;
>>          +
>>          +    status = g_new0(VirtioDeviceStatus, 1);
>>          +    status->statuses = CONVERT_FEATURES(strList, config_status_map, 1, bitmap);
>>          +    status->has_unknown_statuses = bitmap != 0;
>>          +    if (status->has_unknown_statuses) {
>>          +        status->unknown_statuses = bitmap;
>>          +    }
>>          +
>>          +    return status;
>>          +}
>>          +
>>          +static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
>>          +{
>>          +    VhostDeviceProtocols *vhu_protocols;
>>          +    uint64_t bit;
>>          +    int i;
>>          +
>>          +    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
>>          +    vhu_protocols->protocols =
>>          +                    CONVERT_FEATURES(strList,
>>          +                                     vhost_user_protocol_map, 0, bitmap);
>>          +    vhu_protocols->has_unknown_protocols = bitmap != 0;
>>          +    if (vhu_protocols->has_unknown_protocols) {
>>          +        vhu_protocols->unknown_protocols = bitmap;
>>          +    }
>>          +
>>          +    return vhu_protocols;
>>          +}
>>          +
>>          +static VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id,
>>          +                                                 uint64_t bitmap)
>>          +{
>>          +    VirtioDeviceFeatures *features;
>>          +    uint64_t bit;
>>          +    int i;
>>          +
>>          +    features = g_new0(VirtioDeviceFeatures, 1);
>>          +    features->has_dev_features = true;
>>          +
>>          +    /* transport features */
>>          +    features->transports = CONVERT_FEATURES(strList, transport_map, 0, bitmap);
>>          +
>>          +    /* device features */
>>          +    switch (device_id) {
>>          +#ifdef CONFIG_VIRTIO_SERIAL
>>          +    case VIRTIO_ID_CONSOLE:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, serial_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_BLK
>>          +    case VIRTIO_ID_BLOCK:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, blk_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_GPU
>>          +    case VIRTIO_ID_GPU:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, gpu_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_NET
>>          +    case VIRTIO_ID_NET:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, net_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_SCSI
>>          +    case VIRTIO_ID_SCSI:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, scsi_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_BALLOON
>>          +    case VIRTIO_ID_BALLOON:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, balloon_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_IOMMU
>>          +    case VIRTIO_ID_IOMMU:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, iommu_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_INPUT
>>          +    case VIRTIO_ID_INPUT:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, input_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VHOST_USER_FS
>>          +    case VIRTIO_ID_FS:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, fs_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VHOST_VSOCK
>>          +    case VIRTIO_ID_VSOCK:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, vsock_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_CRYPTO
>>          +    case VIRTIO_ID_CRYPTO:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, crypto_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_MEM
>>          +    case VIRTIO_ID_MEM:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, mem_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +#ifdef CONFIG_VIRTIO_I2C_ADAPTER
>>          +    case VIRTIO_ID_I2C_ADAPTER:
>>          +        features->dev_features =
>>          +            CONVERT_FEATURES(strList, i2c_map, 0, bitmap);
>>          +        break;
>>          +#endif
>>          +    /* No features */
>>          +    case VIRTIO_ID_9P:
>>          +    case VIRTIO_ID_PMEM:
>>          +    case VIRTIO_ID_RNG:
>>          +    case VIRTIO_ID_IOMEM:
>>          +    case VIRTIO_ID_RPMSG:
>>          +    case VIRTIO_ID_CLOCK:
>>          +    case VIRTIO_ID_MAC80211_WLAN:
>>          +    case VIRTIO_ID_MAC80211_HWSIM:
>>          +    case VIRTIO_ID_RPROC_SERIAL:
>>          +    case VIRTIO_ID_MEMORY_BALLOON:
>>          +    case VIRTIO_ID_CAIF:
>>          +    case VIRTIO_ID_SIGNAL_DIST:
>>          +    case VIRTIO_ID_PSTORE:
>>          +    case VIRTIO_ID_SOUND:
>>          +    case VIRTIO_ID_BT:
>>          +    case VIRTIO_ID_RPMB:
>>          +    case VIRTIO_ID_VIDEO_ENCODER:
>>          +    case VIRTIO_ID_VIDEO_DECODER:
>>          +    case VIRTIO_ID_SCMI:
>>          +    case VIRTIO_ID_NITRO_SEC_MOD:
>>          +    case VIRTIO_ID_WATCHDOG:
>>          +    case VIRTIO_ID_CAN:
>>          +    case VIRTIO_ID_DMABUF:
>>          +    case VIRTIO_ID_PARAM_SERV:
>>          +    case VIRTIO_ID_AUDIO_POLICY:
>>          +    case VIRTIO_ID_GPIO:
>>          +        break;
>>          +    default:
>>          +        g_assert_not_reached();
>>          +    }
>>          +
>>          +    features->has_unknown_dev_features = bitmap != 0;
>>          +    if (features->has_unknown_dev_features) {
>>          +        features->unknown_dev_features = bitmap;
>>          +    }
>>          +
>>          +    return features;
>>          +}
>>          +
>>           VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
>>           {
>>               VirtIODevice *vdev;
>>          @@ -3977,9 +4256,12 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
>>               status->name = g_strdup(vdev->name);
>>               status->device_id = vdev->device_id;
>>               status->vhost_started = vdev->vhost_started;
>>          -    status->guest_features = vdev->guest_features;
>>          -    status->host_features = vdev->host_features;
>>          -    status->backend_features = vdev->backend_features;
>>          +    status->guest_features = qmp_decode_features(vdev->device_id,
>>          +                                                 vdev->guest_features);
>>          +    status->host_features = qmp_decode_features(vdev->device_id,
>>          +                                                vdev->host_features);
>>          +    status->backend_features = qmp_decode_features(vdev->device_id,
>>          +                                                   vdev->backend_features);
>>
>>               switch (vdev->device_endian) {
>>               case VIRTIO_DEVICE_ENDIAN_LITTLE:
>>          @@ -3994,7 +4276,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
>>               }
>>
>>               status->num_vqs = virtio_get_num_queues(vdev);
>>          -    status->status = vdev->status;
>>          +    status->status = qmp_decode_status(vdev->status);
>>               status->isr = vdev->isr;
>>               status->queue_sel = vdev->queue_sel;
>>               status->vm_running = vdev->vm_running;
>>          @@ -4017,10 +4299,14 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
>>                   status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
>>                   status->vhost_dev->nvqs = hdev->nvqs;
>>                   status->vhost_dev->vq_index = hdev->vq_index;
>>          -        status->vhost_dev->features = hdev->features;
>>          -        status->vhost_dev->acked_features = hdev->acked_features;
>>          -        status->vhost_dev->backend_features = hdev->backend_features;
>>          -        status->vhost_dev->protocol_features = hdev->protocol_features;
>>          +        status->vhost_dev->features =
>>          +            qmp_decode_features(vdev->device_id, hdev->features);
>>          +        status->vhost_dev->acked_features =
>>          +            qmp_decode_features(vdev->device_id, hdev->acked_features);
>>          +        status->vhost_dev->backend_features =
>>          +            qmp_decode_features(vdev->device_id, hdev->backend_features);
>>          +        status->vhost_dev->protocol_features =
>>          +            qmp_decode_protocols(hdev->protocol_features);
>>                   status->vhost_dev->max_queues = hdev->max_queues;
>>                   status->vhost_dev->backend_cap = hdev->backend_cap;
>>                   status->vhost_dev->log_enabled = hdev->log_enabled;
>>          diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>          index 58a73e7b7a..4aaa21faf6 100644
>>          --- a/include/hw/virtio/vhost.h
>>          +++ b/include/hw/virtio/vhost.h
>>          @@ -5,6 +5,9 @@
>>           #include "hw/virtio/virtio.h"
>>           #include "exec/memory.h"
>>
>>          +#define VHOST_F_DEVICE_IOTLB 63
>>          +#define VHOST_USER_F_PROTOCOL_FEATURES 30
>>          +
>>           /* Generic structures common for any vhost based device. */
>>
>>           struct vhost_inflight {
>>          diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>>          index ef99a626a8..9df4e081c9 100644
>>          --- a/include/hw/virtio/virtio.h
>>          +++ b/include/hw/virtio/virtio.h
>>          @@ -71,6 +71,25 @@ typedef struct VirtQueueElement
>>           #define TYPE_VIRTIO_DEVICE "virtio-device"
>>           OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
>>
>>          +typedef struct {
>>          +    int virtio_bit;
>>          +    const char *feature_name;
>>          +} qmp_virtio_feature_map_t;
>>          +
>>          +extern qmp_virtio_feature_map_t serial_map[];
>>          +extern qmp_virtio_feature_map_t blk_map[];
>>          +extern qmp_virtio_feature_map_t gpu_map[];
>>          +extern qmp_virtio_feature_map_t net_map[];
>>          +extern qmp_virtio_feature_map_t scsi_map[];
>>          +extern qmp_virtio_feature_map_t balloon_map[];
>>          +extern qmp_virtio_feature_map_t iommu_map[];
>>          +extern qmp_virtio_feature_map_t input_map[];
>>          +extern qmp_virtio_feature_map_t fs_map[];
>>          +extern qmp_virtio_feature_map_t vsock_map[];
>>          +extern qmp_virtio_feature_map_t crypto_map[];
>>          +extern qmp_virtio_feature_map_t mem_map[];
>>          +extern qmp_virtio_feature_map_t i2c_map[];
>>          +
>>
>>
>>      So this hack where extern is in a common header, but the
>>      actual values are spread in individual C files is not really
>>      acceptable.
>>
>> Understood. Will move these map definitions into virtio.c
>> instead.
>>
>>
>>      Also, the names are too generic and are not prefixed with
>>      virtio which is a problem for a generic virtio.h header.
>>      this kind of name is only ok as a static variable.
>>
>> No problem, I can change them to something like
>> 'virtio_x_feature_map'.
>>
>>
>>      And, it seems to be causing problems when some devices
>>      are disabled at config time. E.g. with virtio gpu disabled
>>      we get:
>>
>>      https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2463276202__;!!ACWV5N9M2RV99hQ!LxUl7ygdoZjKT_zWfAfkcior1j2Bn4E5okOrtbudwWyRsmGyRMxMdQlIVhn5AhR7n6LHvABmkhnR$
>>      https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2463276291__;!!ACWV5N9M2RV99hQ!LxUl7ygdoZjKT_zWfAfkcior1j2Bn4E5okOrtbudwWyRsmGyRMxMdQlIVhn5AhR7n6LHvK89VWxr$
>>
>>      libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function `qmp_decode_features':
>>      /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'
>>      /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'
>>
>>
>>      I could not figure it out from a quick look, please debug.
>>
>> Got it, will debug. May be missing an #ifdef somewhere I suspect...
>>
>> It will take some time for me to get the next series (v15) out since
>> I'll be away next week but hopefully I'll be able to get them out sooner
>> rather than later once I'm back.
>>
>> Thanks,
>>
>> Jonah
>>
>>
>>
>>
>>           enum virtio_device_endian {
>>               VIRTIO_DEVICE_ENDIAN_UNKNOWN,
>>               VIRTIO_DEVICE_ENDIAN_LITTLE,
>>          diff --git a/qapi/virtio.json b/qapi/virtio.json
>>          index ba61d83df7..474a8bd64e 100644
>>          --- a/qapi/virtio.json
>>          +++ b/qapi/virtio.json
>>          @@ -106,10 +106,10 @@
>>                       'n-tmp-sections': 'int',
>>                       'nvqs': 'uint32',
>>                       'vq-index': 'int',
>>          -            'features': 'uint64',
>>          -            'acked-features': 'uint64',
>>          -            'backend-features': 'uint64',
>>          -            'protocol-features': 'uint64',
>>          +            'features': 'VirtioDeviceFeatures',
>>          +            'acked-features': 'VirtioDeviceFeatures',
>>          +            'backend-features': 'VirtioDeviceFeatures',
>>          +            'protocol-features': 'VhostDeviceProtocols',
>>                       'max-queues': 'uint64',
>>                       'backend-cap': 'uint64',
>>                       'log-enabled': 'bool',
>>          @@ -176,11 +176,11 @@
>>                       'device-id': 'uint16',
>>                       'vhost-started': 'bool',
>>                       'device-endian': 'str',
>>          -            'guest-features': 'uint64',
>>          -            'host-features': 'uint64',
>>          -            'backend-features': 'uint64',
>>          +            'guest-features': 'VirtioDeviceFeatures',
>>          +            'host-features': 'VirtioDeviceFeatures',
>>          +            'backend-features': 'VirtioDeviceFeatures',
>>                       'num-vqs': 'int',
>>          -            'status': 'uint8',
>>          +            'status': 'VirtioDeviceStatus',
>>                       'isr': 'uint8',
>>                       'queue-sel': 'uint16',
>>                       'vm-running': 'bool',
>>          @@ -222,14 +222,28 @@
>>           #            "name": "virtio-crypto",
>>           #            "started": true,
>>           #            "device-id": 20,
>>          -#            "backend-features": 0,
>>          +#            "backend-features": {
>>          +#               "transports": [],
>>          +#               "dev-features": []
>>          +#            },
>>           #            "start-on-kick": false,
>>           #            "isr": 1,
>>           #            "broken": false,
>>          -#            "status": 15,
>>          +#            "status": {
>>          +#               "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK",
>>          +#                            "DRIVER_OK"]
>>          +#            },
>>           #            "num-vqs": 2,
>>          -#            "guest-features": 5100273664,
>>          -#            "host-features": 6325010432,
>>          +#            "guest-features": {
>>          +#               "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
>>          +#               "dev-features": []
>>          +#            },
>>          +#            "host-features": {
>>          +#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX",
>>          +#                              "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
>>          +#                              "NOTIFY_ON_EMPTY"],
>>          +#               "dev-features": []
>>          +#            },
>>           #            "use-guest-notifier-mask": true,
>>           #            "vm-running": true,
>>           #            "queue-sel": 1,
>>          @@ -257,22 +271,65 @@
>>           #               "max-queues": 1,
>>           #               "backend-cap": 2,
>>           #               "log-size": 0,
>>          -#               "backend-features": 0,
>>          +#               "backend-features": {
>>          +#                  "transports": [],
>>          +#                  "dev-features": []
>>          +#               },
>>           #               "nvqs": 2,
>>          -#               "protocol-features": 0,
>>          +#               "protocol-features": {
>>          +#                  "protocols": []
>>          +#               },
>>           #               "vq-index": 0,
>>           #               "log-enabled": false,
>>          -#               "acked-features": 5100306432,
>>          -#               "features": 13908344832
>>          +#               "acked-features": {
>>          +#                  "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1",
>>          +#                                 "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
>>          +#                  "dev-features": ["MRG_RXBUF"]
>>          +#               },
>>          +#               "features": {
>>          +#                  "transports": ["EVENT_IDX", "INDIRECT_DESC",
>>          +#                                 "IOMMU_PLATFORM", "VERSION_1", "ANY_LAYOUT",
>>          +#                                 "NOTIFY_ON_EMPTY"],
>>          +#                  "dev-features": ["LOG_ALL", "MRG_RXBUF"]
>>          +#               }
>>          +#            },
>>          +#            "backend-features": {
>>          +#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX", "INDIRECT_DESC",
>>          +#                              "VERSION_1", "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
>>          +#               "dev-features": ["GSO", "CTRL_MAC_ADDR", "GUEST_ANNOUNCE", "CTRL_RX_EXTRA",
>>          +#                                "CTRL_VLAN", "CTRL_RX", "CTRL_VQ", "STATUS", "MRG_RXBUF",
>>          +#                                "HOST_UFO", "HOST_ECN", "HOST_TSO6", "HOST_TSO4",
>>          +#                                "GUEST_UFO", "GUEST_ECN", "GUEST_TSO6", "GUEST_TSO4",
>>          +#                                "MAC", "CTRL_GUEST_OFFLOADS", "GUEST_CSUM", "CSUM"]
>>           #            },
>>          -#            "backend-features": 6337593319,
>>           #            "start-on-kick": false,
>>           #            "isr": 1,
>>           #            "broken": false,
>>          -#            "status": 15,
>>          +#            "status": {
>>          +#               "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK", "DRIVER_OK"]
>>          +#            },
>>           #            "num-vqs": 3,
>>          -#            "guest-features": 5111807911,
>>          -#            "host-features": 6337593319,
>>          +#            "guest-features": {
>>          +#               "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
>>          +#               "dev-features": ["CTRL_MAC_ADDR", "GUEST_ANNOUNCE", "CTRL_VLAN",
>>          +#                                "CTRL_RX", "CTRL_VQ", "STATUS", "MRG_RXBUF",
>>          +#                                "HOST_UFO", "HOST_ECN", "HOST_TSO6",
>>          +#                                "HOST_TSO4", "GUEST_UFO", "GUEST_ECN",
>>          +#                                "GUEST_TSO6", "GUEST_TSO4", "MAC",
>>          +#                                "CTRL_GUEST_OFFLOADS", "GUEST_CSUM", "CSUM"]
>>          +#            },
>>          +#            "host-features": {
>>          +#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX",
>>          +#                              "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
>>          +#                              "NOTIFY_ON_EMPTY"],
>>          +#               "dev-features": ["GSO", "CTRL_MAC_ADDR", "GUEST_ANNOUNCE",
>>          +#                                "CTRL_RX_EXTRA", "CTRL_VLAN", "CTRL_RX",
>>          +#                                "CTRL_VQ", "STATUS", "MRG_RXBUF", "HOST_UFO",
>>          +#                                "HOST_ECN", "HOST_TSO4", "HOST_TSO4",
>>          +#                                "GUEST_UFO", "GUEST_ECN", "GUEST_TSO6",
>>          +#                                "GUEST_TSO4", "MAC", "CTRL_GUEST_OFFLOADS",
>>          +#                                "GUEST_CSUM", "CSUM"]
>>          +#            },
>>           #            "use-guest-notifier-mask": true,
>>           #            "vm-running": true,
>>           #            "queue-sel": 2,
>>          @@ -288,3 +345,62 @@
>>             'data': { 'path': 'str' },
>>             'returns': 'VirtioStatus',
>>             'features': [ 'unstable' ] }
>>          +
>>          +##
>>          +# @VirtioDeviceStatus:
>>          +#
>>          +# A structure defined to list the configuration statuses of a virtio
>>          +# device
>>          +#
>>          +# @statuses: List of decoded configuration statuses of the virtio
>>          +#            device
>>          +#
>>          +# @unknown-statuses: Virtio device statuses bitmap that have not been decoded
>>          +#
>>          +# Since: 7.0
>>          +##
>>          +
>>          +{ 'struct': 'VirtioDeviceStatus',
>>          +  'data': { 'statuses': [ 'str' ],
>>          +            '*unknown-statuses': 'uint8' } }
>>          +
>>          +##
>>          +# @VhostDeviceProtocols:
>>          +#
>>          +# A structure defined to list the vhost user protocol features of a
>>          +# Vhost User device
>>          +#
>>          +# @protocols: List of decoded vhost user protocol features of a vhost
>>          +#             user device
>>          +#
>>          +# @unknown-protocols: Vhost user device protocol features bitmap that
>>          +#                     have not been decoded
>>          +#
>>          +# Since: 7.0
>>          +##
>>          +
>>          +{ 'struct': 'VhostDeviceProtocols',
>>          +  'data': { 'protocols': [ 'str' ],
>>          +            '*unknown-protocols': 'uint64' } }
>>          +
>>          +##
>>          +# @VirtioDeviceFeatures:
>>          +#
>>          +# The common fields that apply to most Virtio devices. Some devices
>>          +# may not have their own device-specific features (e.g. virtio-rng).
>>          +#
>>          +# @transports: List of transport features of the virtio device
>>          +#
>>          +# @dev-features: List of device-specific features (if the device has
>>          +#                unique features)
>>          +#
>>          +# @unknown-dev-features: Virtio device features bitmap that have not
>>          +#                        been decoded
>>          +#
>>          +# Since: 7.0
>>          +##
>>          +
>>          +{ 'struct': 'VirtioDeviceFeatures',
>>          +  'data': { 'transports': [ 'str' ],
>>          +            '*dev-features': [ 'str' ],
>>          +            '*unknown-dev-features': 'uint64' } }
>>          --
>>          2.35.1
>>
--------------y07pbsyqFqanUqfWn6dOqqOG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/22 01:41, Michael S. Tsirkin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220610014053-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">On Thu, May 19, 2022 at 02:30:43AM -0400, Jonah Palmer wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 5/16/22 16:26, Michael S. Tsirkin wrote:

    On Fri, Apr 01, 2022 at 09:23:22AM -0400, Jonah Palmer wrote:

        From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

        Display feature names instead of bitmaps for host, guest, and
        backend for VirtIODevices.

        Display status names instead of bitmaps for VirtIODevices.

        Display feature names instead of bitmaps for backend, protocol,
        acked, and features (hdev-&gt;features) for vhost devices.

        Decode features according to device ID. Decode statuses
        according to configuration status bitmap (config_status_map).
        Decode vhost user protocol features according to vhost user
        protocol bitmap (vhost_user_protocol_map).

        Transport features are on the first line. Undecoded bits (if
        any) are stored in a separate field.

        Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>


    So this has several problems that I missed previously.
    First, sign off from poster is missing.

My apologies, will add missing Laurent's SOB in correct order for
patches 3-8.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Were you going to repost?</pre>
    </blockquote>
    <pre>Yes, and sorry for the delay. Trying to get these out ASAP.

Jonah
</pre>
    <blockquote type="cite" cite="mid:20220610014053-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">



        ---
         hw/block/virtio-blk.c          |  29 ++++
         hw/char/virtio-serial-bus.c    |  11 ++
         hw/display/virtio-gpu.c        |  18 ++
         hw/input/virtio-input.c        |  10 ++
         hw/net/virtio-net.c            |  47 +++++
         hw/scsi/virtio-scsi.c          |  17 ++
         hw/virtio/vhost-user-fs.c      |  10 ++
         hw/virtio/vhost-user-i2c.c     |  14 ++
         hw/virtio/vhost-vsock-common.c |  10 ++
         hw/virtio/virtio-balloon.c     |  14 ++
         hw/virtio/virtio-crypto.c      |  10 ++
         hw/virtio/virtio-iommu.c       |  14 ++
         hw/virtio/virtio-mem.c         |  11 ++
         hw/virtio/virtio.c             | 302 ++++++++++++++++++++++++++++++++-
         include/hw/virtio/vhost.h      |   3 +
         include/hw/virtio/virtio.h     |  19 +++
         qapi/virtio.json               | 156 ++++++++++++++---
         17 files changed, 667 insertions(+), 28 deletions(-)

        diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
        index 27c71ad316..f104603040 100644
        --- a/hw/block/virtio-blk.c
        +++ b/hw/block/virtio-blk.c
        @@ -13,6 +13,7 @@

         #include &quot;qemu/osdep.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;qemu/iov.h&quot;
         #include &quot;qemu/module.h&quot;
         #include &quot;qemu/error-report.h&quot;
        @@ -33,10 +34,38 @@
         #include &quot;migration/qemu-file-types.h&quot;
         #include &quot;hw/virtio/virtio-access.h&quot;
         #include &quot;qemu/coroutine.h&quot;
        +#include &quot;standard-headers/linux/vhost_types.h&quot;

         /* Config size before the discard support (hide associated config fields) */
         #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
                                              max_discard_sectors)
        +
        +qmp_virtio_feature_map_t blk_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_BLK_F_##name, #name }
        +    FEATURE_ENTRY(SIZE_MAX),
        +    FEATURE_ENTRY(SEG_MAX),
        +    FEATURE_ENTRY(GEOMETRY),
        +    FEATURE_ENTRY(RO),
        +    FEATURE_ENTRY(BLK_SIZE),
        +    FEATURE_ENTRY(TOPOLOGY),
        +    FEATURE_ENTRY(MQ),
        +    FEATURE_ENTRY(DISCARD),
        +    FEATURE_ENTRY(WRITE_ZEROES),
        +#ifndef VIRTIO_BLK_NO_LEGACY
        +    FEATURE_ENTRY(BARRIER),
        +    FEATURE_ENTRY(SCSI),
        +    FEATURE_ENTRY(FLUSH),
        +    FEATURE_ENTRY(CONFIG_WCE),
        +#endif /* !VIRTIO_BLK_NO_LEGACY */
        +#undef FEATURE_ENTRY
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_F_##name, #name }
        +    FEATURE_ENTRY(LOG_ALL),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         /*
          * Starting from the discard feature, we can use this array to properly
          * set the config size depending on the features enabled.
        diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
        index 7d4601cb5d..fbb31a2b16 100644
        --- a/hw/char/virtio-serial-bus.c
        +++ b/hw/char/virtio-serial-bus.c
        @@ -20,6 +20,7 @@

         #include &quot;qemu/osdep.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;qemu/iov.h&quot;
         #include &quot;qemu/main-loop.h&quot;
         #include &quot;qemu/module.h&quot;
        @@ -32,6 +33,16 @@
         #include &quot;hw/virtio/virtio-serial.h&quot;
         #include &quot;hw/virtio/virtio-access.h&quot;

        +qmp_virtio_feature_map_t serial_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_CONSOLE_F_##name, #name }
        +    FEATURE_ENTRY(SIZE),
        +    FEATURE_ENTRY(MULTIPORT),
        +    FEATURE_ENTRY(EMERG_WRITE),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         static struct VirtIOSerialDevices {
             QLIST_HEAD(, VirtIOSerial) devices;
         } vserdevices;
        diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
        index 529b5246b2..0bd5dc6232 100644
        --- a/hw/display/virtio-gpu.c
        +++ b/hw/display/virtio-gpu.c
        @@ -29,10 +29,28 @@
         #include &quot;qemu/log.h&quot;
         #include &quot;qemu/module.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;qemu/error-report.h&quot;
        +#include &quot;standard-headers/linux/vhost_types.h&quot;

         #define VIRTIO_GPU_VM_VERSION 1

        +qmp_virtio_feature_map_t gpu_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_GPU_F_##name, #name }
        +    FEATURE_ENTRY(VIRGL),
        +    FEATURE_ENTRY(EDID),
        +    FEATURE_ENTRY(RESOURCE_UUID),
        +    FEATURE_ENTRY(RESOURCE_BLOB),
        +    FEATURE_ENTRY(CONTEXT_INIT),
        +#undef FEATURE_ENTRY
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_F_##name, #name }
        +    FEATURE_ENTRY(LOG_ALL),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +


    Now I had some experience with this, the trick makes it
    harder to find where is a given macro used, and at the same
    time saves very little. Also should a macro name change, we
    do not want the name to change.
    Let's just keep it simple please.
    Plain array of macros and strings with no tricks.

Sure thing. Should I define the macro outside of the map
definition? E.g:

#define FEATURE_ENTRY(name) { ##name, #name }
qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
    FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL),
    FEATURE_ENTRY(VIRTIO_GPU_F_EDID),
    ...
    { -1, &quot;&quot; }
};

Also, is that what you were thinking as a &quot;plain array of macros
and strings&quot;? Or was there something more simple you had in mind?




         static struct virtio_gpu_simple_resource*
         virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
         static struct virtio_gpu_simple_resource *
        diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
        index 5b5398b3ca..fe0ed6d5b4 100644
        --- a/hw/input/virtio-input.c
        +++ b/hw/input/virtio-input.c
        @@ -6,6 +6,7 @@

         #include &quot;qemu/osdep.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;qemu/iov.h&quot;
         #include &quot;qemu/module.h&quot;
         #include &quot;trace.h&quot;
        @@ -14,10 +15,19 @@
         #include &quot;hw/qdev-properties.h&quot;
         #include &quot;hw/virtio/virtio-input.h&quot;

        +#include &quot;standard-headers/linux/vhost_types.h&quot;
         #include &quot;standard-headers/linux/input.h&quot;

         #define VIRTIO_INPUT_VM_VERSION 1

        +qmp_virtio_feature_map_t input_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_F_##name, #name }
        +    FEATURE_ENTRY(LOG_ALL),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         /* ----------------------------------------------------------------- */

         void virtio_input_send(VirtIOInput *vinput, virtio_input_event *event)
        diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
        index 027ce40c6f..9356958fb6 100644
        --- a/hw/net/virtio-net.c
        +++ b/hw/net/virtio-net.c
        @@ -35,9 +35,11 @@
         #include &quot;hw/qdev-properties.h&quot;
         #include &quot;qapi/qapi-types-migration.h&quot;
         #include &quot;qapi/qapi-events-migration.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;hw/virtio/virtio-access.h&quot;
         #include &quot;migration/misc.h&quot;
         #include &quot;standard-headers/linux/ethtool.h&quot;
        +#include &quot;standard-headers/linux/vhost_types.h&quot;
         #include &quot;sysemu/sysemu.h&quot;
         #include &quot;trace.h&quot;
         #include &quot;monitor/qdev.h&quot;
        @@ -90,6 +92,51 @@
                                                  VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                                  VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)

        +qmp_virtio_feature_map_t net_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_NET_F_##name, #name }
        +    FEATURE_ENTRY(CSUM),
        +    FEATURE_ENTRY(GUEST_CSUM),
        +    FEATURE_ENTRY(CTRL_GUEST_OFFLOADS),
        +    FEATURE_ENTRY(MTU),
        +    FEATURE_ENTRY(MAC),
        +    FEATURE_ENTRY(GUEST_TSO4),
        +    FEATURE_ENTRY(GUEST_TSO6),
        +    FEATURE_ENTRY(GUEST_ECN),
        +    FEATURE_ENTRY(GUEST_UFO),
        +    FEATURE_ENTRY(HOST_TSO4),
        +    FEATURE_ENTRY(HOST_TSO6),
        +    FEATURE_ENTRY(HOST_ECN),
        +    FEATURE_ENTRY(HOST_UFO),
        +    FEATURE_ENTRY(MRG_RXBUF),
        +    FEATURE_ENTRY(STATUS),
        +    FEATURE_ENTRY(CTRL_VQ),
        +    FEATURE_ENTRY(CTRL_RX),
        +    FEATURE_ENTRY(CTRL_VLAN),
        +    FEATURE_ENTRY(CTRL_RX_EXTRA),
        +    FEATURE_ENTRY(GUEST_ANNOUNCE),
        +    FEATURE_ENTRY(MQ),
        +    FEATURE_ENTRY(CTRL_MAC_ADDR),
        +    FEATURE_ENTRY(HASH_REPORT),
        +    FEATURE_ENTRY(RSS),
        +    FEATURE_ENTRY(RSC_EXT),
        +    FEATURE_ENTRY(STANDBY),
        +    FEATURE_ENTRY(SPEED_DUPLEX),
        +#ifndef VIRTIO_NET_NO_LEGACY
        +    FEATURE_ENTRY(GSO),
        +#endif /* VIRTIO_NET_NO_LEGACY */
        +#undef FEATURE_ENTRY
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_NET_F_##name, #name }
        +    FEATURE_ENTRY(VIRTIO_NET_HDR),
        +#undef FEATURE_ENTRY
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_F_##name, #name }
        +    FEATURE_ENTRY(LOG_ALL),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         static const VirtIOFeature feature_sizes[] = {
             {.flags = 1ULL &lt;&lt; VIRTIO_NET_F_MAC,
              .end = endof(struct virtio_net_config, mac)},
        diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
        index 2a6141d081..9ca8faa40e 100644
        --- a/hw/scsi/virtio-scsi.c
        +++ b/hw/scsi/virtio-scsi.c
        @@ -15,7 +15,9 @@

         #include &quot;qemu/osdep.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;standard-headers/linux/virtio_ids.h&quot;
        +#include &quot;standard-headers/linux/vhost_types.h&quot;
         #include &quot;hw/virtio/virtio-scsi.h&quot;
         #include &quot;migration/qemu-file-types.h&quot;
         #include &quot;qemu/error-report.h&quot;
        @@ -29,6 +31,21 @@
         #include &quot;hw/virtio/virtio-access.h&quot;
         #include &quot;trace.h&quot;

        +qmp_virtio_feature_map_t scsi_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_SCSI_F_##name, #name }
        +    FEATURE_ENTRY(INOUT),
        +    FEATURE_ENTRY(HOTPLUG),
        +    FEATURE_ENTRY(CHANGE),
        +    FEATURE_ENTRY(T10_PI),
        +#undef FEATURE_ENTRY
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_F_##name, #name }
        +    FEATURE_ENTRY(LOG_ALL),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         static inline int virtio_scsi_get_lun(uint8_t *lun)
         {
             return ((lun[2] &lt;&lt; 8) | lun[3]) &amp; 0x3FFF;
        diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
        index e513e4fdda..096cc07c44 100644
        --- a/hw/virtio/vhost-user-fs.c
        +++ b/hw/virtio/vhost-user-fs.c
        @@ -15,6 +15,7 @@
         #include &lt;sys/ioctl.h&gt;
         #include &quot;standard-headers/linux/virtio_fs.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;hw/qdev-properties.h&quot;
         #include &quot;hw/qdev-properties-system.h&quot;
         #include &quot;hw/virtio/virtio-bus.h&quot;
        @@ -23,6 +24,15 @@
         #include &quot;hw/virtio/vhost-user-fs.h&quot;
         #include &quot;monitor/monitor.h&quot;
         #include &quot;sysemu/sysemu.h&quot;
        +#include &quot;standard-headers/linux/vhost_types.h&quot;
        +
        +qmp_virtio_feature_map_t fs_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_F_##name, #name }
        +    FEATURE_ENTRY(LOG_ALL),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};

         static const int user_feature_bits[] = {
             VIRTIO_F_VERSION_1,
        diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
        index 6020eee093..931ec9836c 100644
        --- a/hw/virtio/vhost-user-i2c.c
        +++ b/hw/virtio/vhost-user-i2c.c
        @@ -8,11 +8,25 @@

         #include &quot;qemu/osdep.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;hw/qdev-properties.h&quot;
         #include &quot;hw/virtio/virtio-bus.h&quot;
         #include &quot;hw/virtio/vhost-user-i2c.h&quot;
         #include &quot;qemu/error-report.h&quot;
         #include &quot;standard-headers/linux/virtio_ids.h&quot;
        +#include &quot;standard-headers/linux/vhost_types.h&quot;
        +
        +qmp_virtio_feature_map_t i2c_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_F_##name, #name }
        +    FEATURE_ENTRY(LOG_ALL),
        +#undef FEATURE_ENTRY
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_I2C_F_##name, #name }
        +    FEATURE_ENTRY(ZERO_LENGTH_REQUEST),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};

         static const int feature_bits[] = {
             VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
        diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
        index 7394818e00..b03f94d8f8 100644
        --- a/hw/virtio/vhost-vsock-common.c
        +++ b/hw/virtio/vhost-vsock-common.c
        @@ -11,12 +11,22 @@
         #include &quot;qemu/osdep.h&quot;
         #include &quot;standard-headers/linux/virtio_vsock.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;hw/virtio/virtio-access.h&quot;
         #include &quot;qemu/error-report.h&quot;
         #include &quot;hw/qdev-properties.h&quot;
         #include &quot;hw/virtio/vhost-vsock.h&quot;
         #include &quot;qemu/iov.h&quot;
         #include &quot;monitor/monitor.h&quot;
        +#include &quot;standard-headers/linux/vhost_types.h&quot;
        +
        +qmp_virtio_feature_map_t vsock_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_F_##name, #name }
        +    FEATURE_ENTRY(LOG_ALL),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};

         const int feature_bits[] = {
             VIRTIO_VSOCK_F_SEQPACKET,
        diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
        index 193ff5261c..b2ae0a4d8c 100644
        --- a/hw/virtio/virtio-balloon.c
        +++ b/hw/virtio/virtio-balloon.c
        @@ -28,6 +28,7 @@
         #include &quot;qapi/error.h&quot;
         #include &quot;qapi/qapi-events-machine.h&quot;
         #include &quot;qapi/visitor.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;trace.h&quot;
         #include &quot;qemu/error-report.h&quot;
         #include &quot;migration/misc.h&quot;
        @@ -38,6 +39,19 @@

         #define BALLOON_PAGE_SIZE  (1 &lt;&lt; VIRTIO_BALLOON_PFN_SHIFT)

        +qmp_virtio_feature_map_t balloon_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_BALLOON_F_##name, #name }
        +    FEATURE_ENTRY(MUST_TELL_HOST),
        +    FEATURE_ENTRY(STATS_VQ),
        +    FEATURE_ENTRY(DEFLATE_ON_OOM),
        +    FEATURE_ENTRY(FREE_PAGE_HINT),
        +    FEATURE_ENTRY(PAGE_POISON),
        +    FEATURE_ENTRY(REPORTING),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         typedef struct PartiallyBalloonedPage {
             ram_addr_t base_gpa;
             unsigned long *bitmap;
        diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
        index 947a11c3af..5c9a3d045d 100644
        --- a/hw/virtio/virtio-crypto.c
        +++ b/hw/virtio/virtio-crypto.c
        @@ -16,6 +16,7 @@
         #include &quot;qemu/main-loop.h&quot;
         #include &quot;qemu/module.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;qemu/error-report.h&quot;

         #include &quot;hw/virtio/virtio.h&quot;
        @@ -23,10 +24,19 @@
         #include &quot;hw/qdev-properties.h&quot;
         #include &quot;hw/virtio/virtio-access.h&quot;
         #include &quot;standard-headers/linux/virtio_ids.h&quot;
        +#include &quot;standard-headers/linux/vhost_types.h&quot;
         #include &quot;sysemu/cryptodev-vhost.h&quot;

         #define VIRTIO_CRYPTO_VM_VERSION 1

        +qmp_virtio_feature_map_t crypto_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_F_##name, #name }
        +    FEATURE_ENTRY(LOG_ALL),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         /*
          * Transfer virtqueue index to crypto queue index.
          * The control virtqueue is after the data virtqueues
        diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
        index 4ed5bb16ba..d993106d10 100644
        --- a/hw/virtio/virtio-iommu.c
        +++ b/hw/virtio/virtio-iommu.c
        @@ -26,6 +26,7 @@
         #include &quot;sysemu/kvm.h&quot;
         #include &quot;sysemu/reset.h&quot;
         #include &quot;qapi/error.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;qemu/error-report.h&quot;
         #include &quot;trace.h&quot;

        @@ -41,6 +42,19 @@
         #define VIOMMU_DEFAULT_QUEUE_SIZE 256
         #define VIOMMU_PROBE_SIZE 512

        +qmp_virtio_feature_map_t iommu_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_IOMMU_F_##name, #name }
        +    FEATURE_ENTRY(INPUT_RANGE),
        +    FEATURE_ENTRY(DOMAIN_RANGE),
        +    FEATURE_ENTRY(MAP_UNMAP),
        +    FEATURE_ENTRY(BYPASS),
        +    FEATURE_ENTRY(PROBE),
        +    FEATURE_ENTRY(MMIO),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         typedef struct VirtIOIOMMUDomain {
             uint32_t id;
             bool bypass;
        diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
        index 465a996214..31e7af834e 100644
        --- a/hw/virtio/virtio-mem.c
        +++ b/hw/virtio/virtio-mem.c
        @@ -25,6 +25,7 @@
         #include &quot;hw/virtio/virtio-mem.h&quot;
         #include &quot;qapi/error.h&quot;
         #include &quot;qapi/visitor.h&quot;
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
         #include &quot;exec/ram_addr.h&quot;
         #include &quot;migration/misc.h&quot;
         #include &quot;hw/boards.h&quot;
        @@ -32,6 +33,16 @@
         #include CONFIG_DEVICES
         #include &quot;trace.h&quot;

        +qmp_virtio_feature_map_t mem_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_MEM_F_##name, #name }
        +#ifndef CONFIG_ACPI
        +    FEATURE_ENTRY(ACPI_PXM),
        +#endif /* CONFIG_ACPI */
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         /*
          * We only had legacy x86 guests that did not support
          * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE. Other targets don't have legacy guests.
        diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
        index 7f8eb29ced..af376be933 100644
        --- a/hw/virtio/virtio.c
        +++ b/hw/virtio/virtio.c
        @@ -34,10 +34,99 @@
         #include &quot;sysemu/dma.h&quot;
         #include &quot;sysemu/runstate.h&quot;
         #include &quot;standard-headers/linux/virtio_ids.h&quot;
        +#include &quot;standard-headers/linux/vhost_types.h&quot;
        +#include CONFIG_DEVICES

         /* QAPI list of realized VirtIODevices */
         static QTAILQ_HEAD(, VirtIODevice) virtio_list;

        +/*
        + * Maximum size of virtio device config space
        + */
        +#define VHOST_USER_MAX_CONFIG_SIZE 256
        +
        +enum VhostUserProtocolFeature {
        +    VHOST_USER_PROTOCOL_F_MQ = 0,
        +    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
        +    VHOST_USER_PROTOCOL_F_RARP = 2,
        +    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
        +    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
        +    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
        +    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
        +    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
        +    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
        +    VHOST_USER_PROTOCOL_F_CONFIG = 9,
        +    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
        +    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
        +    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
        +    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
        +    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
        +    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
        +    VHOST_USER_PROTOCOL_F_MAX
        +};
        +
        +static qmp_virtio_feature_map_t transport_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_F_##name, #name }
        +#ifndef VIRTIO_CONFIG_NO_LEGACY
        +    FEATURE_ENTRY(NOTIFY_ON_EMPTY),
        +    FEATURE_ENTRY(ANY_LAYOUT),
        +#endif /* VIRTIO_CONFIG_NO_LEGACY */
        +    FEATURE_ENTRY(VERSION_1),
        +    FEATURE_ENTRY(IOMMU_PLATFORM),
        +    FEATURE_ENTRY(RING_PACKED),
        +    FEATURE_ENTRY(ORDER_PLATFORM),
        +    FEATURE_ENTRY(SR_IOV),
        +#undef FEATURE_ENTRY
        +#define FEATURE_ENTRY(name) \
        +    { VIRTIO_RING_F_##name, #name }
        +    FEATURE_ENTRY(INDIRECT_DESC),
        +    FEATURE_ENTRY(EVENT_IDX),
        +#undef FEATURE_ENTRY
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_USER_F_##name, #name }
        +    FEATURE_ENTRY(PROTOCOL_FEATURES),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
        +static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
        +#define FEATURE_ENTRY(name) \
        +    { VHOST_USER_PROTOCOL_F_##name, #name }
        +    FEATURE_ENTRY(MQ),
        +    FEATURE_ENTRY(LOG_SHMFD),
        +    FEATURE_ENTRY(RARP),
        +    FEATURE_ENTRY(REPLY_ACK),
        +    FEATURE_ENTRY(NET_MTU),
        +    FEATURE_ENTRY(SLAVE_REQ),
        +    FEATURE_ENTRY(CROSS_ENDIAN),
        +    FEATURE_ENTRY(CRYPTO_SESSION),
        +    FEATURE_ENTRY(PAGEFAULT),
        +    FEATURE_ENTRY(CONFIG),
        +    FEATURE_ENTRY(SLAVE_SEND_FD),
        +    FEATURE_ENTRY(HOST_NOTIFIER),
        +    FEATURE_ENTRY(INFLIGHT_SHMFD),
        +    FEATURE_ENTRY(RESET_DEVICE),
        +    FEATURE_ENTRY(INBAND_NOTIFICATIONS),
        +    FEATURE_ENTRY(CONFIGURE_MEM_SLOTS),
        +#undef FEATURE_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
        +/* virtio device configuration statuses */
        +static qmp_virtio_feature_map_t config_status_map[] = {
        +#define STATUS_ENTRY(name) \
        +    { VIRTIO_CONFIG_S_##name, #name }
        +    STATUS_ENTRY(DRIVER_OK),
        +    STATUS_ENTRY(FEATURES_OK),
        +    STATUS_ENTRY(DRIVER),
        +    STATUS_ENTRY(NEEDS_RESET),
        +    STATUS_ENTRY(FAILED),
        +    STATUS_ENTRY(ACKNOWLEDGE),
        +#undef STATUS_ENTRY
        +    { -1, &quot;&quot; }
        +};
        +
         /*
          * The alignment to use between consumer and producer parts of vring.
          * x86 pagesize again. This is the default, used by transports like PCI
        @@ -3962,6 +4051,196 @@ static VirtIODevice *virtio_device_find(const char *path)
             return NULL;
         }

        +#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
        +    ({                                                   \
        +        type *list = NULL;                               \
        +        type *node;                                      \
        +        for (i = 0; map[i].virtio_bit != -1; i++) {      \
        +            if (is_status) {                             \
        +                bit = map[i].virtio_bit;                 \
        +            }                                            \
        +            else {                                       \
        +                bit = 1ULL &lt;&lt; map[i].virtio_bit;         \
        +            }                                            \
        +            if ((bitmap &amp; bit) == 0) {                   \
        +                continue;                                \
        +            }                                            \
        +            node = g_new0(type, 1);                      \
        +            node-&gt;value = g_strdup(map[i].feature_name); \
        +            node-&gt;next = list;                           \
        +            list = node;                                 \
        +            bitmap ^= bit;                               \
        +        }                                                \
        +        list;                                            \
        +    })
        +
        +static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
        +{
        +    VirtioDeviceStatus *status;
        +    uint8_t bit;
        +    int i;
        +
        +    status = g_new0(VirtioDeviceStatus, 1);
        +    status-&gt;statuses = CONVERT_FEATURES(strList, config_status_map, 1, bitmap);
        +    status-&gt;has_unknown_statuses = bitmap != 0;
        +    if (status-&gt;has_unknown_statuses) {
        +        status-&gt;unknown_statuses = bitmap;
        +    }
        +
        +    return status;
        +}
        +
        +static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
        +{
        +    VhostDeviceProtocols *vhu_protocols;
        +    uint64_t bit;
        +    int i;
        +
        +    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
        +    vhu_protocols-&gt;protocols =
        +                    CONVERT_FEATURES(strList,
        +                                     vhost_user_protocol_map, 0, bitmap);
        +    vhu_protocols-&gt;has_unknown_protocols = bitmap != 0;
        +    if (vhu_protocols-&gt;has_unknown_protocols) {
        +        vhu_protocols-&gt;unknown_protocols = bitmap;
        +    }
        +
        +    return vhu_protocols;
        +}
        +
        +static VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id,
        +                                                 uint64_t bitmap)
        +{
        +    VirtioDeviceFeatures *features;
        +    uint64_t bit;
        +    int i;
        +
        +    features = g_new0(VirtioDeviceFeatures, 1);
        +    features-&gt;has_dev_features = true;
        +
        +    /* transport features */
        +    features-&gt;transports = CONVERT_FEATURES(strList, transport_map, 0, bitmap);
        +
        +    /* device features */
        +    switch (device_id) {
        +#ifdef CONFIG_VIRTIO_SERIAL
        +    case VIRTIO_ID_CONSOLE:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, serial_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_BLK
        +    case VIRTIO_ID_BLOCK:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, blk_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_GPU
        +    case VIRTIO_ID_GPU:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, gpu_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_NET
        +    case VIRTIO_ID_NET:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, net_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_SCSI
        +    case VIRTIO_ID_SCSI:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, scsi_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_BALLOON
        +    case VIRTIO_ID_BALLOON:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, balloon_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_IOMMU
        +    case VIRTIO_ID_IOMMU:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, iommu_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_INPUT
        +    case VIRTIO_ID_INPUT:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, input_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VHOST_USER_FS
        +    case VIRTIO_ID_FS:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, fs_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VHOST_VSOCK
        +    case VIRTIO_ID_VSOCK:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, vsock_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_CRYPTO
        +    case VIRTIO_ID_CRYPTO:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, crypto_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_MEM
        +    case VIRTIO_ID_MEM:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, mem_map, 0, bitmap);
        +        break;
        +#endif
        +#ifdef CONFIG_VIRTIO_I2C_ADAPTER
        +    case VIRTIO_ID_I2C_ADAPTER:
        +        features-&gt;dev_features =
        +            CONVERT_FEATURES(strList, i2c_map, 0, bitmap);
        +        break;
        +#endif
        +    /* No features */
        +    case VIRTIO_ID_9P:
        +    case VIRTIO_ID_PMEM:
        +    case VIRTIO_ID_RNG:
        +    case VIRTIO_ID_IOMEM:
        +    case VIRTIO_ID_RPMSG:
        +    case VIRTIO_ID_CLOCK:
        +    case VIRTIO_ID_MAC80211_WLAN:
        +    case VIRTIO_ID_MAC80211_HWSIM:
        +    case VIRTIO_ID_RPROC_SERIAL:
        +    case VIRTIO_ID_MEMORY_BALLOON:
        +    case VIRTIO_ID_CAIF:
        +    case VIRTIO_ID_SIGNAL_DIST:
        +    case VIRTIO_ID_PSTORE:
        +    case VIRTIO_ID_SOUND:
        +    case VIRTIO_ID_BT:
        +    case VIRTIO_ID_RPMB:
        +    case VIRTIO_ID_VIDEO_ENCODER:
        +    case VIRTIO_ID_VIDEO_DECODER:
        +    case VIRTIO_ID_SCMI:
        +    case VIRTIO_ID_NITRO_SEC_MOD:
        +    case VIRTIO_ID_WATCHDOG:
        +    case VIRTIO_ID_CAN:
        +    case VIRTIO_ID_DMABUF:
        +    case VIRTIO_ID_PARAM_SERV:
        +    case VIRTIO_ID_AUDIO_POLICY:
        +    case VIRTIO_ID_GPIO:
        +        break;
        +    default:
        +        g_assert_not_reached();
        +    }
        +
        +    features-&gt;has_unknown_dev_features = bitmap != 0;
        +    if (features-&gt;has_unknown_dev_features) {
        +        features-&gt;unknown_dev_features = bitmap;
        +    }
        +
        +    return features;
        +}
        +
         VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
         {
             VirtIODevice *vdev;
        @@ -3977,9 +4256,12 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
             status-&gt;name = g_strdup(vdev-&gt;name);
             status-&gt;device_id = vdev-&gt;device_id;
             status-&gt;vhost_started = vdev-&gt;vhost_started;
        -    status-&gt;guest_features = vdev-&gt;guest_features;
        -    status-&gt;host_features = vdev-&gt;host_features;
        -    status-&gt;backend_features = vdev-&gt;backend_features;
        +    status-&gt;guest_features = qmp_decode_features(vdev-&gt;device_id,
        +                                                 vdev-&gt;guest_features);
        +    status-&gt;host_features = qmp_decode_features(vdev-&gt;device_id,
        +                                                vdev-&gt;host_features);
        +    status-&gt;backend_features = qmp_decode_features(vdev-&gt;device_id,
        +                                                   vdev-&gt;backend_features);

             switch (vdev-&gt;device_endian) {
             case VIRTIO_DEVICE_ENDIAN_LITTLE:
        @@ -3994,7 +4276,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
             }

             status-&gt;num_vqs = virtio_get_num_queues(vdev);
        -    status-&gt;status = vdev-&gt;status;
        +    status-&gt;status = qmp_decode_status(vdev-&gt;status);
             status-&gt;isr = vdev-&gt;isr;
             status-&gt;queue_sel = vdev-&gt;queue_sel;
             status-&gt;vm_running = vdev-&gt;vm_running;
        @@ -4017,10 +4299,14 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
                 status-&gt;vhost_dev-&gt;n_tmp_sections = hdev-&gt;n_tmp_sections;
                 status-&gt;vhost_dev-&gt;nvqs = hdev-&gt;nvqs;
                 status-&gt;vhost_dev-&gt;vq_index = hdev-&gt;vq_index;
        -        status-&gt;vhost_dev-&gt;features = hdev-&gt;features;
        -        status-&gt;vhost_dev-&gt;acked_features = hdev-&gt;acked_features;
        -        status-&gt;vhost_dev-&gt;backend_features = hdev-&gt;backend_features;
        -        status-&gt;vhost_dev-&gt;protocol_features = hdev-&gt;protocol_features;
        +        status-&gt;vhost_dev-&gt;features =
        +            qmp_decode_features(vdev-&gt;device_id, hdev-&gt;features);
        +        status-&gt;vhost_dev-&gt;acked_features =
        +            qmp_decode_features(vdev-&gt;device_id, hdev-&gt;acked_features);
        +        status-&gt;vhost_dev-&gt;backend_features =
        +            qmp_decode_features(vdev-&gt;device_id, hdev-&gt;backend_features);
        +        status-&gt;vhost_dev-&gt;protocol_features =
        +            qmp_decode_protocols(hdev-&gt;protocol_features);
                 status-&gt;vhost_dev-&gt;max_queues = hdev-&gt;max_queues;
                 status-&gt;vhost_dev-&gt;backend_cap = hdev-&gt;backend_cap;
                 status-&gt;vhost_dev-&gt;log_enabled = hdev-&gt;log_enabled;
        diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
        index 58a73e7b7a..4aaa21faf6 100644
        --- a/include/hw/virtio/vhost.h
        +++ b/include/hw/virtio/vhost.h
        @@ -5,6 +5,9 @@
         #include &quot;hw/virtio/virtio.h&quot;
         #include &quot;exec/memory.h&quot;

        +#define VHOST_F_DEVICE_IOTLB 63
        +#define VHOST_USER_F_PROTOCOL_FEATURES 30
        +
         /* Generic structures common for any vhost based device. */

         struct vhost_inflight {
        diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
        index ef99a626a8..9df4e081c9 100644
        --- a/include/hw/virtio/virtio.h
        +++ b/include/hw/virtio/virtio.h
        @@ -71,6 +71,25 @@ typedef struct VirtQueueElement
         #define TYPE_VIRTIO_DEVICE &quot;virtio-device&quot;
         OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)

        +typedef struct {
        +    int virtio_bit;
        +    const char *feature_name;
        +} qmp_virtio_feature_map_t;
        +
        +extern qmp_virtio_feature_map_t serial_map[];
        +extern qmp_virtio_feature_map_t blk_map[];
        +extern qmp_virtio_feature_map_t gpu_map[];
        +extern qmp_virtio_feature_map_t net_map[];
        +extern qmp_virtio_feature_map_t scsi_map[];
        +extern qmp_virtio_feature_map_t balloon_map[];
        +extern qmp_virtio_feature_map_t iommu_map[];
        +extern qmp_virtio_feature_map_t input_map[];
        +extern qmp_virtio_feature_map_t fs_map[];
        +extern qmp_virtio_feature_map_t vsock_map[];
        +extern qmp_virtio_feature_map_t crypto_map[];
        +extern qmp_virtio_feature_map_t mem_map[];
        +extern qmp_virtio_feature_map_t i2c_map[];
        +


    So this hack where extern is in a common header, but the
    actual values are spread in individual C files is not really
    acceptable.

Understood. Will move these map definitions into virtio.c
instead.


    Also, the names are too generic and are not prefixed with
    virtio which is a problem for a generic virtio.h header.
    this kind of name is only ok as a static variable.

No problem, I can change them to something like
'virtio_x_feature_map'.


    And, it seems to be causing problems when some devices
    are disabled at config time. E.g. with virtio gpu disabled
    we get:

    <a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2463276202__;!!ACWV5N9M2RV99hQ!LxUl7ygdoZjKT_zWfAfkcior1j2Bn4E5okOrtbudwWyRsmGyRMxMdQlIVhn5AhR7n6LHvABmkhnR$">https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2463276202__;!!ACWV5N9M2RV99hQ!LxUl7ygdoZjKT_zWfAfkcior1j2Bn4E5okOrtbudwWyRsmGyRMxMdQlIVhn5AhR7n6LHvABmkhnR$</a>
    <a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2463276291__;!!ACWV5N9M2RV99hQ!LxUl7ygdoZjKT_zWfAfkcior1j2Bn4E5okOrtbudwWyRsmGyRMxMdQlIVhn5AhR7n6LHvK89VWxr$">https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2463276291__;!!ACWV5N9M2RV99hQ!LxUl7ygdoZjKT_zWfAfkcior1j2Bn4E5okOrtbudwWyRsmGyRMxMdQlIVhn5AhR7n6LHvK89VWxr$</a>

    libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function `qmp_decode_features':
    /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'
    /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4167: undefined reference to `gpu_map'


    I could not figure it out from a quick look, please debug.

Got it, will debug. May be missing an #ifdef somewhere I suspect...

It will take some time for me to get the next series (v15) out since
I'll be away next week but hopefully I'll be able to get them out sooner
rather than later once I'm back.

Thanks,

Jonah




         enum virtio_device_endian {
             VIRTIO_DEVICE_ENDIAN_UNKNOWN,
             VIRTIO_DEVICE_ENDIAN_LITTLE,
        diff --git a/qapi/virtio.json b/qapi/virtio.json
        index ba61d83df7..474a8bd64e 100644
        --- a/qapi/virtio.json
        +++ b/qapi/virtio.json
        @@ -106,10 +106,10 @@
                     'n-tmp-sections': 'int',
                     'nvqs': 'uint32',
                     'vq-index': 'int',
        -            'features': 'uint64',
        -            'acked-features': 'uint64',
        -            'backend-features': 'uint64',
        -            'protocol-features': 'uint64',
        +            'features': 'VirtioDeviceFeatures',
        +            'acked-features': 'VirtioDeviceFeatures',
        +            'backend-features': 'VirtioDeviceFeatures',
        +            'protocol-features': 'VhostDeviceProtocols',
                     'max-queues': 'uint64',
                     'backend-cap': 'uint64',
                     'log-enabled': 'bool',
        @@ -176,11 +176,11 @@
                     'device-id': 'uint16',
                     'vhost-started': 'bool',
                     'device-endian': 'str',
        -            'guest-features': 'uint64',
        -            'host-features': 'uint64',
        -            'backend-features': 'uint64',
        +            'guest-features': 'VirtioDeviceFeatures',
        +            'host-features': 'VirtioDeviceFeatures',
        +            'backend-features': 'VirtioDeviceFeatures',
                     'num-vqs': 'int',
        -            'status': 'uint8',
        +            'status': 'VirtioDeviceStatus',
                     'isr': 'uint8',
                     'queue-sel': 'uint16',
                     'vm-running': 'bool',
        @@ -222,14 +222,28 @@
         #            &quot;name&quot;: &quot;virtio-crypto&quot;,
         #            &quot;started&quot;: true,
         #            &quot;device-id&quot;: 20,
        -#            &quot;backend-features&quot;: 0,
        +#            &quot;backend-features&quot;: {
        +#               &quot;transports&quot;: [],
        +#               &quot;dev-features&quot;: []
        +#            },
         #            &quot;start-on-kick&quot;: false,
         #            &quot;isr&quot;: 1,
         #            &quot;broken&quot;: false,
        -#            &quot;status&quot;: 15,
        +#            &quot;status&quot;: {
        +#               &quot;statuses&quot;: [&quot;ACKNOWLEDGE&quot;, &quot;DRIVER&quot;, &quot;FEATURES_OK&quot;,
        +#                            &quot;DRIVER_OK&quot;]
        +#            },
         #            &quot;num-vqs&quot;: 2,
        -#            &quot;guest-features&quot;: 5100273664,
        -#            &quot;host-features&quot;: 6325010432,
        +#            &quot;guest-features&quot;: {
        +#               &quot;transports&quot;: [&quot;EVENT_IDX&quot;, &quot;INDIRECT_DESC&quot;, &quot;VERSION_1&quot;],
        +#               &quot;dev-features&quot;: []
        +#            },
        +#            &quot;host-features&quot;: {
        +#               &quot;transports&quot;: [&quot;PROTOCOL_FEATURES&quot;, &quot;EVENT_IDX&quot;,
        +#                              &quot;INDIRECT_DESC&quot;, &quot;VERSION_1&quot;, &quot;ANY_LAYOUT&quot;,
        +#                              &quot;NOTIFY_ON_EMPTY&quot;],
        +#               &quot;dev-features&quot;: []
        +#            },
         #            &quot;use-guest-notifier-mask&quot;: true,
         #            &quot;vm-running&quot;: true,
         #            &quot;queue-sel&quot;: 1,
        @@ -257,22 +271,65 @@
         #               &quot;max-queues&quot;: 1,
         #               &quot;backend-cap&quot;: 2,
         #               &quot;log-size&quot;: 0,
        -#               &quot;backend-features&quot;: 0,
        +#               &quot;backend-features&quot;: {
        +#                  &quot;transports&quot;: [],
        +#                  &quot;dev-features&quot;: []
        +#               },
         #               &quot;nvqs&quot;: 2,
        -#               &quot;protocol-features&quot;: 0,
        +#               &quot;protocol-features&quot;: {
        +#                  &quot;protocols&quot;: []
        +#               },
         #               &quot;vq-index&quot;: 0,
         #               &quot;log-enabled&quot;: false,
        -#               &quot;acked-features&quot;: 5100306432,
        -#               &quot;features&quot;: 13908344832
        +#               &quot;acked-features&quot;: {
        +#                  &quot;transports&quot;: [&quot;EVENT_IDX&quot;, &quot;INDIRECT_DESC&quot;, &quot;VERSION_1&quot;,
        +#                                 &quot;ANY_LAYOUT&quot;, &quot;NOTIFY_ON_EMPTY&quot;],
        +#                  &quot;dev-features&quot;: [&quot;MRG_RXBUF&quot;]
        +#               },
        +#               &quot;features&quot;: {
        +#                  &quot;transports&quot;: [&quot;EVENT_IDX&quot;, &quot;INDIRECT_DESC&quot;,
        +#                                 &quot;IOMMU_PLATFORM&quot;, &quot;VERSION_1&quot;, &quot;ANY_LAYOUT&quot;,
        +#                                 &quot;NOTIFY_ON_EMPTY&quot;],
        +#                  &quot;dev-features&quot;: [&quot;LOG_ALL&quot;, &quot;MRG_RXBUF&quot;]
        +#               }
        +#            },
        +#            &quot;backend-features&quot;: {
        +#               &quot;transports&quot;: [&quot;PROTOCOL_FEATURES&quot;, &quot;EVENT_IDX&quot;, &quot;INDIRECT_DESC&quot;,
        +#                              &quot;VERSION_1&quot;, &quot;ANY_LAYOUT&quot;, &quot;NOTIFY_ON_EMPTY&quot;],
        +#               &quot;dev-features&quot;: [&quot;GSO&quot;, &quot;CTRL_MAC_ADDR&quot;, &quot;GUEST_ANNOUNCE&quot;, &quot;CTRL_RX_EXTRA&quot;,
        +#                                &quot;CTRL_VLAN&quot;, &quot;CTRL_RX&quot;, &quot;CTRL_VQ&quot;, &quot;STATUS&quot;, &quot;MRG_RXBUF&quot;,
        +#                                &quot;HOST_UFO&quot;, &quot;HOST_ECN&quot;, &quot;HOST_TSO6&quot;, &quot;HOST_TSO4&quot;,
        +#                                &quot;GUEST_UFO&quot;, &quot;GUEST_ECN&quot;, &quot;GUEST_TSO6&quot;, &quot;GUEST_TSO4&quot;,
        +#                                &quot;MAC&quot;, &quot;CTRL_GUEST_OFFLOADS&quot;, &quot;GUEST_CSUM&quot;, &quot;CSUM&quot;]
         #            },
        -#            &quot;backend-features&quot;: 6337593319,
         #            &quot;start-on-kick&quot;: false,
         #            &quot;isr&quot;: 1,
         #            &quot;broken&quot;: false,
        -#            &quot;status&quot;: 15,
        +#            &quot;status&quot;: {
        +#               &quot;statuses&quot;: [&quot;ACKNOWLEDGE&quot;, &quot;DRIVER&quot;, &quot;FEATURES_OK&quot;, &quot;DRIVER_OK&quot;]
        +#            },
         #            &quot;num-vqs&quot;: 3,
        -#            &quot;guest-features&quot;: 5111807911,
        -#            &quot;host-features&quot;: 6337593319,
        +#            &quot;guest-features&quot;: {
        +#               &quot;transports&quot;: [&quot;EVENT_IDX&quot;, &quot;INDIRECT_DESC&quot;, &quot;VERSION_1&quot;],
        +#               &quot;dev-features&quot;: [&quot;CTRL_MAC_ADDR&quot;, &quot;GUEST_ANNOUNCE&quot;, &quot;CTRL_VLAN&quot;,
        +#                                &quot;CTRL_RX&quot;, &quot;CTRL_VQ&quot;, &quot;STATUS&quot;, &quot;MRG_RXBUF&quot;,
        +#                                &quot;HOST_UFO&quot;, &quot;HOST_ECN&quot;, &quot;HOST_TSO6&quot;,
        +#                                &quot;HOST_TSO4&quot;, &quot;GUEST_UFO&quot;, &quot;GUEST_ECN&quot;,
        +#                                &quot;GUEST_TSO6&quot;, &quot;GUEST_TSO4&quot;, &quot;MAC&quot;,
        +#                                &quot;CTRL_GUEST_OFFLOADS&quot;, &quot;GUEST_CSUM&quot;, &quot;CSUM&quot;]
        +#            },
        +#            &quot;host-features&quot;: {
        +#               &quot;transports&quot;: [&quot;PROTOCOL_FEATURES&quot;, &quot;EVENT_IDX&quot;,
        +#                              &quot;INDIRECT_DESC&quot;, &quot;VERSION_1&quot;, &quot;ANY_LAYOUT&quot;,
        +#                              &quot;NOTIFY_ON_EMPTY&quot;],
        +#               &quot;dev-features&quot;: [&quot;GSO&quot;, &quot;CTRL_MAC_ADDR&quot;, &quot;GUEST_ANNOUNCE&quot;,
        +#                                &quot;CTRL_RX_EXTRA&quot;, &quot;CTRL_VLAN&quot;, &quot;CTRL_RX&quot;,
        +#                                &quot;CTRL_VQ&quot;, &quot;STATUS&quot;, &quot;MRG_RXBUF&quot;, &quot;HOST_UFO&quot;,
        +#                                &quot;HOST_ECN&quot;, &quot;HOST_TSO4&quot;, &quot;HOST_TSO4&quot;,
        +#                                &quot;GUEST_UFO&quot;, &quot;GUEST_ECN&quot;, &quot;GUEST_TSO6&quot;,
        +#                                &quot;GUEST_TSO4&quot;, &quot;MAC&quot;, &quot;CTRL_GUEST_OFFLOADS&quot;,
        +#                                &quot;GUEST_CSUM&quot;, &quot;CSUM&quot;]
        +#            },
         #            &quot;use-guest-notifier-mask&quot;: true,
         #            &quot;vm-running&quot;: true,
         #            &quot;queue-sel&quot;: 2,
        @@ -288,3 +345,62 @@
           'data': { 'path': 'str' },
           'returns': 'VirtioStatus',
           'features': [ 'unstable' ] }
        +
        +##
        +# @VirtioDeviceStatus:
        +#
        +# A structure defined to list the configuration statuses of a virtio
        +# device
        +#
        +# @statuses: List of decoded configuration statuses of the virtio
        +#            device
        +#
        +# @unknown-statuses: Virtio device statuses bitmap that have not been decoded
        +#
        +# Since: 7.0
        +##
        +
        +{ 'struct': 'VirtioDeviceStatus',
        +  'data': { 'statuses': [ 'str' ],
        +            '*unknown-statuses': 'uint8' } }
        +
        +##
        +# @VhostDeviceProtocols:
        +#
        +# A structure defined to list the vhost user protocol features of a
        +# Vhost User device
        +#
        +# @protocols: List of decoded vhost user protocol features of a vhost
        +#             user device
        +#
        +# @unknown-protocols: Vhost user device protocol features bitmap that
        +#                     have not been decoded
        +#
        +# Since: 7.0
        +##
        +
        +{ 'struct': 'VhostDeviceProtocols',
        +  'data': { 'protocols': [ 'str' ],
        +            '*unknown-protocols': 'uint64' } }
        +
        +##
        +# @VirtioDeviceFeatures:
        +#
        +# The common fields that apply to most Virtio devices. Some devices
        +# may not have their own device-specific features (e.g. virtio-rng).
        +#
        +# @transports: List of transport features of the virtio device
        +#
        +# @dev-features: List of device-specific features (if the device has
        +#                unique features)
        +#
        +# @unknown-dev-features: Virtio device features bitmap that have not
        +#                        been decoded
        +#
        +# Since: 7.0
        +##
        +
        +{ 'struct': 'VirtioDeviceFeatures',
        +  'data': { 'transports': [ 'str' ],
        +            '*dev-features': [ 'str' ],
        +            '*unknown-dev-features': 'uint64' } }
        --
        2.35.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------y07pbsyqFqanUqfWn6dOqqOG--


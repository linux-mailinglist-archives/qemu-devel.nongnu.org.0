Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0938A54AF22
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 13:14:22 +0200 (CEST)
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o14V2-00048g-L0
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 07:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o14PS-0007kQ-TK
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:08:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o14PK-0008S9-2L
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:08:30 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EB8HUt027222;
 Tue, 14 Jun 2022 11:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=igGOpEGCrewx5nQisAQr2Hf0KasUPOxd6Iz52dJOCbw=;
 b=j+NFUH/PlYqPJtEtt+7sTTuZ9XgVfAt+3XY4WRbMn9raA0ebQBPVD++OTIlM99HXtusV
 QCDnu9bspFIky8c4cskydsUBbs3Y03GHDdK9xcu1K2VLD0hWmmVzmmTI7zyBUvsGppLR
 dfS3dwAjxyrN87TMYaFFjg4Dthc4ezeNI+IEMAoIOopbEAjydAubohbijYTt6GybusUQ
 6p+IqzCD6foW57nOmT9kUsRvSZoeSIK5nUWUMEKUyru3HI+rlOhzc6f0yKlaYU6xnn4F
 wau4aj9cp1nmA/O5w2TszrWcyOf+lQ34rdEbajE0hYvox29e/0/L/+eE17taNerhq+y3 LA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0dj7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 11:08:19 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25EB1XlC040779; Tue, 14 Jun 2022 11:08:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpqw9t14p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 11:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3GzBmcgtfp9DlkFQ8VSZ+NeKNISmxb49LqKwaDeijW2FjGtd7NJvasPwxj3yPZ4jD0lyWoikbRoIre5YsHf87GWAGlu/92HcuPKt8A8lqEKu8MWINnDCjZlM4od6C8TzCwcyJWUeKTBRjpJLs4n7LzAYi1WIuwUee76s/IXMvCOcUyIWctllr0HLwgynAROmqEg9VsHXSigD/uifc+0FjZwTwEAC/RnO26mA7rwfGJxQ9Om9fYVq0GrfJHzGqAqynnNn7XeZUfEb8vW/2L2d8chYzfIu2CMcOb47vO5WCDR+Ihwxpi1dZ9ZlSg6ebpeplZ2tFPLUgG8l+URJiYlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igGOpEGCrewx5nQisAQr2Hf0KasUPOxd6Iz52dJOCbw=;
 b=KFobqL5w2s7Jw8IjSmyf7su1Qii9KFDpEVc5DhBmnNH8LIiU0KfrgctMxR1dtTlZdwT6cA1lg2mt9yOwR4Abdp+c/nWU3EeFTskJNKvKPtrYOPhlqCuvCdcH5UGs4n2TX82Y6QNsLbrO5Lr1v8saAGsqK2/ypeP6niSHdhpNYN2cBHCwal/oX5nl7o6gfxjrqsl8j3b5au/Ywodeml/7YIl10lfKNiLXw72e7l20yiDj26i7sYr3ILJcodonGwGVfSz/TL6vJ4Yk54LiQAqsHmXrttJAOnl7z7UDAXlspsrLIAZvUqosGSiJUrMFUmzFP0QCO0Pu41VePrbqPvWDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igGOpEGCrewx5nQisAQr2Hf0KasUPOxd6Iz52dJOCbw=;
 b=nvBuR+sQpB2q1uMsfkXNKrxNnYWHJsLnCN+D0aEBwewNp7KX7UOkOTwuV4qw8tqRIplK4EpUxv+pk49a18ZQfnDUkKfqQzXtP1w6O2ELVUm3MgtTcHofEkcKSpgVbTKObY+/qPtkpCRhO68A/KYXJiBMaLGN7TG8D2qv4udyTSU=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB4421.namprd10.prod.outlook.com (2603:10b6:510:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 11:08:15 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 11:08:15 +0000
Message-ID: <7186d27f-16b8-8d6d-2c37-902f97526244@oracle.com>
Date: Tue, 14 Jun 2022 12:08:08 +0100
Subject: Re: [PATCH v2 07/11] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-8-avihaih@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220530170739.19072-8-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90e91cb8-db4a-470c-fd04-08da4df62dca
X-MS-TrafficTypeDiagnostic: PH0PR10MB4421:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4421C852CD5438B18D9C3D76BBAA9@PH0PR10MB4421.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fv9/Nw9i+G7GzABuOaQrSzM2520CAuzdssOSwh1Z/qom/x4NGbDx0nVlaJd7as4OZs85iVyWoN5AWYvBvP+pwgxS0vuIXBe0ss/IWb7SYCZoZ/JQpAFHa4or6U2WfIUsUqQe4h2O6a5QjR2LJLKSldvxEXvSK6fDCyojKyl/dsp3nqwVtOHRpIp+QbRhBAB6XCP8e9wbV/ofo3SILT6vW9YGomK0Movav8jfOm3UB5C3HF9NWkElKQRQBaaVELqAXotGhOA1QkxHL4WisHXygaH/Oa5UKhGtZgp4NkFi5VXqoz3jQ19n22RC8CtxM0U//lrGc5BALGmJiwmSqDuk/nWhLoRQpIIzM5IlisozzyIZqhAT/5bPzj85s9NVVH/z2IT0UTgv+gfjdlf6IwQRqIFPhqA8Jlvwztdp+LoUTiw22N8XkM4E4T7HDtMYBGhWd8Ohl6nZ6KnQU4/lol4NsTPzEou266nrWygM4xyKo1305oQfD7axmcEbrEHePZadmQlHSrwpIVrNZ9x1MY890r8HSWx8Xd9ZI+SPtmzXma4iUQAMsInUvpGsKWW6ajEzY6GbJCcxuXwm/TGSPI5m1EhdRla9MdF+UeJMfYRWyZLVhQZQ7tdt82smF9bVVZOid9J1eEBECFYqKAU0hyJ+C+X2mNgigIgnyc6A51T1eUgUmi9yiKbAApYyVoGMPvYUBNbK4ix0u0m0OpAt/1WIHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6666004)(54906003)(316002)(6916009)(26005)(6486002)(7416002)(5660300002)(30864003)(6506007)(31686004)(53546011)(86362001)(508600001)(31696002)(38100700002)(2616005)(83380400001)(6512007)(4326008)(66556008)(66476007)(8676002)(2906002)(36756003)(66946007)(8936002)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDZ6VS84dFg1aVRCZ0ZRN3IrUWNidFl5NlZZOG5pR2xmMEJ1cGNTcnRGU3hH?=
 =?utf-8?B?OXhVRXlKZ1gzbTZJZTlJbmhhNFBobzYwY2JQdnozUFBtYktvRTM2Zy81NnZp?=
 =?utf-8?B?QWlBWENuRnVRSFhDcVVHM2xBZ0xXaU13bFlwRlNhaUFQeDd6djhZQTNjbXJk?=
 =?utf-8?B?b2tmM01Zc0xHTmh5aEtVZGM3SVZ2blg0VjE4UnBxMm5tdDRKV2crUms3alJo?=
 =?utf-8?B?L2xqMGVkSk9McWliL0VqYTFSL2MxQzJJM3ljSFhmZ3VCb0FrQXBZMGNORTRN?=
 =?utf-8?B?WTM2MzhMYlRZbTVlMVhHOFZxakdFYmJhVGZCTlBMRG1YZ0pKZzZWMEdmQ2M2?=
 =?utf-8?B?aTRLTms5L0xNTmU2cVpWYmNVN0wrcTAra1BUTFowc2VDWG1uRnlyNXkzNTZJ?=
 =?utf-8?B?Mnozc0hIYTlGUXBsZjFCdVhybFVlMzR1eCsxeTM0bU9CcWEzVU1XRjBsWTJH?=
 =?utf-8?B?a3dJZmdZc1Fqc3BydFZxaUdac1BxbThFR2hKTklSVnd5b1RQNlUvMzFUMlBa?=
 =?utf-8?B?bmRzNDIvWkIydDRnU2JpY1Y0TFpWREpERWc2YUIzd1l1anQ3N3EyOWJsYlQx?=
 =?utf-8?B?ZE15bkNMWkdWS2ZBbVNXOXhQVzBVYXFORzZpRTM5N2pscHliaHZCaE5MNUxr?=
 =?utf-8?B?M0VvZFpsWTlXNzRISXVtT3YzcXRDZ0lacEwxU09DQW1PVUpnNzRaenl2L0R6?=
 =?utf-8?B?dUg1SlpHL25PQnJUY0VER09tSFVpUkNDcSt6SVJoRmRiQUlGMyt1N1VCamNo?=
 =?utf-8?B?c0NoOGt6U1BIMHBoZTh0cEJVWU90bk01RGYvWjVjRGQ1eVVFRzdxY0txcysv?=
 =?utf-8?B?Ny9TZHFOOHo3QW43ZkNWcWpBS0ZHTThyU2Q0SW1iUFJUVEdzUS9YbmFDT2Ey?=
 =?utf-8?B?aHhsMWc5VXJTZWlXcVR4eEQyblpxeWpMMEw5Z255dFZyc214U3QxWjROdG94?=
 =?utf-8?B?ZW1SWW5YYUoxYjNIWFVpZ3BGdUozZkVLQTEyQTgwbXIxV3kvM08wc3BqMVpC?=
 =?utf-8?B?WHdvS0NyaC9TejJSdXFUcjlwRjJHb3FWUCtsaEtWbFdOYk00Qy90bGxSVDc2?=
 =?utf-8?B?T21UV1Z0TGlEcGhvbkRqUFplV050ME10SE5CV214N3ppWEZDQk9TMVBQV1hv?=
 =?utf-8?B?Zys3aTFlekZxRjN6UEFsVUNVSGtRWVJvVkk2N1lmTEJXODFmcThPUjNQTUoy?=
 =?utf-8?B?ZENPYldBb0gydzYrSERjZldvRzU1UW13bVhobmQ0bUFETTUyLzYrdFpaSXc5?=
 =?utf-8?B?bUlPd1VvRTdRTC9BTlJ5ZHJQTURCd0ZqbU9UbXVRTEN1RCtNMG1Jc2hJMHdO?=
 =?utf-8?B?Rjh3dzdjTkRUYjd3RS9QR1oxbUpGK2k1NCtzSE9vbHdPQVladlo0aVRFUlN3?=
 =?utf-8?B?VS9ERHN2QytNdnc2UjUzM3RJVFJrMjZadzVBZllxSVBld2FXZWcvTmFhY2t2?=
 =?utf-8?B?d0F3MnJIUkdaVGx0Y2lKZDlSczV3QWNBWkh6MHJTV25tcXJQdFZuSVVKNG1M?=
 =?utf-8?B?UndEOVZPcitweHNBUE5sUno5akVSelpwM3VDQnNiTnNxWVJCb1BacVRURGJj?=
 =?utf-8?B?UmNtV3ZhNmM2b2xvNFZLc1c4Qyt0ZGYyOWJkY1ZFOW1nYnZmRnlhekNjamx4?=
 =?utf-8?B?bW5hWjRjb0p1Tk5sbi9INlU0eTZudlJIWDFNcldydC9La2hHZTBRUUVycFBX?=
 =?utf-8?B?bmlWOGM0Q3FwSjlLT3FEMHkzNTYrbzhMUE9HdUN0Q1RicVlHdWtsMGxaN0RM?=
 =?utf-8?B?QU1IZnZLTEsxRVlPbmVRQ1RPQ1IwbUJ2bEh5UWpkZjhDbVEzeEt5ZTcwRlBR?=
 =?utf-8?B?WlRvdENFcWZyM0xjUUNJWWc1QnJ2OVN6cWorZ2JWcThtZEpOVlgrZVFtRHRw?=
 =?utf-8?B?N0Fja3B4MTExNW83T3NubFIrWHI2VWJGQVBlSUtvaHFVVC9HZzVJK29GcCta?=
 =?utf-8?B?RFpKdXhkSGdQbjVacmpsUDEyWC9jNm5ZNmI3SkhOdVAxcFdyM3dXallZc1pO?=
 =?utf-8?B?b3h1cnRPQU9LQVF5akdoNVNwdTZJbWZlMDJxTVIxRVRIVlhNUW9JZjhQVjNV?=
 =?utf-8?B?c0EzZVBvUnltQUV0VjRLQlkzL014Q1YwK0dsS2hjVHdVKzg3eUw4SGtuWUlI?=
 =?utf-8?B?ZlVqU3hGS2RhQUYzRkd5b3FlK2JYM3c4a3J2M1FJczBnRXVOUmlxU0kycURN?=
 =?utf-8?B?bTFvazB5OTNYYVJEWEFlVVVabjlYb0M2NGZWNkM3ellkZk9xTFVXZDFwUnVD?=
 =?utf-8?B?eTNCSUErbEx1QlB3QVllZjZScW5BUENBelUzbFhLQ2NmcnpMM3hFTW1vVFZQ?=
 =?utf-8?B?cnFXZWpvUmxZelZTbzhySkRTeEdPOXI3UzU3dEJ5NFlJVG1reWJocWJkNzJw?=
 =?utf-8?Q?idABIt9L3lUWX1Lk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e91cb8-db4a-470c-fd04-08da4df62dca
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 11:08:15.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpUxhxbxzj1VgHINIgrgptLYQevuZ7lmfi6jwL8/94uQNqdPNERNA4DZ2as/aEXU5/PqLn1XAzThiT/HXQ08cFqNEJ8PPufPrSmrcncHoOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4421
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-14_03:2022-06-13,
 2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140044
X-Proofpoint-GUID: 94hpE2vg8ak31CwwxIhwLVPAkmiF8kTw
X-Proofpoint-ORIG-GUID: 94hpE2vg8ak31CwwxIhwLVPAkmiF8kTw
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/22 18:07, Avihai Horon wrote:
> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state recover_state;
> +    int ret;
> +
> +    /* We reach here with device state STOP or STOP_COPY only */
> +    recover_state = VFIO_DEVICE_STATE_STOP;
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
> +                                   recover_state);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    do {
> +        ret = vfio_save_block(f, vbasedev->migration);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    } while (!ret);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +    ret = qemu_file_get_error(f);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
> +                                   recover_state);

Is it expected that you are setting VFIO_DEVICE_STATE_STOP while
@recover_state is the same value (VFIO_DEVICE_STATE_STOP) ?

> +    if (ret) {
> +        return ret;
> +    }
> +
> +    trace_vfio_save_complete_precopy(vbasedev->name);
> +
> +    return 0;
> +}
> +
>  static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -593,6 +775,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>      }
>  }
>  
> +static int vfio_load_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
> +                                   vbasedev->migration->device_state);
> +}
> +
>  static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -620,6 +810,15 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>      return ret;
>  }
>  
> +static int vfio_load_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    vfio_migration_cleanup(vbasedev);
> +    trace_vfio_load_cleanup(vbasedev->name);
> +    return 0;
> +}
> +
>  static int vfio_v1_load_cleanup(void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -662,7 +861,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>              uint64_t data_size = qemu_get_be64(f);
>  
>              if (data_size) {
> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
> +                if (vbasedev->migration->v2) {
> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
> +                } else {
> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
> +                }
>                  if (ret < 0) {
>                      return ret;
>                  }
> @@ -683,6 +886,16 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>      return ret;
>  }
>  
> +static SaveVMHandlers savevm_vfio_handlers = {
> +    .save_setup = vfio_save_setup,
> +    .save_cleanup = vfio_save_cleanup,
> +    .save_live_complete_precopy = vfio_save_complete_precopy,
> +    .save_state = vfio_save_state,
> +    .load_setup = vfio_load_setup,
> +    .load_cleanup = vfio_load_cleanup,
> +    .load_state = vfio_load_state,
> +};
> +
>  static SaveVMHandlers savevm_vfio_v1_handlers = {
>      .save_setup = vfio_v1_save_setup,
>      .save_cleanup = vfio_v1_save_cleanup,
> @@ -697,6 +910,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>  
>  /* ---------------------------------------------------------------------- */
>  
> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state new_state;
> +    int ret;
> +
> +    if (running) {
> +        new_state = VFIO_DEVICE_STATE_RUNNING;
> +    } else {
> +        new_state = VFIO_DEVICE_STATE_STOP;
> +    }
> +
> +    ret = vfio_migration_set_state(vbasedev, new_state,
> +                                   VFIO_DEVICE_STATE_ERROR);
> +    if (ret) {
> +        /*
> +         * Migration should be aborted in this case, but vm_state_notify()
> +         * currently does not support reporting failures.
> +         */
> +        if (migrate_get_current()->to_dst_file) {
> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        }
> +    }
> +
> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> +                              new_state);
> +}
> +
>  static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -770,12 +1011,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>      case MIGRATION_STATUS_CANCELLED:
>      case MIGRATION_STATUS_FAILED:
>          bytes_transferred = 0;
> -        ret = vfio_migration_v1_set_state(vbasedev,
> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
> -        if (ret) {
> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +        if (migration->v2) {
> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
> +                                     VFIO_DEVICE_STATE_ERROR);

Perhaps you are discarding the error?

Shouldn't it be:

	err =  vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
					VFIO_DEVICE_STATE_ERROR);

> +        } else {
> +            ret = vfio_migration_v1_set_state(vbasedev,
> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
> +            if (ret) {
> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +            }

Perhaps this error_report and condition is in the wrong scope?

Shouldn't it be more like this:

if (migration->v2) {
	ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
				 VFIO_DEVICE_STATE_ERROR);
} else {
        ret = vfio_migration_v1_set_state(vbasedev,
                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
                                            VFIO_DEVICE_STATE_V1_RESUMING),
                                          VFIO_DEVICE_STATE_V1_RUNNING);
}


if (ret) {
    error_report("%s: Failed to set state RUNNING", vbasedev->name);
}

>          }
>      }
>  }
> @@ -784,12 +1030,35 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>  {
>      VFIOMigration *migration = vbasedev->migration;
>  
> -    vfio_region_exit(&migration->region);
> -    vfio_region_finalize(&migration->region);
> +    if (migration->v2) {
> +        g_free(migration->data_buffer);
> +    } else {
> +        vfio_region_exit(&migration->region);
> +        vfio_region_finalize(&migration->region);
> +    }
>      g_free(vbasedev->migration);
>      vbasedev->migration = NULL;
>  }
>  
> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                                  sizeof(struct vfio_device_feature_migration),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (void *)buf;
> +    struct vfio_device_feature_migration *mig = (void *)feature->data;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        return -EOPNOTSUPP;
> +    }
> +
> +    *mig_flags = mig->flags;
> +
> +    return 0;
> +}
> +
>  static int vfio_migration_init(VFIODevice *vbasedev)
>  {
>      int ret;
> @@ -798,6 +1067,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      char id[256] = "";
>      g_autofree char *path = NULL, *oid = NULL;
>      struct vfio_region_info *info = NULL;
> +    uint64_t mig_flags;
>  
>      if (!vbasedev->ops->vfio_get_object) {
>          return -EINVAL;
> @@ -808,32 +1078,48 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>          return -EINVAL;
>      }
>  
> -    ret = vfio_get_dev_region_info(vbasedev,
> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> -                                   &info);
> -    if (ret) {
> -        return ret;
> -    }
> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
> +    if (!ret) {
> +        /* Migration v2 */
> +        /* Basic migration functionality must be supported */
> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
> +            return -EOPNOTSUPP;
> +        }
> +        vbasedev->migration = g_new0(VFIOMigration, 1);
> +        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
> +        vbasedev->migration->data_buffer =
> +            g_malloc0(vbasedev->migration->data_buffer_size);
> +        vbasedev->migration->data_fd = -1;
> +        vbasedev->migration->v2 = true;
> +    } else {
> +        /* Migration v1 */
> +        ret = vfio_get_dev_region_info(vbasedev,
> +                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                       &info);
> +        if (ret) {
> +            return ret;
> +        }
>  
> -    vbasedev->migration = g_new0(VFIOMigration, 1);
> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>  
> -    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> -                            info->index, "migration");
> -    if (ret) {
> -        error_report("%s: Failed to setup VFIO migration region %d: %s",
> -                     vbasedev->name, info->index, strerror(-ret));
> -        goto err;
> -    }
> +        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> +                                info->index, "migration");
> +        if (ret) {
> +            error_report("%s: Failed to setup VFIO migration region %d: %s",
> +                         vbasedev->name, info->index, strerror(-ret));
> +            goto err;
> +        }
>  
> -    if (!vbasedev->migration->region.size) {
> -        error_report("%s: Invalid zero-sized VFIO migration region %d",
> -                     vbasedev->name, info->index);
> -        ret = -EINVAL;
> -        goto err;
> -    }
> +        if (!vbasedev->migration->region.size) {
> +            error_report("%s: Invalid zero-sized VFIO migration region %d",
> +                         vbasedev->name, info->index);
> +            ret = -EINVAL;
> +            goto err;
> +        }
>  
> -    g_free(info);
> +        g_free(info);
> +    }
>  
>      migration = vbasedev->migration;
>      migration->vbasedev = vbasedev;
> @@ -846,11 +1132,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      }
>      strpadcpy(id, sizeof(id), path, '\0');
>  
> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> -                         &savevm_vfio_v1_handlers, vbasedev);
> +    if (migration->v2) {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_handlers, vbasedev);
> +
> +        migration->vm_state = qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_vmstate_change, vbasedev);
> +    } else {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_v1_handlers, vbasedev);
> +
> +        migration->vm_state = qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
> +    }
>  
> -    migration->vm_state = qdev_add_vm_change_state_handler(
> -        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);
>      return 0;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index ac8b04f52a..6e8c5958b9 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -163,6 +163,8 @@ vfio_save_complete_precopy(const char *name) " (%s)"
>  vfio_load_device_config_state(const char *name) " (%s)"
>  vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
>  vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
> +vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
>  vfio_load_cleanup(const char *name) " (%s)"
>  vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>  vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index bbaf72ba00..2ec3346fea 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>      int vm_running;
>      Notifier migration_state;
>      uint64_t pending_bytes;
> +    enum vfio_device_mig_state device_state;
> +    int data_fd;
> +    void *data_buffer;
> +    size_t data_buffer_size;
> +    bool v2;
>  } VFIOMigration;
>  
>  typedef struct VFIOAddressSpace {


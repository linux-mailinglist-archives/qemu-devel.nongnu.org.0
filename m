Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0A54F4739
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 01:28:06 +0200 (CEST)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbsai-0006kk-M2
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 19:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nbsZW-000668-Hq
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 19:26:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nbsZT-0004WP-9m
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 19:26:49 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 235Jc9vc001019; 
 Tue, 5 Apr 2022 23:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kJ49ANg4OlZNJSUrQ1iMBQfRzcskfMR0+D5N0M3cQIw=;
 b=q4VVmDBDqSrBnj12qXD6gwui1lQyNLolY3+4vY10CQ9/exeGPxQRedOdt2qeDFgBbel+
 M1VbDTQzgJ+Ojyshi3LTwfpS+NNdfi7lkxbvtojnTymnsBx7vzr573Wqz3dRvkKvSBl8
 YTJuG4SHOVsIJntcyRRrj7G4eLTi5su7m4SZGef+BF73//+QMnICgR9BGVDooT66Rtzi
 ibrXyzkZ11OuUHWREn4D4pStAbKyrCEm9GhY5mR90Lb0Wj0HkDX/OBlm4gK8MTMpV1mc
 SBdFEiJVxahyRwNtuJLEA/p0OTkUeA/3w7b/lgIozReSU4SUobb/PDY/19OquTE9FIbu RA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6e3sqc95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Apr 2022 23:26:42 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 235N6oQm018271; Tue, 5 Apr 2022 23:26:41 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f6cx41x9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Apr 2022 23:26:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYhykW4sMY/UimR/uL+3rSHhGYZT02HtYsyBQh0m8Sz90R1SF6XaIKfIoUMmGTKPuLjOyuN/62A+m8X6BkZkV1ZW3u6l31qg6inHaNlvidkct7A845qvFAIiurDUIBf5n2NokR0ZWhtbYWqwSH882Udv0Cw/L+2jJ4L3wKsr757PmCUlONjdHODLWbZvPYWxTeCUhdrSp8qiyret7HDRwZ7mhDDp/d7ijQ3qSRAvWo2QZJdwRrEsoR5Qj2jjbTONEd1kTKG75UazIhEHTuZVqOjDg7bYYtB513NSXdTm7K3qfeCaTiiH141VpJkyyIem7/QqnDrrytkLsDfzrFoiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJ49ANg4OlZNJSUrQ1iMBQfRzcskfMR0+D5N0M3cQIw=;
 b=CNqKS7iHh3M28yezUP/GErNk7Kr8irpWJAUOyZdBDMBjscBpLjCV7Bb7NqYj1IrpGVPFC+jhsjp+2+mWnE8ghfScHxrIKamwbzB8+0nrqy3ZzrJsO0hXKzOYGt/1dEn/htmDVel32lWtjU5Mn4uB2ZzqT4NkdLPBc6zT4aISOBDCb26c96PsOFbPK0TFAp93cw9+5mbiNW0t1WvYI3oy5y0b+2RRIOp7q/43zyccwAZYMkMVxKM+BGWcQ2Z2pOpmFX7nNrlxa5uoaz17xna+AhqVMpWCMKIQrEGHhKKvMmZujC8uqHMn87BLkbCtqecf8bl7E4qU4nH4u9SO/eyxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJ49ANg4OlZNJSUrQ1iMBQfRzcskfMR0+D5N0M3cQIw=;
 b=S29MRbmnw4oymnna/+eM69RtUCtDyZJV/CGHHbXpXChzq5jCLm0GWPSVMTZYy9HiZDQwH21NvoNGN/CT71mSKc7jKs4kyu1LbJA+yhaM5ibG6JkMQzpRj8kWKngkGo0FxhRDXhly9Eyky/iXU0r4EKx1vsZaAnDBaML+ECVijys=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by SN4PR10MB5640.namprd10.prod.outlook.com (2603:10b6:806:20b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 23:26:39 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 23:26:39 +0000
Message-ID: <c4220eb3-a414-559e-5d65-cc35f0f9ed0f@oracle.com>
Date: Tue, 5 Apr 2022 16:26:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-2-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEv=bhGFHqv=Mi7FSnwvDZU4GAvFw564piP6nr3CHD+-Wg@mail.gmail.com>
 <2e9ec844-952d-b43c-7ed3-499eeac6b7cb@oracle.com>
 <CACGkMEsQMk9Tbk76HLnKXF=YQ04K8T3tysk927wt_prkPw8ONQ@mail.gmail.com>
 <293bb948-f3f1-22bb-ee8b-30656f7620b5@oracle.com>
 <CACGkMEt4DjiKb-q9FhYFdhrXPhs8+daD6EPaRwShBqDCixe0wQ@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEt4DjiKb-q9FhYFdhrXPhs8+daD6EPaRwShBqDCixe0wQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:806:f2::9) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8face612-0e80-4f88-ed77-08da175bbc30
X-MS-TrafficTypeDiagnostic: SN4PR10MB5640:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB564066A9A2E32CBD2070B021B1E49@SN4PR10MB5640.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4wUZxrTccYw3Upc0T4eTBDYw2z7XyBrPp7s3NMefzwdh1ocPlZt6UmXCzpKE/W/SK2S0tubY77yEeQFIWVX+vKwAmofSfd+FJYkLOsT/68XkjF2WP814zXDVtt/IAAJbHJklHMMEaSIV1fnyX3IgTKtgN454qOEewtDANlPobvP6YvC1rMB40pWs7+FaQE+UhgpssymThpKAEFQyDosrYg0d+DO55cG/6Yo2mwTGul6DEQTPpHiE1yVkDRAjIUDaoW5rjB2iSUf6EpQcxl+DL/N6Ls7m5CdLBCuWiEnue3e/atqjh7Dm4giZq349Ayf7fudjvUScL94Xrj7HdNWi6FbaHQ2aTWylygXj8h4FFLwyUFYd8wTRc0Zp17o4uogR0EAGk3rhMB5dbzjTIFR5yiJMxQWN0Vt5JfJB32F+jXePW6LqtPPDoI0fCp1z0CQRM1VrdKogr8RxBmi/g6j1gUsuiE4W0+XU4gI/YH/NEYmVjX0/nMCt0mZ8IBuayt+3nQdfzcF3gqYiw37dG9WDmbbT0IpcV171e6Wtxf41narIlWJD+wa8wICGdzSJxNWH0sc+3eIfmvFBU8ddnhlG3Qmliy0zBRuIhK/HFrnPKcq1KUmxwmDZ1sSW/72Om4fVzIKeM3dIE6YNkZGDAYjhbrfNNTIQ57Q8dPW9qEFjDLKtVF7VKCveCAOcbGkHCSbXJU/OIFpbLKQaHzXkOnReKLL6pWkaoQ6jdSdK80Cws1oC8+hi3o35QpVfbojSgUL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(53546011)(31686004)(6506007)(66476007)(6486002)(66556008)(66946007)(30864003)(6512007)(2906002)(508600001)(83380400001)(36916002)(38100700002)(5660300002)(186003)(54906003)(8936002)(86362001)(6916009)(36756003)(31696002)(8676002)(4326008)(2616005)(316002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWUvR21PS2MzRGxOS3JjZ3pjc1FkUnpycVJqREdwUDlsem1UeXIwejk0Z05p?=
 =?utf-8?B?d2ZQWjBBbkl3KzZad0F1NG5pOEV3anNBaWdFS05nVXZDKzFEais4WWVIYWVZ?=
 =?utf-8?B?LzdoUXE0N0NJM0NLY1REZk96Rm1OT1BMNXNlUGdrUzBrN0ZHbGJlenVtdGpo?=
 =?utf-8?B?cCt0emgxOWN3MTI0SWpsVGFKZnVseWFoU2E3RWd1TmZrWFMvclUwS1VWd2dE?=
 =?utf-8?B?eW94TmxCMjE5WTRVem9YblBiaENhTXozcHhBNURQR0d5cFM3QUIySHFrUVUr?=
 =?utf-8?B?Y25Wd0YyaWp5bm9Ea2hRTkRhcmR6WnY2Wm9aTEtNbXhlSUtLMlhnN1BMbG1Q?=
 =?utf-8?B?UDhUdGRGdkxhTThISm1xWi9lS0Fid1VoRHFVVEZWVldHZm0za1hWd0tob29K?=
 =?utf-8?B?VEZMTkcxRng5UVZqYzFFSjVsbHQ4c1IxWXEzMm03SU5LRXJMNElZbzVzODFn?=
 =?utf-8?B?aGNvSHNPQ3ZKY0lSWnpwYzBiOTRLMzlZbEtLQlNpZFhycHowSzBVVFNqditk?=
 =?utf-8?B?NzVKbDh3YnR1SXhWYXV1MEZtQlpTVDZ2Tjh1SFNGejYyU09hc0duaXQ0TU9q?=
 =?utf-8?B?dUQ3MlpNS2s4a0UrUm4vSGZwVzRYSXdTTzhPT1ppS2IySk9aaGFDcWZhNk5r?=
 =?utf-8?B?TUpYbWVjQnNwRWdMSkdwSk1zWHJjVThEcGJQZm5yQ0ZWTVc3UURrRG5yUmtq?=
 =?utf-8?B?RlFMSVZQOGtuanBSd2trM1hON3FMaEJCODZWanFabmVISktCMmFjYi8xNW5Z?=
 =?utf-8?B?cktIL29IZTM3Syt2OGl3KzNTL25ycjNid0EwaDMvSUN0SEd1TWlpYTQxRWN5?=
 =?utf-8?B?VjJGYTV3NldqMXQxdzVLRWE3YnJ3RWVjdVM0MTNYNlkybHQ1bHZWaXJkNk93?=
 =?utf-8?B?TFErTUtFYWtDcUdydEt2R1o5RmEwWExCa0VGQjBDdXBEQkRXbFV0SFVuWkxw?=
 =?utf-8?B?T0EzNWx1NFgvbnRVN0FIVk9xMGNkRzYvcERuUHBudURRNkxnSzRqNmdoWC9p?=
 =?utf-8?B?TitaNitXbGc1ckpDNlpWVUFPL0xGNVY5aGdSU3EyN0M0R3dXNjhJcUh0YWNz?=
 =?utf-8?B?YnV0YW4xN1FaVXZwRllSUndJakNpK0p4SjVBU2ZvWk9FbmI5cjZPV1psY3FI?=
 =?utf-8?B?SUUvck1kTEg0c0g5NE0yWDJNaCtDRTdYdmsvU0QzTy9QYWVpZE9hR0RFUGdx?=
 =?utf-8?B?bC9aZUQzN3ZjLzBLTUVkcnltZlQ1SDY5S3MremlZZVBLYy9mYUJLWGh4NTdK?=
 =?utf-8?B?NFJMS0t2NjVUNjFKUU5XZkVRdjU0U2RtQm1PSkVQMm83eEVxcENqQWJJY0VR?=
 =?utf-8?B?cUNRRjVyRFdiRnpIbEg3UitSMlRqMkJSV2tOVVJqUU1kdVk4eFVLVm9HNkpN?=
 =?utf-8?B?SndjSXp0R3dKZVBKR3FEK1VuV1NJTFZCaDE3TFZGVlFoOE01dkhnMnFPSnI5?=
 =?utf-8?B?ODJLaVRtZTRrSktaM2FtKzJUUDJiQ09qUlN4YzJ6YzVBS0J1NUFGbVhvWUZi?=
 =?utf-8?B?UHd1YnFubWo4SmhmL2xzdk5oRHFxWG1sUTlKTWNxT2N4eTlBSjA3SzBIRHd0?=
 =?utf-8?B?anpCMUlzWC9xbDQwM2FRUEZvZkJzYXdVTkFlNVBxejA3VE9NanVsYzZMTHlh?=
 =?utf-8?B?RUNQdFBuUlphM29UallGQWR5K1hMTXlPdUpCWWV6dEsraFRaTFVHNGwvYkZ6?=
 =?utf-8?B?aDlob2tOK2liaW1XaENpZ0hKakdvMXNwRnNRSFpuMnpvUis3bUhGczh0bkRo?=
 =?utf-8?B?SGo3QWVzSE1zVk9lZUE3a1NWVGpqMFZ3S29jN0N0N241eGJRMkRtZG81VWg1?=
 =?utf-8?B?bUdPeEJuL2c5Mm9hbitzazVSYmZQMGtXWldhei90YUhGQ1h6ejR5ZnZSaElD?=
 =?utf-8?B?VG02NmlINm83TXFOL1FNQXV1RjBNdGYyc3RaeU5RSVJzeGtNcHpreS9ZS0Nw?=
 =?utf-8?B?UU5mMmk1RTRnUzBpTEcrMVpROFREWjg0NUNpOFlPbnp0QkVZeU5Fei9QV1hn?=
 =?utf-8?B?aFlHcnBMZ0Nad29DRUVMU0Q3T0FLd3NuSVQ1QjNtRkE0N1RVaU0zQ3pBcldE?=
 =?utf-8?B?Qk50cFZkTG5XT21uT25rZFRJNnVwZFNUMmI3SXYvYlBGai9mUUQ4RmFwSTQx?=
 =?utf-8?B?cEZVQUlsQkJibHJFUXFhNFB5REZUYVNsbS90d05sUmwzaHhnbjEydDdXVVlB?=
 =?utf-8?B?M1BTZjFXbHgycFd2MS9iU3ZjeWFBQXljaUhZSk5LekpIWThOWW1hZi9xb3Nr?=
 =?utf-8?B?T3ZYRVlvZkJCK1hOUkllNEpYZWdOU25QMUhQRGUwMFd2OU9MbHIvcEFSNk5x?=
 =?utf-8?B?K2JwbzRZRjhCUnBjWjJSdGlPb3RRYmR5dXZNa0Q0aTRmVktDeGhWMmxSc2xj?=
 =?utf-8?Q?APb2C6lr5j9BTBzI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8face612-0e80-4f88-ed77-08da175bbc30
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 23:26:39.5319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT4D2CyO8KwlbW6NOVA45dpHSBNvx9+UEeEM+c9MGRgRt+8ZhN53BAn67vXpplIaXsBciMtsrvu5GcmTRi5CHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5640
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-05_08:2022-04-04,
 2022-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204050125
X-Proofpoint-ORIG-GUID: u-G0Tmc2nS2mgrTKPrjteqY5XerNcI8u
X-Proofpoint-GUID: u-G0Tmc2nS2mgrTKPrjteqY5XerNcI8u
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eperezma <eperezma@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/1/2022 7:10 PM, Jason Wang wrote:
> On Sat, Apr 2, 2022 at 6:32 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 3/31/2022 1:39 AM, Jason Wang wrote:
>>> On Wed, Mar 30, 2022 at 11:48 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>
>>>> On 3/30/2022 2:00 AM, Jason Wang wrote:
>>>>> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>>> With MQ enabled vdpa device and non-MQ supporting guest e.g.
>>>>>> booting vdpa with mq=on over OVMF of single vqp, below assert
>>>>>> failure is seen:
>>>>>>
>>>>>> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
>>>>>>
>>>>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>>>>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>>>>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>>>>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>>>>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>>>>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>>>>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
>>>>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>>>>>       at ../hw/virtio/virtio-pci.c:974
>>>>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
>>>>>> 9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>>>>>       at ../hw/net/vhost_net.c:361
>>>>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
>>>>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
>>>>>> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
>>>>>> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>>>>>> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
>>>>>>       at ../softmmu/memory.c:492
>>>>>> 15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
>>>>>> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
>>>>>>       at ../softmmu/memory.c:1504
>>>>>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
>>>>>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
>>>>>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>>>>>       at ../softmmu/physmem.c:2914
>>>>>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
>>>>>>       attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
>>>>>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>>>>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>>>>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
>>>>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>>>>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>>>>>
>>>>>> The cause for the assert failure is due to that the vhost_dev index
>>>>>> for the ctrl vq was not aligned with actual one in use by the guest.
>>>>>> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
>>>>>> if guest doesn't support multiqueue, the guest vq layout would shrink
>>>>>> to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
>>>>>> This results in ctrl_vq taking a different vhost_dev group index than
>>>>>> the default. We can map vq to the correct vhost_dev group by checking
>>>>>> if MQ is supported by guest and successfully negotiated. Since the
>>>>>> MQ feature is only present along with CTRL_VQ, we make sure the index
>>>>>> 2 is only meant for the control vq while MQ is not supported by guest.
>>>>>>
>>>>>> Be noted if QEMU or guest doesn't support control vq, there's no bother
>>>>>> exposing vhost_dev and guest notifier for the control vq. Since
>>>>>> vhost_net_start/stop implies DRIVER_OK is set in device status, feature
>>>>>> negotiation should be completed when reaching virtio_net_vhost_status().
>>>>>>
>>>>>> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
>>>>>> Suggested-by: Jason Wang <jasowang@redhat.com>
>>>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>>>> ---
>>>>>>     hw/net/virtio-net.c | 19 ++++++++++++++++---
>>>>>>     1 file changed, 16 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>>>> index 1067e72..484b215 100644
>>>>>> --- a/hw/net/virtio-net.c
>>>>>> +++ b/hw/net/virtio-net.c
>>>>>> @@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>>>>>>         VirtIODevice *vdev = VIRTIO_DEVICE(n);
>>>>>>         NetClientState *nc = qemu_get_queue(n->nic);
>>>>>>         int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
>>>>>> -    int cvq = n->max_ncs - n->max_queue_pairs;
>>>>>> +    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
>>>>>> +              n->max_ncs - n->max_queue_pairs : 0;
>>>>> Let's use a separate patch for this.
>>>> Yes, I can do that. Then the new patch will become a requisite for this
>>>> patch.
>>>>
>>>>>>         if (!get_vhost_net(nc->peer)) {
>>>>>>             return;
>>>>>> @@ -3170,8 +3171,14 @@ static NetClientInfo net_virtio_info = {
>>>>>>     static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>>>>>>     {
>>>>>>         VirtIONet *n = VIRTIO_NET(vdev);
>>>>>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>>>>> +    NetClientState *nc;
>>>>>>         assert(n->vhost_started);
>>>>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>>>>>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
>>>>> This assert seems guest trigger-able. If yes, I would remove this or
>>>>> replace it with log_guest_error.
>>>> This assert actually is relevant to the cvq change in
>>>> virtio_net_vhost_status(). Since the same check on VIRTIO_NET_F_CTRL_VQ
>>>> has been done earlier, it is assured that CTRL_VQ is negotiated when
>>>> getting here.
>>>> Noted the vhost_started is asserted in the same function, which in turn
>>>> implies DRIVER_OK is set meaning feature negotiation is complete. I
>>>> can't easily think of a scenario which guest may inadvertently or
>>>> purposely trigger the assert?
>>> So the code can be triggered like e.g unmasking:
>>>
>>> virtio_pci_vq_vector_unmask()
>>>           k->guest_notifier_pending()
>> Hmmm, are you concerned more about idx being invalid, or
>> VIRTIO_NET_F_CTRL_VQ getting cleared?
> Something like this, we can't let a buggy driver crash into Qemu.
>
>> virtio_pci_vector_unmask() has validation through virtio_queue_get_num()
>> that ensures the vq index is valid.
> Actually not, it just check whether the vq size is set:
>
> int virtio_queue_get_num(VirtIODevice *vdev, int n)
> {
>      return vdev->vq[n].vring.num;
> }
>
>> While it doesn't seem possible for
>> VIRTIO_NET_F_CTRL_VQ to be cleared without device reset first,
> Probably, since we had a check in virtio_set_features():
>
>      /*
>       * The driver must not attempt to set features after feature negotiation
>       * has finished.
>       */
>      if (vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) {
>          return -EINVAL;
>      }
>
> But another interesting part is that the guest_feautres come from the
> migration stream as well:
>
> static const VMStateDescription vmstate_virtio_64bit_features = {
>      .name = "virtio/64bit_features",
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .needed = &virtio_64bit_features_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64(guest_features, VirtIODevice),
>          VMSTATE_END_OF_LIST()
>      }
> };
>
> We should also be ready to let the buggy migration flow to crash us.
Fair enough. Given the possibility of introduction through migration 
stream I think now it's needed to converting assert to error. Thanks for 
pointing it out.

Thanks,
-Siwei

>
>> during
>> which the pending event left over on guest notifier eventfd should have
>> been completed within virtio_pci_set_guest_notifiers(false) before
>> vhost_net_stop() returns. If I am not missing something here, I guess
>> we're probably fine?
> I'm not sure I got here, but the mask/unmask is not necessarily
> related to vhost stop. E.g it can happen if guest want to change IRQ
> affinity.
>
> Thanks
>
>> -Siwei
>>
>>> Thanks
>>>
>>>
>>>> -Siwei
>>>>
>>>>>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>>>>>> +    } else {
>>>>>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>>>>> +    }
>>>>>>         return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>>>>>>     }
>>>>>>
>>>>>> @@ -3179,8 +3186,14 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>>>>>>                                                bool mask)
>>>>>>     {
>>>>>>         VirtIONet *n = VIRTIO_NET(vdev);
>>>>>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>>>>> +    NetClientState *nc;
>>>>>>         assert(n->vhost_started);
>>>>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>>>>>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
>>>>> And this.
>>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>>>>>> +    } else {
>>>>>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>>>>> +    }
>>>>>>         vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>>>>>>                                  vdev, idx, mask);
>>>>>>     }
>>>>>> --
>>>>>> 1.8.3.1
>>>>>>
>



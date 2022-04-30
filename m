Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3669515986
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 03:14:19 +0200 (CEST)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkbgg-0004g9-AL
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 21:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nkbfb-0003GW-SK
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 21:13:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nkbfY-0007ND-A8
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 21:13:10 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TLMg46015535;
 Sat, 30 Apr 2022 01:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GjaOSgwz9ylDOn4xpOReX3IXK02oVXDzqudL+HXgMvk=;
 b=kKlkmId0h08ehw0RyESc1py7OCdqa/8PXI4AxVmuYDVZUI5JfHMVUXz51dC22ix1Wmtt
 d3Zk9sSK/A5wN72s+bDvnKJq50hkRO8+kRY+6UMTD+ehIfL9692rXWEDWq2e1a1vFpxn
 m//iuGjZTOenpaS2H9eT9kHIq05bBF/BXitr83fA0pnngDIGMDl0VoUo/J6l7uUbeshO
 W6apUiVAdEdVye6YvefrPSgHGZW518xCko7cHue2xIo04WhyURLb6YCBOt4R/QoYZg+r
 Ft7pdTemPdWTjniclly8mgX+7GkrF3/BJo1lDjP2r5Z0ib0S2vHCwU1H6LbdTy+butHJ mw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb9b008j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Apr 2022 01:13:02 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23U1Awxk034894; Sat, 30 Apr 2022 01:13:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w8kj7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Apr 2022 01:13:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bi45wBS5kqGPO1Zd0bJrgBa8a4qyYHGs8vZUC+QIHOLwP3MmiIUQrIIaSF+lqMBkRDF0K2yY9IcqFxSePi+gh1G4OJheqZVh+j2izBgvtRNzC1CV1sA3Pi7wIlNW4t1yIIFqIQwk0GtJDMKemuk1GMOo+UpHuDob7ydyajQTiZyTixN1/JaM7RFtWi1LE1jPwRDE9VA4Np6SdfWWKUfGBTN17mwXxuCLn0Q8ujdqbutcIigNrfD8dWBdPbKhzaiOpbKfiKbtF8stxoMoMm1YaWBSrgOnTIuxvaT+Zos2v5viziD01LdGHfCWdnbxoneb22En5mElIh0vX8MitpMgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjaOSgwz9ylDOn4xpOReX3IXK02oVXDzqudL+HXgMvk=;
 b=ML9hqBep3FwKFTYZhdBYnm0Uf6Y7qhAs89G8ZxuG430OQFWItdNeYKklVuHvP65CmW5wlaii7qAVJEnzdNowq30lY2rb1czcSWtUkIs+ST4r9sOdLZmuoCZ8cxwPKMe03CZMqAcBbZbDg6fjybfhGwq0JOjmKiqk4af+mUotHePKxB/ObcJn14eJ22mhSeJJ5RWpibFDHaiJdSNORVZeMBMp5tSJVCQJSpfzpTTVxpsyXmz0dGw9J/zALgQ3y+eJ4HG6FZT3zDpqDDrzbOm6MsAvrvPbAKqMSL62NGIPqHtZWSPUEgZ+5fsJL0amyolOoXD+GbfwiDHx7kzYPouzXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjaOSgwz9ylDOn4xpOReX3IXK02oVXDzqudL+HXgMvk=;
 b=QU5d4+6rolxLArdMIyIDSnyWzVw+PHF93UDKC2a2XnDwVeNeEgK3kVMIunZwtByDDvmilYxl5aCoWdn7bODnnSkZ4tJVy8t1Sy1l9fUBe/4aCvIjbn+NwStZAVZC4ht5lOb9PBolYKIbIQ5+ZX1iYzfrBjFEE3OjzQBCAsMPcj4=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CO1PR10MB4403.namprd10.prod.outlook.com (2603:10b6:303:9a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sat, 30 Apr
 2022 01:12:59 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Sat, 30 Apr 2022
 01:12:58 +0000
Message-ID: <7b08b80a-ffa6-80aa-47f3-64cb9608e2f9@oracle.com>
Date: Fri, 29 Apr 2022 18:12:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/5] virtio-net: align ctrl_vq index for non-mq guest
 for vhost_vdpa
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
 <1651048216-3365-3-git-send-email-si-wei.liu@oracle.com>
 <ba73db72-c8b5-0028-bf15-56dba91af7b6@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <ba73db72-c8b5-0028-bf15-56dba91af7b6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::17) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba5c9e11-6f9b-4a6b-c3a5-08da2a46908d
X-MS-TrafficTypeDiagnostic: CO1PR10MB4403:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4403476C8A0D3F570D0A0576B1FF9@CO1PR10MB4403.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/ABH+Z3XZQp9lY3/6Ax+A0DWrMj/dpkdZr/QVJSZrEgVGf4P8V3pEyzc9RgVs9LFCmtGMF7Ke5Z9+aeXc55NsI3pwJpQ/ZBfM80TlEdzhPxShDjgeDdFGBTIIoQdYVjMrwlQtQAjUesvGyTGPKuzw4cimP8i+G01jsBHXmmiITWm9uG6ZHVZmidyUYJbwHP+m9dgvKLUFuJV0A9DI7Z1wb6yoFckdVbII/XcHlrvJmlWErZxPbDvdnKJVLkvjo3HQsyJrJy4wh7eizw2B8h7gyEtJpRS2Mm2v1kSaZOZFjn+1t4Ra5muQLW0IIsfdQ9XUi8Wp5qUyj6flwvXKDB7y1Oks6hYxSDQuJC5kt992JEqEEHCIXvSS3+BhJEZ2sHAsUlXz1I0v3EnbycyqiXZ8bxecuvCuzG5KvMONYBND+dbncZjZQDTcuN0qgUaUSzqCGRzuxCoQtEvTBfK4H90K7gnN8lr6/BFQXKNwvipmlkVcN/LvFR+ukWh+3QtbRkb0Dyzf4admrWjNrAewz1Vm74k2GM+0ow4WyIo3B16xEofrAwbSkPdiO5iN97iXavKk+yl6FLBMPK9qjcIQxVhpjHvHMlhbMX2T6qB2nYrwWUNvtu3Im95UP4cPHXVgv2GHxlOwrxrR5XAIq27X6VcwiXzRXHZiclqsT6XkZ+4koityfJLiXjiYMUi+FAhQwSlLwcUdCy29KrWd1BYs69zVkkDUq6a+E+hHB9ETo/9eOHHzpBgaPEZMiXe6tzoNIX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(2616005)(6512007)(36916002)(2906002)(66946007)(26005)(6506007)(53546011)(4326008)(8676002)(66556008)(66476007)(5660300002)(38100700002)(31696002)(316002)(186003)(36756003)(8936002)(6486002)(86362001)(31686004)(6666004)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzlsZ3Y1dncvWFZiT3hiZ0plR1RwL2lpMTRvMDNPQkNValZodCtFTHhKQmhU?=
 =?utf-8?B?b0pQRjNnVTF4UmczQ0lOVWtJM21wOStJd0dFYTdNb2lWZFpCbE1ac0hhSkY2?=
 =?utf-8?B?cGRqZFRWeUR2Q3l3SzgvRWh2dUpXSENMbWNHcWtLWjZocjVya01Da2JVYjU1?=
 =?utf-8?B?aHIzenlCWXNmc0pWWUZEcDZpQUFRZjJlZVpnMHdOcFliWnBwWEg4QzhGeHZN?=
 =?utf-8?B?ejJhTU9YamRWUUh6aE5iU0JSbkRhc0dKbTJVUlVGVHptOUIrNElPN1E1VTRL?=
 =?utf-8?B?RWc1bGJDL0h1b0dmK1lHcllQYStBUFgrMjlRUXhGQTF5eUcvNUh3VUQ2Ti92?=
 =?utf-8?B?TGlWckZ2Syt5a2xETVl6SllJZW1IR08zTWNQc21mR0oxWnI0SHRITFhIMWp5?=
 =?utf-8?B?N2RTRG1maXZHSHBucVgxcXA3OFJVaEV6cjN3M3R4djFQcnR6WjlPbmhoUXR6?=
 =?utf-8?B?ZVp0MTNmM3NacTlvNXJFKzE1bHR0bm83NDZmNk90VFphQUMyVnNtZVZvVk5D?=
 =?utf-8?B?R1BYaUNyZndzUitjdXJHTmg0OHl2R2l4K1Q5Z0xIbElOem5BbGVYblRsSkVR?=
 =?utf-8?B?RUVEdFd3ZDVqL3FWTTZhRG1iaG1adytDQlBlY3RObnFwVFN4bHRPNHpTa1ZL?=
 =?utf-8?B?VmwzU0wyWE1wVlNHTWYzZW1KSHpvWlczZmtqeTRXOFVLMU1wS2VHNWZTVFFs?=
 =?utf-8?B?dlRPM2Q2S3d3aDU1QjFrVTVMaTNXaFlDZ3V0UUdlR201UzhHWGdpWWpyRXRo?=
 =?utf-8?B?cm5FcVlTdGRKRHJOVTd5OU15T2UwUXdwVFQyeCtJNExlTVdjN0tKTWE2R1Nx?=
 =?utf-8?B?bEV1aTZ0Q2oxTXFqeXJOcnRzdXYyNThPRU9UL2t0UElMQ1BUYTZvREtVbEhs?=
 =?utf-8?B?bExudndOSVBtUjRPNmo1RTVuWklvbytUdVh6emFYdjQ3QUFJNVB5c0xkdFV5?=
 =?utf-8?B?YUNPbGo0L1VpSzZYQWpFOU80ZytnbHE4d2tJWVlkYVluY2gydi9UYm9HVHU2?=
 =?utf-8?B?dlJrU2pjWXBDdnE1eG9UdW9BVEZHUmVOa0Y1NUc4VHdDaStzWmovYlNBNTdR?=
 =?utf-8?B?ajF1bDdueE53MWs1QngwcTBuOGNJRURtbVFadlJ4Z3JrYnFCZ1B2UWNFUHk1?=
 =?utf-8?B?eWg1UnBFMkRibHMrUHlpM2p3WjVqYzQrUmU5c3MzWkRXYVorMU8rcFlTZk4w?=
 =?utf-8?B?V0t3eVo0dGE1cEJyUnNHdUNtZEZIZHd2MHltMVh1QlU4S1FkL05LbERkNlZk?=
 =?utf-8?B?SkpaaXFPaUN6bE9tSlk2bUJtMndRVzFvWUt6ZU9TL0pZYjl1NkljZ3NZbnIw?=
 =?utf-8?B?MEs1ZEdhMjl4dEpHWFduQ2NIV3pTaEZpWVkxdXZvdE1kOFdGd0plUjlZY1Ew?=
 =?utf-8?B?aGdnK1dxaUduV3Bpd2tPZllYTTRSWVVLTStQR3FRVUJmMHhqRE80QVhpT2sw?=
 =?utf-8?B?ZjZwUlQ3RTJndk9UR29OZ05SQ2FOUjdacUtSZzdWUm1kWHRHSnhzclFPZ2ZQ?=
 =?utf-8?B?S3J6d2dvYWxiSC9oL2NSdFVBOVUwc2srR0tRbytqNkNWOFdwcGlGd1hCTlFa?=
 =?utf-8?B?SG5BS2Vqb29BckI5QS9TV3gxK2xOdTBod0svU2FiWXJTMmowZTRsQTkvZ1VP?=
 =?utf-8?B?b3dmQ3l1ZTlzZFdTeFhIclBCTHpUdEdUMy9naTNqM0dzS3Q0SlU5R2xFZ29r?=
 =?utf-8?B?WWFIOG9NR2ZzVkU3R0RHdmFKMGg2aDZhdWZSK1NCanh4WXJGcG0zSnRXVXAr?=
 =?utf-8?B?NzlEbjdYb25rMUxHSUVnUE5Pb1hYV1VjZ1IxbkFBYXkzeURwd2IyOXB0YS9J?=
 =?utf-8?B?OG5rNUxMREpla2lpOHVmaDlpaHpTNFIvb3NFOG1GSzBsNC84VmdiTkhTVmNE?=
 =?utf-8?B?d2p1cDhLcENkTTI4ZGFpeFlteFJpbzRueUtsZS9UTHhMTnpRaThuczN6Q0ty?=
 =?utf-8?B?QVp3RHB5bWJUbDVmeEpQRXpWMWJhVFhvc2JvdCt1UXpWMlZ6V0NBc0ljOUJR?=
 =?utf-8?B?enZlbGdzN3BYdkpLT2hzUTM2TUVvWXJVM1Y0MHlpaHk1RjZkc3VoNHBzc2or?=
 =?utf-8?B?TGQrVk5TSG02ay9DSGIyYUNpWGoxaytFT2dROUlac3RUZGJwRStSdjZXVG0z?=
 =?utf-8?B?MnFVUjVoTWxSeGxianZ6OXl4MXNYSTVWbUR0bVNQREVmNUtPUDdkNThncTdt?=
 =?utf-8?B?SzNUV3YxcW1QbURkejhDWEtEenRDUzBCcFZ1c2RVRStnUG9jZFJrMGwwRWZV?=
 =?utf-8?B?cHZQMG9XM1kvWCtDOWFlL3pmUU5FS3dlVVhFaFVDNUVjZjBCR2pEeVRDT245?=
 =?utf-8?B?SkViZEVkU0laZXI4bzZreC9ZLytORFVQb3VCNS9KSlBzVHFDVUtpUFdNelJt?=
 =?utf-8?Q?Aikcre539fLmqZ6E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5c9e11-6f9b-4a6b-c3a5-08da2a46908d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 01:12:58.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n59ueqF0wXn0Sr7uMdIoEaccbIOD1vSHBtXQk4Tr5IOvoQqc7VxuzUSgHH3Z25fd/LhAGlt7RMe0gxwgAtusug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4403
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-29_08:2022-04-28,
 2022-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204300005
X-Proofpoint-ORIG-GUID: _nnVJmNrvtVBqoiCFv1GXLIyPLQRabDA
X-Proofpoint-GUID: _nnVJmNrvtVBqoiCFv1GXLIyPLQRabDA
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eperezma@redhat.com, sgarzare@redhat.com, eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/28/2022 7:23 PM, Jason Wang wrote:
>
> 在 2022/4/27 16:30, Si-Wei Liu 写道:
>> With MQ enabled vdpa device and non-MQ supporting guest e.g.
>> booting vdpa with mq=on over OVMF of single vqp, below assert
>> failure is seen:
>>
>> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion 
>> `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
>>
>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized 
>> out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized 
>> out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, 
>> vdev=0x558f568f91f0, n=2, mask=<optimized out>) at 
>> ../hw/virtio/vhost.c:1557
>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier 
>> (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, 
>> with_irqfd=with_irqfd@entry=false)
>>     at ../hw/virtio/virtio-pci.c:974
>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers 
>> (d=0x558f568f0f60, nvqs=3, assign=true) at 
>> ../hw/virtio/virtio-pci.c:1019
>> 9  0x0000558f52bf091d in vhost_net_start 
>> (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, 
>> data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>     at ../hw/net/vhost_net.c:361
>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized 
>> out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, 
>> status=15 '\017') at ../hw/net/virtio-net.c:370
>> 12 0x0000558f52d6c4b2 in virtio_set_status 
>> (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at 
>> ../hw/virtio/virtio.c:1945
>> 13 0x0000558f52c69eff in virtio_pci_common_write 
>> (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, 
>> size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>> 14 0x0000558f52d15d6e in memory_region_write_accessor 
>> (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, 
>> shift=<optimized out>, mask=<optimized out>, attrs=...)
>>     at ../softmmu/memory.c:492
>> 15 0x0000558f52d127de in access_with_adjusted_size 
>> (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, 
>> size=size@entry=1, access_size_min=<optimized out>, 
>> access_size_max=<optimized out>, access_fn=0x558f52d15cf0 
>> <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at 
>> ../softmmu/memory.c:554
>> 16 0x0000558f52d157ef in memory_region_dispatch_write 
>> (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, 
>> op=<optimized out>, attrs=attrs@entry=...)
>>     at ../softmmu/memory.c:1504
>> 17 0x0000558f52d078e7 in flatview_write_continue 
>> (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., 
>> ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, 
>> l=<optimized out>, mr=0x558f568f19d0) at 
>> /home/opc/qemu-upstream/include/qemu/host-utils.h:165
>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, 
>> addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at 
>> ../softmmu/physmem.c:2822
>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, 
>> addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, 
>> len=<optimized out>)
>>     at ../softmmu/physmem.c:2914
>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, 
>> addr=<optimized out>, attrs=...,
>>     attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized 
>> out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) 
>> at ../accel/kvm/kvm-all.c:2903
>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn 
>> (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at 
>> ../util/qemu-thread-posix.c:556
>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>
>> The cause for the assert failure is due to that the vhost_dev index
>> for the ctrl vq was not aligned with actual one in use by the guest.
>> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
>> if guest doesn't support multiqueue, the guest vq layout would shrink
>> to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
>> This results in ctrl_vq taking a different vhost_dev group index than
>> the default. We can map vq to the correct vhost_dev group by checking
>> if MQ is supported by guest and successfully negotiated. Since the
>> MQ feature is only present along with CTRL_VQ, we make sure the index
>> 2 is only meant for the control vq while MQ is not supported by guest.
>>
>> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
>> Suggested-by: Jason Wang <jasowang@redhat.com>
>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>> ---
>>   hw/net/virtio-net.c | 22 ++++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index ffb3475..8ca0b80 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -3171,8 +3171,17 @@ static NetClientInfo net_virtio_info = {
>>   static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, 
>> int idx)
>>   {
>>       VirtIONet *n = VIRTIO_NET(vdev);
>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    NetClientState *nc;
>>       assert(n->vhost_started);
>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
>> +           error_report("virtio-net: bogus vq index ignored");
>
>
> This seems trigger-able by guest.
Yes, this is trigger-able by either buggy guest or buggy migration flow 
(could be due to remote buggy QEMU). I was not sure if it'll be too 
determined to use LOG_GUEST_ERROR, and doesn't seem it's the convention 
to log guest error in the same file. What's your preference here, switch 
to LOG_GUEST_ERROR, or simply drop the error message?

Thanks,
-Siwei

>
> Other looks good.
>
> Thanks
>
>
>> +           return false;
>> +        }
>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>> +    } else {
>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    }
>>       return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>>   }
>>   @@ -3180,8 +3189,17 @@ static void 
>> virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>>                                              bool mask)
>>   {
>>       VirtIONet *n = VIRTIO_NET(vdev);
>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    NetClientState *nc;
>>       assert(n->vhost_started);
>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
>> +           error_report("virtio-net: bogus vq index ignored");
>> +           return;
>> +        }
>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>> +    } else {
>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    }
>>       vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>>                                vdev, idx, mask);
>>   }
>



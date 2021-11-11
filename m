Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067344D4E9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:17:55 +0100 (CET)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml79W-00009F-3P
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml77e-0007k2-6c; Thu, 11 Nov 2021 05:15:58 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1ml77Y-0002Xu-NR; Thu, 11 Nov 2021 05:15:57 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9W0qJ010760; 
 Thu, 11 Nov 2021 10:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=5eqiA0OckXcW45tnuaWGbg91k3Bj89xKRQUtPZ9IjTI=;
 b=XZTPZsexLKVx83mNCVrZT9kfgV+qrMYUftxKfN1cTZJBjsmwXRGbpWNGAjeDjpISFek/
 CNj32PCJxR9MfA8tB641X5LJ4+6FGHahz0Fq1gl8kE3ING7eXSZChQZn/GzVbluxbTSk
 INM2cjWwySTV2ZMa8g0+gg8AKUTK0JFOIiT6Rx7rJGkHDDdygtlcwmDLsJ+nDSXFPCqZ
 NTMr3mTF8/BmdUmkWi/dWjQwJr3VIoQuvU2iMYOOQSqVsP/PDcGYEr/tBrFQeLd8atQW
 Wcn4eIgiPqtyyDxg7AW4duhNRacM40ao1NmV3Tdyk7kbaY3nLWOJyr/6qJkZllxYSKIS KQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c7yq7js4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:15:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ABABaNT101859;
 Thu, 11 Nov 2021 10:15:22 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
 by userp3030.oracle.com with ESMTP id 3c842dmw6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:15:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSDwQEnNtNWJmqnBIPmvsDIEjfgIdRbir4a44ivo9fUVI263MpLyJpnM5NV8V30J+hi7/rw8ZXx+T8xfXIYQv9GqqTGg0Cl1klKcnBA8Ror98/+16MupooQQdL7wp3PyoRWxUy53vP2UgArEsnaXILzt+R3iRQ3nRKRgJlif23xLWSD/b9bmAe9z1VDnI0z0lckHX0WmRGK34Ep1oIgQgrlxpHeJtQlQYXaDY3fxFckoIdR1N/MhL9VJe+JD0ljZVUwl69SHvBJPoZQrkjOyqGT/5YQbyuo8XkzQD8TjHqKMvSk42EuKqiMp47Kk8ahjM2OiDHT+NosN3QDff9jHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eqiA0OckXcW45tnuaWGbg91k3Bj89xKRQUtPZ9IjTI=;
 b=iQsup9g+Bz+5Oa1Ibw0e3+zz4qatYHdO81s3EDZ8CG3E2o36W/iRUBoIFIqs45al7ABfqtJ2434i3+OJi8EvPYz8Xv1q+CPKNH7TZF0D3FMo/k+SkPlxoY7cvAvm8u8YlGSYdnfg28V/tY8m4/WbU6OZNb5csFCH49oeGS4xFKBjIZAJKMRANEnL/QT//BHZaHmkpggYZlOeUg2BlIPQXhFoTHaWfxBInqsXGyG7zfgWEuDpghIYVnRJ81dliGVMeUGmk8u2zNxwVbYm5chQJ9eTV1JKxj1p9nw1bBcaTPJJurfygSl/iHsPzMnvjUtytgvdeao1isPSE/7y2blMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eqiA0OckXcW45tnuaWGbg91k3Bj89xKRQUtPZ9IjTI=;
 b=gWDqJEfTugrMa+UG3UFoKHcaQ+SThE7hyo4ss0CDgTgXecnSwXRgjKpVtnKrWifJEZnejfAOW56vUm63xgMwjfUZHyCqsGOq4B7Fp84O8zUfG9jnb5bkPDzSf2KnLoA9NkAenaG2vKFAFetlIoUGS6YQt17mnvk1dEpc+vOXRxA=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4757.namprd10.prod.outlook.com (2603:10b6:510:3f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Thu, 11 Nov
 2021 10:15:18 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 10:15:18 +0000
Content-Type: multipart/alternative;
 boundary="------------bZMsTuwsAJUfs71Ul1ksdqk0"
Message-ID: <2221d5d7-b65e-1157-fd9f-57defd974556@oracle.com>
Date: Thu, 11 Nov 2021 05:15:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 5/8] qmp: decode feature & status bits in virtio-status
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-6-git-send-email-jonah.palmer@oracle.com>
 <87fss4w275.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <87fss4w275.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: SN4PR0501CA0078.namprd05.prod.outlook.com
 (2603:10b6:803:22::16) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from [10.39.203.104] (209.17.40.41) by
 SN4PR0501CA0078.namprd05.prod.outlook.com (2603:10b6:803:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Thu, 11 Nov 2021 10:15:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54d94f0d-8ad3-4bb1-0165-08d9a4fc294f
X-MS-TrafficTypeDiagnostic: PH0PR10MB4757:
X-Microsoft-Antispam-PRVS: <PH0PR10MB4757D27848692132501883C3E8949@PH0PR10MB4757.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ogH386pso2P59GEjc8t3V2jSRvOyXy4lUfMFnKVlp99SAZNypsWKqYvqt4B0bHGgeOXJ8nOgHVLcpD5p4+lE3J6FPrD4uYMPgcNjYoyCuB6pjuYdgz623Pbj83BmG/vwY99I1TI2Sj1KuPBPTN/C3Tu0+YeAcp1pJf8spJFM69VpQDcCQjS1oxlzOWWcShI3lBKIqaCWHmOYEffWNibdUUiWZAOhjwlD+vR87QYmPNqO+IYq+GtuI61og/KAYe9fBMImdmC/RAMIXu0aFyQnIZf7yZPdRC6PrVmCEFEghy6KFODAD64OgfGoLHs3EPheHPbofQkBrha1j9LBNncaOrO4GDNLO9TyzsLPgVOPaD0EKkQ0CUgk+kDYrFiXE644sdvxjM0BfkYZQ05EC/SpZUpHFEmr76Fbk+KUcDR/2q8SDPM03wOupEjbRGm/z09fVARN1/T1cBG0bOan5ms8Dq+lcNoyJPTEdyEz6IhBCdsoU03CiSwWWHJRtV7JvQgsMJQXoSF36AL4/6Ep4TXuQs0nPj75IPx12E810Wyqy6swsLq1J6E8CrPNdb0uAqVjkNAnuYyDau4lheLw1OXoXr+0QFc/nfwtwH3TcuP2XDbmOfwQW8s3gCOOF2IBYGkooEh1F47SPrr+PYbZlY+StBI1QaEv9u/WLIkYaiTkz+PbaL1p3AObA5qIgPG0eDPbw0m1xW7OGno6YVX8OGGZtGp9bSPUiZ7mId9LenpjL4ipSU0fgGPDHKv4Z+M5ixAQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(44832011)(16576012)(4326008)(956004)(30864003)(2616005)(2906002)(36756003)(7416002)(8676002)(316002)(5660300002)(6916009)(8936002)(186003)(31686004)(31696002)(83380400001)(508600001)(33964004)(26005)(66556008)(38100700002)(66476007)(53546011)(66946007)(6486002)(43740500002)(45980500001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xqSVlPZ0JIM3R0NUFSVmNoWWlqaU81WGZxOFk4NUJKckgrQXZkVENhZDI5?=
 =?utf-8?B?YTl1dGdmVkNjdkJUVUI0cVB6aWJBbVEvd2ZXRVpVOGdrdEF3Zi9TbUpsbjE1?=
 =?utf-8?B?RGhSeWdOQXpwVk9zQzBMSG5IT1hEa2pCUlJ5RndyOUIxZi9VVTJ5ZE9KZjVP?=
 =?utf-8?B?VUJDY1lHdTJuWWx3eDhmSmlyeW5uekw2ZWQ0NFVkUGdFcjM3Q3o2T1VNZkRY?=
 =?utf-8?B?N1hoNjlqSDZFZU91ZkErNnZlczQzWmpDUHROVTIxL1B0RkRsZk5FdkE4ZXNP?=
 =?utf-8?B?VWhhZGZGaFplaDNNSExQV0Rldnd1MlZCeEthaDhIZnhSSFdmQ0xER0hVcFM4?=
 =?utf-8?B?SWIrN2xwUjB1V2huenppanlGNkdYNFBSc3hjZDhMTDFvbUhEUXFVRmh0b3JD?=
 =?utf-8?B?dmpaUW9yTUhEY1duT0p5cklxVmZsVnRXMk90eUFCUno1YThWd2VtS1pmc3Mx?=
 =?utf-8?B?bTdpTFZveUYzU3pwNU1qR3BwbHhXQWVLOUI0bm9GRWJDNjk3bWhlbEFkOVVk?=
 =?utf-8?B?M0h5d1hHYXYyUzJJWUFraE1mYWliNGJHODB0MFNLRUkzMUFDRFpTWUwxNmpj?=
 =?utf-8?B?bUhvZEhmTHJ6Y3JBVWNzM202ZUlNYjFGeEl5bEhOMXUvbFpWaU5UQU5jVnRm?=
 =?utf-8?B?UHhTSzkzSXpXa2Zmd29jM2FuSlh4emZSbjNNbGJSb3VCUklJZlBFNmgwK2o2?=
 =?utf-8?B?aEhkMlZyNUJkWVg3Z25iNjdDOE1HY3QzY296bi9kVjNnYkhVVENCK3M4MXBW?=
 =?utf-8?B?b3IrNHpObGVaZ0hvVjNpQmk5YittTFR5ZmxWMmR6NTZtNENvT2dZMDNRQkV3?=
 =?utf-8?B?ZzhIWWY0b3R1elBkVEtvSlI0Qi9vYUZoZFBwRHdHdkJXQ2R1QXM4eUJXUmZS?=
 =?utf-8?B?L0FQUENhbklSL2hRSUswZGZFVzB3TFhXTmowSnNySitHSERBNWV1cVV2QVFk?=
 =?utf-8?B?ZTNvY1JXYktaL2dIV3htblJZd0VwaDBMVDhkSVUvdlJQQU5xd2g3NU9DclVs?=
 =?utf-8?B?b1dBbzZZV0xheEFBdnM0WG9HWGlOQVRuMzRZbXlkeVdjKytzRTBDbmpqUjlh?=
 =?utf-8?B?cFRKNzZRMkQ1NGw3RHhpT1UyVS8zNkFJeC8waGZvaFNQdi9oM3EvOExieFh1?=
 =?utf-8?B?V0Y0OHkydTVSUlBMMUJOYy9QMDRGd0lycUZQTWtnSUxsWm82dHdRUEJ2SXR0?=
 =?utf-8?B?Qlg4azN1UEFHQ0dZdWhXaE5ucGxEekNqZUZtYytjQXljbnVJdlN4VXliVCtE?=
 =?utf-8?B?T3BmNlZYQWZYOEk5MjFGaVNsUW1QaEkvazZSK1p0anMyRnpZamwzTzRBdnFM?=
 =?utf-8?B?TEJzbVpZOVhFSSs3QW9Ddm5DNkZ2ZHBWOGJhenBxQ3dteU1lZjZMMmQ4dVhJ?=
 =?utf-8?B?WXdFaC9oMTh1QzE3dktuYmlFY3pSZEZyc0t3QmtOVE9qMHA3eVpwcHNoZ0o5?=
 =?utf-8?B?SytucnVNeU5lQ2cxM2trNS9rMFVpMDdhaGVEMFp2ZGRISVVlVWo3RE1jemcy?=
 =?utf-8?B?MStNb2tmRTlrb2R3cVBWMXZ5ZWtuZ0hrOVZTQkdkbnEyeUJ4eWFWRVJRSTRm?=
 =?utf-8?B?NE5tbWxqRzBETEhEUzcwSkVnUm5mR0xTWC9kbUVVMkx1Vy94SDlHZDlQVDRy?=
 =?utf-8?B?SDlBc2ZES0x3cVhaYmdKMDJ2RXNHRGpacGpVa2JXUStuK0Y1WHc1SThzbWI5?=
 =?utf-8?B?TDM3OWpLK2Ura0tLVnordzlGZkN0NVdwUzdxMG9ueXkyL2FhclFPY254b1ZK?=
 =?utf-8?B?ZmpnOGxFeDdLdHJNSWEvYlB2dzMrSnVkbytjWTRsYUxMMzk5S0hocmpxZldY?=
 =?utf-8?B?ODlMZjlqaUxtVkl5TUxxZ1V1QmZBKzYxRDNQdzRJeVRqcktoMHRkZGV1NHlN?=
 =?utf-8?B?SGV5VVdrMGxXNkQvNDQyUWVvUDRGN0pVZ0VlWU1WUDFMamlQdzNwc0MzcDAv?=
 =?utf-8?B?c002cHgrSTV6RkdCOGU5TmJJQWlWTHBlYmVWdHRjMVQ4UTJ3NEJrSm9NN2pQ?=
 =?utf-8?B?Tm1iME5pQTRmWG9ZL1RwZmpnT0lLRFJ4dVpQeUc3Qk9CZzZOQWIwMk5UaFhi?=
 =?utf-8?B?bFRGTk4wWlZqRERVZzEyQ0x0dFNmV20zLzFVRys1aDlKT1hUa1RYZ0JCcVRI?=
 =?utf-8?B?WkVTcmE1cGJldDFGcmpqNGRmelMrVDlVUE1PN0lXSmY5UUI1TkkwU3JHUDJt?=
 =?utf-8?Q?VKSZyd1JohULpf4ape8Yt+8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d94f0d-8ad3-4bb1-0165-08d9a4fc294f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 10:15:18.3812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WP9jw5LL7oFuhYmdJW7BYn+l+NCPprBHcoEWN8vsdE0dHpNJ/N5ffnZ+IVD5tMxj1lTd4k1NMRqpqpRoIc3kFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4757
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10164
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111110061
X-Proofpoint-GUID: bPn-eZSfqQKyZairBqP1UjgWWxrQm3Z-
X-Proofpoint-ORIG-GUID: bPn-eZSfqQKyZairBqP1UjgWWxrQm3Z-
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------bZMsTuwsAJUfs71Ul1ksdqk0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/21 08:49, Markus Armbruster wrote:
> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>
>> From: Laurent Vivier<lvivier@redhat.com>
>>
>> Display feature names instead of bitmaps for host, guest, and
>> backend for VirtIODevice.
>>
>> Display status names instead of bitmaps for VirtIODevice.
>>
>> Display feature names instead of bitmaps for backend, protocol,
>> acked, and features (hdev->features) for vhost devices.
>>
>> Decode features according to device type. Decode status
>> according to configuration status bitmap (config_status_map).
>> Decode vhost user protocol features according to vhost user
>> protocol bitmap (vhost_user_protocol_map).
>>
>> Transport features are on the first line. Undecoded bits
>> (if any) are stored in a separate field. Vhost device field
>> wont show if there's no vhost active for a given VirtIODevice.
>>
>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
> [...]
>
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> index 54212f2..6b11d52 100644
>> --- a/qapi/virtio.json
>> +++ b/qapi/virtio.json
>> @@ -67,6 +67,466 @@
>>   }
>>   
>>   ##
>> +# @VirtioType:
>> +#
>> +# An enumeration of Virtio device types (or names)
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioType',
>> +  'data': [ 'virtio-net', 'virtio-blk', 'virtio-serial', 'virtio-rng',
>> +            'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
>> +            'virtio-scsi', 'virtio-9p', 'virtio-mac-wlan',
>> +            'virtio-rproc-serial', 'virtio-caif', 'virtio-mem-balloon',
>> +            'virtio-gpu', 'virtio-clk', 'virtio-input', 'vhost-vsock',
>> +            'virtio-crypto', 'virtio-signal', 'virtio-pstore',
>> +            'virtio-iommu', 'virtio-mem', 'virtio-sound', 'vhost-user-fs',
>> +            'virtio-pmem', 'virtio-mac-hwsim', 'vhost-user-i2c',
>> +            'virtio-bluetooth' ]
>> +}
>> +
>> +##
>> +# @VirtioConfigStatus:
>> +#
>> +# An enumeration of Virtio device configuration statuses
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioConfigStatus',
>> +  'data': [ 'driver-ok', 'features-ok', 'driver', 'needs-reset',
>> +            'failed', 'acknowledge' ]
>> +}
>> +
>> +##
>> +# @VirtioDeviceStatus:
>> +#
>> +# A structure defined to list the configuration statuses of a virtio
>> +# device
>> +#
>> +# @dev-status: List of decoded configuration statuses of the virtio
>> +#              device
>> +#
>> +# @unknown-statuses: virtio device statuses bitmap that have not been decoded
>
> Why is @dev-status singular, and @unknown-statuses plural?

I'm guessing that when I wrote it I used singular here since it was one list of
statuses, but the representation here does feel off. Maybe @statuses & @unknown-statuses
would be a better choice?

>
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceStatus',
>> +  'data': { 'dev-status': [ 'VirtioConfigStatus' ],
>> +            '*unknown-statuses': 'uint8' } }
>> +
>> +##
>> +# @VhostProtocolFeature:
>> +#
>> +# An enumeration of Vhost User protocol features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VhostProtocolFeature',
>> +  'data': [ 'mq', 'log-shmfd', 'rarp', 'reply-ack', 'net-mtu',
>> +            'slave-req', 'cross-endian', 'crypto-session', 'pagefault',
>> +            'config', 'slave-send-fd', 'host-notifier',
>> +            'inflight-shmfd', 'reset-device', 'inband-notifications',
>> +            'configure-mem-slots' ]
>> +}
>> +
>> +##
>> +# @VhostDeviceProtocols:
>> +#
>> +# A structure defined to list the vhost user protocol features of a
>> +# Vhost User device
>> +#
>> +# @features: List of decoded vhost user protocol features of a vhost
>> +#            user device
>> +#
>> +# @unknown-protocols: vhost user device protocol features bitmap that
>> +#                     have not been decoded
> Why are the known protocol features called @features, and the unknown
> ones @unknown-protocols?

I agree that this is inconsistent. Maybe @protocols & @unknown-protocols
would be a better choice here as well?

>
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VhostDeviceProtocols',
>> +  'data': { 'features': [ 'VhostProtocolFeature' ],
>> +            '*unknown-protocols': 'uint64' } }
>> +
>> +##
>> +# @VirtioTransportFeature:
>> +#
>> +# An enumeration of Virtio device transport features, including virtio-ring
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioTransportFeature',
>> +  'data': [ 'notify-on-empty', 'any-layout', 'protocol-features',
>> +            'version-1', 'iommu-platform', 'ring-packed', 'order-platform',
>> +            'sr-iov', 'indirect-desc', 'event-idx' ]
>> +}
>> +
>> +##
>> +# @VirtioMemFeature:
>> +#
>> +# An enumeration of Virtio mem features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioMemFeature',
>> +  'data': [ 'acpi-pxm' ]
>> +}
>> +
>> +##
>> +# @VirtioSerialFeature:
>> +#
>> +# An enumeration of Virtio serial/console features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioSerialFeature',
>> +  'data': [ 'size', 'multiport', 'emerg-write' ]
>> +}
>> +
>> +##
>> +# @VirtioBlkFeature:
>> +#
>> +# An enumeration of Virtio block features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioBlkFeature',
>> +  'data': [ 'size-max', 'seg-max', 'geometry', 'ro', 'blk-size',
>> +            'topology', 'mq', 'discard', 'write-zeroes', 'barrier',
>> +            'scsi', 'flush', 'config-wce', 'log-all' ]
>> +}
>> +
>> +##
>> +# @VirtioGpuFeature:
>> +#
>> +# An enumeration of Virtio gpu features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioGpuFeature',
>> +  'data': [ 'virgl', 'edid', 'resource-uuid', 'resource-blob',
>> +            'log-all' ]
>> +}
>> +
>> +##
>> +# @VirtioNetFeature:
>> +#
>> +# An enumeration of Virtio net features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioNetFeature',
>> +  'data': [ 'csum', 'guest-csum', 'ctrl-guest-offloads', 'mtu', 'mac',
>> +            'guest-tso4', 'guest-tso6', 'guest-ecn', 'guest-ufo',
>> +            'host-tso4', 'host-tso6', 'host-ecn', 'host-ufo',
>> +            'mrg-rxbuf', 'status', 'ctrl-vq', 'ctrl-rx', 'ctrl-vlan',
>> +            'ctrl-rx-extra', 'guest-announce', 'mq', 'ctrl-mac-addr',
>> +            'hash-report', 'rss', 'rsc-ext', 'standby', 'speed-duplex',
>> +            'gso', 'virtio-net-hdr', 'log-all' ]
>> +}
>> +
>> +##
>> +# @VirtioScsiFeature:
>> +#
>> +# An enumeration of Virtio scsi features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioScsiFeature',
>> +  'data': [ 'inout', 'hotplug', 'change', 't10-pi', 'log-all' ]
>> +}
>> +
>> +##
>> +# @VirtioBalloonFeature:
>> +#
>> +# An enumeration of Virtio balloon features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioBalloonFeature',
>> +  'data': [ 'must-tell-host', 'stats-vq', 'deflate-on-oom',
>> +            'free-page-hint', 'page-poison', 'reporting' ]
>> +}
>> +
>> +##
>> +# @VirtioIommuFeature:
>> +#
>> +# An enumeration of Virtio iommu features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioIommuFeature',
>> +  'data': [ 'input-range', 'domain-range', 'map-unmap', 'bypass',
>> +            'probe', 'mmio' ]
>> +}
>> +
>> +##
>> +# @VirtioInputFeature:
>> +#
>> +# An enumeration of Virtio input features. Note that virtio-input
>> +# has no device-specific features except when its vhost is active,
>> +# then it may have the VHOST_F_LOG_ALL feature.
> VHOST_F_LOG_ALL is talking C.  Better, I think: "may have the @log-all
> feature.  More of the same below.

Got it. Will fix this for all occurrences!

>
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioInputFeature',
>> +  'data': [ 'log-all' ]
>> +}
>> +
>> +##
>> +# @VhostUserFsFeature:
>> +#
>> +# An enumeration of vhost user FS features. Note that vhost-user-fs
>> +# has no device-specific features other than the vhost-common
>> +# VHOST_F_LOG_ALL feature.
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VhostUserFsFeature',
>> +  'data': [ 'log-all' ]
>> +}
>> +
>> +##
>> +# @VhostVsockFeature:
>> +#
>> +# An enumeration of vhost vsock features. Note that vhost-vsock has
>> +# no device-specific features other than the vhost-common
>> +# VHOST_F_LOG_ALL feature.
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VhostVsockFeature',
>> +  'data': [ 'log-all' ]
>> +}
>> +
>> +##
>> +# @VirtioCryptoFeature:
>> +#
>> +# An enumeration of virtio crypto features. Not that virtio-crypto
>> +# has no device-specific features other than when it is a vhost
>> +# device, then it may have the VHOST_F_LOG_ALL feature.
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'enum': 'VirtioCryptoFeature',
>> +  'data': [ 'log-all' ]
>> +}
> Four identical enum types...  any particular reason against just one?

See comment at the end.

>
>> +
>> +##
>> +# @VirtioDeviceFeaturesBase:
>> +#
>> +# The common fields that apply to all Virtio devices
>> +#
>> +# @type: virtio device name
>> +# @transport: the list of transport features of the virtio device
>> +# @unknown-features: virtio device features bitmap that have not been decoded
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesBase',
>> +  'data': { 'type': 'VirtioType',
>> +            'transport': [ 'VirtioTransportFeature' ],
>> +            '*unknown-features': 'uint64' } }
> Pardon my virtio ignorance... are the @unknown-features unknown
> transport features?

Yes in this case they would be unknown transport features.

>
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsMem:
>> +#
>> +# The options that apply to Virtio mem devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsMem',
>> +  'data': { 'features': [ 'VirtioMemFeature' ] } }
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsSerial:
>> +#
>> +# The options that apply to Virtio serial devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsSerial',
>> +  'data': { 'features': [ 'VirtioSerialFeature' ] } }
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsBlk:
>> +#
>> +# The options that apply to Virtio block devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsBlk',
>> +  'data': { 'features': [ 'VirtioBlkFeature' ] } }
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsGpu:
>> +#
>> +# The options that apply to Virtio GPU devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsGpu',
>> +  'data': { 'features': [ 'VirtioGpuFeature' ] } }
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsNet:
>> +#
>> +# The options that apply to Virtio net devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsNet',
>> +  'data': { 'features': [ 'VirtioNetFeature' ] } }
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsScsi:
>> +#
>> +# The options that apply to Virtio SCSI devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsScsi',
>> +  'data': { 'features': [ 'VirtioScsiFeature' ] } }
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsBalloon:
>> +#
>> +# The options that apply to Virtio balloon devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsBalloon',
>> +  'data': { 'features': [ 'VirtioBalloonFeature' ] } }
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsIommu:
>> +#
>> +# The options that apply to Virtio IOMMU devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsIommu',
>> +  'data': { 'features': [ 'VirtioIommuFeature' ] } }
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsInput:
>> +#
>> +# The options that apply to Virtio input devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsInput',
>> +  'data': { 'features': [ 'VirtioInputFeature' ] } }
>> +
>> +##
>> +# @VhostDeviceFeaturesOptionsFs:
>> +#
>> +# The options that apply to vhost-user-fs devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VhostDeviceFeaturesOptionsFs',
>> +  'data': { 'features': [ 'VhostUserFsFeature' ] } }
>> +
>> +##
>> +# @VhostDeviceFeaturesOptionsVsock:
>> +#
>> +# The options that apply to vhost-vsock devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VhostDeviceFeaturesOptionsVsock',
>> +  'data': { 'features': [ 'VhostVsockFeature' ] } }
>> +
>> +##
>> +# @VirtioDeviceFeaturesOptionsCrypto:
>> +#
>> +# The options that apply to virtio-crypto devices
>> +#
>> +# @features: List of device features
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'struct': 'VirtioDeviceFeaturesOptionsCrypto',
>> +  'data': { 'features': [ 'VirtioCryptoFeature' ] } }
> If you replace the four identical enum types by one, you get four
> identical struct types here.  Same treatment.
>
>> +
>> +##
>> +# @VirtioDeviceFeatures:
>> +#
>> +# A union to define the list of features for a virtio device
>> +#
>> +# Since: 6.3
>> +##
>> +
>> +{ 'union': 'VirtioDeviceFeatures',
>> +  'base': 'VirtioDeviceFeaturesBase',
>> +  'discriminator': 'type',
>> +  'data': { 'virtio-serial': 'VirtioDeviceFeaturesOptionsSerial',
>> +            'virtio-blk': 'VirtioDeviceFeaturesOptionsBlk',
>> +            'virtio-gpu': 'VirtioDeviceFeaturesOptionsGpu',
>> +            'virtio-net': 'VirtioDeviceFeaturesOptionsNet',
>> +            'virtio-scsi': 'VirtioDeviceFeaturesOptionsScsi',
>> +            'virtio-balloon': 'VirtioDeviceFeaturesOptionsBalloon',
>> +            'virtio-iommu': 'VirtioDeviceFeaturesOptionsIommu',
>> +            'virtio-input': 'VirtioDeviceFeaturesOptionsInput',
>> +            'vhost-user-fs': 'VhostDeviceFeaturesOptionsFs',
>> +            'vhost-vsock': 'VhostDeviceFeaturesOptionsVsock',
>> +            'virtio-crypto': 'VirtioDeviceFeaturesOptionsCrypto',
>> +            'virtio-mem': 'VirtioDeviceFeaturesOptionsMem' } }
>> +
>> +##
>>   # @VhostStatus:
>>   #
>>   # Information about a vhost device. This information will only be
>> @@ -106,10 +566,10 @@
>>               'n-tmp-sections': 'int',
>>               'nvqs': 'uint32',
>>               'vq-index': 'int',
>> -            'features': 'uint64',
>> -            'acked-features': 'uint64',
>> -            'backend-features': 'uint64',
>> -            'protocol-features': 'uint64',
>> +            'features': 'VirtioDeviceFeatures',
>> +            'acked-features': 'VirtioDeviceFeatures',
>> +            'backend-features': 'VirtioDeviceFeatures',
>> +            'protocol-features': 'VhostDeviceProtocols',
>>               'max-queues': 'uint64',
>>               'backend-cap': 'uint64',
>>               'log-enabled': 'bool',
>> @@ -174,12 +634,12 @@
>>     'data': { 'name': 'str',
>>               'device-id': 'uint16',
>>               'vhost-started': 'bool',
>> -            'guest-features': 'uint64',
>> -            'host-features': 'uint64',
>> -            'backend-features': 'uint64',
>> +            'guest-features': 'VirtioDeviceFeatures',
>> +            'host-features': 'VirtioDeviceFeatures',
>> +            'backend-features': 'VirtioDeviceFeatures',
>>               'device-endian': 'VirtioStatusEndianness',
>>               'num-vqs': 'int',
>> -            'status': 'uint8',
>> +            'status': 'VirtioDeviceStatus',
>>               'isr': 'uint8',
>>               'queue-sel': 'uint16',
>>               'vm-running': 'bool',
>> @@ -191,7 +651,7 @@
>>               'disable-legacy-check': 'bool',
>>               'bus-name': 'str',
>>               'use-guest-notifier-mask': 'bool',
>> -            'vhost-dev': 'VhostStatus' } }
>> +            '*vhost-dev': 'VhostStatus' } }
>>   
>>   ##
>>   # @x-query-virtio-status:
>> @@ -221,28 +681,31 @@
>>   #          "name": "virtio-crypto",
>>   #          "started": true,
>>   #          "device-id": 20,
>> -#          "vhost-dev": {
>> -#               "n-tmp-sections": 0,
>> -#               "n-mem-sections": 0,
>> -#               "max-queues": 0,
>> -#               "backend-cap": 0,
>> -#               "log-size": 0,
>> -#               "backend-features": 0,
>> -#               "nvqs": 0,
>> -#               "protocol-features": 0,
>> -#               "vq-index": 0,
>> -#               "log-enabled": false,
>> -#               "acked-features": 0,
>> -#               "features": 0
>> +#          "backend-features": {
>> +#               "transport": [],
>> +#               "type": "virtio-crypto",
>> +#               "features": []
>>   #          },
>> -#          "backend-features": 0,
>>   #          "start-on-kick": false,
>>   #          "isr": 1,
>>   #          "broken": false,
>> -#          "status": 15,
>> +#          "status": {
>> +#               "dev-status": ["acknowledge", "driver", "features-ok",
>> +#                              "driver-ok"]
>> +#          },
>>   #          "num-vqs": 2,
>> -#          "guest-features": 5100273664,
>> -#          "host-features": 6325010432,
>> +#          "guest-features": {
>> +#               "transport": ["event-idx", "indirect-desc", "version-1"],
>> +#               "type": "virtio-crypto",
>> +#               "features": []
>> +#          },
>> +#          "host-features": {
>> +#               "transport": ["protocol-features", "event-idx",
>> +#                             "indirect-desc", "version-1", "any-layout",
>> +#                             "notify-on-empty"],
>> +#               "type": "virtio-crypto",
>> +#               "features": []
>> +#          },
>>   #          "use-guest-notifier-mask": true,
>>   #          "vm-running": true,
>>   #          "queue-sel": 1,
>> @@ -270,22 +733,71 @@
>>   #               "max-queues": 1,
>>   #               "backend-cap": 2,
>>   #               "log-size": 0,
>> -#               "backend-features": 0,
>> +#               "backend-features": {
>> +#                       "transport": [],
>> +#                       "type": "virtio-net",
>> +#                       "features": []
>> +#               },
>>   #               "nvqs": 2,
>> -#               "protocol-features": 0,
>> +#               "protocol-features": {
>> +#                       "features": []
>> +#               },
>>   #               "vq-index": 0,
>>   #               "log-enabled": false,
>> -#               "acked-features": 5100306432,
>> -#               "features": 13908344832
>> +#               "acked-features": {
>> +#                       "transport": ["event-idx", "indirect-desc", "version-1",
>> +#                                     "any-layout", "notify-on-empty"],
>> +#                       "type": "virtio-net",
>> +#                       "features": ["mrg-rxbuf"]
>> +#               },
>> +#               "features": {
>> +#                       "transport": ["event-idx", "indirect-desc",
>> +#                                     "iommu-platform", "version-1", "any-layout",
>> +#                                     "notify-on-empty"],
>> +#                       "type": "virtio-net",
>> +#                       "features": ["log-all", "mrg-rxbuf"]
>> +#               }
>> +#          },
>> +#          "backend-features": {
>> +#               "transport": ["protocol-features", "event-idx", "indirect-desc",
>> +#                             "version-1", "any-layout", "notify-on-empty"],
>> +#               "type": "virtio-net",
>> +#               "features": ["gso", "ctrl-mac-addr", "guest-announce", "ctrl-rx-extra",
>> +#                            "ctrl-vlan", "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
>> +#                            "host-ufo", "host-ecn", "host-tso6", "host-tso4",
>> +#                            "guest-ufo", "guest-ecn", "guest-tso6", "guest-tso4",
>> +#                            "mac", "ctrl-guest-offloads", "guest-csum", "csum"]
>>   #          },
>> -#          "backend-features": 6337593319,
>>   #          "start-on-kick": false,
>>   #          "isr": 1,
>>   #          "broken": false,
>> -#          "status": 15,
>> +#          "status": {
>> +#               "dev-status": ["acknowledge", "driver", "features-ok", "driver-ok"]
>> +#          },
>>   #          "num-vqs": 3,
>> -#          "guest-features": 5111807911,
>> -#          "host-features": 6337593319,
>> +#          "guest-features": {
>> +#               "transport": ["event-idx", "indirect-desc", "version-1"],
>> +#               "type": "virtio-net",
>> +#               "features": ["ctrl-mac-addr", "guest-announce", "ctrl-vlan",
>> +#                            "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
>> +#                            "host-ufo", "host-ecn", "host-tso6",
>> +#                            "host-tso4", "guest-ufo", "guest-ecn",
>> +#                            "guest-tso6", "guest-tso4", "mac",
>> +#                            "ctrl-guest-offloads", "guest-csum", "csum"]
>> +#          },
>> +#          "host-features": {
>> +#               "transport": ["protocol-features", "event-idx",
>> +#                             "indirect-desc", "version-1", "any-layout",
>> +#                             "notify-on-empty"],
>> +#               "type": "virtio-net",
>> +#               "features": ["gso", "ctrl-mac-addr", "guest-announce",
>> +#                            "ctrl-rx-extra", "ctrl-vlan", "ctrl-rx",
>> +#                            "ctrl-vq", "status", "mrg-rxbuf", "host-ufo",
>> +#                            "host-ecn", "host-tso6", "host-tso4",
>> +#                            "guest-ufo", "guest-ecn", "guest-tso6",
>> +#                            "guest-tso4", "mac", "ctrl-guest-offloads",
>> +#                            "guest-csum", "csum"]
>> +#          },
>>   #          "use-guest-notifier-mask": true,
>>   #          "vm-running": true,
>>   #          "queue-sel": 2,
> Sixteen enums total.
>
> If we replaced them by 'str', the schema would be simpler and the
> generated code smaller, but introspection would be less informative.  I
> didn't check how the handwritten could would be affected.
>
> It's a tradeoff.  Can you make an argument either way?

I would make the argument for keeping them as is.

One reason is that, while yes it does seem redundant, it's also a core
data structure for device-specific features for this series, in a framework
type of way. In other words, if / when a device gets a new feature, we would
add them there.

Another reason is that the naming convention is very specific, and it should
only be tied to one device type. This is because when we go to decode any
features or statuses, we need to filter by device type (for the reason above)
and compare that device's features bitmap to our known list of features
*for that device*.

So in qmp_decode_features():

features = g_new0(VirtioDeviceFeatures, 1);
features->type = qapi_enum_parse(&VirtioType_lookup, name, -1, NULL);
switch (features->type) {

case VIRTIO_TYPE_VIRTIO_SERIAL:
     features->u.virtio_serial.features =
             CONVERT_FEATURES(VirtioSerialFeatureList, serial_map, 0);
     break;
...

And sure while we could make the cases for virtio-input, vhost-user-fs,
vhost-vsock, and virtio-crypto (the devices that just have the 'log-all'
feature (and only in the vhost case)) homogeneous, e.g:

case VIRTIO_TYPE_VIRTIO_CRYPTO:
     features->u.devs_w_one_feature.features =
             CONVERT_FEATURES(DevsWOneFeatureList, logall_map, 0);
     break;
case VIRTIO_TYPE_VIRTIO_INPUT:
     features->u.devs_w_one_feature.features =
             CONVERT_FEATURES(DevsWOneFeatureList, logall_map, 0);
     break;
...

We would still need to create a unique enum / data structure for one of
those devices if / when they get their own new feature.
  

Jonah

>
--------------bZMsTuwsAJUfs71Ul1ksdqk0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/21 08:49, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87fss4w275.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

Display feature names instead of bitmaps for host, guest, and
backend for VirtIODevice.

Display status names instead of bitmaps for VirtIODevice.

Display feature names instead of bitmaps for backend, protocol,
acked, and features (hdev-&gt;features) for vhost devices.

Decode features according to device type. Decode status
according to configuration status bitmap (config_status_map).
Decode vhost user protocol features according to vhost user
protocol bitmap (vhost_user_protocol_map).

Transport features are on the first line. Undecoded bits
(if any) are stored in a separate field. Vhost device field
wont show if there's no vhost active for a given VirtIODevice.

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/qapi/virtio.json b/qapi/virtio.json
index 54212f2..6b11d52 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -67,6 +67,466 @@
 }
 
 ##
+# @VirtioType:
+#
+# An enumeration of Virtio device types (or names)
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioType',
+  'data': [ 'virtio-net', 'virtio-blk', 'virtio-serial', 'virtio-rng',
+            'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
+            'virtio-scsi', 'virtio-9p', 'virtio-mac-wlan',
+            'virtio-rproc-serial', 'virtio-caif', 'virtio-mem-balloon',
+            'virtio-gpu', 'virtio-clk', 'virtio-input', 'vhost-vsock',
+            'virtio-crypto', 'virtio-signal', 'virtio-pstore',
+            'virtio-iommu', 'virtio-mem', 'virtio-sound', 'vhost-user-fs',
+            'virtio-pmem', 'virtio-mac-hwsim', 'vhost-user-i2c',
+            'virtio-bluetooth' ]
+}
+
+##
+# @VirtioConfigStatus:
+#
+# An enumeration of Virtio device configuration statuses
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioConfigStatus',
+  'data': [ 'driver-ok', 'features-ok', 'driver', 'needs-reset',
+            'failed', 'acknowledge' ]
+}
+
+##
+# @VirtioDeviceStatus:
+#
+# A structure defined to list the configuration statuses of a virtio
+# device
+#
+# @dev-status: List of decoded configuration statuses of the virtio
+#              device
+#
+# @unknown-statuses: virtio device statuses bitmap that have not been decoded
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Why is @dev-status singular, and @unknown-statuses plural?</pre>
    </blockquote>
    <pre>I'm guessing that when I wrote it I used singular here since it was one list of
statuses, but the representation here does feel off. Maybe @statuses &amp; @unknown-statuses
would be a better choice?
</pre>
    <blockquote type="cite" cite="mid:87fss4w275.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceStatus',
+  'data': { 'dev-status': [ 'VirtioConfigStatus' ],
+            '*unknown-statuses': 'uint8' } }
+
+##
+# @VhostProtocolFeature:
+#
+# An enumeration of Vhost User protocol features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VhostProtocolFeature',
+  'data': [ 'mq', 'log-shmfd', 'rarp', 'reply-ack', 'net-mtu',
+            'slave-req', 'cross-endian', 'crypto-session', 'pagefault',
+            'config', 'slave-send-fd', 'host-notifier',
+            'inflight-shmfd', 'reset-device', 'inband-notifications',
+            'configure-mem-slots' ]
+}
+
+##
+# @VhostDeviceProtocols:
+#
+# A structure defined to list the vhost user protocol features of a
+# Vhost User device
+#
+# @features: List of decoded vhost user protocol features of a vhost
+#            user device
+#
+# @unknown-protocols: vhost user device protocol features bitmap that
+#                     have not been decoded
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why are the known protocol features called @features, and the unknown
ones @unknown-protocols?</pre>
    </blockquote>
    <pre>I agree that this is inconsistent. Maybe @protocols &amp; @unknown-protocols
would be a better choice here as well?
</pre>
    <blockquote type="cite" cite="mid:87fss4w275.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# Since: 6.3
+##
+
+{ 'struct': 'VhostDeviceProtocols',
+  'data': { 'features': [ 'VhostProtocolFeature' ],
+            '*unknown-protocols': 'uint64' } }
+
+##
+# @VirtioTransportFeature:
+#
+# An enumeration of Virtio device transport features, including virtio-ring
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioTransportFeature',
+  'data': [ 'notify-on-empty', 'any-layout', 'protocol-features',
+            'version-1', 'iommu-platform', 'ring-packed', 'order-platform',
+            'sr-iov', 'indirect-desc', 'event-idx' ]
+}
+
+##
+# @VirtioMemFeature:
+#
+# An enumeration of Virtio mem features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioMemFeature',
+  'data': [ 'acpi-pxm' ]
+}
+
+##
+# @VirtioSerialFeature:
+#
+# An enumeration of Virtio serial/console features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioSerialFeature',
+  'data': [ 'size', 'multiport', 'emerg-write' ]
+}
+
+##
+# @VirtioBlkFeature:
+#
+# An enumeration of Virtio block features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioBlkFeature',
+  'data': [ 'size-max', 'seg-max', 'geometry', 'ro', 'blk-size',
+            'topology', 'mq', 'discard', 'write-zeroes', 'barrier',
+            'scsi', 'flush', 'config-wce', 'log-all' ]
+}
+
+##
+# @VirtioGpuFeature:
+#
+# An enumeration of Virtio gpu features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioGpuFeature',
+  'data': [ 'virgl', 'edid', 'resource-uuid', 'resource-blob',
+            'log-all' ]
+}
+
+##
+# @VirtioNetFeature:
+#
+# An enumeration of Virtio net features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioNetFeature',
+  'data': [ 'csum', 'guest-csum', 'ctrl-guest-offloads', 'mtu', 'mac',
+            'guest-tso4', 'guest-tso6', 'guest-ecn', 'guest-ufo',
+            'host-tso4', 'host-tso6', 'host-ecn', 'host-ufo',
+            'mrg-rxbuf', 'status', 'ctrl-vq', 'ctrl-rx', 'ctrl-vlan',
+            'ctrl-rx-extra', 'guest-announce', 'mq', 'ctrl-mac-addr',
+            'hash-report', 'rss', 'rsc-ext', 'standby', 'speed-duplex',
+            'gso', 'virtio-net-hdr', 'log-all' ]
+}
+
+##
+# @VirtioScsiFeature:
+#
+# An enumeration of Virtio scsi features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioScsiFeature',
+  'data': [ 'inout', 'hotplug', 'change', 't10-pi', 'log-all' ]
+}
+
+##
+# @VirtioBalloonFeature:
+#
+# An enumeration of Virtio balloon features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioBalloonFeature',
+  'data': [ 'must-tell-host', 'stats-vq', 'deflate-on-oom',
+            'free-page-hint', 'page-poison', 'reporting' ]
+}
+
+##
+# @VirtioIommuFeature:
+#
+# An enumeration of Virtio iommu features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioIommuFeature',
+  'data': [ 'input-range', 'domain-range', 'map-unmap', 'bypass',
+            'probe', 'mmio' ]
+}
+
+##
+# @VirtioInputFeature:
+#
+# An enumeration of Virtio input features. Note that virtio-input
+# has no device-specific features except when its vhost is active,
+# then it may have the VHOST_F_LOG_ALL feature.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
VHOST_F_LOG_ALL is talking C.  Better, I think: &quot;may have the @log-all
feature.  More of the same below.</pre>
    </blockquote>
    <pre>Got it. Will fix this for all occurrences!
</pre>
    <blockquote type="cite" cite="mid:87fss4w275.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioInputFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VhostUserFsFeature:
+#
+# An enumeration of vhost user FS features. Note that vhost-user-fs
+# has no device-specific features other than the vhost-common
+# VHOST_F_LOG_ALL feature.
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VhostUserFsFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VhostVsockFeature:
+#
+# An enumeration of vhost vsock features. Note that vhost-vsock has
+# no device-specific features other than the vhost-common
+# VHOST_F_LOG_ALL feature.
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VhostVsockFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VirtioCryptoFeature:
+#
+# An enumeration of virtio crypto features. Not that virtio-crypto
+# has no device-specific features other than when it is a vhost
+# device, then it may have the VHOST_F_LOG_ALL feature.
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioCryptoFeature',
+  'data': [ 'log-all' ]
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Four identical enum types...  any particular reason against just one?</pre>
    </blockquote>
    <pre>See comment at the end.
</pre>
    <blockquote type="cite" cite="mid:87fss4w275.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+##
+# @VirtioDeviceFeaturesBase:
+#
+# The common fields that apply to all Virtio devices
+#
+# @type: virtio device name
+# @transport: the list of transport features of the virtio device
+# @unknown-features: virtio device features bitmap that have not been decoded
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesBase',
+  'data': { 'type': 'VirtioType',
+            'transport': [ 'VirtioTransportFeature' ],
+            '*unknown-features': 'uint64' } }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Pardon my virtio ignorance... are the @unknown-features unknown
transport features?</pre>
    </blockquote>
    <pre>Yes in this case they would be unknown transport features.
</pre>
    <blockquote type="cite" cite="mid:87fss4w275.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+##
+# @VirtioDeviceFeaturesOptionsMem:
+#
+# The options that apply to Virtio mem devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsMem',
+  'data': { 'features': [ 'VirtioMemFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsSerial:
+#
+# The options that apply to Virtio serial devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsSerial',
+  'data': { 'features': [ 'VirtioSerialFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsBlk:
+#
+# The options that apply to Virtio block devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBlk',
+  'data': { 'features': [ 'VirtioBlkFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsGpu:
+#
+# The options that apply to Virtio GPU devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsGpu',
+  'data': { 'features': [ 'VirtioGpuFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsNet:
+#
+# The options that apply to Virtio net devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsNet',
+  'data': { 'features': [ 'VirtioNetFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsScsi:
+#
+# The options that apply to Virtio SCSI devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsScsi',
+  'data': { 'features': [ 'VirtioScsiFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsBalloon:
+#
+# The options that apply to Virtio balloon devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBalloon',
+  'data': { 'features': [ 'VirtioBalloonFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsIommu:
+#
+# The options that apply to Virtio IOMMU devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsIommu',
+  'data': { 'features': [ 'VirtioIommuFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsInput:
+#
+# The options that apply to Virtio input devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsInput',
+  'data': { 'features': [ 'VirtioInputFeature' ] } }
+
+##
+# @VhostDeviceFeaturesOptionsFs:
+#
+# The options that apply to vhost-user-fs devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VhostDeviceFeaturesOptionsFs',
+  'data': { 'features': [ 'VhostUserFsFeature' ] } }
+
+##
+# @VhostDeviceFeaturesOptionsVsock:
+#
+# The options that apply to vhost-vsock devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VhostDeviceFeaturesOptionsVsock',
+  'data': { 'features': [ 'VhostVsockFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsCrypto:
+#
+# The options that apply to virtio-crypto devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsCrypto',
+  'data': { 'features': [ 'VirtioCryptoFeature' ] } }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If you replace the four identical enum types by one, you get four
identical struct types here.  Same treatment.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+##
+# @VirtioDeviceFeatures:
+#
+# A union to define the list of features for a virtio device
+#
+# Since: 6.3
+##
+
+{ 'union': 'VirtioDeviceFeatures',
+  'base': 'VirtioDeviceFeaturesBase',
+  'discriminator': 'type',
+  'data': { 'virtio-serial': 'VirtioDeviceFeaturesOptionsSerial',
+            'virtio-blk': 'VirtioDeviceFeaturesOptionsBlk',
+            'virtio-gpu': 'VirtioDeviceFeaturesOptionsGpu',
+            'virtio-net': 'VirtioDeviceFeaturesOptionsNet',
+            'virtio-scsi': 'VirtioDeviceFeaturesOptionsScsi',
+            'virtio-balloon': 'VirtioDeviceFeaturesOptionsBalloon',
+            'virtio-iommu': 'VirtioDeviceFeaturesOptionsIommu',
+            'virtio-input': 'VirtioDeviceFeaturesOptionsInput',
+            'vhost-user-fs': 'VhostDeviceFeaturesOptionsFs',
+            'vhost-vsock': 'VhostDeviceFeaturesOptionsVsock',
+            'virtio-crypto': 'VirtioDeviceFeaturesOptionsCrypto',
+            'virtio-mem': 'VirtioDeviceFeaturesOptionsMem' } }
+
+##
 # @VhostStatus:
 #
 # Information about a vhost device. This information will only be
@@ -106,10 +566,10 @@
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
@@ -174,12 +634,12 @@
   'data': { 'name': 'str',
             'device-id': 'uint16',
             'vhost-started': 'bool',
-            'guest-features': 'uint64',
-            'host-features': 'uint64',
-            'backend-features': 'uint64',
+            'guest-features': 'VirtioDeviceFeatures',
+            'host-features': 'VirtioDeviceFeatures',
+            'backend-features': 'VirtioDeviceFeatures',
             'device-endian': 'VirtioStatusEndianness',
             'num-vqs': 'int',
-            'status': 'uint8',
+            'status': 'VirtioDeviceStatus',
             'isr': 'uint8',
             'queue-sel': 'uint16',
             'vm-running': 'bool',
@@ -191,7 +651,7 @@
             'disable-legacy-check': 'bool',
             'bus-name': 'str',
             'use-guest-notifier-mask': 'bool',
-            'vhost-dev': 'VhostStatus' } }
+            '*vhost-dev': 'VhostStatus' } }
 
 ##
 # @x-query-virtio-status:
@@ -221,28 +681,31 @@
 #          &quot;name&quot;: &quot;virtio-crypto&quot;,
 #          &quot;started&quot;: true,
 #          &quot;device-id&quot;: 20,
-#          &quot;vhost-dev&quot;: {
-#               &quot;n-tmp-sections&quot;: 0,
-#               &quot;n-mem-sections&quot;: 0,
-#               &quot;max-queues&quot;: 0,
-#               &quot;backend-cap&quot;: 0,
-#               &quot;log-size&quot;: 0,
-#               &quot;backend-features&quot;: 0,
-#               &quot;nvqs&quot;: 0,
-#               &quot;protocol-features&quot;: 0,
-#               &quot;vq-index&quot;: 0,
-#               &quot;log-enabled&quot;: false,
-#               &quot;acked-features&quot;: 0,
-#               &quot;features&quot;: 0
+#          &quot;backend-features&quot;: {
+#               &quot;transport&quot;: [],
+#               &quot;type&quot;: &quot;virtio-crypto&quot;,
+#               &quot;features&quot;: []
 #          },
-#          &quot;backend-features&quot;: 0,
 #          &quot;start-on-kick&quot;: false,
 #          &quot;isr&quot;: 1,
 #          &quot;broken&quot;: false,
-#          &quot;status&quot;: 15,
+#          &quot;status&quot;: {
+#               &quot;dev-status&quot;: [&quot;acknowledge&quot;, &quot;driver&quot;, &quot;features-ok&quot;,
+#                              &quot;driver-ok&quot;]
+#          },
 #          &quot;num-vqs&quot;: 2,
-#          &quot;guest-features&quot;: 5100273664,
-#          &quot;host-features&quot;: 6325010432,
+#          &quot;guest-features&quot;: {
+#               &quot;transport&quot;: [&quot;event-idx&quot;, &quot;indirect-desc&quot;, &quot;version-1&quot;],
+#               &quot;type&quot;: &quot;virtio-crypto&quot;,
+#               &quot;features&quot;: []
+#          },
+#          &quot;host-features&quot;: {
+#               &quot;transport&quot;: [&quot;protocol-features&quot;, &quot;event-idx&quot;,
+#                             &quot;indirect-desc&quot;, &quot;version-1&quot;, &quot;any-layout&quot;,
+#                             &quot;notify-on-empty&quot;],
+#               &quot;type&quot;: &quot;virtio-crypto&quot;,
+#               &quot;features&quot;: []
+#          },
 #          &quot;use-guest-notifier-mask&quot;: true,
 #          &quot;vm-running&quot;: true,
 #          &quot;queue-sel&quot;: 1,
@@ -270,22 +733,71 @@
 #               &quot;max-queues&quot;: 1,
 #               &quot;backend-cap&quot;: 2,
 #               &quot;log-size&quot;: 0,
-#               &quot;backend-features&quot;: 0,
+#               &quot;backend-features&quot;: {
+#                       &quot;transport&quot;: [],
+#                       &quot;type&quot;: &quot;virtio-net&quot;,
+#                       &quot;features&quot;: []
+#               },
 #               &quot;nvqs&quot;: 2,
-#               &quot;protocol-features&quot;: 0,
+#               &quot;protocol-features&quot;: {
+#                       &quot;features&quot;: []
+#               },
 #               &quot;vq-index&quot;: 0,
 #               &quot;log-enabled&quot;: false,
-#               &quot;acked-features&quot;: 5100306432,
-#               &quot;features&quot;: 13908344832
+#               &quot;acked-features&quot;: {
+#                       &quot;transport&quot;: [&quot;event-idx&quot;, &quot;indirect-desc&quot;, &quot;version-1&quot;,
+#                                     &quot;any-layout&quot;, &quot;notify-on-empty&quot;],
+#                       &quot;type&quot;: &quot;virtio-net&quot;,
+#                       &quot;features&quot;: [&quot;mrg-rxbuf&quot;]
+#               },
+#               &quot;features&quot;: {
+#                       &quot;transport&quot;: [&quot;event-idx&quot;, &quot;indirect-desc&quot;,
+#                                     &quot;iommu-platform&quot;, &quot;version-1&quot;, &quot;any-layout&quot;,
+#                                     &quot;notify-on-empty&quot;],
+#                       &quot;type&quot;: &quot;virtio-net&quot;,
+#                       &quot;features&quot;: [&quot;log-all&quot;, &quot;mrg-rxbuf&quot;]
+#               }
+#          },
+#          &quot;backend-features&quot;: {
+#               &quot;transport&quot;: [&quot;protocol-features&quot;, &quot;event-idx&quot;, &quot;indirect-desc&quot;,
+#                             &quot;version-1&quot;, &quot;any-layout&quot;, &quot;notify-on-empty&quot;],
+#               &quot;type&quot;: &quot;virtio-net&quot;,
+#               &quot;features&quot;: [&quot;gso&quot;, &quot;ctrl-mac-addr&quot;, &quot;guest-announce&quot;, &quot;ctrl-rx-extra&quot;,
+#                            &quot;ctrl-vlan&quot;, &quot;ctrl-rx&quot;, &quot;ctrl-vq&quot;, &quot;status&quot;, &quot;mrg-rxbuf&quot;,
+#                            &quot;host-ufo&quot;, &quot;host-ecn&quot;, &quot;host-tso6&quot;, &quot;host-tso4&quot;,
+#                            &quot;guest-ufo&quot;, &quot;guest-ecn&quot;, &quot;guest-tso6&quot;, &quot;guest-tso4&quot;,
+#                            &quot;mac&quot;, &quot;ctrl-guest-offloads&quot;, &quot;guest-csum&quot;, &quot;csum&quot;]
 #          },
-#          &quot;backend-features&quot;: 6337593319,
 #          &quot;start-on-kick&quot;: false,
 #          &quot;isr&quot;: 1,
 #          &quot;broken&quot;: false,
-#          &quot;status&quot;: 15,
+#          &quot;status&quot;: {
+#               &quot;dev-status&quot;: [&quot;acknowledge&quot;, &quot;driver&quot;, &quot;features-ok&quot;, &quot;driver-ok&quot;]
+#          },
 #          &quot;num-vqs&quot;: 3,
-#          &quot;guest-features&quot;: 5111807911,
-#          &quot;host-features&quot;: 6337593319,
+#          &quot;guest-features&quot;: {
+#               &quot;transport&quot;: [&quot;event-idx&quot;, &quot;indirect-desc&quot;, &quot;version-1&quot;],
+#               &quot;type&quot;: &quot;virtio-net&quot;,
+#               &quot;features&quot;: [&quot;ctrl-mac-addr&quot;, &quot;guest-announce&quot;, &quot;ctrl-vlan&quot;,
+#                            &quot;ctrl-rx&quot;, &quot;ctrl-vq&quot;, &quot;status&quot;, &quot;mrg-rxbuf&quot;,
+#                            &quot;host-ufo&quot;, &quot;host-ecn&quot;, &quot;host-tso6&quot;,
+#                            &quot;host-tso4&quot;, &quot;guest-ufo&quot;, &quot;guest-ecn&quot;,
+#                            &quot;guest-tso6&quot;, &quot;guest-tso4&quot;, &quot;mac&quot;,
+#                            &quot;ctrl-guest-offloads&quot;, &quot;guest-csum&quot;, &quot;csum&quot;]
+#          },
+#          &quot;host-features&quot;: {
+#               &quot;transport&quot;: [&quot;protocol-features&quot;, &quot;event-idx&quot;,
+#                             &quot;indirect-desc&quot;, &quot;version-1&quot;, &quot;any-layout&quot;,
+#                             &quot;notify-on-empty&quot;],
+#               &quot;type&quot;: &quot;virtio-net&quot;,
+#               &quot;features&quot;: [&quot;gso&quot;, &quot;ctrl-mac-addr&quot;, &quot;guest-announce&quot;,
+#                            &quot;ctrl-rx-extra&quot;, &quot;ctrl-vlan&quot;, &quot;ctrl-rx&quot;,
+#                            &quot;ctrl-vq&quot;, &quot;status&quot;, &quot;mrg-rxbuf&quot;, &quot;host-ufo&quot;,
+#                            &quot;host-ecn&quot;, &quot;host-tso6&quot;, &quot;host-tso4&quot;,
+#                            &quot;guest-ufo&quot;, &quot;guest-ecn&quot;, &quot;guest-tso6&quot;,
+#                            &quot;guest-tso4&quot;, &quot;mac&quot;, &quot;ctrl-guest-offloads&quot;,
+#                            &quot;guest-csum&quot;, &quot;csum&quot;]
+#          },
 #          &quot;use-guest-notifier-mask&quot;: true,
 #          &quot;vm-running&quot;: true,
 #          &quot;queue-sel&quot;: 2,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sixteen enums total.

If we replaced them by 'str', the schema would be simpler and the
generated code smaller, but introspection would be less informative.  I
didn't check how the handwritten could would be affected.

It's a tradeoff.  Can you make an argument either way?</pre>
    </blockquote>
    <pre>I would make the argument for keeping them as is.

One reason is that, while yes it does seem redundant, it's also a core
data structure for device-specific features for this series, in a framework
type of way. In other words, if / when a device gets a new feature, we would
add them there. 

Another reason is that the naming convention is very specific, and it should
only be tied to one device type. This is because when we go to decode any
features or statuses, we need to filter by device type (for the reason above)
and compare that device's features bitmap to our known list of features
*for that device*. 

So in qmp_decode_features():

features = g_new0(VirtioDeviceFeatures, 1);
features-&gt;type = qapi_enum_parse(&amp;VirtioType_lookup, name, -1, NULL);
switch (features-&gt;type) {

case VIRTIO_TYPE_VIRTIO_SERIAL:
    features-&gt;u.virtio_serial.features =
            CONVERT_FEATURES(VirtioSerialFeatureList, serial_map, 0);
    break;
...

And sure while we could make the cases for virtio-input, vhost-user-fs,
vhost-vsock, and virtio-crypto (the devices that just have the 'log-all'
feature (and only in the vhost case)) homogeneous, e.g:

case VIRTIO_TYPE_VIRTIO_CRYPTO:
    features-&gt;u.devs_w_one_feature.features =
            CONVERT_FEATURES(DevsWOneFeatureList, logall_map, 0);
    break;
case VIRTIO_TYPE_VIRTIO_INPUT:
    features-&gt;u.devs_w_one_feature.features =
            CONVERT_FEATURES(DevsWOneFeatureList, logall_map, 0);
    break;
...

We would still need to create a unique enum / data structure for one of
those devices if / when they get their own new feature.
 

Jonah
</pre>
    <blockquote type="cite" cite="mid:87fss4w275.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>
--------------bZMsTuwsAJUfs71Ul1ksdqk0--


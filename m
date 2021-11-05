Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89A04460A1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 09:26:41 +0100 (CET)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miuYa-0005hL-33
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 04:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1miuWo-0004Du-Mn; Fri, 05 Nov 2021 04:24:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1miuWl-0004P0-8c; Fri, 05 Nov 2021 04:24:50 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A569Jaq015467; 
 Fri, 5 Nov 2021 08:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=wc2leDjl1myMfWw0tWFWRFo9zwUwD1u19nQk5D9Dw6E=;
 b=O2kKZ2VX4ZLmkHeCd96FWeKxcg3eKE0R+HH6IDCMSkCrfgGgtwLYwZPyuvHADfX+C/KS
 bjo13YYVnihkTSHlMZdTLaWNiWhnu3fcwl42+kBJSHLkjUWSYe4IgN2GjbYl62Baw3Yn
 ByaLoJqzScSSX9TelOgoIt1of3MUJkjSfBPrALdiAQ4pLoOKBsa5FESPZDr+ua39YaD2
 +HQbZktn6ywQQIBW+9XB2kfms4fVk/erl7EGjF+qDbsFDTuY80jNg/aFte7JCpd4zYXV
 y9yXvAo88t6Bk0qalQQRxECCrwT714GLyQHNhGJ/wGYgFCyNOKbaBAMYgcVhzyjU9PJe gg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c4t7k1b4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 08:24:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A58G2Qt080719;
 Fri, 5 Nov 2021 08:24:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by aserp3020.oracle.com with ESMTP id 3c4t5s4dsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 08:24:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPV856krEC1Dp2TXd84phNVcKBonajsSNYBhw/XLeLUNOb9bTrDwZehAnzOVG1v8uhmCpBuptgmR7isBWKxqQo+gPiHfrBFq8DmuGa9FlrY11bNTOAyMfCspewNkD38FA8VDxKG2Z9LhWy1HNtLUqQV05GFtm5HFWa445Jvr5Dh5fCON/0cQFpRgemj0yHxrj+tK/RSK7cHDMJ2lHsiLGcQ81stFBdA/LmUUcIGvzoE0dxbScPqpuo6grXuIb+89FC3KNhd5wcnlqF5vXJCugE/HU+OUEhTGKt9s9ZZGJfoyG87XxvXd1t9cCtTkyrjbns38htfain3xytQqXleP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wc2leDjl1myMfWw0tWFWRFo9zwUwD1u19nQk5D9Dw6E=;
 b=S3gVyHhxQD+jaRwV+K5EWsypdP0tNx7/qzK16TYC8YsZnZMo4sqKwQWlPxMwi+HHACOUGSnAvMrIWPFgsrtDZnpDW8yD2yGn0l7K2fXPjfp4gseTS6NWfDA8WqQY9dbLRA+84OjABP9usXVUjBEQFaGEbyKy9NVhwoPZ8AJkzeKdD4OQ4OEs+77htL1Dias9lp56WLnU5g5tmnfX2ijuL/URB0oaTS1OQGwSgUpyVgp/bXvdRcDyD0LOu7xn8nUXPxT2w4uzw5B22hJ9AjWoQigkdZM341WU2HzvXBc/psUBzUa/oEbQ056eegMojJbhG37ZDXZPTrC9nw3RO9kilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wc2leDjl1myMfWw0tWFWRFo9zwUwD1u19nQk5D9Dw6E=;
 b=hY2v6ijFNFVNvFbFS1zVkWjOi4vlVWH21Y/0JtiAE6xhNLUCBYUGmQ0aR4XGF0GjmVquxiKq+mZGF2MomMK7HBb7P5bDeUITLHlyqkiQYlO7N9YPDjos6v+lUtSngs2gSTctmE0GBZ1QDHsM67+45VFryq/PpwVfiDPVcZf6fSg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SA2PR10MB4489.namprd10.prod.outlook.com (2603:10b6:806:11a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 08:24:16 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::6092:9e8:aa36:f263]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::6092:9e8:aa36:f263%7]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 08:24:15 +0000
Content-Type: multipart/alternative;
 boundary="------------pGF8ZHNkX9q0cy6UTu1LdP6E"
Message-ID: <7385702a-bd43-6a61-0bb5-4c26432db510@oracle.com>
Date: Fri, 5 Nov 2021 04:24:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 3/8] qmp: add QMP command x-debug-query-virtio
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <1635334909-31614-4-git-send-email-jonah.palmer@oracle.com>
 <87ilx89ckv.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <87ilx89ckv.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: BL1PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::13) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from [10.39.215.155] (209.17.40.45) by
 BL1PR13CA0218.namprd13.prod.outlook.com (2603:10b6:208:2bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.7 via Frontend
 Transport; Fri, 5 Nov 2021 08:24:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb4a5111-7f01-4f77-00c0-08d9a035a7aa
X-MS-TrafficTypeDiagnostic: SA2PR10MB4489:
X-Microsoft-Antispam-PRVS: <SA2PR10MB44896A656C8DBE52A0F5FD78E88E9@SA2PR10MB4489.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RgdNmR5f6okVWYIPFQTeWkIfKf4C6pffNX9fHPuOFzNfemx3I59uOLoqGbPLJK+2AyG001QnTll+GJfkPkFToE5BTOkcEt+ZFvnh/AdQ0Bft4FgBH01fQfBZfWaMz4mAVh2LD3nXsBQMvW4QuZ7f5HKCGu8O8JgAB0YlJBI/0LUbYZUzp7L4epFhjlOQhpx4KtiBQoCW5Kjbu4y3xNH1XtGDRaes9srVouwdQKfUM2G8lgOJQe15VLcDqCIUF8g1Iqq7XFCu7NWBAlywAdfOP40j8b+hKgLcT29O+cnrpim7fiTaJ1uXmrnSx7J8MpqpY+fP6jNqn94QKIwD0RDRoPEEEG+J3rLri/pFFlwklTo2sWZfd/44n1eMKsxUkmD0QmwftNfF0eehlSjIo0y5nhX/2Sox2Js1ZaDFLsAJh/st32qOCqwhK4nJsmWwcQxZTdY9jl+xYFI8vmULXFf6LmS3D3EOix9lzfJZk2xyj7XYyuBYhrYJ2VJDJdVsEpYBqxbgWWYX8lrjDFCzFy5sKCtJ9o5hOOqyJM3VbOwAefOZiv+EXEbWU9PtZ27wGVtOSTWGfr5ys3A5Q7pP/Ar3nOfOU2B9azxNPpkRJztKD5uL5m3opb1smR/FV6yA3uNZWE0W/QoQQv3u6NxMpJkBkNGflPjdUPdH3vCdDFDuFH9jxETPG79r0/Zdh0D8fNVzDm/5MPTpOrzQnkEc5lkYmgk+6z9OkibnNI2rf327fkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33964004)(16576012)(186003)(30864003)(66476007)(36756003)(66946007)(53546011)(7416002)(86362001)(66556008)(2906002)(31696002)(316002)(6666004)(956004)(26005)(4326008)(8936002)(6486002)(508600001)(31686004)(38100700002)(8676002)(83380400001)(44832011)(2616005)(5660300002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXpUTTNOSG92blk0RUdZZGcydDZBUHVsc3B3U1ZTWm5JMUo3MkZacGhGYTdX?=
 =?utf-8?B?STFiY1hHbysycHhVaVRtVGk5c2FFaHJqZ0NSRFVJYzBabHVWUlprNHhQVXhT?=
 =?utf-8?B?dHVyNGhkeFNxZytDeVVwUHc3bWFHdkNBc253NTZ5alVwVW9XVTFHYk9yZ2M0?=
 =?utf-8?B?N2xra3VJQmZWZWdkM2lKa3J4RUhsdGpZTytwTmtCU09mcWF0T3JycGZtcHl2?=
 =?utf-8?B?YnBCM2JmSDZOQUlKV0lhN2tTTXJYbFYzR1oydXZpNG82TitsUWI3Qy9OV3Zm?=
 =?utf-8?B?RkEreE1zbWp4RVl0N1FTeVpXU1Z5Ni9OSU5ScjdiVGRxcVA3Q0t5TWxSQkYr?=
 =?utf-8?B?b0d0OUo4MnppaTE2UkJ4VlVqSXFmempyV0s1QmhSQzcrM1FSVVFpbzlnTmZE?=
 =?utf-8?B?UTMraDVkMFBJYnRqTXJXVHp5L01TRjQzTGZNWkpPRmxQQWRabUY4b2lKZEVN?=
 =?utf-8?B?MnVBMXByMVVoYWFxL1IxMnNpY0tzNWY1VDVEYzl4UVNuSVZMcnU1MkdKVjJq?=
 =?utf-8?B?NjlTSE52bWY3WWVENWJpNWl3RUJuMnFWbFNxRlk1dEpUQUFkYzUxcjFwV21l?=
 =?utf-8?B?UkJueWRMb1VuZTNKa0VXZ1VSdmxGYW1wWUVFZUptelRlUm1wTHp1dHZXVjlW?=
 =?utf-8?B?VXdwV1JmYTRKdDNBUVRTZUFEelFyN2pwWlZIc1c3WkZ5OStKVGloc3BvYjZ6?=
 =?utf-8?B?RFlTM0U4UkdxZnJmUW5rb2Zqd28wSU56SmI1Z0VrZ3g4dHdvOEdzWFhiZWRE?=
 =?utf-8?B?RXRURnArMDlTbEVRdFR2enRKdWVtQnZ0NzVLOXhSZjQ2KzVKVENBWnR6RXlj?=
 =?utf-8?B?ZkhZcEx6cTZpemszaWFIQkJKVE1kUDYzZm83QnVoK0t1M1NoYTEvemNnem1Z?=
 =?utf-8?B?QkZpRERoQXNhNFFtY0JWc0Mvd1FaMmpQdlFHWlJVNzkvODNsV1RDdmtFMFJP?=
 =?utf-8?B?ZVE3NUFPcHMvNDRWRXAwRVoxdm0wOUZDTXBNT3RBRlN1QmhZV0xQWmF5QmVQ?=
 =?utf-8?B?WDhMaG1pOUY2bStPV3NQNlZ0WHhtZ0lDU2Z0cWd3OUxIb2MyOUZITStqRTNW?=
 =?utf-8?B?dkswaExzRnhGbnYvVGxLZEUwVDMvK1hKSzZNWTRYbWx5UUF3OEUybjlueG5j?=
 =?utf-8?B?cWhuc3QvTjBNUCsxM0lYWXEzYVpSQmNrbE85YTNoQklFbm1ycHZtazFJUWE4?=
 =?utf-8?B?TktwZzJNMjdBcGJ0K2pudTFUR3hNQ1Vib0w2c2hmeWpPUlJNY0xJeERPMzV3?=
 =?utf-8?B?MytBeHF4dFVDWkRXYzROY2thY2xDT0pPNG5XRXZod1A5STUzODl2T0IvYW5E?=
 =?utf-8?B?SThyNG9CVHFXYXY3UDBqc2c5cG9MNC9GR3pLYmNRcjBxNDNNbE1rOTgrYVZh?=
 =?utf-8?B?eVd0STN0eXg0aU1BWmc5bHBENk1tR1ZIOGNpNFpDaEFydHV0eXh3djV0c2s4?=
 =?utf-8?B?TkJOck9LcVljRjRWUlRjYWRUSTZ6Ymd0Vk9ZQWlSVlhjYi9idndlWnZOTVJM?=
 =?utf-8?B?QjYxVGZGNnE2cG13aW9ydUd5RXJDV3MvRzhGcGhOL0J2ZEtTVUpoaW5CQitp?=
 =?utf-8?B?TDk0ek5lckdVdkZ6Q1RWUENUTU42SUxqdnFGVGNTbURBT0R1eUhKejVyM2NX?=
 =?utf-8?B?MnBXb2dmUGh3RzlsdngxcElZSXJ1QXNWRmRXZkwwa2Z4VXFtVjlRb0VrTyta?=
 =?utf-8?B?OFA4V2laU1h4bFlqdkZ0VGkxczEzMDVMNlJvaSsrSzlQRUs5ZUVIY256V0JR?=
 =?utf-8?B?R05RSnJGanFuQ2JxRHJLenl1K2JLRnk1NFBkcmo4eFQva3ZzK29RYzYvQWE5?=
 =?utf-8?B?cnEzSzdIcFVmeCtzNXFzcng4cGhoZEd6eVI2SzNiVU9YL1p6VjVOQmFkVDNz?=
 =?utf-8?B?UUdENm8yT0hlcTJRSTFPSXRYbWF6bEV4NHhUaWkyTys5eUFTZ0tjUk1uakFH?=
 =?utf-8?B?RVBIbWw3T2ViMU9IdE04ejhqV3NpVkRNbmhVM3FDbWNxZkVuMVNkaHFSb0ds?=
 =?utf-8?B?QTZDdFBIb3AwYVNaUkgwQkV5Nmp6SWY3S3owR1JLeVFQTUlsVi8yOGNyRUNI?=
 =?utf-8?B?cTVuRWxiTVhTVVpMY09mRm5CeUFlUlh0SDQwZWVqQXVOMjBMcWNUTWhQUGZX?=
 =?utf-8?B?M0VZRmtrbmtVcGJMMUE3bUQxcmRHMVJRT2t6QVRhNFl5MjE0UGVRK3gxV3Iw?=
 =?utf-8?Q?Jbec+I3D4wo7BOrK1fIcip0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4a5111-7f01-4f77-00c0-08d9a035a7aa
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 08:24:15.8772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN7s6BP70T/WTKbrNfv35+Oh9N7YlPI1hxR/bV0fitYs2hfz5n5z+CPh7ewQmxRlHM4Jg6xLo2nwlnbrSjXftg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4489
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10158
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050047
X-Proofpoint-ORIG-GUID: umpCtiQY2TtD344ftCzpPgS1cbpxiknG
X-Proofpoint-GUID: umpCtiQY2TtD344ftCzpPgS1cbpxiknG
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7,
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

--------------pGF8ZHNkX9q0cy6UTu1LdP6E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/21 11:15, Markus Armbruster wrote:
> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>
>> From: Laurent Vivier<lvivier@redhat.com>
>>
>> This new command lists all the instances of VirtIODevice with
>> their QOM paths and virtio type/name.
>>
>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>> ---
>>   hw/virtio/meson.build      |  2 ++
>>   hw/virtio/virtio-stub.c    | 14 ++++++++++
>>   hw/virtio/virtio.c         | 27 +++++++++++++++++++
>>   include/hw/virtio/virtio.h |  1 +
>>   qapi/meson.build           |  1 +
>>   qapi/qapi-schema.json      |  1 +
>>   qapi/virtio.json           | 67 ++++++++++++++++++++++++++++++++++++++++++++++
>>   tests/qtest/qmp-cmd-test.c |  1 +
>>   8 files changed, 114 insertions(+)
>>   create mode 100644 hw/virtio/virtio-stub.c
>>   create mode 100644 qapi/virtio.json
>>
>> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
>> index 521f7d6..d893f5f 100644
>> --- a/hw/virtio/meson.build
>> +++ b/hw/virtio/meson.build
>> @@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
>>   
>>   softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
>>   softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
>> +softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
>>   
>>   softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
>> +softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
>>   
>>   virtio_ss = ss.source_set()
>>   virtio_ss.add(files('virtio.c'))
>> diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
>> new file mode 100644
>> index 0000000..d4a88f5
>> --- /dev/null
>> +++ b/hw/virtio/virtio-stub.c
>> @@ -0,0 +1,14 @@
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qapi/qapi-commands-virtio.h"
>> +
>> +static void *qmp_virtio_unsupported(Error **errp)
>> +{
>> +    error_setg(errp, "Virtio is disabled");
>> +    return NULL;
>> +}
>> +
>> +VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
>> +{
>> +    return qmp_virtio_unsupported(errp);
>> +}
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 7050bd5..ad17be7 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -13,6 +13,8 @@
>>   
>>   #include "qemu/osdep.h"
>>   #include "qapi/error.h"
>> +#include "qapi/qapi-commands-virtio.h"
>> +#include "qapi/qapi-visit-virtio.h"
>>   #include "cpu.h"
>>   #include "trace.h"
>>   #include "qemu/error-report.h"
>> @@ -29,6 +31,9 @@
>>   #include "sysemu/runstate.h"
>>   #include "standard-headers/linux/virtio_ids.h"
>>   
>> +/* QAPI list of VirtIODevices */
>> +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
>> +
>>   /*
>>    * The alignment to use between consumer and producer parts of vring.
>>    * x86 pagesize again. This is the default, used by transports like PCI
>> @@ -3709,6 +3714,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
>>       vdev->listener.commit = virtio_memory_listener_commit;
>>       vdev->listener.name = "virtio";
>>       memory_listener_register(&vdev->listener, vdev->dma_as);
>> +    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
>>   }
>>   
>>   static void virtio_device_unrealize(DeviceState *dev)
>> @@ -3723,6 +3729,7 @@ static void virtio_device_unrealize(DeviceState *dev)
>>           vdc->unrealize(dev);
>>       }
>>   
>> +    QTAILQ_REMOVE(&virtio_list, vdev, next);
>>       g_free(vdev->bus_name);
>>       vdev->bus_name = NULL;
>>   }
>> @@ -3896,6 +3903,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
>>       vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
>>   
>>       vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
>> +
>> +    QTAILQ_INIT(&virtio_list);
>>   }
>>   
>>   bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>> @@ -3906,6 +3915,24 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>>       return virtio_bus_ioeventfd_enabled(vbus);
>>   }
>>   
>> +VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
>> +{
>> +    VirtioInfoList *list = NULL;
>> +    VirtioInfoList *node;
>> +    VirtIODevice *vdev;
>> +
>> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
>> +        DeviceState *dev = DEVICE(vdev);
>> +        node = g_new0(VirtioInfoList, 1);
>> +        node->value = g_new(VirtioInfo, 1);
>> +        node->value->path = g_strdup(dev->canonical_path);
>> +        node->value->type = g_strdup(vdev->name);
>> +        QAPI_LIST_PREPEND(list, node->value);
>> +    }
>> +
>> +    return list;
>> +}
>> +
>>   static const TypeInfo virtio_device_info = {
>>       .name = TYPE_VIRTIO_DEVICE,
>>       .parent = TYPE_DEVICE,
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index 105b98c..eceaafc 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -110,6 +110,7 @@ struct VirtIODevice
>>       bool use_guest_notifier_mask;
>>       AddressSpace *dma_as;
>>       QLIST_HEAD(, VirtQueue) *vector_queues;
>> +    QTAILQ_ENTRY(VirtIODevice) next;
>>   };
>>   
>>   struct VirtioDeviceClass {
>> diff --git a/qapi/meson.build b/qapi/meson.build
>> index c356a38..df5662e 100644
>> --- a/qapi/meson.build
>> +++ b/qapi/meson.build
>> @@ -45,6 +45,7 @@ qapi_all_modules = [
>>     'sockets',
>>     'trace',
>>     'transaction',
>> +  'virtio',
>>     'yank',
>>   ]
>>   if have_system
>> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
>> index 4912b97..1512ada 100644
>> --- a/qapi/qapi-schema.json
>> +++ b/qapi/qapi-schema.json
>> @@ -93,3 +93,4 @@
>>   { 'include': 'audio.json' }
>>   { 'include': 'acpi.json' }
>>   { 'include': 'pci.json' }
>> +{ 'include': 'virtio.json' }
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> new file mode 100644
>> index 0000000..4490c2c
>> --- /dev/null
>> +++ b/qapi/virtio.json
>> @@ -0,0 +1,67 @@
>> +# -*- Mode: Python -*-
>> +# vim: filetype=python
>> +#
>> +
>> +##
>> +# = Virtio devices
>> +##
>> +
>> +##
>> +# @VirtioInfo:
>> +#
>> +# Basic information about a given VirtIODevice including the device
>> +# canonical QOM path as well as the name of the device.
> Is the part starting with "including" worth its keep?

Probably not. Sometimes I'm just unnecessarily verbose. Plus it's pretty
obvious once you look at the fields below. Will trim this.

>
>> +#
>> +# @path: VirtIO device canonical QOM path
> I'd prefer "the device's canonical QOM path".

Ok, will do!

>
>> +#
>> +# @type: VirtIO device name
>> +#
>> +# Since: 6.2
> If this series misses 6.2, which seems likely, you'll have to adjust the
> since tags.

Yup, will keep that in mind!

>
>> +#
>> +##
>> +{ 'struct': 'VirtioInfo',
>> +    'data': {
>> +        'path': 'str',
>> +        'type': 'str'
>> +    }
>> +}
>> +
>> +##
>> +# @x-debug-query-virtio:
>> +#
>> +# Returns a list of all initalized VirtIO devices
> What's an uninitialized VirtIO device?

Oops. I think this should really be "Returns a list of all realized
VirtIO devices". All devices that are realized are added to virtio_list
and all devices that unrealized are removed from virtio_list.

I'll change this to "Returns a list of all realized VirtIO devices".

>
>> +#
>> +# Returns: list of gathered @VirtioInfo devices
>> +#
>> +# Since: 6.2
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "x-debug-query-virtio" }
>> +# <- { "return": [
>> +#        {
>> +#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
>> +#            "type": "virtio-input"
>> +#        },
>> +#        {
>> +#            "path": "/machine/peripheral/crypto0/virtio-backend",
>> +#            "type": "virtio-crypto"
>> +#        },
>> +#        {
>> +#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
>> +#            "type": "virtio-scsi"
>> +#        },
>> +#        {
>> +#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
>> +#            "type": "virtio-net"
>> +#        },
>> +#        {
>> +#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
>> +#            "type": "virtio-serial"
>> +#        }
>> +#      ]
>> +#    }
>> +#
>> +##
>> +
>> +{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
>> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
>> index 1af2f74..62c6cc4 100644
>> --- a/tests/qtest/qmp-cmd-test.c
>> +++ b/tests/qtest/qmp-cmd-test.c
>> @@ -95,6 +95,7 @@ static bool query_is_ignored(const char *cmd)
>>           "query-gic-capabilities", /* arm */
>>           /* Success depends on target-specific build configuration: */
>>           "query-pci",              /* CONFIG_PCI */
>> +        "x-debug-query-virtio",   /* CONFIG_VIRTIO */
>>           /* Success depends on launching SEV guest */
>>           "query-sev-launch-measure",
>>           /* Success depends on Host or Hypervisor SEV support */
Jonah
--------------pGF8ZHNkX9q0cy6UTu1LdP6E
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/4/21 11:15, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87ilx89ckv.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command lists all the instances of VirtIODevice with
their QOM paths and virtio type/name.

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++++
 hw/virtio/virtio.c         | 27 +++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 114 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 521f7d6..d893f5f 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000..d4a88f5
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include &quot;qemu/osdep.h&quot;
+#include &quot;qapi/error.h&quot;
+#include &quot;qapi/qapi-commands-virtio.h&quot;
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, &quot;Virtio is disabled&quot;);
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 7050bd5..ad17be7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,6 +13,8 @@
 
 #include &quot;qemu/osdep.h&quot;
 #include &quot;qapi/error.h&quot;
+#include &quot;qapi/qapi-commands-virtio.h&quot;
+#include &quot;qapi/qapi-visit-virtio.h&quot;
 #include &quot;cpu.h&quot;
 #include &quot;trace.h&quot;
 #include &quot;qemu/error-report.h&quot;
@@ -29,6 +31,9 @@
 #include &quot;sysemu/runstate.h&quot;
 #include &quot;standard-headers/linux/virtio_ids.h&quot;
 
+/* QAPI list of VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3709,6 +3714,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev-&gt;listener.commit = virtio_memory_listener_commit;
     vdev-&gt;listener.name = &quot;virtio&quot;;
     memory_listener_register(&amp;vdev-&gt;listener, vdev-&gt;dma_as);
+    QTAILQ_INSERT_TAIL(&amp;virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3723,6 +3729,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc-&gt;unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&amp;virtio_list, vdev, next);
     g_free(vdev-&gt;bus_name);
     vdev-&gt;bus_name = NULL;
 }
@@ -3896,6 +3903,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc-&gt;stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc-&gt;legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&amp;virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3906,6 +3915,24 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &amp;virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        node = g_new0(VirtioInfoList, 1);
+        node-&gt;value = g_new(VirtioInfo, 1);
+        node-&gt;value-&gt;path = g_strdup(dev-&gt;canonical_path);
+        node-&gt;value-&gt;type = g_strdup(vdev-&gt;name);
+        QAPI_LIST_PREPEND(list, node-&gt;value);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 105b98c..eceaafc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -110,6 +110,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index c356a38..df5662e 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -45,6 +45,7 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..1512ada 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..4490c2c
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,67 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Basic information about a given VirtIODevice including the device
+# canonical QOM path as well as the name of the device.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is the part starting with &quot;including&quot; worth its keep?</pre>
    </blockquote>
    <pre>Probably not. Sometimes I'm just unnecessarily verbose. Plus it's pretty
obvious once you look at the fields below. Will trim this.
</pre>
    <blockquote type="cite" cite="mid:87ilx89ckv.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# @path: VirtIO device canonical QOM path
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'd prefer &quot;the device's canonical QOM path&quot;.</pre>
    </blockquote>
    <pre>Ok, will do!
</pre>
    <blockquote type="cite" cite="mid:87ilx89ckv.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# @type: VirtIO device name
+#
+# Since: 6.2
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If this series misses 6.2, which seems likely, you'll have to adjust the
since tags.</pre>
    </blockquote>
    <pre>Yup, will keep that in mind!
</pre>
    <blockquote type="cite" cite="mid:87ilx89ckv.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+##
+{ 'struct': 'VirtioInfo',
+    'data': {
+        'path': 'str',
+        'type': 'str'
+    }
+}
+
+##
+# @x-debug-query-virtio:
+#
+# Returns a list of all initalized VirtIO devices
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What's an uninitialized VirtIO device?</pre>
    </blockquote>
    <pre>Oops. I think this should really be &quot;Returns a list of all realized
VirtIO devices&quot;. All devices that are realized are added to virtio_list
and all devices that unrealized are removed from virtio_list.

I'll change this to &quot;Returns a list of all realized VirtIO devices&quot;.
</pre>
    <blockquote type="cite" cite="mid:87ilx89ckv.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#
+# Returns: list of gathered @VirtioInfo devices
+#
+# Since: 6.2
+#
+# Example:
+#
+# -&gt; { &quot;execute&quot;: &quot;x-debug-query-virtio&quot; }
+# &lt;- { &quot;return&quot;: [
+#        {
+#            &quot;path&quot;: &quot;/machine/peripheral-anon/device[4]/virtio-backend&quot;,
+#            &quot;type&quot;: &quot;virtio-input&quot;
+#        },
+#        {
+#            &quot;path&quot;: &quot;/machine/peripheral/crypto0/virtio-backend&quot;,
+#            &quot;type&quot;: &quot;virtio-crypto&quot;
+#        },
+#        {
+#            &quot;path&quot;: &quot;/machine/peripheral-anon/device[2]/virtio-backend&quot;,
+#            &quot;type&quot;: &quot;virtio-scsi&quot;
+#        },
+#        {
+#            &quot;path&quot;: &quot;/machine/peripheral-anon/device[1]/virtio-backend&quot;,
+#            &quot;type&quot;: &quot;virtio-net&quot;
+#        },
+#        {
+#            &quot;path&quot;: &quot;/machine/peripheral-anon/device[0]/virtio-backend&quot;,
+#            &quot;type&quot;: &quot;virtio-serial&quot;
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 1af2f74..62c6cc4 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -95,6 +95,7 @@ static bool query_is_ignored(const char *cmd)
         &quot;query-gic-capabilities&quot;, /* arm */
         /* Success depends on target-specific build configuration: */
         &quot;query-pci&quot;,              /* CONFIG_PCI */
+        &quot;x-debug-query-virtio&quot;,   /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         &quot;query-sev-launch-measure&quot;,
         /* Success depends on Host or Hypervisor SEV support */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    Jonah<br>
  </body>
</html>
--------------pGF8ZHNkX9q0cy6UTu1LdP6E--


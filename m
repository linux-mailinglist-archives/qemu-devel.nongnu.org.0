Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420F84460D2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 09:44:16 +0100 (CET)
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miupb-0007J4-DT
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 04:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1miumd-0006Tj-FA; Fri, 05 Nov 2021 04:41:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1miumY-0003to-Nj; Fri, 05 Nov 2021 04:41:11 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A56Gtf1012957; 
 Fri, 5 Nov 2021 08:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=W5Vf+2qkgDeZxdHHeU5rlUhvZX9ACNNtz+jFIH+qgnE=;
 b=ac2QH0EE8IEGyODlnEUr+1o9b8zEQETFYL4e9eqjrjZWhDRFcF22SWdjzqlQjr7BEQww
 vNY7Y9xdp/ayDVa+TMJH34Hhd4GxJUSfEDjRFTF8Xy7I5py4QNTN2xgCJMhR4zwSQl7z
 KbEvssVeXrCb3K+7fGdCzmvfSn1uOzykZ4KvxKbu9xX2m/ykAV0qRYPqP5+BFH1rjoy2
 VgzHlQfZhvh45r0gBCkAy5MAjvI+Sxf8lTzL715+1S9NkfPnZHY/XFvuia7qdlegdqEG
 aBudQ4mZHYhcs6XAQGNzSLTR/HFHk1boOj29ga9JwvMdEX5XCYZMoHbPPenRw+PhS0c9 ZA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c4t7f1ch0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 08:40:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A58V9oY119307;
 Fri, 5 Nov 2021 08:40:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3030.oracle.com with ESMTP id 3c4t5cpn8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 08:40:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/5Wupf7BJF1yHH8ESN53eiA/qOaU2dxYkKHqfNc6GyHibogEVZZncO7Pv+BD3ftZec7dgSHrf7vT/S9SX63k9H/7gpdq/TP2mCEc9t+CnSlGgCzYj/BElwthpqvyKeeZSCu2rDIXmooJcmo0kjj1kwc+5yA13ajfQWL3M5KLWFo5I1dD3NDCYSrZet+Iq3tKTSXKbu8tVoWIxhNekzjT2isxh+sQeoDzpssydWBSPk8qPW4uqlyMLe2SpaJkNef6+FNkidzaPZhO/GSry+EmeMAAPr/PT+jU3yKk5aosxQs+bFl8eDR+ZwdPCeUjCETJcD1HrD6bR+t7DjrL8MiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5Vf+2qkgDeZxdHHeU5rlUhvZX9ACNNtz+jFIH+qgnE=;
 b=hU8VE0zAItFH1dcocH7UNUlRLUF27VdCPHtXfzYeRL+QoUhnIKDgt3igNKX3jikdccL7Z2uP7K+GhgqTDHwHIHaBfhZq18jX30JEtlDOCh0xMCO5F+c4RlX+aEFkzpIvOlK80j4TcT7Djnw2WUTnuFRVJWqixi0qqvJLSrKLI7KPzhSzW+pJUNCCSLJCmGP+NyeEq1MKMPRbNR1MG2vHpWAe0Zuf0yQjlpY10tSeKm4sWjvwwNlW60i9/UCzHTYGjGOGCU80RwMNUOUJEo86w963YTRFJVW/fzGvxoH0P7K15yAwSVwqhlvmTIruUFOi9gYBdfW2FKgQlhvVLgaJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5Vf+2qkgDeZxdHHeU5rlUhvZX9ACNNtz+jFIH+qgnE=;
 b=BIWZfjdy6d5mgT88e7gv163IcJxcImmerN6doGNxeCKtjduLei0oGe9SUuA5f3GEvi3RoXcDhZ2dWl2zpTa7nYwkOQdDFHAE7ivyDbtqOIVHR8SH7FbOuEpnpOJ/4HUKsahgOKkZZ8HpE+1MLdGQCv5VKxksg9+pRkRcBg0/FN4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SN6PR10MB2717.namprd10.prod.outlook.com (2603:10b6:805:46::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 08:40:44 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::6092:9e8:aa36:f263]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::6092:9e8:aa36:f263%7]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 08:40:44 +0000
Content-Type: multipart/alternative;
 boundary="------------VQ8phqmnW0smMBeU62BWkYI4"
Message-ID: <182f9d0c-20f6-f82b-464e-553fc6e2042f@oracle.com>
Date: Fri, 5 Nov 2021 04:40:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 8/8] hmp: add virtio commands
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <1635334909-31614-9-git-send-email-jonah.palmer@oracle.com>
 <87fssb5amt.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <87fssb5amt.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: SN6PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:805:f2::16) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from [10.39.215.155] (209.17.40.45) by
 SN6PR04CA0075.namprd04.prod.outlook.com (2603:10b6:805:f2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 08:40:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fabd1264-5983-46af-1baa-08d9a037f50f
X-MS-TrafficTypeDiagnostic: SN6PR10MB2717:
X-Microsoft-Antispam-PRVS: <SN6PR10MB2717E52F67F9F80385DFCC13E88E9@SN6PR10MB2717.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Zn0IiRWvDXGPf8bao3/tyca6wED9OWFEhGqXNVxJOgRWIia71WuLXYgbwBAUKwuYsnJgl614OLiR5Nu7MY5j6uJHo+ne8WjHr4qbgROYFoOHHHm05vEGt22MXVvscWeg2e4TcQ+XJJtfJCTj2xxzr52kufAtplrz+aH1arNdICw9BjfMBvjsD7M2OhgU0Gk4lxJc+7IytIk/uOUE6Hj9Dya1sz0L+gHGgosdwyGDQCZ6jQNUS0v6Fy1wbTX4yl6MkO0ZtsQgVFZIex8tNnXfBdCs4Ogbm2yPzsIEqa9Z/W9zwVebSec4pyX4X0uYiYCalelhk7ysvtpC8PCDPtn5T2Lo0qcqyQ4+6EOlGXa9SwNoAKgVoVPRpaMGHUXF2B0WOGue1iKUJwSAvWJI+2YHwOj48HZA0FVyD5AvC0Xmv8AS7wd2hfjmpeKpaXPa9JIFJlwfyo582IdEcQbNueiTAB9rOimGFuvpImIvDYPdnB4C/MIvPrXLMlS3IlUfLv1ZsIo3Eui5TnYRCfzI+uj0rotiLFclz9BQBchBKIpc1oi7V1WqulRZPB7oKmspH03CGDM7c/YN+Q3NHoK2WEDe5sY6YMJsGy9aPzwAJEaVxXcXuEBacRlCFSNyCKCCx2JzLW21aZqhzSqXw3O1WnnESaqI4UAFHFd4Pq5NYuRgUNtlI2bdohp4UBXpCj3Jrq8FpZPnKt4k6oE9TXmPe7AeGVrvjAX8FPlDXjnh4+hsg014GQe6e9L87mUS2dPm1Q6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33964004)(38100700002)(66476007)(956004)(83380400001)(26005)(31686004)(86362001)(4326008)(66556008)(31696002)(66946007)(44832011)(8676002)(186003)(8936002)(6916009)(36756003)(7416002)(2616005)(6486002)(508600001)(53546011)(316002)(16576012)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDFjTlRQd2Y3YWVJa09yaHl2a2dFdzZqb2dGUXh2b21vbGFCZUJUZDBDdGdK?=
 =?utf-8?B?bVpOWXE3b1VVcXJab2lzaVE0eHJHY2VweGwzTTdJNFVlTDFrdVdtWGdKVCtp?=
 =?utf-8?B?NTd2V2lvZWtHT0pVN0gvR1d3SmlHR0FPZ1JWL3VGM0ZMbTg4WThlbVRhOW9K?=
 =?utf-8?B?Nmdwclgra3NMZENJblhhMXRVNzMzTGhpWWRRaGhTcXMycHNFSHQ0RkFEZDdL?=
 =?utf-8?B?UUM3OUYrOFZSZzZVbEYzMjg3WlM4TWpITnp6Vm9MamZRMWY2NTlydDVYUlpz?=
 =?utf-8?B?RnQrN3dzOU81U25PeWhWYW8zZEIxTmljRjlaZCtaTFkrL0RiRlMrQXpoZjUr?=
 =?utf-8?B?T0JneEZwektUSUVXZ1dsbGJpckYwT3Y1NVdkcE9xb1FMOFc5b29NK05DL2l1?=
 =?utf-8?B?TExaWG94aVZwTU9XTG5zS2hQbVFCUnJRcHhsditMS1M2bmNkcHA1MXVsYUlj?=
 =?utf-8?B?VFppd3l1RVhXUE5YUzM3MTBKSThvbGdVZkY5S2VoVUx6WnI5bHF0Yk0xU2Na?=
 =?utf-8?B?TXV5S25JTzNONVhIaXYvVlBiM1QwR2paZkhXMGlBYWROVCs3WTZIcitnWGd0?=
 =?utf-8?B?SWpjL3JtTTdCN1BvUGxSYnpmbzhRdFZCb0NJZzFlZ3BmaE5Va25wZHFQeVhm?=
 =?utf-8?B?RDZGNjc0OXZhMVdoRTk1ZXNVNHhXQ2NkNlgySzF5K2lpK2hzM3NXc2x2YkxG?=
 =?utf-8?B?Zks0UUdQWWJsNFYybjU0YkZxS1RFVVpHR0lFNkpMY2RoR2hpbEhIZWJWa0JI?=
 =?utf-8?B?UkJsZncwM1FCTzVWdFFiaTNmSkJ2eFIwQ1Z0YUVqMWt0dGUrQTJ3VnBnOExM?=
 =?utf-8?B?Nm9iSllxSUlTZkhZN2tEN3E0QVF1Z2JFajF4bmYrU3dLb1MyeFhDNjErVVRW?=
 =?utf-8?B?Vnd1c1BGdFg1ZjhLczlwOGlEK3c2Q0NCVFpoVXZlQWFHV0c0RUpPc1gzR3lN?=
 =?utf-8?B?NTVvK1czSVBNN0ZZeVhpSFp0ckFlaTFDdjVla2V3dzc1cmhpV3NHNmNjenht?=
 =?utf-8?B?MVNRN1g5blpVS3VhT1N5ckZTMFpQQjc3bVhZQTQ4bEdJZmJnVGE0UmdKNlE4?=
 =?utf-8?B?dWE2aUltN3FkS3hOOTlpRU1oUnp3RnZpWjVRdTB0S0J5alBIZWgzVVV1YlhO?=
 =?utf-8?B?Z2F3RWtCMmw1dEVOQk92VGxZeTB4V3RZSmIrVXhYaHh5aUtyRWFOY0w5VGtK?=
 =?utf-8?B?VVg0UkNxT3Q4aFRUZlUxWnJSK1VzWGg1L2dlRGpaTDc5N0lTUkFKbmxlTlda?=
 =?utf-8?B?YTJMbzd2cUxqRjB2TGttZ2NtRGo3aVorR2E2dnNtOWZOV09nQ29QRXdKUzNM?=
 =?utf-8?B?cndXdnByT0UwMDJleVFBeGhaai9Qc2QvMXJ2OEE1U0FBSDRQdTlGS3labnVD?=
 =?utf-8?B?enZLRjVlRjdtUjFmcGZPZ1M4YWpLSXVEVzErZmMzaTV6T2QyblYzM2VMOU5q?=
 =?utf-8?B?b25vUkxZMzl4STE3ck9KeU1ZOE9FUjN0MTBwVnVYWnlqeFVobDg3R2s2azUv?=
 =?utf-8?B?Z29Ydit3a0JCTXVjT2haZW12UXg4cVNQZm0xZkZlbnlEZWZ5UXRFUDM3Rmdy?=
 =?utf-8?B?QytNQlIvRE9nV3NodFNRQUN4M1VGQ1dzdUtBYVp1NHAxbkh5d1lVNXl6T2lN?=
 =?utf-8?B?UzZvTVZPbU13NCtMSEpUbE9GL28wWm9CNGVDTWYwd0t1SlhWL1JPZXhhRnRE?=
 =?utf-8?B?QkVXWmVDbmZrU0hrdUdNL0JpVEpwQkk4bExEaWtVOCttYjZ6ZWxBQkpVSnZl?=
 =?utf-8?B?QnMvb3pEd0FSS3lFZHJqWW5KRkpaR2dGOVpOVVdIWmgxUjJLeENMNEhSZHpk?=
 =?utf-8?B?bUtBZ2dKU1BicU0vUlplSVZCQnpWR1VIcHpjU3drRmJRWGM1UlQrUVFKdU9S?=
 =?utf-8?B?STNjOTZleXovaW9HaXdMSkMxTEdMM1l3b1BJc0FCUlF5L1ZxZHRJRkZpeUtJ?=
 =?utf-8?B?RC92dmRxRkN1MG5Zdkk5NGdFU3cwNjZLZS9WbXlpekY1aThTc08vVkdmMy9x?=
 =?utf-8?B?eHNsa0RkVnlOeWhneHozZnU5eG1OT2NPdGpzQnNVZHpwZXN6VHVISHJZRDVh?=
 =?utf-8?B?VW82TlU3a254ZVozQVE3SUJCL3V1cGxiQ2JiWnBHMFBZOEpaQ1lpS1h2RW9r?=
 =?utf-8?B?V05jWGlhWlk4OTN1MFBGaFpyU0hNS3hqN0lFQ1pTVjJGUzJZTVl1Rmp3WXBy?=
 =?utf-8?Q?neHsP98/io1GocF6NI9Yepo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fabd1264-5983-46af-1baa-08d9a037f50f
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 08:40:44.6292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJBHEmrNCKGb5WcX+pZZ8BKZht5hJEVmDI4x+avJcHxVuy8EWUh9vpmYjjqUIqY+ArPZujh1DN0H+IfzFTPSLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2717
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10158
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050049
X-Proofpoint-ORIG-GUID: phKOOBA3wGgCnZfkCMVBfVIMuncEjxte
X-Proofpoint-GUID: phKOOBA3wGgCnZfkCMVBfVIMuncEjxte
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

--------------VQ8phqmnW0smMBeU62BWkYI4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/5/21 03:23, Markus Armbruster wrote:
> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>
>> From: Laurent Vivier<lvivier@redhat.com>
>>
>> This patch implements the HMP versions of the virtio QMP commands.
>>
>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>> ---
>>   docs/system/monitor.rst |   2 +
>>   hmp-commands-virtio.hx  | 250 ++++++++++++++++++++++++++++++++++
>>   hmp-commands.hx         |  10 ++
>>   hw/virtio/virtio.c      | 355 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   include/monitor/hmp.h   |   5 +
>>   meson.build             |   1 +
>>   monitor/misc.c          |  17 +++
>>   7 files changed, 640 insertions(+)
>>   create mode 100644 hmp-commands-virtio.hx
>>
>> diff --git a/docs/system/monitor.rst b/docs/system/monitor.rst
>> index ff5c434..10418fc 100644
>> --- a/docs/system/monitor.rst
>> +++ b/docs/system/monitor.rst
>> @@ -21,6 +21,8 @@ The following commands are available:
>>   
>>   .. hxtool-doc:: hmp-commands.hx
>>   
>> +.. hxtool-doc:: hmp-commands-virtio.hx
>> +
>>   .. hxtool-doc:: hmp-commands-info.hx
>>   
>>   Integer expressions
>> diff --git a/hmp-commands-virtio.hx b/hmp-commands-virtio.hx
>> new file mode 100644
>> index 0000000..36aab94
>> --- /dev/null
>> +++ b/hmp-commands-virtio.hx
>> @@ -0,0 +1,250 @@
>> +HXCOMM Use DEFHEADING() to define headings in both help text and rST.
>> +HXCOMM Text between SRST and ERST is copied to the rST version and
>> +HXCOMM discarded from C version.
>> +HXCOMM
>> +HXCOMM DEF(command, args, callback, arg_string, help) is used to construct
>> +HXCOMM monitor info commands.
>> +HXCOMM
>> +HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
>> +HXCOMM
>> +HXCOMM In this file, generally SRST fragments should have two extra
>> +HXCOMM spaces of indent, so that the documentation list item for "virtio cmd"
>> +HXCOMM appears inside the documentation list item for the top level
>> +HXCOMM "virtio" documentation entry. The exception is the first SRST
>> +HXCOMM fragment that defines that top level entry.
>> +
>> +SRST
>> +  ``virtio`` *subcommand*
>> +  Show various information about virtio
>> +
>> +  Example:
>> +
>> +  List all sub-commands::
>> +
>> +  (qemu) virtio
>> +  virtio query  -- List all available virtio devices
> I get:
>
>      qemu/docs/../hmp-commands-virtio.hx:25:Inconsistent literal block quoting.
>
>> +  virtio status path -- Display status of a given virtio device
>> +  virtio queue-status path queue -- Display status of a given virtio queue
>> +  virtio vhost-queue-status path queue -- Display status of a given vhost queue
>> +  virtio queue-element path queue [index] -- Display element of a given virtio queue
>> +
>> +ERST
> [...]
>
>> diff --git a/monitor/misc.c b/monitor/misc.c
>> index ffe7966..5e4cd88 100644
>> --- a/monitor/misc.c
>> +++ b/monitor/misc.c
>> @@ -23,6 +23,7 @@
>>    */
>>   
>>   #include "qemu/osdep.h"
>> +#include CONFIG_DEVICES
>>   #include "monitor-internal.h"
>>   #include "monitor/qdev.h"
>>   #include "hw/usb.h"
>> @@ -219,6 +220,15 @@ static void hmp_info_help(Monitor *mon, const QDict *qdict)
>>       help_cmd(mon, "info");
>>   }
>>   
>> +static void hmp_virtio_help(Monitor *mon, const QDict *qdict)
>> +{
>> +#if defined(CONFIG_VIRTIO)
>> +    help_cmd(mon, "virtio");
> Probably not your patch's fault: extra space before '--' in the line
>
>      virtio query  -- List all available virtio devices

Huh interesting... I'll get this patched up!

>
>> +#else
>> +    monitor_printf(mon, "Virtio is disabled\n");
>> +#endif
>> +}
>> +
>>   static void monitor_init_qmp_commands(void)
>>   {
>>       /*
>> @@ -1433,6 +1443,13 @@ static HMPCommand hmp_info_cmds[] = {
>>       { NULL, NULL, },
>>   };
>>   
>> +static HMPCommand hmp_virtio_cmds[] = {
>> +#if defined(CONFIG_VIRTIO)
>> +#include "hmp-commands-virtio.h"
>> +#endif
>> +    { NULL, NULL, },
>> +};
>> +
>>   /* hmp_cmds and hmp_info_cmds would be sorted at runtime */
>>   HMPCommand hmp_cmds[] = {
>>   #include "hmp-commands.h"
Jonah
--------------VQ8phqmnW0smMBeU62BWkYI4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/5/21 03:23, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87fssb5amt.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This patch implements the HMP versions of the virtio QMP commands.

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
---
 docs/system/monitor.rst |   2 +
 hmp-commands-virtio.hx  | 250 ++++++++++++++++++++++++++++++++++
 hmp-commands.hx         |  10 ++
 hw/virtio/virtio.c      | 355 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h   |   5 +
 meson.build             |   1 +
 monitor/misc.c          |  17 +++
 7 files changed, 640 insertions(+)
 create mode 100644 hmp-commands-virtio.hx

diff --git a/docs/system/monitor.rst b/docs/system/monitor.rst
index ff5c434..10418fc 100644
--- a/docs/system/monitor.rst
+++ b/docs/system/monitor.rst
@@ -21,6 +21,8 @@ The following commands are available:
 
 .. hxtool-doc:: hmp-commands.hx
 
+.. hxtool-doc:: hmp-commands-virtio.hx
+
 .. hxtool-doc:: hmp-commands-info.hx
 
 Integer expressions
diff --git a/hmp-commands-virtio.hx b/hmp-commands-virtio.hx
new file mode 100644
index 0000000..36aab94
--- /dev/null
+++ b/hmp-commands-virtio.hx
@@ -0,0 +1,250 @@
+HXCOMM Use DEFHEADING() to define headings in both help text and rST.
+HXCOMM Text between SRST and ERST is copied to the rST version and
+HXCOMM discarded from C version.
+HXCOMM
+HXCOMM DEF(command, args, callback, arg_string, help) is used to construct
+HXCOMM monitor info commands.
+HXCOMM
+HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
+HXCOMM
+HXCOMM In this file, generally SRST fragments should have two extra
+HXCOMM spaces of indent, so that the documentation list item for &quot;virtio cmd&quot;
+HXCOMM appears inside the documentation list item for the top level
+HXCOMM &quot;virtio&quot; documentation entry. The exception is the first SRST
+HXCOMM fragment that defines that top level entry.
+
+SRST
+  ``virtio`` *subcommand*
+  Show various information about virtio
+
+  Example:
+
+  List all sub-commands::
+
+  (qemu) virtio
+  virtio query  -- List all available virtio devices
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I get:

    qemu/docs/../hmp-commands-virtio.hx:25:Inconsistent literal block quoting.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+  virtio status path -- Display status of a given virtio device
+  virtio queue-status path queue -- Display status of a given virtio queue
+  virtio vhost-queue-status path queue -- Display status of a given vhost queue
+  virtio queue-element path queue [index] -- Display element of a given virtio queue
+
+ERST
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966..5e4cd88 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -23,6 +23,7 @@
  */
 
 #include &quot;qemu/osdep.h&quot;
+#include CONFIG_DEVICES
 #include &quot;monitor-internal.h&quot;
 #include &quot;monitor/qdev.h&quot;
 #include &quot;hw/usb.h&quot;
@@ -219,6 +220,15 @@ static void hmp_info_help(Monitor *mon, const QDict *qdict)
     help_cmd(mon, &quot;info&quot;);
 }
 
+static void hmp_virtio_help(Monitor *mon, const QDict *qdict)
+{
+#if defined(CONFIG_VIRTIO)
+    help_cmd(mon, &quot;virtio&quot;);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Probably not your patch's fault: extra space before '--' in the line

    virtio query  -- List all available virtio devices</pre>
    </blockquote>
    <pre>Huh interesting... I'll get this patched up!
</pre>
    <blockquote type="cite" cite="mid:87fssb5amt.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#else
+    monitor_printf(mon, &quot;Virtio is disabled\n&quot;);
+#endif
+}
+
 static void monitor_init_qmp_commands(void)
 {
     /*
@@ -1433,6 +1443,13 @@ static HMPCommand hmp_info_cmds[] = {
     { NULL, NULL, },
 };
 
+static HMPCommand hmp_virtio_cmds[] = {
+#if defined(CONFIG_VIRTIO)
+#include &quot;hmp-commands-virtio.h&quot;
+#endif
+    { NULL, NULL, },
+};
+
 /* hmp_cmds and hmp_info_cmds would be sorted at runtime */
 HMPCommand hmp_cmds[] = {
 #include &quot;hmp-commands.h&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    Jonah<br>
  </body>
</html>
--------------VQ8phqmnW0smMBeU62BWkYI4--


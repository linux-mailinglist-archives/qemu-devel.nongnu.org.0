Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B846A0D8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 17:12:22 +0100 (CET)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muGbE-0006c1-F7
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 11:12:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muGZC-0004Mf-C8; Mon, 06 Dec 2021 11:10:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muGZ9-0001pn-IT; Mon, 06 Dec 2021 11:10:13 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Fxm0f029620; 
 Mon, 6 Dec 2021 16:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Zb6cKZJREw7dzeK3luJURLHmTxm7Fdo5cJiC6kDoY2E=;
 b=eVvULl9qhSXoUEpUtGKiVQDb54/1S/xTJS8UkPi+7FXNG33foHLQXg4aTui1y73/4FGg
 5MM/bTO9S8dPgGOR/XjiGwpRx957JPwscSx4yMMFF4ZLWCRMo21s6r31xafXZ9qUisfy
 B+rFYSsAS1X6xS4wsNjiGax+o34sAEyZuyzcDEshhoASr1GRAD6sDQ6pWpKSeu4r0H9x
 eG5RwfDE69q/BLWi0zRyznmjbtPxY24mFtYGkZ0R28KglLNv1At9Xy8L8CBvbt0rXIXu
 DYHQ2e4dVCmaTHN+FizgxqXi/JbunrjX2YoJsEUgqjcD+9dnjP/tgynZhl9SfffZe8Os vQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csc72ap69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 16:09:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6G22qo173731;
 Mon, 6 Dec 2021 16:09:52 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2045.outbound.protection.outlook.com [104.47.74.45])
 by aserp3020.oracle.com with ESMTP id 3cr053mmsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 16:09:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrVJsh7yq9fv/s+YP4yqLuDx5FlKiRzj0Nxaib0Df6JLXsJxGschXm0ZazxPwxIxElkPf1TcbYK6cUTdaQShbFI4R0DdnsaribWq10W70CCFlArlesPAGzsc8Wg4oGrIkcfQWFAj8C6+z8XkEHmlJJCiw2HpnyBjbJuJ8ZkAEO41b5kH5/PqQfdd1+IPJ+8pdVwWraBElUUP1//bZ+COO3zZBdVA1Sy5l/+Sei2r7ARoODl/uajEoBcYp4N+mcm77s/cEMAO2Ug7TR69MAQbcyhacnQnbATtajOwftdDI848upWdmaPX9BDdrUFtJcvgVLkiv8sLGV6AMde8uRC6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb6cKZJREw7dzeK3luJURLHmTxm7Fdo5cJiC6kDoY2E=;
 b=VhyOl9DIMcNJoUIAFBF+j87SfoAGrZaok+4mFN1aATgGMBsLc/9jyzGZD+piDH1y7uajGwTSOM3NrbBaUHKWjpYGGmPY1sMJQWGo2jFvZ4QOZrqOmQDJpsz39+kNF4lkmg0yt77sI0kgVK8gepNqjLWjd1R7/qDzIN0s6TNuSz7SCJoydP/aNYYsLHn5jJF0bhmWr1eZgwCtLolG0BE5+JAz/E7YwpdWhZ05oImq1lU0Jo2k9yzL+I3IZLzQNzXh5SJtdM6GnCvtD88KnWW5uT38K3lSMkqNXmzxYoKKOz3I+47AKuZwyxyvItF2OyP96sLZXazcVV/OE5ArodWnTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb6cKZJREw7dzeK3luJURLHmTxm7Fdo5cJiC6kDoY2E=;
 b=Sw5Z+PgRQKqr8mWv4pymoVc9U42pWawhaROhKcGPKHuxivRXTqJipguqba8YyRx2pN8ICUxAVVjyNwWTZq55QVDzDDGsXA/2Frj36w7vCKJKeQS0hY/3omhvSlAe5lYIfr+ZM33n4wI2EtgA13u3wfamOc7KTbst5ixIMQMicYc=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4806.namprd10.prod.outlook.com (2603:10b6:510:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 16:09:49 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 16:09:49 +0000
Content-Type: multipart/alternative;
 boundary="------------10oXGFsnSkq0OFSmH3e6KXTo"
Message-ID: <b8d74a5c-73ac-3fe5-6eae-1e5b3c907628@oracle.com>
Date: Mon, 6 Dec 2021 11:09:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v10 0/8] hmp,qmp: Add commands to introspect virtio devices
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
 <2322952.dU7V5S69UE@silver>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <2322952.dU7V5S69UE@silver>
X-ClientProxiedBy: SN6PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:805:f2::22) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from [10.39.247.231] (209.17.40.42) by
 SN6PR04CA0081.namprd04.prod.outlook.com (2603:10b6:805:f2::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Mon, 6 Dec 2021 16:09:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1b38aba-0f06-45f2-ff5b-08d9b8d2d41f
X-MS-TrafficTypeDiagnostic: PH0PR10MB4806:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB48061177D7DC6CEBC4D6D223E86D9@PH0PR10MB4806.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/M+VyBYbwL5MpKKkH3r1QXsKwH7AC2Rl1k5orHKNKaqrLGZ8WmS/tvJ7hnEaPiaOWYKl50KCVl1lOeGFH4fI+mVv9UqBYCQvtJzBrgJVaa8aaJs2xibnoFPNs9wsJVdTM6j0XwnmcCDCbEruyl1+cIcMZkAP8ui5EpO6aAukX2YA5EO6qQZq1YQkwnf/kE6TDZCyzFVL7mpdYuKkqbYQf2KnR9B4P74mNtlzm9048ICsjY+FbHojgNlmhiWjN8F0T+LYQZ9DQ3ucWvXbnOkT7jkrRRVjvPJwoata0JkQb580kgMTaPhClbWpNG3Moct/Ik9oXuqAFAAoE6uOw3fTg7jwAsbPRvv+WtwEWg6a118T8AYfqjVjhzJdRF53zSBGIlYlcWxfvmFvubcD4PBgEghECFuRsAOsZYic0QBtrlR8wX44kY1R5DzcMrWGamKc1caWjI5RNi8HSZ6BsIK3NNSe6jB3b539JXSdh7lDQx6+xFeJURUPFKGxZgNJggEkeSa2Rxr4g1J/H7YXc+e6Q23/59mLCht9yvug5g6w/X91t3Lb4boTS5PhGVdazkLkTLCQgh7K+MoTlsg/Ypt4dc5ICB40Al1L7i5QKeWTEye+jWVnNZCFNy4cfNQjJHrCqxsUlHIXky3AY3+3N09qumn/gBwkwdSzMiDvAffcuHyYr4poF9MvQ45RkZAeJM/EJkRKM98PHICPwDnCwg4PtbnGe0J+lLl+uMqD5nO38k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(66946007)(8676002)(2616005)(4326008)(66476007)(316002)(86362001)(66556008)(956004)(36756003)(31686004)(16576012)(7416002)(26005)(6486002)(44832011)(38100700002)(508600001)(31696002)(5660300002)(53546011)(8936002)(2906002)(33964004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFYWVhjN3VYd3duRVR0SG9pd2dWWDhibUZyN24xZ083d2NrZGhzbjlDMjNL?=
 =?utf-8?B?OHFwRnZsY0hleVg4dW11bGFHdTZMbExUZFNQazQ3WXV6RFVSdTRTM2lwNGRn?=
 =?utf-8?B?Z1piTVQxU1VJKzdBYkRuR3FaY1hsd2J5Q2E0enZPMzYvdWtyMkJVR0Y0WVpJ?=
 =?utf-8?B?T0FrVzJ3OHgwVExZcFpDR3J1S1QxUXphVURXalQ0Tm9oeUx1ZW0wSjFEOGJZ?=
 =?utf-8?B?eitjQkpKa0p6bDZRcStndlU1T251NnVXc3M3aVIvMm1mRm1oZG5nOWVTVFBm?=
 =?utf-8?B?anVSeXExYWZKb09PcXF4dk5HTGNhcktqMisxeVUwalZtWHozTVI2aWNMMVUy?=
 =?utf-8?B?MGZYZkt3TllYWC9aaXN2T3ZEaXh2QkNQNWZTT3RsbXJFaVlTQWxFYmovOUov?=
 =?utf-8?B?S3M2NFg4TnZpeGdyTFdXcFdJQldlL2FIQ3MyVmhIS3dvd2w1ak5WODB3S0J2?=
 =?utf-8?B?cmpTM29Lc3c2QjRrbmN2MjgvRHdadnNjQTZzR0RNWVNFTDZ2b2tLeWRHMjJP?=
 =?utf-8?B?WlhwSnJuQUNGR0RZRWdFbFZ1RmpQdDBkdzB2eVpGN01NYmtrS3pmT2hpRG83?=
 =?utf-8?B?RUlOai83ZU1iZjJPTis1TzZoVkdDM1I1MC95TTBsS3BCUlNESXAzejNpNkZG?=
 =?utf-8?B?dG1tcDY3RlgvU0J3ZWpxOVV0eXRxQ3NNQnBTVXVzZkVRMEVhRllwSlB3T3RL?=
 =?utf-8?B?cUl5QXcwODd1U0VTUjVZQXo1ZmdPdjBzVWI4b3B0MTdCc2RZaUxGeFNsMEVn?=
 =?utf-8?B?bk1ZYVRMTCt0OEQ1UWY4SkpjOHM3THhqYVovdjhSSFgrc3V3SE9nNnpScjhP?=
 =?utf-8?B?UFM1c0NGZnNNQ2ozZXJYR1dJd2VidHVWT1ZWdUV6VCsyOWlhMVVZSXhCUGRw?=
 =?utf-8?B?bGdyZG9ad1VXMy8yMmFDWXZDVlJabndRQUNNaTVnVTNKOHJ0VGlpaDZOUnZ3?=
 =?utf-8?B?b3cvMDBWSEVGelZGa0krZEFYQnFoOVE3RU5McGNKbDcrNmdJTUV6NHFZR2Jm?=
 =?utf-8?B?V0lKTVJyWHlnVi82ZHZDdHk2M1Awc0QzdXZnSVNFdFg0aHl3cGVHY2Jpa0du?=
 =?utf-8?B?SW91ZkorK2FWd3Z4VEYwUURZYmFtZkk4dDc1OFhMbDAyT3NCNWhVZUlPUkhZ?=
 =?utf-8?B?dFViMEpMb0tmSkpjYmhhY3BSRjBBYkk5czVEdzdhQ25nNlhhQzd1dkFIYWp2?=
 =?utf-8?B?NHQyQWMzYmxoVDRES1FJRU5wNWJMeldUZWZYTkVoWXVWTFZaS0cxK0pmSFoy?=
 =?utf-8?B?akxGQVNNYzRqZmg4WTg4M0xMRlZ3L2NERXVoNmtJdTdLM2dUUTNJa1JTbGdq?=
 =?utf-8?B?aWtodUlZSkd1bmtLeDIvMjhSVElIUXo3VjZJemUyVWVBeVNScmE4ZXhxamlP?=
 =?utf-8?B?UTl3SDNMQUptdXYvMnJMWjZaUUNBc0NhTVBNSFdnN3pOSGtqZStOVFhWZ2sv?=
 =?utf-8?B?MFU2SE5xeTNkc0M2cFRzQ3N2MEhiZGJRbEFKd1ZwSXhncWVYWDAvd1FJK1VP?=
 =?utf-8?B?Zms5dWFwaHVaR0NDL3Y4dElMbDA1TWE0UmhPWjkvVDdvL1dpeTIzSFdjV0N2?=
 =?utf-8?B?aEZUS0IrUnlZWjcrN2dkV20zdzRORXlLbHkyV3UwTXU5Qlo5SGlXekRXMHI0?=
 =?utf-8?B?RW5hMncvYVJxMzdLNXN4K1ZpQnIxTW1BL0ZROHIwWHYybERzeXQvMitSS1di?=
 =?utf-8?B?N1FuZkMyUVdRWU44NUtINm1CcjJIazhYRUQrQkhXTUNWalVwTGY4VjIxSC9S?=
 =?utf-8?B?TnFPL1hsekxVT2U5VDgxc0VDVFZqZFpzRWJmd1p1UENqeGwwN3JQb1NQY08v?=
 =?utf-8?B?YlJMektwWDRzVlRueVBldmJTS2MwOER5bGdiWGgxbSt4VW5OZmtWcHdtMzBs?=
 =?utf-8?B?V3FzOVY3djBkRElkNWg0VFpZR0JhOHhwZFByTy9wdUh2cDFBWE4yT3RJTDBD?=
 =?utf-8?B?UzV1WlZUTjBHK3BuejlSRmw5cGpwY1plKzBIemRudVhncEpJQmVseWpMV0hV?=
 =?utf-8?B?Mll1alpCbm1tUDJDRVJOSUgxRGRQT1Q0NVJva0twUmF6RHkxLzhOUVJRV1I4?=
 =?utf-8?B?WVNQbG5ZSTVlL1JyU3ovb2pxY3lXMUFWeTdDVEVoNktyVlhKdzlpQ2F3VENO?=
 =?utf-8?B?M3F5VGhzNmpiMGN4cGk3dXlMVkxlQmVwSWkrbVpNYVJ2d2JhTVhVb09UZzU5?=
 =?utf-8?Q?OJBqkPf9kr0hTDsoJF1AbXU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b38aba-0f06-45f2-ff5b-08d9b8d2d41f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:09:49.6123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oPNBFDGN6ymgDgIPC7KFDp/6Tjo0JTwzVgN1CLSWhHkNGL7zMzZHlDh8RPXy/6MknafO45D6bFoUhWxxMBTjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4806
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060100
X-Proofpoint-ORIG-GUID: Vfe1dVLV_WwDGfSJB_m8AM44QASIlyFn
X-Proofpoint-GUID: Vfe1dVLV_WwDGfSJB_m8AM44QASIlyFn
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: mst@redhat.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, eblake@redhat.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------10oXGFsnSkq0OFSmH3e6KXTo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/6/21 08:50, Christian Schoenebeck wrote:
> On Montag, 6. Dezember 2021 13:43:18 CET Jonah Palmer wrote:
>> This series introduces new QMP/HMP commands to dump the status of a
>> virtio device at different levels.
>>
>> [Jonah: Rebasing previous patchset from Nov. 10 (v9). Original patches
>>   are by Laurent Vivier from May 2020.
>>
>>   Rebase from v9 to v10 includes reformatting virtio.json examples and
>>   command structures for better consistency. Also removed all enums from
>>   virtio.json and replaced their purpose with string literals.
>>
>>   Removed @ndescs from VirtioQueueElement, as the number of descriptors
>>   can be inferred from the length of the @descs chain.
>>
>>   Lastly, removed the examples in hmp-commands-info.hx to fix 'inconsistent
>>   literal block quoting' warning from Sphinx.]
> I have not followed the entire discussion. AFAICS this is intended to monitor
> status information on virtio level only, like virtqueue fill status, etc.
>
> One thing that I am looking for is monitoring device specific information
> above virtio level, e.g. certain performance numbers or statistics that only
> make sense for the specific device. That would not fit into any of these
> commands, right?
>
> Best regards,
> Christian Schoenebeck

Correct. These are just one-shot commands that dump information on virtio
devices (including vhosts), their virtqueues, and virtqueue elements as they
are at the time of the command.

Jonah

>
>
--------------10oXGFsnSkq0OFSmH3e6KXTo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/6/21 08:50, Christian Schoenebeck
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2322952.dU7V5S69UE@silver">
      <pre class="moz-quote-pre" wrap="">On Montag, 6. Dezember 2021 13:43:18 CET Jonah Palmer wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing previous patchset from Nov. 10 (v9). Original patches
 are by Laurent Vivier from May 2020.

 Rebase from v9 to v10 includes reformatting virtio.json examples and
 command structures for better consistency. Also removed all enums from
 virtio.json and replaced their purpose with string literals.

 Removed @ndescs from VirtioQueueElement, as the number of descriptors
 can be inferred from the length of the @descs chain.

 Lastly, removed the examples in hmp-commands-info.hx to fix 'inconsistent
 literal block quoting' warning from Sphinx.]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I have not followed the entire discussion. AFAICS this is intended to monitor 
status information on virtio level only, like virtqueue fill status, etc.

One thing that I am looking for is monitoring device specific information 
above virtio level, e.g. certain performance numbers or statistics that only 
make sense for the specific device. That would not fit into any of these 
commands, right?

Best regards,
Christian Schoenebeck</pre>
    </blockquote>
    <pre>Correct. These are just one-shot commands that dump information on virtio
devices (including vhosts), their virtqueues, and virtqueue elements as they
are at the time of the command. 

Jonah
</pre>
    <blockquote type="cite" cite="mid:2322952.dU7V5S69UE@silver">
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>
--------------10oXGFsnSkq0OFSmH3e6KXTo--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594153EDB3A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:48:41 +0200 (CEST)
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfmy-0001lT-CI
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhc-0000jF-Je
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhY-0007uh-3V
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:08 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGaA9n021054; Mon, 16 Aug 2021 16:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ujoH7bCSKiw2S++WAYDzYW+rsvzgBNv0frY7sMGl0U0=;
 b=KJEbxjiEjovko16lh+hxCDUiOYtkzFcT4hyQbmL35qq53C+STQOCQyDlA3UhVbdzLPAG
 pp4sabPzZRQQVpwwH2Syg5PI8GkwwBm0b/Cij5fBDcSVRhx5xArz0EehGmzU9+ap6kgw
 hoSO6+7TzM1NhyrD6RFs3iXgMu6g93s2yNQJIs5s6z7vWTnNG/39HPvNW6bXibkj8w2H
 1LbavsWQDBcEnGWsm6oRODYHxNHKHuK5AsW95jemfj62tyrvrRO9NMsLzp8XmG7ibYRW
 mDiyLJvDGvLe4BDHxW1msouVVNAHzxElh2JP0cWvGO0OXNB8uenKLT6S+RMvs1jTPeKj dA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ujoH7bCSKiw2S++WAYDzYW+rsvzgBNv0frY7sMGl0U0=;
 b=HJEXkH2PeXCYKiwPY0hVQ18Xs8I6b7HW40Km0mVXG8HaSByrIcP/6eg5AMW4AMK2h8xQ
 UkSKAchVLVVkE/1SffzcvDGvN/CNoNgZrrTpuI4zufwJRgZPg8Z2c6edlV6zdE31J3Nx
 KSHvJdk9QoFsYWqWzxCdXF8ALAnPyFt80dxrX8i4UOxA0Jq+iNI0hj0xVoenQv88WK6u
 BpHTNka7Nw+hrxb6A5SvBCvuVuXBXkdW7e2wIH7iE2TG4EOfDpPZmt8uzcpYboJbiYS1
 zdRxVCB7phomrZeRlBaO20DrpfEhltbwUZjWZP5HS6O12ZAupry2S1m4T9An/RxiXAfH IA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afgmb9jyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeijC113651;
 Mon, 16 Aug 2021 16:43:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by aserp3020.oracle.com with ESMTP id 3ae5n609gk-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MI+fXm4lLL2F86LNXPAH9q/mbGzdOEtbcf+v11XzYGuD1tegnsZHoS+J57nB/0/PH2rShakAtReT3on8kXnNKcUrH4dbEIZUSTUxBzUvBfJBlF+zPfk9V6CbwzlNPF1AviOW0v390N20YaQnZRSKOkSzv+TTm23Cub3SCFHdvdIDpFd4R/hvN8TG2aaOIvOqqlKO/oRaAUW8vldgK0ZT9fb9APy9Jd76eVutwO0MSxglnbwqtLi7lJ4cqOpOHpm3axOTQ8lxz32+86d1/XwreteupUGjVR1NAe3XWmYTTR9F0qKCXzyM69NpY8mBXvT/dIvEUGkEAD4k0giTTRHmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujoH7bCSKiw2S++WAYDzYW+rsvzgBNv0frY7sMGl0U0=;
 b=nlNx6trd/9Udl/840rEtK9rNR2+KDb96KZIpzFJy4Tkg21PS5Z4BmmPRZqO8PEYUz9Tz/xDY6fEkMTM9Klw1uSNqF6eI3IT7Jt5mf2crnrERKCxS45vPT8cWEiagoXUjPY/nhIqRXps8rlp4Cb8mJAZxF9eSP0SyI/HZDAhFpw99xYwpjZ2CW2mg4go8sHExE+aTCKmdmFlnXbhtrOu80GBIcmDSdtRMMyc6vIQNnxF4MhAeo5pU95vzGnu+cJORJD1GU3wJmlTP/ppw1mRJwgXSaVVBpgUNkdM3RPvUP3EbCOTsVJEKRLLhY9ps383Ru3DFerQ97Zlo+IaDgETvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujoH7bCSKiw2S++WAYDzYW+rsvzgBNv0frY7sMGl0U0=;
 b=B4kg3BVppp9EtbKOtq/wMwD6MybBpppSdWQ7fVJnA8RBQRV9SGYBlJ2RbFdQ9Yf11rEw7EqmTycahbH2t6FAsQSwmoJGa3sHINfv1VLIHGvflcTSQorB6uboNWxMrBbzw+wDHobFoYUhoJgQguzFvMUl31vn1WXJBR21NWWGKkA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by BYAPR10MB3221.namprd10.prod.outlook.com (2603:10b6:a03:14f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 16:42:58 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:42:57 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 05/16] vfio-user: define VFIO Proxy and communication
 functions
Date: Mon, 16 Aug 2021 09:42:38 -0700
Message-Id: <3d3befd308bacb7ec9f3ccd8f99e5184261279b2.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:42:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ec3c874-e9e4-4ef3-1202-08d960d4e717
X-MS-TrafficTypeDiagnostic: BYAPR10MB3221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3221ABAD1B478E4124AB222D8CFD9@BYAPR10MB3221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0zsCA0XJL5UwntX+fMsaz84GhgJF4A/ZF5A5kXm7P4mO4Ssx1pf+ykZ+9DTOVOw0KK7v05wns5atpzTXITDWB/RDSH/tb/8M6b8GlIC9SAfgbZHCKTpGaKF6K37gXxZm0/VcQEfCQ1dRJMcJ1/1Lzq2RH/S+1Udss8VyroUkd6cfZV5Y26VzlpbC5LNgxG+eE8IaRg5xFYu+5SwxplNagjrjUN3NJoRMdu78b4adv5hkhQv71eBBwBrsGopn5a1XofrqjsQRytVsCUyDJ0UTkYFk6h/Ds0+lJs8UFfrxOa1vkMM9Bx3iTU7nyFbokKp3WSpV+IGGAR+8WPp/S0V8AzPHw+6OOpL60BK9m08BFwiDKUOrt/lVczC32cglJbuOoJNgHuR0TfBUWl4WE6zlbCd3LVuBNOxZ3w+KBFFTwkJNCy0c5EvG1VYlEZ4HKY2y0GD/8C1Ba/7uQumogbVadM9UPVI1vpQVlE8X2Z9cjDNgR2Yo7btM1pbxJUhAaft9zE+zoQa/r/M7NJaHP2htMSBe2CcNRZb4K6RQfAttFcLFSBmvte82BQO/MCOzANzHdLd8LQbqBRKQOnbIS3bWvTkk993r+oNs9CuvyNf28mdUxH/rPwywFNcmVmuynyPU13129C4Rv6CEEaPkaQYSfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(2616005)(6916009)(66556008)(66476007)(66946007)(52116002)(30864003)(83380400001)(478600001)(36756003)(5660300002)(6506007)(6666004)(6512007)(186003)(316002)(6486002)(86362001)(44832011)(8936002)(8676002)(38100700002)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmUzSEw5dkFRVVIzNktwN2ZhRG5JYnBTL0JRb010SnRxYnM4bFpRNWRVVkJ0?=
 =?utf-8?B?b3VkcmVJZTFkY1MzWHZxUDA2OHdWZFRsTGZ5OFNXZHZqUnFZa3NIVHhCNUtS?=
 =?utf-8?B?clJMSUh2VmZJM09GMldTaCs3K1RzSENkY3UwWjFLK2JnbUlkblVMYmdRcHpU?=
 =?utf-8?B?WUFVazh2Z3dQdGZ0V0VRSVpXd0ErbG5DTjUzWlhzQm12cThrQnYwQmRMaU1a?=
 =?utf-8?B?emRHUFptY0pMd3V2OFZMZlpJcnRHUkJRSGVzbEZjWE04NndJUUNjaFd2bWd5?=
 =?utf-8?B?K0JNNUtXUUZqaWQvNThOWkwzaHBiR3VPWmR4MjVUZnBnQUhCVjZCbWJzbHM3?=
 =?utf-8?B?Rk5MdHBWZnYxcG5PZzJuM1FuZ3VLS2ZKOGVGREVNTFd0OHlYQ3ZKWW13bmxz?=
 =?utf-8?B?TDB6TGxuQkxZYTZCUnoxeVcwai91emFVcVl0SmVPcjN2dkZrYm9ZS05DQ042?=
 =?utf-8?B?dTlZVngrM1dpcWdjb2VyOGY0QzZPOWlyQTRreEZpa25mWWNURktTdWNBMktD?=
 =?utf-8?B?Z3hnbU5VMmFkOW1GYzJUQlYxZkdOSWdQbkgydGtacjQzRXM5ZUo4Sk9HWHBI?=
 =?utf-8?B?QkpJc1ZpVjd3RnNSSXBhcmt2S0J1cmhXOHNnem1ycXlYSXRRTFlVK2NZem41?=
 =?utf-8?B?bkt1WndqWHRHT1VydFlJY1Bzc05NaUpnNktVUFY4TmF1aUl2bUZqR3BRVWli?=
 =?utf-8?B?b2xoMU1QYkVnY2I3eHR4d1FmTXllOHhQa0FJSEFSQ2JDM3RlNFBSaVJsNEJP?=
 =?utf-8?B?N0ttNzhPU3BpdXlUVTNySCt4SzBoQktrOU5xb08xK2VNUGR2d0U4OXhTWEsw?=
 =?utf-8?B?OXlhY2RrWVJId3pvM3JFMEI5OENCQWhTMklxdVIwYnJVZ1hlS2RrYmcvc3Ez?=
 =?utf-8?B?MU5ZV3pOcXRWaEZXcTVpWndSb1Z5SjIyMTVEdjdqSldJVERjbW5hRnc2VFVS?=
 =?utf-8?B?OXMvWWZha3ErdnJIcUVPb0dnQlBjRDQzMXBZemJwUkFYb0RiWUFOL3c0UDRu?=
 =?utf-8?B?OEZhaVVFS1F2dFpGeUN2elhMWEs4Qm5JSCttS3NVSHRjRFkvVmFoUkdxUTRj?=
 =?utf-8?B?R3o4QU1OKzNxNEZjMXVqUDJoenpERGo5cmpZR0w4ZnArYWw0NHRCelZlaTMy?=
 =?utf-8?B?NGhEemJ0WmFHVjRnOTZzVjk2bDAxNXBpTklaa3ZyUmJncG9rZGRuektuUWFC?=
 =?utf-8?B?c2d3ZXBxZ1ZsRm1GaWN3Z0RCZHp6dWppY1hPaUkwSVN6YWZsK295YnRsTlFF?=
 =?utf-8?B?RFV2Zm9yY1hEZ1VsVXFWaDRxWFZyeVE1TXE1MTFFSmU1Nk9ERE1EKzNBU3lC?=
 =?utf-8?B?VlFEN2JUeCs5Mzk3YlpWdkV3aGJiZFRudG1VWjd4Y0tNNVJEMlkveFZwRTF4?=
 =?utf-8?B?dWpaZ0NCQUFQeStVaEtaNlBqR1NTTTVDMEpQMmpkeG9rZGk0SURpQ1JNeGJo?=
 =?utf-8?B?SExqQVpyUmNHRmNIeWtKRFVSUGdONGt1R0RwNThFazhxZDdVMFhTT2lXRkI5?=
 =?utf-8?B?M054S2Z0RXRjRk0wOHZvOTVKUE01RnFocUEyQ1kxQ3pXRFdTSlFleURheXdm?=
 =?utf-8?B?V09ucldwVFpWU3NxUUptL3ptZnNwRFVSWmZmYWEvLzZZM0hHTlNJYkdWYWRI?=
 =?utf-8?B?anBkUkJUSy9xZlFOMENGRVlqbHFCcEZtd2NWMEU3OVRNKy82dGR6NWVsbVh2?=
 =?utf-8?B?ZEtQUkxOQ2RjYkhZRTlvSlJ6YWJibU40MjNpNFc2Um44QytkdUtNU1dFSlV5?=
 =?utf-8?B?MWNmN0hISVA2eUgrdDhXRlNhMlZjRFZkQmQyeEhqcDM0dUxxWjRLeU12TmVn?=
 =?utf-8?B?ek1xcVJpYVd1RXgzdUExV293VXJ5U05wemRYQjRvaHlSTnpvRERINk9URGh3?=
 =?utf-8?Q?8UEiF7nuDxNc1?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec3c874-e9e4-4ef3-1202-08d960d4e717
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:42:57.7597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j95TseykZUMVeKCmFNyGIGKv6Hsmaq2/Ls8jlHzE8/cJHO083BP60mddnLa5CrLUPWhmha3OqX80WFyl6G7Fi/W33EozQfGq7WiKK8TYXHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-ORIG-GUID: 3EqtAwqddRKT-csdXOJdSZEoa9o1xvIb
X-Proofpoint-GUID: 3EqtAwqddRKT-csdXOJdSZEoa9o1xvIb
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  62 +++++++++
 hw/vfio/user.h          |   8 ++
 hw/vfio/pci.c           |   6 +
 hw/vfio/user.c          | 289 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS             |   1 +
 5 files changed, 366 insertions(+)
 create mode 100644 hw/vfio/user-protocol.h

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
new file mode 100644
index 0000000000..27062cb910
--- /dev/null
+++ b/hw/vfio/user-protocol.h
@@ -0,0 +1,62 @@
+#ifndef VFIO_USER_PROTOCOL_H
+#define VFIO_USER_PROTOCOL_H
+
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Each message has a standard header that describes the command
+ * being sent, which is almost always a VFIO ioctl().
+ *
+ * The header may be followed by command-specific data, such as the
+ * region and offset info for read and write commands.
+ */
+
+typedef struct {
+    uint16_t id;
+    uint16_t command;
+    uint32_t size;
+    uint32_t flags;
+    uint32_t error_reply;
+} VFIOUserHdr;
+
+/* VFIOUserHdr commands */
+enum vfio_user_command {
+    VFIO_USER_VERSION                   = 1,
+    VFIO_USER_DMA_MAP                   = 2,
+    VFIO_USER_DMA_UNMAP                 = 3,
+    VFIO_USER_DEVICE_GET_INFO           = 4,
+    VFIO_USER_DEVICE_GET_REGION_INFO    = 5,
+    VFIO_USER_DEVICE_GET_REGION_IO_FDS  = 6,
+    VFIO_USER_DEVICE_GET_IRQ_INFO       = 7,
+    VFIO_USER_DEVICE_SET_IRQS           = 8,
+    VFIO_USER_REGION_READ               = 9,
+    VFIO_USER_REGION_WRITE              = 10,
+    VFIO_USER_DMA_READ                  = 11,
+    VFIO_USER_DMA_WRITE                 = 12,
+    VFIO_USER_DEVICE_RESET              = 13,
+    VFIO_USER_DIRTY_PAGES               = 14,
+    VFIO_USER_MAX,
+};
+
+/* VFIOUserHdr flags */
+#define VFIO_USER_REQUEST       0x0
+#define VFIO_USER_REPLY         0x1
+#define VFIO_USER_TYPE          0xF
+
+#define VFIO_USER_NO_REPLY      0x10
+#define VFIO_USER_ERROR         0x20
+
+
+#define VFIO_USER_DEF_MAX_FDS   8
+#define VFIO_USER_MAX_MAX_FDS   16
+
+#define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
+#define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
+
+
+#endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 62b2d03d56..905e374e12 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -11,6 +11,8 @@
  *
  */
 
+#include "user-protocol.h"
+
 typedef struct {
     int send_fds;
     int recv_fds;
@@ -19,6 +21,7 @@ typedef struct {
 
 typedef struct VFIOUserReply {
     QTAILQ_ENTRY(VFIOUserReply) next;
+    VFIOUserHdr *msg;
     VFIOUserFDs *fds;
     uint32_t rsize;
     uint32_t id;
@@ -62,5 +65,10 @@ typedef struct VFIOProxy {
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
+void vfio_user_set_reqhandler(VFIODevice *vbasdev,
+                              int (*handler)(void *opaque, char *buf,
+                                             VFIOUserFDs *fds),
+                                             void *reqarg);
+void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7c2d245ca5..7005d9f891 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3333,6 +3333,11 @@ type_init(register_vfio_pci_dev_type)
  * vfio-user routines.
  */
 
+static int vfio_user_pci_process_req(void *opaque, char *buf, VFIOUserFDs *fds)
+{
+    return 0;
+}
+
 /*
  * Emulated devices don't use host hot reset
  */
@@ -3386,6 +3391,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         return;
     }
     vbasedev->proxy = proxy;
+    vfio_user_set_reqhandler(vbasedev, vfio_user_pci_process_req, vdev);
 
     if (udev->secure_dma) {
         proxy->flags |= VFIO_PROXY_SECURE;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 3bd304e036..2fcc77d997 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -25,8 +25,15 @@
 #include "sysemu/iothread.h"
 #include "user.h"
 
+static uint64_t max_xfer_size = VFIO_USER_DEF_MAX_XFER;
 static IOThread *vfio_user_iothread;
+
 static void vfio_user_shutdown(VFIOProxy *proxy);
+static void vfio_user_recv(void *opaque);
+static void vfio_user_send_locked(VFIOProxy *proxy, VFIOUserHdr *msg,
+                                  VFIOUserFDs *fds);
+static void vfio_user_send(VFIOProxy *proxy, VFIOUserHdr *msg,
+                           VFIOUserFDs *fds);
 
 
 /*
@@ -36,6 +43,67 @@ static void vfio_user_shutdown(VFIOProxy *proxy);
 static void vfio_user_shutdown(VFIOProxy *proxy)
 {
     qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
+    qio_channel_set_aio_fd_handler(proxy->ioc,
+                                   iothread_get_aio_context(vfio_user_iothread),
+                                   NULL, NULL, NULL);
+}
+
+static void vfio_user_send_locked(VFIOProxy *proxy, VFIOUserHdr *msg,
+                                  VFIOUserFDs *fds)
+{
+    struct iovec iov = {
+        .iov_base = msg,
+        .iov_len = msg->size,
+    };
+    size_t numfds = 0;
+    int msgleft, ret, *fdp = NULL;
+    char *buf;
+    Error *local_err = NULL;
+
+    if (proxy->state != VFIO_PROXY_CONNECTED) {
+        msg->flags |= VFIO_USER_ERROR;
+        msg->error_reply = ECONNRESET;
+        return;
+    }
+
+    if (fds != NULL && fds->send_fds != 0) {
+        numfds = fds->send_fds;
+        fdp = fds->fds;
+    }
+
+    ret = qio_channel_writev_full(proxy->ioc, &iov, 1, fdp, numfds, &local_err);
+    if (ret < 0) {
+        goto err;
+    }
+    if (ret == msg->size) {
+        return;
+    }
+
+    buf = iov.iov_base + ret;
+    msgleft = iov.iov_len - ret;
+    do {
+        ret = qio_channel_write(proxy->ioc, buf, msgleft, &local_err);
+        if (ret < 0) {
+            goto err;
+        }
+        buf += ret;
+        msgleft -= ret;
+    } while (msgleft != 0);
+    return;
+
+err:
+    msg->flags |= VFIO_USER_ERROR;
+    msg->error_reply = EIO;
+    error_report_err(local_err);
+}
+
+static void vfio_user_send(VFIOProxy *proxy, VFIOUserHdr *msg,
+                           VFIOUserFDs *fds)
+{
+
+    qemu_mutex_lock(&proxy->lock);
+    vfio_user_send_locked(proxy, msg, fds);
+    qemu_mutex_unlock(&proxy->lock);
 }
 
 
@@ -43,6 +111,213 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
  * Functions only called by iothread
  */
 
+void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret)
+{
+    VFIOUserHdr *hdr = (VFIOUserHdr *)buf;
+
+    /*
+     * convert header to associated reply
+     * positive ret is reply size, negative is error code
+     */
+    hdr->flags = VFIO_USER_REPLY;
+    if (ret >= sizeof(VFIOUserHdr)) {
+        hdr->size = ret;
+    } else if (ret < 0) {
+        hdr->flags |= VFIO_USER_ERROR;
+        hdr->error_reply = -ret;
+        hdr->size = sizeof(*hdr);
+    } else {
+        error_printf("vfio_user_send_reply - size too small\n");
+        return;
+    }
+    vfio_user_send(proxy, hdr, NULL);
+}
+
+void vfio_user_recv(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOProxy *proxy = vbasedev->proxy;
+    VFIOUserReply *reply = NULL;
+    g_autofree int *fdp = NULL;
+    VFIOUserFDs reqfds = { 0, 0, fdp };
+    VFIOUserHdr msg;
+    struct iovec iov = {
+        .iov_base = &msg,
+        .iov_len = sizeof(msg),
+    };
+    bool isreply;
+    int i, ret;
+    size_t msgleft, numfds = 0;
+    char *data = NULL;
+    g_autofree char *buf = NULL;
+    Error *local_err = NULL;
+
+    qemu_mutex_lock(&proxy->lock);
+    if (proxy->state == VFIO_PROXY_CLOSING) {
+        qemu_mutex_unlock(&proxy->lock);
+        return;
+    }
+
+    ret = qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds,
+                                 &local_err);
+    if (ret <= 0) {
+        /* read error or other side closed connection */
+        goto fatal;
+    }
+
+    if (ret < sizeof(msg)) {
+        error_setg(&local_err, "vfio_user_recv short read of header");
+        goto err;
+    }
+    if (msg.size < sizeof(VFIOUserHdr)) {
+        error_setg(&local_err, "vfio_user_recv bad header size");
+        goto err;
+    }
+
+    /*
+     * For replies, find the matching pending request
+     */
+    switch (msg.flags & VFIO_USER_TYPE) {
+    case VFIO_USER_REQUEST:
+        isreply = 0;
+        break;
+    case VFIO_USER_REPLY:
+        isreply = 1;
+        break;
+    default:
+        error_setg(&local_err, "vfio_user_recv unknown message type");
+        goto err;
+    }
+
+    if (isreply) {
+        QTAILQ_FOREACH(reply, &proxy->pending, next) {
+            if (msg.id == reply->id) {
+                break;
+            }
+        }
+        if (reply == NULL) {
+            error_setg(&local_err, "vfio_user_recv unexpected reply");
+            goto err;
+        }
+        QTAILQ_REMOVE(&proxy->pending, reply, next);
+
+        /*
+         * Process any received FDs
+         */
+        if (numfds != 0) {
+            if (reply->fds == NULL || reply->fds->recv_fds < numfds) {
+                error_setg(&local_err, "vfio_user_recv unexpected FDs");
+                goto err;
+            }
+            reply->fds->recv_fds = numfds;
+            memcpy(reply->fds->fds, fdp, numfds * sizeof(int));
+        }
+
+    } else {
+        /*
+         * The client doesn't expect any FDs in requests, but
+         * they will be expected on the server
+         */
+        if (numfds != 0 && (proxy->flags & VFIO_PROXY_CLIENT)) {
+            error_setg(&local_err, "vfio_user_recv fd in client reply");
+            goto err;
+        }
+        reqfds.recv_fds = numfds;
+    }
+
+    /*
+     * put the whole message into a single buffer
+     */
+    if (isreply) {
+        if (msg.size > reply->rsize) {
+            error_setg(&local_err,
+                       "vfio_user_recv reply larger than recv buffer");
+            goto fatal;
+        }
+        *reply->msg = msg;
+        data = (char *)reply->msg + sizeof(msg);
+    } else {
+        if (msg.size > max_xfer_size) {
+            error_setg(&local_err, "vfio_user_recv request larger than max");
+            goto fatal;
+        }
+        buf = g_malloc0(msg.size);
+        memcpy(buf, &msg, sizeof(msg));
+        data = buf + sizeof(msg);
+    }
+
+    msgleft = msg.size - sizeof(msg);
+    if (msgleft != 0) {
+        ret = qio_channel_read(proxy->ioc, data, msgleft, &local_err);
+        if (ret < 0) {
+            goto fatal;
+        }
+        if (ret != msgleft) {
+            error_setg(&local_err, "vfio_user_recv short read of msg body");
+            goto err;
+        }
+    }
+
+    /*
+     * Replies signal a waiter, requests get processed by vfio code
+     * that may assume the iothread lock is held.
+     */
+    if (isreply) {
+        reply->complete = 1;
+        if (!reply->nowait) {
+            qemu_cond_signal(&reply->cv);
+        } else {
+            if (msg.flags & VFIO_USER_ERROR) {
+                error_printf("vfio_user_rcv error reply on async request ");
+                error_printf("command %x error %s\n", msg.command,
+                             strerror(msg.error_reply));
+            }
+            /* just free it if no one is waiting */
+            reply->nowait = 0;
+            if (proxy->last_nowait == reply) {
+                proxy->last_nowait = NULL;
+            }
+            g_free(reply->msg);
+            QTAILQ_INSERT_HEAD(&proxy->free, reply, next);
+        }
+        qemu_mutex_unlock(&proxy->lock);
+    } else {
+        qemu_mutex_unlock(&proxy->lock);
+        qemu_mutex_lock_iothread();
+        /*
+         * make sure proxy wasn't closed while we waited
+         * checking state without holding the proxy lock is safe
+         * since it's only set to CLOSING when BQL is held
+         */
+        if (proxy->state != VFIO_PROXY_CLOSING) {
+            ret = proxy->request(proxy->reqarg, buf, &reqfds);
+            if (ret < 0 && !(msg.flags & VFIO_USER_NO_REPLY)) {
+                vfio_user_send_reply(proxy, buf, ret);
+            }
+        }
+        qemu_mutex_unlock_iothread();
+    }
+    return;
+
+fatal:
+    vfio_user_shutdown(proxy);
+    proxy->state = VFIO_PROXY_RECV_ERROR;
+
+err:
+    for (i = 0; i < numfds; i++) {
+        close(fdp[i]);
+    }
+    if (reply != NULL) {
+        /* force an error to keep sending thread from hanging */
+        reply->msg->flags |= VFIO_USER_ERROR;
+        reply->msg->error_reply = EINVAL;
+        reply->complete = 1;
+        qemu_cond_signal(&reply->cv);
+    }
+    qemu_mutex_unlock(&proxy->lock);
+    error_report_err(local_err);
+}
+
 static void vfio_user_cb(void *opaque)
 {
     VFIOProxy *proxy = opaque;
@@ -101,6 +376,20 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
     return proxy;
 }
 
+void vfio_user_set_reqhandler(VFIODevice *vbasedev,
+                              int (*handler)(void *opaque, char *buf,
+                                             VFIOUserFDs *fds),
+                              void *reqarg)
+{
+    VFIOProxy *proxy = vbasedev->proxy;
+
+    proxy->request = handler;
+    proxy->reqarg = reqarg;
+    qio_channel_set_aio_fd_handler(proxy->ioc,
+                                   iothread_get_aio_context(vfio_user_iothread),
+                                   vfio_user_recv, NULL, vbasedev);
+}
+
 void vfio_user_disconnect(VFIOProxy *proxy)
 {
     VFIOUserReply *r1, *r2;
diff --git a/MAINTAINERS b/MAINTAINERS
index f429bab391..52d37dd088 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1888,6 +1888,7 @@ S: Supported
 F: docs/devel/vfio-user.rst
 F: hw/vfio/user.c
 F: hw/vfio/user.h
+F: hw/vfio/user-protocol.h
 
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.25.1



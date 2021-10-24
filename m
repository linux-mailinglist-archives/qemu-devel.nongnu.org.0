Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB23443861C
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 03:16:47 +0200 (CEST)
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meS7y-0003VI-K8
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 21:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <boris.ostrovsky@oracle.com>)
 id 1meS5E-0001Sc-GS
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:13:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <boris.ostrovsky@oracle.com>)
 id 1meS58-0004NT-AD
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 21:13:55 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19NJa4J7001393; 
 Sun, 24 Oct 2021 01:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=94JVn5gS39tA5m8nSfEiqaRARPBxDfc+ppPXyCH/wK0=;
 b=e2/vgVe0oNf5K/2E/dE9RI+L1Q6YKIF7fWYsa5hHTzLdylPceBLKPf/lORWEXwviiGDk
 j9Cwlwk9rSmH0W5mOZKjqsRroDq8p7XVfjST1WdWh6WOa6lawsud2cz+0yT73Cc9cfIy
 tgksEcV3xQ30vfBqk3OtquZPJKQ1owrkEykbA8SFGZbf5OlB2hckPKYA7vg+E87bVbFb
 9efoDt0Xz+ilaCNhGmqE1xlpGyojaym7B05NYGcRSUsZdbdFQj51u3j3fCR+p3uRQyVn
 psmd8Oh4TSPmiRU0s1ylOdwmDzilPrpPJnnMQ+ecpL95Yz8PM2q5iKqzl9y41vtm7ThH kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bv962t71t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 24 Oct 2021 01:13:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19O1B3fX167644;
 Sun, 24 Oct 2021 01:13:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by aserp3030.oracle.com with ESMTP id 3bv8ebq82c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 24 Oct 2021 01:13:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jELuHSjQsOqCVJx/fI4svWkdivPC1FKMrdoNDy1OuRsOt0ehKuotDtJINjZyUbIxTyW0ZLvKqSq3GMHD+4X5t0RlOs+IjKxUD9YWmIl4SHbjEyvciX1QlJ7ijGrRz0OifFTBy2TFr82DQ7nleo4RTGp+4DIs9oSuxlggUmdVMORDlnmqwV1aRRLcwzysL7WEkjK2WXD7u4ltAv66L2ObC9/Ih4NSFxjr3WNPdN3w0sShK+UbGULjEbQ19BnvyAsrBhF/b1Y8wjVS8qPsEQ1Ogy1rPRxR3qKY/IeXQ16Vkd8mvj7KJLvlqr2+GTwY8ipVHZsYBFkArAoZEjfl0hAgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94JVn5gS39tA5m8nSfEiqaRARPBxDfc+ppPXyCH/wK0=;
 b=EAaQXGToi39Jm5ZcewvKMeH3UsxP/ZD9fZZJVENKJUn8NJJ9NCirIK6wnhQATo1Gy4i/WeSd1CkU/1N/xXXUV1bb3TZEROfQn20AfI6Barg/8lbbaTkoQJJTeGQWgIq3Hg8UWY6XJ9zwU6tlzjLPLRX5PWfLF15CCBWB5QtiDYjRcxTGDbXzjB7e70vsyEKZeAC7t/C2eGVW7grTbb5vbxWeQfoJY8g3Ld83KQvLl5GuxB19kLpXVJppTgRz1/P1iho0ALFeJUPue5WyQhIT4Gax28NpUDvai4TvgQNR7ludjtf53QlAH4P9bHcWFyPKrl5l8q+wtJZ74bukCxyCPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94JVn5gS39tA5m8nSfEiqaRARPBxDfc+ppPXyCH/wK0=;
 b=HjmMehiHienvLjAEBCVfL9rT3MaAYt9346jRrowbLJ9onF58dAY4MT6E3Gv8WKHQnL8nTL7GidPegqmqSBcrBU0rzYrSz1hMBRPHerWW6TLH9VsDtPCiIVKneyqgqm7VQDXPwn4q3MK44Mi2X+M6gs52T8lX3im+8VXlqKlY270=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2787.namprd10.prod.outlook.com (2603:10b6:208:78::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sun, 24 Oct
 2021 01:13:42 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4628.020; Sun, 24 Oct 2021
 01:13:42 +0000
Message-ID: <343a3aa3-cda6-7015-9d81-62d4f5a605d5@oracle.com>
Date: Sat, 23 Oct 2021 21:13:35 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v8 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
 <1634324580-27120-8-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2110221545440.268000@anisinha-lenovo>
 <543751f3-b7c0-b039-64ee-cc902d9b1c80@oracle.com>
 <alpine.DEB.2.22.394.2110230751080.291405@anisinha-lenovo>
 <20211023161237-mutt-send-email-mst@kernel.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211023161237-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0103.namprd05.prod.outlook.com
 (2603:10b6:803:42::20) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
Received: from [10.74.108.226] (138.3.200.34) by
 SN4PR0501CA0103.namprd05.prod.outlook.com (2603:10b6:803:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11 via Frontend
 Transport; Sun, 24 Oct 2021 01:13:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 808e3d0a-b1fe-42f9-d46a-08d9968b848f
X-MS-TrafficTypeDiagnostic: BL0PR10MB2787:
X-Microsoft-Antispam-PRVS: <BL0PR10MB2787EF49D4C48A916222EDEA8A829@BL0PR10MB2787.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BKWm1Or/usvfkXnOtHdaoJsh8Am5ynVAgB30lalg/6shdtG5YHO7OxCSuSW3y7IPtKY0j6j38a12xb6Me5T4WFAWS9iGXZqjGp2XHc6o8UW2HT98LS9bWvldh6qua5TFujIUs+VhF8emDHD0mfCi7UA1OoIh3diISlqp5/31+VZcCmAm9HhCCU8741NqvuIpZWGjgxvkB8xFGnOtoK7CDW5D0xy7S7zNlhyrerFrGibX5uBimm2vqIRkYPOI2oFijbFKLhwi3x1VbBqQSGY8+s4TR5rEwcgUG556YIeU658QmZvSHpvbxdhJ/Hto94CF1u85ZBCLcM+KPl0zz+qqfjgu23RujRyxZhoVSSsrYFgbYxtB6ANtg0aP5DRNOxYUhIfBdqdsAccd4Mh2gKEouMJW+g84s8UL4e+FZCjcfJJVEM+SD9CcivQmkqVg66jdED0aHk0ZEjG2vsOR6Gew5s/iS+5KFA8/N4QLFWIHXUivPDgRJqFPo65JwYuUdgC3A1ML3osLDKGW4i9N1KRZ80Wd+ECezIGjhD75doGaVJmg0QniMZRJZMkNnmRJVNOH9HUr62FkAC/xW/MkPRgAQYEocrLIKv4Uq+NLg63cafBHnVAW6sPvOjM/V3zhjuS0XpuCO89CccZo7dRFQQs6C8DuJjos6YbsjAgH4UhEb5U7oewfp1BLD948WnRN9WXylkyVviL/Z1Y78wm3aaexZv9YAwRsozxu/55vaDSvfHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(508600001)(316002)(956004)(4744005)(36756003)(16576012)(44832011)(31696002)(186003)(6666004)(6486002)(66476007)(110136005)(66556008)(31686004)(107886003)(4326008)(5660300002)(66946007)(2616005)(26005)(8676002)(8936002)(2906002)(86362001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3REc1gzQzd3Sm1Pc2R6aUxnSU1LaG1idFh2a1NsU0tKbUE2dGpjQ1JxNUF6?=
 =?utf-8?B?aE5WTDhNTjlBcThERGlBbmpIbXA0eWtmakNldEo1amJIbnNPVGhPT3dwNkcw?=
 =?utf-8?B?M3prc1NQTUdqcUlObDJkNVAvUSsrZFpJMFBqc3VOeS9Hb1Q5cVpMSmpBWVNN?=
 =?utf-8?B?OVFqZzcyT0N0d1pKWDlBM1lSeUZUcm55Y3VRWUZNT1JSdm1ibVRqOGNpYlZ6?=
 =?utf-8?B?My9WbHE5OFFwVXQwYno2VGlPSjh2UFc5cXdBcFNEMkhrSzk4MnNsQU5TVThE?=
 =?utf-8?B?SW5UeUlWOS9kWGxndzhMQTd0eEtaYTBDc3pGZWc5d1NyczlFcVpuL0IrbGtE?=
 =?utf-8?B?Nm9RN2dmcGRoVHpnRXFHTUplWUR4TGhIVE9FcWVTSVpGRFk0K2RzazVBaE5Q?=
 =?utf-8?B?SXVOajUrM3ozMjRDczRwQ1BXVjREellWbWlid3o0OXlVcjVGRkpTazlBV0hI?=
 =?utf-8?B?d3hlbTdSNFB0TkNLK0lMamVzU2Nnc0lhU1MxWmdUOVR4Y1lOVTBBdjkyZUtu?=
 =?utf-8?B?ZHR1UHRDK2UwTFlqYU5FUTdRaVFHYldob0xVcXR6dDBxTlRKNFRiTGNaeWNU?=
 =?utf-8?B?OVpNT01PRzMyQUEwZ0JMUEJaKzFneEdDYW9Va1lRL21Wbk15NGpFQTBMSHFp?=
 =?utf-8?B?Rk9XYkNTRjI2YmJDQjZkQ09XZ0pDR1ZxOWluSWp3bk1seDNrR2xiT1RSazNE?=
 =?utf-8?B?dmpIWXNYZzNyTSsyeVBRcGUvQlY5eWd2M2R3aEppMGRjYzZIQ0lDQlEyUW1v?=
 =?utf-8?B?a3F5LzJGbHBPeTJSQzZVZUdKR3p4SkJwQzVIMlVlNUFsTlQ0SXB0dGMxL0Nw?=
 =?utf-8?B?TVdJME5yYXZkVzVWb0lQYU9KblN3STVScGZaTTFtVzVmc0tJOXc5NUFxeExT?=
 =?utf-8?B?VDNyQVc1WnRISkpIVHE4aUpsb1BYSlBKaWdBdHBJSWcwUUZnVGVFSEJNUE1H?=
 =?utf-8?B?V0hLY1BFSkk1U3k5eHV2OHBEc0ZWZ1RXN09VRFNCcDBUeDZKbUl6VUVJMnlJ?=
 =?utf-8?B?QmRsTFpEdUtKNUtzY24xa3pScnZERjE4c2tnWVhYTFpzb3dtaXpIWTV0bEoz?=
 =?utf-8?B?WUg5VldMR1N0T2RkMk10R2ROZ3Y5aHovRURIYTIxUDJGWi9nbDlieHJTbERv?=
 =?utf-8?B?aDA4YXdvSmNWZTFMQXpyaWlaOU9pUER2bFpFRklZRitNTC9oaXNEQVZJVjRy?=
 =?utf-8?B?RVhPa1p5RlpnZGtzSzZZQlNUcDV1YzUzT202S1lPTE5MMGJDaEprTGVOL2hr?=
 =?utf-8?B?KzIyVXdtQnVFejk4anEvaHVRaU4rNEM1bm53MEVDNHZuMksyTlJwNm04alMr?=
 =?utf-8?B?alVaUEJEWS9JQytNRGVra2R1MjV1NlRuVkJ4cUlVN09KYmtrL0dhZ2k1VFFG?=
 =?utf-8?B?ZTdkeld6UEp3V1k2Rk9BSWo2WXJzRGhjay82eDIzL2U0aHkzdU8zUDlJL0JO?=
 =?utf-8?B?VFJiZmJoOUhDYW9yd0NyUlZ3NFczRExUNXd5Ui8vVm1jK1ZWakRJblVhOEJo?=
 =?utf-8?B?cjRjUnprbG5peE1scENQb3p2UlMxNFpXaHhsT0d6SkdYcExNeGpnc3BhWXZ6?=
 =?utf-8?B?cUdMRzRQYlZ4WTdvd2J1VDN3d1dFVVV5bTU4bDJvd0ZodE1Vd2krQm1uaTNW?=
 =?utf-8?B?ZVNLUDdzT3ZpR29MRDRVY0FVdEl4Z21MUlE0em93VWIzWTNPd3RxRUpzVlZE?=
 =?utf-8?B?N05XN3U3SFUxNmRVQVRPWGRjL0lVY2JUTjhJZDZnNzRSSGFUTHFOaytHZGR5?=
 =?utf-8?B?WmpKOXBGRjFIQXlPSnZTaGE1d2xlTG5nR09uY3l4M3pQRU1TSmhMYTRjOEc2?=
 =?utf-8?B?K0FIUEdmeWtSY2xPVU11WTlRaTBqZkU5K1p1U3FzM0g0UXRuMGdZL3pWOVl4?=
 =?utf-8?B?RmhPU2NKVmE4YmMyRGlVUHQ1bE0yR2QxY2o1Z0tuc0FYWFpud0s5Yk8wMDlP?=
 =?utf-8?B?ZXVVb2piMEllRFkyNGMwRmdIYWVzQSs4ODBYNVZEYmpJc0o5K3dXZVdoa2xh?=
 =?utf-8?B?Y3JZeHpJOXpoYWhNUkp6OFBoblRXUFl6ZFdJVk12OFRrTy9ndzdrTndRcWww?=
 =?utf-8?B?U3pFdVMvMUZ4OTNHQmJydFMyZzNydksrQW1aMHo4M29RTjJNSFZHemt5dGQz?=
 =?utf-8?B?YTh6RXRVT2hnUnBUdEpLR296b0tUd2RuR1NVYUNud3JRc0RHSG9BVnA3dXFq?=
 =?utf-8?B?UjlvRW5kNW5nT3YxOW00YlVPNzJ0RmpLV09oYVQ4bVZFTU90dFd3VGdDZFAr?=
 =?utf-8?B?ZkJKd3FYaFhvak9jSEtzM0hYRlRRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808e3d0a-b1fe-42f9-d46a-08d9968b848f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2021 01:13:41.9768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jb2NPrZ7RlWybCyD9YhcuC2BOoOXsmReIEZaNVMbq+A5UFaHv+/35xzbgJ+PxwOYv7wS9WewD0e1UrOalQy73sduPKejRRsQO77tAfy0I7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2787
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10146
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110240007
X-Proofpoint-GUID: joOBhqswz5sCyz8QeFKt8D8YtFHQJBuM
X-Proofpoint-ORIG-GUID: joOBhqswz5sCyz8QeFKt8D8YtFHQJBuM
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=boris.ostrovsky@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.781, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 Eric DeVolder <eric.devolder@oracle.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 10/23/21 4:14 PM, Michael S. Tsirkin wrote:
> On Sat, Oct 23, 2021 at 07:52:21AM +0530, Ani Sinha wrote:
>>
>> On Fri, 22 Oct 2021, Eric DeVolder wrote:
>>
>>> Ani, inline below.
>>> eric
>>>
>>> On 10/22/21 05:18, Ani Sinha wrote:
>>>>
>>>> On Fri, 15 Oct 2021, Eric DeVolder wrote:
>>>>
>>>>
>>>>> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
>>>> I do not think we need to include this for microvm machines. They are
>>>> supposed to have minimal ACPUI support. So lets not bloat it unless there
>>>> is a specific requirement to support ERST on microvms as well.
>>> Would it be ok if I ifdef this on CONFIG_ERST also?
>> I think we should not touch microvm machine unless you can justify why you
>> need ERST support there.
> OTOH why not? No idea... CC microvm maintainers and let them decide.


I would argue that ERST support for microvm is in fact more useful than for "regular" VMs: those VMs can use EFI storage for pstore while microvms won't have that option.


-boris



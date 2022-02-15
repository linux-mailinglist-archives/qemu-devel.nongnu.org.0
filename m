Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7934B74D8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:52:27 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3sA-0002NN-F3
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:52:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nK3nH-0004y8-Sn
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:47:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nK3nF-0000v6-CM
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:47:23 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FJWvN8026636; 
 Tue, 15 Feb 2022 19:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=L5yJQ7GsCW14BHW7Jc1Elbo33GaxAr4GW4RLbWZdkoQ=;
 b=JFvLwzI5vRtFBZVOztKxBvKFBscMSCJJuuIOZFzdzHmv+aBqBEOsEjcZzjTwgxi9kbui
 SsaCNghT3LwdcCBcy1kuO+nN5/JYVemHUZQ9P2MzXPKe2YPpTFK7WkQDGCOM3VIVtGru
 jz/7Z0uq6DMie56cAlooTa+6V31fMyAxDwrWQNMSSz7lrcYvT3gKMzMqDFnO9rop/yNY
 texrv+f8jJpYEfsonuhCKZFiR50xa+9Ydq1JvmtW/rDNehs/DLwXfXrRHGh0IeI3Dfjp
 +Bn7RVez+8WReW+g1mV79SUBHK1fruYtzhMrQSd53W6Ryai0iUc7yhmQWr/wRbotWOG8 ng== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e86n0jgy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 19:47:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FJjCQm091683;
 Tue, 15 Feb 2022 19:47:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3030.oracle.com with ESMTP id 3e620xhk1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 19:47:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZNXnSI9T63C9D3YxoKgARMqM2+2FMIMo5z9PtCuRnbczBvK01/hNjiKtaD1XWHkOTKw4McAj7gSiEnJLBqmBThyZ2qZXWRSalAMkw++CVYuDBSUiSdhoo5aA96EGSZJ7ohKVIWjphhYdPdRaWPzoo/XyLV8mlWJUmyD25oMFHMsAHn6TLraru41hIRY5wS0ZsbRn1VyOejiHSkW2p9ekB6a7mtrDKndis+LtFld5XY++MgPIA2VRe3GxXD/2u6yMZvG2g4b/bK88S0Y10JusetGtFCc4aKc2z+lxPZzUd+lwfSLGj6H0VwM0bws8i4rqUw1EOGxcpASYBIxt/zWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5yJQ7GsCW14BHW7Jc1Elbo33GaxAr4GW4RLbWZdkoQ=;
 b=EY3ueq3FEr3TUR8GWIqAKbmPHvhiYo3s2IPb+YvivxkQTTIGBRlXAA4gEbimkXjhJ5ZzxJpwKTK4bzMrIuXl/52AOglSMeQ0R2nTvBuZZsI8HuKfwQrp7JetplRok44JD9b0NUCkC/kGE628V7bNJ/+fGfygfODb4nbt3gBxl0TaRqQ2Fyc/3aGIRiViNzkuHu83wP/vhMpvuJRxoNSDFGMg/TD1mP9Tf9P39WYdq7JX74axAyDmpT/C44r5/JlrKDdNqMSJO5Yy2RimfgF0csZz8da6hcTLx3k1FJTPbjO225ibk11SjE5YDqWpExg0CIrSUDdHrhrejKRbYWO10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5yJQ7GsCW14BHW7Jc1Elbo33GaxAr4GW4RLbWZdkoQ=;
 b=Oq7TsZrTZvuNh3mAh5J3SRN2Wksx67H6hjx1YlFM3apwpa29GFctO3kwAfnc4bwgxKBkrO6Rr4LE9eP1/OOs8SJr4DlIkzRQuUm3dYAhfdHvKb0kzt0KTBmWkUn2YTQnzfq087McVV7blg8krty0FmMwy+iOY9Yd4SYi5Krp8Sg=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by DM6PR10MB3657.namprd10.prod.outlook.com (2603:10b6:5:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 19:47:07 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::44cc:8f20:8421:4721]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::44cc:8f20:8421:4721%3]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 19:47:07 +0000
Message-ID: <57368d7e-ac54-028f-729a-771254e6f77b@oracle.com>
Date: Tue, 15 Feb 2022 13:47:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] docs/acpi/erst: add device id for ACPI ERST device in
 pci-ids.txt
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220215152351.127781-1-ani@anisinha.ca>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220215152351.127781-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0056.namprd12.prod.outlook.com
 (2603:10b6:802:20::27) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55fe42a2-3142-4f8b-638e-08d9f0bbf2ae
X-MS-TrafficTypeDiagnostic: DM6PR10MB3657:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3657FA9FE94E586FB7774AE997349@DM6PR10MB3657.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ag11qwvlDi1QirDLGEK+BWsuA7iYsi4g5qc3mockSF2Y78/AogqoF/EqpGjaX3wtJxuZzleTf1g1wjPtQh7B1aWtBckE3b6+MCskrntdQok3wIRxam6eWSUf/2Gy33GqprV9kaqCTB8gAIQDEvHacb1tKsoAg1U7lQt3U4kCCVfqZWsbmpoeFTQs+veqnBbwVhPfyP8rR5uFabSKQpU4kRZ1nRJib/1f1HvDvrLLcPfJStNUSaqRFhQTiijjJrAxb2wSZXms4IvIwrHKuaKoDJqAeP4rhDJALRmRrG1WNYhbUTJMoXErajrOUuStFqMg76mIwel87vSecVqp6AFdIuyJf2oOMfcoLY7tXKpIhcim431ABn9fElrNbDGzwxTEkoyr493tfalEosv+TC0lRVGnjt9icv6/1HDftPZQ0wXclZ+R+LDTHtvxigUSmkT7lrw3GekpxJyk22gKgP4Ns3kSrZVqgfwzCmk33rLuYqmRwa7Y11l690BFKJosJ/gAr0ZU4WqpmlVruKv3mBILomTEhe9qKNfIEiJmDAIxrWknQkDCwBwqwuwlnKm+vfYnQrbV3edMeyyBg546bYqRu1C0zrXD94NzVe5wBODf4qTPGmtPaW+3yiNMMHHqlD5q18AzPmmbfa3mRQxqTsjHSl9EcrcUcZWnSVnmO2Xym1Ka6wDGpmcIYH34Ab7XwMFeuHvjWugN/gnSWwubvGYWqzser6Kufc1gm2hORXP/dNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(86362001)(2906002)(8936002)(31696002)(186003)(38100700002)(6666004)(508600001)(2616005)(6506007)(6512007)(4744005)(53546011)(66476007)(66556008)(316002)(6486002)(110136005)(31686004)(8676002)(66946007)(36756003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGRNS1lvZXhKZnBISXRJN04yc3p4V2VWUGJqaHJweGs0cG56cVhha3hsQ3JC?=
 =?utf-8?B?MitpYUtZQzBQUDJQMzZzdE9NaklRb1RoMWl5eHFOaFY1aWovUlV0NHVhYXRk?=
 =?utf-8?B?UUNpY1NtNks3c21pM1VWTXhRUWlxS2J4T2FoSGlTRU1LL3V0SHlZQk5jODQ0?=
 =?utf-8?B?bUdHSm81aGxsczhLb0dXdTZhUkRud3FhN0N3YnNmK0VLd3dZWlRuNVBWM1N3?=
 =?utf-8?B?cU9HS3lhMmZWWmpjWDE4UGZRYVhBMzNFb0oyM015ZTdaVWtLRkQzbXhVMmJS?=
 =?utf-8?B?K2Q0eXBoVGJFY0NqS05UMnBoUU5yQTdqbUJERkkvRmhVa2pwRkpVTUxRUDlT?=
 =?utf-8?B?Um1mQUZOMFpKNURpTENzMkp4by9KQVFIYjNBVG1vUUdxa0RQdFY0TFNubFRs?=
 =?utf-8?B?SkpJTktQZjBHNUpRekhyUFdUaXV4UVIyaXk0clFWczkrTFlHVEw1Uy9sVEZN?=
 =?utf-8?B?ZTlHRDhlR0dRbG83Tng2dXQvNEV5eUNVMUN6dlhFbXp6RFNwQU5xUXdMWjBN?=
 =?utf-8?B?eERGUVlhV3JlbGhibmtCOFdzcEpFQXpkaGVkRjVWd0ROaktpVUptT2NWcCtz?=
 =?utf-8?B?dTdUWmthNDF1NHhURUkyS3JMOEE5VDZlYUd3MnhNeG5YQ2ZzaTd4aytlYVpw?=
 =?utf-8?B?N3pYcElEOXA5ektoeExyWjZsVWROZ2tDSjdSVFF3bTZiby9qdUZPN3RpRWYx?=
 =?utf-8?B?ZmczWFdlREZUcWZrVTBXQ0oyMmRiclhNaDlLNHZteTdoQmp1NTlrSzM0b29E?=
 =?utf-8?B?Rk5UalA5enJiZnpDSGp5S2pGNjdpQzJwaGlFUm5JNkhBcTlRTzlDSVQwbW9B?=
 =?utf-8?B?Z3A5WkJScVFVUXh3ODNDcW5hZU4rUXN0RXVUVTE0cjB0OEYwY081Z3JycDd2?=
 =?utf-8?B?V3U2dXpRNFBESk1hQ01rTUc5RGx3MmRPUnBoak1ralB5UkJzK1A0clhlZ1pB?=
 =?utf-8?B?bk5aNlEwY2Q4ZWw5c1c1MTYyUU5jaDdiTG14SVFUM1NJL21kYmp3bGtodGpY?=
 =?utf-8?B?bkpHellYQ24wUldnZll6cU5FUUQxUTIwekxhRUlDSUROSWtJeE1qbmluSzh5?=
 =?utf-8?B?a0FyamswWU05RmUvVm9sdUlTQUgrUmIzaTV4MDBmWlphTWFsQlZXc2RsT09s?=
 =?utf-8?B?b29paExHZTR0WjlhZ2xTM1FJcWFiT0QvaEpycW41S0hKZlNCNFhpZVZKV00z?=
 =?utf-8?B?Y3p5Vk1lRlJtRDJFVytuL3owVDlBYkhCaFZsNXRYOUVTdEdqakh4Y3JoSFd1?=
 =?utf-8?B?NFdRZEx3alEyNmZhWDJ1Z3NlN2ttb0RqLy9UOG5HZ2JtMFV5RnAvUXpuK3FS?=
 =?utf-8?B?c0JyQkpTNEtwTHRrZ09xVFpsbGJaTm1wQlNHcHVJd05sbDJicm9tckNGZ0x2?=
 =?utf-8?B?QjF6bnZ0NXlIVWpHOEF4NE0zQytPdk5yZ0t3cU9VTEN4Q1hqZjNudExTVEg0?=
 =?utf-8?B?MkFMN051TFoxVWdaNW5QNmJqcEJHbU00cUJ0Q1ByR0lNL3ovYWFHWkUySEtD?=
 =?utf-8?B?Z0d2S25pV3FXdlFmK01XSmhCR0paYU9xY0ttVUNUQ0MydFk4RjJmZlNYc2p0?=
 =?utf-8?B?MHd6dGx3VVp4a1U2K1I0VWs1YlZIT0pOV0owRkQ4Q2JMTDNJdDQvQ1RMaENp?=
 =?utf-8?B?RTg4OVcwNHhzbGVSRFBCNjRSTWpvRzdNS1VLYnQrSGdsSlMvTTVQaHNSVFBr?=
 =?utf-8?B?YVV3TzlMY0Rpc3l2ckE0ZktqbUhlRzlKdExLNVAxWmZrQkJLWDZOQnI1VXhx?=
 =?utf-8?B?eUxvYmZ5NXZtWXR2ZXcyMmp3RUc5b2xJY2hYVWRxaDh0c2RyZmZrV3czWTFv?=
 =?utf-8?B?N3NvY20wd0lHV2MwSFp2V1BvQjZVbnV4d1lHTkFNOWk1VnowdlpZOXVjTXl3?=
 =?utf-8?B?N3dnRDdLdUh3bXNvQm96cFBDaFFsd1ZhUm9LeFl6VnhXa0dIQ3dscTBPZ0Nw?=
 =?utf-8?B?S2FBelUyTEFEcGZWWkRwaFFvK29CU1hGNlR4dmg3NjF5K1pERnI3UzVHc0Nx?=
 =?utf-8?B?MS9raUppNm0wWC9HaW1VZjhvNlQvaHRLeHgyZVlsaENyQW04VVZRWVViV2FN?=
 =?utf-8?B?ZDRVQ1dWY0NDNTZhOHhVWlB1Nnh1RVl0bHgwakVjWE92Ly96QVAvVjBZVVRV?=
 =?utf-8?B?WFBJMlZjOHM3WGx5elZaSGdRTXBydW1pY2NlM0g4a2F5ak5iOWx6N3pLMzdS?=
 =?utf-8?B?MEttY21FcG4rVjQ4QXcvZkRadStyNWUrcnRuK1psdEdrNGhna2MrbmI3dGFI?=
 =?utf-8?B?TWZ6OFB2dm5OQUs2M04ydytId0VMLy9rVENhNTdTOVBGemt1NHVYbU1QbDZX?=
 =?utf-8?Q?r2Tb3x6gj8GOOfG7nz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fe42a2-3142-4f8b-638e-08d9f0bbf2ae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 19:47:07.2434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFSWd3Nggz8KaEwzxfSgPbIfvbS7Wh8X/C68BnviR/zxVC8AyidB8Krh/EldnA8odrUziZWkOlbCdU30aUjMazEWEJQ3sdTk2pMwFxbeAOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3657
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10259
 signatures=675924
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150115
X-Proofpoint-ORIG-GUID: 3xyNLH5D0uvKVQhg3hktp52XQbA2WJcG
X-Proofpoint-GUID: 3xyNLH5D0uvKVQhg3hktp52XQbA2WJcG
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/15/22 09:23, Ani Sinha wrote:
> Adding device ID for ERST device in pci-ids.txt. It was missed when ERST
> related patches were reviewed.
> 
> CC: Eric DeVolder <eric.devolder@oracle.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Thanks!
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>

> ---
>   docs/specs/pci-ids.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
> index 5e407a6f32..dd6859d039 100644
> --- a/docs/specs/pci-ids.txt
> +++ b/docs/specs/pci-ids.txt
> @@ -65,6 +65,7 @@ PCI devices (other than virtio):
>   1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
>   1b36:0010  PCIe NVMe device (-device nvme)
>   1b36:0011  PCI PVPanic device (-device pvpanic-pci)
> +1b36:0012  PCI ACPI ERST device (-device acpi-erst)
>   
>   All these devices are documented in docs/specs.
>   
> 


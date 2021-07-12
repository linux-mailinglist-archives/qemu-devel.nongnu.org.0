Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C793C6193
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:10:40 +0200 (CEST)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zS3-0004Ks-Md
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zOw-0008T6-P3
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zOt-0005gq-Tz
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:26 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CGvIgc001832; Mon, 12 Jul 2021 17:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Jq6FbPMgZDd9bE3rniUH3Ij8Nf7tX4coWeeTM+6N3Ag=;
 b=QaXg2Wu03d92wgHD2L+4MyzoGLVtl47bCCVk9tA+jc37AGOJasVk6im9ieGfu77dvsvZ
 8XqstFHm3JOdXIkFJmz2Mg4R+hYomMp8JKVcyh3STAPV5UzA7COmEMqSwpxeG189wUdU
 JQ/YXyr4eHXV+SMC9C1fGTa5NbD6BtmQSTxuVz2J+N8fzWenOhszBGOFXuZdEVefIyUh
 +hKkbQpMwsP5g0DRCuobUuGOioy0mnUvvjjW4kyp2HvZbSPdOmf12ybfWgVqUYHbRLfi
 pKCaSezxDquOJCX0VlDfQWZ4P2+uGlvnVNos5Doj72ndeKk3GPGJ8XLxGJH5ooGc5Z1q kg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rpxr8gbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CGstYF143197;
 Mon, 12 Jul 2021 17:07:18 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by aserp3020.oracle.com with ESMTP id 39q3c7x99u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSDJZGLqklWNZQ7BoJrsEFpNcIA3ov6vJTp9y1AqPI/d4glTtCBtc37QD0sVr7ZxDEE/RTNk28OAc5X1TBpvpIRhLMFyHeMkWBryNwHpBFyw0+WBuMqjXUocKBfRN0hQagd2gyyon2we9Z7X2nGWDilrG+Cm/X7bi44kX4TN/HeViV8FBYyojl2IUzPQG3x/SNQZQ0JPydRQUh27o/sVQqBsdVMF1HzYOL41YIPxFj2cdEyYmHSLCVMbPVYB6kdi703eyfsJhzwZBtH1GqnVbxTjLNX01HFhwD911BSMg6AaEoNoUTBt1CLnQbvWwFrkWdiTxVidI+X83vMphGH8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq6FbPMgZDd9bE3rniUH3Ij8Nf7tX4coWeeTM+6N3Ag=;
 b=ByZmrL6tcQm8lN64pp13e5DFnlapWNneSyOYtGo9UY99A8bkLpKMSwKo+DPHPxpI8LpyDKJ/OhpE7s2B2vNgLCUBg7iqu4E3AxtZfHZrHMKsGvObE7bXOEYq9dtH6fPPy99J7pZiLclunltvA5JoE+PZuH0+FD0Gu+ANiz42/suU7vk9Ihkd0cA/g/gQy5POcLCJVkBwi/crPmE4/PBDkQmKd2qXcKIA1k9kmfsQdGaRtJMOC1hvmrrMU3q4Nf1AnvtpNGE6odPIYuUptYtc7cskFhX9E3PTl+d/50fccXt6XDSUnbOfpVbPYqskfBSqa6gampAiWT3bs7YEVj8+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq6FbPMgZDd9bE3rniUH3Ij8Nf7tX4coWeeTM+6N3Ag=;
 b=N++4ll11h3JUKXUBPtS5S0nO2SH1EXDeF2C+7nB7QVZxQmgM0A58F9Iwj6qK+ph4jYq1yksFtP9x4pGzUZDYjn/LRwej8iLa+23NUCGdb7sR8QIJcaCx1AjjUqRtfogpgtNPCyKTByrZ0/Mo++IiVLBc+wAedqLJq/fijJF7d7g=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3479.namprd10.prod.outlook.com (2603:10b6:a03:11a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Mon, 12 Jul
 2021 17:07:15 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 17:07:15 +0000
Subject: Re: [PATCH V5 02/25] cpr: reboot mode
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-3-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1C+9+V+JzQd7r9YiV=D-hSw0ha=9qs71qJK9ZY2inVs-cA@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <3121bc3f-2ea4-833a-eb18-74ceff633903@oracle.com>
Date: Mon, 12 Jul 2021 13:07:11 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1C+9+V+JzQd7r9YiV=D-hSw0ha=9qs71qJK9ZY2inVs-cA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:806:27::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SA9PR13CA0142.namprd13.prod.outlook.com (2603:10b6:806:27::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.12 via Frontend Transport; Mon, 12 Jul 2021 17:07:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fcb4319-843b-4907-4e0f-08d945577f92
X-MS-TrafficTypeDiagnostic: BYAPR10MB3479:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB34796700CE97132DDFDB33D6F9159@BYAPR10MB3479.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qLURIW5sfr6jjBZf1jKL5B1wEBEesIlkys5Yv4yOil/kJCIfl7PIkQLcRoPC5SFwYzgSemAZ5PfOPs4aEcHFnhy7aPmjH+sMjnVkpOeajZ5IUSW9AbK5FNiHzexP/PEPmNsEA4so+TljRa4REzTxGq3GsK+9qDDwvCtU9OVpslFfnK8IwLdS/P6Pwc3l8+uS4Oekq4dvuOx1dMkAJPvuSqSjZ0G7yCcqGqbS70vIVZW76GGQ6ktxWTGM7U2I1ad/fbyqla69xTasgZxBtiS6tjHRkCefu4/4d+uAQ8dxTy5S3iMrfUQ3lKlxWRLtw0isvju/I+X+nQjNtxVhI9TVEf1UktkdQaj2S9MJnMxqh0w/jCJ2xDOSGKYRXCgPZk9PY/NxDQfblvRPS4MoCcuf3KNVyTKUL08gEF2QjKTC5M9tI/S74bAOSse8PwCOajkUM/xzdBEQyoT6iJlS1QmKXA2mhshH5qBn82N7+iq4Pab0c2aBZ0JQLEXGd4pmaNSOLuP679p6wJOfkeasgbsADSNVjdBrCPUn09qDQz4EFbJtC54Sr7q9OddfJxLbLxagwxnU8sQBuE6/mibTLsIbRRwcIfyPATgqGzWYGOB5xJgv43gW+T6yX4JxktSAy6th1mBaoAMDtlkU2AuxfBrZ4sgksS6/WmRCvPuA2YSesDKf/MME6V2V2utdEN7iY9R14R/FBAktpCjR/iojwLCNuSPjaqvH4YEbNRNh8kNy+pg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(396003)(376002)(366004)(5660300002)(186003)(86362001)(66476007)(53546011)(66556008)(31696002)(66946007)(26005)(36916002)(36756003)(31686004)(83380400001)(6916009)(6486002)(316002)(44832011)(16576012)(8676002)(478600001)(4326008)(30864003)(8936002)(2616005)(956004)(2906002)(38100700002)(7416002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTZSc202cXRUaFFFZkpOelZROThJN2w1Q1A1ZHpGMmVBdVhKT3R2S0lQWHV5?=
 =?utf-8?B?R0NreEV3bzZERGZKdDhtYVROVjRFRFBLb05KQkdOTE0vcGFtcm9QQzVJOVg0?=
 =?utf-8?B?aHpNT0ZxTExzSHYyVFBmK1BCclBXak02M012SzBrd2ltRWJkVXpzNWtjc3NS?=
 =?utf-8?B?L2QycEVYQ3l5bU8xT1lnWUtUQVdlQ0dlaTJpVldGL0VhRmtwejR6Q1c1K0Iv?=
 =?utf-8?B?Qk5pMU1vSElUbWhydHkvWFdqaFNFZURPOHkwRUZsM2Z2QTNlcmo5dlg5MXh6?=
 =?utf-8?B?eGppdEkzWHFMbmJQSjFMalU1YjNvTGFNckNTOWFhWm8zdGgvZldEaVFSOXoy?=
 =?utf-8?B?VlVUMWpxNi82SGJDVlRYbjNTTkZnRmdyOURjN2dHeDE1TENyYlR1Wll0cnpu?=
 =?utf-8?B?VnQ0d2czenlOK2VJOWplY05GU3FSb3RJWDVDZldVU2NDcU9ENXdpN1hVRG14?=
 =?utf-8?B?YWxhWERMaXMvTE9vR3JQa3Y4c1IwUTF2dzVnKytoVlY0akxBalpBMTdoYXBC?=
 =?utf-8?B?cFhLY3ZqNXNuZk45dUZyeE1nMnNxeTM4R21DY3p2SkRYSmFtY2pKNkJoM1M5?=
 =?utf-8?B?MnEzNzlNbmZVc1djM0s5WjU5c1N0V1F6Zk9tWW5RU2tTOVFEalhHcTVEVWhO?=
 =?utf-8?B?WjdBS3M5cVBoQVBFZ0F4eG9TOUZRaW5aQnd5Mlh6M0ZxN0Q2dUVWNmRoaXYz?=
 =?utf-8?B?YnAwL2hmbU90ajFRelJ2QjF1THhxQnBYU1BVY2xWci9vVlQ4UzkyV2xYT1J1?=
 =?utf-8?B?RkhlRE9OZWJ0RFc3dkFXY0NHK0drY3MrcUhQdllQUGxIU0RlaUcyQUxUbERD?=
 =?utf-8?B?ZGZPVmhOQ3ZrK0RRVHpTRVBsbEJ0eTF4dEdJSXZ3bVRRODAwOXNXOVhVUlox?=
 =?utf-8?B?dXVuMG1IQzlqak04WU5oMFVOa0VrZVZIdHN6ZHd1TFhvcHNUMFMrRHhiMDZn?=
 =?utf-8?B?UGdOb1k4cndSMzVoWFB1Wml0WUZLa2ZldlNUc2VPLy9lVmk1MjhKTWkzM2ht?=
 =?utf-8?B?clJ5ZWtSOFRDTmo5RGltbEswbTBpcDJ1cWJWRG1vOURlc2JRZERiaXNwdFNx?=
 =?utf-8?B?K0RNckVVdjZSY2l0R0VXbXZRWjdrbUh1bE5HZ0hwQlhNVHl2aGJUQ1FMeGhC?=
 =?utf-8?B?bDdoamhXdmhRaGhwZVZGMmlCZENpZm4vY2hFUFIzYUF4T1k3SjFoQlE3TFU2?=
 =?utf-8?B?V3JId2hjVEJWNi9JZkE3c005bjhWdXEzWHpleU8vWG1GbXhTdXZ3OUpXSDkw?=
 =?utf-8?B?Nkd2WlhzdUE2cDJrUlF4OUxuK0J5TDE5TXl6VUNIMlY1QjlseVc0QjZkam53?=
 =?utf-8?B?VmRvbGkrQUFZdXJxd3pESG0zNmRGbG5qbi9Za0dRZ1ZWSElDTXdKWmdrbC90?=
 =?utf-8?B?TnRvSmNyNDRBb0o0YUVWYlVyaWVPQzBJcDNpdnViYlZXQ04zQUg0eGRRdjcw?=
 =?utf-8?B?M2ZraUJjcXh0RFA1dHZnbVdNRDUvZXFmRC93dTVwN1FCaXV6Y29kOFR3Wjcv?=
 =?utf-8?B?S3FWYXlVVTRma3c5TVloR281OCtFWVY4TWZTc3RxMWVJb0ZNeDRzTnRrYXIr?=
 =?utf-8?B?cFliZGJLQTRYN3BRdjJiZEl0Z2s5RTdhWlJuOFErS0lEQ2RkeHFpZTlvZUZ6?=
 =?utf-8?B?bVBSQm9kMEtQNFdWQUtZZnJtUzcrRkZrRVpBUzVGeGY2b1QrR2ZuVyttMUxs?=
 =?utf-8?B?UDJIdmk0RGYxZnB1bFRQU1dRNVFnWisrWnJaUGRFREkwNE94RlpnekljNWkx?=
 =?utf-8?Q?RRW7oxrm/r6DibJZlgN7emCokiDO8lQyOq2rkZH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcb4319-843b-4907-4e0f-08d945577f92
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 17:07:15.5821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWkG9eOqb63RYZ1d6LyzPpJNMZimVbWVk/u650iLRakYngNC7nsqAjCna9FgSYtVdq9mmYD3W7sSAalEnHtJwFB3Jda+DSdMh1uzLQuOrZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3479
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120126
X-Proofpoint-GUID: LZhzsn_fOAQ_5_3ZcansyzlHpj2vzO7i
X-Proofpoint-ORIG-GUID: LZhzsn_fOAQ_5_3ZcansyzlHpj2vzO7i
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will do for all - steve

On 7/8/2021 8:25 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:45 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Provide the cprsave and cprload functions for live update.  These save and
>     restore VM state, with minimal guest pause time, so that qemu may be updated
>     to a new version in between.
> 
>     cprsave stops the VM and saves vmstate to an ordinary file.  It supports any
>     type of guest image and block device, but the caller must not modify guest
>     block devices between cprsave and cprload.
> 
>     cprsave supports several modes, the first of which is reboot.  In this mode,
>     the caller invokes cprsave and then terminates qemu.  The caller may then
>     update the host kernel and system software and reboot.  The caller resumes
>     the guest by running qemu with the same arguments as the original process
>     and invoking cprload.  To use this mode, guest ram must be mapped to a
>     persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.
> 
>     The reboot mode supports vfio devices if the caller first suspends the
>     guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
>     guest drivers' suspend methods flush outstanding requests and re-initialize
>     the devices, and thus there is no device state to save and restore.
> 
>     cprload loads state from the file.  If the VM was running at cprsave time,
>     then VM execution resumes.  If the VM was suspended at cprsave time, then
>     the caller must issue a system_wakeup command to resume.
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      MAINTAINERS               |   7 +++
>      include/migration/cpr.h   |  17 ++++++
>      include/sysemu/runstate.h |   1 +
>      migration/cpr.c           | 149 ++++++++++++++++++++++++++++++++++++++++++++++
>      migration/meson.build     |   1 +
>      migration/savevm.h        |   2 +
>      softmmu/runstate.c        |  21 ++++++-
>      7 files changed, 197 insertions(+), 1 deletion(-)
>      create mode 100644 include/migration/cpr.h
>      create mode 100644 migration/cpr.c
> 
>     diff --git a/MAINTAINERS b/MAINTAINERS
>     index 684142e..c3573aa 100644
>     --- a/MAINTAINERS
>     +++ b/MAINTAINERS
>     @@ -2858,6 +2858,13 @@ F: net/colo*
>      F: net/filter-rewriter.c
>      F: net/filter-mirror.c
> 
>     +CPR
>     +M: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     +M: Mark Kanda <mark.kanda@oracle.com <mailto:mark.kanda@oracle.com>>
>     +S: Maintained
>     +F: include/migration/cpr.h
>     +F: migration/cpr.c
>     +
>      Record/replay
>      M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru <mailto:pavel.dovgaluk@ispras.ru>>
>      R: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.com>>
>     diff --git a/include/migration/cpr.h b/include/migration/cpr.h
>     new file mode 100644
>     index 0000000..bffee19
>     --- /dev/null
>     +++ b/include/migration/cpr.h
>     @@ -0,0 +1,17 @@
>     +/*
>     + * Copyright (c) 2021 Oracle and/or its affiliates.
>     + *
>     + * This work is licensed under the terms of the GNU GPL, version 2.
>     + * See the COPYING file in the top-level directory.
>     + */
>     +
>     +#ifndef MIGRATION_CPR_H
>     +#define MIGRATION_CPR_H
>     +
>     +#include "qapi/qapi-types-cpr.h"
>     +
>     +void cprsave(const char *file, CprMode mode, Error **errp);
> 
> 
> I'd rather use "path" or "filename".
> 
>     +void cprexec(strList *args, Error **errp);
>     +void cprload(const char *file, Error **errp);
> 
> 
> same
> 
> It's recommended to return a bool value TRUE for success.
> (see include/qapi/error.h)
> 
>     +
>     +#endif
>     diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
>     index a535691..ed4b735 100644
>     --- a/include/sysemu/runstate.h
>     +++ b/include/sysemu/runstate.h
>     @@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);
>      void qemu_system_suspend_request(void);
>      void qemu_register_suspend_notifier(Notifier *notifier);
>      bool qemu_wakeup_suspend_enabled(void);
>     +void qemu_system_start_on_wake_request(void);
> 
> 
> I suggest introducing the function in a preliminary commit.
> 
> Also for consistency with the rest of symbols, use "wakeup".
> 
>      void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
>      void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
>      void qemu_register_wakeup_notifier(Notifier *notifier);
>     diff --git a/migration/cpr.c b/migration/cpr.c
>     new file mode 100644
>     index 0000000..c5bad8a
>     --- /dev/null
>     +++ b/migration/cpr.c
>     @@ -0,0 +1,149 @@
>     +/*
>     + * Copyright (c) 2021 Oracle and/or its affiliates.
>     + *
>     + * This work is licensed under the terms of the GNU GPL, version 2.
>     + * See the COPYING file in the top-level directory.
>     + */
>     +
>     +#include "qemu/osdep.h"
>     +#include "monitor/monitor.h"
>     +#include "migration.h"
>     +#include "migration/snapshot.h"
>     +#include "chardev/char.h"
>     +#include "migration/misc.h"
>     +#include "migration/cpr.h"
>     +#include "migration/global_state.h"
>     +#include "qemu-file-channel.h"
>     +#include "qemu-file.h"
>     +#include "savevm.h"
>     +#include "qapi/error.h"
>     +#include "qapi/qmp/qerror.h"
>     +#include "qemu/error-report.h"
>     +#include "io/channel-buffer.h"
>     +#include "io/channel-file.h"
>     +#include "sysemu/cpu-timers.h"
>     +#include "sysemu/runstate.h"
>     +#include "sysemu/runstate-action.h"
>     +#include "sysemu/sysemu.h"
>     +#include "sysemu/replay.h"
>     +#include "sysemu/xen.h"
>     +#include "hw/vfio/vfio-common.h"
>     +#include "hw/virtio/vhost.h"
>     +
>     +QEMUFile *qf_file_open(const char *path, int flags, int mode,
>     +                              const char *name, Error **errp)
> 
> 
> None of our functions have qf_ prefix. We are not very consistent with QEMUFile functions, but I suggest to spell it out qemu_file_open().
> 
> Also, it should probably be in migration/qemu-file.c.
> 
>     +{
> 
> 
> I'd ERRP_GUARD on every function with an errp argument.
> 
>     +    QIOChannelFile *fioc;
> 
> 
> Let's not miss an opportunity to use g_auto
>     g_autoptr(QIOChannelFile) fioc = NULL;
> 
>     +    QIOChannel *ioc;
>     +    QEMUFile *f;
>     +
>     +    if (flags & O_RDWR) {
>     +        error_setg(errp, "qf_file_open %s: O_RDWR not supported", path);
>     +        return 0;
>     +    }
>     +
>     +    fioc = qio_channel_file_new_path(path, flags, mode, errp);
>     +    if (!fioc) {
>     +        return 0;
>     +    }
>     +
>     +    ioc = QIO_CHANNEL(fioc);
>     +    qio_channel_set_name(ioc, name);
>     +    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
>     +                             qemu_fopen_channel_input(ioc);
> 
>  +    object_unref(OBJECT(fioc));
>  
> With g_auto, can be removed, and value returned directly.
> 
>     +    return f;
>     +}
>     +
>     +void cprsave(const char *file, CprMode mode, Error **errp)
>     +{
>     +    int ret;
>     +    QEMUFile *f;
>     +    int saved_vm_running = runstate_is_running();
>     +
>     +    if (mode == CPR_MODE_REBOOT && qemu_ram_volatile(errp)) {
>     +        return;
>     +    }
>     +
>     +    if (migrate_colo_enabled()) {
>     +        error_setg(errp, "error: cprsave does not support x-colo");
> 
> 
> Remove error:
> 
>     +        return;
>     +    }
>     +
>     +    if (replay_mode != REPLAY_MODE_NONE) {
>     +        error_setg(errp, "error: cprsave does not support replay");
> 
> 
> same
> 
>     +        return;
>     +    }
>     +
>     +    f = qf_file_open(file, O_CREAT | O_WRONLY | O_TRUNC, 0600, "cprsave", errp);
>     +    if (!f) {
>     +        return;
>     +    }
>     +
>     +    if (global_state_store()) {
>     +        error_setg(errp, "Error saving global state");
>     +        qemu_fclose(f);
>     +        return;
>     +    }
> 
> 
> Could be called before opening cprsave file?
> 
>     +    if (runstate_check(RUN_STATE_SUSPENDED)) {
>     +        /* Update timers_state before saving.  Suspend did not so do. */
>     +        cpu_disable_ticks();
>     +    }
>     +    vm_stop(RUN_STATE_SAVE_VM);
>     +
>     +    ret = qemu_save_device_state(f);
>     +    qemu_fclose(f);
>     +    if (ret < 0) {
>     +        error_setg(errp, "Error %d while saving VM state", ret);
>     +        goto err;
> 
> 
> Needless goto / labels.
>  
> 
>     +    }
>     +
>     +    goto done;
>     +
>     +err:
>     +    if (saved_vm_running) {
>     +        vm_start();
>     +    }
>     +done:
>     +    return;
>     +}
>     +
>     +void cprload(const char *file, Error **errp)
>     +{
>     +    QEMUFile *f;
>     +    int ret;
>     +    RunState state;
>     +
>     +    if (runstate_is_running()) {
>     +        error_setg(errp, "cprload called for a running VM");
>     +        return;
>     +    }
>     +
>     +    f = qf_file_open(file, O_RDONLY, 0, "cprload", errp);
>     +    if (!f) {
>     +        return;
>     +    }
>     +
>     +    if (qemu_get_be32(f) != QEMU_VM_FILE_MAGIC ||
>     +        qemu_get_be32(f) != QEMU_VM_FILE_VERSION) {
>     +        error_setg(errp, "error: %s is not a vmstate file", file);
> 
> 
> f is leaked
> 
>     +        return;
>     +    }
>     +
>     +    ret = qemu_load_device_state(f);
>     +    qemu_fclose(f);
>     +    if (ret < 0) {
>     +        error_setg(errp, "Error %d while loading VM state", ret);
>     +        return;
>     +    }
>     +
>     +    state = global_state_get_runstate();
>     +    if (state == RUN_STATE_RUNNING) {
>     +        vm_start();
>     +    } else {
>     +        runstate_set(state);
>     +        if (runstate_check(RUN_STATE_SUSPENDED)) {
>     +            qemu_system_start_on_wake_request();
>     +        }
>     +    }
>     +}
>     diff --git a/migration/meson.build b/migration/meson.build
>     index f8714dc..fd59281 100644
>     --- a/migration/meson.build
>     +++ b/migration/meson.build
>     @@ -15,6 +15,7 @@ softmmu_ss.add(files(
>        'channel.c',
>        'colo-failover.c',
>        'colo.c',
>     +  'cpr.c',
>        'exec.c',
>        'fd.c',
>        'global_state.c',
>     diff --git a/migration/savevm.h b/migration/savevm.h
>     index 6461342..ce5d710 100644
>     --- a/migration/savevm.h
>     +++ b/migration/savevm.h
>     @@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
>      int qemu_load_device_state(QEMUFile *f);
>      int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>              bool in_postcopy, bool inactivate_disks);
>     +QEMUFile *qf_file_open(const char *path, int flags, int mode,
>     +                       const char *name, Error **errp);
> 
>      #endif
>     diff --git a/softmmu/runstate.c b/softmmu/runstate.c
>     index 10d9b73..7fe4967 100644
>     --- a/softmmu/runstate.c
>     +++ b/softmmu/runstate.c
>     @@ -115,6 +115,8 @@ static const RunStateTransition runstate_transitions_def[] = {
>          { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
>          { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
>          { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
>     +    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
>     +    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },
> 
>          { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
>          { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
>     @@ -335,6 +337,7 @@ void vm_state_notify(bool running, RunState state)
>          }
>      }
> 
>     +static bool start_on_wake_requested;
>      static ShutdownCause reset_requested;
>      static ShutdownCause shutdown_requested;
>      static int shutdown_signal;
>     @@ -562,6 +565,11 @@ void qemu_register_suspend_notifier(Notifier *notifier)
>          notifier_list_add(&suspend_notifiers, notifier);
>      }
> 
>     +void qemu_system_start_on_wake_request(void)
>     +{
>     +    start_on_wake_requested = true;
>     +}
>     +
>      void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>      {
>          trace_system_wakeup_request(reason);
>     @@ -574,7 +582,18 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>          if (!(wakeup_reason_mask & (1 << reason))) {
>              return;
>          }
>     -    runstate_set(RUN_STATE_RUNNING);
>     +
>     +    /*
>     +     * Must call vm_start if it has never been called, to invoke the state
>     +     * change callbacks for the first time.
>     +     */
>     +    if (start_on_wake_requested) {
>     +        start_on_wake_requested = false;
>     +        vm_start();
>     +    } else {
>     +        runstate_set(RUN_STATE_RUNNING);
>     +    }
>     +
>          wakeup_reason = reason;
>          qemu_notify_event();
>      }
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau


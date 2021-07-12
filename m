Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADA53C61AF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:13:10 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zUT-0000vy-C8
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zPQ-0001Sb-PA
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:56 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:4718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zPO-00064u-LJ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:56 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CGvNh2018208; Mon, 12 Jul 2021 17:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=eqiPW0rUErgkbFsz1URxufmcERihKfXUu1xpGlJvcEo=;
 b=Fqyju0ZjeeIGqcHF59WPvHrnv7BYYpof1PxAhdZKcUr9NFX/YuTUvoGUQKfo4nCuChpX
 MceC7vtdmbgvEezG6CLDf8ijDCL6h4IH1s9gohoruKs9Ld1HN6yLSk1QKHu+m+fDh1Vq
 H8CP4MH3647hpipyKAASAynybtQf9yvS2mxF4NeBEHcRevHJv6fglbf5FpwnGVOMzyh0
 KFf8Ct+rycyHNHbXSgZFZ9U9A3m+7auoMeT6Js5zx1nDqVdmUZtjAyiZ1G6dE6iKUDUI
 hIPAPBP5suFdA1rtfwhDFrVFHYHaaVkaI4MaO/EIPdCqZqzHNO1S1a4EtRzcylllo2o7 zA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39r9hchq9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CGtBlV065118;
 Mon, 12 Jul 2021 17:07:50 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by userp3020.oracle.com with ESMTP id 39qnaum8km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxfOyZ2cPxMvBjgbIrFMEoRiC/4mhG/nkbTL3uvp83YUaiYNGphcgh5sPLaR3rpSSi5S27P2nP+q7UTXw1Q0t/JWmzPDnt7MGF/S5WWOVflcLtOeseZCHqc/FzvdvnmYdm/+Mbb4XZykX20zkrkh+yset3sxNOGwsWpYRe/NqMMZpY8VIB4aSLx96QyLiWiuIkaF1NlvQ96Ytb8i9pM1j/ahWQNd7iLseBR54lsxgWFTrczJI5OHsGMgbF9AiiTLMRGujZOzAb201xGX6jAgKOiZNZH0GZ8uQB3LVqgQtVEw4CZzd8eBWGx0iBiXrmoEmWs5J9swL1jhXuq/FdBhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqiPW0rUErgkbFsz1URxufmcERihKfXUu1xpGlJvcEo=;
 b=bfbkOVgTE9fEZ+jm7TtwRxjuXE3PSgFLbZeVKJbAIwedpx+aZ3EVQuh5PArrjhXYDuRGW5bgaFaJa93lL5WPGpRmBdLrZiHaDZs6k/86nTB49w7fmOpfO4r9nv1w/pXlMstCQVYKVEdyCPlxFs2cNV7cZ4BTUzaXaYvYNkKjanNm9lV//VzH++BqayyHtVZ5AYAYZOflMEhqBjL0wHkozB9WywxEMmSUhdeQHwdM7a0qX/wuzUJLhNIIWqoF6FLQpwlI5UgKaYINUwY+OblD+PDiDYaTMKd3h5MaJ6Ti5kyX++PU6HWDKMuc1rUCldh+TO/21Hyn3dD24ZB9UgA4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqiPW0rUErgkbFsz1URxufmcERihKfXUu1xpGlJvcEo=;
 b=e6cWSJq85FDqHoCQ50VExkB1xpuv2v0oA4DXPbBtbZeuSc+v+MQWtHBAagRjh9mEIyLhFNZrMxrJ5KbY5b05MwWSqgLv879NeO9A3t/elxgSFssntyuD6ZrFgu0APHysTDvDjoKhoojWCoehfhNUbNF64J9pdhoklhw/AhlfnqI=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 17:07:48 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 17:07:48 +0000
Subject: Re: [PATCH V5 08/25] vl: add helper to request re-exec
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-9-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1C+3cKu6r+RSw5E1_OkAXA03Z1cHfnkFjMtzOvrU_6mZcw@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <6b068eff-24ea-f398-763b-973e0156d9bb@oracle.com>
Date: Mon, 12 Jul 2021 13:07:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1C+3cKu6r+RSw5E1_OkAXA03Z1cHfnkFjMtzOvrU_6mZcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0096.namprd05.prod.outlook.com
 (2603:10b6:803:22::34) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN4PR0501CA0096.namprd05.prod.outlook.com (2603:10b6:803:22::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.12 via Frontend
 Transport; Mon, 12 Jul 2021 17:07:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed83de77-45a3-4507-1918-08d9455792fd
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4734C543E7BA014F85456B55F9159@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjeXQ/zWtv8z4VQ0bsQmmEVKBVRKfrLvkW2W6XJGXgj543YmllOoPr268g/6Wx8zZ0wOUBKNtIBPotIAHHRgjqmEgNEn36MszwMpzNvTEOCUSEoMdjk4DtniOzuJcJTNLrv77ATtgIAJWBBGAYWCl2rhegou54gSxtbpROPS486AJp8epaMOnaKGYjoVo9kYnGLr/tl0cWBkdl7bpKsrrrcRdVS0TWUGeknF6/2AKMbfn5ihlD7ksOfOKV5OVmDuIrUXkEjX21K1ffUkenRzPB8/e3Tmiq00wF+hgNiHM5x23X9uP5C+KYtqXvO33qtaF9J9L8ZkKLtDQVLiMmkH9oh63jOCnPZ3kVLC7u+DJH+lc3KO8mnHpI+8XAFpbHT18KeTpR2rV3hbzk1g7pvZW8IwF80A3wNHHbmlHorK9qa/OyPY2Jk6Z46Kw5XAKVI8aJkHzOkCjUMmRGvyAzy6u+sZ4BKNYv+BDoV5/uj4SYSsgJt/oHpeYSCuX3+NYtHQRcwrfMGfTyVbAhtNOUXz0wNH3hbo9ot3OjUkHJtdCd28EwjAhrKVLGqBm3eU6NdzXrZ4CgRxYe2kxoRmLVw4CRbstAiJtf/Ag+QA3Zvr3MnEgin3zmNJBvCWc9cZ7f0SeiuJLoHR8S38iG6UJoSuQaWlfTs7FovWjgWv55prpKCvkFHlVZxENbLxhGT7F+XhNlG4H0S+ntrBoDGU9VNr+FUpDPj0oaX57WMtCSBHrN4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(136003)(366004)(346002)(38100700002)(6486002)(8936002)(36756003)(36916002)(44832011)(31696002)(8676002)(4326008)(186003)(83380400001)(6916009)(5660300002)(7416002)(31686004)(86362001)(956004)(2616005)(316002)(478600001)(54906003)(26005)(2906002)(16576012)(66556008)(66476007)(53546011)(6666004)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUVxdzNFak1GVTJQYnRGcUJEODZZZUNrc1lJTGdGNjYvV2VHcC94K0w4Umhv?=
 =?utf-8?B?dTZJL1B6SExhWVI0dGFFQkJFeEhtWXYvNzdFdmJLTW52WGNRNXpDWnBVa1d5?=
 =?utf-8?B?dS9TMHpjVnY3NUl2MnNzd28wUnBlaHh0SEh6MGVwU05SUHR5eW1YMmlLeGJj?=
 =?utf-8?B?SnBvR0lTWDllTHVlV2xZNHpDMXJ5ZG5ObE1rYkgrcnExNkpIRGtJczZYT2dG?=
 =?utf-8?B?YjRoaWU0emp2bDFqeFRYZFlyRkZ0bTk5M056RnBiT3RSUXdrejIvWWtVS2Zx?=
 =?utf-8?B?cXZWUHh6bk12YlY0UEpSbW5mK1NQbVprb0tjVXZJQVdYNGtlR1JnZ0pMRjFq?=
 =?utf-8?B?TkxoMFJDVmJrcFVyS1NiUGY3SnkwN0ZxYUhreDh4UlFBZTh0aUMxbnJ0WGtU?=
 =?utf-8?B?cGYrUkVCL2I3SStMenZ5ZVZCRDdVQlczMURqZXBtUklWamhPb3F2U2dIaElS?=
 =?utf-8?B?Y1hCUmpuWlFESGk2c3BIOUNiczRlM2JtMzZJYXBBUzJobU9Uak9YeWVYdngx?=
 =?utf-8?B?aWFCbXM4R2xwZ05LcDFOWVdrN0xqbFlxaDNGZkQ2cElOeFJBRTk1SUgzcE5P?=
 =?utf-8?B?YnNPanBWd3ZZZ2dhS3BBSHgwcTd4ekNiOTZaWlAvaG5kZnhyZm4zeXZjNUVY?=
 =?utf-8?B?WkYxSW1hZHJxTU9uSW1nWlFieHlRTkljaTlRdVVaRUkycFdEZmRMOFFQRmNO?=
 =?utf-8?B?M1kwVEZva1NmUzdhdkxUaXJmMzhVOXRYczYyM01pUHovWlNFd2dSRldrQS9J?=
 =?utf-8?B?VThiUm9uRXRZdTg1Yk5aMDFpVTljVjV0VktIcDJneXBTczJLSzdBbXdUZk5J?=
 =?utf-8?B?c0M2c09PQ1ZQODk4QThGYkQwckF5V3prUzFoU2M1Q0xNeHZBalNTU2o5RnF0?=
 =?utf-8?B?SEVjcTVibTJGTmY4UjdneGRMUFhNZkM0dEV5Z0s0K3FXN2YzYkJSUi9vaUM5?=
 =?utf-8?B?K2lHVU14YkZSQXNRMEcrQmw0SzY4SDBvWCtXTTNvSTBnYk5WZmZ6b0JlOUVT?=
 =?utf-8?B?ckxsZmcvMTN4dVlHYklFUmFXSEdMS3ZVNm5WWW1uQzd0ZndKNnBVSGVTZ0k5?=
 =?utf-8?B?OFY4Uk9rNGxPSmdvWmt3aUt1ZllTNkxpSFZqSzBOUWowUFdId09nRDU4LzBP?=
 =?utf-8?B?WkRZbEdTcjhIRW03R3hVbjh5UzZJYWh1elFoemk5MnByNXJIMFpFdnZHc21u?=
 =?utf-8?B?NU9aekExL1p2ZkJpNWV0QWlWb0FIT2tWSmk2SElzZUtUTlhsNnJPYk5GMEUy?=
 =?utf-8?B?SE5mNHE1eWx5OVBMQytBbW1yaENBK0Rob2NHekUvdDRud1h0K0c4OUdhaVlR?=
 =?utf-8?B?anF5OHBuSWh5MnEvN2cwWVp6SWJRWVVLdk02WGNHNGkvMnBOYzlXSi8zQi81?=
 =?utf-8?B?cUZtSEFuUlA1dlJJL0ZxOGpQY252bUIxVXVFN082OVUwOEUvUUUrMzJOZDRn?=
 =?utf-8?B?ZlpjcCtrMWVKVGdIM2NSbWduZFVkbHh2MWE3WjlNVE9HZ1MySEFjTmpZaE1S?=
 =?utf-8?B?UzNtaFJDaXpxZW1LQVFBcHo3Y3pmUnVzaDZDelBMOEZuUXVTNjNSZ2dzNjFt?=
 =?utf-8?B?MVJiL1pyYmVKNERodHBxUVRsQkNUdHhXR3duMXVRV2FmZlVpUVp3SGw5c0tL?=
 =?utf-8?B?WnZPS1ovU2VHWkY4a25wMWFJb0w2dVVoaGw2UEVxVVVTb3pNWHhFOHVJd042?=
 =?utf-8?B?QmxUZE9PLzdaZDd6V3VTMHhxWThncGpHYkt4OUlUN1ByaTNlUHRER2pXVkNi?=
 =?utf-8?Q?GGvSBsFcOoyvyAC7Oyy/wHuiJ4okxmNjfCfKEMX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed83de77-45a3-4507-1918-08d9455792fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 17:07:48.1646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DC/OFjLUQVZnFduqj54LuN7W4RnQfGCKdizXZlbf7IIjeAXahdrAmEihgM2fRZtSYmX9RVuNyxeQmcDqDaCekRCPipUPgdJ+l13eFTst7Ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120126
X-Proofpoint-ORIG-GUID: S9jyq0W-7EQEOnNxLXmN-TF9DfXvEq4L
X-Proofpoint-GUID: S9jyq0W-7EQEOnNxLXmN-TF9DfXvEq4L
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

On 7/8/2021 10:31 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:46 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Add a qemu_system_exec_request() hook that causes the main loop to exit and
>     re-exec qemu using the specified arguments.
> 
> 
> I assume it works ok with -sandbox on,spawn=allow ?

Yes, I tested that.

Will do for all below.

- Steve

>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      include/sysemu/runstate.h |  1 +
>      softmmu/runstate.c        | 37 +++++++++++++++++++++++++++++++++++++
>      2 files changed, 38 insertions(+)
> 
>     diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
>     index ed4b735..e1ae7e5 100644
>     --- a/include/sysemu/runstate.h
>     +++ b/include/sysemu/runstate.h
>     @@ -57,6 +57,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
>      void qemu_register_wakeup_notifier(Notifier *notifier);
>      void qemu_register_wakeup_support(void);
>      void qemu_system_shutdown_request(ShutdownCause reason);
>     +void qemu_system_exec_request(strList *args);
>      void qemu_system_powerdown_request(void);
>      void qemu_register_powerdown_notifier(Notifier *notifier);
>      void qemu_register_shutdown_notifier(Notifier *notifier);
>     diff --git a/softmmu/runstate.c b/softmmu/runstate.c
>     index 7fe4967..8474a01 100644
>     --- a/softmmu/runstate.c
>     +++ b/softmmu/runstate.c
>     @@ -355,6 +355,7 @@ static NotifierList wakeup_notifiers =
>      static NotifierList shutdown_notifiers =
>          NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
>      static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
>     +static char **exec_argv;
> 
>      ShutdownCause qemu_shutdown_requested_get(void)
>      {
>     @@ -371,6 +372,11 @@ static int qemu_shutdown_requested(void)
>          return qatomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
>      }
> 
>     +static int qemu_exec_requested(void)
>     +{
>     +    return exec_argv != NULL;
>     +}
>     +
>      static void qemu_kill_report(void)
>      {
>          if (!qtest_driver() && shutdown_signal) {
>     @@ -645,6 +651,32 @@ void qemu_system_shutdown_request(ShutdownCause reason)
>          qemu_notify_event();
>      }
> 
>     +static char **make_argv(strList *args)
> 
> 
> I'd suggest making it a generic strv_from_strList() function. Take const as argument too.
>  
> 
>     +{
>     +    strList *arg;
>     +    char **argv;
>     +    int n = 1, i = 0;
>     +
>     +    for (arg = args; arg != NULL; arg = arg->next) {
>     +        n++;
>     +    }
> 
> 
> We could use a QAPI_LIST_LENGTH() in qapi/util.h
> 
>     +
>     +    argv = g_malloc(n * sizeof(char *));
>     +    for (arg = args; arg != NULL; arg = arg->next) {
>     +        argv[i++] = g_strdup(arg->value);
>     +    }
>     +    argv[i] = NULL;
>     +
>     +    return argv;
>     +}
>     +
>     +void qemu_system_exec_request(strList *args)
> 
> 
> const args, and documentation could help.
> 
>     +{
>     +    exec_argv = make_argv(args);
>     +    shutdown_requested = 1;
>     +    qemu_notify_event();
>     +}
>     +
>      static void qemu_system_powerdown(void)
>      {
>          qapi_event_send_powerdown();
>     @@ -693,6 +725,11 @@ static bool main_loop_should_exit(void)
>          }
>          request = qemu_shutdown_requested();
>          if (request) {
>     +
>     +        if (qemu_exec_requested()) {
>     +            execvp(exec_argv[0], exec_argv);
>     +            error_setg_errno(&error_fatal, errno, "execvp failed");
> 
> 
> Can this be handled more gracefully instead?
> 
> g_strfreev the argv and report an error?
>  
> 
>     +        }
>              qemu_kill_report();
>              qemu_system_shutdown(request);
>              if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau


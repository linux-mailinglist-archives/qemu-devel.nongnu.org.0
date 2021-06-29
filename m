Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60443B7067
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 12:09:20 +0200 (CEST)
Received: from localhost ([::1]:40060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyAgB-0006oF-Kl
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 06:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lyAev-0005Pm-E1
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 06:08:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lyAet-0004J6-2s
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 06:08:01 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TA1b8i004731; Tue, 29 Jun 2021 10:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=AwOnER5W9tvFckjRHG15SqcilCano8HauXKtq2EpuQI=;
 b=Goi6zZ2Uq1Qi3lJdXylu0YhB19vh20EOjIqEwZcXBXwXtdnlJCJZ7CH7PPzMuJBJvoKg
 8k0FoPSdpU7XQ/qdyfRAvUB8cC3t4KuzgfSu9b5v5FLmgyvfoXlDc4UuFQPQ43CoJuv7
 7DObY6QyYk9thLgC4O2xxVe2xtBpiRI8+ysv7ak4w0erw2wqRcewHNSGCWYpjIeoILXD
 xtOEoseIH4oOXkt4NfCSws7PPaZRplAB6pAspe33LoudhQN4ouDvA88N+aPoNNBSV6En
 dXlzF3fQZvFsZM8P871yMNlwqkTgRHWFP4IcWc/GDGWHteOK5YyKow2tg0P7ICagoYwc Cg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39fpu2h4g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 10:07:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15TA1sw0114783;
 Tue, 29 Jun 2021 10:07:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3030.oracle.com with ESMTP id 39dsbxekaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 10:07:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgK6Kwyc+epOZ72/jU36UfnGh8gUEkq/gWVk4Xx/W1IjcCNODjiCQ5/rwgeufRqsro4gVN+9MZFdW8RmdX5OBJHfwUwKXztR2IukbVygXZIb1cNRh8tSRAnteMoO3RMpP8bc4tbzX52HNqBO2etqPkAuA60YvOggAfjwDRVwFaBSYltjqcTffIRGsWacOrQ4s5ZzmEdCgORGWk7DdkVhXth49F/PQ1hPlHjUY+P9prsPhQey1UozXQJTV09TxE8j91tRemAeqnPU3182Hl2tX41jqkpicpW887VmMiJl99n5ZV/ggkYIl4UhHi49QTJV6Zx4MnjmeotKINWZRSZdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwOnER5W9tvFckjRHG15SqcilCano8HauXKtq2EpuQI=;
 b=Pg0EgDidn3nuOx1OWf/Uk9mTJOSSPRSpXRaihvwYEZkf/lKl5iZNkVCZV9MY1YORedFTiQDL9xnxP79ZuapqIhZ+zMjoRDt70AyOCnvqHIFI7wT1MTQAkUoyjAwvx8kgORjzHo4nVkaJtzPppMX76eMlHdzg03lcvcQZRCyGcBnzsK3Q1kfqIzb6ad6mIrEL8uD0BeC7iH4OGw4KFQLioX/72dkRTUGd0Z9lca3tVQFjisbK7Fe+YW1NzOsnAiNIb5+i/pnDtxV/ZBZZfylFyBln5PiHsy6ArvxtVln426/GXRrfGRtoqw7oUDiOVII2G1tPomVjYonUNYIMYxHL9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwOnER5W9tvFckjRHG15SqcilCano8HauXKtq2EpuQI=;
 b=luQIylD/0oJfZtPPc2ipWy1rQBC3BQ7i4XXX/XDQlBoZnBwbf7n7y/8G/gBGlaRCW/KO/vmz2eB5IyZJ8/4ulbDKSHub/T/LgkZCs7fQ7HESTW+Ra8GAXDcOkukbFAUHgiAFhqpRYYkpYyHKX1ANLCE1tqWrIazyPcrHF70e6Oc=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Tue, 29 Jun
 2021 10:07:51 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::1539:60e1:df69:3676]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::1539:60e1:df69:3676%9]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 10:07:51 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/3] fuzz: make object-name matching case-insensitive
In-Reply-To: <20210629011151.7vz2a7d7j7a653pk@mozz.bu.edu>
References: <20210628052349.113262-1-alxndr@bu.edu>
 <20210628052349.113262-4-alxndr@bu.edu>
 <20210629011151.7vz2a7d7j7a653pk@mozz.bu.edu>
Date: Tue, 29 Jun 2021 11:07:46 +0100
Message-ID: <m21r8lrnkd.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: LNXP265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::26) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 LNXP265CA0014.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 29 Jun 2021 10:07:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6d776e-7d3d-4fde-d7b6-08d93ae5c164
X-MS-TrafficTypeDiagnostic: MN2PR10MB4013:
X-Microsoft-Antispam-PRVS: <MN2PR10MB4013850B114C9C17D17EC1C1F4029@MN2PR10MB4013.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6JOkTJrULvqZSjuZKPIqVRVx2NDv8G7JPRSGPLoXJeE4uK4twuuiWU7rHqUMoCXIuvlRQxOuBl/wZlFN+/RQdCwclmS/wQJY0roK4Bdj982S/avtXgWZUrFip+sBe8XN0RmJgFVr4x+D/EwEX07pARYtog897fR0LkqUNzjMuWapnU3LHnloPun0e1qv40v9re3ydmyu/rBmQvHf4w5GahAoISfLchjA9BdIz3GwMTsz+G3LQoEv9uauRAkoV37HeXOO+CqAIWgyZ3hbVfed85Vd/FvawVoY3ka+vT0MqnwUHHJ6QZJwj9iLekfyWubnTihihDvGlfG6lVUlvfWmdd281pNdCkk61dOMbcYspyzQ9o0begfHMjSjGuCbj6IoNJzbBQjYIDWEQ49tQsKvIaWJfRZW32jKO0z5sVzvn8/6F8wy/oi3eXl4EGJt9ZvmJS4Nc0gL5j4jzpdzzxaZ6EHfHKrU6sycfp04JoKrmj0+8tm6Oplw1IIjBSK+mVj9G0DiwCrZzmrUvReEFyi1peQfIJtNU3r1PvUnQXyxDUapaYSha0x6varkadKwAoUf1vXXceZz8nLwlTB40ZbL62Ph8zVLMAwxsgfWti8JHPHxZHqPLYEuus7x1yZFtFJX0hpXAH6Tt9OmryfDEaPQcCsswFYuv15ox2ACU3dQnqK+5ycA1dkSeOAZ5p5OMWFVOKusuYz60OwlgZpn7tHtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(366004)(396003)(7696005)(52116002)(316002)(2616005)(26005)(83380400001)(38350700002)(36756003)(66476007)(16526019)(6666004)(8886007)(956004)(54906003)(38100700002)(186003)(478600001)(8936002)(2906002)(8676002)(55016002)(5660300002)(44832011)(4326008)(86362001)(66946007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gMYcET11ntfxMfiqu9+XplOfYgpsR8WBmBcIxR5er23/MwWT8bGXlS3KUmh0?=
 =?us-ascii?Q?5MATYK7+fKZMyjqxx6X6JEJW63dLpk/t3Ch4UmxwKYWbEs9dRPhtjys016N+?=
 =?us-ascii?Q?A6kZQdnka+Z0A6LmYkBkaOm/RFQGvQvZsLeWPYlkXVmOV+umkgyBxilxwXXI?=
 =?us-ascii?Q?8UuWGq9rtuXzMSUrJT7wT/iXilzc0xoEPqrZTm6Fhv7E8ul+DCFfzRpsHjOA?=
 =?us-ascii?Q?YEFU3FQnmakGWJT2QV00aErpOpipf9kwPfg6HGRZhH9v9UikSoOGWWWIzjf+?=
 =?us-ascii?Q?W+wKx0tSFnp1Hpth7vRrmkrX0mOjBgN1hYicUovcwuCeM48pchJGvLrE5MN6?=
 =?us-ascii?Q?/enI87UMOz1AzszEm9YESRmBGWH8ukC86BFAMhNi6JjldBW8HR6jBwa21jo+?=
 =?us-ascii?Q?r3cdC6FvljexivpJ1B1lU9Qa823nBtX9ZbGNE+s1tOHSIfcBx0Ogy66New43?=
 =?us-ascii?Q?tnalI6eAKAJr+9XaYQ5225vaT9Sxcq62Nqj8rZZOUDGVw6NpZJfWU2L9VgIv?=
 =?us-ascii?Q?84wIO39XdpHNQTpWVcAyECqXpFzzB+rFx2ikoUiZdQYHJo32B+smQUOND0F4?=
 =?us-ascii?Q?0J0NKo2YL5bLvL4cXBzPz7hPWT3NSlPIwvYVV8I4mp7RsGkXlHzBa6OttdBh?=
 =?us-ascii?Q?sMywhfOt8mFlygmPnRW/JDPrrpy9riX6zdZelRHHJq5WJnI3jaiOavjWhpr0?=
 =?us-ascii?Q?9UGmVYySHuAXDDTkeHqszOD2j7IJFv3KNDwbftgwLnyP5xsiHOmHXt9MmomV?=
 =?us-ascii?Q?KbHd2izsCXLfn/Hmcm/Hg0E+Fu2R3Hf1wmlJliGf79v15Y36OBUhF15VsVg0?=
 =?us-ascii?Q?fdsVCVYg21y2zeSHNwoN4R7coZkKDG+6wrF35UbdRm6q/ekRQW+UVlK6Nd12?=
 =?us-ascii?Q?YJG9qwPui2IWnIS2OoBtLFsN1v+Dl2b+aV2uBHxRutQoZdo3L0AhYRkN8gRe?=
 =?us-ascii?Q?h+giWZlDiACWCHYYdAdQN6wS3xepAaH+k7fg4/kEbzV5jP9v1zUWydzryISy?=
 =?us-ascii?Q?NdNGZRx1Ide8JKkSkc0pQqBYjWM9VhB2LHk+AKI3T4gk2SWM1Gfc4nmESqYF?=
 =?us-ascii?Q?ovQy/bbLwXntqs3RExLiSM00/AD9Ai9ryRug5weruyYeEn0ydbewH0HotGm6?=
 =?us-ascii?Q?Apb2HwyxrIS8j30z0eJABS+4HMRPAb4GRWgABYncaFg9aX/5bYEUt698+D7k?=
 =?us-ascii?Q?hPZOjiAXWh1mBYiQIlzSYIwCA6FrxBAMB1LxwN0fzTAKyrYzOgNCiNxJo+hR?=
 =?us-ascii?Q?3EHt8nkYXDvXy6uc3Cx70NhgDVegVlZe/uvAcWEM9Z3yWeE3VQRqOhK0p0nN?=
 =?us-ascii?Q?aFwybv5Ca4S07gVsjP1oDlYJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6d776e-7d3d-4fde-d7b6-08d93ae5c164
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:07:51.7762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbnVuJ/jXgAVhL/c4w9K3Q9XFsPuzMSJFLYBlEGcuD244kUETcuBeOckdeqkIpVM8k0OxNawfW5SFjR5l2CKzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4013
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10029
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290069
X-Proofpoint-GUID: oFJNyMWwhKgoAew7Nc16e_GzZjF1THB7
X-Proofpoint-ORIG-GUID: oFJNyMWwhKgoAew7Nc16e_GzZjF1THB7
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-06-28 at 21:11:51 -04, Alexander Bulekov wrote:
> On 210628 0123, Alexander Bulekov wrote:
>> We have some configs for devices such as the AC97 and ES1370 that were
>> not matching memory-regions correctly, because the configs provided
>> lowercase names. To resolve these problems and prevent them from
>> occurring again in the future, convert both the pattern and names to
>> lower-case, prior to checking for a match.
>> 
>> Suggested-by: Darren Kenny <darren.kenny@oracle.com>
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> ---
>>  tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++----
>>  1 file changed, 20 insertions(+), 4 deletions(-)
>> 
>> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
>> index 71d36e8f6f..0695a349b2 100644
>> --- a/tests/qtest/fuzz/generic_fuzz.c
>> +++ b/tests/qtest/fuzz/generic_fuzz.c
>> @@ -751,8 +751,13 @@ static int locate_fuzz_memory_regions(Object *child, void *opaque)
>>  
>>  static int locate_fuzz_objects(Object *child, void *opaque)
>>  {
>> +    GString *type_name;
>> +    GString *path_name;
>>      char *pattern = opaque;
>> -    if (g_pattern_match_simple(pattern, object_get_typename(child))) {
>> +
>> +    type_name = g_string_new(object_get_typename(child));
>> +    g_string_ascii_down(type_name);
>> +    if (g_pattern_match_simple(pattern, type_name->str)) {
>>          /* Find and save ptrs to any child MemoryRegions */
>>          object_child_foreach_recursive(child, locate_fuzz_memory_regions, NULL);
>>  
>> @@ -769,8 +774,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>>              g_ptr_array_add(fuzzable_pci_devices, PCI_DEVICE(child));
>>          }
>>      } else if (object_dynamic_cast(OBJECT(child), TYPE_MEMORY_REGION)) {
>> -        if (g_pattern_match_simple(pattern,
>> -            object_get_canonical_path_component(child))) {
>> +        path_name = g_string_new(object_get_canonical_path_component(child));
>> +        g_string_ascii_down(path_name);
>> +        if (g_pattern_match_simple(pattern, path_name->str)) {
>>              MemoryRegion *mr;
>>              mr = MEMORY_REGION(child);
>>              if ((memory_region_is_ram(mr) ||
>> @@ -779,7 +785,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>>                  g_hash_table_insert(fuzzable_memoryregions, mr, (gpointer)true);
>>              }
>>          }
>> +        g_string_free(path_name, true);
>>      }
>> +    g_string_free(type_name, true);
>>      return 0;
>>  }
>>  
>> @@ -807,6 +815,7 @@ static void generic_pre_fuzz(QTestState *s)
>>      MemoryRegion *mr;
>>      QPCIBus *pcibus;
>>      char **result;
>> +    GString *pattern;
>                   ^
> Just noticed that this collides with struct pattern through a
> sizeof(pattern) call below, causing nasty heap issues during fuzzing.
> I'll send a v4 with a better name.
>

Certainly wasn't obvious from the diff :)

Fair enough.

Thanks,

Darren.



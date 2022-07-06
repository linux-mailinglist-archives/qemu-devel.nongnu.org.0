Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4AA56912A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:54:37 +0200 (CEST)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o99ES-0007iS-E2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o997I-0008GM-Gj
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:47:12 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o9975-00064m-MK
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:47:12 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266GOedf010495;
 Wed, 6 Jul 2022 17:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=nlFsOoAA9Z0WpUQn9oRtSnI8F0538l91m3aftfa1DSM=;
 b=OhcqKTdKFNskdjaZGfpscvF1hPafyLl54wEkCkyzPVDk+4smn15JTH7OvET1KA4E1KfC
 klEnM5V5PiCupGh3IgN9t6C/tUSyIM6LZo0IWMCDPyakbOuLfmSrdSwxTYYgN36WUq9Z
 0f1vY0kSANrbtDPTs/YbxyDUw/7CFrGBjjxSG7qYbjPybteYPq2KGteAdn48SR6lQbbQ
 WOdKIqPcWnki9frOPkcLjzp0V5xYHnJo/3DzXj9t/HmaKVg4Eh6Ogkwlws1EpNi9NMmr
 Xq23RZC57VjcwPouaHZUq7BeYmuKy/YhWJPdh3r+CjL70g+1i3WPaRqQGDGQ/jHr6MRs sw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyaqtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 17:46:48 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 266HfHx0006964; Wed, 6 Jul 2022 17:46:34 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud52sjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jul 2022 17:46:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxYCfiSyqFrG+aKSKy20O2mIxthajdSivll89PzLjuvcgMk0oEk4a7RMP5hZmPB/9hcp9IiEajwrOTrbT83UUTIfOKDWahOOf4FJQJEdTN7BpgOiJcLk2ug/MhvoDHNjPzy6B6QQURxMqjKrdlrFx4ZX2opko4itiO2BntZ4k5MPSAw9D9Er4IBqrXtG3v4WO7a/P+4oLXqbd0GH69OncLSbdkUlxht3qaPMagUyqQ77Qx8WB5Je55bfZIcmaUBJ1iTbbAOKI3Gr21Hd4XC2u+FL/Gq+LdgUzCQ+LyVulNDMWzM+MMaO3wknviETGLb/S60NKxK2NsKpJ4yTMmQyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlFsOoAA9Z0WpUQn9oRtSnI8F0538l91m3aftfa1DSM=;
 b=S3hMvU+6/wHgGuHFtQ9RkPRqDYkcqFJUv4u+gU9GMZ9c6736rVd79ovYnWmEJjJsq/s1ueEI11xl+Mia6DZA7QFYlMphRvi/kADzm2C+lRMuSXFI8rZ72JTeI+l15ruBC0QNJQU2Aj5GwEQjMsGQ/T1q9mODJzC8jBPdXzOkGyxFRaZX7ljxCMcLZ287GGvFohfv0a2VedrVYOqjA0BW0DR+dS4mSz++h7L8xI2r8vhVMPdw1wCTbBjjB2xl3rd4bEHiI9JvP4AgFvP/geMxtjxWkD9qB6/Os/1bx0K9g3RYZ2lZwuyI+jramVQlEFYAtQJ3ZXNimroY3BZ46Pv+gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlFsOoAA9Z0WpUQn9oRtSnI8F0538l91m3aftfa1DSM=;
 b=myQ8wDn+hp7CKaLO6LBW13Ui9moFGDF3QEYoyP8OnfgaKACOJkBo0f92nxjETLSWQzwARZc0/KA97IJ2UPYjSBSJaXax4coQ60UwJJEnEzFOMfqesiDRXUSf3Z5f721AvMQ9+cmywTf4JI3aTaXkevdO3wz7eNhWk0RUhRKqyPg=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BN6PR10MB1476.namprd10.prod.outlook.com (2603:10b6:404:42::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 17:46:32 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 17:46:32 +0000
Message-ID: <1e13cc88-74b2-debd-4589-0df4af24e31f@oracle.com>
Date: Wed, 6 Jul 2022 13:46:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 30/39] vfio-pci: recover from unmap-all-vaddr failure
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-31-git-send-email-steven.sistare@oracle.com>
 <20220629165809.1456cb5d.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220629165809.1456cb5d.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:a03:54::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6429ed9-916d-44b3-1a88-08da5f7775f7
X-MS-TrafficTypeDiagnostic: BN6PR10MB1476:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6vcNNok7jm2FIdpwUZPIfJJIVzSGCsyuwoHFZR8Ef75u0jL2e3cICFhbkLz+LFPZWAmjzbChqnFo9g+6CYu5U2uKPbkKfUKAgchnOb1eGralqm2njSl9ec9OcnFEo7snmfpjLy03O/6soop0XqB175OUPBYJZtoKLIfivEx3TacnkYkgDxvI+a3dg/VM48bQOYvNOdTUw0fGj/Lz6O0X3P/8SzvOj/IsrQYodbKg1C86ERBhGlA7Szvh43yYhnAuFBB9nKW1p9IR0lwEriCfD1i0WhP+klY1EsjBwFY1xMryT5TzKTr6lf8LvI/5CBxuP41Am9JQswyPdsOPZIiU2WobDvrCrPXbcWLxujeVKyuejqBP0I9fAeiwLEC8dBqmHp6dEE/qqL45qOl3ibbdF8RCB+hj/Nyk7gFNqGhJcYKUKI1gEUOqo3NFdwd5D8z7aaTc8bxX9yoLnIz01KHz9PhJCrYBTuo4t8bvqk9xGjGZq3XryQFFeME5jPz+/racoiROk2NOupjJB0a5vwCoL706N54tIzjkda6dPKrWBo/PPcwVYzKVqi6Ru3ytMQMpbSmzmGgByibwHzuq/TMlKX44H8klCeN6Uxx1s2jCAzVYlNopAMoURrWJlJdnIHPl58G8hhzjy3PfC4rQn+zZM8XCDaAmIjczMUe0oIB50cPD7zFIu8iQIUfdFh3se2coPNPSWZUi7CA1LacPbTNzSaBHXb4Ra7bK8g/pKmGZrcHn3uYlnCyHNr3CnvF8XyvXBMt4h9p3Bg9Oilq8c4HdTifhniWcknKmf5CVzhvfNERdSxTjgVA9bIbDXbZpEATs9JNPCYP4j8X1njHJ3krZow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(366004)(39860400002)(376002)(136003)(83380400001)(26005)(8676002)(4326008)(186003)(66556008)(66476007)(86362001)(478600001)(31696002)(6486002)(44832011)(66946007)(5660300002)(8936002)(7416002)(38100700002)(41300700001)(2906002)(2616005)(6666004)(36916002)(53546011)(54906003)(6506007)(6916009)(316002)(6512007)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjN4a3crUnp6ajB0aW51aEkwMjF0ZjgzM2pPRXlEMGtaRVVPd2lSL09pUlZC?=
 =?utf-8?B?bVhzYzBiUXE0UmM0ZGVONjNsblNtZjkvZXo3bS9VTkV3RWlrRis5eEkyTnVM?=
 =?utf-8?B?TkQzNnhRL1NxcWMrNldsbEtNN0MvZVRkN01hVDZDZWNTRjRRc1BzTXdFWFhm?=
 =?utf-8?B?RVZpL2hZcFYxVk5DNDdaZ1ZyMGVsWmRZaFpBb25pUXpFVldocFZYUHBOWjVJ?=
 =?utf-8?B?Qzh5cjN6T003ODF1MzBzR3NHWEVVVTlqa29uRDY1d3I3TGZTbEVMckVKaG9R?=
 =?utf-8?B?TGkxV1gvQllreXFVdy9qTUtIZ3ZLYTI2TnZTR0tydUtuN0oyNU5hc0x6Ny9m?=
 =?utf-8?B?YXpxVjBCYmNRUWZuWXRSTDhiOXRkcVhWWjJYZWJuSlVLQTZRQmc3VUE1ODJS?=
 =?utf-8?B?UUprcEtHanMvM1B1SDUvYkhrblVVNXVGWElYRi9lYUNiQVNnMURsNEhzT3Ey?=
 =?utf-8?B?ZjNRUFRFRjlvOEgzM2Q5c0hpZkQ0Uk54ZjlLQS9wRjVURVRnU0taSlhUdXY0?=
 =?utf-8?B?TFNieXViaFluSE9WRVo5aVBPWW1iOU1LSGx3VXEyMi9yQkpVbVl4elJIcnNw?=
 =?utf-8?B?MzRpZmFDcWhyN3QvblNSeGhwNFh5eWsrWURyV1JwRGNaRDhaUmxNRkpmZzVm?=
 =?utf-8?B?d0QzMFVCWWFKaUExQWE1bGlUZUIzcHZWUEJ1SnJ2OTNkaGhvVGxaRmJTdEF2?=
 =?utf-8?B?aUp1TElZQUxLZ0tMK0Z6NTJHamx1WE51dzVlZFpiZEI4NlFyamdZTEVseXNG?=
 =?utf-8?B?dlRHV2lpdWpTbEVtQzRHRmtYMTdMZERCK29VMTl5aFZySWR0UkpKRVoyUnVN?=
 =?utf-8?B?WE9YMk42NG10VW4wNWZadHltL2M4QUNqb0d1OHpOc1cwVjVkOXpZR1p1bUtC?=
 =?utf-8?B?S0hSVzFkdnBKZVBLS3NqRmg2dWJ0cjB4R1NZbzA0dG1yRTlsYzR3RmQ3M0dl?=
 =?utf-8?B?QThpdVRlL1hNRkl6V0p0N1BTZjUyU0tOajJkSnlBcUx4cHZ3VEVubjd4NTRM?=
 =?utf-8?B?NlQrWEROS1Y1MDAwOHFscklTdkJXczZxbUw4VEZwTkluODFZcVpJRUY1RWwz?=
 =?utf-8?B?cW9CQUlEbE9RVUVqWWRwd0p1dXVFMlNpdy9oRGdlSVpPOUoxOS8xTno1YnZk?=
 =?utf-8?B?bUphSHlMSW9RQ1pJSTRHNDFnK1NjQ1R4bjdTV3V5RTZQWGRnWm8xUXNoeUp2?=
 =?utf-8?B?Ull5WFFQMnBKZVREcUYvVkEzdWpYMFhEc1hLWStoaGRreHFEUWxGOEw3M2Zn?=
 =?utf-8?B?b0tNQnk1OUhlTzQ1MGZZYTVZYnFRRFFROFdhWlZRRzQyYS9ncjFqTHlXT214?=
 =?utf-8?B?eVFrNGZ1bmNwYk9FQmJoL1d5a1V2Zis1NkJWMHR2UnR4OW01dElSTGxTZVNS?=
 =?utf-8?B?cER2OUdRZ1MvblhycXAwVnJmYW9ucW16Sk1qU21tZ2lYaThqSURDUzUvZkl0?=
 =?utf-8?B?ekVHSkczMGMwbGVkZXA0RzlrQitKS0t5ZmJURWVKZUdsb1ArRXBSYld0Z0VC?=
 =?utf-8?B?cjNGcWRnUU5PMlZLMERmYzBXeUZqWEN5eUpPblhDMDM0anJmRHk3eit5UjBP?=
 =?utf-8?B?OWlUQzBzbXJ6Q2lkbmZVdXpRRkx3K3hBK1ZZMWVFVFZVZldMODgwZzdIaE9K?=
 =?utf-8?B?NjR1bUFUNXIzUGhlaE1YS0xHY3V6ckxyU3c0K3c5d041V00vQXczOHNTQWV6?=
 =?utf-8?B?ejcxOE11S1lTUGhrOE9yUUkvd1RzUjZLbTVzQWhuemlJcXBCMXJvMFhhU214?=
 =?utf-8?B?Vjg4clpwSmgvTXlBYTNkd3ZXemZmTHQwSTh4eE1FaFpEWG9pZzlKZ3NxK09U?=
 =?utf-8?B?MzFWMnYxYzhWSENoWkkybzZBK3ZyQkowUTdvK2JuaXl3ZzkveG1FMktqUnc0?=
 =?utf-8?B?K2lId3lhdlhBTWUyOXY5aXlaaUZNeVc3VXJ0aHpjbTJ1SjBMOEY1N3QyY2pG?=
 =?utf-8?B?aVZyb04zUGQydjNESUtGR0Fjd2JwVCtLUGxSQjRWdWYxdmlUMFd3RExZOHdi?=
 =?utf-8?B?a0tvUjJ2MStNTnI3NlBnTkpaTWt6SE1OWGhlMUJIWGhwakpHN0R6Zk9tVEpt?=
 =?utf-8?B?T2wxZW5PVzRMeE04elEwTkp2U0Uwb1FCQWtWLytvd1QwejNydUovRjQ1M3Y3?=
 =?utf-8?B?NytUWVdGa2NlRWo1c2hLZkpVYnNkWmh1M0k0MUtzZ1h1Vk1MTHRPaE5wNEdy?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6429ed9-916d-44b3-1a88-08da5f7775f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:46:32.0283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8s34ZftNFwA5Yn2cI7cS9RS0bDxzbNcKEufyixPqzShwnrIIYthUVwLzv4zwBBi9Zw95tKVVGyPmKAx1OWT6Ks3/Z1DW5x5SVcGWssC4RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1476
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-06_09:2022-06-28,
 2022-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060071
X-Proofpoint-GUID: xH4LMEbOarXMjrlYCETPBGLZC6kFUYDl
X-Proofpoint-ORIG-GUID: xH4LMEbOarXMjrlYCETPBGLZC6kFUYDl
Received-SPF: permerror client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/2022 6:58 PM, Alex Williamson wrote:
> On Wed, 15 Jun 2022 07:52:17 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> If vfio_cpr_save fails to unmap all vaddr's, then recover by walking all
>> flat sections to restore the vaddr for each.  Do so by invoking the
>> vfio listener callback, and passing a new "replay" flag that tells it
>> to replay a mapping without re-allocating new userland data structures.
> 
> Is this comment accurate?  I thought we had unwind in the kernel for
> vaddr invalidation, and the notifier here is hooked up to any fault, so
> it's at least misleading regarding vaddr.  

The comment is misleading, I'll fix it.  If there are multiple containers and 
unmap-all fails for some container, we need to remap vaddr for the other
containers for which unmap-all succeeded.

> The replay option really
> needs some documentation in comments.

Will do.

>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  hw/vfio/common.c              | 66 ++++++++++++++++++++++++++++++++-----------
>>  hw/vfio/cpr.c                 | 29 +++++++++++++++++++
>>  include/hw/vfio/vfio-common.h |  2 +-
>>  3 files changed, 80 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index c7d73b6..5f2bd50 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -895,15 +895,35 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>>      return true;
>>  }
>>  
>> +static VFIORamDiscardListener *vfio_find_ram_discard_listener(
>> +    VFIOContainer *container, MemoryRegionSection *section)
>> +{
>> +    VFIORamDiscardListener *vrdl = NULL;
> 
> This initialization was copied from current code, but...
> 
> #define QLIST_FOREACH(var, head, field)                                 \
>         for ((var) = ((head)->lh_first);                                \
>                ...
> 
> it doesn't look necessary.  Thanks,

Sure, will remove it.

- Steve
 
>> +
>> +    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
>> +        if (vrdl->mr == section->mr &&
>> +            vrdl->offset_within_address_space ==
>> +            section->offset_within_address_space) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (!vrdl) {
>> +        hw_error("vfio: Trying to sync missing RAM discard listener");
>> +        /* does not return */
>> +    }
>> +    return vrdl;
>> +}
>> +
[...]


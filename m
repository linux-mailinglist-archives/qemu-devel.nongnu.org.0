Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2D23C7269
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:40:18 +0200 (CEST)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ja5-0000WX-9o
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m3JVf-0006mu-CR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:35:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m3JVc-0001KA-0K
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:35:43 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DEXVng004011; Tue, 13 Jul 2021 14:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=g9+S+m/wsE5f/ea8LZsv6e8fPkHNp1lNHBZbbQZXbfY=;
 b=cQgebPtLFstZFU+jBb545+F2vGNimfJGTL3VXy3nA8uExb5S53ec4ekB8sSs1UFGMx6X
 x/WzHX/4xp2ZqfKPQrV4OvXv0+u15/FEGU6WaCJbFMN4XcoZzpPbYLU1vu2W4DEVH3bf
 kCjv+xgJLFhsoIhg1hJ5j/3o4gqEkmiHkolTplsAp8FA11tu1H8INPXDt6RAGKc9p5o9
 rPhZKR39z/leb/pIRgXc7i/jVeGNukAYQo0BJVSUAirtBeozNcUt45BzkeVrEg36fxt4
 +mSo6OgQguRTa1ZcqpJ8vbAAk9U8OTrmuv0uzN585vy2O3ArAEYP2vYqmj5FEG1nvrO9 Iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rnxdjpv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 14:34:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16DEGUNS124444;
 Tue, 13 Jul 2021 14:34:34 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by userp3030.oracle.com with ESMTP id 39q0p4hvth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 14:34:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cw9fIW7yjNukSz2LABMtkm2IpK6Sa4wDcCK14kzUidLnDpb3/j47i137PStt9rDFy67dkT2TMSbnoVuHMOWgOow1MJxna44p1p/NQelKrVX3uBkHUi2z2kRC/GVqIR5sce65UH32qROL4kuWbNvxZtxv0LJh+j88mo9kEp0HisDIckDPFB9lZYC5/S8ntNpKwpKe7DWybyRuO5rQOWE4lZ51pHMEacJgydiOYmabvrlvO5GJaGHXfahGOyP7uoocNJwR2mdnlFAMCO+J8E1rRfnFOpz+tdCv60LtSmwiX+tOSqV5BxJGHOsdTjYeP0ktYMqG1gfjaLVl51ZlIccYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9+S+m/wsE5f/ea8LZsv6e8fPkHNp1lNHBZbbQZXbfY=;
 b=aVyH3Phqw6rXfTbSCG/3LLijoQLH/2IWrBAD85W3Ai5lNtleEW1aYV2QQHhFm4qPuyWFa8cNxre1v/GwwaFuAjqu7qHcuP/+NbCOe2vQexm+6B81FPnFJ2dzE7gdp2xgM78r5fSxI+PuOS4Yrg0dMuKhs1yPAkU/hfRWIN/NMNL2sUYZVwblxducQOPXvTgSEZQ2HsDZKbfP4CI1r19gbSDzZ3Q9x6qQPJTBGiji0QekNGYExcpTc68uHw+z42kTbmNHe4MXTWUPnKm2wyAdXw5MRX7byYubc0GgD5XJDH+qi37oPRtSx8LXVmKhuozYlWdZpmI4KUUcqJ+QFwYj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9+S+m/wsE5f/ea8LZsv6e8fPkHNp1lNHBZbbQZXbfY=;
 b=C6htaMmEA2fmntJ+gzWD9hNzmkorfYoyJE6otNjNBhf2GFHvP7a6XKg86jKTAJN+9yVP6RSVjzPx2t/HMoAYoA3Irf/X08EKa9GWQCa4rhgwo/Md1RHEtyGV3GlOmv60wSYEcfBamhuo8CMzB0AeT1VEusbNs2gEs7XgtqSxoFg=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4621.namprd10.prod.outlook.com (2603:10b6:a03:2d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 14:34:30 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 14:34:30 +0000
Subject: Re: [PATCH V5 20/25] chardev: cpr framework
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-21-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CKewOW60x281gNM_8mfsygGL5jK7GOJba0MPmHgR3nk1Q@mail.gmail.com>
 <7e07ac54-e6dd-4554-1e2b-c51b12239fd2@oracle.com>
 <CAJ+F1CJbsMEV+nxSFbkg8pH9D76hyA6oHPr=c+g2gQn=K+zs4Q@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <37802380-bf29-db28-38a4-a931778d79b2@oracle.com>
Date: Tue, 13 Jul 2021 10:34:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1CJbsMEV+nxSFbkg8pH9D76hyA6oHPr=c+g2gQn=K+zs4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:180::33) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 BY5PR13CA0020.namprd13.prod.outlook.com (2603:10b6:a03:180::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.12 via Frontend
 Transport; Tue, 13 Jul 2021 14:34:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b5517bb-08e5-4208-af76-08d9460b5320
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB46217DFD3A8CABAA7E66BC5CF9149@SJ0PR10MB4621.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqQZC/giUJSioSOcriwGW9eyQCrLG61UmZ0082q5uN67VHbu1Jl4IO5Hu4jkRU0dXTzDdAvtLmjh9lA4jgltHgUyPHwFMZ6jgYrkZaw3cW6/r3oh+lMrq/uewAp/zDZrEOZxM/zPHb0YFxDQhit3OdZNqTpMc9u8jMpFiz7W9LUuq8ip3qeXHPEbGM0l1uP14f0HAfSYvBW5kciAnzmPmRhFplxpevfkIqDwrSuFT3Kx0XEuZH6OGelrSuT1qJ9ErysuWBWYyC84ckDiYuReVB5X+QVyJc45OrpH702QuOxGC4z5Kpu2MdRWimFRjXuvJjQkwslV881ClpvhEP2GOa32vgdl3OfyMHpSQm2EjKWo70QJucy6+81wbs/8zltoXuQm8UU+XXB7I3KTsgivBUXNiFAQirYAoaqD665YZfLKN26bq9qKYNRIr0cs/mhXqFhAtU80pA2UHD5H2HHPfZely6XHRUD956S7uGdOJ3uHKaPMGUVQzjyF2WeZ7I/d7NW5rqJjmWm0358qgvm67nLSNTxqbG9qwz2THANCcPnpM93+Hfq/QpGL4b2F5f/1UdaG1rzOsL4xYvt+qGtmVllxtzgEaBG/VsKRi54HrcwopI/TGT3t6G9Nrj6Ht/o73XQ5VE4hY7OP8WXFSMw8VAVvnr5KyEcjMpHHx89rFxEfbeLOsU8xRFKJvvICXPUUwRsfUli9s9VJNIKnzuY1BufDixnyNpIbtjRlYyCvGr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(136003)(396003)(39860400002)(66946007)(66476007)(2906002)(44832011)(66556008)(7416002)(26005)(478600001)(186003)(31686004)(30864003)(2616005)(6916009)(54906003)(36756003)(38100700002)(956004)(86362001)(8676002)(316002)(16576012)(8936002)(4326008)(5660300002)(36916002)(53546011)(83380400001)(31696002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bERPaXliNzJwWTFPMkVyOW81YzArV0hJWk05NzFWd0Y5Ly8yd2ZxV1BTdUxt?=
 =?utf-8?B?M0JicDlRb1hsaVhUdnNHRyt2NVA1Tkxydm1DeFB6Q1RDSGRyVThsY1R6R2Z1?=
 =?utf-8?B?UEdmLzRKM1ZEMEtKZFJTNlNqT3VNTlliajdPT2NETVl4VlFYS2ZIU2Q0ZzAx?=
 =?utf-8?B?VWN4N3kreTRjREdmM1MwcVp3OUt6WnphUFJlYWNJTEtDTXRwMjNKMXZXVEc2?=
 =?utf-8?B?Vk93L2llbCt6aTI0R29mU0tmMHRVM1NGZ0tjSm5ZQjcva0Y2TEpacThVVVJt?=
 =?utf-8?B?eHhYbnk1UTQyTENvemJvRXhSbHE0Ukl2MCsvUEs2YXZ5RnEvRXpzZVBQdlVK?=
 =?utf-8?B?SjBOZ2s2ZmJ3Z1lBSDhybEtVMFVVQmVraEloM00rYXJUcUZHbVB1dTZRMi9a?=
 =?utf-8?B?TTJZajk1dS9TTm9CSCtIcFFNUjBDbTRDZFc5b01qVkVCZmVlRlhyS3BxY3Yv?=
 =?utf-8?B?WFpHbktjWm1NOGdEeGZ5VExEdGZHcWhlR2w2eEFkU1EzMXNsSURmL2w2MFdQ?=
 =?utf-8?B?M25lRmczd01Db3RWOS8yWWk5dS9kYk5uTmlzWHFmQVVxdUU2OHptYVVQNUJO?=
 =?utf-8?B?cGJYRHRCejJQYW55VFlwVWtJQkZIRzhrM0FUcm9wRlBnU1Y3Q09tV2pzWFRn?=
 =?utf-8?B?MzZUcGVPUEpxS3ArT3JJSk1mbGkvSUtRU3lDTUd0NEZZVWhwK2hOUEY5dmdp?=
 =?utf-8?B?L2ZlOGYxQWhLZi9CYWRUMFRyZ2prZ29EeXRZYXc0U1JjemV2dmgwaksra2wz?=
 =?utf-8?B?d0QrbmZoaXJ2eTZrdi9uQ1JPeWJRODJqTnU3azZHamVMeEQyZFZQaWxjSWVu?=
 =?utf-8?B?aThNTGdQVVRwRmZYd1c2Qml1OVQ1VnN2RDJLUjk0aW1NQW9iUEwrdk5wazgz?=
 =?utf-8?B?d0V2SXBqY3p3TVJSTnc2cG1oVG92UDF5b3pFUDdaYXkzQ05qR3NyYktndVFv?=
 =?utf-8?B?SDdKUGR3REZQZGljY0l4WFBBSFFSVWVyMnhNakhPSVZKQlhDejFUcTh5NFI3?=
 =?utf-8?B?THhObzdCQ1NNekxmT1FrRjJzODJMT25SVVpuYzFTcFVtRTNRVEJmUWZRdEdV?=
 =?utf-8?B?SU84TWZYaFlxUEE5UnJiU1hPSENQUXd6WW9ubSttVUxCL1ZhNDFKOTlkVDNB?=
 =?utf-8?B?SkU5MnBlZXRzdW1USDFLbXByREloUWs1dW9VYnNNWFhMZzhGeHpubUJBMVYz?=
 =?utf-8?B?OS85UW15TTFxclFXNGFoUFgveHNmUlQ2SmdyWGN6ZzUwMlhVYVJPWWZnZnpx?=
 =?utf-8?B?Ty9kcXp1UmJFT1MzaFJzWFd6alZ2RmkwdGFHbVFldmJRWFNwYVBlQ1N4NlJP?=
 =?utf-8?B?QjdZMFNYV2FEZWdkdEZvTDlDTzRHdDloSklaYi9wUDlTZmcwRVR6dTlIbVVz?=
 =?utf-8?B?dTZiOFllVWdTeVlTMlhYdCsycXM5VHpzTnNLM05mMnBuUzY2aGRuWC8vb0hT?=
 =?utf-8?B?L1lrTE5GR2lzMjNVeERBaG5TeWdXNHBKUVRnNXBRQlA1QXBYVFBHS2FIMXZy?=
 =?utf-8?B?WDZmNTg0eE93MnQyTXJwOW5obm1sYlRja1IrcDg1ZXpSaXZMb0ZBQlh5NmlS?=
 =?utf-8?B?eDM3VzZOcWFVcTRGeGZ6N2VHbm1mRnZtRGxUYThSOTh4M29sOEJBUXpBelhU?=
 =?utf-8?B?L3FENVpXbFNqdWI2TGhVK1lCLzYwVE5rSEJuTHVFU3NEc2huL0Z6MTdaZHYv?=
 =?utf-8?B?cTRhbFNUZmVzOWZ3QklhSEhsZ2tXVmovL1Y1bFBjeGhBcktLeGMrcXN6U3A1?=
 =?utf-8?Q?WlYtpOV0d3NAVr/obhH4OU3YMs2lwJk0TWRq62J?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5517bb-08e5-4208-af76-08d9460b5320
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 14:34:30.5869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OBeyyjhT8LTCNLgA7r6Wiuf5gUlSZprriCalj37WGbvk+FMD+kCtMYH1uOZGZQGzW6m1/Trhg2WfpLEG3ICZeCYuM7jLqXMQMI7m3nKL0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4621
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130092
X-Proofpoint-GUID: 2tixh7I5EDeKWVScqePjl84XZMuXXwmM
X-Proofpoint-ORIG-GUID: 2tixh7I5EDeKWVScqePjl84XZMuXXwmM
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7,
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

On 7/12/2021 3:49 PM, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Jul 12, 2021 at 11:20 PM Steven Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     On 7/8/2021 12:03 PM, Marc-André Lureau wrote:
>     > Hi
>     >
>     > On Wed, Jul 7, 2021 at 9:37 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com> <mailto:steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>> wrote:
>     >
>     >     Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
>     >     Add the chardev close_on_cpr option for devices that can be closed on cpr
>     >     and reopened after exec.
>     >     cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or close_on_cpr is set
>     >     for all chardevs in the configuration.
>     >
>     >
>     > Why not do the right thing by default?
> 
>     Char devices with buffering in the qemu process do not support cpr, as there is no general mechanism
>     for saving and restoring the buffer and synchronizing that with device operation.  In theory vmstate
>     could provide that mechanism, but sync'ing the device with vmstate operations would be non-trivial,
>     as every device handles it differently, and I did not tackle it.  However, some very  useful devices
>     do not buffer, and do support cpr, so I introduce QEMU_CHAR_FEATURE_CPR to identify them.  CPR support
>     can be incrementally added to more devices in the future via this mechanism.
> 
>     > Could use some tests in tests/unit/test-char.c
> 
>     OK, I'll check it out.  I have deferred adding unit tests until I get more buy in on the patch series.
> 
> 
> I understand :) Tbh, I have no clue if you are close to acceptance. (too late for 6.1 anyway, you can already update the docs)
> 
> 
>     >     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com> <mailto:steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>>
>     >     ---
>     >      chardev/char.c         | 41 ++++++++++++++++++++++++++++++++++++++---
>     >      include/chardev/char.h |  5 +++++
>     >      migration/cpr.c        |  3 +++
>     >      qapi/char.json         |  5 ++++-
>     >      qemu-options.hx        | 26 ++++++++++++++++++++++----
>     >      5 files changed, 72 insertions(+), 8 deletions(-)
>     >
>     >     diff --git a/chardev/char.c b/chardev/char.c
>     >     index d959eec..f10fb94 100644
>     >     --- a/chardev/char.c
>     >     +++ b/chardev/char.c
>     >     @@ -36,6 +36,7 @@
>     >      #include "qemu/help_option.h"
>     >      #include "qemu/module.h"
>     >      #include "qemu/option.h"
>     >     +#include "qemu/env.h"
>     >      #include "qemu/id.h"
>     >      #include "qemu/coroutine.h"
>     >      #include "qemu/yank.h"
>     >     @@ -239,6 +240,9 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
>     >          ChardevClass *cc = CHARDEV_GET_CLASS(chr);
>     >          /* Any ChardevCommon member would work */
>     >          ChardevCommon *common = backend ? backend->u.null.data : NULL;
>     >     +    char fdname[40];
>     >
>     >
>     > Please use g_autoptr char *fdname = NULL; & g_strdup_printf()
> 
>     Will do. 
>     (the glibc functions are new to me, and my fingers do not automatically type them).
> 
>     >     +
>     >     +    chr->close_on_cpr = (common && common->close_on_cpr);
>     >
>     >          if (common && common->has_logfile) {
>     >              int flags = O_WRONLY | O_CREAT;
>     >     @@ -248,7 +252,14 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
>     >              } else {
>     >                  flags |= O_TRUNC;
>     >              }
>     >     -        chr->logfd = qemu_open_old(common->logfile, flags, 0666);
>     >     +        snprintf(fdname, sizeof(fdname), "%s_log", chr->label);
>     >     +        chr->logfd = getenv_fd(fdname);
>     >     +        if (chr->logfd < 0) {
>     >     +            chr->logfd = qemu_open_old(common->logfile, flags, 0666);
>     >     +            if (!chr->close_on_cpr) {
>     >     +                setenv_fd(fdname, chr->logfd);
>     >     +            }
>     >     +        }
>     >              if (chr->logfd < 0) {
>     >                  error_setg_errno(errp, errno,
>     >                                   "Unable to open logfile %s",
>     >     @@ -300,11 +311,12 @@ static void char_finalize(Object *obj)
>     >          if (chr->be) {
>     >              chr->be->chr = NULL;
>     >          }
>     >     -    g_free(chr->filename);
>     >     -    g_free(chr->label);
>     >          if (chr->logfd != -1) {
>     >              close(chr->logfd);
>     >     +        unsetenv_fdv("%s_log", chr->label);
>     >          }
>     >     +    g_free(chr->filename);
>     >     +    g_free(chr->label);
>     >          qemu_mutex_destroy(&chr->chr_write_lock);
>     >      }
>     >
>     >     @@ -504,6 +516,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
>     >
>     >          backend->has_logappend = true;
>     >          backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
>     >     +
>     >     +    backend->close_on_cpr = qemu_opt_get_bool(opts, "close-on-cpr", false);
>     >
>     >
>     > If set to true and the backend doesn't implement the CPR feature, it should raise an error.
> 
>     Setting to true is the workaround for missing CPR support, so that cpr may still be performed. 
>     The device will be reopened post exec.  That is not as nice as transparently preserving the device,
>     but is nicer than disallowing cpr because some device(s) of many do not support it.
> 
> 
> ok, "reopen-on-cpr" would be more descriptive then.
> 
> 
>     >      }
>     >
>     >      static const ChardevClass *char_get_class(const char *driver, Error **errp)
>     >     @@ -945,6 +959,9 @@ QemuOptsList qemu_chardev_opts = {
>     >              },{
>     >                  .name = "abstract",
>     >                  .type = QEMU_OPT_BOOL,
>     >     +        },{
>     >     +            .name = "close-on-cpr",
>     >     +            .type = QEMU_OPT_BOOL,
>     >      #endif
>     >              },
>     >              { /* end of list */ }
>     >     @@ -1212,6 +1229,24 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
>     >          return source;
>     >      }
>     >
>     >     +static int chr_cpr_capable(Object *obj, void *opaque)
>     >     +{
>     >     +    Chardev *chr = (Chardev *)obj;
>     >     +    Error **errp = opaque;
>     >     +
>     >     +    if (qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) || chr->close_on_cpr) {
>     >
>     > That'd be easy to misuse. Chardev should always explicitly support CPR feature (even if close_on_cpr is set)
> 
>     Given my explanation at top, does this make sense now? 
> 
> I think I understand the purpose, but it feels quite adventurous to rely on this behaviour by default, even if the feature flag is set. Could it require both FEATURE_CPR && reopen-on-cpr?

I'm not following your point.  Let me elaborate in case my intent is not clear.  I use your 
suggested name reopen-on-cpr, but the functionality is otherwise the same:

  reopen-on-cpr is false by default for all devices, and QEMU_CHAR_FEATURE_CPR is true only for
  devices that operate properly when their descriptor is preserved across exec.  

  cpr is blocked if any device exists that does not support the feature, and is not marked as
  reopen-on-cpr.  The user must explicitly add close-on-cpr=on to the device parameters to allow
  cpr to proceed for such a device.

  For devices that do support QEMU_CHAR_FEATURE_CPR, the user may still set reopen-on-cpr=true
  to ignore the feature and recreate the device in its initial state after exec.

Are you suggesting that the user should opt-in to using QEMU_CHAR_FEATURE_CPR?  Such as via
a more expressive flag?

  -chardev ...[,cpr=on|off|reopen]
      on:     allow cpr iff the device has QEMU_CHAR_FEATURE_CPR
      off:    do not allow cpr
      reopen: allow cpr.  reopen the device after exec.

  chr_cpr_capable(Object *obj, void *opaque)
    if ((qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) && chr->cpr == ON) || 
        chr->cpr == RESTART)
            return 0;		/* cpr is allowed */

- Steve

>     >     +        return 0;
>     >     +    }
>     >     +    error_setg(errp, "error: chardev %s -> %s is not capable of cpr",
>     >     +               chr->label, chr->filename);
>     >     +    return 1;
>     >     +}
>     >     +
>     >     +bool qemu_chr_cpr_capable(Error **errp)
>     >     +{
>     >     +    return !object_child_foreach(get_chardevs_root(), chr_cpr_capable, errp);
>     >     +}
>     >     +
>     >      void qemu_chr_cleanup(void)
>     >      {
>     >          object_unparent(get_chardevs_root());
>     >     diff --git a/include/chardev/char.h b/include/chardev/char.h
>     >     index 7c0444f..e488ad1 100644
>     >     --- a/include/chardev/char.h
>     >     +++ b/include/chardev/char.h
>     >     @@ -50,6 +50,8 @@ typedef enum {
>     >          /* Whether the gcontext can be changed after calling
>     >           * qemu_chr_be_update_read_handlers() */
>     >          QEMU_CHAR_FEATURE_GCONTEXT,
>     >     +    /* Whether the device supports cpr */
>     >     +    QEMU_CHAR_FEATURE_CPR,
>     >
>     >          QEMU_CHAR_FEATURE_LAST,
>     >      } ChardevFeature;
>     >     @@ -67,6 +69,7 @@ struct Chardev {
>     >          int be_open;
>     >          /* used to coordinate the chardev-change special-case: */
>     >          bool handover_yank_instance;
>     >     +    bool close_on_cpr;
>     >          GSource *gsource;
>     >          GMainContext *gcontext;
>     >          DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
>     >     @@ -291,4 +294,6 @@ void resume_mux_open(void);
>     >      /* console.c */
>     >      void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
>     >
>     >     +bool qemu_chr_cpr_capable(Error **errp);
>     >     +
>     >      #endif
>     >     diff --git a/migration/cpr.c b/migration/cpr.c
>     >     index 6333988..feff97f 100644
>     >     --- a/migration/cpr.c
>     >     +++ b/migration/cpr.c
>     >     @@ -138,6 +138,9 @@ void cprexec(strList *args, Error **errp)
>     >              error_setg(errp, "cprexec requires cprsave with restart mode");
>     >              return;
>     >          }
>     >     +    if (!qemu_chr_cpr_capable(errp)) {
>     >     +        return;
>     >     +    }
>     >          if (vfio_cprsave(errp)) {
>     >              return;
>     >          }
>     >     diff --git a/qapi/char.json b/qapi/char.json
>     >     index adf2685..5efaf59 100644
>     >     --- a/qapi/char.json
>     >     +++ b/qapi/char.json
>     >     @@ -204,12 +204,15 @@
>     >      # @logfile: The name of a logfile to save output
>     >      # @logappend: true to append instead of truncate
>     >      #             (default to false to truncate)
>     >     +# @close-on-cpr: if true, close device's fd on cprsave. defaults to false.
>     >     +#                since 6.1.
>     >      #
>     >      # Since: 2.6
>     >      ##
>     >      { 'struct': 'ChardevCommon',
>     >        'data': { '*logfile': 'str',
>     >     -            '*logappend': 'bool' } }
>     >     +            '*logappend': 'bool',
>     >     +            '*close-on-cpr': 'bool' } }
>     >
>     >      ##
>     >      # @ChardevFile:
>     >     diff --git a/qemu-options.hx b/qemu-options.hx
>     >     index fa53734..d5ff45f 100644
>     >     --- a/qemu-options.hx
>     >     +++ b/qemu-options.hx
>     >     @@ -3134,43 +3134,57 @@ DEFHEADING(Character device options:)
>     >
>     >      DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>     >          "-chardev help\n"
>     >     -    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off][,close-on-cpr=on|off]\n"
>     >          "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]\n"
>     >          "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
>     >     -    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
>     >     +    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID][,close-on-cpr=on|off] (tcp)\n"
>     >          "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
>     >     -    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off] (unix)\n"
>     >     +    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off][,close-on-cpr=on|off] (unix)\n"
>     >          "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
>     >          "         [,localport=localport][,ipv4=on|off][,ipv6=on|off][,mux=on|off]\n"
>     >     -    "         [,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,logfile=PATH][,logappend=on|off][,close-on-cpr=on|off]\n"
>     >          "-chardev msmouse,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >          "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
>     >          "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >          "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >          "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >          "-chardev pipe,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >      #ifdef _WIN32
>     >          "-chardev console,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >          "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >      #else
>     >          "-chardev pty,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >          "-chardev stdio,id=id[,mux=on|off][,signal=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >      #endif
>     >      #ifdef CONFIG_BRLAPI
>     >          "-chardev braille,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >      #endif
>     >      #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
>     >              || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
>     >          "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >          "-chardev tty,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >      #endif
>     >      #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
>     >          "-chardev parallel,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >          "-chardev parport,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >      #endif
>     >      #if defined(CONFIG_SPICE)
>     >          "-chardev spicevmc,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >          "-chardev spiceport,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
>     >     +    "         [,close-on-cpr=on|off]\n"
>     >      #endif
>     >          , QEMU_ARCH_ALL
>     >      )
>     >     @@ -3245,6 +3259,10 @@ The general form of a character device option is:
>     >          ``logappend`` option controls whether the log file will be truncated
>     >          or appended to when opened.
>     >
>     >     +    Every backend supports the ``close-on-cpr`` option.  If on, the
>     >     +    devices's descriptor is closed during cprsave, and reopened after exec.
>     >     +    This is useful for devices that do not support cpr.
>     >     +
>     >      The available backends are:
>     >
>     >      ``-chardev null,id=id``
>     >     --
>     >     1.8.3.1
>     >
>     >
>     >
>     >
>     > --
>     > Marc-André Lureau
> 
> 
> 
> -- 
> Marc-André Lureau


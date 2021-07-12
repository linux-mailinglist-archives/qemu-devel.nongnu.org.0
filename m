Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0F3C63A0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:23:05 +0200 (CEST)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31WB-0005pC-Ss
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m31T7-0003l0-Eg
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:19:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m31T3-0003G5-KV
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:19:53 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CJJjB5003471; Mon, 12 Jul 2021 19:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=OYf8pr+cMn5mOMG+5Qvn+Hyi2lh/apC37U9h07qacS4=;
 b=G6oNrJphf+mHNce8cQR+EQHz8CXpmZPF3gN/liM6rnZIFFO5yUTrcpGOomM3pfC42G6G
 NkRYOfrj5xVvDJseHGcpNdGKiTaeTmMeGCogtLhEwore1obI3dxjFLmXssVe/wdaKjfj
 qDd1n9OcCniJLO4wgVhZg6vazeBf5kGVycaOWsT4wrOHtUnz6vp77uWObIuwTisz0a/T
 y8t6EnaW95pfj49IpEOqB6try2kqFSvn4VhsLbY2NCLG8ned47A2WG8Os2tZb+gmeNSI
 gMSBusiiDp524GOpD2mKhCjn497rpU7b4G8O9+cARYz1iXCCUeSoD9qNCkAwTEe1NLTA pA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rpd8rwfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 19:19:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CJEros124705;
 Mon, 12 Jul 2021 19:19:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by aserp3030.oracle.com with ESMTP id 39qycsmjqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 19:19:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKHXYUqSeJxx9ZDC9h/MOcN7hwi6PBxk1nqaHhjVobN8iQS5SesPZUOzrgpeXpEgUz9HQteLLbI23aE935AOwJc+Bm/QwpgT20gYtdASJl9jqmSF4kxGSV2J0PRIPPJOys9ocFHiFrYRc0qLRimGncwKMZ0rI3oSDj2sLrfTKatewlyNTfJvEFUWu1VVtlCeO+q9sTontofsmftjRJEeGXFElTPor51ywb4uxqlXWZbmMX35CaOBee8dovlY2+4YPvQ8okQ1JzaDLgxoUum38Na1UHf7osxViUT9yAkz3e3jp0gEfwUNH/OiS/Qldya7zndDOjliTyrSEBRv8M5JdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYf8pr+cMn5mOMG+5Qvn+Hyi2lh/apC37U9h07qacS4=;
 b=nUqkzB5yGANGsqWMqOTCZzcbXMsYAXSnee0VutIPCAfBFT1qGbodO6VKvntNmyI3OnFcBSezklXyGntc38xiYWDMeqCxjQh5ptLE1PNLFi9oq6tkllEgop8xsarelWJOkhIIRXogdQ04sMzjfn2hv5tGWgM4NE0uT6ZmW/R+/8MjdEukPFXcQUfcKQokVrQQXd0dVDO6GL5UQZS16hpjus+zuTrSBV1WTK4WPp5yk1gWgQEmTBdUST6V4ajFDPxacjJfXjpR8M2Tm5ifYN0dbSPbvaFArBmJhA7bUhzV/P9B06wJ8yi+4vzpAwqBQUZvKRkl3FX+z4FJnC6Mb2IAAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYf8pr+cMn5mOMG+5Qvn+Hyi2lh/apC37U9h07qacS4=;
 b=jBaFm9jUhqGIb4yVjJVMqLcMOI+2pW6k5+rx1TqAFeI/2i8GtKdhDj7wnZ83FuRUIetKDhQru7qajgAY3Et6CpsNN4D8sFx6s6BL/vJxpyXHVTu1Z0GHYx3qnZ7qtEeayHE9IlFMfFXIpnZ2rQdhAPXEba4bepu8aXCGhCMdFQY=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3128.namprd10.prod.outlook.com (2603:10b6:a03:14e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Mon, 12 Jul
 2021 19:19:42 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 19:19:42 +0000
Subject: Re: [PATCH V5 10/25] util: env var helpers
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-11-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CKEPHdJLNc7gHzsRm8xz7=qXES2v-mjPrp_6WS+73hp6Q@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <a682572b-8d24-c6e3-9036-2ba6349eb4e6@oracle.com>
Date: Mon, 12 Jul 2021 15:19:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1CKEPHdJLNc7gHzsRm8xz7=qXES2v-mjPrp_6WS+73hp6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SJ0PR13CA0153.namprd13.prod.outlook.com (2603:10b6:a03:2c7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.11 via Frontend Transport; Mon, 12 Jul 2021 19:19:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9b8194c-42f7-4831-07c9-08d9456a0013
X-MS-TrafficTypeDiagnostic: BYAPR10MB3128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB312813F02DE6F8AA43483AC2F9159@BYAPR10MB3128.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGvt511rPnUT6bo8XdZxyADWdPlcwr6Y79hn1CbiJEfyCSUbyLAyUly9mO3ZXQ2fH/yDWiPydIF1zCkIQLaxc1+5igqORrJJZFXEPSK1va1mzU1iKdKMH5CJO8xPlpCwCFql0kxShyC7aFIkpnGbbk8mWZCJFS+LquxqGylEFhoqzF28XA4L3ev3ji7s7dumsbVHimrjWKlD3I8C9D4o9YnmJtrIT6HaG8ZvhuUOjJIzpIw31MmbGF2VEdMCd3wsvBKWLXa3PGkpG1IVe5+Yi4JghXaIc4bNOq0rnBfIZzJWT2M39PzQJ9mPbRYtNAMNOKosLIfvJwFe8yhpgiDwaXeOtennwvWwSypJtUVpM9WT2UtkJCCHuamqlp1psMM8RBvwQ50HBoiO2u4kmdxDuKbOOysqraLc+ZhwJpyWvGpqawdRNNNAI9l7PN1Fu0x87oo7GOD3TIfamGze4TeTYdzAiPEwwSLh7p9RT+DtIaSYr8YpRxS844c8GhMtJiThaZK5cQn9eR/qm9IP3uMIMP8JArXauksq1GJQb4hkCDXrtMFZbdSYfeAV2MLJOc9xL3cD9MUTwAcoZOr1ZvRcSQ7Ab2vTTfhwe9KFeEDWC5PsnV+FUhYObXZke1b943umnhdNzthIp5yO0kWLoZZaN6CYwm7T+Y2CYnEs/bWSL7N2U18wcz53DnKkfdPibPGWgWEq+QfO78kSfzQNzDQyM40aYQtd+DuJFgpl2bKqwKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(396003)(346002)(366004)(478600001)(2906002)(66476007)(5660300002)(66556008)(36916002)(26005)(8936002)(6486002)(8676002)(53546011)(66946007)(83380400001)(7416002)(44832011)(6916009)(31696002)(4326008)(36756003)(186003)(86362001)(38100700002)(54906003)(316002)(31686004)(16576012)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?di95Y1lWeERNcGJoWnFPbW9nSEw0d2FRamhyZ3J1L3VXd0xESDd0U3UvQTdG?=
 =?utf-8?B?dUFidGN6bkszZEhpRkpPUlN6cnc1R3RsQmV2dFB5MjVJTit3SnZ2NXVkOUpE?=
 =?utf-8?B?eGFiaTFOb3dEYlBtNUNrTkdMNHFVcUJCaHpXSXZQZWp2Mk16UjQ4STFYUnBs?=
 =?utf-8?B?TEQ4SmQ3WE9pcExESWpTTnUwZ3JiWkl1bDFrd3NyL3djci9FQmhSRW9zM0tT?=
 =?utf-8?B?MlMwb1dBVE1NQlo5dE9VbU05K0IzUHlYMkpNOFdMWlVRVlJKTDgvNXBuS04x?=
 =?utf-8?B?REdjSDNTdzJOd3lrWnExR2djYko2K0dRWjhRQ2dYeXdzZG1aTXhKVlhHTU1Y?=
 =?utf-8?B?VWZVaThocDJCTVpxcnh4R0ZTeC9kYi9CdlNqaGhKaGZNbmlHdzZDSnZVTHMy?=
 =?utf-8?B?MlRCajNMcFFNMU9hREhOQUFiVktwb3NSc0NpTkYxazM5SXZMTWhSUng2TTNq?=
 =?utf-8?B?eHA2WGFRZ3Y5V0FJbFNXWlFUbUUrWWFiS0thRUpTdGFkNmJyaytUZnVsaCsv?=
 =?utf-8?B?eGc2cThER05qRHZ5TThacDNlTk5jbC9MdmxnQ1RZczJYeFYyVDk4WWUvWE9L?=
 =?utf-8?B?NitjZCtSU3pBTU1NUXRmbHdmU21YMlY4N3k2Vk9LZmptRGl6enFnR21MN2ty?=
 =?utf-8?B?eUpyYTFFRURXRHk1VGtFck8xRGhsazUzakhiTEpvaDZqMlpDUnZ2ZThYUUpr?=
 =?utf-8?B?dmV6NmxjTlRCdEFjcHp0SGRrTjBuZDdKekdkWlQxRWdGUlBsdnBzbEpsYkdt?=
 =?utf-8?B?VkRrWkZ1MCsyaG00KzBRT1BWR3EyTHVNR2h3MXJzL2hqcFRJTVoxOXF4ZXNB?=
 =?utf-8?B?aDZvamNCc0R3YVUrQUFsbXB2VlZxcGJQTE9EaWJGL3BSaFN1SVN4cVphWjl5?=
 =?utf-8?B?REQybWZLdnZwSFZUOXBGRWFuY2gyM2MwZ3hla0EvaVV1cVhva05qUXNuUjRJ?=
 =?utf-8?B?bkJzZENobGdZdnJ0dDNVNlJWL1c3WGg2MVlvbzhPUnhNT2VLamI1ZTBPWWRa?=
 =?utf-8?B?R1d5cHR6Y0Exa1VpYjU2ejdyVnZDbW1URTFhVHdxZm1yOTJlejFYcjZVRnVk?=
 =?utf-8?B?TjBwOFhDT2hRR0ZWaUhLQzBKWm9LbDI0cDR3Q1Rib254R0M5WklvNzJST0Qx?=
 =?utf-8?B?aXBab3ZpMGpVckE4L3JDOExQMWVBV29lRnVMV0tNM2hDbEZ5aER5U2VwMW4z?=
 =?utf-8?B?cjBIQlVUSTBaejZKMXhBN01pckVOTUtqTnB5UmY1VjJlbFJHOGF3b1RqRUVw?=
 =?utf-8?B?WGNCUXRpcytpV0VoaFRYVThnSWs3clIwWnZKbTI2STZlR3BYZHk4T0tnaVZs?=
 =?utf-8?B?ekVKR3RKbHZRbHc4L2RodElGdDlvSEtwaUYvQ0MvVitIVFFwUzRPV3NjL1dt?=
 =?utf-8?B?K2NNczNZQlo5Ny9jR3hQOTNOOGFnaFlFWEtERXpaRTFCZS92V2t0NndvNzNV?=
 =?utf-8?B?MEUwMlg3cDdYVWRNMU8vdDdHRDFWNk1neExyeS9pK085UllhT3RZV1FaeE9q?=
 =?utf-8?B?a3VrVFU1ZEhkZDM5MDMwRkRrbmM1QUlUYjBuQXFhV2hUVVdyRHJnV0R6M1lO?=
 =?utf-8?B?WC9YUDFFR250cU9KMnRwdE5UQktSZkUyUjJoLzBPMnRQR2FvZHFBZGQzRlJp?=
 =?utf-8?B?TUJna2JvVlh5R3pwQnpkdE9rdjU5SGdhMG1SemtoRWNGb1NMdzB5UHllT2tD?=
 =?utf-8?B?TDBIMDFobVM4RmtDb0VsSHVmUUVybTgvaUs0U1FhOG1QbnVxTFNMYWJoMUxP?=
 =?utf-8?Q?G+JbckdzbC0CSkTKxWAkmJgsl72okeM+OXMBVIa?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b8194c-42f7-4831-07c9-08d9456a0013
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:19:42.2881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzYW12GEYm4lbcHWJrxGPGkDXDGTF2JTS/FSN1xXEIOp3LII3cN7k+Jq4XMExOzkvwk6UxDh7iUGtqFJLr2r61LfdNmoPXzyVOcVee9oLaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3128
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120137
X-Proofpoint-GUID: 8sCoYJU3mbXQNPOIrGYeufqR4Icqz1ys
X-Proofpoint-ORIG-GUID: 8sCoYJU3mbXQNPOIrGYeufqR4Icqz1ys
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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

On 7/8/2021 11:10 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:30 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Add functions for saving fd's and other values in the environment via
>     setenv, and for reading them back via getenv.
> 
> 
> I understand that the rest of the series will rely on environment variables to associate and recover the child-passed FDs, but I am not really convinced that it is a good idea.
> 
> Environment variables have a number of issues that we may encounter down the road: namespace, limits, concurrency, observability etc.. I wonder if the VMState couldn't have a section about the FD to recover. Or maybe just another shared memory region?

They also have some advantages.  Their post-exec value can be observed via /proc/$pid/environ,
and modified values can be observed by calling printenv() in a debugger.  They are naturally carried
across exec, with no external file to create and potentially lose.  Lastly, libcs already defines
put and get methods, so the additional layered code is small and simple.  The number of variables
is small, and I would rather not over-engineer an alternate solution until the env proves
inadequate.  The limits on env size are huge on Linux.  The limits are smaller on Windows, but
that is just one of multiple issues to be addressed to support live update on windows.

For the alternatives, shared memory is no more observable (maybe less) and also has no concurrency
protection.  VMstate does not help because the descriptors are needed before the vmstate file
is opened.
 
> Some comments below. These new utils could also have some unit tests.

OK.

>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      MAINTAINERS        |  2 ++
>      include/qemu/env.h | 23 +++++++++++++
>      util/env.c         | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>      util/meson.build   |  1 +
>      4 files changed, 121 insertions(+)
>      create mode 100644 include/qemu/env.h
>      create mode 100644 util/env.c
> 
>     diff --git a/MAINTAINERS b/MAINTAINERS
>     index c48dd37..8647a97 100644
>     --- a/MAINTAINERS
>     +++ b/MAINTAINERS
>     @@ -2865,6 +2865,8 @@ S: Maintained
>      F: include/migration/cpr.h
>      F: migration/cpr.c
>      F: qapi/cpr.json
>     +F: include/qemu/env.h
>     +F: util/env.c
> 
>      Record/replay
>      M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru <mailto:pavel.dovgaluk@ispras.ru>>
>     diff --git a/include/qemu/env.h b/include/qemu/env.h
>     new file mode 100644
>     index 0000000..3dad503
>     --- /dev/null
>     +++ b/include/qemu/env.h
>     @@ -0,0 +1,23 @@
>     +/*
>     + * Copyright (c) 2021 Oracle and/or its affiliates.
>     + *
>     + * This work is licensed under the terms of the GNU GPL, version 2.
>     + * See the COPYING file in the top-level directory.
>     + *
>     + */
>     +
>     +#ifndef QEMU_ENV_H
>     +#define QEMU_ENV_H
>     +
>     +#define FD_PREFIX "QEMU_FD_"
>     +
>     +typedef int (*walkenv_cb)(const char *name, const char *val, void *handle);
>     +
>     +int getenv_fd(const char *name);
>     +void setenv_fd(const char *name, int fd);
>     +void unsetenv_fd(const char *name);
>     +void unsetenv_fdv(const char *fmt, ...);
>     +int walkenv(const char *prefix, walkenv_cb cb, void *handle);
>     +void printenv(void);
> 
> 
> Please use qemu prefix, that avoids potential confusion with system libraries.
> 
>     +
>     +#endif
>     diff --git a/util/env.c b/util/env.c
>     new file mode 100644
>     index 0000000..863678d
>     --- /dev/null
>     +++ b/util/env.c
>     @@ -0,0 +1,95 @@
>     +/*
>     + * Copyright (c) 2021 Oracle and/or its affiliates.
>     + *
>     + * This work is licensed under the terms of the GNU GPL, version 2.
>     + * See the COPYING file in the top-level directory.
>     + */
>     +
>     +#include "qemu/osdep.h"
>     +#include "qemu/cutils.h"
>     +#include "qemu/env.h"
>     +
>     +static uint64_t getenv_ulong(const char *prefix, const char *name, int *err)
>     +{
>     +    char var[80], *val;
>     +    uint64_t res = 0;
>     +
>     +    snprintf(var, sizeof(var), "%s%s", prefix, name);
> 
> 
> No check for success / truncation...
> 
> Please use g_autofree char *var = g_strdup_printf()..
> 
>     +    val = getenv(var);
> 
> 
> For consistency, I'd use g_getenv()
> 
>     +    if (val) {
>     +        *err = qemu_strtoul(val, NULL, 10, &res);
>     +    } else {
>     +        *err = -ENOENT;
>     +    }
>     +    return res;
>     +}
>     +
>     +static void setenv_ulong(const char *prefix, const char *name, uint64_t val)
>     +{
>     +    char var[80], val_str[80];
>     +    snprintf(var, sizeof(var), "%s%s", prefix, name);
>     +    snprintf(val_str, sizeof(val_str), "%"PRIu64, val);
> 
> 
> g_strdup_printf
> 
>     +    setenv(var, val_str, 1);
> 
> 
> g_setenv(), and return error value (or assert() if that makes more sense)
> 
>     +}
>     +
>     +static void unsetenv_ulong(const char *prefix, const char *name)
>     +{
>     +    char var[80];
>     +    snprintf(var, sizeof(var), "%s%s", prefix, name);
> 
> 
> g_strdup_printf
>  
> 
>     +    unsetenv(var);
> 
> 
> g_unsetenv
> 
>     +}
>     +
>     +int getenv_fd(const char *name)
>     +{
>     +    int err;
>     +    int fd = getenv_ulong(FD_PREFIX, name, &err);
> 
> 
> I'd try to use qemu_parse_fd() instead.
> 
>     +    return err ? -1 : fd;
>     +}
>     +
>     +void setenv_fd(const char *name, int fd)
>     +{
> 
> 
> Maybe check fd >= 0 ?
> 
>     +    setenv_ulong(FD_PREFIX, name, fd);
>     +}
>     +
>     +void unsetenv_fd(const char *name)
>     +{
>     +    unsetenv_ulong(FD_PREFIX, name);
>     +}
>     +
>     +void unsetenv_fdv(const char *fmt, ...)
>     +{
>     +    va_list args;
>     +    char buf[80];
>     +    va_start(args, fmt);
>     +    vsnprintf(buf, sizeof(buf), fmt, args);
>     +    va_end(args);
> 
> 
> That seems to be a leftover.

It is called in the subsequent vfio cpr patches.

>     +}
>     +
>     +int walkenv(const char *prefix, walkenv_cb cb, void *handle)
> 
>     +{
>     +    char *str, name[128];
>     +    char **envp = environ;
>     +    size_t prefix_len = strlen(prefix);
>     +
>     +    while (*envp) {
>     +        str = *envp++;
>     +        if (!strncmp(str, prefix, prefix_len)) {
> 
>     +            char *val = strchr(str, '=');
>     +            str += prefix_len;
>     +            strncpy(name, str, val - str);
> 
> 
> g_strndup() to avoid potential buffer overflow.
> 
>     +            name[val - str] = 0;
>     +            if (cb(name, val + 1, handle)) {
>     +                return 1;
>     +            }
>     +        }
>     +    }
>     +    return 0;
>     +}
>     +
>     +void printenv(void)
>     +{
>     +    char **ptr = environ;
>     +    while (*ptr) {
>     +        puts(*ptr++);
>     +    }
>     +}
> 
> 
> Is this really useful? I doubt it.

I call it from gdb for debugging, but I can delete it and cast g_listenv() instead:
  print *(((char ** (*)(void))g_listenv)())@100

Will do on the rest.

- Steve

>     diff --git a/util/meson.build b/util/meson.build
>     index 0ffd7f4..5e8097a 100644
>     --- a/util/meson.build
>     +++ b/util/meson.build
>     @@ -23,6 +23,7 @@ util_ss.add(files('host-utils.c'))
>      util_ss.add(files('bitmap.c', 'bitops.c'))
>      util_ss.add(files('fifo8.c'))
>      util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
>     +util_ss.add(files('env.c'))
>      util_ss.add(files('error.c', 'qemu-error.c'))
>      util_ss.add(files('qemu-print.c'))
>      util_ss.add(files('id.c'))
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau


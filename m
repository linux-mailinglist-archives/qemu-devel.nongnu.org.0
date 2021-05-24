Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC6B38F308
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:32:03 +0200 (CEST)
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFMw-0005ta-1r
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1llFKr-00052A-Sv
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:29:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1llFKo-0000XP-10
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:29:53 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OHqX2p013451; Mon, 24 May 2021 18:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=MQJ0EZhZbja5s56hDivv+w4Ad9ZcxWQSegKgEZRlwio=;
 b=RHwaJssZsVOne+OUKdfpQVdqhwBjhCuwtkB9mrbf7kxPJT2pVaP05IBweUV9OuKHLTJU
 FEfPcCCEr0CHXjGvh+UG5Kz4C5FlistowZvNSrL2rY38EBhs9ytB7Vu9WrXtmr3s/Hty
 ADNlNXhDUYiimDRfWB4ayzzFA3DPqiALlflnEJGXCAfP4I5W8/76lQfTNubz6uKvuJ+A
 Khwpr7Pc7ieXI3H9gRnYD3pDsF75JZA/ZMhsMFWQspQecsgexb05aWmMhToR1iFxfygO
 5TZWMU4RCZ3bo+Qnuc08YoDeePgxQXdB88ZNfcayCwUa0t4ipnzN+8Xb14dgmUGmOcfk Yw== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38r9t105hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 18:29:40 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14OITdHB028313;
 Mon, 24 May 2021 18:29:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3030.oracle.com with ESMTP id 38pq2tjqgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 18:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHN4U6LghTZikM5ecfaYtsC8WgATUM82yppsgUPcfdz+JIBiF49YXVb0BqlwQSyXmhJD+s3dOlaLkRooodbuHhXLQBXtniZ/3BEdZ+Xh89krDwJe+m7P2FDAmWgsoIYcgrDS3NJfvwiLUd7W8e5ZfVLM1CRXiJjn67Bp8o0g+LTaUgnbXJr0uAp/BuHd9XsK48PrI1e60QbEvsdkxGVhPOof6tfSNdlmVD8+31Bgce2qmmJ6Te3W8rz2fP17ZIqrvtNyOFoh5bDd15YGu2zfk0zAwyQ+XiEJ7h2/0o8iC9/+raw0zkI93Tzgddj5inppOof0h4EVG2fDVo2ZK0WbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQJ0EZhZbja5s56hDivv+w4Ad9ZcxWQSegKgEZRlwio=;
 b=TIkI4zirjj0kUONcte7iXQI+PM4td49KiGnkgulbXxa3vbeiSWHPv3+ee4MqoTTdsy/XPAX+VSHA5RNZYTv+SPfU+2rBtPzD5/qTEb9IrQNrzNHtvBrFMy4i780sNuVwP80u7ZTOEL/GhFgdoIrHG7L1rb8ANaapmpuofOSNpldOFvxlaEWwWyUo/36U0SiiBPsKIWuSapDBPzZ9EYOAWCR6LXPDqzMNbsPuWyKUQSbvtCS4eNZrqHMvIwxzugDdwJBORmtAP6t1Uaj+3thyLU+kbv5umRJHPWMJntxjai2VXL+CJKtfZTYDDM6fNK/Z4t0reh03P8wxnZIsMoh76w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQJ0EZhZbja5s56hDivv+w4Ad9ZcxWQSegKgEZRlwio=;
 b=C4xQnTmG4K3SYruGusaOPqdt4UyXbeRx7nuvAhtTjFB10m3ILrXLY26TaRkYdjJ98tXYGOXmmqSQd3iLqgcq9NWPyusd7e/AeCHEZCQPArAQOC96NiTrePGQra+N0yDOtbO4F7ph5EUiRRhwEKistGQKfLTHQoNb7F+kIlIUS6E=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3368.namprd10.prod.outlook.com (2603:10b6:a03:150::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 18:29:34 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 18:29:34 +0000
Subject: Re: [PATCH V3 12/22] vfio-pci: cpr part 1
To: Alex Williamson <alex.williamson@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-13-git-send-email-steven.sistare@oracle.com>
 <20210521162444.2ef31f42.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <85b5ee22-a6cf-9a64-8086-6db28126d8ba@oracle.com>
Date: Mon, 24 May 2021 14:29:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210521162444.2ef31f42.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN4PR0201CA0005.namprd02.prod.outlook.com
 (2603:10b6:803:2b::15) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN4PR0201CA0005.namprd02.prod.outlook.com (2603:10b6:803:2b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.24 via Frontend
 Transport; Mon, 24 May 2021 18:29:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9618af86-f2f4-4fa0-cd36-08d91ee1e108
X-MS-TrafficTypeDiagnostic: BYAPR10MB3368:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3368FE9907A2F004CE66DA3EF9269@BYAPR10MB3368.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MF4N0n7YAK7qM784HRPPajyLONrx6nafYBITsftRatbVC+eCUPUsJxE4tJ+6UHvJD5nUOsUXrrZihfcJQyQjQ7X4PO/IrmdDiQEHRnwhrcWuljPrnOKRNl5WYhqfcT0WF8pcaEb1HH5A+NL/qc5W5WxBqdjGPTti2qy37tk9ElPJS50zFVw5Sa5w+Qd77gBVM54FeaZ/b6K6GVtwfT1Kb85MVegIaxXyokOP4cQJoOL/+zFJWZcLTJIRVn4HU00koRGy9KbR0eOLL+caVaQba2VgH0FV+c5CwB6x//0U1d6UcfurmHCN2KDWYdAsMV2xxevVQqw1tm9IFsMXNiSpCXZm8px3jF9unLQMJn07JCJXuiSx1WDrFI0x5CjWczZHB90NCyjF/lZO+FdWY2x3EcKWL7aYuX0n7pAJa3RJdy4Mjt5WEiEXFkwGkAUTWRE3xIs9xsfQ8D+scInDY6L3c8XClbFY4D7b1RNMFw3zXon4rlRY4zl5QovRLDH4qPxUAkAi809qBNUNoIc1e2XwC5FTTGYpD9468UZnNvn4ouqjay2SoFqDmhewrYjNYdJVZ3NF+314zZogvoDms8k6wQDGZUxJv8IuxOegLRvA8z3D/DJK2y5Kz6sEtuxB6Rt06/cX03uODSBtSd40moo917i1Fb8u5JpI+UNledmgXDr9WCUZSAuI533mAXAro/Xh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(136003)(396003)(346002)(54906003)(86362001)(5660300002)(478600001)(4326008)(107886003)(31696002)(7416002)(316002)(66556008)(8936002)(66946007)(2906002)(66476007)(44832011)(31686004)(2616005)(956004)(16576012)(36756003)(16526019)(26005)(30864003)(6486002)(83380400001)(6666004)(186003)(8676002)(6916009)(38100700002)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dXpud2RVbFZhNDRKOGhtMUZVZnhSbVEvUW5QYkdKTzYvdEZJYklvekhlbDBQ?=
 =?utf-8?B?VWlVN0NpOTBXWGMxdmJPc1BMWEd6cFhqTmVSMmJ4SzJKNGlFcUNyZDNETUZH?=
 =?utf-8?B?ZlpTOUNjNjJnL0JHQ3ZzWEhGY3hiTkpLd2g2Rk1tbnhJWnUycjI1MC9lTWxy?=
 =?utf-8?B?b1FpcmtRdytDV3Z5cEdGRDFjcndLeXZtNzhIWUhQVzcxNUVsMjNEdmxZZ09R?=
 =?utf-8?B?ODdQbzdTVVo1aGpMWmFJcGVhY2JIVmxPd0tHbjh5azRQci9HUVo0RDhRU0xx?=
 =?utf-8?B?ancrU1RkTVBTc2ErRW5EYUYvN2VnUUhXdVVGOXVxUTlKOFQ5TWZaSGJqYngr?=
 =?utf-8?B?Y2ZwQ2J1bWdxeElGbWdHb1RRYS8rTjVOWFhid0tiSlY3UTVDR3B1aUQxdDFB?=
 =?utf-8?B?bjJxOXpacFlacGw0NFcySE13eUErRHlLOCsyRDM4cklqdHgrdVVTYlplOFZ4?=
 =?utf-8?B?ZU92cW8rTlZJTTczbWtNNDNnc3FZakhSb0wxWnEvTzJlWTVwWTkrNU9Hdk1Y?=
 =?utf-8?B?MzBxa1piTnZzY1l1L3dPUTNPdGEwTFFvRzlPSVpmVHhNQ3BqVFFGZUpuUDA0?=
 =?utf-8?B?L1NTMVRRNFhNZEFrU0doTTZwVFY0akU4VGZRK3RFU2JUSUV6WjdTaXlOKzZS?=
 =?utf-8?B?VWhKMm02eTQ2d3hxa0FiUE03c1ZoOUFNWUlVY2YwYlN6QkZrbnkvZ3k3SUJp?=
 =?utf-8?B?UUF2cWlVNS90TTFrMldTdS9zR0cvTTlKYS9BT1gyTW9ETSt1d3ZsMUczYzVz?=
 =?utf-8?B?bTlTTDFpQ0F6Sk1FYVJmR3FUREpGczhYWm0reW1ITkxQaDZndStPdElpc2RS?=
 =?utf-8?B?a2x1emtxSlkyQjNZWVJtalBCUFRnMDkwc2xJZ1BaT2ZBcTlXTENDbDBsdDlH?=
 =?utf-8?B?eGR3MjlpdWNzU29lR2JDejFJV2EwY3dvaEtFdi9NZUhhZXMzRTB0WG1xQzhC?=
 =?utf-8?B?NFZUdHlwRFFuQlpoMU8wWDE2MUpuVFNQVVlxU0dKRnFjdlVseWM5eUFJaDd1?=
 =?utf-8?B?QUNzVXVGNWhKZmZOZ0lxNDFFYWV6R1I5MDAvUEVTMlUxTkNPRU5DNXU0U21l?=
 =?utf-8?B?WElrbFFqVmNwYjIxdk9UOE9mOUFSUUFlYlhTbjNhWXNKdnZDcUNYSUtEMitr?=
 =?utf-8?B?U3dibEpXV2ZIcFZHa25hS2NKa0dkUXZweUtCSGZsRnVXODRnaTVEc1hzWnk4?=
 =?utf-8?B?QStjd3Vhb2lwSTR5c3IrTWIyanpydnE4c1JSaUhyL1hTcTJCS0lnbHF5aWRz?=
 =?utf-8?B?YnJ1QSs2QjJlR2dHRWhUTEpuYnlUU2FyWC9BT2hqSW0vdGVXZXlocXR3clht?=
 =?utf-8?B?M2hpMWJIMVpOTHFvRlRocGdWd2xRd21oZVpoYWx0Uk9GYUdDMmVOUmEwekUr?=
 =?utf-8?B?K3RxTVk1bFlqZE5LenFQdWdCU044QVdib2hUeURGK1JBamxGTFUvNi9peTdw?=
 =?utf-8?B?RE55bUtHR2M2RERJK0ZWdkJmMllZZTErUmJpWkpSdzl2MUVSRVVUelZLdDNX?=
 =?utf-8?B?bEs0YUVyQjN2VGFQUFQ1dmR4UTB0QkxOU2NqbXhIdzNPbzl1eXp6ZlR4RXpN?=
 =?utf-8?B?eU5tbHROWDd6blZmTHZkanovVEVOclBBVTE1VUlNQWdZaEpuMjVncDFxNnRT?=
 =?utf-8?B?TnovdTU0NXU2QVBRdFFiWWFaOVNmaXMycWZ3UkJSS0crNi9QdFkrWThTK2Nl?=
 =?utf-8?B?ZGdhMzBoS2RpNjhZa1VpaFNrTm05WFVFUjUxeWVYaHpGeDB0RytxbXBHWGRY?=
 =?utf-8?Q?urB/nTqzPMnKUKmJJqQHLWuFS0/I9BgO0n5JqYS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9618af86-f2f4-4fa0-cd36-08d91ee1e108
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 18:29:34.3849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rY8Ba7G9CTZ48h+9+7vEANJJa4mwVUMP0/3si/UCPhRszO4llx6zTXYnOFJJTP3eG96f81eSLyGZpYdNO42FxmTacdf2f068lUoXXXYGgxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3368
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9993
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240103
X-Proofpoint-ORIG-GUID: kv4HS33f9cnSNMK8SAmNMRPZ_IAOpGrE
X-Proofpoint-GUID: kv4HS33f9cnSNMK8SAmNMRPZ_IAOpGrE
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/2021 6:24 PM, Alex Williamson wrote:> On Fri,  7 May 2021 05:25:10 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Enable vfio-pci devices to be saved and restored across an exec restart
>> of qemu.
>>
>> At vfio creation time, save the value of vfio container, group, and device
>> descriptors in the environment.
>>
>> In cprsave, suspend the use of virtual addresses in DMA mappings with
>> VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped at a
>> different VA after exec.  DMA to already-mapped pages continues.  Save
>> the msi message area as part of vfio-pci vmstate, save the interrupt and
>> notifier eventfd's in the environment, and clear the close-on-exec flag
>> for the vfio descriptors.  The flag is not cleared earlier because the
>> descriptors should not persist across miscellaneous fork and exec calls
>> that may be performed during normal operation.
>>
>> On qemu restart, vfio_realize() finds the descriptor env vars, uses
>> the descriptors, and notes that the device is being reused.  Device and
>> iommu state is already configured, so operations in vfio_realize that
>> would modify the configuration are skipped for a reused device, including
>> vfio ioctl's and writes to PCI configuration space.  The result is that
>> vfio_realize constructs qemu data structures that reflect the current
>> state of the device.  However, the reconstruction is not complete until
>> cprload is called. cprload loads the msi data and finds eventfds in the
>> environment.  It rebuilds vector data structures and attaches the
>> interrupts to the new KVM instance.  cprload then walks the flattened
>> ranges of the vfio_address_spaces and calls VFIO_DMA_MAP_FLAG_VADDR to
>> inform the kernel of the new VA's.  Lastly, it starts the VM and suppresses
>> vfio device reset.
>>
>> This functionality is delivered by 2 patches for clarity.  Part 2 adds
>> eventfd and vector support.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  hw/pci/msi.c                  |   4 ++
>>  hw/pci/pci.c                  |   4 ++
>>  hw/vfio/common.c              |  59 ++++++++++++++++++-
>>  hw/vfio/cpr.c                 | 131 ++++++++++++++++++++++++++++++++++++++++++
>>  hw/vfio/meson.build           |   1 +
>>  hw/vfio/pci.c                 |  65 +++++++++++++++++++--
>>  hw/vfio/trace-events          |   1 +
>>  include/hw/pci/pci.h          |   1 +
>>  include/hw/vfio/vfio-common.h |   5 ++
>>  linux-headers/linux/vfio.h    |  27 +++++++++
>>  migration/cpr.c               |   7 +++
>>  11 files changed, 298 insertions(+), 7 deletions(-)
>>  create mode 100644 hw/vfio/cpr.c
>>
>> diff --git a/hw/pci/msi.c b/hw/pci/msi.c
>> index 47d2b0f..39de6a7 100644
>> --- a/hw/pci/msi.c
>> +++ b/hw/pci/msi.c
>> @@ -225,6 +225,10 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
>>      dev->msi_cap = config_offset;
>>      dev->cap_present |= QEMU_PCI_CAP_MSI;
>>  
>> +    if (dev->reused) {
>> +        return 0;
>> +    }
>> +
>>      pci_set_word(dev->config + msi_flags_off(dev), flags);
>>      pci_set_word(dev->wmask + msi_flags_off(dev),
>>                   PCI_MSI_FLAGS_QSIZE | PCI_MSI_FLAGS_ENABLE);
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index e08d981..27019ca 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -308,6 +308,10 @@ static void pci_do_device_reset(PCIDevice *dev)
>>  {
>>      int r;
>>  
>> +    if (dev->reused) {
>> +        return;
>> +    }
>> +
>>      pci_device_deassert_intx(dev);
>>      assert(dev->irq_state == 0);
>>  
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 9220e64..00d07b2 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -31,6 +31,7 @@
>>  #include "exec/memory.h"
>>  #include "exec/ram_addr.h"
>>  #include "hw/hw.h"
>> +#include "qemu/env.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/range.h"
>> @@ -440,6 +441,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>>      }
>>  
>> +    if (container->reused) {
>> +        return 0;
>> +    }
>> +
>>      while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>>          /*
>>           * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
>> @@ -463,6 +468,11 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>          return -errno;
>>      }
>>  
>> +    if (unmap.size != size) {
>> +        warn_report("VFIO_UNMAP_DMA(0x%lx, 0x%lx) only unmaps 0x%llx",
>> +                     iova, size, unmap.size);
>> +    }
>> +
>>      return 0;
>>  }
>>  
>> @@ -477,6 +487,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>          .size = size,
>>      };
>>  
>> +    if (container->reused) {
>> +        return 0;
>> +    }
>> +
>>      if (!readonly) {
>>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>>      }
>> @@ -1603,6 +1617,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>>      if (iommu_type < 0) {
>>          return iommu_type;
>>      }
>> +    if (container->reused) {
>> +        container->iommu_type = iommu_type;
>> +        return 0;
>> +    }
>>  
>>      ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
>>      if (ret) {
>> @@ -1703,6 +1721,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>  {
>>      VFIOContainer *container;
>>      int ret, fd;
>> +    bool reused;
>> +    char name[40];
>>      VFIOAddressSpace *space;
>>  
>>      space = vfio_get_address_space(as);
>> @@ -1739,16 +1759,29 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>          return ret;
>>      }
>>  
>> +    snprintf(name, sizeof(name), "vfio_container_%d", group->groupid);
> 
> For more clarity, maybe "vfio_container_for_group_%d"?

OK, that is clearer.

>> +    fd = getenv_fd(name);
>> +    reused = (fd >= 0);
>> +
>>      QLIST_FOREACH(container, &space->containers, next) {
>> +        if (fd >= 0 && container->fd == fd) {
> 
> Test @reused rather than @fd?  > I'm not sure the first half of this test
> is even needed though, <0 should never match container->fd, right?

OK, I will drop the first test.

>> +            group->container = container;
>> +            QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>> +            return 0;
>> +        }
> 
> This looks unnecessarily sensitive to the order of containers in the
> list, if the fd doesn't match above we try to set a new container below?
> It seems like you only want to create a new container object if none of
> the existing ones match.
> 
> There's also a lot of duplication that seems like it could be combined
> 
> if (container->fd == fd || (!reused && !ioctl(...)) {

OK, I will rewrite to avoid depending on creation order, and de-dup:

    QLIST_FOREACH(container, &space->containers, next) {
        if (container->fd == fd ||
            !ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
            break;
        }
    }

    if (container) {
        group->container = container;
        QLIST_INSERT_HEAD(&container->group_list, group, container_next);
        if (!reused) {
            vfio_kvm_device_add_group(group);
            setenv_fd(name, container->fd);
        }
        return 0;
    }


>>          if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
>>              group->container = container;
>>              QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>>              vfio_kvm_device_add_group(group);
> 
> Why is this kvm device setup missing in the reuse case?

vfio_kvm_device_add_group only calls ioctls, and they were already called when the device 
was initially created.

> if (!reused) {
>> +            setenv_fd(name, container->fd);
> }
> 
>>              return 0;
>>          }
>>      }
>>  
>> -    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
>> +    if (fd < 0) {
> 
> if (!reused)?

OK.

>> +        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
>> +    }
>> +
>>      if (fd < 0) {
>>          error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
>>          ret = -errno;
>> @@ -1766,6 +1799,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      container = g_malloc0(sizeof(*container));
>>      container->space = space;
>>      container->fd = fd;
>> +    container->reused = reused;
>>      container->error = NULL;
>>      container->dirty_pages_supported = false;
>>      QLIST_INIT(&container->giommu_list);
>> @@ -1893,6 +1927,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      }
>>  
>>      container->initialized = true;
>> +    setenv_fd(name, fd);
> 
> Maybe we don't need the test around the previous setenv_fd if we can
> overwrite existing env values, which would seem to be the case for a
> restart here.

Yes, setenv_fd overwrites, so I omitted the test for clarity, at a cost of a few cycles.

>>      return 0;
>>  listener_release_exit:
>> @@ -1920,6 +1955,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>>  
>>      QLIST_REMOVE(group, container_next);
>>      group->container = NULL;
>> +    unsetenv_fdv("vfio_container_%d", group->groupid);
>>  
>>      /*
>>       * Explicitly release the listener first before unset container,
>> @@ -1978,7 +2014,12 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>>      group = g_malloc0(sizeof(*group));
>>  
>>      snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
>> -    group->fd = qemu_open_old(path, O_RDWR);
>> +
>> +    group->fd = getenv_fd(path);
>> +    if (group->fd < 0) {
>> +        group->fd = qemu_open_old(path, O_RDWR);
>> +    }
>> +
>>      if (group->fd < 0) {
>>          error_setg_errno(errp, errno, "failed to open %s", path);
>>          goto free_group_exit;
>> @@ -2012,6 +2053,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>>  
>>      QLIST_INSERT_HEAD(&vfio_group_list, group, next);
>>  
>> +    setenv_fd(path, group->fd);
>> +
>>      return group;
>>  
>>  close_fd_exit:
>> @@ -2036,6 +2079,7 @@ void vfio_put_group(VFIOGroup *group)
>>      vfio_disconnect_container(group);
>>      QLIST_REMOVE(group, next);
>>      trace_vfio_put_group(group->fd);
>> +    unsetenv_fdv("/dev/vfio/%d", group->groupid);
>>      close(group->fd);
>>      g_free(group);
>>  
>> @@ -2049,8 +2093,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>>  {
>>      struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
>>      int ret, fd;
>> +    bool reused;
>> +
>> +    fd = getenv_fd(name);
>> +    reused = (fd >= 0);
>> +    if (fd < 0) {
> 
> if (!reused) ?

OK.

>> +        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
>> +    }
>>  
>> -    fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
>>      if (fd < 0) {
>>          error_setg_errno(errp, errno, "error getting device from group %d",
>>                           group->groupid);
>> @@ -2095,6 +2145,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>>      vbasedev->num_irqs = dev_info.num_irqs;
>>      vbasedev->num_regions = dev_info.num_regions;
>>      vbasedev->flags = dev_info.flags;
>> +    vbasedev->reused = reused;
>> +    setenv_fd(name, fd);
>>  
>>      trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
>>                            dev_info.num_irqs);
>> @@ -2111,6 +2163,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
>>      QLIST_REMOVE(vbasedev, next);
>>      vbasedev->group = NULL;
>>      trace_vfio_put_base_device(vbasedev->fd);
>> +    unsetenv_fd(vbasedev->name);
>>      close(vbasedev->fd);
>>  }
>>  
>> diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
>> new file mode 100644
>> index 0000000..c5ad9f2
>> --- /dev/null
>> +++ b/hw/vfio/cpr.c
>> @@ -0,0 +1,131 @@
>> +/*
>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include <sys/ioctl.h>
>> +#include <linux/vfio.h>
>> +#include "hw/vfio/vfio-common.h"
>> +#include "sysemu/kvm.h"
>> +#include "qapi/error.h"
>> +#include "trace.h"
>> +
>> +static int
>> +vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
>> +{
>> +    struct vfio_iommu_type1_dma_unmap unmap = {
>> +        .argsz = sizeof(unmap),
>> +        .flags = VFIO_DMA_UNMAP_FLAG_VADDR | VFIO_DMA_UNMAP_FLAG_ALL,
>> +        .iova = 0,
>> +        .size = 0,
>> +    };
>> +    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>> +        error_setg_errno(errp, errno, "vfio_dma_unmap_vaddr_all");
>> +        return -errno;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int vfio_dma_map_vaddr(VFIOContainer *container, hwaddr iova,
>> +                              ram_addr_t size, void *vaddr,
>> +                              Error **errp)
>> +{
>> +    struct vfio_iommu_type1_dma_map map = {
>> +        .argsz = sizeof(map),
>> +        .flags = VFIO_DMA_MAP_FLAG_VADDR,
>> +        .vaddr = (__u64)(uintptr_t)vaddr,
>> +        .iova = iova,
>> +        .size = size,
>> +    };
>> +    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
>> +        error_setg_errno(errp, errno,
>> +                         "vfio_dma_map_vaddr(iova %lu, size %ld, va %p)",
>> +                         iova, size, vaddr);
>> +        return -errno;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int
>> +vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
>> +{
>> +    MemoryRegion *mr = section->mr;
>> +    VFIOContainer *container = handle;
>> +    const char *name = memory_region_name(mr);
>> +    ram_addr_t size = int128_get64(section->size);
>> +    hwaddr offset, iova, roundup;
>> +    void *vaddr;
>> +
>> +    if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
>> +        return 0;
>> +    }
>> +
>> +    offset = section->offset_within_address_space;
>> +    iova = TARGET_PAGE_ALIGN(offset);
>> +    roundup = iova - offset;
>> +    size = (size - roundup) & TARGET_PAGE_MASK;
>> +    vaddr = memory_region_get_ram_ptr(mr) +
>> +            section->offset_within_region + roundup;
>> +
>> +    trace_vfio_region_remap(name, container->fd, iova, iova + size - 1, vaddr);
>> +    return vfio_dma_map_vaddr(container, iova, size, vaddr, errp);
>> +}
>> +
>> +bool vfio_cpr_capable(VFIOContainer *container, Error **errp)
>> +{
>> +    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
>> +        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
>> +        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
>> +                         "or VFIO_UNMAP_ALL");
>> +        return false;
>> +    } else {
>> +        return true;
>> +    }
>> +}
>> +
>> +int vfio_cprsave(Error **errp)
>> +{
>> +    VFIOAddressSpace *space;
>> +    VFIOContainer *container;
>> +
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            if (!vfio_cpr_capable(container, errp)) {
>> +                return 1;
>> +            }
>> +            if (vfio_dma_unmap_vaddr_all(container, errp)) {
>> +                return 1;
>> +            }
>> +        }
>> +    }
> 
> Seems like you'd want to test that all containers are capable before
> unmapping any vaddrs.  I also hope we'll find an unwind somewhere that
> remaps vaddrs should any fail.

That is verified earlier if one runs qemu with the -only-cpr-capable option:

  vfio_get_iommu_type()
      for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
          if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) {
              if (only_cpr_capable && !vfio_cpr_capable(container, errp)) {
                  error_prepend(errp, "only-cpr-capable is specified: ");
                  return -EINVAL;

But I will check here as well in case only-cpr-capable was not specified.

I will add code to unwind and remap.

>> +    return 0;
>> +}
>> +
>> +int vfio_cprload(Error **errp)
>> +{
>> +    VFIOAddressSpace *space;
>> +    VFIOContainer *container;
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            if (!vfio_cpr_capable(container, errp)) {
>> +                return 1;
>> +            }
>> +            container->reused = false;
>> +            if (as_flat_walk(space->as, vfio_region_remap, container, errp)) {
>> +                return 1;
>> +            }
>> +        }
>> +    }
> 
> What state are we in if any of these fail?

The guest has not resumed, but we cannot recover.  Since we verified vfio_cpr_capable in 
cprsave, vfio_cprload should never fail, sans bugs.

>> +    QLIST_FOREACH(group, &vfio_group_list, next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            vbasedev->reused = false;
>> +        }
>> +    }
>> +    return 0;
>> +}
>> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
>> index da9af29..e247b2b 100644
>> --- a/hw/vfio/meson.build
>> +++ b/hw/vfio/meson.build
>> @@ -5,6 +5,7 @@ vfio_ss.add(files(
>>    'migration.c',
>>  ))
>>  vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
>> +  'cpr.c',
>>    'display.c',
>>    'pci-quirks.c',
>>    'pci.c',
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 7a4fb6c..f7ac9f03 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -29,6 +29,8 @@
>>  #include "hw/qdev-properties.h"
>>  #include "hw/qdev-properties-system.h"
>>  #include "migration/vmstate.h"
>> +#include "migration/cpr.h"
>> +#include "qemu/env.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/module.h"
>> @@ -1612,6 +1614,14 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
>>      }
>>  }
>>  
>> +static void vfio_config_sync(VFIOPCIDevice *vdev, uint32_t offset, size_t len)
>> +{
>> +    if (pread(vdev->vbasedev.fd, vdev->pdev.config + offset, len,
>> +          vdev->config_offset + offset) != len) {
>> +        error_report("vfio_config_sync pread failed");
>> +    }
>> +}
>> +
>>  static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
>>  {
>>      VFIOBAR *bar = &vdev->bars[nr];
>> @@ -1652,6 +1662,7 @@ static void vfio_bars_prepare(VFIOPCIDevice *vdev)
>>  static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
>>  {
>>      VFIOBAR *bar = &vdev->bars[nr];
>> +    PCIDevice *pdev = &vdev->pdev;
>>      char *name;
>>  
>>      if (!bar->size) {
>> @@ -1672,7 +1683,10 @@ static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
>>          }
>>      }
>>  
>> -    pci_register_bar(&vdev->pdev, nr, bar->type, bar->mr);
>> +    pci_register_bar(pdev, nr, bar->type, bar->mr);
>> +    if (pdev->reused) {
>> +        vfio_config_sync(vdev, pci_bar(pdev, nr), 8);
> 
> Assuming 64-bit BARs?  This might be the first case where we actually
> rely on the kernel BAR values, IIRC we usually use QEMU's emulation.

No asssumptions.  vfio_config_sync() preads a piece of config space using a single 
system call, copying directly to the qemu buffer, not looking at words or calling any
action functions.

>> +    }
>>  }
>>  
>>  static void vfio_bars_register(VFIOPCIDevice *vdev)
>> @@ -2884,6 +2898,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>>          vfio_put_group(group);
>>          goto error;
>>      }
>> +    pdev->reused = vdev->vbasedev.reused;
>>  
>>      vfio_populate_device(vdev, &err);
>>      if (err) {
>> @@ -3046,9 +3061,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>>                                               vfio_intx_routing_notifier);
>>          vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
>>          kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
>> -        ret = vfio_intx_enable(vdev, errp);
>> -        if (ret) {
>> -            goto out_deregister;
>> +        if (!pdev->reused) {
>> +            ret = vfio_intx_enable(vdev, errp);
>> +            if (ret) {
>> +                goto out_deregister;
>> +            }
>>          }
>>      }
>>  
>> @@ -3098,6 +3115,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>>      vfio_register_req_notifier(vdev);
>>      vfio_setup_resetfn_quirk(vdev);
>>  
>> +    vfio_config_sync(vdev, pdev->msix_cap + PCI_MSIX_FLAGS, 2);
>> +    if (pdev->reused) {
>> +        pci_update_mappings(pdev);
>> +    }
>> +
> 
> Are the msix flag sync and mapping update related?  They seem
> independent to me.  A blank line and comment would be helpful.

OK.

> I expect we'd need to call msix_enabled() somewhere for the msix flag
> sync to be effective.

Yes, vfio_pci_post_load in cpr part 2 calls msix_enabled.

> Is there an assumption here of msi-x only support or is it not needed
> for msi or intx?

The code supports msi-x and msi.  However, I should only be sync'ing PCI_MSIX_FLAGS
if pdev->cap_present & QEMU_PCI_CAP_MSIX.  And, I am missing a sync for PCI_MSI_FLAGS.
I'll fix that.

> [...]
> 
> I didn't find that unwind I was hoping for or anywhere that the msix
> flags come into play.  Thanks,

Let me know f I have not adequately answered those questions.

- Steve


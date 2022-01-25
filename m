Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E75849B8DA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:36:10 +0100 (CET)
Received: from localhost ([::1]:53846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOng-0004iB-TV
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:36:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nCOkc-0002Ho-SA
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:33:00 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nCOkZ-0006U6-Lv
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:32:58 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PG4OQR006319; 
 Tue, 25 Jan 2022 16:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=xy21/GOegiXSnybOmtZ/eaCE6zh73+GExxWnnvUWI0o=;
 b=YW3PemWxmvcSrIYRtH495ytHbtr0ZVwaTj3RzR66OKJU1XYhaGjBv2QVVHLeiKiwVFyE
 7elwQY6zvepfJUkXzbQHFsD4g68nWqGtzr3VmfKaFYugxJJNG0szb9qmjN2CMQmhtGd0
 L3Hcy2OjH+nF0xvzZ91AI8SptOObzqwhEt2rHsP5UiX9lzW3kuyVGsGACwT5Pbhpy54X
 95IyRc9vUL9lvspztz9J81k+t9mwyOAmI2TGqvIf0g9gDTay485fh4EibB7zn3VqFP9m
 dEZ+EJ/sTEqJb6gQ2b4jS8TMZ12v/cqALBRtxOZ306B6H05HAAjXvZyQiZTFkW0wQq+O Kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s3gst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 16:32:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20PGPbRw030254;
 Tue, 25 Jan 2022 16:32:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3030.oracle.com with ESMTP id 3dr7yg70hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 16:32:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxbEBHXBbNxP+PU4TiUUqj86ws2NCfm3ij29yDoGq6qgzqDvjAiNdgiqj+2oUQd8a4gEkVRznnwR1TLX7fD/VB9LR7rfb+cmtfKE+au5Taq2Xigp2x9DruzDrEKORqLloLDTTHSnnCXXliOMAo/sVhp0/svXLRtPuDjHRW/oYsp9ZlXTk7vu6+nA5gzBW92JJOCF3QlAekYZyavZwux74YBP1eTCTs0fQRV2HPPRb/4BmVa3HnDlr7RdAL2Pg8DvvC72/TK8msOHAZi43KDsuEr+t6o3kzTC3ks3RAicCWwpGsWbqU1fYE3LeEe0wYWxdCjb9qkScD+Tok0UKInYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy21/GOegiXSnybOmtZ/eaCE6zh73+GExxWnnvUWI0o=;
 b=kFgIxnkOLb65QGC74q55oDf+Sn247MaKZEa0NBXEpItgWaqX5he0sDrxSyf38CezHYjhFSgbiShL9vKk8W1MQjktn66ONReZr8BAI3Dpz4chnj4cQ0EI0x7Z9yus9FrLgGJ61HtNSCvG11/d7NKeZW36IpJ9nfAEDffX4Alv8wVvjR+bWkbkftpNs9FfaBs86Pyzt0rS72BZE2sgnQ208yfF2MzottzL8He4OrpK/DmlRahQzZVicpLVRreQgmkW/nvzprb2cAYqxgpiT9D28V7tsNNpiyIeT/VMFa1JovqZv8n6CqrQN6wV6i/paQaUrZoaZjnXt6kbHcxk9NeiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy21/GOegiXSnybOmtZ/eaCE6zh73+GExxWnnvUWI0o=;
 b=qxEOQ8XFp/KOIsp5DS7YOZGimDeSSkT/GPiOR3WZQk/bCNiIv/uYAKnsS1SP/1IoN5nKKICzmJ0+xKhtWVtquh5ycsY6PUkk70Q8eFPrEEj6KxqX/0m1Xg/VWVlWMqSfidpzDRGsdak320ukPan2MuQuSlrBmuuDTktGZEQRSlY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BY5PR10MB4195.namprd10.prod.outlook.com (2603:10b6:a03:201::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 25 Jan
 2022 16:32:49 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 16:32:49 +0000
Message-ID: <1d1fefae-8e00-6e0a-7e07-58863e860214@oracle.com>
Date: Tue, 25 Jan 2022 10:32:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
 <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
 <20220125070221-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220125070221-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::24) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6aea86b-25f8-42d2-718c-08d9e0205323
X-MS-TrafficTypeDiagnostic: BY5PR10MB4195:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB419539BB112AC09929BD72C6975F9@BY5PR10MB4195.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKpnL/T7+SGnw7ymZIYhGslz+P42HzXACgrQsA5bQeA/Qqly+MXzAtQfKG5MZifCz1vTIvrsH8rCS8hjg+q/UcjZPYWglwn78sJBae27ssoUmKIdpsMXJDBvhhGHs5qNvOFv7YIWlrSY+NpYGkCvTwNrZHuMiLutRqUcqrI/I7EiQ+gXuspv3Sa4rWn7qsvDZM9o/qalNiBQ5RBWkfB6KrsDWASEVlwPFSvTx1puxEddmebUzitehCfDkF8ywgWwicGijsEYxXs1JDGSUzcCdZbk/JqQXFYP8C8H63hSSVro387MLW7TStFtdFE8KQiPG8Yuonc9RDToBGEv3lxzl8+8HLsvDmCDGO4WaZLrYwbynY7l/BrnPL77WFD0IHCfDhhcB93xziUn2ZXd2/X/wG//p7XDTq1RTCO2dtsYgMkJH69KlhyBrrXT4jKoH7DEBBtAdXifu5YmXvbFfXs1Cx0e/l5eL02gy4CD5O6y6kyrm4bLh1EllnEnX37bk9bXeBaoLX9k/+25FIMzmsaSIALlTOOUBiG7EMpvtoxsqpOzNs1/gItCTAtOuCxAuNCwyyLknCdEJX/JfQNBGoolLk7otVXQaG2jThf4LOCeowG4yt36pLlIFPQ5VA2kwEp8Qy6u3fsRxVYSRD2u2f5W/cbCkxEWBh0fl1E6wKwmTnRgYxgpyM+bzt4kZVTMmYhCBqTcvDz73imGSnqrXDMETGYR7O2VzCVc+3MJ++Y2qR0rR4gRwoUCvvF9pUj1NbwC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(6666004)(4326008)(8676002)(5660300002)(53546011)(31696002)(86362001)(2906002)(38100700002)(8936002)(107886003)(36756003)(110136005)(83380400001)(508600001)(2616005)(66946007)(6486002)(66556008)(66476007)(186003)(316002)(31686004)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Njg0cnNiTldxQjhGc1ZDZktFaUxqZVJoV1ZDeTNuNUNOOFVDSlFZRldXVlNl?=
 =?utf-8?B?Q0xnWmJwY1VjZ09Sa0x0dUdNdkpuNnkvdW5acHdMUDgySGd6SUIwR0xwRFBH?=
 =?utf-8?B?blQxRHgrOXlCNElhOC9FNDV6QnpxckYvVGdReEJCVGtkeE8raFZuMHJuM0ZG?=
 =?utf-8?B?dVg0Qjh4aEZiYU9NMjU5dkNDdzFuTk9FeVZoZDc0RWRaU2thWlpYR05WN0NE?=
 =?utf-8?B?S1dUL0NJdXBuckY1WURoa3ZtY0x5SmZsb3FkbHNwU3pSWEZkbmtPN3hza0h0?=
 =?utf-8?B?VjJwVkN3NktvNDVFYThjZktFTmRIeFpXVzkvd2xVV1dyTzE5cGFxeWlpZnZ4?=
 =?utf-8?B?ZTdMVTkva2JTRFRZdVI2eDU0S0JnMEZlL0Qzc0pMMjNhR1dhdkgxcDBLRFZK?=
 =?utf-8?B?RjRyRUlWYXREUndEMmdqUHdlMDRMYllhZkQ4eHVmQUJZQ3dOVldUeElSQUNL?=
 =?utf-8?B?LzFqU08ySjJkVW1lbzhDVTdYNWRJbnJpenZrSm9IckxSQVFUWW9lYkVRK0Nj?=
 =?utf-8?B?RE5NNkpzV0lxVkpEaTVheTl1dmNJbnhNenpxazdienNkdC95c0tZcFBwL3Nx?=
 =?utf-8?B?RzFVT05URXlsSHg3d0t4YWtjb2xSTldnS29VRUpsbHcvUUVEenZ6TVg0Vkdq?=
 =?utf-8?B?ZExIOXByZzRlajZzYUNtNmVDWWxxdEtuSmpXbytrbUVmWUhNQjB1SnJ4WmU3?=
 =?utf-8?B?YU5yR0NOL2VDQzEwWElKd2hNeXFnUmhvNGJGb2VmYTdNdTV2UlpXY2NkVDdh?=
 =?utf-8?B?ZVdQcG1OQXhkVVZHb2hOYW5MbFRWa3pELzFJelFjUE9rUG5wKys2U2cvTHlR?=
 =?utf-8?B?L2dsdlFVYUNSL3hrV212SjlDNUIwQkdrNEI1QjRWZ0lkM1RoQTlad0N0eEZ6?=
 =?utf-8?B?ZnB2dktrME9GZUZsQjYxTkJkR3lDRTMvZ3dGU1E0L2hRaFh3NDdBc3g0dzNF?=
 =?utf-8?B?bnBpRVMwQndwQXlOaGlCNzlsSHN5Vjk5RS9keXNuYUtRSEVkVTNJU1BQMldZ?=
 =?utf-8?B?WVdGQTVXeWhlQmQ4dW9BZ093UnZwSjJ6QThLWnE2enUvWlBmc2RUS284cnUx?=
 =?utf-8?B?WWRhSWhDYm9rUXdrMGZzSEpCL2JmNGNaMlIwcisrOU83Zkt0T014N0xOSDlL?=
 =?utf-8?B?QVUwdkpoVCtFU09rRzRnL1Z6b2VodUFVQjdLcVVEdzNyZzB6RDVETFV2TzdQ?=
 =?utf-8?B?L2hoWHRlQkRhNDNzdUtiSm01UHkyV1owd00wMnc0ZEloNWd0a2tHRkZJMHJU?=
 =?utf-8?B?Wk9DY2cybUJjM2tURzlyNWJremcxaXRYZ2w2dUVWcFFTTWxmZkU3L2xrODVV?=
 =?utf-8?B?NTZNRGpNc0drQlpKZlh1SXlXQ0dXZ0JrNCtCbjJsTHh0U1RZbmgzRFVtRkdW?=
 =?utf-8?B?MTYrdUx2bmx5eG5tSmFYTkpreGNEVmlxRHZMYWJOajNJa3lCUytTUFBESEp4?=
 =?utf-8?B?dDZMeTBEbGMxL2habm41cjBjMlBvWkI3T3gybkdPT3hWTm5nWkQ4MmptcStJ?=
 =?utf-8?B?VkdBdlNSK3diQjM2cE1tV1lYRTk0SS9QeGh5YUFuTTNmT0s3M1BwbnMwYlQv?=
 =?utf-8?B?L2l0dWhKQkt0ZUhqNUt4VFJadlJ6T2dHTmNpSEI2eW1OR0xpUWdxWjZ3RUZ4?=
 =?utf-8?B?ZTVNVXZsek9lZDI4T2ZCOGpvOUpmZ1hqdkN4U2ZQZGViZ0JrK2p6Z24zSUda?=
 =?utf-8?B?dXhDVkkwc2Y3ZjNTTHBQMWdxTEpVczczTHo4YmNCeDhyZXBiM0haOUhqdlRU?=
 =?utf-8?B?UndtaVIvOHNXdjEzTWhYaksrdkNKZHdJQU41c3g1ME5Nem56Z1lSZWdFS0RF?=
 =?utf-8?B?ZzhRVDR6YjJONU9tcGdxNEFoMEtLQnFUUDhpYng0VDNkWkZDOEFvRGxmVHd1?=
 =?utf-8?B?MjFPdW9GN1FoWEtyeW10UktzQjNLSFl4bFFZR1lxMy82QVBtYk1FQXE3dlYr?=
 =?utf-8?B?b2NaTGpQRDhaYmVpT0dibGxMZnowd0d5UDZWTTBuam16ZzFEUFNCSnJaZExu?=
 =?utf-8?B?WVl1R3JiZEd6dUttV0MrWFpMUWo0UGRYRHhlZlNVNURuZk9rRkhVaW55djBV?=
 =?utf-8?B?Yi9mU2lGbUw0WTdvanZ3U05CakdEQjMwNjQzenFDdzJTNENNN1JueTg3SmQv?=
 =?utf-8?B?Vk00OEFuTVc0U0tuemJsVnlnSmZnaEoxYmlibzUwdU5sU1lGcUxONDc3U3Iz?=
 =?utf-8?B?MURRWlQyZitKb1NnTUNUbUQzQ0FmaWd3SWdIYnpVVDZ1ajZXMHJ4dHZDSXow?=
 =?utf-8?B?bmxLTms4RDBTc0Y5QlEvZ1BSNTBpdk0vdWZhL2YraWNMTVR4M2dwcGpCdGlW?=
 =?utf-8?Q?7Yy7e4uk90336qPGK8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6aea86b-25f8-42d2-718c-08d9e0205323
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 16:32:49.0086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJ2cfpQfxOe8wKAIgF8MaMKVb8OiVsob85/hZWt6kdS352WNWqKcOc69MArk+hZKjwsEB+yKtgB9Tk4uP8DuWUjne1mcQha/p+fUH0VXSf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4195
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250105
X-Proofpoint-GUID: 5L_kXZ4UUaOQWKZAlYDA9o_SBv5H0dsk
X-Proofpoint-ORIG-GUID: 5L_kXZ4UUaOQWKZAlYDA9o_SBv5H0dsk
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,
Thanks for examining this! Inline response below.
eric

On 1/25/22 06:05, Michael S. Tsirkin wrote:
> On Tue, Jan 25, 2022 at 04:23:49PM +0530, Ani Sinha wrote:
>>
>>
>> On Mon, 24 Jan 2022, Eric DeVolder wrote:
>>
>>> This builds the ACPI ERST table to inform OSPM how to communicate
>>> with the acpi-erst device.
>>>
>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>>> ---
>>>   hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 188 insertions(+)
>>>
>>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>>> index fe9ba51..b0c7539 100644
>>> --- a/hw/acpi/erst.c
>>> +++ b/hw/acpi/erst.c
>>> @@ -59,6 +59,27 @@
>>>   #define STATUS_RECORD_STORE_EMPTY     0x04
>>>   #define STATUS_RECORD_NOT_FOUND       0x05
>>>
>>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>>> +#define INST_READ_REGISTER                 0x00
>>> +#define INST_READ_REGISTER_VALUE           0x01
>>> +#define INST_WRITE_REGISTER                0x02
>>> +#define INST_WRITE_REGISTER_VALUE          0x03
>>> +#define INST_NOOP                          0x04
>>> +#define INST_LOAD_VAR1                     0x05
>>> +#define INST_LOAD_VAR2                     0x06
>>> +#define INST_STORE_VAR1                    0x07
>>> +#define INST_ADD                           0x08
>>> +#define INST_SUBTRACT                      0x09
>>> +#define INST_ADD_VALUE                     0x0A
>>> +#define INST_SUBTRACT_VALUE                0x0B
>>> +#define INST_STALL                         0x0C
>>> +#define INST_STALL_WHILE_TRUE              0x0D
>>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>>> +#define INST_GOTO                          0x0F
>>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>>> +#define INST_MOVE_DATA                     0x12
>>> +
>>>   /* UEFI 2.1: Appendix N Common Platform Error Record */
>>>   #define UEFI_CPER_RECORD_MIN_SIZE 128U
>>>   #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>>> @@ -172,6 +193,173 @@ typedef struct {
>>>
>>>   /*******************************************************************/
>>>   /*******************************************************************/
>>> +
>>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>>> +static void build_serialization_instruction_entry(GArray *table_data,
>>> +    uint8_t serialization_action,
>>> +    uint8_t instruction,
>>> +    uint8_t flags,
>>> +    uint8_t register_bit_width,
>>> +    uint64_t register_address,
>>> +    uint64_t value)
>>> +{
>>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>>> +    struct AcpiGenericAddress gas;
>>> +    uint64_t mask;
>>> +
>>> +    /* Serialization Action */
>>> +    build_append_int_noprefix(table_data, serialization_action, 1);
>>> +    /* Instruction */
>>> +    build_append_int_noprefix(table_data, instruction         , 1);
>>> +    /* Flags */
>>> +    build_append_int_noprefix(table_data, flags               , 1);
>>> +    /* Reserved */
>>> +    build_append_int_noprefix(table_data, 0                   , 1);
>>> +    /* Register Region */
>>> +    gas.space_id = AML_SYSTEM_MEMORY;
>>> +    gas.bit_width = register_bit_width;
>>> +    gas.bit_offset = 0;
>>> +    gas.access_width = ctz32(register_bit_width) - 2;
>>> +    gas.address = register_address;
>>> +    build_append_gas_from_struct(table_data, &gas);
>>> +    /* Value */
>>> +    build_append_int_noprefix(table_data, value  , 8);
>>> +    /* Mask */
>>> +    mask = (1ULL << (register_bit_width - 1) << 1) - 1;
>>> +    build_append_int_noprefix(table_data, mask  , 8);
>>> +}
>>> +
>>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>>> +    const char *oem_id, const char *oem_table_id)
>>> +{
>>> +    GArray *table_instruction_data;
>>> +    unsigned action;
>>> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>>> +                        .oem_table_id = oem_table_id };
>>> +
>>> +    trace_acpi_erst_pci_bar_0(bar0);
>>> +
>>> +    /*
>>> +     * Serialization Action Table
>>> +     * The serialization action table must be generated first
>>> +     * so that its size can be known in order to populate the
>>> +     * Instruction Entry Count field.
>>> +     */
>>> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>>> +
>>> +    /*
>>> +     * Macros for use with construction of the action instructions
>>> +     */
>>> +#define BUILD_READ_REGISTER(width_in_bits, reg) \
>>> +    build_serialization_instruction_entry(table_instruction_data, \
>>> +        action, INST_READ_REGISTER, 0, width_in_bits, \
>>> +        bar0 + reg, 0)
>>> +
>>> +#define BUILD_READ_REGISTER_VALUE(width_in_bits, reg, value) \
>>> +    build_serialization_instruction_entry(table_instruction_data, \
>>> +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
>>> +        bar0 + reg, value)
>>> +
>>> +#define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
>>> +    build_serialization_instruction_entry(table_instruction_data, \
>>> +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
>>> +        bar0 + reg, value)
>>> +
>>> +#define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
>>> +    build_serialization_instruction_entry(table_instruction_data, \
>>> +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
>>> +        bar0 + reg, value)
> 
> 
> I think these macros which in a hidden way use the bar0 variable really
> should be replaced with inline functions, improving type safety.

I had not stated this previously, but my choice for using macros over functions
was the use three local variables: table_instruction_data, bar0, and action.

Any function would then automatically require these three as parameters, or I'm
stuffing these temporary items into local globals (to avoid passing as parameters).

As for the type safety of bar0, I don't quite understand what I should do differently
(regardless of macro vs function). Ultimately these call build_serialization_instruction_entry()
with the 'uint64_t register address' accepting the bar0+offset value. Bar0 is pcibar_t
and the compiler happily implicitly typecasts to uint64_t.

What would an acceptable function prototype look like?

> 
> 
> 
> 
>>> +
>>> +    /* Serialization Instruction Entries */
>>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +
>>> +    action = ACTION_BEGIN_READ_OPERATION;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +
>>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +
>>> +    action = ACTION_END_OPERATION;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +
>>> +    action = ACTION_SET_RECORD_OFFSET;
>>> +    BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +
>>> +    action = ACTION_EXECUTE_OPERATION;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
>>> +        ERST_EXECUTE_OPERATION_MAGIC);
>>
>> except here, on all cases we have
>> BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>
>> We should treat the above as special case and simplify the rest of the
>> calls (eliminate repeated common arguments).
>>
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +
>>> +    action = ACTION_CHECK_BUSY_STATUS;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +    BUILD_READ_REGISTER_VALUE(32, ERST_VALUE_OFFSET, 0x01);
>>> +
>>> +    action = ACTION_GET_COMMAND_STATUS;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
>>> +
>>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>>> +
>>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>>> +    BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>
>> This one seems reverted. Should this be
>> BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
>>
>> like others?
>>
>>> +
>>> +    action = ACTION_GET_RECORD_COUNT;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
>>> +
>>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +
>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>>> +
>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>>> +
>>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
>>> +
>>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>>> +
>>
>> BUILD_READ_REGISTER() is always called with ERST_VALUE_OFFSET as second
>> argument. WE should eliminate this repeated passing of same argument.
>>
>>
>>> +    /* Serialization Header */
>>> +    acpi_table_begin(&table, table_data);
>>> +
>>> +    /* Serialization Header Size */
>>> +    build_append_int_noprefix(table_data, 48, 4);
>>> +
>>> +    /* Reserved */
>>> +    build_append_int_noprefix(table_data,  0, 4);
>>> +
>>> +    /*
>>> +     * Instruction Entry Count
>>> +     * Each instruction entry is 32 bytes
>>> +     */
>>> +    g_assert((table_instruction_data->len) % 32 == 0);
>>> +    build_append_int_noprefix(table_data,
>>> +        (table_instruction_data->len / 32), 4);
>>> +
>>> +    /* Serialization Instruction Entries */
>>> +    g_array_append_vals(table_data, table_instruction_data->data,
>>> +        table_instruction_data->len);
>>> +    g_array_free(table_instruction_data, TRUE);
>>> +
>>> +    acpi_table_end(linker, &table);
>>> +}
>>> +
>>> +/*******************************************************************/
>>> +/*******************************************************************/
>>>   static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>>>   {
>>>       uint8_t *rc = NULL;
>>> --
>>> 1.8.3.1
>>>
>>>
> 


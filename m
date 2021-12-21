Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A04647BCFA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 10:37:41 +0100 (CET)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzbaW-0006P4-4o
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 04:37:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzbXq-0004wo-Vk
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:34:54 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzbXo-0002TW-9y
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:34:54 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BL8xKot004454; 
 Tue, 21 Dec 2021 09:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=nLZLgSEF66v8G2Q5JeKEtpH1/CVa74aEsHHFj/2a6UI=;
 b=XDjqDCxDlI3b8PSCBptv1K9tEYL5GPduJuLaXpekNRyMdnIZttDsfXjvlcftFslad+3P
 it3y4LlsCqiwSGOnxYzuO1OgzYvWmZEBCmKhd9ALbuUuYwHSp9dFp1v/yoi3/p+3bzcB
 KgFUAqUeF54+8qCIpdUs1cD998OSOpL76N6mjDlfPEXltaCC7e5H+QC0WwHs3zaE0LfE
 9lcsCwdRcwxvOUna3nxxLrRvZFLu7XiOzG9Tqp57PtnkI4AfsfXzUaFFII3yL0B8Qixo
 Y1YtdJE3tF1iKxT98R9huYvEXNUFQdEsnV/WOs6g7FD2uQEM1d4rp0CEcIT2b6m8papm Lw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d2qk2as6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 09:34:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BL9Gk9W069723;
 Tue, 21 Dec 2021 09:34:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by aserp3030.oracle.com with ESMTP id 3d15pd072j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 09:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYGwlP55yGCI9rTs6YoFo0RJIZYEckShgGVOQfggB5EpU2GhmYZnfF3evekotXIy2ADJzkvpbGR3BTKoqs9h5gGWdacwX2YUIj2Yc31FFHZcozjWKWPblFDHtNZ3K360Ah9lxy5l4BDFZyRSUk2j6eQH1SGLF819yq9QDRmmPD5xKu0e9lJumNbE6EplT6Z8flIC638LNl/9rbJcRqLYAH8Qr4ZAFUjwlAGaJQ/m1KrCyq5Peo4XvfSqfA0HWiwXTJhUs/dOOOt9Ndzm4qcRskB2Kmu8p8UmRvr4WjG6YoD0JD3gYlP5zW986WxJ0UDCuXUbV7FU4h1fx369SK9ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLZLgSEF66v8G2Q5JeKEtpH1/CVa74aEsHHFj/2a6UI=;
 b=cxm6IHgdlXcfuJ1CKed4wsHbyJsV9Z3Oc7tp1vPMFTxiZ7lzIJrK7WE/UVCXNyx7/X/LqL+936jkvH+O9mxwXVdF6U+hxrpzy43E+az0iaRW77+pjwnJjzqF8LqaGiyFcy4rAGFTrY8LSdFwkEtCy9wEaboIlqZPCQClpy4eXaEHc49TqhCP2SvAvC+8YGfYUKetKKa6nyM3ZDK1NEAV61jYKiiCV7Wwr8Dx7iOdLijGNadd0m4nbET+SVAybgQuCgcxyZNSJucbDmlT2O+JHkC5anZOH1EujE1AJBG0UC2JSDxRGi1m5ibzDaYxWiEhevnqAVyXmDo+z7MMRu++0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLZLgSEF66v8G2Q5JeKEtpH1/CVa74aEsHHFj/2a6UI=;
 b=zudjxuc02Ph5iwKFMNnx85zbRZO+bf7bz8L0Qk2m0yATFRP4uKFPvV7MF5GIACKETP8qjvfxpEkHp25fZxKYTue3UCQHICNhgp8OJKbVyw9lorTpcjzRpe+gnzwe0RcyrXkREjn+9ZQJgs6G11ck5bQR68CChLMpng93aShc9KA=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR1001MB2267.namprd10.prod.outlook.com (2603:10b6:4:2e::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Tue, 21 Dec
 2021 09:34:46 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 09:34:46 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] migration: Tally pre-copy,
 downtime and post-copy bytes independently
Date: Tue, 21 Dec 2021 09:34:39 +0000
Message-Id: <20211221093441.1445590-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::26) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fb93a88-012b-405d-1674-08d9c465206e
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2267:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2267AF6846853F1F1F6F7732887C9@DM5PR1001MB2267.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: plYxvqCfpzeONovCdtqPSd11NnAs9rz9B5HsCtiAS1706dfQrkzU6l8BBhd1jvWbFh7YViWjiOVxb0MdNcmt/kcvH7jnJfddC6HkgPbBSs3muQXSj4KT9WKVQOnDezJDMU1ONwFMlCXhiIC1iLST6rYspUdNRuCov3m8FRvqysEn3S5XwpLvTWSpYpODOQ6En3DldOoBFungP7Pd9PmYQJ2CTiLEblLRGyjkyGIEfLJMGGJ/4fPhkStgtFTOJFyACiWbVKAwd+UmRqiw2a12/hCThWIImJDWRbjzHGrO6mm+2ou95VDLZqt8eQAIok/Bm7R1MqaveMtDVyWgjfWxceScZ9Ds+/eTUaArXaDbMoabzs4ssDeDyArmLmsR2gxu39hVxSp3TAJf8iYV00SATS1vQ8XCszQfXjLkHlxyieleqcD9KMK3ZuMs4nZc0JHDzbp2JBqWgngr9a0b4vlBGb4lYgTqSutl43xH95L2vqbf1EoZomh2CGCRJbESgGIPf/1LpsR2cjQS6wgn2BxaswPEAPgWFaHLTDXioop6MDinEdyRxmDuu20HOwkE87ae2poHX8orHT9mCvs4g9FeiB7CagNaNxWA7jfTPilXhU9DcJKU8GZD7tJKrxOvV7XBJXaPnGqGXF7/53V7lCq96A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(4744005)(52116002)(1076003)(83380400001)(54906003)(6512007)(44832011)(186003)(5660300002)(6486002)(86362001)(38100700002)(36756003)(8936002)(508600001)(66556008)(2616005)(6666004)(6916009)(6506007)(2906002)(316002)(4326008)(107886003)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnRBQkVHMFQwNHdNSUFBL0F2L29zRXlCZlhJQkJ1Zkovd0tZMDFZRFpnM0Rx?=
 =?utf-8?B?L0FBY3lJTGRPV3RwdkloMm9qNUNNVk5kMTZoc0xtNmJpT3BYdjd4cTk0NGx3?=
 =?utf-8?B?YTE5L1JBVHJxTDc1TXplU2NMQWYxVFBxU2VmbnF0QjZWSGxtYU1GZ2ZkTEFH?=
 =?utf-8?B?bk5ta1VFbU1vSFovam92dy9wZ1pRbG5JWE1ORkFpY0RYMjVTM0hFSzVvY0Rl?=
 =?utf-8?B?VFVYbmZva0VXQk8zditPVXpXYW9tMHpVNTlBK3d3aWJBbnZsZlFuaU9VYlpn?=
 =?utf-8?B?dllyTTJwOXliakhKTjNnZTFUM1laWmsyQTQ4Y1hmKzFiQklJcHZ2OWhGaXFV?=
 =?utf-8?B?amNoVjc5MHdlZGR0VzIxbThxRWFYMnpYWGNNU2NETWszMkhjYThNRytBTUVq?=
 =?utf-8?B?OXBId1Vab1ZYcm4xU3oxdklCanpnaE50VnJCZFd3RTNkM1JSVjlpNVJKR1lz?=
 =?utf-8?B?N2g1MGV0dHU2dGN6RklXWkU3bnBJdTEvUXZLSXlkcnB2Vis4QWFhTDR4MmVY?=
 =?utf-8?B?QXl6N3cvWXppeW1pYzVnNVlYMlNyWWpjSFJTemtvK0UyYTRsa3h0T3AzZnZy?=
 =?utf-8?B?eGozV3BZK0tjdnZWQ0JLZDlGbXZTb2ZXbWUwNkRNQU5MVm1OSUQ2T2dBK1Ja?=
 =?utf-8?B?MnVpbnBsWDAzditNT2tOVjZkQStlcVdVa0JlYkUvd0dxMHU4VHBmU0hoSEZF?=
 =?utf-8?B?UVZXOFdjY1preGR2VjR1bVVaU3NuSXd2OGtuKzAxQnYxQk5aRGpVQUdWSUg2?=
 =?utf-8?B?QVVVd2hvY0JETUtJQjBaTjRlZXMvSjZvMmdkTThCYW1yN2JCSnoySjFYc1BB?=
 =?utf-8?B?ZzIyWGhOSjl6NUxBZXhuOWtLaElZd1ppbUczSmttb04vM05nendmVXRiTFVo?=
 =?utf-8?B?UE1wK1VVNWZOajhJNU1rSzVPUkgxdElVTGRFVDhzSFVLNnpjbHRqWmV6bVRG?=
 =?utf-8?B?T2ZBMW5kT1hYTjZrVy9hS1JSMEo0cVBLUFlaWURNZ2Y3N1c0dk5jUElhd2dF?=
 =?utf-8?B?cDVTakRKWk5hdENrOC9oOWRRNXpPNGRnLzE5amJ2OTFtUFNuNGNKZ3l0dWhR?=
 =?utf-8?B?YmphY3JoQWxLTGg2Vm52RFdZRXN2UkpuOFlpZ3k5TTRCZVhRcVkzbjZMc21i?=
 =?utf-8?B?RUZqZEJFSGxVNU5uZTFhdnF1Sit0OEVHUEFzV2hsOWp4QjhzcFo1bnF5MVRL?=
 =?utf-8?B?UlpmQVNnN1lRSmF4aUFrdU9sa3JaOHJPd3o2TE1YMGhMYU5vbDNWM0xVTFhJ?=
 =?utf-8?B?SmZnWGkyYjdaQmlLQnlFTlRvb3RqNmdJR0xOMStOVFdWTm5hRlArWWJUdldl?=
 =?utf-8?B?VWRtd24rQXlVbytyRXdPeXZPSld5eTgybEYzUHFLVENKYjk2b0FJdnpYMm9v?=
 =?utf-8?B?ZTRRUThUOGJmK1BKM2ZLT2hrZHlwVWM2RnZjZU5VK2cxWkFsYjlFV2YxbzE1?=
 =?utf-8?B?WExzWE1CZjBHTDBqcGlaTjFwVTRxa0ZlU0ZWKzUwT2ZFc0FQL0xDR0p3ajFt?=
 =?utf-8?B?ZC93Nnh4bVBSTDMzT0dLRGVtZHovbWNqOFpIcDJvQ0ZuWWNSbk01RUJGYmhK?=
 =?utf-8?B?WFNEYXNaZE1ieXhtMHM2TWxrSy9YMmREZFUrc2dEY09STEF0cUo5TlpPQXZl?=
 =?utf-8?B?dGllaWRyNHpZc0ZocEt5clhwNWhKUjdmeUFxM21BWUlGbkUzL1NhUkVRU3VR?=
 =?utf-8?B?c0pEclRFbzAyOE44TUxwUFhBQ1lzUDJBdUJTcmcwSGY5cmcvNE1kVHYwSkVp?=
 =?utf-8?B?WVVndDJzbUprT3R4ZVlYOVBMTlFuS0JmZ0pDblVTRzJ6M0drQmpSdzVLKzVE?=
 =?utf-8?B?SU5ZUUtTOU9hNDZpTkR1SmVxL1pTSjc3ZzIxejF0bEJjcitPZS9lNEZnRW9V?=
 =?utf-8?B?blpDOG1uOXpXdkludUlJZmZOZlFwZE95NFJRRVdMdHR6WkxSODRKbnhKV01r?=
 =?utf-8?B?QkFJSXNHTjY2b2EyK2x4dXlyRENZNGY2Y1RNOVRKWk1xNW5wbnFxdXkzYVZl?=
 =?utf-8?B?SGNMdERiSkhlR2IwUk5pMUs2SWFMZG10czhienU3Y2VGOURJTlFBZlhDdXpk?=
 =?utf-8?B?NDBhY010d2tkR3lMMmVZZE4vK0lYd3ViTDQ0akR4eEJPeEFvTW9BVUFOT1ll?=
 =?utf-8?B?Q2xoQWZ1ZUMyUVZjd2pLLzZPZUJuaFdqbW1zN29JM1NCTmdBcjhhMXBsZUlO?=
 =?utf-8?B?bjU3MGhod3g0UTJrR0UvQWpGSzQ4eWxEN0x1VXQ1akpWUTBkMVVMek1YYkFa?=
 =?utf-8?B?ODJaK2FIdHVtaGl1cm9PTkdVQk1RM3FmUUsxeWUvYmhjMmRqeGIzM0Zpc1pK?=
 =?utf-8?Q?FTcUc7NwOk0gEdjgQR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb93a88-012b-405d-1674-08d9c465206e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 09:34:46.6961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEye7yDfSuzwtrDYf4ZLLfxxu80+6uQP5qm4YIVZI6mRb4OW0yzQh6DSnQGZR8+dwMcu7B1yx2+xbTcHzYv/Ob6WKJn2B3OcvZ14L++YyKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2267
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10204
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=806
 malwarescore=0
 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210041
X-Proofpoint-GUID: _b2o87h_sTNwzrOxZDvUiypNyr-Q1H0F
X-Proofpoint-ORIG-GUID: _b2o87h_sTNwzrOxZDvUiypNyr-Q1H0F
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When examining a report of poor migration behaviour, it would often be
useful to understand how much data was transferred in different phases
of the migration process.

For example, if the downtime limit is exceeded, to know how much data
was transferred during the downtime.

RFC because the name "ram_transferred_add" doesn't seem great, and I'm
unsure whether the tests to determine the phase in the second patch
are the most appropriate.

v3:
- Add r-by (Philippe)
- Improve a commit message (Philippe)

v2:
- ram_transferred_add() should be static (Philippe)
- Document the new MigrationStats fields (dme)

David Edmondson (2):
  migration: Introduce ram_transferred_add()
  migration: Tally pre-copy, downtime and post-copy bytes independently

 migration/migration.c |  3 +++
 migration/ram.c       | 30 +++++++++++++++++++++---------
 monitor/hmp-cmds.c    | 12 ++++++++++++
 qapi/migration.json   | 13 ++++++++++++-
 4 files changed, 48 insertions(+), 10 deletions(-)

-- 
2.33.0



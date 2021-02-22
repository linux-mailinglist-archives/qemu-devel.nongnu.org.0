Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAE321EA8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:59:47 +0100 (CET)
Received: from localhost ([::1]:60048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFUo-0003kh-Gr
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lEFJb-000134-2u; Mon, 22 Feb 2021 12:48:11 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:45072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lEFJX-0001xu-Uo; Mon, 22 Feb 2021 12:48:10 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MHixkK084980;
 Mon, 22 Feb 2021 17:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=lU2mGfJiiiLdEpkPUp1dJKHwbDsDYIBdBGCHD8cQ45A=;
 b=GK93qquusyMp94NzN6HXJtl63KIyYwMtqUC6WNquZDmahIQt3ke+Ht8RhXmogY5yyGvw
 mfrgZDsv/tvdVTTqmTEx6w1p9dTzTqIFV8XtFd9vcXV1EtG23M6DCCZSlG6+37PWtcwk
 8jwZI6Vgs3QYbU7Ut+b6F/ZVjamky04q49YkxZgpgA/tCleau7LGoL6B6spTqj9bjscY
 k/Twy9Xq56IT8x1u42FDaltJFMNrkIar/MaqmCCH99ahDT/Q4C81HtwGrLFmG0gnj+Mf
 nM/zXAiL1TVGwlEQjZPkHDzHqCthYzVzbhZD09tWNJGZJlXjv0HRQ3b5Pp1AyUfjsA6M CQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36ttcm4h3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 17:48:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MHkLAP142001;
 Mon, 22 Feb 2021 17:48:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3030.oracle.com with ESMTP id 36v9m3jhav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 17:48:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euPtATsGa2M7k4z3hVdXF2MmAav0i6Je33JMftpRXQS+pnDlp1vWcKy2OUPiTW8SXUDmLkZ0/jYzkL4CNfhN1IFdoJA59sj3JX9nKR+QJ2lTohPGQC6FbI2/3tR/4A0jQAmZ0BnoHTg6P85O85NpQIn3746PdOJ6qwUlbGyYGiQaTyOZ55nbRS6Oqo/BE+MieH1dIkBDKfZ3x0IRhAaG0yqNTvuwqq+MMjSIi4hoigdKy2EQ2tVS7ltwMmf9+G9dCZwajhI6w4afOlEkWm+DqomXDp+Wtp3IO4CwJLeK3nn3GMtrTaL0cdzDpq3Yd0WSjYgETPcOrlYQXWpNifGYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lU2mGfJiiiLdEpkPUp1dJKHwbDsDYIBdBGCHD8cQ45A=;
 b=R0MM0g9SnnTR//8IhzXorOWnU+RtNcBpE5bptAlR7Xc9OKIQJCbUEDK1CCKha8tEZEPLlFPIarXy2ESr8dR8Pm0UejMdT/CAuzi1cPaRGvbz7hEaFjqMEmpfpM/2FPFpIWqHrdG9VIBkn5k0c7wAcPvStCSIERdm48unAFuFZ8hY/I8RVPy1x95lwAT/jJ19dHqpdds4CH2uAfYyFR+sO/PIeVAV0vmBHhjFuOG+p8KS8C49q2LHDlPkCoR/0V+9tgHB+d7MmG1vrTmtUUtOQ5TXGN+/nm8cfbCWObVxKuWaYsVyW79ppV5i3mxdW+Gv3YESXkB1rFyMqVoEVTgClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lU2mGfJiiiLdEpkPUp1dJKHwbDsDYIBdBGCHD8cQ45A=;
 b=l8uMTY1Wn4TEPe56ehe4Q/fKD7znK3XtQCuu0+xZKodHxgRAiSa152aAehz9GYy1AOYehXR22ffFml0oaS73eyGEcvmC80uBBSVaz5TNgLAjOPmnLhj3OLKPG8ClnglWgRZW0M9WVZWiYMGALJ2qQ1D9B4xuCxQSkaDTTgiOHY4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3804.namprd10.prod.outlook.com (2603:10b6:5:1f6::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Mon, 22 Feb
 2021 17:48:02 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 17:48:02 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 0/3] hw/flash_cfi01: Reduce memory consumption when
 flash image is smaller than region
Date: Mon, 22 Feb 2021 17:47:54 +0000
Message-Id: <20210222174757.2329740-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Mon, 22 Feb 2021 17:48:01 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id f08febd4;
 Mon, 22 Feb 2021 17:47:57 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adc74ce2-e218-4ac2-d4b9-08d8d75a0023
X-MS-TrafficTypeDiagnostic: DM6PR10MB3804:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB38046D589110E40EF93BCDAC88819@DM6PR10MB3804.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+7E/6nrMi1m12u2M1QW56LIqILbBWjaeGelwqGtuA8MGItFqTSJrWK27GuAdswBoMWcCAdqQEK3WgQltD1rkcoAGFOOgJre78myTRqFzmCunI9EZicRm5zw//PNyN0YCOoR7Ivk78cDwGawxP76zBb1FxVqjV+XLYd9MzM8YKuK+ZuiFx/VyHbEaWVjGjR6ZrGZOKHGkIZm2CWVUIQd872pINAYRvlxhTT2XsH4rVJWn6Zy+wLPl2KPExv8EBXdQAq+J/ecmGvwdUaBmNZoi+u2ky+yo25VGhKu3j1AWWOCOhY2Zz0HrPDKYLO4SnP8YaKcwuxyhFJ9nTdRn7lNSqMr26wj9H5FsrC/p5HBq6iRONlZ0eQj6PiwjgpRW5uyMCYX6Ii7XAl70PU2UV5yHhYuhzFE9TdN9vdc4KEKT0XTtqSqzICy0ZCHFFGzrxTi0gyPxo+8MGMRIzkfWqIaXywycMn1Q3fx25rmNvSjJed6VRgpEzvsfA5pu0AuZK9W2YFrqVKtq0L84CvDxnFvfndgVvCQmDh/2lPe1wXQhTTIfb12D60Igr+heD7Qmw0e7CTS3wWMs2+o8S11w+vFIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(396003)(376002)(346002)(107886003)(86362001)(1076003)(83380400001)(6916009)(44832011)(186003)(316002)(966005)(8936002)(6666004)(52116002)(66946007)(8676002)(478600001)(2906002)(66556008)(66476007)(5660300002)(36756003)(4326008)(54906003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3gxVng1VXpndjd4Skd3UGt1U3NlSVZMMWorTE95UTJEYWtnck95TytxZmNF?=
 =?utf-8?B?YXNEVGxsS3FpMmJjMThVTkNZekdRS0JTWHhCdmF3VTJHNkorVlJxSzdKNmlu?=
 =?utf-8?B?WWdRbGFZakVzZUZwQWNWclpHRWRZU3N0V2dhNDlENXlYbEJOTThLK3N4dmlX?=
 =?utf-8?B?ck1aSEc1RlVOSWZhM1hsdnFKcEtKbSthUjVtVDdwQ3NHQTlPNStyK1p3N1Uy?=
 =?utf-8?B?Q3R5d3VKbVVnT1lDT2tIVElIRU1XRThKWG5Nd1ZUdEh2M3p6STJpa29IeUZr?=
 =?utf-8?B?VnJZQkg2L0pjYTc2TGNWYTV5d0Znc2RqODdlZkdaL3kvUFFsRmNOa1BDbkZZ?=
 =?utf-8?B?N1Z4azhyd3hrWjM2alVyeGJBRmVwc01GNVBWSU9RUFZjTWt3SHRlandhancr?=
 =?utf-8?B?bGtycTN5c21CaHJ0RjlWMjdqMnBJZ3lyMlJEaUQ3QjB4Um1IaXRjVEM1R0JU?=
 =?utf-8?B?aEhNWXhiSU02RnZ0UUlONDhzbEZ1SVA1emdvazdlSnEwekI2cElLck11RUd0?=
 =?utf-8?B?UjIvZGhLQUhTOUdzbEtsUzUzZm5rSmxSQUVrRDZGK1JnSHBkZFA1UVh6RXN4?=
 =?utf-8?B?RjRzUTdnTGN5S2o2dzluZE9KRklZWnV4dTZXZUo1S0NpYVdFOGxIaGM0aU45?=
 =?utf-8?B?RTFlYXRTaGxtbzc1UkZyaGpXR09SeGpjelkyTnU1bzZQWDZMeklsQUVGbjNW?=
 =?utf-8?B?UU43Wk1ERjlxcDBWRjk2MXJOR2YvcTlybitKaitCMEFUbnZjNFN6eVZ3WFk3?=
 =?utf-8?B?MXRSc0dmQzI3K3JpZW95QTAvLzBLai83ZmtPK2tzVHRINVdQTE5EcFNjaWdR?=
 =?utf-8?B?RW10QXByakRadlZxeE5FbWw0MWJwQWtTWm1mWGRkdkpiN3o0QitXZmYvUU1r?=
 =?utf-8?B?SkhzMTRuYkJjUjB4YXVwMnNxYXBDaWFndkZra25JeUxUWUhJeW5HOWJNQllU?=
 =?utf-8?B?Vm9VYXlYZUJqZ3FGMFVrTlRnSXVFSTZpd3VrN0VzVFVNb1hOcXV3TjRsdjBs?=
 =?utf-8?B?MDZ5cDN4SnFDb0huSnk1OHVhSGRFOENIM3QyM2o5ZFNManA4bzhHM1NTZkdH?=
 =?utf-8?B?YmpzdHpMams3K2cyQmxhYktRcW5vZEpyZ2JhUGdZNTJBTDUxWUZZRTRlTnhJ?=
 =?utf-8?B?WUlacHJqdGN2L1h2Ymx5T3RSNjFvWFNINXRCbVlpR29KYjU2WFRQNHdDUHEx?=
 =?utf-8?B?MlNPYmwxbU5QeERRTlR2QmJzSE05blR3TnQ2OENHdnNvQVBDSU5YTmJ3QUtS?=
 =?utf-8?B?ckNiN0FNeEpSMHRtQlc1MlV5OVI1M0x4TnhMMVhCRFVqaGdrdHJBc1kxLzVU?=
 =?utf-8?B?Q3N0TEFiNHRCUkd0a295SVdDZWZqeDhKMy9jd2Y5bWtDOHNWTlczWFBDQkh6?=
 =?utf-8?B?ZUxZRjg0d0duRVBBa3o0NUNpd3Jmd2F5dGZZUTlnUUEvQWpLRFp4dDByemp4?=
 =?utf-8?B?MmNZWUc0TUJLRnFFQ1NwVW9SQnl4VkRxOE1Ya3FOTkxzL0QvZE1LNld5dEFi?=
 =?utf-8?B?OE1aa2llZFAwT0tTVjJzdTZjaTlHQ3h4bkl4cUVHbjU3YkNZWmNjTlZlbmVW?=
 =?utf-8?B?cmdObXhtYnlLbEJNY0IwOVBDS1lxYmhPQ3hrUVRUVCtaVUNXWXNjaUlWMUNi?=
 =?utf-8?B?VjU4YVFNWTdDdlRLcEpGOS8vRWVEdDdmdjFtcy9ZUXU4Mnc1bk5iS1FCT0Fp?=
 =?utf-8?B?cTkxRG8ybXpJY3BYQ200MTd2NndPSnFJVzVOWkpzejBkdTlQa0VWQk9rcVpm?=
 =?utf-8?B?SEhFVS96V0FZZFlLQUNoVFl6azJ1cWNUV2ZFcnRyWHB4MGdmWVY2a3grZzUy?=
 =?utf-8?B?TGVTdXFpMDlEQWdGYk0zUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc74ce2-e218-4ac2-d4b9-08d8d75a0023
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 17:48:02.5480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opAl+4vXCdKClorudz22hTQl/2xuOUYg33TF/RuGth3uhFkMxKZ+iyRqt/jkwTblGRY/x00ZKD/0bCo+KvijfMqnLeh25Oh9kygkrHQSw+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3804
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220158
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220158
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=david.edmondson@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As described in
https://lore.kernel.org/r/20201116104216.439650-1-david.edmondson@oracle.com,
I'd like to reduce the amount of memory consumed by QEMU mapping UEFI
images on aarch64.

To recap:

> Currently ARM UEFI images are typically built as 2MB/768kB flash
> images for code and variables respectively. These images are both
> then padded out to 64MB before being loaded by QEMU.
>
> Because the images are 64MB each, QEMU allocates 128MB of memory to
> read them, and then proceeds to read all 128MB from disk (dirtying
> the memory). Of this 128MB less than 3MB is useful - the rest is
> zero padding.
>
> On a machine with 100 VMs this wastes over 12GB of memory.

There were objections to my previous patch because it changed the size
of the regions reported to the guest via the memory map (the reported
size depended on the size of the image).

This is a smaller patch which changes the memory region that covers
the entire region to be IO rather than RAM, and loads the flash image
into a smaller sub-region that is the more traditional mixed IO/ROMD
type.

All read/write operations to areas outside of the underlying block
device are handled directly (reads return 0, writes fail or are
discarded).

This reduces the memory consumption for the AAVMF code image from
64MiB to around 2MB and that for the AAVMF vars from 64MiB to 768KiB
(presuming that the UEFI images are adjusted accordingly).

For read-only devices (such as the AAVMF code) this seems completely
safe.

For writable devices there is a change in behaviour - previously it
was possible to write anywhere in the extent of the flash device, read
back the data written and have that data persist through a restart of
QEMU. This is no longer the case - writes outside of the extent of the
underlying backing block device will be discarded. That is, a read
after a write will *not* return the written data, either immediately
or after a QEMU restart - it will return zeros.

Looking at the AAVMF implementation, it seems to me that if the
initial VARS image is prepared as being 768KiB in size (which it is),
none of AAVMF itself will attempt to write outside of that extent, and
so I believe that this is an acceptable compromise.

It would be relatively straightforward to allow writes outside of the
backing device to persist for the lifetime of a particular QEMU by
allocating memory on demand (i.e. when there is a write to the
relevant region). This would allow a read to return the relevant data,
but only until a QEMU restart, at which point the data would be lost.

There was a suggestion in a previous thread that perhaps the pflash
driver could be re-worked to use the block IO interfaces to access the
underlying device "on demand" rather than reading in the entire image
at startup (at least, that's how I understood the comment).

I looked at implementing this and struggled to get it to work for all
of the required use cases. Specifically, there are several code paths
that expect to retrieve a pointer to the flat memory image of the
pflash device and manipulate it directly (examples include the Malta
board and encrypted memory support on x86), or write the entire image
to storage (after migration).

My implementation was based around mapping the flash region only for
IO, which meant that every read or write had to be handled directly by
the pflash driver (there was no ROMD style operation), which also made
booting an aarch64 VM noticeably slower - getting through the firmware
went from under 1 second to around 10 seconds.

v2:
- Unify the approach for both read-only and writable devices, saving
  another 63MiB per QEMU instance.

v3:
- Add Reviewed-by: for two changes (Philippe).
- Call blk_pread() directly rather than using
  blk_check_size_and_read_all(), given that we know how much we want
  to read.

David Edmondson (3):
  hw/pflash_cfi*: Replace DPRINTF with trace events
  hw/pflash_cfi01: Correct the type of PFlashCFI01.ro
  hw/pflash_cfi01: Allow devices to have a smaller backing device

 hw/block/pflash_cfi01.c | 188 +++++++++++++++++++++++++---------------
 hw/block/pflash_cfi02.c |  75 +++++++---------
 hw/block/trace-events   |  42 +++++++--
 3 files changed, 181 insertions(+), 124 deletions(-)

-- 
2.30.0



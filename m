Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607E43E1EF2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:40:17 +0200 (CEST)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBm2C-0000Oe-Af
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBlty-0003Cg-TZ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltw-00071h-Mn
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:46 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MUwlh021793; Thu, 5 Aug 2021 22:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=oml4UNaaMWFddZsB5VA/3Wnlmefd4v6A0AAAeBi+9LM=;
 b=Nj8h5PcAAm4K81WclbUzGOEgarUCKc3BSn+jjarq8Bb7sNxUaTqlVcwPi95RhsvWk+A+
 UEMTcqeD3ixU9PbgJnfbuzmzMCJN1jfVfRbM3U5yocKAtKRcBr98Hej6Ty2d6RJR1XJ1
 OT9wINd1dRb/TP7L7WBFIMjIfXX1IgeegbuVe/lPsKKiONZqi0UDUO/G1hRooxkwTYW/
 ulrbLYS7ONsZSg3bxo+91l2sqgVRJGpxEnarAqRNo9CIY9FrypiCAVaIHhNliyBlY1gu
 Gyqb3BZz1e2iWus8eTXqp4bcdLVwX9lRJRWuwYlXaXzQz2znNp6fqsDMRRj6TIhefm6n WQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=oml4UNaaMWFddZsB5VA/3Wnlmefd4v6A0AAAeBi+9LM=;
 b=oCmunyrr+ha8gt5I4TuXsisOseLRmViPA+hMENNznD3sMwUUDaB+zKFgS53Q2RVmoOMs
 w4FgwN+cjmEpHmNndMFNSZvqSHSoBV2TjWdJts1rZ8mC/eNNJEfwLu8lYQMs3ryNxkYm
 dlt09qJhr2ExnQ677GR3oDbx0rxOVOi/Vo9YSboG3fJOdou/pLz3yqPtTCgYe4lf64+t
 c/G9iUFUwabexNJoJac5scwCjnYxhYMC4xEsILqHRS1Ci24JNZnaztr5xysLKUufBlSs
 ix3Hp0JND3Uwx+uiqz5yOnRyXoqYeper7yZ2kyLHiKXlbEfnD78ZsqCcPDs4768T2VkG pw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7hxpna3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175MVa0t008919;
 Thu, 5 Aug 2021 22:31:40 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
 by userp3020.oracle.com with ESMTP id 3a5ga121dh-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6Q7xmFYU7Q3pRWKdGEr+Jb0VzfuHut5VwaYsUCi5t5DD+VTj0UhDHWtqtBkH6JCROulvNPjtxtHDa+owkHGGHJwDbCH9iF0jHNv61VQCnZhoeSgeFMsOhd6C95huO48eyjdSPIjcEL0Cx7KFL2sEm5HuXtbOLTi8QncyAZ4UeNOD7456OkhwfLDCeWY9W54JWHM4cLqFZ/dW9Rtw72J1gVo1M7cQuIPFV9qmkaqY1N5XyxVWShMooZDuxvyt40+0POxBaukjLr9JDfyzW9xqHJPGyvcnae3MVKIol6Tyc02j0mYJYUanZTmiBAwlaojXxsVqUpVRQd3/DMBLmJbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oml4UNaaMWFddZsB5VA/3Wnlmefd4v6A0AAAeBi+9LM=;
 b=SQSHs8aGhcZO01yAdgWlo4O02qwYIG/V6ufzT7Wryv/kwmw//WxabRdamu7+Tk5q47rc6p7dmaUw9xzaJX0WL6YoOLPqsvTFwrIFy11hT0gEIkpG6PJPluNUHMlaheCVqHwkIKowECLYOFq4aPliRjQOTF9hjUMDmAP4jKc6ZM5UmZmoBzT9+EhEic1rovsaTwHL2T79Jc1xcoTNrmaN/AN1hPK3tL+gAdVHBvcyNnn1uMn/3jBWC4mAE3wYgINtO/R/nCxwhchpYsrk2j4yaIP6hQnujNWpvK9WOo1FF+6fo2AUnEZFS0U+ZbpZPo08K8gJpPpdO8b1yOaONAsFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oml4UNaaMWFddZsB5VA/3Wnlmefd4v6A0AAAeBi+9LM=;
 b=H64hJVqiRqwtM0T/nV8M0CWZ23EWHkP9yNS4UbynAX4DE2JpkY9/L+BMUJLGoWx7ZYoGggkpJmRe78xuXgbWxF9nEZ3x0vRhknbrgcCkOws2s6gvPMt4wSDagEngF9Q8eeBjgUppw7R8Li2PAa+b8jRSPShFlgiP22MtMgxI+cg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1518.namprd10.prod.outlook.com (2603:10b6:300:25::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:29 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:29 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 10/10] ACPI ERST: step 6 of bios-tables-test
Date: Thu,  5 Aug 2021 18:30:39 -0400
Message-Id: <1628202639-16361-11-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Thu, 5 Aug 2021 22:31:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d47bf53-0498-4669-d33e-08d95860c4dd
X-MS-TrafficTypeDiagnostic: MWHPR10MB1518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1518AAF25C73280F1AB60BA197F29@MWHPR10MB1518.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hnKS8arADwprBdIRfdG1b6QKfAv+t6S+y/vZykd1AYETyW2lACvjISomeUWjWqkHOws5JA6atiZ4ZbDfpFM/uSYpLMy27dg5iPx2trZNvAhyisLkrEAQPJyjHtR/odBvbXxhwClV2i1wJwAp1WRJS/GdP3GjO9r0WZyAENg2KNOO0vYNRPKmm02+S7tE6sCS6LT/a5pESb/x5oh8Jf1bC2ei62O0p6WCDxmpeHNCDwBzdm2Du83B1Um3xfx8pVluV3GEBi7GAHnK+UWxLuhsPKr29BjCVPMBhqKbYDiDhHT5jDo156EL8nsYiDEjOinqtNhNZNBladJ/wi9NLE9OugcbYW+xb7++DYJCQ69Y+xlsU37n5UAKeRxUJiDRtvNGFt9pWHxt6JAqvXDq+IbU9GWLvByuAzkholdWPA4rwEANyKTIawxbDeoGKR8Zx1677WlpDHIIxJXj2EtMPfvsi4TuAKmtFQBQCziWGRg4ozwmNm44fE22nUJ6WhN1p6sa0fU8SezUo52C3HzRp8QnyiI93Ljrn21wOpeiuHH9R6ieYeTXv/ef6RdnvZCH50om1HZwX4GNipFjrScpTuDaDITsij3dJQwe2K71A24NhkRRips8IcqTss848VLEkPh6h2SGgCTk0HmjyKS3Q5f9muaQ1phhanIYNi7bNrEEaHk621IzzKD5TNhB7jEgmmJ81Y+dmlsyJ+xJu0u7sXBPXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(396003)(366004)(136003)(66476007)(83380400001)(86362001)(4326008)(66946007)(5660300002)(478600001)(316002)(38100700002)(38350700002)(6666004)(36756003)(66556008)(8936002)(107886003)(6486002)(8676002)(26005)(7696005)(52116002)(2616005)(956004)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvJMbF+uj9mtcPkliKsChyeRPW+fIvy2A0JEs4TKBwssEGgcK9YG8OM8Aqfz?=
 =?us-ascii?Q?cRFjn+EW8uMfVlbsxf5YcSN1+2nhsFT+d8nVtLLgLrSJ3Z11MQVtBINL/tSH?=
 =?us-ascii?Q?9oR3tdHJQbqG07LWaqxxgb5rwLm0x9sFOtt/4GgA+1MSr6QsVzuqEC+pKq0E?=
 =?us-ascii?Q?dbJKfHRiazqYmvbOSaRxD0rZ8+wFIfiQXVOfgNd3jD18kTHreM2yQVC6dsOH?=
 =?us-ascii?Q?gblcdMqOf5grB9clB19QlzCSMw46QsJpyh6iMqovkHyORTXxSesBRHkSASkM?=
 =?us-ascii?Q?1GypQy/Eq3j0bOWzoeS8MfptRj/PsQb+tm4+2QlgIryP1jtME7hiDDrlTQVL?=
 =?us-ascii?Q?5pxUvAKjuhErJAvA7zp3Kd4VwI7gI804ReQ38Xa5U+X34LveQCHQCQvnPYwt?=
 =?us-ascii?Q?4IW9FGaX8WWmym2LWFV9UctBuKMf/qRl7WyuCdrv05u3/jnaAX0+C70eE8fq?=
 =?us-ascii?Q?Z4FQwIjfagk3QaFgPlqoQOKgL9rvz0aZ1sb4aENr8MrY3PGQysPURTpL1mnR?=
 =?us-ascii?Q?Ez+ODGz9QBT3ZXkgwmYRDzWRC80xr0LZyWWdhzZbNVyX5ROtN6wxLX2y6Q3r?=
 =?us-ascii?Q?6Gf8366m2OO9CSKEPBMoN8bV/ouHShKBE3pF/LYymmMrC33Qy/tUXVzzGKH2?=
 =?us-ascii?Q?+TXjEYHPyFkJY+lzZr+/UiOiPvpLTXhI3yE+PtyQkShbu9LNAtmE4KEYXJvU?=
 =?us-ascii?Q?opnSkiVLHy7HzVJrLWCRpP0I46kpu8szQiOo9PoinEbMPZ80UEA3l5M4rVIN?=
 =?us-ascii?Q?W9yLLMtwAGrGChAvU5jqVZrXitj1ClcFe/qTH8EYjaqQb8smniUbU69lRErn?=
 =?us-ascii?Q?zpHGnkdFv1Tnrjo8u+fqiQcHC51y3ycpHnvBXKIx83qRlrhwmGvhAdOfXrKL?=
 =?us-ascii?Q?G550cJ6k7NUcggREJFCL10PPqRVQkGwLG/VE1BOmdb0kpXHLYUG8IRjptUaS?=
 =?us-ascii?Q?E2TkAiv6MxVFXdWo46Ep06JaJ5UObc2REeiYLqD/uLC5KDgAWYkBWPvAF6mq?=
 =?us-ascii?Q?CljDWWGf5atyUTsuA2oGl3Q07PIEbAes7OoLaJag07xuoDLdMIRh0rT9CZBR?=
 =?us-ascii?Q?5my1RqrOnXdLkXyty4AO5olmSALMxm287lhMkrtmqkFEC9uzxlD7/WJOBJgi?=
 =?us-ascii?Q?5dtQ/8PgYHWNlW28y95RowQN48vhTvJjUDAtRW8MYc1NoF9YkgicArj7GnFQ?=
 =?us-ascii?Q?bUF2lDSXmu78s3SeKShOyKkpUAtNrF0eSd82+HbubRHkPa46Bvt18vW/gviM?=
 =?us-ascii?Q?zH4e8VG05j5cZaKth0d5lqiDFne1UJDVGPop59M5btjzKShvAIFyzOQlmxw5?=
 =?us-ascii?Q?Qbo3WiLbKCMLUYgOOQ611m9V?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d47bf53-0498-4669-d33e-08d95860c4dd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:29.4504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Li6zV/1lj4K3tU51a2l5l5Mv+gmnMa5mCVEjkFY/LwNb3kURj056VdeMajb1tN5gokysdPu/mJvqglZ2eENohE7uFJ1Wkx3Ux+J8m7jx1qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1518
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050131
X-Proofpoint-GUID: kS-sJdly45HCFQ0Xuh1pxv8mKpjmleyi
X-Proofpoint-ORIG-GUID: kS-sJdly45HCFQ0Xuh1pxv8mKpjmleyi
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, mst@redhat.com,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the guidelines in tests/qtest/bios-tables-test.c, this
is step 6, the re-generated ACPI tables binary blobs.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
 tests/data/acpi/pc/DSDT                     | Bin 6002 -> 6009 bytes
 tests/data/acpi/pc/ERST                     | Bin 0 -> 912 bytes
 tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8306 bytes
 tests/data/acpi/q35/ERST                    | Bin 0 -> 912 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   6 ------
 6 files changed, 6 deletions(-)
 create mode 100644 tests/data/acpi/microvm/ERST.pcie

diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
new file mode 100644
index 0000000000000000000000000000000000000000..d9a2b3211ab5893a50751ad52be3782579e367f2
GIT binary patch
literal 912
zcmaKpO%8%E5QPUQ|KVrvh9h_c12J)@5f?5!k_Ygv*jGA8UW7?#`}+D#XXyDpKHiZ?
z@anI_W$gOrZRl(SB7!yMqx}#E4EC&a5=}m^g_!0^0`kEl)DOuIXM6D@@*xq*8vyqH
z)b0KTlmlgmH~xt7vG<k#Z1~z=OnyT76ZX;Ysy^;NC0^^$`kY?zKK;^vMtny1JAD$P
zc^BR{l;i*H`IJAW`~~?1`_TXD_wQ2@UlL!DU$GCpQ-4i-O}x_^JdQTRH^e)=(_c$`
LOT5z?_v4Aa+v(5&

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index cc1223773e9c459a8d2f20666c051a74338d40b7..bff625a25602fa954b5b395fea53e3c7dfaca485 100644
GIT binary patch
delta 85
zcmeyQ_fwC{CD<jTQk;Q-F=QiG057Ni!kGAAr+5MP$;rGe;+`zQh8FQ0@s2J*JPZuX
l3>=QZp?+M<lN)&@ggD~CY!RV&S1$v`0B2XP&5C@1oB+Xc6m$Rp

delta 65
zcmeyV_eqb-CD<jTNSuLzao$F*0A5ayg)#BLPVoW`laqN{#GF`y4K3n1;)6r|xR^QO
V9bJNW7#Nr*U*I#`Y|7`t2>@&@5ljF8

diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
GIT binary patch
literal 912
zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
R+q~0XMSexT%^U0Ee0~)`g#iEn

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 842533f53e6db40935c3cdecd1d182edba6c17d4..950c286b4c751f3c116a11d8892779942375e16b 100644
GIT binary patch
delta 59
zcmaFp@X3M8CD<jTNP&TYv2`OCrvjHhYfOBwQ@nsX>ttC4TZ!l<{$N9cc#e2SmmnSn
O1||j(wg6|p5C#C(xDBxY

delta 42
xcmez5@X&$FCD<h-QGtPh@##h`P6aMMmYDcpr+5K3mdUaTw(KHo0nUCQ3;+kH3ZMW0

diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
GIT binary patch
literal 912
zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
R+q~0XMSexT%^U0Ee0~)`g#iEn

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b3aaf76..dfb8523 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,7 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/ERST",
-"tests/data/acpi/q35/ERST",
-"tests/data/acpi/microvm/ERST",
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/microvm/DSDT",
-- 
1.8.3.1



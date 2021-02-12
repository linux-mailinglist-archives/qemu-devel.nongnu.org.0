Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C719319D30
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 12:18:34 +0100 (CET)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAWT2-0001Gr-Sr
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 06:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAWQw-0000gX-2T
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:16:22 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1lAWQt-0004fw-0K
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:16:21 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CBErjx029011;
 Fri, 12 Feb 2021 11:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=yKHNQysMICLhMcR/+/BglT7pNEZn3wD3t66kN3K/uHo=;
 b=rCmRjxeeuEv37hUGF+IVgNTZxpqavS+Oi0k3dPr4vYlef4FK89ADisL1+qocSquyAPhz
 l4a7Mhl6QsGtNBDuFO0TsLy2OykOY2WxBiH9L3exuj1h5hiqXYHT1QBrX+QQaWBfFA+H
 32Ma96pfgm86U+7QepfOpQFMlXQf5Va35OBMG7Tv5946NTSj9LVGfj7yYVuuGOe16gmV
 FSQ3pTp8IlOHSkqrAJy83SB4r6gZlZLAGhvSJou6/7o5L1Erc3pxGS9Dsu5SNXhrtvnD
 01g/PwbfzqGG6zrKOoaFwRTR5ctMfaZKyvniHe3RroPdkdfVLpk/GrOpaNoorctCsWbU Lw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36mv9dw1p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 11:16:16 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11CBFalt069144;
 Fri, 12 Feb 2021 11:16:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by aserp3020.oracle.com with ESMTP id 36j515c414-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 11:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjLDcrFJOo/pz5bw3N9fY2yEVdPI9cLUCNnRXdYKHDaw6H3qC+esmK5uw5ggDNbc3cDvkffWU3tp66oDKBSynrfgqJW8YpGfQWcv7RuapuP4QgzXCFAMvOEo6wEVWmX2KV2D3TbJaC4cE6Qo1KUr9kcEZIMcf+g9iBtfoiESp4MHkPnxsGdfVzzKJ7pjrF+lSJrYU1957Bvy5Q6b+it1rFL9Ab07qFdMVecm4jSOlNbGb3CfXQNZtRwOZVetN8hD5fzAUhE4XfpqE111d85xz37konV7Wo0pSZMHIsAv1Zr4Jj1d+NXUEzBstWWu9UeiiW/Lez8c4qP/vJTz2geQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKHNQysMICLhMcR/+/BglT7pNEZn3wD3t66kN3K/uHo=;
 b=TxSO8BaoKvaH/pF6uRAxeC61qV8ka/7Botq3V/0KF4F08up4i9qmM51ZeQokhu9FpI102JrXtw9S8gCKIg1Sx9k+9heZ11MXKOj4AXAbPQ1b4igaoeBppJ9AaZ9p1G2HDGCcv5R0jrt0+UfY5ZKeQXfV/Gys4rRplFuaPGyL/l+U+IFSvPpCMzUggKCMkIDx7sMy/t/tazMgTJGj0U3PHu/5OpWThbqRx6260oESWD5Nc7PlMw8O2XJiFjNDoBY8pHwxADFsTEnohXk0b600t6+K84F34AWV776rhuydo8iGRt9HZt6rMNlAuEWrVx8KcebgWl+/AguBWJPhDDpzKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKHNQysMICLhMcR/+/BglT7pNEZn3wD3t66kN3K/uHo=;
 b=ZkMJfJM67mxX06Kw6WDpIecHVHWd7ohtY93HiAUGs9KaHtv3Lzr42mNfqPhEZqH0U18n7nbkKEXXagFsIQ0czDoNh9SNwoSOrxpOTzP45I4thI0lC+kXuRPrYcbQAyuPnnhtsDAuqitaz7lBN6yOMYOvf1KAPlt1Hv4s77+9+aY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 11:16:12 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3846.030; Fri, 12 Feb 2021
 11:16:12 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: berrange@redhat.com
Subject: [PATCH] Fix segfault during NBD iotest 083
Date: Fri, 12 Feb 2021 06:16:06 -0500
Message-Id: <cover.1613128220.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [209.17.40.42]
X-ClientProxiedBy: SJ0PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::29) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.42) by
 SJ0PR03CA0234.namprd03.prod.outlook.com (2603:10b6:a03:39f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Fri, 12 Feb 2021 11:16:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc928a4f-8b22-40bd-4f79-08d8cf479a86
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4686507F3F341C51897090E2908B9@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +0CCyA3KDfY3FIydSZYa5ArAziV71s+wcsmyTrgyb1uhDd9/AnCezc+Px3pMti8ewl/vX7POoUjMIiNes3V0LoYaQEJ0MwG+jJ4RNws3kLcYxnmKR4SjEW/kB00M+jMXzuLnbddvm2zFHxAbZRApkMoPp4wl4uzrpyI+Xzo7D2z+wdlReq4/941Fpo8o8PeIaMCjj0K3zbT8Ig5By5WY+rhDwAVBUtjq4XSzLKEr6VitkayyAOfrJ8Pk1KPkiWq1brriQmX3iw7IYZaUxRaLCcm+hncSS6nwiyHItJRNBHeRm5v3FIMaX2zZ9aZLSGYDGW2/r0rK1StE0b1hcSV/YtJ0VkRfnOavdadUVmsvWpir87UNsjv14nefNKh3EtSFHFiA82/nWS/6jirc2+uzAaK0DYRwon2XwvL6g4LnblvkEt/yEFsZqakF5RtOdo4/dEliUibx0YSaScc1/YuGC7Z6054xdeoy098hqHSd0cf/T9eKkMfhc5FWT3o2yFZrpbxrDBfnnfHPVfYl88fFgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(366004)(396003)(83380400001)(6916009)(52116002)(66556008)(66476007)(66946007)(8676002)(6666004)(7696005)(2906002)(4744005)(26005)(8936002)(6486002)(478600001)(4326008)(36756003)(86362001)(16526019)(5660300002)(186003)(2616005)(956004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?smw3tyOcbvskLD6eS1j7bhCHWY20RexOmZFjkMtaAKQPOx8YdjjXx+V0PKOT?=
 =?us-ascii?Q?7Y0eiDAZR3t0v4RUrhVMI378pQQZMNcq+4iC2WlOYwGb27NLkxJZr3nvL+Es?=
 =?us-ascii?Q?3vZ2SSJjWejXqPNlRoM/zrrpGXrTBXRsDO1fX0VrCM3jTc9wnqRpM6cbMcKj?=
 =?us-ascii?Q?kowHPvm+G9c6/xdCnITx4OydTlq/Vi55krF0opg8C8azfGe3sDpn66UVihFJ?=
 =?us-ascii?Q?ojdw5tvQdejYar1/x0ye6hTZlJUADQnbG+kI75rEOtGKTde6Aslt8rNgBz2e?=
 =?us-ascii?Q?5ej4e0S+nsCPCFFtJqddQn1qCe4ZnSEM0WegPTXt2bJNazUhRvnlnFjsZbE2?=
 =?us-ascii?Q?6yfqgIvxU4G0bBCzxsKA31SyMH8f2TMsXg/LJgs0OtArf9Mb7ZutmsuXr6H4?=
 =?us-ascii?Q?+fEHYA6JtA5ZOtdpDHvnfYNiBK5ZKUeiLdo7SUS+5wsFn+z/zirhm5oDEEc6?=
 =?us-ascii?Q?MWqQNav/IlyxJ2EsXnymNi6OqX/oMUqyOi42Xrm+k/3fkoqwUrP5RIBY2hjL?=
 =?us-ascii?Q?1NDENJm9UfGu8Z5A3xuCO9i0iQsaj1ysV99+EMpa3xRnLicIF0rnZPTz7nNn?=
 =?us-ascii?Q?GsrssnkRURQ8e+TGkodtVyEC3b6rmG6RnU65ZHtEgpwE5e/zLJnEqBpx5V3s?=
 =?us-ascii?Q?7qUhLLG+CBWgaRO6mDcCNzaXgnYy2NtjX/uA6G/Zr/hE0/T9O0p1BTP8EZtk?=
 =?us-ascii?Q?8RNvcite2m80rBJpM7+43Mz4EfZBpnLUU6TY5ckg75Bqdg9J5de9pSO1IH4D?=
 =?us-ascii?Q?5DR0ubHSFKhkZt4psBYDPOmXU9e0OZmYRIYzDskxEHZ+XmlF9CJ78bGFtfrK?=
 =?us-ascii?Q?OF3qESL7WAADeT6W4cfYeszOXGY8jPe1KjL8oRmGgktOXmtcjqG0HtGzY3TR?=
 =?us-ascii?Q?VgLKoqVmq8cwVZ9TZOYxf4MiapFtAcoQpzntM4kiN6ISOUMV0/NoUI4ppvxb?=
 =?us-ascii?Q?Cv78jJq75fYV83INKbt69zoeG77HfaZ0ZkFHGzqfDNU5IJ4q0JmIp5GIimbj?=
 =?us-ascii?Q?4uE52Utg/FgK67akQQUZMdU4LRsYW9HEpxyvNPthl8A9YSX+RxdrEXJ0I1Ir?=
 =?us-ascii?Q?QIuiyauJjy+X4zi0WogZBH3oR8fCGn+50asUhZ0ffOoqvtsAMrmIy7IIUwkW?=
 =?us-ascii?Q?D/AvJDFP832ZINeaXfcdlGMLDb7aE7ipM5uHCUpYHdKEBQvFuwLUQNItmxvV?=
 =?us-ascii?Q?CxKbttKDzohhwOvQNnXQr0vVCJR+MNL4AgjboOw7lvsWpgoVDilVu4FnwCzb?=
 =?us-ascii?Q?G0vLwY2Ef8FKgpyKPAWsxKui41sW9UuFPcpM74sGYPAEFbqV/dV1FUR4Q5D+?=
 =?us-ascii?Q?ADRGJpd9xZkwQdYxM2wRD/pX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc928a4f-8b22-40bd-4f79-08d8cf479a86
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 11:16:12.2471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2fVlJDywEB4z+JAP8Lrz1+io46hqeNST88JWacZh63OxO38ulW7IVR8aiAXdjxch1el270sPhysEdjyecO9Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=739 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102120088
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9892
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxlogscore=920
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102120088
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, stefanha@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The patch fixes a segfault issue. error_prepend() in
qio_channel_readv_full_all() sets a NULL *errp when
ret is 0.

We ran the following tests with this patch and they all passed:
- cd tests/qemu-iotests && ./check -nbd 083
- make check
- make check-iotests
- CI using Travis. We also kicked off gitlab CI, but didn't
  hear anything back from the server

Jagannathan Raman (1):
  io: error_prepend() in qio_channel_readv_full_all() causes segfault

 io/channel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB6E4BDB0C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:01:19 +0100 (CET)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMC3q-0007FT-Hm
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:01:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nMBt6-0007Fr-PG
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:50:15 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nMBsz-0002Jj-Gj
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:50:12 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LGfwKx005346
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=8kpAn7oiZOVCWcU/n02i4/BA3S3aX0RFLW7hMoCTxXk=;
 b=XRLys97Xobs5rd19fQw0J9ih3fwdbcDpj49M2f+ojzTeo5N++ueYf6p+ZKpE3lEH93B3
 KqG033a8sKF8JCSA9m803csNz0q+VgnccT1qoKMR1a6T5oZh4pyVUApvql36KI0jEb7p
 sepsP+BDo/gjkuuRohYZGSG+worTe3Ecb0Cfx3Y8+w+dAOt5m/QMCe6+OEvOhN96SIHF
 gooVjGoD1hJKrv/rT0SCt/83CTHZp9SkrmR7fmyylW8EUNyrU0ndEpZMs97JzZTKQwxz
 YCXaDY4dqCeP2t3r87kKz1nDNPA2OZ2zPYR06uEXnGosNxiBTnCPNkY8WeeGUjO9fdIs 9g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eas3v4jyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21LGklsR126115
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3eapkevn74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 16:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSP8C8t2Xw6uTyZKzCggjQY4I/voC29TlSeWYXJCvFnC6FvdUOxKnLVI/B/UlXFMz3mx4WZuf86Ww3K/8ai9YWaV18VryNlWOiVcINGs34AHeh3TnK0j5ftoWLgCb6ytVL0EmfTZtdRzNJYn/kUzKCdCRg6S7rg69UgEOFbBRKQr8XW9YDuojLvRxNEKVPBD2A2AU+O48BBd7vK3PQ07MgLeumXisIio1ubY/7hbXpCI40COnkNKN6JbExhUwhhh0qzYJq40G85tbmPBFzUOyYHgUz1hXE6h5vTlnJDi6nrPNCJO31LD6PqfQeNHsg7pJTOSgxL3wiIS7bxQLVugWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kpAn7oiZOVCWcU/n02i4/BA3S3aX0RFLW7hMoCTxXk=;
 b=D8RS/rP7C+WJyirA+Tr66G4UgSJGbxLDzJTEMd06U1WSj2TqKWIye61jk0eQWxyAL0woaFeuyIUqCqBj/Xj5dukGBnwh/F5vXOY3wl66SADJu0aAAGm0ZeUwgjSxtkDuDibSOJ7U6B4JaukTnRfW+A/A1R6HzbU9aWtgOPzyAWqROSq+EQVCQqUXtcgskOwg0mhQJhM4zVGEGfyaTGpFvxWu7PZNuQv945U966SsZD47ZqlhLSEg9HZObmXrhUFXnNJxVdiPugsOvUrS5Nogn9KBqLPtp1Oxjz0QgwYRzA9M4zW/HgXAxLZfO+1xn+8rq+KhUPz/5uSxIf6VP/wPmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kpAn7oiZOVCWcU/n02i4/BA3S3aX0RFLW7hMoCTxXk=;
 b=q0Sy/9ihJBfvdYnbqQtTNQQIQzHtoOugIoabT3igSgKIv8C6gy8g7yRQ3nNxNWvtoJ/oVdGP9TrzBgLhoK663l3hWfnO+kv4Mmoikgzon2wDplTdBjROuvL7LOh/Y8SSo1d2XyY8JY+COVzLpUsevVL4rs1vW5sISBC/nYkFDAI=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by DM6PR10MB3562.namprd10.prod.outlook.com (2603:10b6:5:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Mon, 21 Feb
 2022 16:49:54 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 16:49:54 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Minor fixes for the Python GDB plugins
Date: Mon, 21 Feb 2022 16:49:46 +0000
Message-Id: <20220221164948.2873713-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b86fc17-c490-4c49-8e77-08d9f55a2f74
X-MS-TrafficTypeDiagnostic: DM6PR10MB3562:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB356280FE46EF32FC89F8BB97883A9@DM6PR10MB3562.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WSV7jht2hBbNEW5SKbCovuPL49T9g6sQ+JomLuy0tqRy6ARh57+FaFtZx0KlkwWmOOHj+qVRHBNaXcVLZTIkgDyqesUcFApW//UoJrURCQmURENIEWWDRlKRW49Bhy57o5toUQkM67+J0nGzOoaXmljgYAtJAaapzup9vZcR/pOyphRsR1ELgcQ1pYN674n/v0l5lszOoP55IocJmaTHd4CSXh6JG5vMcrMY0Gxp8ShNYVQB9VMHa5m3HT1+fKShUc0+cHjeI4+TB/hdrHvowvLwDJSZ9jWEBbRfjhAwbNgqC1D772dLFQ4N1OZQdOxIltp76PZJaEB7jG9EqWn/4siascdW1iDaS/zHOHGZEBkkDGW6HgvvHiuG2XbXib1rn/NnkFLGCeb14Uz/nzefDQOUxNxo15efqY7Ix3SPNLm32q/5VvUj69BXATX4wHmiiTTvu3PVnVIWhfkLOt/PTP9OVYTdOacg/lQMyrNISF+IQ2+hGL/yTCEbXm3zwaeVSfB1yWuglD9XDrKrKyNgSUeEeoNSHOWbtof5MHexHBvptMsyFD48jRtCG6Et0rlZ2i4AE3Yd+zHaC33Ty8XE0/OUDXeBjpqN5z8/AQSRojdFEaDtx312vnpYtqEuy1Oz+f/x4J08L9dKGVMNGO6nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(66476007)(6486002)(38100700002)(66556008)(66946007)(8676002)(5660300002)(4326008)(6916009)(316002)(83380400001)(4744005)(8936002)(44832011)(2906002)(36756003)(2616005)(1076003)(107886003)(186003)(508600001)(6506007)(52116002)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+PjGeoio40YNMLc8PwqJ5TdP6tAn6wE9cITnT6OlfjoYlZcl6Uy6Puq4Vn8i?=
 =?us-ascii?Q?2d2eUWwHl8s9rDSgx3fWKAdoh5w/C6tbPKPjcUzUV1obWYTdfFxAq6z40gCS?=
 =?us-ascii?Q?qgA9+3gGBDhwJ0hGiRiLxsT3G6/UNwyVhhE/l8s1brFKmbFa7Cdphw+BuKoR?=
 =?us-ascii?Q?rujF+7yXErOBez6cli30Oa72fSuLdAmIhUzfuNfgHaNc91YPLpyBgdC3L+RD?=
 =?us-ascii?Q?Cvu/XLK4ewffcKUjHsU3w8woTjJUx9B+6pGwJq0sqhZYiR/iW555GqzwUHNm?=
 =?us-ascii?Q?GNhRGrJq/LSXIpYJQcZcRvjBjWdL0syB26lgUnvjW2SJ9RLVLw25k3HxXtMd?=
 =?us-ascii?Q?UvlizV1RtX/Fh7o57vLa6HdcR8Xits68VcgZVWiE4dAbshkPyTm9BJWP3x79?=
 =?us-ascii?Q?KJ4WhwIgf7s1rdCwp8XcAUUHan0yiHeI2dhYLobKI2o6aHkMg4m59EROcevq?=
 =?us-ascii?Q?IQFMP4zqEQTh2j25YW55J0wj12SurfELDVkoH5s4PWqoIK0b4wmqHwQteT3s?=
 =?us-ascii?Q?uo19uVE8F+j2icSEg0SRyBBSr98qpGsQD36Lg4YLeoj8Ao6JzrEbfK4nKvgQ?=
 =?us-ascii?Q?b43NfnNwxTQRz77JK16+bWHA7kC1qHlFC4EMU7P/4wfu9DSVyBnuIgn+0x2W?=
 =?us-ascii?Q?NVOPQpv+83Yo7xaqTxMgkIoVP5RYIVNnvorTmr7ehTkiqYDnDVXiHy0sGJpq?=
 =?us-ascii?Q?2Fc80dXtyyjMs7wcHc4trihOAbwSuU0HvppjS7X+gVPgRoU0lcTjPZxVVzUJ?=
 =?us-ascii?Q?8ZCRp84UXVs6RhH3x48E4gkZyOEZQZVCaB/0+u6MYtnkBZJzFg3s7VQQur8X?=
 =?us-ascii?Q?9ZLlSojR/TVi6TS9NkI0iNQ/o9jq71jaPlfdkd6i83QnUEibTvGeh0CtAlgn?=
 =?us-ascii?Q?yh6wsVrRhRTgU1Ke224W+BQgRBvdQSC4CaDZzez9C1HYzfnoszuChZkjUQr+?=
 =?us-ascii?Q?3M5QVU6pustHuVKdeA8msUgEwqRCFkeDaZG4Gm4BZxPCyw3FkSou3DuSTi2+?=
 =?us-ascii?Q?oQiETcG923dh3bkdQta1ePf82wU3ODK9BR6LzYoxqrQz7Ri80GFH27plWhs+?=
 =?us-ascii?Q?pSIzs4jhi4AimXllogxnZdj6Xo3ViTPTfjbA77HJ7D6yh/sz4XMwbHVi2xIx?=
 =?us-ascii?Q?74G5vVmL4HUtQXc8Fn/PvKtjOO7oqBQN9w51qK24JMbH7FKWRGwcIi5n727F?=
 =?us-ascii?Q?m7PQQqf8+4tjHcmRKhT8NKWaw1SQsi+0FpjVGV/S41wzk4z59QIDdZc8fNdJ?=
 =?us-ascii?Q?j6yb3fZ4tYzb4Q+rTQk5RJHAwIhPpSjtJW8Wcs4meIvS3PoBtDzRxJWza5I2?=
 =?us-ascii?Q?3rWOmgIsrEGmEHvKAR8enxEXRSJ6RKg0/J1FEA+9v3uy2YUVD+2xDuPt7VAG?=
 =?us-ascii?Q?13LRDDJluUeLWYXtjKJm4XoYNfv7W3qOsPrjC9ruHiO7KPT+yf74QU0pMsM4?=
 =?us-ascii?Q?xRKBBIaSK+CzVdebJRFe/DXfyEtHvyISLrcP0/d9/D0wt8TNJI2+MmaYnxBy?=
 =?us-ascii?Q?e3nBWNP+wtmEfWrsSQk40AGlq2Qp0EyA9CaUH+z9bcSRDQ9IjveEJ5NOxqFw?=
 =?us-ascii?Q?CUBbk1ohk3fsDieyqo2oQg+hsWjHgmktgWYxX9sJj4NY62V7nsJ8KZSLwv9M?=
 =?us-ascii?Q?OvFwidIMTXg9bgciMiYGdBZpldF54VqleXZlSmwSOZK2p7NvQhlXn0kmYzvt?=
 =?us-ascii?Q?6cU3cNPzn6sWm6CeMzu3/Hb2l0O8SSt8mkxvr1RrJch2Fo+y?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b86fc17-c490-4c49-8e77-08d9f55a2f74
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 16:49:54.4946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1W0HGBacMfZqyAmF/klaWPX4QfNm8AiHrceRYQW+PGyk1y+tIypz52nDAmljPSk+epjo5xINDWn/170TZ9wyC8ZJSLP3k1mevv8YLNflwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3562
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10265
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=859 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210099
X-Proofpoint-GUID: ZYPN5bc2zb5wEQDpzw6U2-vCZqejfcCx
X-Proofpoint-ORIG-GUID: ZYPN5bc2zb5wEQDpzw6U2-vCZqejfcCx
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: David Edmondson <david.edmondson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In attempting to use the Python GDB plugins a couple of problems were
encountered.

David Edmondson (2):
  scripts/qemu-gdb/mtree.py: Int128 are decimal rather than hex
  scripts/qemu-gdb/timers.py: the 'last' attribute is no more

 scripts/qemugdb/mtree.py  | 2 +-
 scripts/qemugdb/timers.py | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.34.1



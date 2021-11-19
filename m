Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C914577FF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 22:05:45 +0100 (CET)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moB4q-00031u-Cs
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 16:05:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1moB2D-00027Q-JL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 16:03:01 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1moB2B-0002L0-Be
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 16:03:01 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJIUQd1022536; 
 Fri, 19 Nov 2021 19:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=6lOFImxQMS67IV9xsuV7MMY9miJEgVudX/pV+xVcZNw=;
 b=b4pJAZ14B5/bZ6+4RQUU4ty3+TZE9VeAPoUznT0qlvMgSVtlPTWXBLY+1e9GDFPwYDV+
 W+4e3YE+kKLYD3mxwyYVRKGfzd6cssHpGiV52k7RjcQkkWc9sBQX0XBkvXvDZbi26JAC
 2QT7wcKPsALTNlJEOgpuzMfm2NJ02Z8U8ef4SwLBGB0mnGXIOIRmpi2A/D82/KL1GeF4
 xsfKOoKBb9DmbE1jGF0WCKKGbBl3PmoYEc2YS+/Rgzf3ZDZYI+O+r8Z+AfGevUluX29p
 w9ktewL8FXXtjnllLmslvgbImYkMNzjgLCfsDQHU/3XUbwxpxw4Zuug+knxuXeoBm+rV Vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cegb40v1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 19:52:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AJJlDMb112819;
 Fri, 19 Nov 2021 19:52:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3020.oracle.com with ESMTP id 3caq4ycm7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 19:52:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q32od+T2GTl4z+Npdm115mHFAzmTtancxx3uh76uwU+euRf/90oufLcx9kdrr2WsBdIWOYwoDKtmKprGCOY/VZ3kbh6EmzRWlQKKMQynSi1Hp5P7sMtwj51bd8AM2UTLlj1xqbqauB9wFSTTA9jmWIr4XRm2j2FjvN9PfMaPKIiN+y6bMwHm/4pI544uVDVRLL0OmVxboj3/T0BpdYtt24KQP7qm1AhivPPbUBxwiVaCIaBeV5WWlKOVMxVLULZg57khJ2hukq7Tu9DXWxZ+tlgB9PDAnJCumh2O9NLO6MHGHRZ4S0qaZUk5enZJSrURvUKLaXgUoz1FQ3oPS5wGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lOFImxQMS67IV9xsuV7MMY9miJEgVudX/pV+xVcZNw=;
 b=MDnrSOcg1T5dnhS8lD31ZFyR1WJmPq/J/eKys+Cw/ldepoTcXMTGJ7R98WSqZPUO4CqeDRizoKh/8B5YmvjnvkEHKd9RfvG0WMskFEFEyn40L+hvB0xNa9+Qo97795NRdVEteMUhnXiiOQ/zAa9HM3CId8axU/UxuHlnoFGiBqmBN4VA/z/PI+jj5+oc72+kypM+OjEQUejXrXf+YLIyx+8geUz94FKjUVLabA0yN7BsT7x+xeaMWNDpkMASl1Oi8/Ie27NKG8j16iFXjGw8OMfhYrcvwLRO95aXAbldDIzd1p+Bwcg7aKsmLt/LSivqG8FBL+7AewLamGqf9GY0HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lOFImxQMS67IV9xsuV7MMY9miJEgVudX/pV+xVcZNw=;
 b=NvbZMIKiLcsXSJ0ccQ0i7hU1kH82e4xBZ1t8Z/R9tTcxjJEh6Kbb7QSp7EyUavkjW+b3XsKeDwyehJjqPNWJtsEVXuBoVBSHujyQMQEpeZjw0LwsuwzGJL8r27m7ei5o8jqOVVe3IsM27KjwtmNpEtHI+mfkWzlhF5SL2xKuiD4=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by SA2PR10MB4603.namprd10.prod.outlook.com (2603:10b6:806:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Fri, 19 Nov
 2021 19:52:00 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::8156:fe6f:d62c:5dd6]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::8156:fe6f:d62c:5dd6%7]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 19:52:00 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Support fd-based KVM stats
Date: Fri, 19 Nov 2021 13:51:50 -0600
Message-Id: <20211119195153.11815-1-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
Received: from linux-1.us.oracle.com (137.254.7.175) by
 SJ0PR03CA0212.namprd03.prod.outlook.com (2603:10b6:a03:39f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Fri, 19 Nov 2021 19:51:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c2b77a-7a0a-4bd2-7819-08d9ab960d01
X-MS-TrafficTypeDiagnostic: SA2PR10MB4603:
X-Microsoft-Antispam-PRVS: <SA2PR10MB4603858F4479FB7F43A0176EF99C9@SA2PR10MB4603.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XP7TuiMjeBhMlbv81yKuP3kzk0tvIQLJFDt0RJxUuEMFUeFNmXxX7rKFZxi36kuDkMliIYUn3AZvRQG9g42TOwGBtasuGm0QVCkdzmSC62qBx2TXn3yj3ISLu5lFadsuJfLX25TRQqZ6F1HtKs0LdFPtF5Dwj9IuRZSKvD3boPuMwVzOTWK+ukwUZE60RFBjEEOyemfcWhqv9FVFenZfqhSNy1NMXrtNZ/v+DWQM9GqrxHnG2dqoLiVT/BifEualWRjiLaHiBnYvLPg4roeyKH+KB5sXljylRlIc6QmwezEob34Ps3dCloc+FnmlKS7KZjvQFhjVb3DTe0yqKx1IAoZXkPU4cOOheMgjmp81gvNP5tC3nDvBaYLRK0uhENIjoxjUGBGfyuVaShwN70O63S97aC7ZrHthYHp4WTDPu5Ohl6OT/GPhZA92ZxdCYYgeYnb1OCtjNdfsqrsqv2XGONYcwxq+zoRb24VMQ24XMUWkbrDeuzzQSbG3f5a0APNLczqPE26WZGqIFHGRLHqszp01z/GJEYW32mxxjJUthrQIloLVFGmsh2Wz/+PANm2GebajW4jmysOfZ8ML7nhGVI94ZOHuhsvtvSC9Q6CXBKJeFDqi1eFuRXiXYsAiJksObjhBDQgDcAM0C5mxD3WX/GFkGowqYC6y9OMLjylkVysYCrNlx0Z6mI32tlKt3uUpw+ZjAhrmHhbEYLTugswHVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(8936002)(4744005)(2906002)(508600001)(86362001)(38100700002)(36756003)(316002)(5660300002)(4326008)(1076003)(6666004)(38350700002)(8676002)(26005)(66476007)(7696005)(52116002)(6916009)(44832011)(6486002)(186003)(66946007)(66556008)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+uFH7aIviqhfCKcaO9S5wwg3A2rNIyi86ooHktbxZxc89PD64M3MEwHXrDq?=
 =?us-ascii?Q?O6i2wvi/fpDxpvWnbYA4e8ZvUdXxiPDY8scSyO0pfCio+XbVfBvq1g1b7xs8?=
 =?us-ascii?Q?bBr+ttwyOJbN+PwLS7sjd9KdxpYEityk9Au2d2Q9vZgP6HiNqz6ryfj1TcwM?=
 =?us-ascii?Q?6T//+PXUvfP7s0oI0cGYG4KaK1RSmwNXum6R5EAalt9gH8lPalx+NyYlSw7c?=
 =?us-ascii?Q?r4znk42frfSgGvHu7C6UMuynP2F+revMoT7C5xUkyFGQ03EJbWigG9Iikvyt?=
 =?us-ascii?Q?6gbJIKJuWlXO+N/PnXX+0NKb/ZZgBgBrheDlkGQyMjq6I3RytU88+3vbY/7r?=
 =?us-ascii?Q?n8YOox2+YbcNFCj8axI1VKzVa+v0AwPfGA8F7rHU3wXA0JzFqxB4xVNhJFH8?=
 =?us-ascii?Q?uV+qIBTd06eqINYklFSAkCMb4CmP81bTWl6tpIVmJEJQH9ueL1+enj3PqfVC?=
 =?us-ascii?Q?xUx5FhWG+ipZ/QDFS7nAMSS/EAQH6NPXy+b4G8VQV+hHC4fRUitnJH8tnwtK?=
 =?us-ascii?Q?MxquJIaTg36ZKGkXFw0sF3hdu6LAyYkWKjKVcxEfVHQHAqCDK0FvEq6rbyqx?=
 =?us-ascii?Q?1mBLZlw5BK6llyEJijZD9orccO1H5pkdZdiehe6hcz+EbWFzOqkDMAcn2Iwj?=
 =?us-ascii?Q?gUnfCNppjVjSXc3jyao1RaO5JA5ckZjSIDWwTngJReiDt0kdh+Zhks9WH1hk?=
 =?us-ascii?Q?+aOH4YX6lAZaN0/cBSsMoDbWrgTURA8SpwmqJdU3fKmfSLwZiCpA9+Wh5va3?=
 =?us-ascii?Q?gZnumxGMj+ZREg466EDV577Dt8a2xdRgTuoeMhTO9ZZL/8PoCo1gfhpKzp2r?=
 =?us-ascii?Q?fsTpvek0XDzFKbUfVNz8X6taTWPn2X6EjKnoeproWhY/ovV5zENR8wJ14V2a?=
 =?us-ascii?Q?ePM0D1P30ayIijsqter0UX//+stM/xfEDYycPulPmpo8Zys1BQoEqYn3St/m?=
 =?us-ascii?Q?mUmnZvCOwMAVdtF+CxVk5Iq203VmtONSFtfy8UGxBgQbkLXxmN6LN9npIEeg?=
 =?us-ascii?Q?0EXfjefuywW6Rk7pp1v+fYp5ylyu6bPXJQ9uYcc1WgA6xAN7w75WcYCXmVln?=
 =?us-ascii?Q?txiNfaNeM0ym8gRc3hooQbbxLb7DIEuVYUGIERJfkmBYnwB9gC4/iFTEl3xd?=
 =?us-ascii?Q?esisNzeziakJEtLr2R9HqbZ2t5BovEAuU9g9z9lKg4pK++4IANiJ0TwEs7dI?=
 =?us-ascii?Q?qgxLPM0It2QrSkxJF/w1/K/nrQO9gFcjKofeC2+XNwRvxW7wpYJC8SnFebIb?=
 =?us-ascii?Q?CarH+1Lm02zVdAgbq+zhKt4Kh2bmqN0O3ckBIyjClxhlnrz5dlJbaw6b4Td7?=
 =?us-ascii?Q?AZgQQY1vTmVlCzh7sgcGrUCk7WJ5MdPPxqwbq44zmIqzkz8xpEBmPbwzKrE0?=
 =?us-ascii?Q?mAPa92a3NR7GmaaUoSkkgT18KNAw+M0GTgvR6HLw+7WyYwT0mxTWPg0n4WyW?=
 =?us-ascii?Q?qvibv9q8te3LK8rpMtIr7AWt0e9ThRPPZn/2gF1WT7vk7jcGZ1DsfBI8UK5S?=
 =?us-ascii?Q?NdPIai92Bxx1vJ7LYz3ih45JPH5Wu5uyNbl6EvOetYzU050nNPzKMmoLUc5m?=
 =?us-ascii?Q?g+xeClFZ3DMSdxpWQxPIHBsz53KpTJNTZ7q4vT9H5CV3uoY7WecCAnQpx7Hz?=
 =?us-ascii?Q?sEiJfdHNSx4rHUpvt6PLyos=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c2b77a-7a0a-4bd2-7819-08d9ab960d01
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:52:00.6327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYjBQTH7Lk9boyo811PI2o/Mnr36OKVP0qAvNf/T+xkcA2J8ugNmZB0RbrrkcF5XYkXvU3BH2QcWiFu2GrzmRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4603
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10173
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=960 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190106
X-Proofpoint-GUID: RXzbc1dO5YbGckKqAXwOMf95aDee_tcD
X-Proofpoint-ORIG-GUID: RXzbc1dO5YbGckKqAXwOMf95aDee_tcD
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2: [Paolo]
- generalize the interface
- add support for querying stat schema and instances
- add additional HMP semantic processing for a few exponent/unit
  combinations (related to seconds and bytes)

This patchset adds QEMU support for querying fd-based KVM stats. The
kernel support was introduced by:

cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")

Mark Kanda (3):
  qmp: Support for querying stats
  hmp: Support for querying stats
  kvm: Support for querying fd-based stats

 accel/kvm/kvm-all.c       | 399 ++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx      |  40 ++++
 include/monitor/hmp.h     |   3 +
 include/monitor/monitor.h |  27 +++
 monitor/hmp-cmds.c        | 125 ++++++++++++
 monitor/qmp-cmds.c        |  71 +++++++
 qapi/misc.json            | 142 ++++++++++++++
 7 files changed, 807 insertions(+)

-- 
2.26.2



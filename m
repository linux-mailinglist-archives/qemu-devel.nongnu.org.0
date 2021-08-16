Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312213EDB2C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:45:04 +0200 (CEST)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfjT-0003SQ-7X
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhc-0000hi-2q
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:08 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhX-0007uS-U0
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:07 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGadPF011149; Mon, 16 Aug 2021 16:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=KFAY0nXUt5tQAT23dE7AoArY4S24QtBZcWbg0kvkP9o=;
 b=YJhIs3Ah2f3cdr31UyfdlAwrmmeuQ2Eh9sOEuOLQnZGVytI+3sci5sRhdNqnYLJe0saK
 4st9cFNZkbVy582bYlA7fPffHmOV7Xw0byv0GB34toF3KqgjbJsuruKxxjZea7OP3PHZ
 ksfJ87W4np9ur3+rVjb/OCX++0hj1s2lKyTqPrmwQzhIIUr1TKaJzI468rshpfhJ9H5B
 w78xsY9va0CqdY5Ul4AfAIsq21GmBIGzD8CvNa536QVqWxA1B+S8QF98bOAgU/imsdzB
 U+5uKKMlAf6edzIFHzgpViJ/D3XFe2aw8bk51IhL8FnOfuLKaohPCXMReGfwbQBfq6gE 0w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=KFAY0nXUt5tQAT23dE7AoArY4S24QtBZcWbg0kvkP9o=;
 b=oTnYs/CYSwi/0xVqopCD/ivQ+NZYuJpinQOKGU68VYDX/rzHzzYCyv/HCsSSXb2CNpfv
 z4YTEsDbmFJohoI43GNAdlMrTREjPDM2hZraV7cd/FblQpUDkpXaZ0DWApSvU2nMpP5i
 CNcgC2/I79qMg9a/XrbjDG0shEXCy5kOoRZS4SiV8X8KiYzyUqw8OE2rjuGz2IxTUSiL
 BkqNmD8OfU9PSOt9xpBvT2J+uLrByvqWJ+lKYWy2+UNr5NrEnSvt2NbaNfogcC5epCrm
 PXUlv9bmLRbJOHD9wzqj7MdwbokhrVD4d4lu4gak3/k1yWAn9OWrgzOkDiN9MAUs7YvK Cw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af83029gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:42:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeuOK025726;
 Mon, 16 Aug 2021 16:42:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by userp3030.oracle.com with ESMTP id 3ae2xxgrw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxf9X4hC0/1RlNCrlI3ZsUktqUXEjGH1QUjcT2lQpjYisfyvzSsz94B4ivxehlPNQM2AqQPLIylDny3LQVF2uuXdQC9fmdJkaTC+hK44XDIhf941VJd8FduZc1RfiFrox0z/dGpMHmJZ+D8tRjRq8hm5XrbCaOVvxDKgfUbMYivN2OJDrZiMH6YZQTBMHeqMjcSYzNVlAukU8taTTyOZ4f2mTk4FsoZICCxZzcbATsUdHx8KtPWSYOGLkzfsXhf7QRTiC3fzKka8XxGhPyUBJLqdCgmcLaVf4BBYqyuxqnCH62tV3FKS75XniKr496dmuNa4f614s4FinIIWgHUp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFAY0nXUt5tQAT23dE7AoArY4S24QtBZcWbg0kvkP9o=;
 b=hot1mrrGDrPzDb9zpi3A0sZIJSD+NF/ofgv/OwiyQs+INP+plaRgefkakJ4c2Bt+c+roJpbBkILR8GOvfoCrGQUv2XqkwXA/i279Xl8CChT/d2+bc2bElJEa8a2dOV4u7QKZbXTgWac5QYjOXJOT5MAhG5Z6Yp2N/RMJI/Mr/KPektpB3qaymAQYBXn8bXOcEGRhYNWgQHcnYcEWJueUWj0oSz32tNAGCG8QAj3FNwZQ5Pcj2rv25kQjfTJb3ANJcqhLQN/DTf4y1+Lk8nYvq9Rjb7LIySWI4P0A660lLWDElU1SnIxp8TNk1REBaBayJKItmPF/On+1ru0+KTmudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFAY0nXUt5tQAT23dE7AoArY4S24QtBZcWbg0kvkP9o=;
 b=bH4x3N8/AmIxIS4zg15A+wwgGI6QuATi00Co0L1GidnSg2ug29Qydf1CAxUE5PbIw03kyBd5sCYDM2d+PgHCqazWaCTBYonDDWmfgMdZqyRp74Og29toQATPghJ4bdbH4Wt3zTi92Ofgz1aGJftISQiok3wmEO5zpXu7apw+Lxs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by BYAPR10MB2565.namprd10.prod.outlook.com (2603:10b6:a02:b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 16:42:55 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:42:55 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 00/16] vfio-user implementation
Date: Mon, 16 Aug 2021 09:42:33 -0700
Message-Id: <cover.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:42:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce8d568d-5639-4f92-9a3f-08d960d4e586
X-MS-TrafficTypeDiagnostic: BYAPR10MB2565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2565376A5E22E5695CDA9E088CFD9@BYAPR10MB2565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vB5Ao9x1QSbV5Fwh+O19cHcZbfG15p1RRWquYHqV41T7270qMycUa1WhpQo31iJgrAt1BnM93OrP8BMJQhd6bzuwrPTAz+q5FfA3/eZ0Ry0xsMPtbRuvWX7WeZYzCfCIITrK6sCLCzCfXYE0u9sgYjY80bz2Frc1LjgD2i957GKFdBtUUNS5rU2hgG/wNsI2MWyERT1lY2gBGEWoTyPjjhNMZMqQRsTpg1nm+T0t5vBA4Se13Y8vZf46vXfwbEIpvWdNX1VGnsN2tPRo5Ad1YNGWVsGJ0ukBNYdgqrfSM3QI1etb+oDEJpnABc4+DWIumaxlvQe7hbZwNzAFoxdi7WcDxxT5iRLcPrOd2ok+m3BNlmfy4wdzWD5MxTsZqj6kL0dDGHNCDfHZEoLytz8jXpr6/RSgKKiQpHm2MV5w5zLSIP4HjJ77fu+BppWSL2c+bQ23GfpqzHse8Xfnz3+Fwa9lBhr2M+4pR3BCoSztlUaCyvwioKT1LR8nt/YxLi50u1b/Pgp15l4CnF1raQ+yoi+kZyn+fangIh2b30JJSMzyL0m+xeyVO3rXwdwXfwZS13lHsBqT+/yrlLMzMUFTzXmAkDUZ0hI6DQlohxUY3qCswhAbX1NJntRYoF0zkn82srUowoVhg0M7AinJXRgRHwzI/QVTOO8eL/4c+U9UtDMvceQWXioMl5JzjQkndg5wS1TvxLtRnZ7Uxs8XEC2ojqtHdCmWjk8PKM07/7TGk0U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(316002)(38100700002)(44832011)(2616005)(6512007)(2906002)(6916009)(52116002)(5660300002)(508600001)(6506007)(66946007)(4326008)(66476007)(66556008)(6666004)(186003)(86362001)(8676002)(8936002)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iuzW3NYfS/afDbIUjGMXK2IrBWjmJjwLQ6dNYpTrcdLq4ncMKFAJ9EoXbzJc?=
 =?us-ascii?Q?JBuXx8SGrLqnz23zoaz/dil/Dr0xALSKURYCv7ZUdHt2WfDQUURt0HwJlYcG?=
 =?us-ascii?Q?kgYTBUiLycwC7SGNkLtzPqTTntOEOxlF4VyHQSCj2sOE8fs9jUCoUnQGU5X9?=
 =?us-ascii?Q?aa7FEJQBG/2KUn0GVV/pzqsjMuhoZd1ZcODhIRtQzqDHDKg5mFU40s/GWCmS?=
 =?us-ascii?Q?7AcGdCITj1s1dgQcCRvAqGN2UbfTh7JZZpE2wRnn5xhMqsnn7bO1hhVxYPp9?=
 =?us-ascii?Q?IjgKajUmLK1LmZpvRg3rGyeS0Ui6F51MyRBpElwiJaphh9edzTG6ZolCVGjs?=
 =?us-ascii?Q?T+Mj+pZOnMuVnxV9Y9fItEVnNBINb5hC+A/psHIZnc+AHv1zvqWBJ28oijOv?=
 =?us-ascii?Q?S5oiVxjI7S+iRe33Op4hEdVxHZPDqYmyFWIvfAAYkdHetfOS0Gg7B3kUBQDa?=
 =?us-ascii?Q?SLifffmBNx0WGA7aRUBcjOO91MlS7C/UGNn+1XDzhe2WqOBjDEiZSg1NH7wv?=
 =?us-ascii?Q?N7TrCenyWvimpIv/cH2FxgPTjCLxHoMArZ10XvVWPVpS7tpKmyOtZjOcLNo3?=
 =?us-ascii?Q?zi0H6GaPAyELRmb+7fRcs74bCJZpzf3QIgNl0uXftgbgO8/LMUdCfm7OdpnM?=
 =?us-ascii?Q?WZsOWtvAxK2NAvIR+7P71yHc4fY3T2Gk4y8SSgZvloKrFs98cISW8Oa/FYWW?=
 =?us-ascii?Q?BHXi4EhYGHoaYsiZXkXBfoprP48392bs4Qehp0JueFCFzCh6lBZeLCEnHOZ6?=
 =?us-ascii?Q?XdUnha1X7izT+L+Yj+ZLqBckTDBttZPCgNLDlSsjpvoeN+YHf1KbrbG5M6dC?=
 =?us-ascii?Q?s5Fq4u/BNjxBmBr3pJHQbDyah0KURg2aRtkCwN6zYXsv/o3ivgMWHIOFIyqo?=
 =?us-ascii?Q?qvY0yPJHceiY4NTRw2fyxMNIzeguK0jTBK8CGtPrFkzhfqblcNHFHpephcKF?=
 =?us-ascii?Q?v7N4GXb0RuZzc+rew/tqa3Yh7wqi1VEoShHKQArV/bu/0P5l957Q8C+OZ/PI?=
 =?us-ascii?Q?Lt0/3TakurwoyS2vO0diT/zFu1+DVjLOiXE3Dvcae4Nu/e9dU20HNHUpNut2?=
 =?us-ascii?Q?wQfwy/CPR+wI8KEi+M8JunUquNj/82Nmm83j6vLJMpCHRxiwMgNfvSDaOZtn?=
 =?us-ascii?Q?3X5Ja/GOK+rvS0gO1RDT5uX1QyGXc0vnMulhpOYYuULR8ILpixZkNZv1AN4U?=
 =?us-ascii?Q?YqTdird4cIzqUjvXJPRCPMpWNy/bH/M/QKJ1rE1II+ujjCQnZACdFCx79HWM?=
 =?us-ascii?Q?+M8AuBAMcGylSCCft42TrvigrqA+msZjLov/jq/rJxxFn64gEJDfZzZ7y15u?=
 =?us-ascii?Q?32Gv8pFuaPmrwxWZi63EQX2ijplQkzWA5wh50+6qErPxOZPEHPnfssN++pLQ?=
 =?us-ascii?Q?eew/U6iiPksV9bWr2tYkRlOnS7El?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8d568d-5639-4f92-9a3f-08d960d4e586
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:42:55.1301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jS9+cKQQNwJerNKxzLmxcc3dpx367Ma6Lt1tDAy3gZMRgBShJeZJlMx0QFiMQK49XvlooluZ54QoslBVBtBV1Yao/3Mtu4rlMQnfE+ugW3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2565
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-ORIG-GUID: AQXvFyLOY1AlBWRn-gnkOO5dZnohIW9I
X-Proofpoint-GUID: AQXvFyLOY1AlBWRn-gnkOO5dZnohIW9I
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

This is v2 of the RFC patches for vfio-user multi-process QEMU project[1].

Thank you for the review of v1 of the RFC patches.

vfio-user is a protocol that allows a device to be emulated in a separate
process outside of QEMU. It encapsulates the messages sent from QEMU to the
kernel VFIO driver, and sends them to a remote process over a UNIX socket.

The vfio-user framework consists of 3 parts:
 1) The protocol specification.
 2) A server - the VFIO generic device in QEMU that exchanges the protocol messages with the client.
 3) A client - remote process that emulates a device.

This patchset implements parts 1 and 2.
The protocol's specification can be found here [2]:
We also include this as the first patch of the series.

The libvfio-user project (https://github.com/nutanix/libvfio-user)
can be used by a remote process to handle the protocol to implement the
third part.
We also worked on implementing a client and will be sending this patch
series shortly.

Contributors:

John G Johnson <john.g.johnson@oracle.com>
John Levon <john.levon@nutanix.com>
Thanos Makatos <thanos.makatos@nutanix.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
Jagannathan Raman <jag.raman@oracle.com>

 Changes in v2:
 - combine some patches with relevant functionality.
 - use SocketAddress with idea to modify later the command line options.
 - define protocol bits in user-protocol.h.
 - use QEMU_LOCK_GUARD where appropriate.
 - fix the locking when event signaling.
 - do not drop BQL on dma map/unmap.
 - added checks for message sizes in communication functions.

John Johnson (15):
  vfio-user: add VFIO base abstract class
  vfio-user: Define type vfio_user_pci_dev_info
  vfio-user: connect vfio proxy to remote server
  vfio-user: define VFIO Proxy and communication functions
  vfio-user: negotiate version with remote server
  vfio-user: get device info
  vfio-user: get region info
  vfio-user: region read/write
  vfio-user: pci_user_realize PCI setup
  vfio-user: get and set IRQs
  vfio-user: proxy container connect/disconnect
  vfio-user: dma map/unmap operations
  vfio-user: dma read/write operations
  vfio-user: pci reset
  vfio-user: migration support

Thanos Makatos (1):
  vfio-user: introduce vfio-user protocol specification

 docs/devel/index.rst          |    1 +
 docs/devel/vfio-user.rst      | 1809 +++++++++++++++++++++++++++++++++
 hw/vfio/pci.h                 |   25 +-
 hw/vfio/user-protocol.h       |  210 ++++
 hw/vfio/user.h                |   95 ++
 include/hw/vfio/vfio-common.h |    9 +
 hw/vfio/common.c              |  296 +++++-
 hw/vfio/migration.c           |   34 +-
 hw/vfio/pci.c                 |  571 +++++++++--
 hw/vfio/user.c                | 1104 ++++++++++++++++++++
 MAINTAINERS                   |   11 +
 hw/vfio/meson.build           |    1 +
 12 files changed, 4062 insertions(+), 104 deletions(-)
 create mode 100644 docs/devel/vfio-user.rst
 create mode 100644 hw/vfio/user-protocol.h
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user.c

-- 
2.25.1



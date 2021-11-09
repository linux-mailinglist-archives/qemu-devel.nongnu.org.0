Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F2449FF3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:49:18 +0100 (CET)
Received: from localhost ([::1]:51302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFK9-0003VI-1M
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAf-0005gi-Tb
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAW-00045p-W5
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:29 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8Nxhw2005907
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=cKm+0TvPXu7mNRbAl42MjI3Vx0KaTYoYVaf4aRnslYs=;
 b=tCjFWa7rbEPT2APcvi96JM9wVTosWWDqM7TnJamyFzqkWiTMud49naOCNiXGahSZtAI5
 //9CEK/fJ2eobwzvTaUjvLoItvM3Tso3Xztd6YOVWnSrrMfahfBjIrJ/50Ax2UEnMEKh
 iHIs7XqIZL0Hdy3rUeQ6TosHAbMiCT5oulaRMACIZl7OXq4XjFqUI6A4093TvK66gjRr
 r8OKnMfexGm4yw1WEI4LD5996pmFqsvAta+M+wIz+59Zs8indsZKVkQ6Ds3JvedIVIsQ
 wIClPymiuqVxzdFcbMWntiPw5EtKEni8vN8LtU4qY/6obux31mRB2WGU9xISxmiJx8ue 4Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6vkr01ue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLMw129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY8OjtwCGwR7raOqBzg0S2Aw0EMNa3Q8KB1vhtChqzmTZqm0ORppVeUjZkK9gn0hS3SvFBRPBIVbWSEP+h8AaNrKU5g1F7JdTNOkNidF3HWepAy46iHZpxkC4VvCP4X7Dmnf+zg030fkLlo3+w11epGVDiCARKC//lTKH1YBOnBSXCQ+awoB7meqUyj3sqgaW3umEDMF52R94vpDoh9UNsIfABrDHT9H3v1yhqodyge3tCJ4IIKs8a9Tg9xk7ebWqVGYRL/+n98RDd4aXGfA24/vIJnyMzMwEVFYWSEdWahZD0nhjWJDg7g4yEAnreqlN6jX4WQ8T93VnvotGzysYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKm+0TvPXu7mNRbAl42MjI3Vx0KaTYoYVaf4aRnslYs=;
 b=DA/2/msk2KGAiV0UXpO2sT1yUvz8DBFC6ZJY0UGx8y6CXCep8rMoUb5Emm6IEieaaVyok/9AwrvE1BwyhTkXKupavAygs7dkvh72U3QIXTL0xMefLbD1+s8qhOQjXDfiNjK1KQQoACc/QfvvlDZsWAzExewKzCB4VQzkThkH25JXarTn1OKJprbrkQf/urEIXmzB74hsiUfAmikNMNDnVZ4kr7BoFiPKgqEaluyI0+Q7gKfEEGcyXC1st/jU5zsoowtR9vpH+Y9Ipr5o+FpmW/HukaJ5K0Fy2el7dEUpO/mFvN3lRv7hAi0GKs+oYTyD4J2Ynmmpj7fyBupf/DVhpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKm+0TvPXu7mNRbAl42MjI3Vx0KaTYoYVaf4aRnslYs=;
 b=Te/44I00YPUJOE5i9VupgdHKerpFm/61CExuOdgU6q6bN6fg0obAGtbkLkOOmSlDDJ8URQKYTrGdQVigRY8Scu1rED0uV0JUq8vVAVVOe/WFUMOQiNxC385YmdB0ezbhngMMOtgrz9RtHGnT0FpNkwjLSgcZS1DV0ObWq4oMJnQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:10 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:10 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 00/19] vfio-user client
Date: Mon,  8 Nov 2021 16:46:28 -0800
Message-Id: <cover.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14ac20f3-06ab-4522-8fc0-08d9a319585f
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB4068BAE6F2EDB7FF22579B90B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lc5x08Ry06FZ4ChWK7ULWr+fWzJ+lq0flWBY9h2sU0ZST8YpmN1c9VJtS+tyQgLgd7dUyMBK9EFuarVxhBL8mz8DX13wxYQlWF2XQHhqVEd6WXwMlQQyLPcXhr0kZ3J2q3DP/yhJMdDV0YgygmfnwvY38b6kHMJu34l2/ha82eqwBNoNNDhcaE2fmUMW+GlnN5PVJhqg0iYPchmWxO9/DzCPB6lHO/Mb1ZTiRXDIxOBKs9GqHvifyp5KmuAjlZ7sJ+QLd+d23hYLMd7guByN2A28K2UM752LdWBj8cTqZzIVWb+8zDhdkhCP/SCYcbOd1S2oUz/svMrd/c2V7XmQyd7oPSeOxxM09qCLIej4VHlRa0vinRw3DocX59XlNUpdx8/Uv9XeDQ7fSLwbM+6RMyPNqcK3M+Udd0WR3uzMsbUSqhMGnNjW7gD+5Zgfsg7qjvTnCCC63Uxs/gMwGesMQh0PGvaULyaPO9IDCWAazK/FNDgHE272Uc287i2eTHgLJXSB8BPZO5b95bCYtiMC8T7y+p+rTO+EPwbXx1UqMOrhZ0wX3BeBKTld9/zIxH1/L0vPTQaV9eaOoK+7LZh5CxPAZZQU2hycf/EEBVKRSQ5x0ei5iNXXuXDkv8jS6U0z5SD8S4yWIPDRpKANfVlIHSHehaW+F7zJYccQCjo+Tl/VG2GjfIO/ytjHIP54dfNz7Enjzy5Mgg9h6tCAFztfpEJye4o2ZD6Ya1OAEX2uu6r5dN2iq8g6tIntZczcxZcP+qsQMXf1tvvV+uogSiKP1FHYAGk8pxdDQglt6vdeNnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x6lPwGP/+v2BpdY1L8fezxoufJ4JI+k2KvSyW3fN7eDAgtxu1c5nxvSi797A?=
 =?us-ascii?Q?mR+Jr+P5Mrygn3BA+gjLfQaXeTc7ZMbTJDhH3IwFaFzklugY6RmXUnryqQ/c?=
 =?us-ascii?Q?GrW1cYbsUdc9Bppey5dssp30NwQVnNY693EiBb0NPl0eLkWxMxbO4eVyZwef?=
 =?us-ascii?Q?cGcU4L9WJ6gX1n95E1Gk/BzJjRMKq0vCOVipBgb2I/Rg5Wrf89cyDJfCf7PZ?=
 =?us-ascii?Q?McvG446vhZEgb+65LsuX0hrOLcUarvm31eju7Z+MjNcoKi/jcHWJ8bv8UXhH?=
 =?us-ascii?Q?3jcfQWkT402yzERmxKPcFhixIGk/JeObMMx2dkBptKELMkXGgBvM9Gd/AHor?=
 =?us-ascii?Q?RkA5Xe4PKl0bcLKyGwu53W026adEq2O6de0pUhZKiiumpLC3fHcsl4iJvyGr?=
 =?us-ascii?Q?gBGCEslTPSOFW6hrkOKto05pbOYmzlW7HyZvwnp8t0oeF1WWBER9flrrxxd5?=
 =?us-ascii?Q?ibH3Wdg0l0pIDDRvNAxQQckbCzAFbzhR3NzNH6CROk23HMDvWss/dLa+e8lx?=
 =?us-ascii?Q?rgLx4YizhDxkpOKODEY1OGBAAS/UiU+nVkuPGkL3ciSdouW43prgeDckyKxg?=
 =?us-ascii?Q?vPv4pgD9vpUWbarSbeZX/iDOeHJaM71PQrm1MSWEYLzbCZ+Xf7EfGjaA7Nib?=
 =?us-ascii?Q?6stzLkXGGY8jJ+IvKCu3y7fwKMe4/KMVSFMhKaoINvOrGSFjRNWlKfFmtNvm?=
 =?us-ascii?Q?6gZSnxSkclwXvHFRzTCyNa5a5dtVwX8x8zFnEvzJR5XzrXDEITP82u9sLpfJ?=
 =?us-ascii?Q?NZPqsNRAOucLz9B45IXxXfbleYpXhxoRgGZhwPL0LcgnnFQhqIoWzS9LNQ4X?=
 =?us-ascii?Q?5S2vtHvvByh7qwUkgDd9S9PAI4xw3z/NDRTeN46aQTYuffkq30XqrGVdmQI2?=
 =?us-ascii?Q?bkRM2LwLrxlzaO63UsgDPwpmL4DWUFjS+NgWoo/DJgsftiGB1mmwKTLeVNs6?=
 =?us-ascii?Q?ueFTTkra/BOtY8SdTrpjaLDvB0qv+iAeCuXmA5cVVF9Mzi70ybple2cPqoPl?=
 =?us-ascii?Q?YdS7dmJjf6Vtf68+L7MBJTzVWl1bjcU4VgiwRV2CVC3A9Yl7piNt+R5BYE1x?=
 =?us-ascii?Q?/sWmkqL307dNc606mmFZ9433zIYKqV7pzQPGC8/qD6T5TTCebqM38q+0oDfP?=
 =?us-ascii?Q?peG7EOHNlGyb/zVTvbI4AlSG1xuDgMLeS4I6pkUa3XYxkq5su6vjbhQkE1N6?=
 =?us-ascii?Q?mhcqXSYKI9rFOGxBuzD6tCX3MSHJwG/MCyhpMWN7p1NXUdXtgJSNwQRyXzJp?=
 =?us-ascii?Q?Gix3/vL6TqBeVAAK8QE+mmRB3NaK7LCRXNru5FtLr/NecNCuNdH15K8H+yW1?=
 =?us-ascii?Q?rOUL50ZmAX3Un4sbcXpGQdrqxDJoxfMstSZxAtEzUy7bIGOIolL2RmMOWW+1?=
 =?us-ascii?Q?MobRNF6cPtm42L39u790wjbAMnUgC5UGorMNJGhYrYhyzqrLTDaOAJfyn243?=
 =?us-ascii?Q?4jGE2RNDRYF+u92pDeWJeopmpcqNBbSj8fhk8b3b8CsVEhjbh1GtdUQcuMB4?=
 =?us-ascii?Q?D0GMw90wlhE6t3ZRrYFYzZwY+GUG/5MIwtUbqWcFTntvD1gk1PYT1Itg1rmQ?=
 =?us-ascii?Q?K1PDKnGjWqm5cOfNhvUqlN64D4UubIurzCe8L1rX6Cr/VYq6f/Ix8HTQVrOE?=
 =?us-ascii?Q?jrfhGgY/v+r17LriivzI53U7kmUYCPLQX6Q1Dw6Akjx7XaKh2ooxLc/dfLX6?=
 =?us-ascii?Q?QtYzGQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ac20f3-06ab-4522-8fc0-08d9a319585f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:10.2799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVNyScUdylcgJYkASJgu698T2qD7NEMQolWSQqDoCN/kWfSDpKQ/ZXadHABFSYhvD5y/0UyraPNEVdK2EPqQNpg+WsJxgsoSKohfzSu0Rhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: nn2x-VW-tOu--hEA2DyZnfhCxTY0SQp5
X-Proofpoint-ORIG-GUID: nn2x-VW-tOu--hEA2DyZnfhCxTY0SQp5
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is the 3rd revision of the vfio-user client implementation.

First of all, thank you for your time reviewing the previous versions.

The vfio-user framework consists of 3 parts:
 1) The VFIO user protocol specification.
 2) A client - the VFIO device in QEMU that encapsulates VFIO messages
    and sends them to the server.
 3) A server - a remote process that emulates a device.

This patchset implements parts 1 and 2.

The libvfio-user project (https://github.com/nutanix/libvfio-user)
can be used by a remote process to handle the protocol to implement the
third part.
We also worked on implementing a server with QEMU that is a separate
patch series.


Contributors:

John G Johnson <john.g.johnson@oracle.com>
John Levon <john.levon@nutanix.com>
Thanos Makatos <thanos.makatos@nutanix.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
Jagannathan Raman <jag.raman@oracle.com>


Changes from v2->v3:


John Johnson (18):
  vfio-user: add VFIO base abstract class
    Moved common vfio pci cli options to base class

  Add container IO ops vector
    Added ops vectors to decide to use ioctl() or socket implementation

  Add device IO ops vector
    Added ops vectors to decide to use ioctl() or socket implementation

  Add validation ops vector
    Added validation vector to check user replies

  vfio-user: Define type vfio_user_pci_dev_info
    Added separate VFIO_USER_PCI config element to control whether vfio-user is compiled
    Fix scalar spelling

  vfio-user: connect vfio proxy to remote server
    Made socket IO non-blocking
    Use g_strdup_printf to save socket name

  vfio-user: define socket receive functions
    Made socket IO non-blocking
    Process inbound commands in main loop thread to avoid BQL interactions with recv
    Added comment describing inbound command callback usage
    Use true/false instead of 1/0 for booleans

  vfio-user: define socket send functions
    Made socket IO non-blocking
    Added version string NULL termination check

  vfio-user: get device info
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies

  vfio-user: get region info
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies
    Remove merge bug that filled region cache twice

  vfio-user: region read/write
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies
    Made posted write conditional on region not mapped

  vfio-user: pci_user_realize PCI setup
    Moved common vfio pci cli options to base class

  vfio-user: get and set IRQs
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies
    Fixed %m usage when not using syscall

  vfio-user: proxy container connect/disconnect
    Added separate VFIO_USER_PCI config element to control whether vfio-user is compiled
    Use true/false instead of 1/0 for booleans

  vfio-user: dma map/unmap operations
    Added ops vectors to decide to use ioctl() or socket implementation
    Use BQL instead of iolock in comments
    Fixed %m usage when not using syscall

  vfio-user: dma read/write operations
    Added header checking before loading DMA message content
    Added error handling if DMA fails

  vfio-user: pci reset
    no r3-specific changes

  vfio-user: migration support
    generic fix: only set qemu file error if there is a file

Thanos Makatos (1):
  vfio-user: introduce vfio-user protocol specification
    Spec specifies host endiannes instead of always LE
    Fixed grammar error


 docs/devel/index.rst          |    1 +
 docs/devel/vfio-user.rst      | 1810 +++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h                 |   27 +-
 hw/vfio/user-protocol.h       |  210 +++++
 hw/vfio/user.h                |   96 +++
 include/hw/vfio/vfio-common.h |   95 +++
 hw/vfio/common.c              |  489 +++++++++--
 hw/vfio/migration.c           |   34 +-
 hw/vfio/pci.c                 |  740 ++++++++++++++---
 hw/vfio/user.c                | 1559 +++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   11 +
 hw/vfio/Kconfig               |   10 +
 hw/vfio/meson.build           |    1 +
 13 files changed, 4896 insertions(+), 187 deletions(-)
 create mode 100644 docs/devel/vfio-user.rst
 create mode 100644 hw/vfio/user-protocol.h
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user.c

-- 
1.8.3.1



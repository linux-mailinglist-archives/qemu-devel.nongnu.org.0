Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210744A00F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:56:48 +0100 (CET)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFRP-0005XC-Kv
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:56:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAk-0005mg-HI
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:34 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAc-00047P-6h
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:33 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A902oTS005900
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/+HSthLiIL0fX+GGl1zJW1KP2BqS8FDoEQtk11HO5T8=;
 b=dHnfseNZ4/t+u1buHOohETjpydG2OqcmZLJdlfJYcZBOoP++GCfnJ70h94yGY3xBBkEH
 n4TnrjkkVtwdUEP6/x7tBuRn8uCpsbsh2ncIR9Xc+Cpl9692BhlL6QxlgDrDLdo2Zf2R
 ofwlHP6G1Vcy6/jj6aTBv3+H2WZVRe7dCRv68ogAQMjyVIQ+4FsvJGt0/wiE9yQK5iFx
 0hXodF0VKaXqfM3cdE0aZa+XdYw5T6hPTEt9XSbXyCBur3z9bMWFzIhTWnYsCYybD30f
 T/AsJfs5Cc2bBNSi+eUZMZbk4TxPXukl/hM+9RmX/y7LaoW0xnRPvUaBw5b7a+hQg1er nQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6vkr01un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLTe129165
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by userp3030.oracle.com with ESMTP id 3c5etuvb8d-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYBvvx2jcUcX5WSiPmdYCuKDnj4TBKDF2zDgV27f0Vf0e1bk7nV1vzJvcxzdF0V2rou8R6d/iEkY7Jg+2kQ96kBIOCXGVT+uymWlJqHKV8W5U1/BWINW2WiZsvSIzzAhikN4NSx31o+mvQxpdBpEPC+mdsvzw6sptYX+/vkyvFQtsHxg6zu9ViwF2QPa0hoQ1AINm0zDRAdGCp5q5GMso53fS95x1LQszfDEVX7mwP7Pjd9dyvJSu1VloFs4tnlIdHI0sc8NCcOqDzUvUpWjLxg/FyX9J75h1OpOBj/viZh4kGMY6K6b9OxA3dWBInsaSFasuL4Lj0gvmPzEvdtakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+HSthLiIL0fX+GGl1zJW1KP2BqS8FDoEQtk11HO5T8=;
 b=aVoNwyuVK5Vo5ar11Co6Cf2fCAPED1guOOGw8T6gIMQkg4G8ASCOSqSZnsDvdmE+HB1OwSHYbXFbpVohipRgxW50idmqV+EmWfbZQ5bg6rh6ZB5CtwHUFrOswv39zdJtNHnoMp8APr67TnuxNrWmZ4P/1mLQUiwpogcZmtB0c9e908BldTUN3B/J4nPlD7h0S5oBTdwUSiIyqJ2dJYwteE2oeH8j+0Dt+QHjtbsrxCUsz4L6Xqj2ilmKDWUonR7ffG92CIvx8w6M+5vb5a1jZTww5BAWzUStux57Egx+rrtrvtuAsNJFWK3ZIAmLGnRgqp2zCRn/4u5GlWv0fpt/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+HSthLiIL0fX+GGl1zJW1KP2BqS8FDoEQtk11HO5T8=;
 b=dCy9+ind80apOyc2o3ocZraMQnH62FoBMvqRrlgTLKhNfK/zKvygXL2XGVv66LJowlOlVeK1S1ssN4Q++jkgz6WwRyKOkB7p8zfJMrW1EU/6L9TPxr36k3rOF9tLeJq94DgWfI9P2YtrdsI17pfOihuIjMyxEu9ehVUeqKDQxWQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB3764.namprd10.prod.outlook.com (2603:10b6:a03:1f9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 00:39:17 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:17 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 18/19] vfio-user: pci reset
Date: Mon,  8 Nov 2021 16:46:46 -0800
Message-Id: <8ae17fad576ba004ca6623830d5de1e3f72e5478.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30c7dfac-dfe3-41e4-85da-08d9a3195aec
X-MS-TrafficTypeDiagnostic: BY5PR10MB3764:
X-Microsoft-Antispam-PRVS: <BY5PR10MB376495D4C9B38EDD9BE4080BB6929@BY5PR10MB3764.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JM0XYKqFw78axufxwCcyon75nCdbWbPQRQnYUErxxk0yJuITQJU3PYe9SjnEiU4Zkoh1hShOiQHZ+gMjhUrXmwsvCP8dcQAl8xXF5emdvRVIcvr8clM5tM/R7wl2RQaBTawHMk4evd0TpgR+Djp+wy7GZlnIgZ5GKYGfITgNi+EAjuqBgBh2H0121ZM3l9btN9ml2mq96Q83MokAuip1H3sCIOAOs8h7wNyTrczHCm2ZjApFip5ikFp7tGDMzN2Jr5KkNnTFmVF3eO+X3mcOm3yCI+1we9WILuJHswg9+OW5ImZviWnY3wJHLnUKRZ/NRZLsdRkKajO6Aixuz+tXzbvSlQkqpqFuFyLLOZxjVPYX/JCcZW6nXhd6iFPy1hbZxj9V0o1cKZb+wM2O+FfsT/QWK5KBbaQSQ+MYAeSs2s4xZKBsPnc3/MrK48SQWPwCj02mZanTHJ4HMFXb14PBizPnGNHXb8pT3Jg6UGz8fMBvvtT5S7mTh2BWElP4qP/IC8bhjeCQBpGQBjEFn65NK4m5+jZt8KwdSyrNtJLAYDlNe+FTaMesJytK/N3iWHz9AR4tCC3dox7tkOEGz88rUB8XUIaPIlUALR5QqEwx0M1wcRvhEdjNM6IqYNU30TCb61nT7kWH1zNDWfqj9uuwEeoJMLRtt9ssKpFQYkUa5pualIkjOx3QXKm7nJYwoL/jPj5bU3FHYBkhFykGC9eQwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(86362001)(2906002)(8936002)(36756003)(83380400001)(66476007)(52116002)(8676002)(5660300002)(6916009)(6486002)(316002)(2616005)(186003)(956004)(508600001)(6666004)(38100700002)(38350700002)(26005)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U0CnArC8OtQZh2+RIC6Vpn/q3SnTEIqPScbeJvN4JcpPbX7kfb6zhOBcmDto?=
 =?us-ascii?Q?bhQzyd/FK/R3KeEa9YnPefFa6//GLyzn+Ft83k7vtHpjrS66ntqylMqqQ52u?=
 =?us-ascii?Q?63FXSveIq3KCIg/H+iXlQhfy0qQa5o4KwZOE6JHk41VSEWUET/XjLJj7QD3y?=
 =?us-ascii?Q?vy5FaeMLX+QrTkCoA9dRUX4rATJ+/PVdc1WJaJwrR12nxlca61OtesvlXAFB?=
 =?us-ascii?Q?CEF5yT3Hobip5uQZQsbPh4/yY2t1aLUfz+GjAa9sqxdzVb36ZRjzC/tQpQ1E?=
 =?us-ascii?Q?O1Llr8wlPQahPYMqX0JUC91sUWqf9iFdq8XO/BwyTHcCjiXxtwyMjHFQPtqU?=
 =?us-ascii?Q?FRIAO9QJFaSbIyn6lUiEGeXIDUghkvTJE3Q7foUka7NEiiYejipiwtBtvBAO?=
 =?us-ascii?Q?q1hcHqx5pGQZ+CfgsSa2xrWUmN+F23Ua1yhV1xhz4dkbAu6kM1m+tLQ77yp0?=
 =?us-ascii?Q?RBWL6uuNLk62YHeiE3nkcDFGDZXpvlKjzfit66ElOyEvEceh3+Yp2AzeUGXP?=
 =?us-ascii?Q?HNE9RaCiyH37iqS0AMo6CKh6Jb3YG/5uAZkbhw7CF5VtbFS+SRmDS+IeJ4Rt?=
 =?us-ascii?Q?pr3O3FEIvRCcwE1JgZZg3DROZPyHzNhVRykQ96mWh2YZmOBXa/eJb1aIOAGA?=
 =?us-ascii?Q?Ffrr6tW9nkkVDYPVFKrk507uDQ2erqG8MgVdC4sfvethdcRrZY/InqmYmm5B?=
 =?us-ascii?Q?0RqaxWLvAl28RwwOHB7izUAk6m8b5/HT/z91Wnz7ynyYqcmuCKFXccisQ4kE?=
 =?us-ascii?Q?7VtZ9geH6jVuhPkN83Ql88GAftmCw0qUO94vNgRscNAQfaMeHiN5sjqLzIOL?=
 =?us-ascii?Q?sexwuidRFf23xUUDGQfu9hYjCH+N6oFnn6R9Xpst+WbOxAyO8Oyl6VL9CI0e?=
 =?us-ascii?Q?sA5aIPXj7FWcmSfbBdh+3hfRVEX5O2ZgcSHZw5VTe8eeDXRX0KOQ5oxtLVsy?=
 =?us-ascii?Q?OuWwYPBhWslI9QW0akBf6NNIl3JqlkBMdNEoFmTmgDyUEeWGTooc80xr4rCn?=
 =?us-ascii?Q?MegJihGiT1gr6o4K7K9MuSDVpjKV6333OuR7ucY0IdutN2FDW2ZPbabSyuCU?=
 =?us-ascii?Q?XYotQA1g9yGUr9PKgGNQJx40gVZGNACDyLR73r9/Ycl3lKVxecX5RsrgZxL4?=
 =?us-ascii?Q?NutrK514mdn+WA3hZBCvv3RgLMhftknd7L/9o0GPx8g6CFUk8ug09oNXFBGK?=
 =?us-ascii?Q?nWhoN+U7BEYl66kNqxoZiaAxzKTPd3+/ztNnnmoH5Wdh4Eb+ktDz/MCpTv4n?=
 =?us-ascii?Q?rYS/y1WO4HpiY+cpAgJlwks3c8hLuh3ojKW4AO7zdxaHhZyYSvWHYzweCRr+?=
 =?us-ascii?Q?y5S77PvMZwrNK5cje/XAa09VlvJAXqh6/EB8UO2RZDXqPI6kr56AehC7r/HN?=
 =?us-ascii?Q?KbpKrLzNiqeXWIRcdSVdiIQHb7Bj7qPzBxSDzo1P/Lxiq+rD5gW/jL7C2BaU?=
 =?us-ascii?Q?QyO2CQEy/oHGTjlk/VSbQ8vxA0AqmT/cmxKc4Xf3Tx5pQmT2fEF40u8PCp6X?=
 =?us-ascii?Q?y1lLZVGKzDK7uU/qSgZZWh0ORI3ddrBfqdq2F3GHunsw+pGghy3F0M4qPXcU?=
 =?us-ascii?Q?p8IKejNzDyvdVBWkEBxVp5XW8kFLRTVYMMzPsj9IYyhU4zF/7HqYsXLyH2xb?=
 =?us-ascii?Q?bkV/p11PcZGbiXcLm/HgzZsZA/HzkGqH6aSRxG58Z0JFgm2YMf1ITPjm/Evc?=
 =?us-ascii?Q?3HubcA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c7dfac-dfe3-41e4-85da-08d9a3195aec
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:14.5780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSGYOnUfo+viXK9nrhRXyIi4K31KrHcKgRETKRZVkZrd6wskBG8P78Prx2ynoR71VbnSuG0lGCGAi+BGYQD4qxWQNu1PQSPEN1PcUsTqL8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3764
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: LPi2uuMcXKg7wQ0Dap0P4L_XcrMBdZvS
X-Proofpoint-ORIG-GUID: LPi2uuMcXKg7wQ0Dap0P4L_XcrMBdZvS
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h |  1 +
 hw/vfio/pci.c  | 15 +++++++++++++++
 hw/vfio/user.c | 12 ++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index e6c1091..7504681 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -88,6 +88,7 @@ void vfio_user_send_reply(VFIOProxy *proxy, VFIOUserHdr *hdr, int size);
 void vfio_user_send_error(VFIOProxy *proxy, VFIOUserHdr *hdr, int error);
 void vfio_user_putfds(VFIOUserMsg *msg);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
+void vfio_user_reset(VFIOProxy *proxy);
 
 extern VFIODevIO vfio_dev_io_sock;
 extern VFIOContIO vfio_cont_io_sock;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 877e3e3..ccb2563 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3792,6 +3792,20 @@ static void vfio_user_instance_finalize(Object *obj)
     }
 }
 
+static void vfio_user_pci_reset(DeviceState *dev)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    vfio_pci_pre_reset(vdev);
+
+    if (vbasedev->reset_works) {
+        vfio_user_reset(vbasedev->proxy);
+    }
+
+    vfio_pci_post_reset(vdev);
+}
+
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
@@ -3805,6 +3819,7 @@ static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
+    dc->reset = vfio_user_pci_reset;
     device_class_set_props(dc, vfio_user_pci_dev_properties);
     dc->desc = "VFIO over socket PCI device assignment";
     pdc->realize = vfio_user_pci_realize;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 2f3eac8..76d0706 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1386,6 +1386,18 @@ static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
     return ret;
 }
 
+void vfio_user_reset(VFIOProxy *proxy)
+{
+    VFIOUserHdr msg;
+
+    vfio_user_request_msg(&msg, VFIO_USER_DEVICE_RESET, sizeof(msg), 0);
+
+    vfio_user_send_wait(proxy, &msg, NULL, 0, false);
+    if (msg.flags & VFIO_USER_ERROR) {
+        error_printf("reset reply error %d\n", msg.error_reply);
+    }
+}
+
 
 /*
  * Socket-based io_ops
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B53E31A2
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:19:32 +0200 (CEST)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Bf-0005gB-M8
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85w-0007ki-UG
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85u-0004JF-OF
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:36 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MB38v029751; Fri, 6 Aug 2021 22:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=77DrTQtv9HGtkH8RSMHnlyukv11D14Z+6dwlBj27OSs=;
 b=YNWXrijBYGfid47yY/1O7lKH1bGHHyM47XkATkBZW4Cp8xR8qMGro9+l61PaJkUYL12+
 TRr/ntCCsLCT0stkonyLd2IcXbOsAJkVeyFjhp/H4nwDQ/vs4RcI+xA/UehlWVTzcZjT
 B+TRkeriu/FF+AnscHWY6QCIqqzoUb7mGUXZJkGiiithgO8PHno0EzeYJ47bhvChM3WW
 nRRp0eQ6zIGkkMlgKIpNIqMK9KNtSKF6CThwowf4ZnZyE1X85Avzajxs83tIAnRmi1Sh
 ryk5H7bWjx6Se+MDv6TYmajK0NGffb/uzwJLqlDmF470SLvurK919OzJW8GDa5BaEend zg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=77DrTQtv9HGtkH8RSMHnlyukv11D14Z+6dwlBj27OSs=;
 b=xfXLLoFfGBvAWXbr6lks2Y4zYeLwpddccUtDWnM9m7wuzjODkcEzunM2gw5pjDYPoBnu
 GqNIDTo8iHOsvRK7MJyBKJqOOSFCR5LvnztgCpZXjmRbZP6m7wusfswWtjK8RndHjt6C
 +cWxI7D32A1A2CWd3iy3aqFmj5r7FETUNmYnX6WbdUyuvYXgGXoQFsAe4xd1XTvhzRxJ
 68hkTKxw6tDrWNyHPRZuHODhfOrl1OezO0eOoJn8nYDRHEWXVtRWlAABjEzFuz4qX8ip
 0m4d2bh3wczDrZxuM1EqkCsXHXNTuYoZq4ijMzL1VsXJq/Rd0GBwiEwMocM8/osbPFol OA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a90justqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MAC4w083160;
 Fri, 6 Aug 2021 22:13:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by aserp3020.oracle.com with ESMTP id 3a7r4cay5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awaTK4Xzge5vB0I8pBQy5Mbou5UfuIWkpZTtWorIKK5v8jwgDooMluxRpKkMnoRa+VcHObScNgWGoyrmbS+Mo+Fz18L8LWrmrf3MnfTF2oInWLOYRWewXA4ZzlbCPOn4d+14AU8iQ5ZMkuUKzpTjc65djqHwKOLmxDY+IT5XWwAScy/eUDcHB5KZ6SA/e18DDw0ptlbJbMl3fVprpfAstOtJqsbbYmwrt841186jUn4ElUWptGGOluabs5EY5L2DxeSTooaOzgaZny/boo93TzlR3cIIzdFlToatmlCKYet1oVAkNxp05J4sCOfWfy11/iCxvhzMQRW6foY38RHHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77DrTQtv9HGtkH8RSMHnlyukv11D14Z+6dwlBj27OSs=;
 b=cpPaBtYfWUrjR3bUEVl/v7XZNMYwrpXDXUKpt2yMBxb5qQT86jQE67kRLJ43Q6iOo4TFRrZVynFuRWi2TZuyJGHN5m0jouw+uAVNp1Z2UWeAAWD0BIjVLc3LquwfgOBChbJcq/O6tBihrvbhdVdGz5naLOakLz/aCfaqvreheSrL1dXq5SIEMLFc3G8rIRsZPzT0g/Db5hVo6vgapQz7k1m8dtV8ZfrmyUUxdsIJOyWlaV6gZ1SXkEa0g4S280sXNW6CnAKryAezRSbuFfTEjvStW3suKbHo0AFxakv7YhAdULRRz+soLyOCRzIz3K8Es4SqImXZb2Oqg19hHtw9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77DrTQtv9HGtkH8RSMHnlyukv11D14Z+6dwlBj27OSs=;
 b=vDw1qHSS8TWmkEXQos8QKxJQNQGTjK20qFfoW3dIW4vwogFFCK2i0zL6A1RQ7i/jIHdOIS3bz+La7q9K8fSjFfAJDK64BqgGMQmv2r1JVgsIOXUMKDCu0W/wn6hX9vXNe2UhVW5QZo4Wfa+Kcy0h+P/qgYVYb0DgMfbYASvRZrI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4129.namprd10.prod.outlook.com (2603:10b6:a03:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:26 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:26 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 18/27] vfio-pci: refactor for cpr
Date: Fri,  6 Aug 2021 14:43:52 -0700
Message-Id: <1628286241-217457-19-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a283f48-c1d7-4ca9-7b8e-08d9592769c0
X-MS-TrafficTypeDiagnostic: BY5PR10MB4129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4129B855FAA66164682CA998F9F39@BY5PR10MB4129.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OlelaFjwZy8kMyg86gyni/X2x+10Fh7xDfSWFyi1g99JaO0iyskDRlNsRCLznicyxygabzbwJhrEsB9yre0F3axbpC8/m4DGKHPREuN5KxbQJJSJ4XeD7BL+aQyvQ8p5IEgcjTGxsiNVZGwBPJj5cJ5X9jPGXKjl+Y1PbBkNXh5lKFJG8o8qklpRswxQRueanq43HAeE2EiFyy+EnTlVe2BHRKyq3F/SLixTj9Hjuuz5KPNjuK7qcnTQc1tp1m85VO0uK92UQVtviy1qCDqsbFZFpxYRwB/bI9ytdu6/jvRPdBlPk94n2UeJ1kwmxUzq1RJo149kQNV20nAmnaYKxs/IMZ9OcmQOn11nO4uJjAkUvMtg+yEjkB7Q9tWFi/mDJSIFqWh8sxnzwUg5SdnhxwKyQ/cjhWxWe+5gYpQZzgs+UiGhvFpScEz4+eZ4qsTBMWNIaemkJ7r/lDs8LJzv6+jU0jpFMA9zIcGjXZzagx/gdI4BSbB0WtKpTuWih9EHHRXzBqW8QTr8tyv+PzK7x01pGJUN6qfMwa9EzMWB3DbUDgLQ3N94jlAa8d1vO4+AiL16+C4qKZJQlrY1ErXJhF543/cC/RQPOAxiedmZYXD4Kerqh1conTxZI60SSHq33nzoagVO+bdG7mJDPAzH8GJJ0uNX+DhpC1tAcqI/gcdintZXiQgpGpOKLjrDzELlU/OxaXny521/4EGNlW8lqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(66946007)(66556008)(956004)(2616005)(316002)(7416002)(38350700002)(8936002)(478600001)(66476007)(36756003)(86362001)(38100700002)(5660300002)(54906003)(8676002)(4326008)(6486002)(7696005)(52116002)(186003)(2906002)(6666004)(107886003)(6916009)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wgd/34AyDnHo0ehrKI02ABwTXUT65B0oCL1Xx9coWqOEbj0LNgzCns1ADvVq?=
 =?us-ascii?Q?y20KjWdQun6VO3fJcSdyxNM7X+C2+nPWMSn04peq7JxP4PeAURz/SXd3a4RV?=
 =?us-ascii?Q?JRvpClzhHL0UBOz4ISJnxqtTMJ+pHpgqODtiJZhczo1qmn5NR6oHvct+Vx80?=
 =?us-ascii?Q?qcEhhjRhgMIxynI5OMNvSbuQyHDfnfdDCKvcx7DjdEMUprj03lsljtUH6TEq?=
 =?us-ascii?Q?NClRAjbk75v/ddyApRh4Vf9ftnKaHpaubDaMVtWdCIZ0jjbb9Qqa47OPlqkW?=
 =?us-ascii?Q?Swd/TzfvOFFwHVxBEf1Zyoqfr+risT90n+xy2Hb/zzk3Q8MQ8uywOrpB4hm+?=
 =?us-ascii?Q?Cs44NCeCXn4u8Q60B8pOmMQIYVZ5Vq4TZlCA2BDz6prGNFsqV0nmiIVeR25+?=
 =?us-ascii?Q?kDhfaIns2JXuGT5cyntCSs8x3R2WJhAqcKeiSNVhSdCgfj0Vds1F1+KIAMZO?=
 =?us-ascii?Q?f0G7cfCWbFSCFvhag33ic6RJDco4hSUmTe3FS90P6DMCpzrYORT1cFx2m9Pb?=
 =?us-ascii?Q?TXVMHAnmU5l9QRUa0uplUJ7UdPpKRlwnaWjpVPX2PkICiAyDbylLO+fBNOOo?=
 =?us-ascii?Q?QTakrh6IFFCR+RBavDbT3Yew1cFpnZT85Gu/GH0sJllT2QK2Cx95qseLQUq7?=
 =?us-ascii?Q?d/MEbf8xGMEVqgDivxkmjBr9ovx63TGlbPMwYcUYKyaNVcQHToiAJClr5H+4?=
 =?us-ascii?Q?o396sGQ1RZvgE199frAnf8ObtJMQIVrB9UY4iqgFhrRG9bG7BqxZv24dEBVz?=
 =?us-ascii?Q?xQSlDFgui+0idkX5irVWM7wF4K5QCi0iu6TtU9CZPa4gywsJaVK9JstzcAo+?=
 =?us-ascii?Q?Y2lj5eyI/Vx/mByU+MbiTggdEeW3ysPc/RoApPfZKNpoMIzgVc0W+VZFV58H?=
 =?us-ascii?Q?NTBDSDbEcQkz85LsfH9TFDlEoAaOEMrzs7y0zkltl688OHTNkODHUeiZmzAZ?=
 =?us-ascii?Q?Csvz2fS2bmcOh7OGZ1ICo8fXFhftvVbogo5kgWlAJGuHSOW70auY7meFy/Wx?=
 =?us-ascii?Q?GKMu2yvhxfkOoPcyA7hSKe3LeUfr/hnEOOMLtZbLzjscrnctLSjIjwYBIWGi?=
 =?us-ascii?Q?Xfn+77DvwjBcf/Cf9LxLcy1I41yphWwTh3HDK46J7AMLm+bPfg7ttUj2geb+?=
 =?us-ascii?Q?YoALQEMtO2GfDbZ6KiciYZ9n0lYC1V0NMrUQnw8UByDvaiGcnQ5v10ETw4D+?=
 =?us-ascii?Q?bgql3Jo3Mrh1fjpo0Tlzl3h8ax1v+hP910RTxdBbxNR86HEn6YY+2D9/5cKH?=
 =?us-ascii?Q?iIaBkv7qRIJIILtBS2YoB8ozmnRXdfo+V6btnVxN2YngcN00q9Dv6saz8RCG?=
 =?us-ascii?Q?szFo6fy6vGHJl0KeLcVOtc1/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a283f48-c1d7-4ca9-7b8e-08d9592769c0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:26.4033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5hmDo5ihBRxHaFthLOsPZo2eHdeI7PSXhLSY5TB+QoeHfvy6h3fW0Cv8BgPRkmHZIFNYkD71h4LsQXwenF4Sk9XmBDuCegq4ij35TdtXWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4129
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: hth-sB7E69dOdwLqQ6k3d4PjgQ9JeWBz
X-Proofpoint-GUID: hth-sB7E69dOdwLqQ6k3d4PjgQ9JeWBz
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export vfio_address_spaces and vfio_listener_skipped_section.
Add optional name arg to vfio_add_kvm_msi_virq.
Refactor vector use into a helper vfio_vector_init.
All for use by cpr in a subsequent patch.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/common.c              |  4 ++--
 hw/vfio/pci.c                 | 50 +++++++++++++++++++++++++++++++------------
 include/hw/vfio/vfio-common.h |  3 +++
 3 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8728d4d..7918c0d 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -43,7 +43,7 @@
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
-static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
+VFIOAddressSpaceList vfio_address_spaces =
     QLIST_HEAD_INITIALIZER(vfio_address_spaces);
 
 #ifdef CONFIG_KVM
@@ -558,7 +558,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
     return -1;
 }
 
-static bool vfio_listener_skipped_section(MemoryRegionSection *section)
+bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8..e8e371e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -48,6 +48,20 @@
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
 
+/* Create new or reuse existing eventfd */
+static int vfio_named_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
+                                    const char *name, int nr)
+{
+    int fd = -1;   /* placeholder until a subsequent patch */
+
+    if (fd >= 0) {
+        event_notifier_init_fd(e, fd);
+        return 0;
+    } else {
+        return event_notifier_init(e, 0);
+    }
+}
+
 /*
  * Disabling BAR mmaping can be slow, but toggling it around INTx can
  * also be a huge overhead.  We try to get the best of both worlds by
@@ -410,7 +424,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 }
 
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
-                                  int vector_n, bool msix)
+                                  const char *name, int nr, bool msix)
 {
     int virq;
 
@@ -418,11 +432,11 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+    if (vfio_named_notifier_init(vdev, &vector->kvm_interrupt, name, nr)) {
         return;
     }
 
-    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
+    virq = kvm_irqchip_add_msi_route(kvm_state, nr, &vdev->pdev);
     if (virq < 0) {
         event_notifier_cleanup(&vector->kvm_interrupt);
         return;
@@ -454,6 +468,20 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
     kvm_irqchip_commit_routes(kvm_state);
 }
 
+static void vfio_vector_init(VFIOPCIDevice *vdev, const char *name, int nr)
+{
+    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
+    PCIDevice *pdev = &vdev->pdev;
+
+    vector->vdev = vdev;
+    vector->virq = -1;
+    if (vfio_named_notifier_init(vdev, &vector->interrupt, name, nr)) {
+        error_report("vfio: Error: event_notifier_init failed");
+    }
+    vector->use = true;
+    msix_vector_use(pdev, nr);
+}
+
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
@@ -466,13 +494,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     vector = &vdev->msi_vectors[nr];
 
     if (!vector->use) {
-        vector->vdev = vdev;
-        vector->virq = -1;
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
-        }
-        vector->use = true;
-        msix_vector_use(pdev, nr);
+        vfio_vector_init(vdev, NULL, nr);
     }
 
     qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
@@ -490,7 +512,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         }
     } else {
         if (msg) {
-            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            vfio_add_kvm_msi_virq(vdev, vector, NULL, nr, true);
         }
     }
 
@@ -640,7 +662,7 @@ retry:
          * Attempt to enable route through KVM irqchip,
          * default to userspace handling if unavailable.
          */
-        vfio_add_kvm_msi_virq(vdev, vector, i, false);
+        vfio_add_kvm_msi_virq(vdev, vector, NULL, i, false);
     }
 
     /* Set interrupt type prior to possible interrupts */
@@ -2677,7 +2699,7 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (event_notifier_init(&vdev->err_notifier, 0)) {
+    if (vfio_named_notifier_init(vdev, &vdev->err_notifier, "err", 0)) {
         error_report("vfio: Unable to init event notifier for error detection");
         vdev->pci_aer = false;
         return;
@@ -2743,7 +2765,7 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (event_notifier_init(&vdev->req_notifier, 0)) {
+    if (vfio_named_notifier_init(vdev, &vdev->req_notifier, "req", 0)) {
         error_report("vfio: Unable to init event notifier for device request");
         return;
     }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8af11b0..cb04cc6 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -216,6 +216,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
+typedef QLIST_HEAD(, VFIOAddressSpace) VFIOAddressSpaceList;
+extern VFIOAddressSpaceList vfio_address_spaces;
 
 bool vfio_mig_active(void);
 int64_t vfio_mig_bytes_transferred(void);
@@ -234,6 +236,7 @@ struct vfio_info_cap_header *
 vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
 #endif
 extern const MemoryListener vfio_prereg_listener;
+bool vfio_listener_skipped_section(MemoryRegionSection *section);
 
 int vfio_spapr_create_window(VFIOContainer *container,
                              MemoryRegionSection *section,
-- 
1.8.3.1



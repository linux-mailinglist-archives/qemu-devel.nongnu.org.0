Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD93546E02
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:07:19 +0200 (CEST)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkuc-0006vc-KE
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkfH-0000av-IJ
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:27 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkfE-0000cK-U5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:27 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhrZD003361;
 Fri, 10 Jun 2022 19:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=u0ebSYNx3tiF4jHpj7HOISwBWc9Ym88GW1qxizqK5a0=;
 b=gtsqN5T15TXeAsCzLUjfPw5/a5xYmhBPvGgRY1qx3HAcggx42n0UeptD4U1ZtULs9fH6
 95y2toz8HQMy53u9SPXixjy1/e479xgnhQ7VUiOsFAvcsX91JMytpPtUmmF8Li5FVsQp
 peqHWLLmpUp0C9CSiUWxUj6qiSZx/mng0sOMZUFe14JdPNUU2n8AjZHE2O/EYwAlHJfv
 MI13WLgUwNBsOOHaKXhuW0HXSBkf4CXEzROK4acPTOpMjp4xrf8aGuUbvZTMPCcec0He
 e/b1uZu95NOju4Dj+ApZbrSgd0WD/BOwB/hWCnuOaBqONspeb5lu7G+qnmuy4gzHtPZI uA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyekpdn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:22 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJjx9j004508; Fri, 10 Jun 2022 19:51:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gfwuccjqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdVJi/GzmieOwxHdvhPNsvCayo8WFC9QNkA0pVGJtToiniFXIKfgc8BKnu/laD3zgNpLkKs8pWPuUBwnNFqDT134oMYFBm5KaNddK5dVl/qaf507qbF65Yp205jKr3Y+uv6RLXTweuL2KffNwKzNX10ZRMHqE4Phuru8ddCWohg1EC8lxihOq2P0TRIgmsBcY3rsDKbAJDs6pUmCYlnrhcwENW7Vifk+S7jaoPRJrjeMQnMHYcaOK4Ja4WHC+BqS0zW7HkN0SkezJRGyheiszDia0T5F9QHxgEXGj194vgIqNC1wZCACTR2+2FcMYJruP29AVAEMavMBfUOe0UvLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0ebSYNx3tiF4jHpj7HOISwBWc9Ym88GW1qxizqK5a0=;
 b=NoWGEg5LpVj/uHdmUn2xOqge0W/jKRWTNYwG8EC9cSkSeBOAXbea/crW7cdr+ApZGOJvoTvIX3q5KQ/QXfscaIKd5YH7P3rDDyj88m8Uv5DQYBfuSNtT9KYlcZTAZ+ecPaHdpqrIYbeJwfhsuHPfMe61+EPYoa89+0Sx23ENybqnp8VqNFwR2e+8VV/9lDrYkxb/4rjEWCZNAptdHmmUceFhju8X02TQyXq5YWrzIl9ZmPE4bJbM2gNBCRtglxjCkJP02ASVs1NmAC5AyRgqIyUTA5XgkLWOCSNiGhJEwc54mj4B7lM4t5p/5PlIbyWQMrvcSuNXxbdxML8B/Wnw0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0ebSYNx3tiF4jHpj7HOISwBWc9Ym88GW1qxizqK5a0=;
 b=WRXobG1AMp6Fqbifxp4+qtUdjZZuCPwFnmzQwnt7DXlvhPb7odackglkpQ10xHPi9LnlCFTgoXRrMai7Uc2IKGz+pdWzgNTfCNHUXYGDzvOpX13EeLB9rLbf4W6LTrlL0eVh9IX89tBdcalSelCCP7MQThIhos3UqExV/CZ8/W8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1915.namprd10.prod.outlook.com (2603:10b6:3:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 19:51:18 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:51:18 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 13/14] vfio-user: handle device interrupts
Date: Fri, 10 Jun 2022 15:50:40 -0400
Message-Id: <1baf753065d5d135b7638fa099c6929767aba1f5.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffe65517-e85e-401a-c87c-08da4b1a9619
X-MS-TrafficTypeDiagnostic: DM5PR10MB1915:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1915E72BEB6EB6614E60C30090A69@DM5PR10MB1915.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RUa54/+++BI2SSVaDXeNISOGuKwZtGkSZWOtgDZteJNMgP6ivXROkDqjKHw287ScEfxAeer0ILSEzT11FPzx/FD9aQ6qy1TqjEu/xdBmk3tLuGh3O6h6hUQKmnlOiTvUd5TlG/n1GdLGSH0CyQ5ujtTV8fMy7sRxNIEAfZo1bMjeKw/Of8d80oAeM90I9eHuqZa6l3IcoE/5t4IUlMp0fP2e/E+Y8HvrIigTo5H7wwJGvrqkSQbxOr28EO8MdgWNvuTyLE5BBmo+/FzP3EBk0kDgeTC5tti4CKw3CDd2URrdZMBkk8TXykqc4rASbVAJIBeTZw8B+aaArrg5YxqKCH7KJxxR3SbQBnjVY4hlYPB94bnMRwZdwQm9BMoBWjLUKQeuQhAZTwHcpEAgUqi5XkQ5J3o2C6a/as8LvjRnQa6FFVbsnc9liI2K2aIuu/t7rq/y3A9ZuAfLf6ZpLD4OxokpAQI0lLklKMFxELRL/S9b9b/3i3GOaqlP5aBfqorTGH1SGMGIbJR7yYKJAinDl+L5g7fdYwvWQZg0og735sxwilCnabzTKNx6PT5h9bu1w1uQPEvAgGL8lHf+kEx5cau4Wgp3g4YPy16jdmh8ueVXCUSyA6K8wif7HDFKbRdxkiI1vSk66GxBxZACUQaMXXNoClmQTuK4OafLE52y+IF3UFyjKDCwmtEwB63Q6+wuNnngts2Hn4k6dR/ZmPENhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(6916009)(2906002)(107886003)(38100700002)(38350700002)(6512007)(26005)(8936002)(2616005)(86362001)(52116002)(186003)(36756003)(66556008)(66476007)(7416002)(30864003)(6666004)(8676002)(508600001)(6486002)(316002)(83380400001)(66946007)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XJLUgj/nje8rJyY4T7zN2wqltxmwZQ3V5EKb5rqUPhEstQP8ubi1HeItIsh5?=
 =?us-ascii?Q?xtp1FGc5MGnTa2dmaFST71ioqFRGikRciOL34U6A4iyi3rfsMk/vO8Q0PDff?=
 =?us-ascii?Q?er5mQYd//5/+/RYouOxM30ILfHZAk/YZtbeLh55FRdIG7q59SD6Kdu2JsT8J?=
 =?us-ascii?Q?cF/a9UtNSYkPILKw0eJ4FCSDiZQWn/eVyfVbpqm10BTynWGyr5FIRMGgOuv3?=
 =?us-ascii?Q?LkPuiJrNRwva1qWguPBaVW9YRYhavbvy+ECOSjkPXEOqOMmXhr0anIkLQOQj?=
 =?us-ascii?Q?sB24NRSlvEB4cCdBjre3yuBI+0CAR9U7QEDxTgOpUPR6KQ9dniwepbvIWsLv?=
 =?us-ascii?Q?BiorLe4r8En1x3ShtTlLe5T8QpuUeccsyX0aZpd9QkAdTnU055B2s9zesF3q?=
 =?us-ascii?Q?Pb/3AGjyqOElgbojlezxKGkyhbErNUHjOEclPgaxK7cW1d7fUPpUBoHV4783?=
 =?us-ascii?Q?2k30BPcs0ruiahvf4mJ5eydJGbrH1eCwnvlB7I+ByhJ+H1nxw0xmFJOAQAGU?=
 =?us-ascii?Q?Hzr5W9lRNpGwxR/9JKqS3cYgpNs8gcvMnkbqx2pzQqZiw+WyVxXxZCUU4Kef?=
 =?us-ascii?Q?DSOTbJ01UcCK1WWAHl8whttKX2NP61jbr+jCXujE6YPdBMy7SHmrjOGsI1ec?=
 =?us-ascii?Q?OGEsJBV1G1due3z49EHljDCnRI3BHK7NCCxy6GnHxEAaz72GWSsS8OG2KhQt?=
 =?us-ascii?Q?UcO1TETI3Qi0KgYSXDu1i3MOf7IkK1AAQOmkJE63Wr5TR7gHsz7ZGbFTrLRN?=
 =?us-ascii?Q?K4o4uy87eWOkNKjKILH9k16uCibbsCZRxb6qerMJZCBL9quCQ+1/fUkbmGvf?=
 =?us-ascii?Q?vF3AnzbbG17kV6fTUGSKPr1t8WH6AqhmLrgNsR2nY6QxVcEWnIUtsCNY8K8S?=
 =?us-ascii?Q?ed2COI08kI3NxWs/ZW4aG7FxfacZdKKK5sS0Unr1mo2yZhSgaiS0j7L8xS96?=
 =?us-ascii?Q?hdXMk/zgX1qFDOnbQsA5Lk7p60GUxvG/1WKlePY/FNABOqsNpw2WTz/dPTeV?=
 =?us-ascii?Q?uSKbYQ3EiSFBvN0t1QCcsi/Va6R7LYqCTpk+Hi2Gfv5mhGncgELApVL7cm9L?=
 =?us-ascii?Q?7Jx6knLa/wKoof0ydCA+/xyG/DCZoFFLgh+0RTyxTtX+Fhq0K5v4r3wLxnsZ?=
 =?us-ascii?Q?1jZ3F4GbePbQySdrxsQd41spPE8tCL7EAkj08xMyDnFE8SlTTj+EAfWPQ0cz?=
 =?us-ascii?Q?ssHrwreKl7OxE5HNYoJ8ZCm/vIuWFV11evW9ZE4YJYq4csKI3uZHLBL++hRV?=
 =?us-ascii?Q?1Xy+ZAXZDdtqzyyuAz7PzBdBJFTfeFI9NZBwO496qzIKmqKDQ5MbvRudrpkB?=
 =?us-ascii?Q?M3scVRXpAFxL8nQ8Uil8OpUri8pGIwnbvU8F4KqsJLPzltaHNA+Wo0smRoB4?=
 =?us-ascii?Q?klJpIdv95cQ9SEv2ff8YJTrOU4yFFx3XI/a91ZSqN7Am3/puePsjzRQh5Dx4?=
 =?us-ascii?Q?4kpe295lRP6lljR8V+U3x8c9QS9tq4V1TWvunsGnGdZpPghHB4NfScOWvYQG?=
 =?us-ascii?Q?8OZmanWjfxbpua8toI1hB57FYjtnusL1yWyaTEtVmcu6o1m5P8LwG4pYa9bR?=
 =?us-ascii?Q?3cd9sqwTCtSwkNRKt1qK7kSrTphlS07h1IWR80zWl+ThF7X7jYPlu/Ef6X6U?=
 =?us-ascii?Q?mI0Of/K1ki6uGc80BycWyeUIEzSLRPgzoMymiIt7IglPv2LYbJnt7Tb5VSyD?=
 =?us-ascii?Q?IM9Si6hqK1d6g6RQdKS6UmKeWIqhDwPltZ1mtb2nbiAu133cXuphtcgzwaOa?=
 =?us-ascii?Q?YFuT+fR2sA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe65517-e85e-401a-c87c-08da4b1a9619
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:51:18.7882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S07MqrA7TmiJCCuY9MQFBW+f+AwM7/uN6OccioCC/d05aeiAaK8UMmxR3uSwKc7Lwe6V//hu6Dmgnn9vWYmUiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1915
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-GUID: NQXIfhGMSAwZG-5Jp_Dlgcu4yy6wrqjs
X-Proofpoint-ORIG-GUID: NQXIfhGMSAwZG-5Jp_Dlgcu4yy6wrqjs
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/msi.h              |   1 +
 include/hw/pci/msix.h             |   1 +
 include/hw/pci/pci.h              |  13 +++
 include/hw/remote/vfio-user-obj.h |   6 ++
 hw/pci/msi.c                      |  48 +++++++--
 hw/pci/msix.c                     |  35 ++++++-
 hw/pci/pci.c                      |  13 +++
 hw/remote/machine.c               |  14 ++-
 hw/remote/vfio-user-obj.c         | 167 ++++++++++++++++++++++++++++++
 stubs/vfio-user-obj.c             |   6 ++
 MAINTAINERS                       |   1 +
 hw/remote/trace-events            |   1 +
 stubs/meson.build                 |   1 +
 13 files changed, 296 insertions(+), 11 deletions(-)
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 stubs/vfio-user-obj.c

diff --git a/include/hw/pci/msi.h b/include/hw/pci/msi.h
index 4087688486..127f3d5111 100644
--- a/include/hw/pci/msi.h
+++ b/include/hw/pci/msi.h
@@ -43,6 +43,7 @@ void msi_notify(PCIDevice *dev, unsigned int vector);
 void msi_send_message(PCIDevice *dev, MSIMessage msg);
 void msi_write_config(PCIDevice *dev, uint32_t addr, uint32_t val, int len);
 unsigned int msi_nr_vectors_allocated(const PCIDevice *dev);
+void msi_set_irq_state(PCIDevice *dev, int vector, bool mask, Error **errp);
 
 static inline bool msi_present(const PCIDevice *dev)
 {
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c739..f6ab96ed93 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -36,6 +36,7 @@ void msix_clr_pending(PCIDevice *dev, int vector);
 int msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
 void msix_unuse_all_vectors(PCIDevice *dev);
+void msix_set_irq_state(PCIDevice *dev, int vector, bool mask, Error **errp);
 
 void msix_notify(PCIDevice *dev, unsigned vector);
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 44dacfa224..b54b6ef88f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -16,6 +16,7 @@ extern bool pci_available;
 #define PCI_SLOT(devfn)         (((devfn) >> 3) & 0x1f)
 #define PCI_FUNC(devfn)         ((devfn) & 0x07)
 #define PCI_BUILD_BDF(bus, devfn)     ((bus << 8) | (devfn))
+#define PCI_BDF_TO_DEVFN(x)     ((x) & 0xff)
 #define PCI_BUS_MAX             256
 #define PCI_DEVFN_MAX           256
 #define PCI_SLOT_MAX            32
@@ -127,6 +128,10 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
 
+typedef void MSITriggerFunc(PCIDevice *dev, MSIMessage msg);
+typedef MSIMessage MSIPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+typedef MSIMessage MSIxPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
 #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
@@ -329,6 +334,14 @@ struct PCIDevice {
     /* Space to store MSIX table & pending bit array */
     uint8_t *msix_table;
     uint8_t *msix_pba;
+
+    /* May be used by INTx or MSI during interrupt notification */
+    void *irq_opaque;
+
+    MSITriggerFunc *msi_trigger;
+    MSIPrepareMessageFunc *msi_prepare_message;
+    MSIxPrepareMessageFunc *msix_prepare_message;
+
     /* MemoryRegion container for msix exclusive BAR setup */
     MemoryRegion msix_exclusive_bar;
     /* Memory Regions for MSIX table and pending bit entries. */
diff --git a/include/hw/remote/vfio-user-obj.h b/include/hw/remote/vfio-user-obj.h
new file mode 100644
index 0000000000..87ab78b875
--- /dev/null
+++ b/include/hw/remote/vfio-user-obj.h
@@ -0,0 +1,6 @@
+#ifndef VFIO_USER_OBJ_H
+#define VFIO_USER_OBJ_H
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus);
+
+#endif
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 47d2b0f33c..59f34e3568 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -134,7 +134,7 @@ void msi_set_message(PCIDevice *dev, MSIMessage msg)
     pci_set_word(dev->config + msi_data_off(dev, msi64bit), msg.data);
 }
 
-MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+static MSIMessage msi_prepare_message(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
@@ -159,6 +159,11 @@ MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
     return msg;
 }
 
+MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+{
+    return dev->msi_prepare_message(dev, vector);
+}
+
 bool msi_enabled(const PCIDevice *dev)
 {
     return msi_present(dev) &&
@@ -241,6 +246,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
                      0xffffffff >> (PCI_MSI_VECTORS_MAX - nr_vectors));
     }
 
+    dev->msi_prepare_message = msi_prepare_message;
+
     return 0;
 }
 
@@ -256,6 +263,7 @@ void msi_uninit(struct PCIDevice *dev)
     cap_size = msi_cap_sizeof(flags);
     pci_del_capability(dev, PCI_CAP_ID_MSI, cap_size);
     dev->cap_present &= ~QEMU_PCI_CAP_MSI;
+    dev->msi_prepare_message = NULL;
 
     MSI_DEV_PRINTF(dev, "uninit\n");
 }
@@ -307,6 +315,38 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int vector)
     return mask & (1U << vector);
 }
 
+void msi_set_irq_state(PCIDevice *dev, int vector, bool mask, Error **errp)
+{
+    ERRP_GUARD();
+    uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
+    bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
+    uint32_t irq_state, vector_mask, pending;
+
+    if (vector > PCI_MSI_VECTORS_MAX) {
+        error_setg(errp, "msi: vector %d not allocated. max vector is %d",
+                   vector, PCI_MSI_VECTORS_MAX);
+    }
+
+    vector_mask = (1U << vector);
+
+    irq_state = pci_get_long(dev->config + msi_mask_off(dev, msi64bit));
+
+    if (mask) {
+        irq_state |= vector_mask;
+    } else {
+        irq_state &= ~vector_mask;
+    }
+
+    pci_set_long(dev->config + msi_mask_off(dev, msi64bit), irq_state);
+
+    pending = pci_get_long(dev->config + msi_pending_off(dev, msi64bit));
+    if (!mask && (pending & vector_mask)) {
+        pending &= ~vector_mask;
+        pci_set_long(dev->config + msi_pending_off(dev, msi64bit), pending);
+        msi_notify(dev, vector);
+    }
+}
+
 void msi_notify(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
@@ -334,11 +374,7 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
 
 void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
-    MemTxAttrs attrs = {};
-
-    attrs.requester_id = pci_requester_id(dev);
-    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
-                         attrs, NULL);
+    dev->msi_trigger(dev, msg);
 }
 
 /* Normally called by pci_default_write_config(). */
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..8f774c88ba 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -31,7 +31,7 @@
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
 #define MSIX_MASKALL_MASK (PCI_MSIX_FLAGS_MASKALL >> 8)
 
-MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+static MSIMessage msix_prepare_message(PCIDevice *dev, unsigned vector)
 {
     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
     MSIMessage msg;
@@ -41,6 +41,11 @@ MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
     return msg;
 }
 
+MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+{
+    return dev->msix_prepare_message(dev, vector);
+}
+
 /*
  * Special API for POWER to configure the vectors through
  * a side channel. Should never be used by devices.
@@ -131,6 +136,31 @@ static void msix_handle_mask_update(PCIDevice *dev, int vector, bool was_masked)
     }
 }
 
+void msix_set_irq_state(PCIDevice *dev, int vector, bool mask, Error **errp)
+{
+    ERRP_GUARD();
+    unsigned offset;
+    bool was_masked;
+
+    if (vector > dev->msix_entries_nr) {
+        error_setg(errp, "msix: vector %d not allocated. max vector is %d",
+                   vector, dev->msix_entries_nr);
+        return;
+    }
+
+    offset = vector * PCI_MSIX_ENTRY_SIZE + PCI_MSIX_ENTRY_VECTOR_CTRL;
+
+    was_masked = msix_is_masked(dev, vector);
+
+    if (mask) {
+        dev->msix_table[offset] |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
+    } else {
+        dev->msix_table[offset] &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
+    }
+
+    msix_handle_mask_update(dev, vector, was_masked);
+}
+
 static bool msix_masked(PCIDevice *dev)
 {
     return dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] & MSIX_MASKALL_MASK;
@@ -344,6 +374,8 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
                           "msix-pba", pba_size);
     memory_region_add_subregion(pba_bar, pba_offset, &dev->msix_pba_mmio);
 
+    dev->msix_prepare_message = msix_prepare_message;
+
     return 0;
 }
 
@@ -429,6 +461,7 @@ void msix_uninit(PCIDevice *dev, MemoryRegion *table_bar, MemoryRegion *pba_bar)
     g_free(dev->msix_entry_used);
     dev->msix_entry_used = NULL;
     dev->cap_present &= ~QEMU_PCI_CAP_MSIX;
+    dev->msix_prepare_message = NULL;
 }
 
 void msix_uninit_exclusive_bar(PCIDevice *dev)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a9b37f8000..435f84393c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -317,6 +317,15 @@ void pci_device_deassert_intx(PCIDevice *dev)
     }
 }
 
+static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
+{
+    MemTxAttrs attrs = {};
+
+    attrs.requester_id = pci_requester_id(dev);
+    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
+                         attrs, NULL);
+}
+
 static void pci_reset_regions(PCIDevice *dev)
 {
     int r;
@@ -1212,6 +1221,8 @@ static void pci_qdev_unrealize(DeviceState *dev)
 
     pci_device_deassert_intx(pci_dev);
     do_pci_unregister_device(pci_dev);
+
+    pci_dev->msi_trigger = NULL;
 }
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -2251,6 +2262,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     }
 
     pci_set_power(pci_dev, true);
+
+    pci_dev->msi_trigger = pci_msi_trigger;
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 645b54343d..75d550daae 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -23,6 +23,8 @@
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 #include "hw/remote/iommu.h"
+#include "hw/remote/vfio-user-obj.h"
+#include "hw/pci/msi.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -54,12 +56,16 @@ static void remote_machine_init(MachineState *machine)
 
     if (s->vfio_user) {
         remote_iommu_setup(pci_host->bus);
-    }
 
-    remote_iohub_init(&s->iohub);
+        msi_nonbroken = true;
+
+        vfu_object_set_bus_irq(pci_host->bus);
+    } else {
+        remote_iohub_init(&s->iohub);
 
-    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
-                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                     &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+    }
 
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index dd760a99e2..2d716e6391 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,9 @@
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/remote/vfio-user-obj.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -96,6 +99,10 @@ struct VfuObject {
     Error *unplug_blocker;
 
     int vfu_poll_fd;
+
+    MSITriggerFunc *default_msi_trigger;
+    MSIPrepareMessageFunc *default_msi_prepare_message;
+    MSIxPrepareMessageFunc *default_msix_prepare_message;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -520,6 +527,155 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_map_irq(PCIDevice *pci_dev, int intx)
+{
+    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
+                                pci_dev->devfn);
+
+    return pci_bdf;
+}
+
+static void vfu_object_set_irq(void *opaque, int pirq, int level)
+{
+    PCIBus *pci_bus = opaque;
+    PCIDevice *pci_dev = NULL;
+    vfu_ctx_t *vfu_ctx = NULL;
+    int pci_bus_num, devfn;
+
+    if (level) {
+        pci_bus_num = PCI_BUS_NUM(pirq);
+        devfn = PCI_BDF_TO_DEVFN(pirq);
+
+        /*
+         * pci_find_device() performs at O(1) if the device is attached
+         * to the root PCI bus. Whereas, if the device is attached to a
+         * secondary PCI bus (such as when a root port is involved),
+         * finding the parent PCI bus could take O(n)
+         */
+        pci_dev = pci_find_device(pci_bus, pci_bus_num, devfn);
+
+        vfu_ctx = pci_dev->irq_opaque;
+
+        g_assert(vfu_ctx);
+
+        vfu_irq_trigger(vfu_ctx, 0);
+    }
+}
+
+static MSIMessage vfu_object_msi_prepare_msg(PCIDevice *pci_dev,
+                                             unsigned int vector)
+{
+    MSIMessage msg;
+
+    msg.address = 0;
+    msg.data = vector;
+
+    return msg;
+}
+
+static void vfu_object_msi_trigger(PCIDevice *pci_dev, MSIMessage msg)
+{
+    vfu_ctx_t *vfu_ctx = pci_dev->irq_opaque;
+
+    vfu_irq_trigger(vfu_ctx, msg.data);
+}
+
+static void vfu_object_setup_msi_cbs(VfuObject *o)
+{
+    o->default_msi_trigger = o->pci_dev->msi_trigger;
+    o->default_msi_prepare_message = o->pci_dev->msi_prepare_message;
+    o->default_msix_prepare_message = o->pci_dev->msix_prepare_message;
+
+    o->pci_dev->msi_trigger = vfu_object_msi_trigger;
+    o->pci_dev->msi_prepare_message = vfu_object_msi_prepare_msg;
+    o->pci_dev->msix_prepare_message = vfu_object_msi_prepare_msg;
+}
+
+static void vfu_object_restore_msi_cbs(VfuObject *o)
+{
+    o->pci_dev->msi_trigger = o->default_msi_trigger;
+    o->pci_dev->msi_prepare_message = o->default_msi_prepare_message;
+    o->pci_dev->msix_prepare_message = o->default_msix_prepare_message;
+}
+
+static void vfu_msix_irq_state(vfu_ctx_t *vfu_ctx, uint32_t start,
+                               uint32_t count, bool mask)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    Error *err = NULL;
+    uint32_t vector;
+
+    for (vector = start; vector < count; vector++) {
+        msix_set_irq_state(o->pci_dev, vector, mask, &err);
+        if (err) {
+            VFU_OBJECT_ERROR(o, "vfu: %s: %s", o->device,
+                             error_get_pretty(err));
+            error_free(err);
+            err = NULL;
+        }
+    }
+}
+
+static void vfu_msi_irq_state(vfu_ctx_t *vfu_ctx, uint32_t start,
+                              uint32_t count, bool mask)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    Error *err = NULL;
+    uint32_t vector;
+
+    for (vector = start; vector < count; vector++) {
+        msi_set_irq_state(o->pci_dev, vector, mask, &err);
+        if (err) {
+            VFU_OBJECT_ERROR(o, "vfu: %s: %s", o->device,
+                             error_get_pretty(err));
+            error_free(err);
+            err = NULL;
+        }
+    }
+}
+
+static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
+{
+    vfu_ctx_t *vfu_ctx = o->vfu_ctx;
+    int ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (msix_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                       msix_nr_vectors_allocated(pci_dev));
+        vfu_setup_irq_state_callback(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                     &vfu_msix_irq_state);
+    } else if (msi_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                       msi_nr_vectors_allocated(pci_dev));
+        vfu_setup_irq_state_callback(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                     &vfu_msi_irq_state);
+    }
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    vfu_object_setup_msi_cbs(o);
+
+    pci_dev->irq_opaque = vfu_ctx;
+
+    return 0;
+}
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+    int bus_num = pci_bus_num(pci_bus);
+    int max_bdf = PCI_BUILD_BDF(bus_num, PCI_DEVFN_MAX - 1);
+
+    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus,
+                 max_bdf);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -632,6 +788,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o, o->pci_dev);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup interrupts for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -657,6 +820,8 @@ fail:
         o->unplug_blocker = NULL;
     }
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
@@ -716,6 +881,8 @@ static void vfu_object_finalize(Object *obj)
     }
 
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
diff --git a/stubs/vfio-user-obj.c b/stubs/vfio-user-obj.c
new file mode 100644
index 0000000000..79100d768e
--- /dev/null
+++ b/stubs/vfio-user-obj.c
@@ -0,0 +1,6 @@
+#include "qemu/osdep.h"
+#include "hw/remote/vfio-user-obj.h"
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 2e84bce970..be7de50270 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3633,6 +3633,7 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 847d50d88f..c167b3c7a5 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -12,3 +12,4 @@ vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
diff --git a/stubs/meson.build b/stubs/meson.build
index 6f80fec761..d8f3fd5c44 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -60,3 +60,4 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
-- 
2.20.1



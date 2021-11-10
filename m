Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD544BE8C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:26:59 +0100 (CET)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkoj-0005BU-8b
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:26:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkklw-0002L2-Np; Wed, 10 Nov 2021 05:24:05 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkls-0005AO-Cq; Wed, 10 Nov 2021 05:24:03 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA9SpV6032545; 
 Wed, 10 Nov 2021 10:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=jmuPGQCzo0qO9/C4auRdEeatXS21mGscdelM8Ve5Ytg=;
 b=fRtffDCkHrjd2GCG7SCuAm8JdQC1iGK6FIpn2XQoS8eho2sS9KxIUKiYNikednygniKh
 0is+UwwtTnuRCtE8a92S5COjSi4UMNOrAOBlBD6mMUEhvq2agVGFXFYLW2/lk7SyOWNQ
 9OS4AtNUd5uj+CcFqFTGF2+gak3pxBXKBxXtYEvFsxyiylxsUEOWvy+NIm0pOLvCGHYo
 pMEdJCdMkWCbkTFWaVHwM9y9yvLP0P02sJzsY4zJo6D8x9pwAhGAQCh7pe+8sxXToLJd
 UakLvDzibf9KLyOsSVBg6hhTRjZlIAiJlsTz+dF5WnB1WIeI3euVPmPXXG4GNCUDEx8U bA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c82vgap7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAG1m6191438;
 Wed, 10 Nov 2021 10:23:44 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by userp3030.oracle.com with ESMTP id 3c842c1j49-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcQda4BIVowp/KJibbjNMyalFLwAYnazOgrylw2Rvhlrt3/ikwBZSg+ASI2z/iNWeCk2LGdu049b4gy4jGYskkuTsQYub3LY+mk1i1syqz30NuCSwY3UuznfAB5AUt44TPnzGpxJiJikQ1JyRfHqxKB5lNOEnOPzg/iKGGBrYYsmNLCfM4vFKawVySth6LwgM+Ext6xBjXqE9EE3t6lbf4QgKvixOoX/RPSi9nxJdUmG/t5rggx62jXYaKE5BP6reICyIbi6G43Xiwm9SekH/6JnSp8xt39FZAsP3U8nDe1KZ2nt8wxB1jelAer9UFqYzXVXXa8iCyW12yCHrq7fAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmuPGQCzo0qO9/C4auRdEeatXS21mGscdelM8Ve5Ytg=;
 b=mHn7ctlHUf5GW+HVEPcGoDxET/k69KZfuihYDMoD+TTp8vN2wY4IDVxvsa7OPQoUeyYls/3/xm5BR/TxG9eG90+8qYpISqE16JcjT+QASq/1fJFwsgoe8gzae3l7dNuvGiwO09l6jatn7BUQoLlhD8GCoWqrFMa8ioeJ9CcUkMHA7OjnbqyJvEYBKEUGTHOHVGZgzISsC3HcmtgzKdnS8LIR0qaR5/R8hcZM5gp5Zdgs+Tq4zEZPQCX2iv06S/SPfgVCu2SutoHsUUfrGrSu128CHG2yBhQJzMMgXj0aDVnf4Jm2Tc1hke5MO9O6RJn/CsFdrcFayC+stvLM3eObFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmuPGQCzo0qO9/C4auRdEeatXS21mGscdelM8Ve5Ytg=;
 b=FzNZpbCbsPDm+9p7T3RMkDYzIOXQsNZbZOUz+Tr6pDbHsXSTn8YATTFRWzqPw2n+PpP0yuFGo2/oGWHt1p3x4VUBtN9G1rrTkF3ryc5WEGAG4QaS/OxODnA38f5lzU+c381FbTqUED24sE9/NrdAIIn+VR2gq02U65i9DWZ+0kg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4727.namprd10.prod.outlook.com (2603:10b6:510:3f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 10:23:41 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:23:41 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 1/8] virtio: drop name parameter for virtio_init()
Date: Wed, 10 Nov 2021 05:23:05 -0500
Message-Id: <1636539792-20967-2-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.43) by
 SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Wed, 10 Nov 2021 10:23:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cdac075-0d27-4b61-9c14-08d9a4342ac3
X-MS-TrafficTypeDiagnostic: PH0PR10MB4727:
X-Microsoft-Antispam-PRVS: <PH0PR10MB472741C885E5021CBFCAE2BBE8939@PH0PR10MB4727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hMhsquJAJxBj3IrrYADLbUw5qJnOBbWS94Je5/zi28F3wo8LegTwf+rK9eY19xyTrons4OgRMayD/YneYCp+mM992FLTTY5G9dX/yCajcJW6jklh9bGRfKsTT5jqcI+FTAmQVrBTf2wzq7SP8rlr4muNsxb3xrTzJZO+/Ve4LgKgPvau/Y6RLou4AtBvbpKt8DI4uxQyrzgY6LjDs+fgCVxzvAp+jsKJtpmS/TOZkvxRo8Phft0DkJsMxYq9l8/AxIBZnQB3qNSr/VjrrA6ILbbCVNaCLqiX4ZJZ4vRZU6/Rvn6DxsORtAaqNMah64lBejcgYVWjga6LmzYriavWx4uw0S7Rb845Js27s6v5kejq3dyMGy2Y2sTuna/GAMnTHJPCP/HfVDGoEe70+6fgIBpdePeJNf9wfm2x4vg/9Fk6U1Ecr7hGWeLPDK4E/6Al25tN6gMMhd3SeOFqDzbEFx5uT9EP05rAiN8yZoMJUBDD/8gm6Zt93GtdTBDkgQ+3PzCd8MpRp39pVX6NroxRPm2RqgzHkmb7JY33PV+BMBN+MRG+gQZ7TK1Qk4O3ZsPzvV64u+99xF5LENmCWvbHNQnH/R61rP9xKg/GFHtZIB44wC+FvU1vhYFsmmR8oNLF2MSWPPWn92kVPKwayoh2WqThnS7OkhTJ/3BluSXjdIcs329VMOp2iCUGCD/93jxfnxTODA2LKbVlsIQqIPbIDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(30864003)(36756003)(66556008)(8676002)(7416002)(6486002)(66476007)(26005)(5660300002)(66946007)(83380400001)(186003)(4326008)(44832011)(86362001)(7696005)(38100700002)(38350700002)(6916009)(52116002)(2906002)(508600001)(8936002)(956004)(6666004)(2616005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?42oVVkKC7tX7QASSJA5zKyww2T3+QsfNEt8QOeRovuafjCFwyZAK3XqgE8GV?=
 =?us-ascii?Q?QFFeQXrm8U/rZXiTzVVIBzecDq5AwJ2C//3wcPCoZd7jvDJupKKqx2NgDczL?=
 =?us-ascii?Q?8HwvQWlZ0gL3jvP4GxA8jV7aTkTQijykcfARqf15gEXHmbCOWA52MYI7uAj8?=
 =?us-ascii?Q?9NM7SXOi+veMrDMJoZISS2VdJK1evb9cXI4Xfn7v/dRrMU5UnZEvWCHQRrHv?=
 =?us-ascii?Q?/YImqDoECJZJhsb2Iy1V6hUme/5RY1QX4Jn8hi50F52T3kRNF498oO+to/al?=
 =?us-ascii?Q?CLr32UoyvcZIa3egUeDt+xYGG3LP5smvHXgaNfEci2NiGvivGRkcOX3CcjlT?=
 =?us-ascii?Q?grtwx5TYlGPuPK0HayeSNZldyEUG6SOYewiSEvgCUTb5im/2RZTvOAui4SF+?=
 =?us-ascii?Q?6YtF/7odxgdrALb/X38F+5TymoIQtUTsb5V8gE7HBpVLyxF19efCfgmxSNLR?=
 =?us-ascii?Q?z1/VL1nHsQ8yBAmNinyzdjYpw9FrVzJv2KyV/7OVbc1+HaI0DNl8ECL6rgRc?=
 =?us-ascii?Q?kN+0+IsXyE+zhyRI06WD0j+bNpX9Ox5txb8Tlcn9VEc6xKuPrUsmp6JvvTnR?=
 =?us-ascii?Q?eLWP48J+wiabmlKT1CLqxSs+we0yaNpHoY2zaE/442P8+8c4Gd5WIGHTXZCo?=
 =?us-ascii?Q?q3qUZ6HVcg0ZNvol474BkPvyI2r5SVx/zhoe8FYuruzDBfGdSlP/KulqBDB7?=
 =?us-ascii?Q?bb6Q0Me7vyHUAulrtSmZapoS4xZ0Fa+WxWSKQDdOsO+g0Z5sD+dQz8UcmaFN?=
 =?us-ascii?Q?aIciuwV0yJ5c5fX0YQsePk0kvDBzmv1YWHW0lX5mPFVFmxzBA9RWyl31YrF4?=
 =?us-ascii?Q?OIcadSjoL/0017PBn1ogKsXo2hwmFuAujbosMNptV8FCCij0fs4jW05W3yW5?=
 =?us-ascii?Q?wWVbq+UtpzjFTnHXbZY+kTd4kQgPqBtei2KEwvbGIXPksvbq4iSUX0Huz9dd?=
 =?us-ascii?Q?3g1/jIACHxHdVGSc9YT5IoU+y9jWHT0MAqByDg/FDwZB0UFloYGmxMBjEl7l?=
 =?us-ascii?Q?etM9g8MZ+XaPF7oQyMSXBrmvhC0/nC7aLPxvhoR7MF7eO1bxovO/Is9937Mc?=
 =?us-ascii?Q?3CuikAkl7irnACKysRp8iqN+UrImgWGMVELJFp896qPJnWSS0lWsXp5gNaOM?=
 =?us-ascii?Q?yQ6/6d5R+A1NkXwijT47bVe2qaymnXpZnT0nYjceZ4QchxsrPh+tj0GwOxPu?=
 =?us-ascii?Q?0YBlehxtWVHDdcxxCpGy7ditK+n315OfgRhuM2eRV8UXulfvYfwhphy36gl2?=
 =?us-ascii?Q?ZOzc15LX2RtplgUwltK4Uu0IGMsmOJx+KBLmQ4L5oqdQDs+hZ1zSTyhFqWgU?=
 =?us-ascii?Q?ORYLZPuuywb5LrEHvmZJH3qMksl+91xvd7u+Rc6ACBGB0yDl5CfLe0WbjsfU?=
 =?us-ascii?Q?m3KxDHf0RwMZ92DZ/k9LuiObq4k2/pDBb/OFulGMljBlI8mtVJEIK3E1VHAT?=
 =?us-ascii?Q?SJK6AmrMyuNqpBK8zC3EweeW6bUwz+scNvES8FFmzva0VvFz3BHrK/BZGsvu?=
 =?us-ascii?Q?TgfbZfnQuN5VDnM2c9wEskLvdwkPFPowjqk/i7zuZhprBQ1Ogr911cRTJNsX?=
 =?us-ascii?Q?Jv1g/O0yM6QMvS1aFU9lPBdvSzksYi8pDH9rMuazgDvyI+HjrY+i8VFLFFtK?=
 =?us-ascii?Q?U6RY6L/ymsvXlMBj8iR0QIs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdac075-0d27-4b61-9c14-08d9a4342ac3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:23:41.3717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvXITyVAO4VLsl0ZdfDJwzVDqsK9WOtr1d/kAWleC5x/fktE2EZiKhDalL/Ngcd2RThVz43OUjOM1vqTQcvV6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4727
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100056
X-Proofpoint-ORIG-GUID: FeL8yNDo4oWytgvsrbnEf9CVKJ5pCtCe
X-Proofpoint-GUID: FeL8yNDo4oWytgvsrbnEf9CVKJ5pCtCe
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch drops the name parameter for the virtio_init function.

The pair between the numeric device ID and the string device ID
(name) of a virtio device already exists, but not in a way that
lets us map between them.

This patch will let us do this and removes the need for the name
parameter in virtio_init().

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/9pfs/virtio-9p-device.c                  |  2 +-
 hw/block/vhost-user-blk.c                   |  2 +-
 hw/block/virtio-blk.c                       |  2 +-
 hw/char/virtio-serial-bus.c                 |  4 +--
 hw/display/virtio-gpu-base.c                |  2 +-
 hw/input/virtio-input.c                     |  3 +-
 hw/net/virtio-net.c                         |  2 +-
 hw/scsi/virtio-scsi.c                       |  3 +-
 hw/virtio/vhost-user-fs.c                   |  3 +-
 hw/virtio/vhost-user-i2c.c                  |  6 +---
 hw/virtio/vhost-user-rng.c                  |  2 +-
 hw/virtio/vhost-user-vsock.c                |  2 +-
 hw/virtio/vhost-vsock-common.c              |  4 +--
 hw/virtio/vhost-vsock.c                     |  2 +-
 hw/virtio/virtio-balloon.c                  |  3 +-
 hw/virtio/virtio-crypto.c                   |  2 +-
 hw/virtio/virtio-iommu.c                    |  3 +-
 hw/virtio/virtio-mem.c                      |  3 +-
 hw/virtio/virtio-pmem.c                     |  3 +-
 hw/virtio/virtio-rng.c                      |  2 +-
 hw/virtio/virtio.c                          | 45 +++++++++++++++++++++++++++--
 include/hw/virtio/vhost-vsock-common.h      |  2 +-
 include/hw/virtio/virtio-gpu.h              |  3 +-
 include/hw/virtio/virtio.h                  |  3 +-
 include/standard-headers/linux/virtio_ids.h |  1 +
 25 files changed, 68 insertions(+), 41 deletions(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 54ee93b..5f522e6 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -216,7 +216,7 @@ static void virtio_9p_device_realize(DeviceState *dev, Error **errp)
     }
 
     v->config_size = sizeof(struct virtio_9p_config) + strlen(s->fsconf.tag);
-    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size);
+    virtio_init(vdev, VIRTIO_ID_9P, v->config_size);
     v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
 }
 
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index ba13cb8..f61f8c1 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -490,7 +490,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
+    virtio_init(vdev, VIRTIO_ID_BLOCK,
                 sizeof(struct virtio_blk_config));
 
     s->virtqs = g_new(VirtQueue *, s->num_queues);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7..505e574 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1213,7 +1213,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 
     virtio_blk_set_config_size(s, s->host_features);
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
+    virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
     s->blk = conf->conf.blk;
     s->rq = NULL;
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index f01ec21..232f4c9 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1044,8 +1044,8 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
                             VIRTIO_CONSOLE_F_EMERG_WRITE)) {
         config_size = offsetof(struct virtio_console_config, emerg_wr);
     }
-    virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
-                config_size);
+
+    virtio_init(vdev, VIRTIO_ID_CONSOLE, config_size);
 
     /* Spawn a new virtio-serial bus on which the ports will ride as devices */
     qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index c8da480..5411a7b 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -170,7 +170,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     }
 
     g->virtio_config.num_scanouts = cpu_to_le32(g->conf.max_outputs);
-    virtio_init(VIRTIO_DEVICE(g), "virtio-gpu", VIRTIO_ID_GPU,
+    virtio_init(VIRTIO_DEVICE(g), VIRTIO_ID_GPU,
                 sizeof(struct virtio_gpu_config));
 
     if (virtio_gpu_virgl_enabled(g->conf)) {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 54bcb46..5b5398b 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -257,8 +257,7 @@ static void virtio_input_device_realize(DeviceState *dev, Error **errp)
     vinput->cfg_size += 8;
     assert(vinput->cfg_size <= sizeof(virtio_input_config));
 
-    virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
-                vinput->cfg_size);
+    virtio_init(vdev, VIRTIO_ID_INPUT, vinput->cfg_size);
     vinput->evt = virtio_add_queue(vdev, 64, virtio_input_handle_evt);
     vinput->sts = virtio_add_queue(vdev, 64, virtio_input_handle_sts);
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f2014d5..b275acf 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3383,7 +3383,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     }
 
     virtio_net_set_config_size(n, n->host_features);
-    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size);
+    virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
 
     /*
      * We set a lower limit on RX queue size to what it always was.
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 51fd095..ce71939 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -972,8 +972,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
     VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(dev);
     int i;
 
-    virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
-                sizeof(VirtIOSCSIConfig));
+    virtio_init(vdev, VIRTIO_ID_SCSI, sizeof(VirtIOSCSIConfig));
 
     if (s->conf.num_queues == VIRTIO_SCSI_AUTO_NUM_QUEUES) {
         s->conf.num_queues = 1;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index c595957..b875640 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -219,8 +219,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
-                sizeof(struct virtio_fs_config));
+    virtio_init(vdev, VIRTIO_ID_FS, sizeof(struct virtio_fs_config));
 
     /* Hiprio queue */
     fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index d172632..efc6fc0 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -14,10 +14,6 @@
 #include "qemu/error-report.h"
 #include "standard-headers/linux/virtio_ids.h"
 
-/* Remove this once the header is updated in Linux kernel */
-#ifndef VIRTIO_ID_I2C_ADAPTER
-#define VIRTIO_ID_I2C_ADAPTER                34
-#endif
 
 static void vu_i2c_start(VirtIODevice *vdev)
 {
@@ -220,7 +216,7 @@ static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
+    virtio_init(vdev, VIRTIO_ID_I2C_ADAPTER, 0);
 
     i2c->vhost_dev.nvqs = 1;
     i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 209ee5b..08bccba 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -203,7 +203,7 @@ static void vu_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     rng->req_vq = virtio_add_queue(vdev, 4, vu_rng_handle_output);
     if (!rng->req_vq) {
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 52bd682..0f8ff99 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -107,7 +107,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+    vhost_vsock_common_realize(vdev);
 
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 3f37712..e8f6249 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -220,11 +220,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+void vhost_vsock_common_realize(VirtIODevice *vdev)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    virtio_init(vdev, name, VIRTIO_ID_VSOCK,
+    virtio_init(vdev, VIRTIO_ID_VSOCK,
                 sizeof(struct virtio_vsock_config));
 
     /* Receive and transmit queues belong to vhost */
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 478c0c9..3d4ede9 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -166,7 +166,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    vhost_vsock_common_realize(vdev);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index c6962fc..641a394 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -885,8 +885,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
     VirtIOBalloon *s = VIRTIO_BALLOON(dev);
     int ret;
 
-    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
-                virtio_balloon_config_size(s));
+    virtio_init(vdev, VIRTIO_ID_BALLOON, virtio_balloon_config_size(s));
 
     ret = qemu_add_balloon_handler(virtio_balloon_to_target,
                                    virtio_balloon_stat, s);
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb..cca5237 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -810,7 +810,7 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO, vcrypto->config_size);
+    virtio_init(vdev, VIRTIO_ID_CRYPTO, vcrypto->config_size);
     vcrypto->curr_queues = 1;
     vcrypto->vqs = g_malloc0(sizeof(VirtIOCryptoQueue) * vcrypto->max_queues);
     for (i = 0; i < vcrypto->max_queues; i++) {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1b23e8e..92c5eb7 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -973,8 +973,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
-    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
-                sizeof(struct virtio_iommu_config));
+    virtio_init(vdev, VIRTIO_ID_IOMMU, sizeof(struct virtio_iommu_config));
 
     memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d5a5781..e217520 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -769,8 +769,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
                         vmem->block_size;
     vmem->bitmap = bitmap_new(vmem->bitmap_size);
 
-    virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
-                sizeof(struct virtio_mem_config));
+    virtio_init(vdev, VIRTIO_ID_MEM, sizeof(struct virtio_mem_config));
     vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
 
     host_memory_backend_set_mapped(vmem->memdev, true);
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index d1aeb90..8cbbd78 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -123,8 +123,7 @@ static void virtio_pmem_realize(DeviceState *dev, Error **errp)
     }
 
     host_memory_backend_set_mapped(pmem->memdev, true);
-    virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
-                sizeof(struct virtio_pmem_config));
+    virtio_init(vdev, VIRTIO_ID_PMEM, sizeof(struct virtio_pmem_config));
     pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
 }
 
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index cc8e9f7..7e12fc0 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -215,7 +215,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     vrng->vq = virtio_add_queue(vdev, 8, handle_input);
     vrng->quota_remaining = vrng->conf.max_bytes;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index cc69a9b..be98b4d 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -133,6 +133,45 @@ struct VirtQueue
     QLIST_ENTRY(VirtQueue) node;
 };
 
+const char *virtio_device_names[] = {
+    [VIRTIO_ID_NET] = "virtio-net",
+    [VIRTIO_ID_BLOCK] = "virtio-blk",
+    [VIRTIO_ID_CONSOLE] = "virtio-serial",
+    [VIRTIO_ID_RNG] = "virtio-rng",
+    [VIRTIO_ID_BALLOON] = "virtio-balloon",
+    [VIRTIO_ID_IOMEM] = "virtio-iomem",
+    [VIRTIO_ID_RPMSG] = "virtio-rpmsg",
+    [VIRTIO_ID_SCSI] = "virtio-scsi",
+    [VIRTIO_ID_9P] = "virtio-9p",
+    [VIRTIO_ID_MAC80211_WLAN] = "virtio-mac-wlan",
+    [VIRTIO_ID_RPROC_SERIAL] = "virtio-rproc-serial",
+    [VIRTIO_ID_CAIF] = "virtio-caif",
+    [VIRTIO_ID_MEMORY_BALLOON] = "virtio-mem-balloon",
+    [VIRTIO_ID_GPU] = "virtio-gpu",
+    [VIRTIO_ID_CLOCK] = "virtio-clk",
+    [VIRTIO_ID_INPUT] = "virtio-input",
+    [VIRTIO_ID_VSOCK] = "vhost-vsock",
+    [VIRTIO_ID_CRYPTO] = "virtio-crypto",
+    [VIRTIO_ID_SIGNAL_DIST] = "virtio-signal",
+    [VIRTIO_ID_PSTORE] = "virtio-pstore",
+    [VIRTIO_ID_IOMMU] = "virtio-iommu",
+    [VIRTIO_ID_MEM] = "virtio-mem",
+    [VIRTIO_ID_SOUND] = "virtio-sound",
+    [VIRTIO_ID_FS] = "vhost-user-fs",
+    [VIRTIO_ID_PMEM] = "virtio-pmem",
+    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
+    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
+    [VIRTIO_ID_BT] = "virtio-bluetooth"
+};
+
+static const char *virtio_id_to_name(uint16_t device_id)
+{
+    assert(device_id < G_N_ELEMENTS(virtio_device_names));
+    const char *name = virtio_device_names[device_id];
+    assert(name != NULL);
+    return name;
+}
+
 /* Called within call_rcu().  */
 static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
 {
@@ -3235,8 +3274,8 @@ void virtio_instance_init_common(Object *proxy_obj, void *data,
     qdev_alias_all_properties(vdev, proxy_obj);
 }
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                 uint16_t device_id, size_t config_size)
+void virtio_init(VirtIODevice *vdev, uint16_t device_id,
+                 size_t config_size)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
@@ -3265,7 +3304,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
         vdev->vq[i].host_notifier_enabled = false;
     }
 
-    vdev->name = name;
+    vdev->name = virtio_id_to_name(device_id);
     vdev->config_len = config_size;
     if (vdev->config_len) {
         vdev->config = g_malloc0(config_size);
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index d8b565b..076b7ab 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -44,7 +44,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
 void vhost_vsock_common_stop(VirtIODevice *vdev);
 int vhost_vsock_common_pre_save(void *opaque);
 int vhost_vsock_common_post_load(void *opaque, int version_id);
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
+void vhost_vsock_common_realize(VirtIODevice *vdev);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
 uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
                                          Error **errp);
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index acfba7c..ac487d2 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -22,6 +22,7 @@
 #include "sysemu/vhost-user-backend.h"
 
 #include "standard-headers/linux/virtio_gpu.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
@@ -37,8 +38,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUGL, VIRTIO_GPU_GL)
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
 OBJECT_DECLARE_SIMPLE_TYPE(VhostUserGPU, VHOST_USER_GPU)
 
-#define VIRTIO_ID_GPU 16
-
 struct virtio_gpu_simple_resource {
     uint32_t resource_id;
     uint32_t width;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cf..bfc73ec 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -165,8 +165,7 @@ struct VirtioDeviceClass {
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                         uint16_t device_id, size_t config_size);
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
 void virtio_cleanup(VirtIODevice *vdev);
 
 void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index 4fe842c..3957d11 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -55,6 +55,7 @@
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_I2C_ADAPTER           34 /* virtio I2C adapater */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
1.8.3.1



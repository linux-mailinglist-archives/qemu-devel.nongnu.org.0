Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B493212C3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:10:39 +0100 (CET)
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7Ek-0004I5-2j
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lE7CP-0002Gj-3Y; Mon, 22 Feb 2021 04:08:13 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lE7CF-00007p-HK; Mon, 22 Feb 2021 04:08:12 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M95FlI086671;
 Mon, 22 Feb 2021 09:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=BT1qBXNvbCWr6Dl2wzL5WtzrR/imAt0aO+/Vl1qnl64=;
 b=x+wCL9RqPDBKVcs4IiBjhC6lpdaLYo4q8ET+BvviT+7QqAs0LgzZbFszMwvj5rOfgU4M
 2V8LjbVfxt1lOH1+SxzcagoAq4CbJw/g4F58uJKiB5QFTltujchFmB8MQQZzkerJDB/7
 jc2zJgaQQyMZVuUwxAfmuUJ/M2W57DRvkIHUbe3hp90/MAQOVpzmj65Q0hXqN+Jt6uE2
 qOzPiZFXzbeKYW0avYyPTicT/5HLzle+lhbSa4hTyYdVupY/AvVAzQ53k4tNFSSQCI5m
 kLxOR9q8z55QPbMVEiQBVmpMud4fv0lbXaNIazqQNYEWlr/lSgex3h3LTZIHoiNJqKZP Vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 36tsuqtuu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 09:07:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M960cP181046;
 Mon, 22 Feb 2021 09:07:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3020.oracle.com with ESMTP id 36uc6q2xgn-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 09:07:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyDFBPdub+6nIlEkqav6dqLNvlDHM28oisuMUF4XjKRfNytFlL8xZpv7mEA3tc/PwQTEs8eRlC2rvkjQ9klUOgn1OtuiXbuXKdj60FomTCrpgXpo965meDxnmzz2idWspbg3FYorDP7D8hGUAfrsYwBcqTIRv7f2pVYoW4XVziYMKaRxNr1vgXSvUrU078mKcw3aScddFVoQpsOci1TqswTb7pXkgD4F8okEomJ8rjxz3OEKxSvXUHkWfkaIxCymlhbeU7YePzqr8Ryx0rsAaK+aWvZlLgLKlWcV6h/OH6C0CWqTVrOjupIzYS/7c9VkeIEaQVukpPbzYINK4li9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT1qBXNvbCWr6Dl2wzL5WtzrR/imAt0aO+/Vl1qnl64=;
 b=aA5ApYhwHfXnerB8pxeW0JC1hUiWac9Dt5U40VbP1qiTWajh2NY2Fe8lF0ptgf5dLX59zNHKzVsLeS/GQTVKXtlgPbM3YoQ24IAOl6RXGPxzHHq40KA0KITj++OvCxqEIWu9ASFVdXSLHrc/A9HXOTzkjOkIzbIwuo32cOGso0nToQheaMXyjr8WUAirSnZPHtLD+zBS3c8WQwkXKunRomG8EmyuDIFRWVzd0PIPQKXcBXf7/82j0OdLS35CyXPJhDmBq9nCLNF1rj9OM+zWfr8X6M0Ic2OgufVwdWaByF7vUVwrKKnGxr5SY19NJ/WpMF1LMJfyrEIj9tlCrEOodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT1qBXNvbCWr6Dl2wzL5WtzrR/imAt0aO+/Vl1qnl64=;
 b=WXjGqtnOYszO1SL9TxNq00IXh5NiBY0sznH1XMOuAOol8zyBgjiQGP6yxIRX5bhcg9uE6trVIMBPkqwvtkqgQKqz4iUh1KxSsWuC9JUyrMdr2a2RB2c7my9zvjGI0sGceCtgAhYidJQuku/ABxpSZDul4OIm1Qpto/066ToIL+M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3227.namprd10.prod.outlook.com (2603:10b6:5:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 22 Feb
 2021 09:07:55 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 09:07:55 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/3] hw/pflash_cfi01: Correct the type of PFlashCFI01.ro
Date: Mon, 22 Feb 2021 09:07:46 +0000
Message-Id: <20210222090747.2310104-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222090747.2310104-1-david.edmondson@oracle.com>
References: <20210222090747.2310104-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::34) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Mon, 22 Feb 2021 09:07:54 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id d79528b8;
 Mon, 22 Feb 2021 09:07:47 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c39e66a-e5ce-4189-5a94-08d8d7115751
X-MS-TrafficTypeDiagnostic: DM6PR10MB3227:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3227A0A0EEDF3F1CB0393B6988819@DM6PR10MB3227.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tuSWFDC4PcuLyOh8L+oRIuFHddooLaDYaa4sqMVd6TdKRigL2OT/9szzXk3vv79KGXSl0bMALuB+tDzf4bsVWqXbSEeYzHdLIr0dwvLounhbL86/FCLcPA09LPKFsxy70APqY1tfzH8ZLkNcmzzaBh3P/JVBEpHRgpYsrpfJ+QTNNymVv9rc8SMGCAtn6SVeeqMpfdtYEZFbdSoF223JNo6kql6+gQSSh1tg1YKjYBolmu1872BBsDVVxbQEpotwon8dHUh20omvvBTmPUY6nko/sKRPgW2DK9a2/3V9bYCV/IL/y9ZIpmH2b/+ZsLsIUUlN+cqyqwLDnFPF1+1vixVeHecg9eZJoh+rllO9wAVk4Aq4dqVBnzezcbaqFlUMeYtgZOrs3ZyL/NKqrWg0CRdwi2OzXlvO/Irh5tjGPm8YHrN4WBTWvg6Z16B/vSJFzCw+vZPOmFgGlJWEDva48/fQeE2YfCxWrPYUORqjQ119pl3s9qtdPs6tV0C5FWPcuW1kq9hkq++0rFVwpFnTvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(396003)(39860400002)(136003)(4744005)(54906003)(2616005)(52116002)(8676002)(83380400001)(5660300002)(36756003)(316002)(186003)(44832011)(66476007)(107886003)(478600001)(66946007)(66556008)(86362001)(6916009)(1076003)(4326008)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JVH0A3qDE0buCoyNbsIDdQnJBtyV1m8fQRTqqkY7ZyFj0LW+HJ5N3CtnyeoQ?=
 =?us-ascii?Q?IgLKNHbptmSe+JsGvr15QGqOZzb4a/1ZIAHvI/2HvuaUfY5WqPN4txT8XN+x?=
 =?us-ascii?Q?2/nmfJYLCXQXlgGrlhghpErQ1sbMjPkrly8FoAEzJwBWDqddiop2lfBAJtIQ?=
 =?us-ascii?Q?WC9z84ZpQZy5EVbrWHGaBZqOOooXJb6Wrrb4SEN4Vooha31c7AdMNWarouxc?=
 =?us-ascii?Q?kmuIFI5wGLaAOwRwfLI+iSUl7ZEsvZzPF92TjvZGhGtXshf466xRxEp3obAi?=
 =?us-ascii?Q?pbJ7fOjB0O0JirFkaVnbEJT6hUOjP34Iq6jeHVImekYgUFcRFygdFnql8y22?=
 =?us-ascii?Q?84QGsGYGhuMGF/AslTQGYxAlt4CwxPcNek7kWnk5f7cjBO3KPN3kCyedLFhJ?=
 =?us-ascii?Q?xU6KZpj7cbKSnNNyb6qlm1iAI4jpDofFh6Osge5cB0Qpb7Z9dXk5JSFUxlzL?=
 =?us-ascii?Q?bTj4FXQCK8Ohq0qWAZviw6oo4TFPO78+wiiyd6a/5iiQz24ArareKM5FHYFb?=
 =?us-ascii?Q?DENGay9Q+VTxF0z4Zy3mIKX52LyAhnS49emjGyhovJURZnkxOa5p5C6iRbM8?=
 =?us-ascii?Q?adjUsFpDTcnEX7TSIGCYLS11KuycIILhOI2dOU/1JFj01iyuw6zvuw8eSSil?=
 =?us-ascii?Q?vfn1e+rBxXZ31ku1LDf12rtc4V9ez55sQsqLb2UZERW4tTGI8Iou27DSStM8?=
 =?us-ascii?Q?SNQXsM6u27NGcebNpqrRFGHGBB0zQJuTGsqEMZVMZe7/vGYi3Jg6lEqX62OA?=
 =?us-ascii?Q?EeB6Ly6JIhXUNoHU+ZlFo5+eL60qxaRSnQZPeKey4yqK5xBSVaMQCV9jl5ho?=
 =?us-ascii?Q?87fgTQQpQMPP2q3gtooYmKLDquSVCMrbDcmq/1UYMkDMJAr5SueAzPUXxpso?=
 =?us-ascii?Q?zH5c/NJpwhmJe8W/fY12ZNfwpaHlyIpxQEPBkJXen3RPWkXTLa0bLGwOzrqg?=
 =?us-ascii?Q?ECdB6yXFqZwIRx3a0Re+GZ4zyhs5k9xzsWYDyXxatfn0ZZ3CfBBIP8FtYsmf?=
 =?us-ascii?Q?oN1o68vRCqHJadEm1+OGpBHfP30Uph1eRoYRBKb+widbklH46AYWvhi1NQ25?=
 =?us-ascii?Q?HTepdj7lbyuf3PaTSuBtNYyY+YLU7SCGdguo1QJWVrvXzKnlRzewdGnMt9lo?=
 =?us-ascii?Q?Xp7W9z018goQBTVfZeR3KmoKwSNU8T6Imt1xOlefjBvhuDYfn79TM7uP7L3Q?=
 =?us-ascii?Q?AGOtUizm/gkoSYg7RwvQrDB6zEa8wZSripv7zPk78qe5SNirPJZIRgtJuqTL?=
 =?us-ascii?Q?F180/Liy6VauuuZKazHt5sMebzn6y91TDXgU+9p7K3Xhb/nLp4bAD26Z8h2i?=
 =?us-ascii?Q?/HOEO/ccp85hjv9XuaoM5/m9Apsw1k/jiZnArLOmDG9juA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c39e66a-e5ce-4189-5a94-08d8d7115751
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 09:07:55.5188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B61GBUMahJ1zG7aVFkpLbBaO1bd3hn2b/42ARZrbfhnqvUuNyZ2HFKYm75uHy1hzAM8rF4d3xv5pIM+ZgaBFVOGTs1LJBcrv8/Af2YIJXHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3227
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220081
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PFlashCFI01.ro is a bool, declare it as such.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/pflash_cfi01.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 9e1f3b42c6..6b21b4af52 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -72,7 +72,7 @@ struct PFlashCFI01 {
     uint8_t max_device_width;  /* max device width in bytes */
     uint32_t features;
     uint8_t wcycle; /* if 0, the flash is read normally */
-    int ro;
+    bool ro;
     uint8_t cmd;
     uint8_t status;
     uint16_t ident0;
@@ -738,7 +738,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
             return;
         }
     } else {
-        pfl->ro = 0;
+        pfl->ro = false;
     }
 
     if (pfl->blk) {
-- 
2.30.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D558329796
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:06:24 +0100 (CET)
Received: from localhost ([::1]:32986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0z1-0008Cu-Lx
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lH0wL-0006fH-2n
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:03:37 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lH0wF-0007Gt-QD
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:03:36 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1228xcYc104709;
 Tue, 2 Mar 2021 09:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=AlXIK9APKU/syzIjh8bSVrYyPkdedAfZWamMWxD5N+c=;
 b=swg0f/Uc6tlpDZHIXjKWLA7ImzOiPdRY4Dr5RcQL7ooBtrjSRw2n+Jw/MxMLCiWSmQJ8
 /LJBkoDgWDfU5mSpr26WscePJvujnNTWk6+Bz1hpBLNkgLXEzRKBhR3xOk9FUyXhubZy
 zEQWUyXtpQUOUOMRDLiqTmlWGmLmK1St+52E7Pof0Ao0aNalyCPazL3j4ZRUqFJNvnUt
 /Tcl78JV12Y0VuccEZuYzc34IQupZSOT858hKOMtlFt2jUG2V2/XXgLbfHcFE2L8GBvD
 hDK0+BW2XCImuYUROx3J8KV9hrGFg0nGrA3sZDT7/sHyu7disZvWZje8nBD8g52z7PY0 Ow== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 371hhc05eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Mar 2021 09:03:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12290wIu007521;
 Tue, 2 Mar 2021 09:03:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3030.oracle.com with ESMTP id 37000wpt4s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Mar 2021 09:03:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFhS8QO05o0zG0h7cT/UwAdVGBnj8MykTkM+ABWqCwc3eNpFNy43qFhli5ks2qdv/LNlGY+1S+Yldpf59Ii4rdoI78Cynr+diMrHF/tdPlMu2VhcW365DikxiyWsLShT4jACvp7NJdYoBE2demdaS+YzmH8/+maFtQEj1sIFfnM7Vw9DokC+U6w3VP7BygXqTCZm08JKqE39j5FYKW/fDdhJKdQ82qPKIUzbKFsO/7O3/l6xdOmhmeLkiRCpno9738OYrCnVF94obzOm1yyUildeZUrChS/WfVYfV0l54ctO8r8j3acsWYt2D3CQV2PaZKjcs2ZcWWSN5rdjz5V1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlXIK9APKU/syzIjh8bSVrYyPkdedAfZWamMWxD5N+c=;
 b=dthen9s1d92S5kHnoFdPS1QdSVWeY1P9obzONAHfPhcgaCoQTUYgT6nUSY0I9F6R4OuK1t8UDpwhGjuq5WSMRth7EUmGy8/aflctXypnWtNB/HKf4xPp9x0BeuEynjG5tOikSkafyt6WM5VCnJVyrKK5f+zW7DVtoT8Po7Pa9C4+d01HA+67RldO80kHbCdLkhxXN8blAGC2vS5hsMUeg+zxUUfuTf1QRhZAhixO2eQZknuepqEKl9kxnins6FjwRQ8ft3e9I0tD51kXZw3cz4cwVLVsn1S6WbE/vOFl39WQ/G9UzvpXwOoowf6Z+ymAsS67vx8Wgm5n7DrTaFdCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlXIK9APKU/syzIjh8bSVrYyPkdedAfZWamMWxD5N+c=;
 b=oiwIyhXb7h9/CszrvRsxvH/Mj0ZXvrpTnIq+fe3i4rbd8g/JA7guRWBUnTBWQ01XX0gVjVyQbiJZ/fPgd5SsMDmID+My2pm/R3BUtEI4biiQfAP7JCN75mHfYN4pwSMYaQO7H9OZWuI7DaE36GXrlqDpJNcGH+/kPoVHMFppWgc=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB4396.namprd10.prod.outlook.com (2603:10b6:5:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 09:03:24 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 09:03:24 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] x86/pvh: extract only 4 bytes of start address for 32 bit
 kernels
Date: Tue,  2 Mar 2021 09:03:15 +0000
Message-Id: <20210302090315.3031492-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210302090315.3031492-1-david.edmondson@oracle.com>
References: <20210302090315.3031492-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.25 via Frontend Transport; Tue, 2 Mar 2021 09:03:22 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 1d74e9c9;
 Tue, 2 Mar 2021 09:03:16 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68db5130-9395-413c-87ad-08d8dd5a08c7
X-MS-TrafficTypeDiagnostic: DM6PR10MB4396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB4396B61DBAD1AAB3971B5B9788999@DM6PR10MB4396.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OoOxqQjGppQYDOO5h3UPPdYFyW6TEGkpMsoirVVi/MIdld/XAIZt681RLqfWHICXYhHLsgfXFOV0zKNtipOqlwbqely5+gCFr+jvHl7Fvut8RR0izllkEV6kF2QtkPaPjHo1/XaF9cpN6IR7EEIETCTCihPfR3eVl3bSq3AsXeTGNiKteYlaOmqX/nzIEyu+QEdrC1ZAQhe3gaU9DWtwyP68JOWkZLZriCaoFcB1dMrQz5YqjNAJ3H9tvaTIXufJJUiBSFrxrCOHx6IdRaBwQJUbU0qmUZ3qGCJxG7sHEgm/38bnk3LrPHX2o6PmuWqrIQA5lsFSEU1y8lhp7JHrfe4EL4qwTZMYokYk9sol/wP/Ia82DdL0JnZVgWdz4Oh6Qh0FtS8/pK1AGam5wDdEULOy1GszP6D4ae6jLeenJxiXXdohBIwCY+x93CazusZ9oSu/x1pdIdTmK/usRnfr+yk4CBmqYmTgzlSo/Aei+49ont/sdEpVsCob56O5UV0JDPGgPKAfX0VZqhYbuk/+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(136003)(39860400002)(396003)(6916009)(44832011)(66556008)(2906002)(4326008)(5660300002)(66476007)(52116002)(66946007)(83380400001)(2616005)(36756003)(107886003)(8936002)(8676002)(478600001)(186003)(1076003)(54906003)(86362001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OjjbbC3s2QG8JksVab+dmzdlTg8ioFyc54dDPYXuTSRKu1CHmYitbFDS5faC?=
 =?us-ascii?Q?78AqyD0/YgO8aLO8fjXuJur3wc51zuZHfagn21slxtsV8H52H/25veC7Ay8R?=
 =?us-ascii?Q?5lPeWzac8NnfPxcn9znW4cJG5lrOHd3W5vbOMtWvTm38OH0s6eVKqNI4/MJ+?=
 =?us-ascii?Q?7Y4O4McEiyX/zPcAd/yKBL1WkeWVwdnbbGo1YDPlXLw8Zm3f63h3dBMvdtrI?=
 =?us-ascii?Q?xB+OOxZ8I2ZLNaeiwMaXIi+qZe8E+nbh5xWuYlIZ10o3Ni38Q98zEr0fWi01?=
 =?us-ascii?Q?CngE1CYM2PHxavuispHTAZtekyh0NEeLmzwEG9QIgpOYLGPIXOZQBg9/F3Nf?=
 =?us-ascii?Q?bPiXb2dfCsctnNK8eCgr+HjMBULgO7wze9gJTb+GEhPeeK0ZsYoLdL6RtQg/?=
 =?us-ascii?Q?swYRtDuYDTZt0EGa4xgTZYqajS4WCW32ee0oO+P3poJgmGR9JpCGWllduLFN?=
 =?us-ascii?Q?QUVQlrU0/NEREHHE658rjCs94cDV4vviQkvj4pAkVF6kXwqg94j17xhYxmjR?=
 =?us-ascii?Q?IJl7/pFR2Bzpn2z2iRYfAE8cFLGkyuDVJdQDUYn1VKg8XCCjwJhvVpHTQ0Ra?=
 =?us-ascii?Q?xku4m7RmBzVpAGdIn6kiyPjwtkZaY/SpD2cqHyOQ/cljQ2qBMyRIS2xXOchl?=
 =?us-ascii?Q?dKf2LWvxAqdcKadyrVb30SFiGf4VcbSLyA8FYu/qKmZcTlft3tf7bYdNyuZf?=
 =?us-ascii?Q?28JfFHGg5O6y8aIvxtof4Ji+BBAgw2A2ULnDFk8nEmI7nhSD77DGEXq+27ct?=
 =?us-ascii?Q?Y/5c8DSj63Sy+JqnKcw3Qovmz2EAc9p2R4805rmWH2zOZeQXe8wwOgf14NeR?=
 =?us-ascii?Q?7TjFLDEgo8eGBfCEM1XJAvQjgr3RCISL8F12LTWU/iB7hCxmc/qRJK9LVrti?=
 =?us-ascii?Q?Tti2V42piLbgUTSuzOwuva3hTqldGyLN0AtyyW3DMogAKoNMCS3Gxw2GbKw9?=
 =?us-ascii?Q?CUp/DWr0d/HG4gcnS20QS391oZ4ECs0+x7fuGlKDfT0e3wzCGKe/EEApsMJb?=
 =?us-ascii?Q?UBptLmbwsugMQwrHE2ue9DrSefDEP++2EhCuW8ERB4JU64beGvWi0quBjUBU?=
 =?us-ascii?Q?sqGKSuK3UNROWZxPC7124SScdsR/YCmhf2qDwApBGrVTDDz0Ql0iMxfDPjqi?=
 =?us-ascii?Q?UMp6xZkvz1DA3+t0T6h/fLIB2V6WX3ii4vGHD/mPoikhBSXM5zd7bWEsgti0?=
 =?us-ascii?Q?hCuEwdMNa0MPr4Ah0NlkVTHUMR0a2jLQcQnsfEfOjGvGJqtdUU4yomtB2yXA?=
 =?us-ascii?Q?pBem9k/VKSMxrEA9aqMFfG3SNPkJ+qfan3vpJkT+/4hhujqqZPbP4KcMCFVB?=
 =?us-ascii?Q?/UwohAyBkVVD6XNdwQeXRSIizPMsCjxGIYmh/2HGRj0uyw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68db5130-9395-413c-87ad-08d8dd5a08c7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 09:03:23.9283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLtlv0wHBAPzr7AU1T9pphncOQfjnChJ18SL3fwna0QgEzyh6KKyhwsWhu9rKRa75RmykqGHJimNjQQpAS4C6QoPkFf1iMGWJQl1cf07zSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4396
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020075
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020075
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When loading the PVH start address from a 32 bit ELF note, extract
only the appropriate number of bytes.

Fixes: ab969087da65 ("pvh: Boot uncompressed kernel using direct boot ABI")
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/i386/x86.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6329f90ef9..7865660e2c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -690,6 +690,8 @@ static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
         elf_note_data_addr =
             ((void *)nhdr64) + nhdr_size64 +
             QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
+
+        pvh_start_addr = *elf_note_data_addr;
     } else {
         struct elf32_note *nhdr32 = (struct elf32_note *)arg1;
         uint32_t nhdr_size32 = sizeof(struct elf32_note);
@@ -699,9 +701,9 @@ static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
         elf_note_data_addr =
             ((void *)nhdr32) + nhdr_size32 +
             QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
-    }
 
-    pvh_start_addr = *elf_note_data_addr;
+        pvh_start_addr = *(uint32_t *)elf_note_data_addr;
+    }
 
     return pvh_start_addr;
 }
-- 
2.30.0



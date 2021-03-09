Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9E13329E1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:12:05 +0100 (CET)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe1k-0003Mn-AV
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXH-0002nn-2d; Tue, 09 Mar 2021 09:40:35 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:47294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXC-0003sH-PF; Tue, 09 Mar 2021 09:40:34 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EdtEF002644;
 Tue, 9 Mar 2021 14:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=y/vM4CRvXGH+73nZ87JEj4spvUrwBEeg5m0WJqwfRHk=;
 b=jlWL8VLoTEUmQNMgPktwAX4ibymeWTXLWSIZnsLqGQI64ReLlxXBCYBgfOf6vln/yUMR
 xOvi7fkFRyIoAMs5IVBBqAYwEzInVFdJ/LkBcWh9Q5kNCa/fxbiUk8Vqq4rJIMXREtBT
 zOJUdcnpvIXKo3YSvx++SlPI9UNBGylB2bDULbRxQw5wikNTkwzSALV/S/i2eVOqiCug
 o1k9aba12m1RZul3kLHDOXECB2a1E7lmNX3uoTZdqgwc5+Iqz7bWBBKSkcy7wkUf2QsI
 IoqgeKMylYRrj3yWb46BabDsW322s9jRReqqRhIZTPAnMO7INewrTsoBTL0ZMVqnUkvL Kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 373y8bqmnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EVOYq193150;
 Tue, 9 Mar 2021 14:40:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 374knwwjvh-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6Fmd1qr3Gv6IgjaZ7vKKIbiJaNT8JTjYAqkrReNF9IGoRAwai7ejTgw5ttHRUlykBR2IJsrwFklJ2pbyOVlXDVKtMNGms4SVZ8Tnqpo/27cLBPa2bapw6C7HRInvTG+vBDC51iOd+fNgsFtDOda72B4NxR7gziYNSHduyviQIINtSwr361evKpRKoGv91mLzv297OO2VrcL32hBz6vFDgQ4Czdc0ywnMtZJVWPoFoAqNuPOPEsfUTFW4gcty1snTluTMfe4qy0E36I+mIC7XXPxUTfy76cnBecuirO48xq98OD2a3Ern39vREqTucC1Pfa6JV2kgekIDp8YmqcB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/vM4CRvXGH+73nZ87JEj4spvUrwBEeg5m0WJqwfRHk=;
 b=eGtAp1NwEyAm+MPsr9NVdie2i9c1i1NJ3JOGG3JVmTWRVl+KmVyB3VuFuMoEkhwtsVTWbI5+fVxPC93RSnf3MJ8dIX/N5BKE4hPQHV9yRck++I5qeqt5kQdPaCX3RuVu4fFk2vGksI7i3NHO67w2sDnUwTROxc1JHmiZcjVFTHS4UxAD19NGv3CMjM/giwpX6kEwx94pIRFG9YFs57XpGfFnltMUL/FGqa2q5F8gqSDeCGySJZ/F+I47XJvdJWr3Nt7P5ATvOmYPSWTgB0SzNpCbQ9eZED64/lbB3jR06I+UfVzr1bULvHDsNOA+5MlDXt8oSVN0D3y1Y5C9KPknMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/vM4CRvXGH+73nZ87JEj4spvUrwBEeg5m0WJqwfRHk=;
 b=MeYwFPf1dbTmMTp9Z7ftye5s5B7cA+5NKfUX7KSV0CoB1VcooERIYNKb1YQowYFia6qLkli/t9bS1w9pDvJGfcKMvlptKIYxdkhZQjIbx0ROMhOa0pWAPMs28nH1suvsxAkGngiIKA8XRPk3QojvW+eL5n5A9dVrlhuDUPaSEg4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR10MB1771.namprd10.prod.outlook.com (2603:10b6:4:8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.29; Tue, 9 Mar 2021 14:40:23 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 14:40:23 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] block/vdi: Don't assume that blocks are larger than
 VdiHeader
Date: Tue,  9 Mar 2021 14:40:11 +0000
Message-Id: <20210309144015.557477-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309144015.557477-1-david.edmondson@oracle.com>
References: <20210309144015.557477-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0438.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::11) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0438.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 14:40:21 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 095b5918;
 Tue, 9 Mar 2021 14:40:15 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d4663a1-f6d8-4aab-b689-08d8e309453c
X-MS-TrafficTypeDiagnostic: DM5PR10MB1771:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB17717F182DF389F8B842270488929@DM5PR10MB1771.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F1dQskkn7y0AXDm+AaH+Fe+YpNDvxbTpxt4L8+/iVAN3EcKmAkoaQEvznYutU0HF9D2BPY4o9BjDvZMNlA1lGO54Vrisplcp/MwXcj+YubLibiGRKIu/073s8QFekOjvsVOObvX4h6lriZxlTOBrPC9ez/iZpw2Tr9CwOW+moAkoTme/DHErfWgVIpLjXskumau2ptiDbr0RBY1MMD1WqZR+kQK4U0yewLly2EPYtZCMuD+2qtmkD+ItwIk6xjtS0YP283oEWCxE3+W1/gQv1DIVWgxrKQ5L1lQ4kTmQOAoLPaMzhqiuNd6JuSnAQRk7hHc/U+pfSzjh9b4TowLwtqf50HKSeOITYar5pJhh2yIKBTtkdmEvmIbnuG/ymPOriPtqjGYITiARqewCLMZohrPJOZ2k8Y+DQwcMGYyFuJYnob3cJH8wjjdjlx09acRchMYE6YN2s4cwDmfjGDnhLyoog9gXwQ672OgudDDTVyEwzZfD1d3ySiVJSlUB5HdDBUG8+7AaPH+vZ2QLMVmsKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(86362001)(186003)(83380400001)(66946007)(44832011)(316002)(52116002)(1076003)(36756003)(8676002)(8936002)(107886003)(54906003)(66556008)(6916009)(478600001)(2616005)(5660300002)(4326008)(2906002)(6666004)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?78KExhegtJqtUrxFEEAC+tC8C/tTaRO/zAP33zG/XWgspl98DCAuX6zBxK7N?=
 =?us-ascii?Q?B4AEQsv2DFLRIEDbmyNLD/SxjbOc1GL5cL0Ql4hM6FqvMrOrtg7O2Xsor8hz?=
 =?us-ascii?Q?Q4mosGG6oxnTJk9XgrJnPlxZs/xyPjsZNbImsP/1xLPi6vEA+krsNt2rkzp/?=
 =?us-ascii?Q?c1jQi3lS6/zPRWyRlq785o6KShLUeWctLcHuGPVD81WbZtOKDJOe61R1tHXY?=
 =?us-ascii?Q?ix8gfKZDtNEzJvJk/o/eTZ6R08sqm/U/T3jtA5AkNQ2P3DwPROyRRKdd5o83?=
 =?us-ascii?Q?O2nI36wBpaxPBraM3WPSb19HJbY4ilwSV/2prNsPS3vFwXT3zQiAhYEPXIPM?=
 =?us-ascii?Q?Bix0waFJYc3swGaWf81o4wC6pDy0l8esqx5VyUJrvYYcApj3kSeeTip84maN?=
 =?us-ascii?Q?yneIEIqqTOm6PlvXOgdAs2DvM42qDjKUsMM2LD1HZj3Mn1kC/kCM7jgJ7OcN?=
 =?us-ascii?Q?qSOO+Dbi5sfq6oTWFEsDgwKrK+M0TY6iFxMzc7uJkj5LEcPuVVICzktw4Sie?=
 =?us-ascii?Q?b4ZTsJMFGdnFVW+SOy6urHbqFpvhWz3kuh/I3kQUsCOesdGWSBP9fXDI4Gv7?=
 =?us-ascii?Q?4wDQVNHghwZctCPhJ/sIrwgLbjf0l4XC2A7RzisuLiDRwLQMAWAbQAm764F6?=
 =?us-ascii?Q?PA/H7Ufgy64dGQ3R7q82qgZgcoZ2OkMgtNF5PxnrCgRqRFf7wq3CzEeGr3Aq?=
 =?us-ascii?Q?daikKVVZ0jIXc9ioXHCvO1p2ldEacO9ZvGkDni5SGsMj2WLHWTa5OpoKWuiO?=
 =?us-ascii?Q?D5IhWTZFhYBZjawG1KKRBx1I/uHwsBcX2UDMXc+dtmyun9dsKKrGK+HOaS0U?=
 =?us-ascii?Q?IerxGZtCRyJZROB6F/17KHYyGVgUIQseESvOFxFW49df0d/cnPrKJPIo/UdD?=
 =?us-ascii?Q?WS4I0cnYeVg5qAnRJcQotvgIugIg7Tz/TXA35JJqyL9ahoMIHExoQRKfVVw+?=
 =?us-ascii?Q?+uWHjhvH2S2c8xlxB8vKH8Ob6Kq0FE1X3CmqMCcycpsUyToZYuyaqthDhafs?=
 =?us-ascii?Q?Yys93kLFcGWk9TmJtf7KXl4Kr0KTAvBPkjVr1cYmXrMhV2so6eMQj9JYktOA?=
 =?us-ascii?Q?r+1y9Jwa1Uz24A0PwxQOIntWLV+SL+/uoKnXoRUra1kTrVDZaLsumPFSYNvq?=
 =?us-ascii?Q?OZhBSMzo+udonnIlxspbIHepdhy1A8YzPzXLjDY0eBrXAKmRsYKsdIv3CT2Z?=
 =?us-ascii?Q?A5gvloznH8ymCbiXaYYni6NUrNrVF/KJ/eiCsg7sKGx/6prp25q0YKNl1BxQ?=
 =?us-ascii?Q?OJV0x5a8q+/rOloQx5G+gp8h9Cl8IksFfkILxrwoVm7sCGR07M59cMFS2/Xb?=
 =?us-ascii?Q?EgAUzdZbtM9QAc8Gyto+28YQaUO0EK0NPsLuTmuTTYttVw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4663a1-f6d8-4aab-b689-08d8e309453c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:40:23.2830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6aYvGytB5Jq0CpYqxCU2QhQHDobHwhdkpZbUQ4b53jQIgk1bI1mzuOzFD4dKSJSbsuHuh2SyiOAxIWYIRmxglyTAOvUiUacov2mIq5FHJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1771
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090074
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090075
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given that the block size is read from the header of the VDI file, a
wide variety of sizes might be seen. Rather than re-using a block
sized memory region when writing the VDI header, allocate an
appropriately sized buffer.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 block/vdi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 2a6dc26124..548f8a057b 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -696,18 +696,20 @@ nonallocating_write:
 
     if (block) {
         /* One or more new blocks were allocated. */
-        VdiHeader *header = (VdiHeader *) block;
+        VdiHeader *header;
         uint8_t *base;
         uint64_t offset;
         uint32_t n_sectors;
 
+        g_free(block);
+        header = g_malloc(sizeof(*header));
+
         logout("now writing modified header\n");
         assert(VDI_IS_ALLOCATED(bmap_first));
         *header = s->header;
         vdi_header_to_le(header);
-        ret = bdrv_pwrite(bs->file, 0, block, sizeof(VdiHeader));
-        g_free(block);
-        block = NULL;
+        ret = bdrv_pwrite(bs->file, 0, header, sizeof(*header));
+        g_free(header);
 
         if (ret < 0) {
             return ret;
-- 
2.30.1



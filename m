Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59CB6102A7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:24:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9QP-00054Y-TF; Thu, 27 Oct 2022 16:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1oo9QE-00053q-Vx
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:24:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1oo9QB-0003vd-Em
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:24:14 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RHnSuS006974
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 20:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=gkxFQmV6AYLJf1nBG330M9HTxwpKrGFNN8tdcaP+/pE=;
 b=Rv0kc7NGtqmKaGtQuhCSMH9Ow6q5D0oYEAznGehsSomXm5kGaByIrh3yelB6cUoSBDdE
 EAliLT/UNRz+3ankT0Wds705szyfTiKVqsfDwepSI6puX/DFhvwf7srzxMVNJuANeo6W
 9FY18EEe4wdvkPKwiytwh82SPcAVQ75opOtJcnW2RM3oTaFAlRBPbsZVlBMRH8DSIjoW
 55B6KR3EHLTGZIzd+2FbkElujuoLzCrtFUXs6IHOuwBJP89FZZ4bnff4eG0INnv0RiGw
 SVMiHsp6jVE67E1CEYsPvxJYQ2/76Eg252d97bUGFF/EdChXDNhkKFlv5R4ozlO0zlho 3g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfb0aka8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 20:24:02 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29RIfT8w011664
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 20:24:01 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfagrckx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 20:24:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJ9zDfPmwuekhtQJ9/5NFOB/MIGWYWVHMU8c4ldunHsC9RgPi7QRsHi6jAFB0+UQe0kSyXgs6HQoN/IeGOJTjtJVaPwvN8bG+RBpAZ/x6ygRJ4aFG+KYexut9lW0ks95cXvjRkUQsofuuCZjH/FkxSvVWjFoxtLmyD2fiTe4WncPW477lQ1RGnhUzSSqjJGKwJGtGNkUesgKZRhjYsL3M+f8SJfTbJL7/HEhT+O0+6aejgaGLo3zjBHYzJRFSjkSa4zjtfvGHHYs2UGobPGcb8ekkGZGfISxuSzC5GZpupWlcLFC0FX3WdZjm6q90dyoEmxdA99BAB/oBxOnyGQ+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkxFQmV6AYLJf1nBG330M9HTxwpKrGFNN8tdcaP+/pE=;
 b=Ief1EYztCoG50skSD46yUusgSR41IccaX3kiPsYtVwFjnNlDsFZY5Jerif+ncgSj/3u7+fjoQd7FHikr6os8aUxyQQZQaXKl20GBGRVjyGisVrgUQpOvlSq08VQVGdm2VYi17yq+jzOWlTcGBvAHY2j9raKkrsFGRfDfCw8V4lJo/BWXQsTtCzXCH5vsv9pmiZlF4+kguI2Paf0pSCewccIfAu1y6abKUBrm/kk4enV7qd+HYilk4C/zVUzBMhOvvJ20Ztz2lKsJyeoX6UbKir8nuLYlb7WdzIyWKX6Q/PvBqPQvraMjIFNr5MLYUIAxMVg82opJq1f275XbU247sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkxFQmV6AYLJf1nBG330M9HTxwpKrGFNN8tdcaP+/pE=;
 b=PS8S8PgSQc18+OKW40Q1+NoqwrH7kHLfvefJc6Zm+vawjnqw5dxktfNwuoAeRXd1KioQb4BhsTWvAHOJZ07jZPd1e+2UKP/1vbqNQlrRmTQVLpwYIP2wVw1+iUEsUDB+IOtxGnCp5bewVFOWGvKS8FDSRytn8S2rKff+Jd7q8Qs=
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 PH7PR10MB6081.namprd10.prod.outlook.com (2603:10b6:510:1fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Thu, 27 Oct
 2022 20:23:59 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::93cb:bdb:4f3c:de66]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::93cb:bdb:4f3c:de66%7]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 20:23:59 +0000
From: Annie Li <annie.li@oracle.com>
To: qemu-devel@nongnu.org
Cc: annie.li@oracle.com, mark.kanda@oracle.com
Subject: [PATCH 1/2] block: Set the name of BlockBackend if possible
Date: Thu, 27 Oct 2022 16:23:32 -0400
Message-Id: <20221027202332.3229-1-annie.li@oracle.com>
X-Mailer: git-send-email 2.34.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0022.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::35) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2523:EE_|PH7PR10MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e76781-f5d3-46e6-8d61-08dab8592e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKhaRXAqqBU99JblksCumNTWYaVM4pOfDNr4VyjGNmpVU1e/toD4PumuhZbk2mYRWkDmfv93OqBw9nvLtJ52n19/Uzuwi/GyCvSDfjTKGCykjHUGS5zz05hqI44lYQS/CbDrGQpnynnFouEfsLtN2YVoeLTwWwLdnyS4u1JL6mjNl84pJ6bI6EFzl0LNHUWvGmUHr684jeJF8UckO5PiGsmBGJMvnBxolTigdl0PgLPTF1QKQsKXYI1Mj+I7rpRyoCgHkxNwe3iMUmrIhxdZQhyZFC/1qNbY7cTCAeYACHPwgo7D7eqOwF/N450GZqGRow1sMO/YY45NLMuOctYCElU2+yz5q0FcMoRBkWJ7u5cNqVBvV4O/UGPfnorDW5sB26xNL+MIAOTtmrxgxykZ+jSG+1eDyLHaQ7StPPFtk/9WoH3M+FRzoRNFoNNFx4Ng4oPj8q7iak0TqJNzSRm0QfJbyXVhvcsVBlLXk/DiwKBHI4/HnAhFR5XcNNWp5U+rQgRyIGk5qZAT+C4nY62pfxm4qbrgbcrGWKV4syfwFf4944lvWJ4ldHDnaP/VFk0ZmoG2jZjDTuXZi+JUnbQRya6ZY+CBBI+Lp1Hy8JTXg9+fBmcDmY7LEzSfO2sYA4wLjkdyxoL3y8psjNOi7IEYNuAyXQOR/YPDqjSeh0vGvWqOjEualVxIREWVMvsUwMa7258w+18JS3yMBwRaJCkfE+gvYl1yuSFJj+vm91iJX6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199015)(5660300002)(478600001)(6916009)(83380400001)(66556008)(38100700002)(2906002)(6486002)(36756003)(44832011)(4326008)(66946007)(41300700001)(8936002)(66476007)(8676002)(966005)(316002)(6512007)(2616005)(1076003)(186003)(6666004)(86362001)(26005)(107886003)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q1+AP17p3WQoz6iD5p8oMBpUXKlt2pwC+NNWUhu2BpzOnqOEoDCWRthKKaqQ?=
 =?us-ascii?Q?3bPMBl1LEmMk7zJRv1T2kIzlR8fbUaTdFHo9l14nNlHznArs+sgYNVn7KH7F?=
 =?us-ascii?Q?ky6oeACJCr99QuDQUHvWpVEXXHjYqUGMFgFvGU41+52OJL/eouCU8poGTVrx?=
 =?us-ascii?Q?F6CQsv77ovFw/8Rs1twL9J9Wka9jExsO6nM0s7J6cSF6jXErhdDjevepuSMR?=
 =?us-ascii?Q?uQnhHYJQ9O2bk3+p/mvrVIImL+iXaaDmat6eOSL5GzekQ1ucmeVzw02v4Ox+?=
 =?us-ascii?Q?9S25rAMXN1j4xleTgzMEGnrHHBxL7FtBoGNYdWttVkwRz7TX7Ne5BstniZkg?=
 =?us-ascii?Q?KRdlf9JsGlugqXEs0m3dU5G8dfK8VqdDkiDU8tf3heC+HRAFkj/Lb7uxT/b3?=
 =?us-ascii?Q?T6Gu2OKWVwe/rkGF2YxHl7rmVEhITKCQ+ErQAxszQ+tZHEVNWWgdmnngtah9?=
 =?us-ascii?Q?9gcH2z+D9j3HrXAmNUKEo7Cxa8mOK6m7v4CZGEQ3xvkSNHIVtPw4yw4+5UfY?=
 =?us-ascii?Q?a1TH3IvEtPIbtQcs0+aG5N3pwuiu0SfebRTwFJlNvHOyzgE4mVh85kIoDdwl?=
 =?us-ascii?Q?dC6EUMHdNZL4c8gXr5AoDRRCPqk5mcLzzFBEmiETrNF2UaKiUEcGiExFx/Yl?=
 =?us-ascii?Q?D6L52ZKGIAmBQFUyd4s0KLZ2/gDh74QzdipI60jHuMefta4zC0LTBXAkIqFC?=
 =?us-ascii?Q?I2Dbf27HgNYpyCkXcXYHPx8S+SeRWwULw7OLIFBHFQ8hzz/g2hsXmem4Ck/H?=
 =?us-ascii?Q?vcwBye0BCSZcBJSn9wOJDkI+FhORC8C4sz2v18D7BcnszG2Dth9dDDS8rS+M?=
 =?us-ascii?Q?h7APBHNN73sbVuwaBbFLRRk1i/Z8koKhFrYi6+sxll4VfB47NmQaJxkSqlq9?=
 =?us-ascii?Q?aKAOGPlFJZ7c9//K5XRPstEpn6QGkpJoePaBDyH6DlxR4Eu3bAXGSz0C7xsr?=
 =?us-ascii?Q?2xCChMrRLfLqFqCJJlOgeECf1WVHQZaQtpKXymRG65oHZA7hLzubXFW6zIIO?=
 =?us-ascii?Q?en5KM0DnQ7GCwI5HxSdn38CY4ERWpnRU41aGVSIzp2MXlpftDVlWqrb67pBp?=
 =?us-ascii?Q?cgkObrWK7Ttlu3kYHYZz73gg9FiStljDqr5x12yfyBxJuWfYWSGPC//tQNyG?=
 =?us-ascii?Q?xMTj+kKOj6/BL/+FuajXDvtBXATtbUXuV3iKWWKORBsLuRLKNQTBWhmLl0H+?=
 =?us-ascii?Q?BzDBhFen/IZckuG2btTyaIy5U+z7VPuib1ylgtabNABcMjyFCIZ7IcFzmw+Z?=
 =?us-ascii?Q?7ipr97POgDhGfT7zZTAJ//pT64LScMktFNOqv2/6REyQ52CcK82p/fRRYzHL?=
 =?us-ascii?Q?ufboh1MRs42V0ZenMGJB7HlN5lhiZBLfHmyu4zzDlaPhID0qtdJK++3jA0Yk?=
 =?us-ascii?Q?5uJqcA0i8pFRYT5y2s84pwIHkh/U2If3h6tk/cpYro27EqK1uKjZifz0ZwAH?=
 =?us-ascii?Q?S7d94E4zw9OL00tJFyoS/eVDt6hnt9Q7JL0Nhigv7Q9rzVGpYZeA6+jECXqb?=
 =?us-ascii?Q?qq61WfzxzuUVnohPezl0zLh2kJlWVImyemnwzdJLbfhpdW94/N1UBkobeEAZ?=
 =?us-ascii?Q?YTUYM3j8fShz5Tdl7nhSCchJlyvVltTPMyYfiDiz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e76781-f5d3-46e6-8d61-08dab8592e24
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 20:23:59.3343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqQGtjDARIYy53acJrBBp1jhgE7R5iqLVBVZn1WEmVhSBevtSVTsri6ssoBgnTy29APvecsYgGcn42VmeqojPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6081
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270114
X-Proofpoint-GUID: wlmi0erJSkskif5sRbz7FtzFPXOFef67
X-Proofpoint-ORIG-GUID: wlmi0erJSkskif5sRbz7FtzFPXOFef67
Received-SPF: pass client-ip=205.220.165.32; envelope-from=annie.li@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When QEMU emulates the SCSI device, it sets the 'device_id' of
the SCSI device with the serial number configured by 'serial='
property, or with 'blk->name' of the block backend otherwise.
Then QEMU emulates SCSI commands and fills the mandatory Device
identification page(0x83) with the 'device_id' info.

However, 'blk->name' of the block backend is NULL if the block
backend is defined by '-blockdev' option. This causes the QEMU
returns unconfigured empty page to the guest. As a result, this
may cause various issues on the guest side. For example, Windows
guest crashes due this in BZ#1708490, BZ#1722710#c10. This crash
issue has been fixed in Windows vioscsi driver by patching the vpd
page[1], but it is better for QEMU to return the non NULL vpd page
if possible.

This patch sets the 'blk->name' of the block backend that is
defined by '-blockdev' option, so the QEMU returns non NULL vpd
page when emulating SCSI device.

[1] https://github.com/virtio-win/kvm-guest-drivers-windows/commit/b57548c769ed9f431c34f6449ce432dd077cb02e

Signed-off-by: Annie Li <annie.li@oracle.com>
---
 block/block-backend.c                       | 10 +++++++++-
 hw/core/qdev-properties-system.c            |  1 +
 include/sysemu/block-backend-global-state.h |  2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index aa4adf06ae..255b009270 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -471,8 +471,9 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
 static void blk_delete(BlockBackend *blk)
 {
     assert(!blk->refcnt);
-    assert(!blk->name);
     assert(!blk->dev);
+    g_free(blk->name);
+    blk->name = NULL;
     if (blk->public.throttle_group_member.throttle_state) {
         blk_io_limits_disable(blk);
     }
@@ -2594,3 +2595,10 @@ int blk_make_empty(BlockBackend *blk, Error **errp)
 
     return bdrv_make_empty(blk->root, errp);
 }
+
+void blk_set_name(BlockBackend *blk, char *name)
+{
+    if (!blk->name) {
+        blk->name = g_strdup(name);
+    }
+}
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index a91f60567a..9504acf4df 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -144,6 +144,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
             ctx = iothread ? bdrv_get_aio_context(bs) : qemu_get_aio_context();
             blk = blk_new(ctx, 0, BLK_PERM_ALL);
             blk_created = true;
+            blk_set_name(blk, str);
 
             ret = blk_insert_bs(blk, bs, errp);
             if (ret < 0) {
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 415f0c91d7..95f166f9c7 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -113,4 +113,6 @@ const BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
+void blk_set_name(BlockBackend *blk, char *name);
+
 #endif /* BLOCK_BACKEND_GLOBAL_STATE_H */
-- 
2.34.3



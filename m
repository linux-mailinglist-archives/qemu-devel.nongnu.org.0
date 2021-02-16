Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD031CBFA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:34:26 +0100 (CET)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1Qn-0000i4-Ni
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lC1KI-0003Sq-0d; Tue, 16 Feb 2021 09:27:42 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lC1KC-00024r-Qr; Tue, 16 Feb 2021 09:27:41 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GEP6pW150178;
 Tue, 16 Feb 2021 14:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=VuqwG3ocXRI8sa5bLiORF3GnEnJ8AOCNo54rPLxuQi8=;
 b=rnxPX9wC9QppVlE6dDb2z+8AL8ajex9pWw3jMChBUfZvfwyIEqRde7TErbf5fwW5JJ3O
 qpQQX5m8ngavSKrToqLtJkT6qZEvoWnQOL4ksSS/kcRTEGfTVmqdS6f7yQt0kbnHt6iQ
 Wwg1Xs8Lc89W9FcFM+mTeHo24OT53ZXE4cnmMac4RmsaDi0I5EcATHHyP6yG/yUzDp1F
 kxr91646QidB6CN6TjTFrbYOpd88fYKA10JYkK3EUR+QMd04TRMkaGcw3cT7S6UwI1lR
 YjOypn7BiYfUym8zAaIBip96YsttaUCcdHvhQbsYU/SjhUwo3XS15qn442W1aUHo7rel Hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36p66qxykr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 14:27:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GEQ8bP043164;
 Tue, 16 Feb 2021 14:27:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by aserp3020.oracle.com with ESMTP id 36prnxyq0v-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 14:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YH36j5aM20YUywKqxxfADRLInvDZl7mC3/tUyQ7BdD3iT/jdYxltKJlXuxvqrYf9/0ICQcTzpCqwteGLNw745XQflL8h1UrqKBzp85oXARBSKKbw6MySLH3CdpYQIJ6kk8lR+l3OVxhmtcsec+nASclSqqAMZ5LuJAJ0AVgOgdTBSL3xuCEpQF3ZCUco84zl47bqHeHKryqCHvoBFGQtZJ1y5AKxrvslHu74RM1iZu5FFQKIEDGtE5aQJdAN3hi3Z4ET0ox+vcH9ZysMsjEx2kL5rnHSiYhYu6SPgtNV4qvLnE339dPpJJ1QJcFkemJWOfu+eMSzMescAVhIOo199g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuqwG3ocXRI8sa5bLiORF3GnEnJ8AOCNo54rPLxuQi8=;
 b=M29VBQWcPXC3GtVkfuP87QD+s39b8grTpxGhxMSPcNm6Qd6HEol+iQz2RdGrl5y6enyZVAqu/CGc0Q0xZMlglO6efnPWQ0qYTzchx2tGccnibVVTpJE+rbrS+sPnrjnc8jhwdVGxNEmT8oEfiuBCyWsoSwsQ7WReqALzgLWBzJe4S+RWM1aMtgsx/evWISUrybx1PY4+94mxZ7SZoTfyWHWgm7eGl3mqyawZAmVrNgtNpOeLkcJOpb2eUnZ490VFs4xFvBaPsnv/ycUyJLcKlE5akvIvh4KEF1EQitfa41fwRaBWtiQK5cb2SlvvVQzRdW6mfuwIC/avidn246cq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuqwG3ocXRI8sa5bLiORF3GnEnJ8AOCNo54rPLxuQi8=;
 b=EeVIS8/Fw8u84RXyjfmqlhitcs+Mb52FgR7kFD0vAm4qhoF51MyrP5yiceJOjYi5NbFzdUcOTMlXRqhKj95WYgfNZumdlY9Jga6OHP7ehY55aEYB1c/peu44EFe2VlTTWDk359Qwr6aDYDoL+gwV5mazxKQB2FXSlUkG57Mx7uo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5182.namprd10.prod.outlook.com (2603:10b6:5:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 14:27:30 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3846.027; Tue, 16 Feb 2021
 14:27:30 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] hw/pflash_cfi01: Allow read-only devices to have a
 smaller backing device
Date: Tue, 16 Feb 2021 14:27:20 +0000
Message-Id: <20210216142721.1985543-4-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216142721.1985543-1-david.edmondson@oracle.com>
References: <20210216142721.1985543-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0396.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::23) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0396.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.39 via Frontend Transport; Tue, 16 Feb 2021 14:27:29 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id ad4446e8;
 Tue, 16 Feb 2021 14:27:21 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a665b2ea-dbd9-47cb-585f-08d8d286fde8
X-MS-TrafficTypeDiagnostic: DS7PR10MB5182:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB5182CDCD9DF715F51B61F23088879@DS7PR10MB5182.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgaZij+uauHmcqna15wJmuXxwKX6673rnTqGzCNd7+yp/0GNVGIQ5pR1VGsXB39khJQbwOPHpEZC9QICVODJnFJSjJzuILZayk8659+VgOMl1QHSdRPhwYI/JRK+Ka72Hcog5FPTMsLBePOqMEelHNaA0O+fxfvxW8ZoVmZ50Iz1jjlXTM04DE47EPc4gKQS+JdaM1NESN6p87Oju/rOIn3iMTMVStlcRsysxcuZzBY7m/efoafyHdCzS8mgnAM6ZDGZLJ/nGuH2BP+USpwTnH357uGC43N+Z/lYA413nVpVxH002rsq31c0cmPCCJLmZae0i13n/bDN2mYgG3p70Is/DkMezuSr9+ZZyYCRyXLGl6LxVcr6JhTt4SsfIRPrsJ/e2v3vDhn8rOiMQ8QuDGwYF8V5YLPGNdhr/ZddS6k7j0XQF9QkX9VZBZHUeg4e16d3XwMoKoaH1CYaIRy7h9m02WOeK1c1sxp1mIyuzNP4HWiPOCEIpCv+OhXyTY77xAeDABq3cJQ1l5GfJJbeHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(376002)(366004)(136003)(2906002)(86362001)(478600001)(44832011)(1076003)(316002)(54906003)(52116002)(66946007)(36756003)(66556008)(8676002)(6916009)(66476007)(8936002)(2616005)(5660300002)(107886003)(83380400001)(186003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vpWcMpPC1556AFI7Ep+lXtochtXK527/R7Jfc7woSUQLDwehaAMStb/+nX6e?=
 =?us-ascii?Q?C1FCYDBfud6BcvXK6sfeLhvknVgNv4y/5SRLbzoK0uP4ic8AVQHGkB5Wx+d9?=
 =?us-ascii?Q?BRcfDxr8JRuZ6yhlusnC83XNM4qUi9gyUzJhpvQMDYrtc1QS3BJBQwuHYQlL?=
 =?us-ascii?Q?G1tow3Plkfw+4NIAr1VeBuC+Kg/m8R6/Zx6280rUHdesjPxWYhhyT3rxXxJ/?=
 =?us-ascii?Q?YqeWTCy4Op+qx5a5sYGUB+Z9QJ49MxjW8/vAyEnutdPzpaoj/sUXJpKfJuc3?=
 =?us-ascii?Q?7Udn08KelczqgOwIcE3gLHt75wZnLHH6qJS0saDirKNHh6YC9UC0mw9aih6Z?=
 =?us-ascii?Q?lFmcK20Crd++Xgh1VS7JAXVg8Fj4ELS+0b7JxxbU/Kzh9YPPZakIfInCpF99?=
 =?us-ascii?Q?rCIoggSpyBc6qf1A3OhX4WWHJAtWFur41JiK2uIL2LY/PEwlXWWHfi+kwUiP?=
 =?us-ascii?Q?/QkiewlH9Jwj/WRri7M5plP+T2qRvbeh98NuM2UtiY95wfDRz/CaYwYQkb3n?=
 =?us-ascii?Q?Fhx20fY2hHbtSLn/nlZ3WCNVVvEbyZfmUvGhiALl0S8bCoLStf6ZXtLR5FYi?=
 =?us-ascii?Q?ZFOmutDqt18yq71EGMgPQSmRJoeG1Br3J2+aUgrqmPwtoQX3arFGuhCfHC9Y?=
 =?us-ascii?Q?Z9BPujrslaU/548P/02ezOjQbW7igEAGPLlpmjrPUIaLHcU4S6qTDNtiy3JL?=
 =?us-ascii?Q?OkkaBDGyGErKq5O/9+mJV9x8rlmUIpuS1BZgZAi91UTere1xevYMKJ0d98jS?=
 =?us-ascii?Q?x3NVlbb3pUfXV2wzBo4NqKBs/VH1vOZk+DLgMKuJozx6H97jyegJX5uTVJsL?=
 =?us-ascii?Q?cHwqK3V4AFopKkZkwVFMpO7/mmgxXvUskNHVc4RZ51KXcIm5uMNU4sW9sM/t?=
 =?us-ascii?Q?W7PwYrPwVy5VCIhjmj+oY2XFpxG0kYEVCZeuLfnZd4tvqEv3AXqwjMGPBTuP?=
 =?us-ascii?Q?ehLQwpjGp89rMzA207lQohWppP0VALGvL9g0jGDEGUpPnMdjfzekcdGA5HJ/?=
 =?us-ascii?Q?/QpwsZJH5Q4fnG6tx0WN+F/uzKDR6NF7fLAv3OMtD1YJLKhL1T62RQGCWGvH?=
 =?us-ascii?Q?4QHsrRzCNkGnUSqzL2KhDsA/bS/qk2OkEY80TFnW+ikdF7Qevx54qhbwtcxh?=
 =?us-ascii?Q?eCc4d1gL0O623QeWB36ncR7EDAvVI5LrbJwarMhhgo1HucZ8XxVmO6oaFcRs?=
 =?us-ascii?Q?oSeZy0L+0ZkgwMwFRV6dj9Vw1AD83ILRQAIQwa86ipl/WBvCASN/SydOM7hT?=
 =?us-ascii?Q?yYZ9EzYVrQF2t0u5dh1QPEkLpGyfaDWQuk/soNoxTKMdH0oVP6IPVN61ScQX?=
 =?us-ascii?Q?M3fVqGO2AIFBVgCNYBeRLlSR2DXGF+zgvxJQpEBTOsUGKJ18Q2n0fGilSa7w?=
 =?us-ascii?Q?oL3TBdI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a665b2ea-dbd9-47cb-585f-08d8d286fde8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 14:27:30.1427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8lSl3CPtBcHJRUA/7kf7VEcHU+22F96KkWwgOjTlXnFjps26AmKIqZ+7momFNYRUGSB7hLO9o/qCToUyBWjxC0vVnz5eKBeaAhlRDHf2EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5182
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160133
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102160133
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

If a flash device is to be read-only, allow the backing device to be
smaller than the extent of the flash device by mapping it as a
subregion of the flash device region.

Return zeroes for all reads of the flash device beyond the extent of
the backing device.

Writes beyond the extent of the backing device fail, as the device is
read-only.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/pflash_cfi01.c | 115 +++++++++++++++++++++++++++++++---------
 hw/block/trace-events   |   3 ++
 2 files changed, 93 insertions(+), 25 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 6b21b4af52..0d305c7d87 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -83,6 +83,8 @@ struct PFlashCFI01 {
     uint64_t counter;
     unsigned int writeblock_size;
     MemoryRegion mem;
+    MemoryRegion mem_outer;
+    char outer_name[64];
     char *name;
     void *storage;
     VMChangeStateEntry *vmstate;
@@ -425,7 +427,6 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
         }
         break;
     }
-
 }
 
 static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
@@ -646,8 +647,39 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 }
 
 
-static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_t *value,
-                                              unsigned len, MemTxAttrs attrs)
+static MemTxResult pflash_outer_read_with_attrs(void *opaque, hwaddr addr,
+                                                    uint64_t *value,
+                                                    unsigned len,
+                                                    MemTxAttrs attrs)
+{
+    PFlashCFI01 *pfl = opaque;
+
+    trace_pflash_outer_read(pfl->name, addr, len);
+    *value = 0;
+    return MEMTX_OK;
+}
+
+static MemTxResult pflash_outer_write_with_attrs(void *opaque, hwaddr addr,
+                                                     uint64_t value,
+                                                     unsigned len,
+                                                     MemTxAttrs attrs)
+{
+    PFlashCFI01 *pfl = opaque;
+
+    trace_pflash_outer_write(pfl->name, addr, len);
+    assert(pfl->ro);
+    return MEMTX_ERROR;
+}
+
+static const MemoryRegionOps pflash_cfi01_outer_ops = {
+    .read_with_attrs = pflash_outer_read_with_attrs,
+    .write_with_attrs = pflash_outer_write_with_attrs,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr,
+                                              uint64_t *value, unsigned len,
+                                              MemTxAttrs attrs)
 {
     PFlashCFI01 *pfl = opaque;
     bool be = !!(pfl->features & (1 << PFLASH_BE));
@@ -660,8 +692,9 @@ static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_
     return MEMTX_OK;
 }
 
-static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr, uint64_t value,
-                                               unsigned len, MemTxAttrs attrs)
+static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr,
+                                               uint64_t value, unsigned len,
+                                               MemTxAttrs attrs)
 {
     PFlashCFI01 *pfl = opaque;
     bool be = !!(pfl->features & (1 << PFLASH_BE));
@@ -684,7 +717,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
-    uint64_t total_len;
+    uint64_t outer_len, inner_len;
     int ret;
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
@@ -702,7 +735,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    total_len = pfl->sector_len * pfl->nb_blocs;
+    outer_len = pfl->sector_len * pfl->nb_blocs;
 
     /* These are only used to expose the parameters of each device
      * in the cfi_table[].
@@ -717,36 +750,68 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     }
     device_len = sector_len_per_device * blocks_per_device;
 
-    memory_region_init_rom_device(
-        &pfl->mem, OBJECT(dev),
-        &pflash_cfi01_ops,
-        pfl,
-        pfl->name, total_len, errp);
-    if (*errp) {
-        return;
-    }
-
-    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
-
     if (pfl->blk) {
         uint64_t perm;
+
         pfl->ro = !blk_supports_write_perm(pfl->blk);
         perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
         ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
         if (ret < 0) {
             return;
         }
+
+        if (pfl->ro) {
+            /*
+             * A read-only flash device can utilise an underlying
+             * block device that is smaller than the flash device, but
+             * not one that is larger.
+             */
+            inner_len = blk_getlength(pfl->blk);
+
+            if (inner_len > outer_len) {
+                error_setg(errp,
+                           "block backend provides %" HWADDR_PRIu " bytes, "
+                           "device limited to %" PRIu64 " bytes",
+                           inner_len, outer_len);
+                return;
+            }
+        } else {
+            /*
+             * If the flash device is to be writable, the underlying
+             * block device must be large enough to accommodate it.
+             */
+            inner_len = outer_len;
+        }
     } else {
         pfl->ro = false;
+        inner_len = outer_len;
     }
 
-    if (pfl->blk) {
-        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
-                                         errp)) {
-            vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
-            return;
-        }
+    trace_pflash_realize(pfl->name, pfl->ro, inner_len, outer_len);
+
+    snprintf(pfl->outer_name, sizeof(pfl->outer_name),
+             "%s container", pfl->name);
+    memory_region_init_io(&pfl->mem_outer, OBJECT(dev),
+                          &pflash_cfi01_outer_ops,
+                          pfl, pfl->outer_name, outer_len);
+
+    memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
+                                  &pflash_cfi01_ops,
+                                  pfl, pfl->name, inner_len, errp);
+    if (*errp) {
+        return;
+    }
+
+    memory_region_add_subregion(&pfl->mem_outer, 0, &pfl->mem);
+
+    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem_outer);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+
+    if (pfl->blk &&
+        !blk_check_size_and_read_all(pfl->blk, pfl->storage, inner_len, errp)) {
+        vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
+        return;
     }
 
     /* Default to devices being used at their maximum device width. This was
diff --git a/hw/block/trace-events b/hw/block/trace-events
index a715a2e173..85b501e23e 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -17,10 +17,13 @@ pflash_erase_timeout(const char *name, int count) "%s: erase timeout fired; eras
 pflash_io_read(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t cmd, uint8_t wcycle) "%s: offset:0x%04" PRIx64 " size:%u value:0x%04x cmd:0x%02x wcycle:%u"
 pflash_io_write(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t wcycle) "%s: offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
 pflash_manufacturer_id(const char *name, uint16_t id) "%s: read manufacturer ID: 0x%04x"
+pflash_outer_read(const char *name, uint64_t addr, unsigned int len) "%s: addr:0x%" PRIx64 " len:%d"
+pflash_outer_write(const char *name, uint64_t addr, unsigned int len) "%s: addr:0x%" PRIx64 " len:%d"
 pflash_postload_cb(const char *name)  "%s: updating bdrv"
 pflash_read_done(const char *name, uint64_t offset, uint64_t ret) "%s: ID:0x%" PRIx64 " ret:0x%" PRIx64
 pflash_read_status(const char *name, uint32_t ret) "%s: status:0x%x"
 pflash_read_unknown_state(const char *name, uint8_t cmd) "%s: unknown command state:0x%x"
+pflash_realize(const char *name, bool ro, uint64_t blk_len, uint64_t total_len) "%s: ro:%d blk_len:0x%" PRIx64 " total_len:0x%" PRIx64
 pflash_reset(const char *name) "%s: reset"
 pflash_sector_erase_start(const char *name, int width1, uint64_t start, int width2, uint64_t end) "%s: start sector erase at: 0x%0*" PRIx64 "-0x%0*" PRIx64
 pflash_timer_expired(const char *name, uint8_t cmd) "%s: command 0x%02x done"
-- 
2.30.0



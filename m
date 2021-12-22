Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDACE47D7FE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:51:18 +0100 (CET)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07dt-0001ry-Mm
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V7-0004aa-Mb
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V4-0008Ki-5o
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:13 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXwoF028486; 
 Wed, 22 Dec 2021 19:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=+OtZ0oN1pLBeExwfEiVml6vg9iyAZzfaCCVKW3ly3sg=;
 b=eerTGFc84jvmv8w/uQ+Le1yPGOvhkbC61BAQGyhhMgDmLQZi09I7si8CnGhS0bFXMRqD
 Up1u9rQCu/ykytpbvb1YeAoxu0tIbyDJUWvxDr1uj53y7NnVkOlL/dhK3tEmDNwfd97m
 PIT3KYduCcM19GCoT/juAk+kIr0ziZW9y0f7jHJRLqSKXKgqL8hWNE5D02KySb7xtgIM
 Abjv9/SC+R6xgtgZceiM6LWt1+O8OHy2ry3qkv0/yOjO4PYr2U1AwKBx1mo4LRR6X9l0
 8IxVo3F8trr5dH6Njrm4gnRw5+gsk8LWvIWh1Wu3opgEQoesLCcQOrGjzXeVk8h4IdmZ MA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCed049074;
 Wed, 22 Dec 2021 19:42:03 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnSozST5HTq6SgEYT6OoFWxj520PVUHEoHetXOq3xYi4UCRvhiy7RfZz6peASCKPUiZkbfcuomHzSQJBBOhftvo8w995mud7S7vAMrz0OePCqR1FslFX8T/DUpIcE/U6dZsByPx+CroA7duO+LOkvBDKicVsSWlMH9YsyihloX3UHQ0lpDlUNwfcspv6hTwb90q0WJFUHhpKWDsZdDFAzFAsPKGCz9pFgTGeJFFhJB+rCJ8FMmZIucLJ06+K89IeaUD+rUplyhhbxvDgug/3Z76Wm+9zxj4A1Nt1mSNu3dcmRsD1ZMZjahDvn7AreNDIQoeZRSgWdm71HoJbQ7Qlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OtZ0oN1pLBeExwfEiVml6vg9iyAZzfaCCVKW3ly3sg=;
 b=YhcCvFxAgATbcCLHGJBADpHimnh8FBrCvpTKz3OPvCoEgFPF4TbJBTk2jBl7m6hGUD3FFX2DG3/OyCOgqCixU15z2ooZXxJOwdpstj+zrwFVdwUxN8UJ2pHxQYRfBUFL4cW8P6edAKsGyPwpwPXe5wyf1eCKTMq3SwH4xIYSAPc9xELjwENdBzpnQBKoMIupesr6vIAWb+tsMP2yxqe7+idwXSbmkfgDw6JJ50GlBpi0RTlqJhwaNmzpgjwLstsOea2pRkzQAeLPFbrHwPRzIWj3GJ5VF821ols/dpjGTkEGYMqRYh5wsGKkLRYp0nNmrCd4R98bcNEkuE6ttHD5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OtZ0oN1pLBeExwfEiVml6vg9iyAZzfaCCVKW3ly3sg=;
 b=Uocv4kXXDLH5Wc//zwhH5HlNjCEQToipcjLmYkM5qjuXHzQxbKOWXWxgPJkPXm8EUNtc1sj/DILDJUzOfX+BQ+7snjwOkGn2itaVkdhafPaROakCqGJyl6oCic13ySdndvsvlo4ANfJBnOt0mxLbSx3zAGwLt4OTcIFkNieMRBA=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:59 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:59 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 09/29] oslib: qemu_clear_cloexec
Date: Wed, 22 Dec 2021 11:05:14 -0800
Message-Id: <1640199934-455149-10-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f3fd78-6b5e-4073-d5fe-08d9c5831e91
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2888704243CEC33551182038F97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1iSRLygHuTcC95dR4+3YkmeNzx5+b+psxYsgohhlJwaYjiBrBQ5jVy6Z830yeKtBn46h1A7VBMxueoMzD0B3y3uz2C+nL4oVU2XQV2UHLGzOsX+hc49xjnKwrlrB0U1fdqbX1zaXz1xfRJO+HDvIT4zXaijp41fPihi94Nbl9+yuHW8tu00Uk+HsNMt5ifvzdA38YyVaGLai9HpTPOuIHGWvfq0gRwFNzGirJiO4g32qFoVJvIWpOqk2tbVSSfA+8sfhvHz47yQ2fXmndd6cahA8noOQnFZ1lR7uAmzBByzUjN9uPEeNCx5uYN1n3GStNJxZdJGkIT6Ci3hmCkjQbzTeXtWI0NJAEb32Kdu7lO/zlJrGZmq0IJw0l8133G0Q7ZlylkrU2u/taii6/oHoHXIyt8/TJfyNoF63aV3yYtbcemUFWpnrf7gM/WVYaC6iHTb+Ea3Gru4+tKwuZ/zdhotWJmQRLx3cbnKK8wjR13HRbllR7JDZhqWAk6SW41xx0uUntjaHU90IJQUunwmGjqowAmzTAA9o6DwOHWANEG2GPJiRD7WgdNmKQkLr1Cy4neYn1K8PSPKaod9ZmnswEkBN3VSD1WNjsGo6ZK6pMtLEcE483I7itR9Flp0aUUZ9OopmUM6Xk5b5rtEo2JM4AItAKcZKPsUbzTNo9YjVe372k0QNigAKgoY0Ktho0lSkYDCj44mdvNq9Da+Tz+QH+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?edVnRimAQ9+TL7n2NiATkUEhU67lNhY4woFFKM8tlRjS7n/agC8KNiDwCfat?=
 =?us-ascii?Q?3OCI02T4XWYq+a6p83jXpoAx/2VywU2hwftZ/i0bYHymv/fl7iycbnysxUrG?=
 =?us-ascii?Q?xDeH1tEIyKElUR32grPo3pGiaATxgQ3HeZ9scbuw+yx9eBO5Xsk7JjrSLjP9?=
 =?us-ascii?Q?FJ6WRdTpaVojLwgTnHmtsJzvhlK/Vh+pzlzSlwLwYK6fVv5IVjy5XXqQGWus?=
 =?us-ascii?Q?m5Ss6X5uKrB427pp3ys1Jmt/wxWHV1+3pnPQbbBpx7VyTVvHhzNPvFX2SXrK?=
 =?us-ascii?Q?3YzFxivWIYo6rYdz801/Y8f8NJNmgizMztj5sshOfmcif3jScWM4rwFBpkXp?=
 =?us-ascii?Q?crJJZWQsBQQ9fpCtlEHLpC+acgt8cRu2nU2Ph86ZDw9i0zjImC7OLyjzP8RY?=
 =?us-ascii?Q?xjdBvTxFOQGnP+LBfIT5LJQXpIEWLYMgYKv5ro2wRznVOuUCbaxFTf5bO0e9?=
 =?us-ascii?Q?8F4XTpmVgB4Sp6fIeGVUDLGGwUbvQb1UuRT9/xuUpdp68MKVY02NxFdcUgU0?=
 =?us-ascii?Q?hbFxs1oRPEHPyn7Pz/Nsq74kM8qeTVQMNj+4EqGaw06jv2ROP4eL8q9wfV0C?=
 =?us-ascii?Q?m4n+LarHONgNkEGY8MN6CBSI3gKrzGIjhC1DJY1pBqM/fpEPD/c1bV+hUGZi?=
 =?us-ascii?Q?rM/UrOLVvTbtj6Nt13RwNpGj13aOzc5czNopAa+ulMkqaHvj26PVVdSIOGMN?=
 =?us-ascii?Q?I7h6XXnoK62vLozsRa7ZG2TcxoSLyxZMdfg8Rr6oLmCobH69awbh7j7FZvAK?=
 =?us-ascii?Q?JbCp5qPii4gEANYgxA/u7lrUU/G/g/PTHHGNRDkWQwSD2Snd/7I5LZShvUuT?=
 =?us-ascii?Q?Khjp65GkrlsO5M0XC2v1T/tshpJ2z+SeYD/TiNZaWoZyKDGqoDCPxmzgHUrG?=
 =?us-ascii?Q?pr4FeTtKlOmc3V5fWQPc52B4xgCSMCV9D+1ZDEwz9qyJmTsuJCOsVXmf6rRC?=
 =?us-ascii?Q?gVFliHpVDlcrjrBMDQvb12xR8Ag16py7KvAAu2U1sCTDpOg1dvsipVRHMpmX?=
 =?us-ascii?Q?piVTC3tbF/Yp7rdbOnibf6QrlU+5p1jw/FxQwPs9sbYek7cCUzxVf65EOqju?=
 =?us-ascii?Q?xs18gkrJq0f3rFOYP0m+E9Mmc3uH3PUUertF+RAA7+9jx2DpfZjms0QzcW8n?=
 =?us-ascii?Q?Svnmg5Oi2P9vzol6zEJ8uqicJZrEPOvsc7qNmP7umwR4HE9WGy0AW7hI93qp?=
 =?us-ascii?Q?f4jTjhVRXGzwH0qb2XAqm+lZG5TnF4jvLSELjk9JgVix8MKCESJUvfXve4Cu?=
 =?us-ascii?Q?+bOX2vlUArxQvrR5geS5BDrb+Jw987qR/uv2cWHutjGtFpKuQHMMAmwwLLum?=
 =?us-ascii?Q?HL6fOw627WCCsa4VPvXrXWE06iy25JktFS4ztbY4nfh039t6lhtV3P3LIgR3?=
 =?us-ascii?Q?5INEbw9XicIiyFiUO2WuoGV7TPQnaZtUws94XGqmmVOgjz6DO/YqWoRvxDQo?=
 =?us-ascii?Q?Bcwbt28Qe27bK9uadU/ZxxLFzY+wI/a4DMK1a8YvonG4rZb7ig6RdHIJD+rG?=
 =?us-ascii?Q?E4tG07c9KsoohfdTQ5BA30q5P//uLSbd7f7oOJ3U5PhBEu4Hvs6qR38UvOof?=
 =?us-ascii?Q?D5St/BU4JQYCuopwQz68jZT4q3V9k8Mdp1XHU7KdMLMIdGK02WCony44xQMi?=
 =?us-ascii?Q?sHziRnLsXF2ogZbRJ7NBnbaXOtJLxLChBTvNtCXZTfGryd0zNo8RnLEXPY7i?=
 =?us-ascii?Q?ynDy+Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f3fd78-6b5e-4073-d5fe-08d9c5831e91
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:59.6084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fa3YnZiVbgQellSNbB7CQj+4aCmSKMMNWgsQuUayY9nK1Hh/xJFt6vBhBuhEwuKus6DHsqMp2aIXAfZy2no5eAeRPj1z4elvlTqBkM3b6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: Ww9Y9teCpVtm41PDBdvtBSM4YNdGMrSi
X-Proofpoint-GUID: Ww9Y9teCpVtm41PDBdvtBSM4YNdGMrSi
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Define qemu_clear_cloexec, analogous to qemu_set_cloexec.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/qemu/osdep.h | 1 +
 util/oslib-posix.c   | 9 +++++++++
 util/oslib-win32.c   | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 60718fc..1ad7714 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -637,6 +637,7 @@ static inline void qemu_timersub(const struct timeval *val1,
 #endif
 
 void qemu_set_cloexec(int fd);
+void qemu_clear_cloexec(int fd);
 
 /* Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
  * instead of QEMU_VERSION, so setting hw_version on MachineClass
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index e8bdb02..7913334 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -309,6 +309,15 @@ void qemu_set_cloexec(int fd)
     assert(f != -1);
 }
 
+void qemu_clear_cloexec(int fd)
+{
+    int f;
+    f = fcntl(fd, F_GETFD);
+    assert(f != -1);
+    f = fcntl(fd, F_SETFD, f & ~FD_CLOEXEC);
+    assert(f != -1);
+}
+
 /*
  * Creates a pipe with FD_CLOEXEC set on both file descriptors
  */
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index af559ef..acc3e06 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -265,6 +265,10 @@ void qemu_set_cloexec(int fd)
 {
 }
 
+void qemu_clear_cloexec(int fd)
+{
+}
+
 /* Offset between 1/1/1601 and 1/1/1970 in 100 nanosec units */
 #define _W32_FT_OFFSET (116444736000000000ULL)
 
-- 
1.8.3.1



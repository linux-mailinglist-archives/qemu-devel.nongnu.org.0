Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D294A4DDCE5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:32:46 +0100 (CET)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEar-0001KM-Tu
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:32:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKq-0003Q7-Vj
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVEKo-0004S6-8g
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:16:12 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICdRUf011365; 
 Fri, 18 Mar 2022 15:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=YS4qhZXEWr7Bte/j7PeTSgoi7OVw5gRwQz9QxnmoTMY=;
 b=HjZTMT8sGbhGMBl60BiBYp+tOOTUlzfl9EIrC4or4IMgnnVFcV5S3Ne4+CtII6v+3Kwy
 OBAj2GLinOpeaouOdgtz1uoxJImacYO7hTDJTkJjAEdCeFgkT1km9exUun+HTg+mz7Dw
 TUZR74NwMAEO0asqifkihrmgAF540Ex9JnTPzMrTBTcBE/zcgQNrp6v9g8+WzDjFInx/
 36m+DrGOAX0ls+mQYtXo+TzNzxg/G4kkTqtKNa1OWUQ7lcYY3GYjEwauLg1p2Zz6vru2
 LTMiibPCjHv7wwDmBPFDPmaNJxvhzXYqyayGfenWbBicDFWGg0xcIYwzlZMO9Mp2CEXZ ww== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et60rkvxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22IFAnm0171748;
 Fri, 18 Mar 2022 15:16:05 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by aserp3030.oracle.com with ESMTP id 3et64u42bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 15:16:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVqwqxkmKfaJaJacwPaB/4krr015UK0DWXGSvC2xQgLSsg0dZbWf5ClSwBV+K0ImW65zU3/ob5EcygRd83b8yJa5pXQBRTzJPnNI95YMjvXtDKF6qlnv8NEHaIu9GDhf4Sx+i9XPrtoW7HULu2rRyIhHoSpdpBlOzWSHEcixxGJQPAsdmU8tHF40o1J5hNoMjTC2MmFF3q+DI/LNL+es9s00LaGLRV1fWySZc4xW1zWa4OgY1Dgjtfyz/9b9np9bOEdltrBzvsNLT/wBoFP6x+UmpSdDRP+TH9R22BbnNB9fQdukP9dHAqLyK2slQtgcoO/FwgHvx/cbfKIQ/1C9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS4qhZXEWr7Bte/j7PeTSgoi7OVw5gRwQz9QxnmoTMY=;
 b=EzOpct39uiHl1y56y5BjCicUswITvDVGynmE87OXMCrOTC2ANZ5yROhFg15ThGdSfLCabmkeo5GsTd7doDh0hJqwsikD0ZRgsctnNmrVM/5SHXBibSItJDKaIS3/0niSlNwsrbq+mzkK8zG2PqphbR0Eiv6Z/EsW0INswXLZRP/5G32ToEt7Kx/nvzmpxPYiZZ2HiktG19bueAzmwPlBypMGkWiqOtA7CunIrRP5zFFmQodTamTnd4FjpxdpWs2zYn1MNITr09arbuuPD7IcB1+iZ2hvuunSaPKtdcmyetQM+3q9LfpE1kSICP3HUZqzDudWmL8jQh3enlgotNwdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS4qhZXEWr7Bte/j7PeTSgoi7OVw5gRwQz9QxnmoTMY=;
 b=JnmbiBTZCm65Lvy/7KLpEoEyfyHs5Lt6KKG5Da5O0chHkt8TYFOiNjjrvW1QXYxH8kM3bKAxUxXRZCam/vx4/lwexzUZVR8AeF2tnQLh5EmNxV8+yh+XPXYl4Bz3II3BqCbvYXHcy/iBY9UlHGc7+kNOjT1KyOjMcYbi1LXvhO4=
Received: from MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 15:16:04 +0000
Received: from MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e]) by MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e%3]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 15:16:03 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] accel: Introduce AccelOpsClass::destroy_vcpu_thread()
Date: Fri, 18 Mar 2022 10:15:51 -0500
Message-Id: <20220318151555.381737-2-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220318151555.381737-1-mark.kanda@oracle.com>
References: <20220318151555.381737-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:3:37::21) To MW5PR10MB5825.namprd10.prod.outlook.com
 (2603:10b6:303:19a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1d136ce-135c-4fd0-5c84-08da08f2376b
X-MS-TrafficTypeDiagnostic: MN2PR10MB4174:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4174AEB4C70704CCBB76B73EF9139@MN2PR10MB4174.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmmrC0z3fT28lKDgsifpiVeGIc/57SgdjUdQK7j5GBlEDN2PzXh4VMi1GUniDQkxTm+2bFkUbXa01de3SERThF9IcMkJJd3Fy2LDRHW6TvvXwh4AQ7KrtHt5IXKax4bIyTnU65nvPA9E5Ewu87ZAqiJX/Vz7vNNLNv+eZmyzux/yS5jijCL3wAtefAWFPC0qF4IfvxMZ/1LZUy+Iypa7Yt1Sf83B4SeWidVegeID99EAKmBpY6jtbJkDz6pf7mNnZzqSf/7bqORJQe6XfkAmMpRZtGLe8XRKvMkgSjGCR1qKosWOF3qf1pHLj7SrPg0+R43mP4W3a6Y74q+jp0SIZ/rR4rL37G1RmZ/Bb1681U0MmdrtODc4r7hx0eYxZsA7mmKdq8XM2VLKzchL4uCS7QSXntY2DMuzhFdojEa2soP//4xhDtfXu+IWcH3fzKVL6/lpn3NOEF/tU3XSLE0CPyCYoZ858EZaVJXPoDW5sTwSRBWsCrmJQ+70L6CYWDb6N6u1ebL3b5NKjTKX3wUwaEua+n/8aG63CEe+R7ixVOKS5B8lRIB8mLCVBqdtlMEytzzET30mGq2S3EBSCWZL75899nfFnTlQAuLLeKYYtVX78az4KMMJwyLNKLD35ZJFy7eGlxSIFjnXQgHEwgLRUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5825.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6506007)(508600001)(36756003)(6666004)(2616005)(1076003)(6486002)(6512007)(86362001)(186003)(316002)(8936002)(2906002)(6916009)(5660300002)(44832011)(66946007)(4326008)(66556008)(66476007)(8676002)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5w8iCtAar42hHrlSbqT+y0WrPQn/cbkJTCJIOmLNydsIb0srvFY2YG7fpGE?=
 =?us-ascii?Q?C+knnCZV2A/dTQR+lEW5emSzb+3sUc1ibGzLZylWLQPGfHaV8z9QG2QErOVb?=
 =?us-ascii?Q?sabO97mPzazdhvq189pnRQO6gffxhu/jKTNC68Z1ope2enfjcukAtNw2noen?=
 =?us-ascii?Q?X/TA9I5uKguj6+KLVAoEKCQTz01mf1FpzS9vJy6SNCMxXZK664BYM076KAKs?=
 =?us-ascii?Q?j6QqQ/hLydANG6vS5aCT+UstjYE510GdOFbdvCMUIDT4pRX0KLmhlwnu0hz9?=
 =?us-ascii?Q?XL32lLgE62Ukf8dsV91J9eRdeXJpkV9aU5T4Ug/k16cPhBaDo2k0sIXU0ie+?=
 =?us-ascii?Q?EYobsu8yvsv+l0qKmVo1+WxopZlzByxvotL6j4O8LcGgKuD+Avs8q9Hb5AAL?=
 =?us-ascii?Q?9AuIVvhe/WPGKi4jDonnS+MAuMYfUp1xtNT9lj3R3+sSZuDT16yJXNTNaIbO?=
 =?us-ascii?Q?EgPzhrIu7roEZq+DGbZtFoLyIia8j5zphylUCSJYFjB1FgvcTarJZXheYsse?=
 =?us-ascii?Q?ugC2z5whQUa1QkhP1ht+BmmvMuwv7+iicJhunC1EadAYGQohVKRs7DUV9EZH?=
 =?us-ascii?Q?QKpUN6QP2Dv5IVX5wtGrIB3Q+iwmQkiVmt9HYFs7rn8Jd1crDp5dN1RPFdue?=
 =?us-ascii?Q?AT2gtQkesEEwu6JgZRtpP9q0uADfwd4DyfnlVuTzWj+rEYJEx4Oqk+G/+NMm?=
 =?us-ascii?Q?kODW2/WK3VJsSjYir3CmSf6BEflC4XEebACyuzEMA7drkLgHPf+rFH0YF3qk?=
 =?us-ascii?Q?9Q6I0/6yrimXOxAcO/iMreGplAwJMxESnTETcZnxU3ZDA8+TfluzZb5Qtckk?=
 =?us-ascii?Q?ch8SUKZD09iSQTGgVm1pf2WsWhXdZqoaNiXctv/3UtQ0idglGE4nNIOGi7aK?=
 =?us-ascii?Q?VGd+L8VUrV+WVA1mR46z2ihODfSxNIQrZSduDt3s66T/A51cH4itmf2XmzvK?=
 =?us-ascii?Q?JwQOWk0Q+44ABaUmOIt/SaPFACZAs1uVExQLaq/CzoZjtynL27X48pTltJZ6?=
 =?us-ascii?Q?w1UaKALuLbH2ml/oI2wowu5Yf5eopVIjMZfV7NsdW/Yyvjs1N8oRKvnALKZn?=
 =?us-ascii?Q?fUTqQADWovJmcu2FUarpqRFoTt7CyFRtURvOjMayMUrmPpS8bak795TH/SBO?=
 =?us-ascii?Q?CIwSfAtf8dPikm+deWksgBu4R1hOAc6NjYmT1AFW6sJvvG2ceubStBvkHH0y?=
 =?us-ascii?Q?iNd4oP5rPdep0+EC0j9+K3gxszjPNiOMJ1Lex/bs4BqlrofGqn1DAGtOSKk1?=
 =?us-ascii?Q?kr6OMxpXrPtFauIzw8qvvfv9keI5lc5eCwBMVUdmurtTki3fCP8PY7Pg1tSj?=
 =?us-ascii?Q?eXMDfnQCNfuxvAUVZLFF4QMx36rVPofQgj6Qs1TWx+RQ8JaGagr/i2mMKSHo?=
 =?us-ascii?Q?qvCXm7xz3CXTyCiTdQC+0PwnRmgALBv1FA1Ygm5RghTzHgOtcygk1JkY4ihk?=
 =?us-ascii?Q?KUnnK/dEka0+tM++MaDLJy6ZRRGooICNYPG0vAIN1HB5mjWJJ97cmBS8G0bu?=
 =?us-ascii?Q?cBDc+mn2vuozO4c=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d136ce-135c-4fd0-5c84-08da08f2376b
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5825.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 15:16:03.8892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpmYZRP5SIgTZjVcvSviH65oGw47nZaU8g92MFd5tLCQR2u1qQgKl9Ca1ESi42jdxgywcJd6b7PkU/KojPBUEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203180085
X-Proofpoint-GUID: brj0UrQeGysI62PltC54Hu3PFDRic_Sm
X-Proofpoint-ORIG-GUID: brj0UrQeGysI62PltC54Hu3PFDRic_Sm
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org,
 Philippe Mathieu-Daude <philippe.mathieu.daude@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add destroy_vcpu_thread() to AccelOps as a method for vcpu thread cleanup.
This will be used in subsequent patches.

Suggested-by: Philippe Mathieu-Daude <philippe.mathieu.daude@gmail.com>
Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 include/sysemu/accel-ops.h | 1 +
 softmmu/cpus.c             | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 6013c9444c..e296b27b82 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -31,6 +31,7 @@ struct AccelOpsClass {
     bool (*cpus_are_resettable)(void);
 
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
+    void (*destroy_vcpu_thread)(CPUState *cpu);
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7b75bb66d5..622f8b4608 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -609,6 +609,9 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_mutex_unlock_iothread();
     qemu_thread_join(cpu->thread);
     qemu_mutex_lock_iothread();
+    if (cpus_accel->destroy_vcpu_thread) {
+        cpus_accel->destroy_vcpu_thread(cpu);
+    }
 }
 
 void cpus_register_accel(const AccelOpsClass *ops)
-- 
2.27.0



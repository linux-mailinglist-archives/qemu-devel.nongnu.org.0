Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389403B0163
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:30:13 +0200 (CEST)
Received: from localhost ([::1]:52638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdfY-0007tX-6p
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUg-0004Pc-Pt
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:58 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:40141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUf-0006qL-3X
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7AfSLRN7oMwfjUsIwliox4w+6+wvPIcVnP6iNgU2+o=;
 b=P4DYVYSecUxqpZvhkJ0E5ESB4bDaGEU76ggWI+CGF+8XjGw0b7dgHmc5mFyK1AEGRmouTL
 bwl6jEEyxGeZ63a/i5IVSBy9UG+mTxo+ce1pRPjkkqH3Yabipsm0N0hdY1G5aBGEvP881A
 C3LkZluOQlOs0MiJ573xxhc+8WVa/ME=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-5DaO7sjiOjGJqhljlm_AAg-1; Tue, 22 Jun 2021 12:18:54 +0200
X-MC-Unique: 5DaO7sjiOjGJqhljlm_AAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLjMFNKZ9cLS08sD7/a1wH11OfjdgkA8kXLavSMzqQhTFiq4RkhOW8GtH05JrL3mZJ3HfF/U1dVmowlsQ+V1PIjEIy0eIfKi/PHFyILqps6/9Q7/Z7wK8/wICDVwkS76JikmIe/NfwLHPRMwGFcABgR7ycAONSkFA5JJIeTUPhTVXWHMDg1dC3ACT8DGZKnQNBSVC/Hi/h6YEq9PMnsLbh3QFyiRCgJJutBYD4z72HmNh+/zIpe7THluEz+ttGN05KUIeyFEu+F4sL4xsfa56WSG6eiNOmPJNrmFutZZILjG9HWSqyEr/ztcLXReT70/fkV8Qxh8qzPKL1wPpl9Hpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw1yACjG9lZbj0bE06qheLUxHfn2hS48id5iWCu2OPs=;
 b=KLXq+d0BAWHb+scCUjyv0hdfkXKETLEV3hltm/0fevTSy/26JTHWIP6f/RUwSo4DB+kx+81QbxrkQld6SFGORmWKbal3WSPzCgFZ6eDGjRQ+O6mxHEozP4749wLrFiBb1vYlXBhQDd4orRAzxOgsuivdzzUBmsPr4g7JfYojk2o4umwsomxj3hnHLf9t8zta9JtQHLgeh4gxIH+MaQ4zjNfPEa3CcDO4fpfJyA3F/tY6zKCKEcIRYvQu0WQuOI5g8DKZcGYVUFHAUpxAfvoWgILpR+uJ9smeOm6rfO435OzOSyAAF29WUfpnGngxAFXNzTIowZD0YcqnWxq7rOXykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5727.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:18:54 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:18:53 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com,
	acho@suse.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [RFC v5 10/13] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
Date: Tue, 22 Jun 2021 18:17:23 +0800
Message-ID: <20210622101726.20860-11-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR02CA0192.apcprd02.prod.outlook.com
 (2603:1096:201:21::28) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR02CA0192.apcprd02.prod.outlook.com (2603:1096:201:21::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Tue, 22 Jun 2021 10:18:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60d1011e-efa0-4307-0db3-08d93567232e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5727:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5727B19FA6B152C04A86144FA0099@VI1PR04MB5727.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oreIU+5dLbrPI5WASdcvIL1bHymAK45jmdNDwzGkQmRGvgSTWjwrPqIcgPvNZtBNq1IQC0c12l9gqjZ82n8gAhoZ+xSrLouI/AoG/FYG/XrJ447IpZI5Ka3/fvaJZPFx/HIwQuvu99qHa+ZPkgHdLXrHyM70kiYRO0Pk+8dnsxTYgzBw1jT4XAVYCJIemjoMi3hA7ZCwgiLYw9UOC5Awp5wHZDFkQ8yQ9mmpHFNpTC6CHliQj9rP05PTExotJDoFHxtsIoSbgXgdbPYMslAanKznNcW4rEu+fVLwnLCjTYoc5kOn+izbZUJCJ/dfNGfoZOinYxuKOu+CBk3Q9WjnoPJDy6iqtK1mi1EGoMwKjDBgVADhnyZQ9HI2ek7rpQK3hhOUxUW0Etj5JKLq4vN2jakA8h+rsHpIJMtQQ17bpQqLxA4moTy3GP8YTu4/owPjkjYr9dRR5c/L9FHhrFT6JpdtyET1D2LwPpx+GIfsFrIUjzDvYIRhpS9F2Kw+6qWpLbbuJqwrU1ozE7lUp/IGeEhObZy5vR4NytWwb+kGFNLFF4eLvd8Lvpfoa0Kf5ezT349ZBcH/Te2kR2fYXCjm6r3Rzu/Nkh1fRc3S+E2OAL5DnJrQKPsvyc1+h0jCqn+CXcrTF5Dd7WslStdE101hzZsWP6vJIw0xfNKgmeOY5ThoOO52fGVt8q16f2WmjbQhPvzOvcLbjlNFEt5hQTC/tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(39850400004)(136003)(346002)(2906002)(16526019)(186003)(6666004)(36756003)(86362001)(83380400001)(4326008)(26005)(66556008)(4744005)(5660300002)(6486002)(66946007)(8936002)(1076003)(38100700002)(956004)(2616005)(316002)(478600001)(66476007)(6496006)(8676002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VoOvzphagpgXvMbKEE0isiYMqmxpfHfiGdKN6/+ii53wYaU6NAZkL+rMo/W2?=
 =?us-ascii?Q?oLCignazpgVumqUhDKGC3gxDJbSr27RZ3aFEf4N45b+P8lC1ALOoOVAhUZbP?=
 =?us-ascii?Q?gTlolBkLmMEY01M1dsiSnN3UwW9Gv5JdendDoLux1anGYZeuJIl/dz8FUx+D?=
 =?us-ascii?Q?r2gbaaP8WCcyVEDTyhtlkRsW0sj1lvFfilT2MehBTQu++mWKwSUl9PfiCCEo?=
 =?us-ascii?Q?1353kCMJYNgj6IEgSuRsHMifp+mXa9ltBe90X8++lKixdACk/AOvqpjqyv7N?=
 =?us-ascii?Q?GjRRAP3ynvHW+qD6zfkA5964bt9stOv0Btnr9fsU3CPrnrw22S9r24r6lK4l?=
 =?us-ascii?Q?hz/vRtzb1Os11iNNRcF/sDNRHbB2AVT6gKaFAKfBue7LcLmBDfkpmULLwiKM?=
 =?us-ascii?Q?NLms9/Pslt5CRwaR4pTaF8eI/PmnTObQZPoKkLzH3IbYDuNcuOQ7YEs0n6YB?=
 =?us-ascii?Q?sWGOXQz47vbQz86uHtfHcRmrl+dJMfLk2xaITY4RgsCsJ4xXBkPZG1+ubcJl?=
 =?us-ascii?Q?Izl+OxL0fqBWXRo+cv2y6RRGii515NOnWCk1tgRTakAxcY8g2LMAlAO6x11w?=
 =?us-ascii?Q?QcU7eX5zvkzBb3BKeMtgLMQ3uXs4NDKMi9wCPwKrLyv2v1LJPMMtyGSzl2Ht?=
 =?us-ascii?Q?ju2RNpcCoxG6c6zvqgEHbiXMrJFn5Yj3YK1tCVMJ+5lUaHAAxRVAwmcgtINX?=
 =?us-ascii?Q?G4m/EM6YSEPb2rBKzqDYNbPUZeKv9NZtrZAA6B4jVzi6qDx3vSXTB/IxiunK?=
 =?us-ascii?Q?iPAHeIvzPufVe2uAWnbh5P9CZM96snnpEtVPZ5uL/ALVx+PLZhodW2j/3X/J?=
 =?us-ascii?Q?DUcecg4sMgTk06/dk0qqy/fUyDAlLMnvzeUzYuTBCYdkX3P/zCUGEdFbN861?=
 =?us-ascii?Q?39nSZX0Sx+3jvCzvPodMNcmM/ityd+uI5E8CChW2hzEDd06LOtyahi+Y2FgE?=
 =?us-ascii?Q?XfgX1kW2M1cy7NhlJ4Ygs8IwE0H/1JIFtxYU5FcskNBYKLGAlvqNc1qbodmX?=
 =?us-ascii?Q?B11oUaS4T9XzTz4UJmFD1wImEw4OK7WsTQcgi2cSkzXPDlsn3YjGGAplnQUZ?=
 =?us-ascii?Q?FpztzQuTsD99i7jZPkxd0kul8Me3Kr+gsFO3Q6VOBp2V3g8ut2KMhwWSk7p/?=
 =?us-ascii?Q?OMvHGy2pWM5zlRoNuUcvLCH8U121KYPk8EP/oQ17fuWKobB2aZojgtpmLEf1?=
 =?us-ascii?Q?982maZJW3DetcIAgJyHmH6eHX8/dJ8+ZtZpUj3NzcKJ0l4yNNmwqGt83wg4D?=
 =?us-ascii?Q?w+iQnDbKCUtlNASJGvGvddBSIH53OByEVIiEg5skjylCijig3RwYlNIYikMc?=
 =?us-ascii?Q?t1p/tTHYVYyTA93ZRiu9YerZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d1011e-efa0-4307-0db3-08d93567232e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:18:53.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvp6mt48duAWSxdCZUpDP2ealifwydsa5tc4H3Rc0Uq1M+8anEAdIchNDavGvDx2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5727
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this will allow to remove the kvm stubs.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/diag.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index c17a2498a7..8405f69df0 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -20,6 +20,7 @@
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/pv.h"
+#include "sysemu/kvm.h"
 #include "kvm_s390x.h"
=20
 int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
@@ -168,7 +169,7 @@ out:
             return;
         }
=20
-        if (kvm_s390_get_hpage_1m()) {
+        if (kvm_enabled() && kvm_s390_get_hpage_1m()) {
             error_report("Protected VMs can currently not be backed with "
                          "huge pages");
             env->regs[r1 + 1] =3D DIAG_308_RC_INVAL_FOR_PV;
--=20
2.32.0



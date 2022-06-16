Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC454D6C0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 03:08:42 +0200 (CEST)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1e01-0007s3-HS
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 21:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dx6-0005Xv-6L
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:40 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:47772
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dx4-0006AP-6T
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:39 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25FLplPM003593
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=6SE2UytxxoqHLN05KdARAYhWf1xRfEDsja6swOsc3cA=;
 b=CBiMrnuRRyPMzUKbZf2CsmcnN8nCndQvVpnJB4g5BH3xn1RCIJVZR0QZQ/NwyveuTAiA
 OZHKdeg5lbh57cAcazDiFvMywxiWXKqE4DQk9ckCKFTwifjEXOMH1oEEfey1ytSf63lS
 ELWLftzMn2X45dRl7ROyD9jNTXiChkntsYI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3gpr0eht67-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:35 -0700
Received: from twshared18213.14.prn3.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 15 Jun 2022 18:05:33 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 002CB8092C5C; Wed, 15 Jun 2022 18:05:27 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <samuel.thibault@ens-lyon.org>, <jasowang@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH 1/4] slirp: Update submodule to include NC-SI updates
Date: Wed, 15 Jun 2022 18:05:23 -0700
Message-ID: <20220616010526.1895564-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616010526.1895564-1-pdel@fb.com>
References: <20220616010526.1895564-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: G9QwjNmqmS6C6VkWH7lfc3YfBJJZ-9ay
X-Proofpoint-GUID: G9QwjNmqmS6C6VkWH7lfc3YfBJJZ-9ay
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_17,2022-06-15_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7166425211=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There hasn't been a new libslirp release yet, but I don't see any reason
in particular why we couldn't update to this commit to support the new
NC-SI functionality added in !122 and !125, as long as it doesn't break
backwards compatibility with anything.

[1] https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/122
[2] https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/125

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 9d59bb775d..baf336047c 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 9d59bb775d6294c8b447a88512f7bb43f12a25a8
+Subproject commit baf336047c3bb869b3103a6b1b3d8b15e5f1c58d
--=20
2.30.2


